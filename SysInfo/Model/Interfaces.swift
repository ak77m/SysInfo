//
//  Interfaces.swift
//  SysInfo
//
//  Created by ak77m on 12.03.2022.
//

import Foundation

final class Interfaces {
   
static var request = Interfaces()

var ipAdressList: [Host] = []

func getInterfaces()  {   // -> [(name : String, addr: String, mac : String)]
    var tempIpAdressList: [Host] = []
    var nameToMac = [ String: String ]()

    // Get list of all interfaces on the local machine:
    var ifaddr : UnsafeMutablePointer<ifaddrs>?
    guard getifaddrs(&ifaddr) == 0 else { return }
    guard let firstAddr = ifaddr else { return }

    // For each interface ...
    for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
        let flags = Int32(ptr.pointee.ifa_flags)
        if let addr = ptr.pointee.ifa_addr {
            let name = String(cString: ptr.pointee.ifa_name)

            // Check for running IPv4, IPv6 interfaces. Skip the loopback interface.
            if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                switch Int32(addr.pointee.sa_family) {
                case AF_LINK:
                    // Get MAC address from sockaddr_dl structure and store in nameToMac dictionary:
                    addr.withMemoryRebound(to: sockaddr_dl.self, capacity: 1) { dl in
                        dl.withMemoryRebound(to: Int8.self, capacity: 8 + Int(dl.pointee.sdl_nlen + dl.pointee.sdl_alen)) {
                            let lladdr = UnsafeBufferPointer(start: $0 + 8 + Int(dl.pointee.sdl_nlen),
                                                             count: Int(dl.pointee.sdl_alen))
                            if lladdr.count == 6 {
                                nameToMac[name] = lladdr.map { String(format:"%02hhx", $0)}.joined(separator: ":")
                            }
                        }
                    }

                    case AF_INET, AF_INET6:
                        // Convert interface address to a human readable string:
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        if (getnameinfo(addr, socklen_t(addr.pointee.sa_len),
                                        &hostname, socklen_t(hostname.count),
                                        nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                            let address = String(cString: hostname)
                            
                            // Cut additional inform after "%"
                            let index = address.firstIndex(of: "%") ?? address.endIndex
                            let beginning = address[..<index]
                            let newAddress = String(beginning)
                            
                            if Int32(addr.pointee.sa_family) == AF_INET6 { print("test") }
                            
                            tempIpAdressList.append(Host(name: name,
                                                         ipAddress: newAddress,
                                                         mac : "",
                                                         ver: Int32(addr.pointee.sa_family) == AF_INET6 ? "IPv6" : "IPv4"))
                        }
                        
                default:
                    break
                }
            }
        }
    }

    freeifaddrs(ifaddr)

    // Now add the mac address to the tuples:
    for (i, addr) in tempIpAdressList.enumerated() {
        if let mac = nameToMac[addr.name ?? ""] {
            tempIpAdressList[i] = Host(name:addr.name,ipAddress:addr.ipAddress, mac: mac, ver: addr.ver)
        }
    }
    ipAdressList = tempIpAdressList
    return
}

}

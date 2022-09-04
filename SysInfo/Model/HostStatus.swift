//
//  HostStatus.swift
//  SysInfo
//
//  Created by ak77m on 03.09.2022.
//

import Foundation
import Combine

final class HostStatus {
    
    public static let hostStatus = HostStatus()
    
    func getStatus(ipAddress: String, hyperTextProtocol: String = "http") -> String {
        var ipStatus = "" //"IP address not correct"
        let ipAddress = "\(hyperTextProtocol)://\(ipAddress)"
        print ("Полученные адрес это \(ipAddress)")
        guard let url = URL(string: ipAddress) else { return "ipStatus kjhkjhkjhkhkj" }
        // url.checkResourceIsReachable()
        var request = URLRequest(url: url)
        request.httpMethod = "HEAD"
        
        URLSession(configuration: .default)
            .dataTask(with: request) { (_, response, error) -> Void in
                if error != nil  {
                    ipStatus = "Error: \(error?.localizedDescription ?? "")"
                    print("Error")
                }
                
                if (response as? HTTPURLResponse)?
                    .statusCode != 200  {
                    print("down")
                    ipStatus = "IP is offline"
                    
                }
                
                if (response as? HTTPURLResponse)?
                    .statusCode == 200  {
                    ipStatus = "IP is online"
                    print("IP is online")
                }
                
                
            }
            .resume()
        
        return ipStatus
        
    }
    
    
}

class CheckURL : ObservableObject {
    enum URLResult : String {
        case unknown, unreachable, reachable
    }
    
    @Published var urlReachable : URLResult = .unknown
    private var cancellable : AnyCancellable?
    
    func verifyURL(urlPath: String) {
        guard let url = URL(string: urlPath) else {
            assertionFailure("Invalid URL")
            self.urlReachable = .unknown
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "HEAD"
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url).tryMap({ (_ , response: URLResponse) -> URLResult in
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                return .reachable
            } else {
                return .unreachable
            }
        })
        .replaceError(with: .unreachable)
        .receive(on: RunLoop.main).sink { result in
            self.urlReachable = result
        }
    }
}

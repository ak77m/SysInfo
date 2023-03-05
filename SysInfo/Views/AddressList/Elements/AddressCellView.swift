//
//  AddressCellView.swift
//  SysInfo
//
//  Created by ak77m on 12.03.2022.
//

import SwiftUI

// Стиль строки отображения адресов
struct AddressCellView: View {
    let host: Host
    let browser: Bool
    
    var body: some View {
        HStack(spacing: 5.0){
            
            // Статус хоста (по пингу) TODO
            Text(host.status ?? "")  //🟢🔴⚫️
            
            // Отображение названия хоста и адреса
            VStack(alignment: .leading){
                Text("\(host.name)").fontWeight(.bold)
                HStack{
                    Text("\(host.ipAddress) ").font(.caption)
                    Text(" \(host.mac.uppercased())").font(.caption).opacity(0.8)
                }
            }
            Spacer()
            
            // Опции копирования и открытия в браузере
            CopyAndOpenView(activeHost: host, browser: browser)
            
        }
        .contentShape(Rectangle())
    }
    
    
    
}

struct AddressCellView_Previews: PreviewProvider {
    static var previews: some View {
        AddressCellView(host: Host(), browser: true)
    }
}

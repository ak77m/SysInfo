//
//  ViewModifiers.swift
//  SysInfo
//
//  Created by ak77m on 13.03.2022.
//

import SwiftUI

struct MyButtonStyle : ButtonStyle {
    //@State private var showAnimation = true
    
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
            .buttonStyle(.plain)
            
            .rotationEffect(.degrees(configuration.isPressed ? 270 : 0))
            .scaleEffect(configuration.isPressed ? 0 : 1.1 )
            .animation(.easeIn(duration: 3), value: configuration.isPressed )
        
            .padding(5)
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray, lineWidth: 1))
            .contentShape(Rectangle())
            .animation(.linear, value: 5)
    }
}


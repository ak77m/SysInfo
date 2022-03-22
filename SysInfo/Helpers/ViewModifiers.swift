//
//  ViewModifiers.swift
//  SysInfo
//
//  Created by ak77m on 13.03.2022.
//

import SwiftUI
//import AVFoundation

struct MyButtonStyle : ButtonStyle {
    //@State private var showAnimation = true
    
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
            .buttonStyle(.plain)
            .padding(3)
            .contentShape(Rectangle())
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray, lineWidth: 1))
            .background(configuration.isPressed ? Color.red : Color.clear)
            .scaleEffect(configuration.isPressed ? 0.4 : 1.3 )
            .animation(.easeIn(duration: 0.2), value: configuration.isPressed )
            
    }
}


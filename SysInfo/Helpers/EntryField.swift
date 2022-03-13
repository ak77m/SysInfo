//
//  EntryField.swift
//  MyСonfidentialInfo
//
//  Created by ak77m on 25.02.2021.
//  Original idea by Stewart Lynch on 2020-05-08.

import SwiftUI

// Кастомная строка ввода
// Модификаторы добавленны отдельно в файле Extensions

struct EntryField: View {
    
    
    var sfSymbolName: String
    var placeHolder: String
    @Binding var field: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: sfSymbolName)
                    .foregroundColor(.gray)
                    .font(.headline)
                TextField(placeHolder, text: $field)
                    .textFieldStyle(.plain)
            }
            .padding(5)
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(.gray, lineWidth: 1).opacity(0.6))
            
        }
    }
}

struct EntryField_Previews: PreviewProvider {
    static var previews: some View {
        EntryField(sfSymbolName: "note.text", placeHolder: "Название", field: .constant("text"))
    }
}

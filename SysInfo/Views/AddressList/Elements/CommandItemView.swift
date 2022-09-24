//
//  CommandItemView.swift
//  SysInfo
//
//  Created by ak77m on 12.09.2022.
//

import SwiftUI

struct CommandItemView: View {
    @State var apiCommand : String = ""
    var body: some View {
        EntryField(sfSymbolName: "terminal", placeHolder: "Команда POST запроса", field: $apiCommand)
    }
}

struct CommandItemView_Previews: PreviewProvider {
    static var previews: some View {
        CommandItemView()
    }
}

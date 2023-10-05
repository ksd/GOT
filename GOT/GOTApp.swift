//
//  GOTApp.swift
//  GOT
//
//  Created by ksd on 03/10/2023.
//

import SwiftUI

@main
struct GOTApp: App {
    var body: some Scene {
        WindowGroup {
            CharacterListView().environmentObject(CharacterController())
        }
    }
}

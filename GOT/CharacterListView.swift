//
//  CharacterListView.swift
//  GOT
//
//  Created by ksd on 03/10/2023.
//

import SwiftUI

struct CharacterListView: View {
    @EnvironmentObject var characterController: CharacterController
    var body: some View {
        NavigationStack{
            List($characterController.characters){$character in
                CharacterRowView(character: $character)
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Game Of Thrones")
        }
    }
}

#Preview {
    CharacterListView().environmentObject(CharacterController())
}

//
//  CharacterRowView.swift
//  GOT
//
//  Created by ksd on 03/10/2023.
//

import SwiftUI

struct CharacterRowView: View {
    @Binding var character: CharacterModel
    var body: some View {
        HStack{
            AsyncImage(url: character.imageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay {
                        Circle().stroke(.white, lineWidth: 2)
                    }
                    .shadow(radius: 7)
                    .frame(width: 80, height: 80)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading){
                Text(character.fullName).font(.title)
                Text(character.title).font(.subheadline)
            }
        }.padding()
    }
}

#Preview {
    CharacterRowView(character: .constant(CharacterController.demoCharacter))
}

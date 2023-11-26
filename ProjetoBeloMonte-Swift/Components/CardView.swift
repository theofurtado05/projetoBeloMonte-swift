//
//  CardView.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 26/11/23.
//

import SwiftUI

struct CardView: View {
    var destaque: Destaque
    
    var body: some View {
        ZStack {
            // Imagem de fundo
            Image(destaque.img)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200) // Ajuste a altura conforme necessário
                .clipped()

            // Título em cima da imagem
            Text(destaque.titulo)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
        }
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Hoje()
    }
}

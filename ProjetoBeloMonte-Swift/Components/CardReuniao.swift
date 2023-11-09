//
//  CardReuniao.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 09/11/23.
//

import Foundation
import SwiftUI

class CardReuniao{
    var titulo: String
    var hora: String
    var data: Date
    
    init(titulo: String, hora: String, data: Date){
        self.titulo = titulo
        self.hora = hora
        self.data = data
    }
}


struct CardReuniaoView: View{
    var cardReuniao: CardReuniao
    
    var body: some View{
        ZStack{
            //passar os cards da reuniao pra ca
        }
    }
}


struct CardReuniao_previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

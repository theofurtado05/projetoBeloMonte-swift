//
//  HeaderTitle.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 09/11/23.
//

import Foundation
import SwiftUI

class HeaderTitle{
    var title: String
    var goTo: AnyView
    
    init(title: String, goTo: AnyView){
        self.title = title
        self.goTo = goTo
    }
}

struct HeaderTitleView: View{
    var header: HeaderTitle
    
    var body: some View{
        
        HStack{
            NavigationLink(destination: header.goTo) {
                Image(systemName: "chevron.backward")
                    .fontWeight(.semibold)
            }
            Text(header.title)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity, alignment: .leading) 
        .padding(.horizontal)
    }
}


struct HeaderTitleView_previews: PreviewProvider {
    static var previews: some View {
        AdicionarReuniao()
    }
}






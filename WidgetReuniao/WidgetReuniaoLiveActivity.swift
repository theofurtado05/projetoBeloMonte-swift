//
//  WidgetReuniaoLiveActivity.swift
//  WidgetReuniao
//
//  Created by Theo Furtado on 27/11/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
}

func formatDate2(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        return dateFormatter.string(from: date)
}

func extrairHoraDeData(_ data: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: data)
}

struct WidgetReuniaoAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var tituloReuniao: String
        var dataInicio: Date
    }
    
    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WidgetReuniaoLiveActivity: Widget {
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetReuniaoAttributes.self) { context in
            
            // Recuperar valores do UserDefaults compartilhados
            @State var tituloReuniao = UserDefaults(suiteName: "IBMEC.ProjetoBeloMonte-Swift.WidgetReuniao")?.string(forKey: "tituloReuniao") ?? "Nenhuma reunião ativa..."
            @State var dataInicio = UserDefaults(suiteName: "IBMEC.ProjetoBeloMonte-Swift.WidgetReuniao")?.object(forKey: "dataInicio") as? Date ?? Date()
            
        
            
            // Lock screen/banner UI goes here
            VStack(alignment: .leading, spacing: 10) {
                Text(tituloReuniao)
                    HStack {
                        HStack {
                            Image(systemName: "clock")
                            Text(extrairHoraDeData(dataInicio))
                        }.opacity(0.6)
                        HStack {
                            Image(systemName: "calendar")
                            Text(formatDate(dataInicio))
                        }.opacity(0.6)
                        
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("PrimaryColor"))
                    }
            }
            .padding(.leading, 10)
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                                
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.tituloReuniao)")
            } minimal: {
                Text(context.state.tituloReuniao)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WidgetReuniaoAttributes {
    fileprivate static var preview: WidgetReuniaoAttributes {
        WidgetReuniaoAttributes(name: "World")
    }
}

extension WidgetReuniaoAttributes.ContentState {
    fileprivate static var smiley: WidgetReuniaoAttributes.ContentState {
        WidgetReuniaoAttributes.ContentState(
            tituloReuniao: "Apresentação do App",
            dataInicio: Date()
        )
     }
     
}

#Preview("Notification", as: .content, using: WidgetReuniaoAttributes.preview) {
   WidgetReuniaoLiveActivity()
} contentStates: {
    WidgetReuniaoAttributes.ContentState.smiley
}

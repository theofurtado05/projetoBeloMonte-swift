//
//  WidgetReuniao.swift
//  WidgetReuniao
//
//  Created by Theo Furtado on 27/11/23.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct WidgetReuniaoEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        // Recuperar valores do UserDefaults compartilhados
        let tituloReuniao = UserDefaults(suiteName: "IBMEC.ProjetoBeloMonte-Swift.WidgetReuniao")?.string(forKey: "tituloReuniao") ?? "Nenhuma reunião ativa"
        let dataInicio = UserDefaults(suiteName: "IBMEC.ProjetoBeloMonte-Swift.WidgetReuniao")?.object(forKey: "dataInicio") as? Date ?? Date()
        
        
        // Lock screen/banner UI goes here
        VStack(alignment: .center, spacing: 10) {
            Text(tituloReuniao)
                .multilineTextAlignment(.center)
                
            HStack(spacing: 20) {
                    VStack {
                        Image(systemName: "clock")
                        Text(extrairHoraDeData(dataInicio))
                    }.opacity(0.6)
                        
                    VStack {
                        Image(systemName: "calendar")
                        Text(formatDate2(dataInicio))
                            
                    }.opacity(0.6)
                        
                }
        }
        .activityBackgroundTint(Color.cyan)
        .activitySystemActionForegroundColor(Color.black)
        .frame(width: .infinity)
        
    }
}

struct WidgetReuniao: Widget {
    let kind: String = "WidgetReuniao"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WidgetReuniaoEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        return intent
    }
    
    
}

#Preview(as: .systemSmall) {
    WidgetReuniao()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    
}

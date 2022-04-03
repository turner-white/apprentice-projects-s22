//
//  CounterWidget.swift
//  CounterWidget
//
//  Created by Turner White on 3/18/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),dayCount: "10")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), dayCount: "10")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        let entry = SimpleEntry(date: currentDate, dayCount: DaysStore.fetchCalculatedDays())
        entries.append(entry)
        
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let dayCount:String
}

struct CounterWidgetEntryView : View {
    //Provider.Entry is maybe auto found from the provider initializer
    var entry: SimpleEntry

    var body: some View {
        //Need to send string from vm here
        //Comes from entry
        Text("\(entry.dayCount)")
    }
}

@main
struct CounterWidget: Widget {
    let kind: String = "CounterWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CounterWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct CounterWidget_Previews: PreviewProvider {
    static var previews: some View {
        CounterWidgetEntryView(entry: SimpleEntry(date: Date(),dayCount: "5"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

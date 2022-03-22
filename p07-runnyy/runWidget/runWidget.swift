//
//  runWidget.swift
//  runWidget
//
//  Created by Turner White on 3/21/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),milesRan: 10)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),milesRan: 10)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = SimpleEntry(date: Date(), milesRan: MilesRanStore.fetchMiles())
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let milesRan: Double
}

struct runWidgetEntryView : View {
    var entry: SimpleEntry

    var body: some View {
        Text("\(entry.milesRan) mi")
    }
}

@main
struct runWidget: Widget {
    let kind: String = "runWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            runWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct runWidget_Previews: PreviewProvider {
    static var previews: some View {
        runWidgetEntryView(entry: SimpleEntry(date: Date(),milesRan: 10))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

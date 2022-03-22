//
//  CounterWidget.swift
//  CounterWidget
//
//  Created by Turner White on 3/18/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    @ObservedObject var vm: SettingsViewModel

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),dayCount: vm.getNumDays())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), dayCount: vm.getNumDays())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, dayCount: vm.getNumDays())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let dayCount:String
}

struct CounterWidgetEntryView : View {
    //Provider.Entry is maybe auto found from the provider initializer
    var entry: Provider.Entry

    var body: some View {
        //Need to send string from vm here
        //Comes from entry
        Text(entry.dayCount)
    }
}

@main
struct CounterWidget: Widget {
    let kind: String = "CounterWidget"
    var cv: ContentView = ContentView()

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(vm: cv.vm)) { entry in
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

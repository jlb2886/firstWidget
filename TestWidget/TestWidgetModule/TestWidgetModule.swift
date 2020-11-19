//
//  TestWidgetModule.swift
//  TestWidgetModule
//
//  Created by Julianna Baker on 11/19/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    // Placeholder String
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), myString: "...")
    }
    
    //Placeholder String
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), myString: "...")
        completion(entry)
    }
    
    //Main Logic
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            //change time from onr hour to 10 seconds
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset * 10, to: currentDate)!
            //Get Random String From Data Provider
            let entry = SimpleEntry(date: entryDate, myString: MyDataProvider.getRandomString())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let myString: String
}

//What the Widget Looks Like
struct TestWidgetModuleEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            //set background Color
            //Color.black.edgesIgnoringSafeArea(.all)
            
            //background image
            Image(MyDataProvider.getRandomImg())
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            //Display Text
            Text(verbatim: entry.myString)
                .foregroundColor(.black)
                .fontWeight(.heavy)
                .font(.custom("Kade", size: 15))
                .multilineTextAlignment(.leading)
                .padding(.all, 1.0)
        }
    }
}

@main
struct TestWidgetModule: Widget {
    let kind: String = "TestWidgetModule"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TestWidgetModuleEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

//Preview
struct TestWidgetModule_Previews: PreviewProvider {
    static var previews: some View {
        TestWidgetModuleEntryView(entry: SimpleEntry(date: Date(), myString: "Random String"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

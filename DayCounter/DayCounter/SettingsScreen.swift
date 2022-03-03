//
//  SettingsScreen.swift
//  DayCounter
//
//  Created by Turner White on 3/1/22.
//

import SwiftUI

class SettingsScreenModel: ObservableObject {
    @Published var initialDate: Date = Date()
    
    init() {
        initialDate = UserDefaults.standard.object(forKey: "initialDate") as! Date
    }
    
    func save() {
        UserDefaults.standard.set(initialDate, forKey: "initialDate")
    }
    
}

struct SettingsScreen: View {
    @StateObject var vm = SettingsScreenModel()
    //@Binding var date: Date
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: vm.initialDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: vm.initialDate)!
        return min...max
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        DatePicker("Set start date", selection: $vm.initialDate, in: dateRange)
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}

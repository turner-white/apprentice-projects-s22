//
//  SettingsView.swift
//  DayCounter
//
//  Created by Turner White on 3/1/22.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var initialDate: Date = Date()
    @Published var oneSave = false
    
    init() {
        oneSave = UserDefaults.standard.bool(forKey: "oneSave")
        if oneSave {
            initialDate = UserDefaults.standard.object(forKey: "initialDate") as! Date
        } else {
            initialDate = Date()
        }
    }
    
    func save() {
        UserDefaults.standard.set(initialDate, forKey: "initialDate")
        oneSave = true
        UserDefaults.standard.set(oneSave, forKey: "oneSave")
        
    }
    
    func getNumDays() -> String {
        let timeInterval:Double = self.initialDate.timeIntervalSinceNow
        return "\(floor((timeInterval / -3600) / 24))"
    }
}

struct SettingsView: View {
    @ObservedObject var vm: SettingsViewModel
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: vm.initialDate)!
        let max = Calendar.current.date(byAdding: .year, value: 0 ,to: vm.initialDate)!
        return min...max
    }
    
    var body: some View {
        VStack {
            Text("Select a starting date").font(.title)
            DatePicker(selection: $vm.initialDate, displayedComponents: .date) {
                Text("Start Date").bold()
            }.datePickerStyle(.graphical)
            
            Button("Save", action: vm.save)
        }
    }
    
    
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(vm: SettingsViewModel())
    }
}

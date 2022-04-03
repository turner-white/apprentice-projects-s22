//
//  SettingsView.swift
//  DayCounter
//
//  Created by Turner White on 3/1/22.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var vm: DaysViewModel
    
    var body: some View {
        VStack {
            Text("Select a starting date").font(.title)
            DatePicker("Select a starting date", selection: $vm.dateFromPicker, in: ...Date.now,displayedComponents: .date).datePickerStyle(.graphical)
            Button("Save", action: vm.update).font(.title)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(vm: DaysViewModel())
    }
}

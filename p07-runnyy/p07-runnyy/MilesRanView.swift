//
//  MilesRanView.swift
//  p07-runnyy
//
//  Created by Turner White on 3/18/22.
//

import SwiftUI

struct MilesRanView: View {
    @StateObject private var vm = MilesRanViewModel()
    var body: some View {
        VStack {
            Text("\(vm.milesRan)")
            HStack {
                Button {
                    vm.decrement(amount: 0.5)
                } label: {
                    Label("minus", systemImage: "minus")}.disabled(vm.isZeroMile).labelStyle(.iconOnly)
                Button {
                    vm.increment(amount: 0.5)
                } label: {
                    Label("plus", systemImage: "plus").labelStyle(.iconOnly)
                }
            }
        }
        
        
    }
}

struct MilesRanView_Previews: PreviewProvider {
    static var previews: some View {
        MilesRanView()
    }
}

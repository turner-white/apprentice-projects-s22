//
//  TextFieldModifier.swift
//  p05-socialmedia
//
//  Created by Turner White on 2/23/22.
//

import Foundation
import SwiftUI

struct customViewModifier: ViewModifier {
    var roundedCorners: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor,endColor]),startPoint: .topLeading,endPoint: .bottomTrailing))
            .cornerRadius(roundedCorners)
            .foregroundColor(textColor)
        
    }
}

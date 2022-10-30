//
//  BackgroundComponent.swift
//  
//
//  Created by Henrik Christensen  on 29/10/2022.
//

import SwiftUI

struct BackgroundComponent: View {
    private let text: String
    
    private let backgroundColor: Color
    
    private let foregroundColor: Color
    
    private let font: Font
    
    init(_ text: String, backgroundColor: Color, foregroundColor: Color, font: Font) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.font = font
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 16)
                .fill(backgroundColor)
            
            Text(text)
                .font(font)
                .foregroundColor(foregroundColor)
                .frame(maxWidth: .infinity)
        }
    }
}

struct BackgroundComponent_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundComponent("Swipe Button", backgroundColor: .blue.opacity(0.4), foregroundColor: .white, font: .footnote)
    }
}

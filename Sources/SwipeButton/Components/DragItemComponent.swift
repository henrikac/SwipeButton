//
//  DragItemComponent.swift
//  
//
//  Created by Henrik Christensen  on 30/10/2022.
//

import SwiftUI

struct DragItemComponent<Content: View>: View {
    private let content: Content
    
    @Binding var width: CGFloat
    
    private let foregroundColor: Color
    
    init(width: Binding<CGFloat>, foregroundColor: Color = .blue, @ViewBuilder content: () -> Content) {
        _width = width
        self.foregroundColor = foregroundColor
        self.content = content()
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(foregroundColor)
            .frame(width: width)
            .overlay(
                ZStack {
                    content
                },
                alignment: .trailing
            )
    }
}

struct DragItemComponent_Previews: PreviewProvider {
    static var previews: some View {
        DragItemComponent(width: .constant(50)) {
            Image(systemName: "chevron.right")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.blue)
                .frame(width: 42, height: 42)
                .background(RoundedRectangle(cornerRadius: 14).fill(.white))
                .padding(4)
        }
        .frame(height: 50)
    }
}

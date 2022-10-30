//
//  SwipeComponent.swift
//  
//
//  Created by Henrik Christensen  on 30/10/2022.
//

import SwiftUI

struct SwipeComponent: View {
    private let action: () -> Void
    
    private let configuration: SwipeButtonConfiguration
    
    private let text: String
    
    private let type: SwipeButtonType
    
    init(text: String, configuration: SwipeButtonConfiguration, type: SwipeButtonType, action: @escaping () -> Void) {
        self.action = action
        self.configuration = configuration
        self.text = text
        self.type = type
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            BackgroundComponent(
                text,
                backgroundColor: configuration.backgroundColor,
                foregroundColor: configuration.foregroundColor,
                font: configuration.font
            )
            SelectDragComponent()
        }
        .frame(height: configuration.height)
        .padding()
    }
}

extension SwipeComponent {
    @ViewBuilder func SelectDragComponent() -> some View {
        GeometryReader { geo in
            if type == .regular {
                DragComponent(
                    maxWidth: geo.size.width,
                    minWidth: configuration.height,
                    backgroundColor: configuration.dragBackgroundColor,
                    foregroundColor: configuration.dragForegroundColor,
                    action: action
                )
            } else {
                UnlockDragComponent(
                    maxWidth: geo.size.width,
                    minWidth: configuration.height,
                    backgroundColor: configuration.dragBackgroundColor,
                    foregroundColor: configuration.dragForegroundColor,
                    action: action
                )
            }
        }
    }
}

struct SwipeComponent_Previews: PreviewProvider {
    static var previews: some View {
        SwipeComponent(text: "Swipe Component", configuration: SwipeButtonConfiguration(), type: .regular) {
            print("Swiped!")
        }
    }
}

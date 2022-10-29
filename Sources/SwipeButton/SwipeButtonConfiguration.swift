//
//  SwipeButtonConfiguration.swift
//  
//
//  Created by Henrik Christensen  on 29/10/2022.
//

import SwiftUI

/// SwipeButtonConfiguration
public struct SwipeButtonConfiguration {
    /// The height of the SwipeButton.
    public let height: CGFloat
    
    /// The color of the drag component.
    public let dragColor: Color
    
    /// The background color of the SwipeButton. (Default:`dragColor.opacity(0.4)`)
    public let backgroundColor: Color
    
    /// The color of the text inside the SwipeButton. (Default: `Color.white`)
    public let foregroundColor: Color
    
    /// The font style for the text inside the SwipeButton. (Default: `Font.footnote`)
    public let font: Font
    
    /// Whether the SwipeButton should have haptics enabled or not..
    public let enableHaptics: Bool
    
    /// Initializer
    /// - Parameters:
    ///     - height: The height of the SwipeButton.
    ///     - dragColor: The color of the dragComponent.
    ///     - backgroundColor: The background color of the SwipeButton. (Default: `dragColor.opacity(0.4)`)
    ///     - foregroundColor: The color of the text inside the SwipeButton. (Default: `Color.white`)
    ///     - font: The font style for the text inside the SwipeButton. (Default: `Font.footnote`)
    ///     - enableHaptics: Whether the SwipeButton should have haptics enabled or not.
    init(height: CGFloat = 50, dragColor: Color = .blue, backgroundColor: Color? = nil, foregroundColor: Color? = nil, font: Font? = nil, enableHaptics: Bool = false) {
        self.height = height
        self.dragColor = dragColor
        self.backgroundColor = backgroundColor ?? dragColor.opacity(0.4)
        self.foregroundColor = foregroundColor ?? Color.white
        self.font = font ?? Font.footnote
        self.enableHaptics = enableHaptics
    }
}

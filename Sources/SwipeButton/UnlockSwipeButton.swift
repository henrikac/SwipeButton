//
//  UnlockSwipeButton.swift
//  
//
//  Created by Henrik Christensen  on 30/10/2022.
//

import SwiftUI

/// UnlockSwipeButton
public struct UnlockSwipeButton: View {
    private let text: String

    private let action: () -> Void
    
    private let configuration: SwipeButtonConfiguration

    /// Initializer
    /// - Parameters:
    ///     - text: The text displayed in the UnlockSwipeButton.
    ///     - configuration: Configurations to customize the UnlockSwipeButton.
    ///     - action: The action to run on a successfull swipe.
    public init(text: String, configuration: SwipeButtonConfiguration? = nil, action: @escaping () -> Void) {
        self.text = text
        self.configuration = configuration ?? SwipeButtonConfiguration()
        self.action = action
    }
    
    public var body: some View {
        SwipeComponent(
            text: text,
            configuration: configuration,
            type: .locked,
            action: action
        )
    }
}

struct UnlockSwipeButton_Previews: PreviewProvider {
    static var previews: some View {
        UnlockSwipeButton(text: "Unlock Swipe Button", configuration: SwipeButtonConfiguration(dragColor: .red)) {
            print("Success!")
        }
    }
}

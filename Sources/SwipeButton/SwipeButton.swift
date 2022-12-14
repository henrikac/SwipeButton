import SwiftUI

/// SwipeButton
public struct SwipeButton: View {
    private let text: String

    private let action: () -> Void
    
    private let configuration: SwipeButtonConfiguration

    /// Initializer
    /// - Parameters:
    ///     - text: The text displayed in the SwipeButton.
    ///     - configuration: Configurations to customize the SwipeButton.
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
            type: .regular,
            action: action
        )
    }
}

struct SwipeButton_Previews: PreviewProvider {
    static var previews: some View {
        SwipeButton(text: "Swipe Button") {
            print("Success!")
        }
    }
}

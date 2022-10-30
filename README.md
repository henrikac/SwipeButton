# SwipeButton

An easy to use swipe button.

## Requirements

This package is currently only available for `iOS(.v16)`.

## Installation

To install this package import `https://github.com/henrikac/SwipeButton` in SPM.

## Usage

#### Basic usage

```swift
import SwiftUI
import SwipeButton

struct ContentView: View {
    var body: some View {
        SwipeButton(text: "Swipe Button") {
            print("Success!")
        }
        
        UnlockSwipeButton(text: "Unlock Swipe Button") {
            print("Unlocked!")
        }
    }
}
```

#### Configure the swipe button

`SwipeButton` takes a paramter `configuration` that allows you to configure the swipe button.

```swift
SwipeButton(
    text: "Swipe Button",
    configuration: SwipeButtonConfiguration(
        height: 50, // this will also be the width of the drag component
        dragColor: .blue,
        dragBackgroundColor: .white,
        dragForegroundColor: .blue,
        backgroundColor: .blue.opacity(0.4),
        foregroundColor: .white,
        font: .footnote,
        enableHaptics: false
    )
) {
    print("Success!")
}
```

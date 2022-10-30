//
//  UnlockDragComponent.swift
//  
//
//  Created by Henrik Christensen  on 30/10/2022.
//

import SwiftUI

struct UnlockDragComponent: View {
    private let action: () -> Void
    
    private let backgroundColor: Color
    
    private let foregroundColor: Color
    
    private let hapticsEnabled: Bool
    
    private let maxWidth: CGFloat

    private let minWidth: CGFloat

    @State private var width: CGFloat
    
    @State private var isLocked = true
    
    init(maxWidth: CGFloat, minWidth: CGFloat = CGFloat(50), backgroundColor: Color = .white, foregroundColor: Color = .blue, hapticsEnabled: Bool = false, action: @escaping () -> Void) {
        self.maxWidth = maxWidth
        self.minWidth = minWidth
        self.width = minWidth
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.hapticsEnabled = hapticsEnabled
        self.action = action
    }

    var body: some View {
        DragItemComponent(width: $width, foregroundColor: foregroundColor) {
            LockUnlock()
                .font(.system(size: minWidth / 5 * 2, weight: .bold, design: .rounded))
                .foregroundColor(foregroundColor)
                .frame(width: minWidth - 8, height: minWidth - 8)
                .background(RoundedRectangle(cornerRadius: 14).fill(backgroundColor))
                .padding(4)
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    if value.translation.width > 0 {
                        width = min(max(value.translation.width + minWidth, minWidth), maxWidth)
                    }
                }
                .onEnded { _ in
                    if width < maxWidth {
                        width = minWidth
                        
                        if hapticsEnabled {
                            UINotificationFeedbackGenerator().notificationOccurred(.warning)
                        }
                    } else {
                        if hapticsEnabled {
                            UINotificationFeedbackGenerator().notificationOccurred(.success)
                        }
                        withAnimation(.spring().delay(0.5)) {
                            isLocked = false
                            
                            action()
                        }
                    }
                }
        )
        .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0), value: width)
    }
}

extension UnlockDragComponent {
    @ViewBuilder func LockUnlock() -> some View {
        if isLocked {
            Image(systemName: "lock")
        } else {
            Image(systemName: "lock.open")
        }
    }
}

struct UnlockDragComponent_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            UnlockDragComponent(maxWidth: geo.size.width) {
                print("Success!")
            }
        }
        .frame(height: 50)
        .padding()
    }
}

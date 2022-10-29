//
//  DragComponent.swift
//  
//
//  Created by Henrik Christensen  on 29/10/2022.
//

import SwiftUI

struct DragComponent: View {
    private let action: () -> Void
    
    private let hapticsEnabled: Bool
    
    private let maxWidth: CGFloat

    private let minWidth: CGFloat

    @State private var width: CGFloat
    
    init(maxWidth: CGFloat, minWidth: CGFloat = CGFloat(50), hapticsEnabled: Bool = false, action: @escaping () -> Void) {
        self.maxWidth = maxWidth
        self.minWidth = minWidth
        self.width = minWidth
        self.hapticsEnabled = hapticsEnabled
        self.action = action
    }

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(.blue)
            .frame(width: width)
            .overlay(
                ZStack {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.blue)
                        .frame(width: 42, height: 42)
                        .background(RoundedRectangle(cornerRadius: 14).fill(.white))
                        .padding(4)
                },
                alignment: .trailing
            )
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
                            action()
                        }
                    }
            )
            .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0), value: width)
    }
}

struct DragComponent_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            DragComponent(maxWidth: geo.size.width) {
                print("Success!")
            }
        }
        .frame(height: 50)
        .padding()
    }
}

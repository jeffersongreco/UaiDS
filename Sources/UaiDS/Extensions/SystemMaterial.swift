import SwiftUI

public struct Blur: UIViewRepresentable {
    public var style: UIBlurEffect.Style = .systemMaterial
    public func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

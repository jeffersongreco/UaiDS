import SwiftUI

public struct UaiGlassBackground: View {
    public var body: some View {
        ZStack {
            Blur(style: .systemThinMaterial)
            Color.uaiSurfaceGlass
        }
    }
}


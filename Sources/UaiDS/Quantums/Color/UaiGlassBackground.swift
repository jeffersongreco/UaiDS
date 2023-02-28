import SwiftUI

public struct UaiGlassBackground: View {
    
    public init() {}
    
    public var body: some View {
        ZStack {
            Blur(style: .systemThinMaterial)
            Color.uaiSurfaceGlass
        }
    }
}


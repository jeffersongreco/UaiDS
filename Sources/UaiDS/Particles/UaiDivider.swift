import SwiftUI

public struct UaiDivider: View {
    public var body: some View {
        Rectangle()
            .fill(Color.uaiShadeDivider)
            .padding(0)
            .frame(height: Spacing.uaiMicro2)
            .frame(maxWidth: .infinity)
            .padding(0)
    }
}

struct UaiDivider_Previews: PreviewProvider {
    static var previews: some View {
        UaiDivider()
    }
}

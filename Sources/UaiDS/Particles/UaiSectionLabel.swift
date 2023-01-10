import SwiftUI

public struct UaiSectionLabel: View {
    
    var title: String
    var text: String = ""
    
    public var body: some View {
        VStack (alignment: .leading, spacing: Spacing.uaiTiny3) {
            
            Text(title)
                .uaiFont(.headline)
                .foregroundColor(Color.uaiTextPrimary)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if !text.isEmpty {
                Text(text)
                    .uaiFont(.title2)
                    .foregroundColor(Color.uaiTextTertiary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }
        .padding(.top, Spacing.uaiTiny)
        .padding(.bottom, Spacing.uaiLarge3)
        .padding(.horizontal, Spacing.uaiMedium3)

    }
}

struct UaiSectionLabel_Previews: PreviewProvider {
    static var previews: some View {
        UaiSectionLabel(title: "Recados para você", text: "Avisos importantes e dicas úteis")
    }
}

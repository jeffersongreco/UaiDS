import SwiftUI

public struct UaiSectionLabel: View {
    
    var title: String
    var text: String = ""
    
    public init(title: String, text: String) {
        self.title = title
        self.text = text
    }
    
    public var body: some View {
        VStack (alignment: .leading, spacing: Spacing.uaiTiny3) {
            
            Text(title)
                .uaiFont(.headline)
                .foregroundColor(Color.uaiHeading)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if !text.isEmpty {
                Text(text)
                    .uaiFont(.title2)
                    .foregroundColor(Color.uaiSubduedHeading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }
        .padding(.top, Spacing.uaiMedium4)
        .padding(.bottom, Spacing.uaiLarge)
        .padding(.leading, Spacing.uaiMedium3)
        .padding(.trailing, Spacing.uaiLarge)

    }
}

struct UaiSectionLabel_Previews: PreviewProvider {
    static var previews: some View {
        UaiSectionLabel(title: "Recados para você", text: "Avisos importantes e dicas úteis")
    }
}

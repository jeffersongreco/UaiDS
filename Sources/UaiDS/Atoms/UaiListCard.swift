import SwiftUI

public struct UaiListCard: View {
    
    var title: String
    var text: String
    var thumb: String
    var badgeIcon: String
    var badgeText: String
    var button: () -> Void
    
    public init(title: String, text: String, thumb: String, badgeIcon: String, badgeText: String, button: @escaping () -> Void) {
        self.title = title
        self.text = text
        self.thumb = thumb
        self.badgeIcon = badgeIcon
        self.badgeText = badgeText
        self.button = button
    }
    
    public var body: some View {
        HStack (spacing: 0) {
            ZStack {
                Image(thumb).resizable().aspectRatio(contentMode: .fill)
            }
            .frame(width: (UIScreen.screenWidth - Spacing.uaiMedium3 * 2 - Spacing.uaiSmall2 * 3) / 4, height: (UIScreen.screenWidth - Spacing.uaiMedium3 * 2 - Spacing.uaiSmall2 * 3) / 4)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.uaiShadeStroke, lineWidth: 1))
            .padding(14)
            
            VStack (alignment: .leading, spacing: 8) {
                VStack (alignment: .leading, spacing: 2) {
                    Text(title)
                        .uaiFont(.footnote, color: .uaiHeading)
                    Text(text)
                        .uaiFont(.caption, color: .uaiSubduedText)
                }
                
                UaiBadge(icon: badgeIcon, label: badgeText)
            }
            .padding(.vertical, 14)
            
            Spacer()
            
            VStack {
                UaiButton(text: "Ver mais", style: .textHidden, icon: "chevron.forward", size: .regular, variant: .secondary, action: button)
            }
            .padding(18)
        }
        .frame(maxWidth: .infinity)
        .background(Color.uaiSurfaceLevel2)
        .clipShape(RoundedRectangle(cornerRadius: 28))
    }
}

struct UaiListCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            UaiListCard(title: "Comprar em casa", text: "Peça e receba sem sair de casa, em minutos.", thumb: "", badgeIcon: "circle", badgeText: "Entrega", button: { print("click") })
        }
        .padding(28)
    }
}

import SwiftUI

struct Notification: View {
    
    var title: String
    var text: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            HStack (spacing: Spacing.uaiSmall2) {
                VStack (alignment: .leading) {
                    Text(title)
                        .uaiFont(.headline)
                        .foregroundColor(Color.uaiTextPrimary)
                        .lineLimit(1)
                    Text(text)
                        .uaiFont(.subhead)
                        .foregroundColor(Color.uaiTextPrimary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
                
                ZStack (alignment: .bottomTrailing) {
                    UaiThumbnail()
                    UaiBadge(label: "Aviso", role: .alert)
                        .padding(.trailing, Spacing.uaiTiny2 * -1)
                        .padding(.bottom, Spacing.uaiTiny2 * -1)
                }
                .frame(width: Spacing.uaiLarge3, height: Spacing.uaiLarge3)
            }
            .padding(.horizontal, Spacing.uaiMedium)
            .padding(.vertical, Spacing.uaiSmall2)
            
            UaiDivider()
            
            HStack {
                HStack {
                    UaiButtonSmall(icon: "chevron.forward", label: "Registrar") {
                        print("click")
                    }
                }
                Spacer()
                UaiButtonSmall(rank: .terciary, icon: "xmark") {
                    print("click")
                }
            }
            .padding(.horizontal, Spacing.uaiMedium)
            .padding(.vertical, Spacing.uaiSmall2)
        }
        .frame(maxWidth: .infinity)
        .background {
            Blur(style: .systemThinMaterial)
            Color.uaiFillTerciary
        }
        .clipShape(RoundedRectangle(cornerRadius: Spacing.uaiMedium))
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification(title: "Noite de sono", text: "Registre agora, antes que esqueça")
    }
}

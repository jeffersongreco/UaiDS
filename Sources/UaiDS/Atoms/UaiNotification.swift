import SwiftUI

public struct UaiNotification: View {
    
    var title: String
    var text: String
    var image: String = ""
    var imageWide: Bool = false
    
    enum Role {
        case regular, alert, warning
    }
    var role: Role?
    
    var badge: String = ""
    var badgeIcon: String = ""
    
    var actionEmphasis: Bool = false
    
    var actionLabel: String
    var actionIcon: String
    var actionAction: () -> Void
    
    var action2Label: String = ""
    var action2Icon: String = ""
    var action2Action = {print("click")}
    
    var dismissable: Bool = false
    
    
    public var NotificationBadge: some View {
        Group {
            if badgeIcon.isEmpty {
                UaiBadge(label: badge)
                    .padding(.trailing, Spacing.uaiTiny2 * -1)
                    .padding(.bottom, Spacing.uaiTiny2 * -1)
            } else {
                UaiBadge(icon: badgeIcon, label: badge)
                    .padding(.trailing, Spacing.uaiTiny2 * -1)
                    .padding(.bottom, Spacing.uaiTiny2 * -1)
            }
        }
    }
    
    public var NotificationBadgeAlert: some View {
        Group {
            if badgeIcon.isEmpty {
                return UaiBadge(label: badge, role: .alert)
                    .padding(.trailing, Spacing.uaiTiny2 * -1)
                    .padding(.bottom, Spacing.uaiTiny2 * -1)
            } else {
                return UaiBadge(icon: badgeIcon, label: badge, role: .alert)
                    .padding(.trailing, Spacing.uaiTiny2 * -1)
                    .padding(.bottom, Spacing.uaiTiny2 * -1)
            }
        }
    }
    
    public var NotificationBadgeWarning: some View {
        Group {
            if badgeIcon.isEmpty {
                return UaiBadge(label: badge, role: .warning)
                    .padding(.trailing, Spacing.uaiTiny2 * -1)
                    .padding(.bottom, Spacing.uaiTiny2 * -1)
            } else {
                return UaiBadge(icon: badgeIcon, label: badge, role: .alert)
                    .padding(.trailing, Spacing.uaiTiny2 * -1)
                    .padding(.bottom, Spacing.uaiTiny2 * -1)
            }
        }
    }
    
    
    public var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            HStack {
                VStack (alignment: .leading, spacing: Spacing.uaiTiny3) {
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
                
                Spacer(minLength: Spacing.uaiSmall2)
                
                ZStack (alignment: .bottomTrailing) {
                    if imageWide == false {
                        UaiThumbnail(image: image)
                    } else {
                        UaiThumbnail(ratio: .wide, image: image)
                    }
                    
                    if !badge.isEmpty {
                        switch role {
                        case .regular:
                            AnyView(NotificationBadge)
                        case .alert:
                            AnyView(NotificationBadgeAlert)
                        case .warning:
                            AnyView(NotificationBadgeWarning)
                        default:
                            AnyView(NotificationBadge)
                        }
                    }
                }
            }
            .padding(.horizontal, Spacing.uaiMedium)
            .padding(.vertical, Spacing.uaiSmall2)
            
            UaiDivider()
            
            HStack {
                if !action2Label.isEmpty && !action2Icon.isEmpty {
                    HStack {
                        actionEmphasis == false ?
                        UaiButtonSmall(rank: .secondary, icon: actionIcon, label: actionLabel, action: actionAction) :
                        UaiButtonSmall(rank: .primary, icon: actionIcon, label: actionLabel, action: actionAction)
                        
                        actionEmphasis == false ?
                        UaiButtonSmall(rank: .terciary, icon: action2Icon, label: action2Label, action: action2Action) :
                        UaiButtonSmall(rank: .secondary, icon: action2Icon, label: action2Label, action: action2Action)
                    }
                } else {
                    actionEmphasis == false ?
                    UaiButtonSmall(rank: .secondary, icon: actionIcon, label: actionLabel, action: actionAction) :
                    UaiButtonSmall(rank: .primary, icon: actionIcon, label: actionLabel, action: actionAction)
                }
                
                Spacer()
                
                if dismissable == false {
                    UaiButtonSmall(rank: .terciary, icon: "xmark") {
                        print("click")
                    }
                }
            }
            .padding(.horizontal, Spacing.uaiMedium)
            .padding(.vertical, Spacing.uaiSmall2)
        }
        .frame(maxWidth: .infinity)
        .background {
            Blur(style: .systemThinMaterial)
            //RoundedRectangle(cornerRadius: Spacing.uaiMedium).stroke(Color.uaiFillTerciary, lineWidth: Spacing.uaiMicro)
        }
        .clipShape(RoundedRectangle(cornerRadius: Spacing.uaiMedium))
    }
}

struct UaiNotification_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            UaiNotification(title: "Novo artigo", text: "Para não esquecer de se monitorar", imageWide: true, badge: "Dica", badgeIcon: "star.bubble.fill", actionEmphasis: false, actionLabel: "Aprender", actionIcon: "chevron.forward", actionAction: {print("click")}, action2Label: "Relembrar depois", action2Icon: "bell", action2Action: {print("click")})
        }
        .padding(Spacing.uaiSmall3)
    }
}

import SwiftUI

struct UaiButtonSmall: View {
    
    @Environment(\.isEnabled) var isEnabled: Bool
    
    enum Rank {
        case secondary, terciary, quaternary
    }

    var rank: Rank?
    var icon: String
    var label: String = ""
    var action: () -> Void
    
    
    public var BaseButton: some View {
        Group {
            if !label.isEmpty {
                
                Button(action: action, label: {
                    
                    HStack (alignment: .center, spacing: Spacing.uaiTiny2) {
                        
                        Label(label, systemImage: icon).labelStyle(.titleOnly)
                            .uaiFont(.button2)
                        Label(label, systemImage: icon).labelStyle(.iconOnly)
                            .uaiFont(.button2).imageScale(.small)
                        
                    }
                    .padding(.leading, Spacing.uaiSmall2)
                    .padding(.trailing, Spacing.uaiSmall4)
                    .frame(height: Spacing.uaiMedium3)
                    
                })
                
            } else {
                
                Button(action: action, label: {
                    
                    ZStack (alignment: .center) {
                        
                        Label(label, systemImage: icon).labelStyle(.titleOnly)
                            .uaiFont(.button2)
                        Label(label, systemImage: icon).labelStyle(.iconOnly)
                            .uaiFont(.button2).imageScale(.small)
                        
                    }
                    .frame(width: Spacing.uaiMedium3, height: Spacing.uaiMedium3)
                    
                })
 
            }
        }
    }
    
    public var BaseButtonPrimary: some View {
        BaseButton
            .background(isEnabled ? Color.uaiNeutral90 : Color.uaiFillTerciary)
            .foregroundColor(isEnabled ? Color.uaiTextPrimaryDark : Color.uaiTextQuaternary)
            .clipShape(Capsule())
    }
    
    public var BaseButtonSecondary: some View {
        BaseButton
            .background(Capsule().stroke(lineWidth: Spacing.uaiMicro1))
            .foregroundColor(isEnabled ? Color.uaiTextPrimary : Color.uaiTextQuaternary)
            .clipShape(Capsule())
    }
    
    public var BaseButtonTertiary: some View {
        BaseButton
            .foregroundColor(isEnabled ? Color.uaiTextPrimary : Color.uaiTextQuaternary)
            .background(Capsule().stroke(lineWidth: Spacing.uaiMicro1).foregroundColor(isEnabled ? Color.uaiFillPrimary : Color.uaiFillTerciary))
            .clipShape(Capsule())
    }
    
    public var BaseButtonQuaternary: some View {
        BaseButton
            .foregroundColor(isEnabled ? Color.uaiTextPrimary : Color.uaiTextQuaternary)
    }
    
    var body: some View {
        
        switch rank {
        case .secondary:
            return AnyView(BaseButtonSecondary)
        case .terciary:
            return AnyView(BaseButtonTertiary)
        case .quaternary:
            return AnyView(BaseButtonQuaternary)
        default:
            return AnyView(BaseButtonPrimary)
        }


    }
}

struct UaiButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                UaiButtonSmall(icon: "circle", label: "Label", action: { print("click") })
                UaiButtonSmall(icon: "circle", action: { print("click") })
            }
            HStack {
                UaiButtonSmall(icon: "circle", label: "Label", action: { print("click") }).disabled(true)
                UaiButtonSmall(icon: "circle", action: { print("click") }).disabled(true)
            }
            HStack {
                UaiButtonSmall(rank: .secondary, icon: "circle", label: "Label", action: { print("click") })
                UaiButtonSmall(rank: .secondary, icon: "circle", action: { print("click") })
            }
            HStack {
                UaiButtonSmall(rank: .secondary, icon: "circle", label: "Label", action: { print("click") }).disabled(true)
                UaiButtonSmall(rank: .secondary, icon: "circle", action: { print("click") }).disabled(true)
            }
            HStack {
                UaiButtonSmall(rank: .terciary, icon: "circle", label: "Label", action: { print("click") })
                UaiButtonSmall(rank: .terciary, icon: "circle", action: { print("click") })
            }
            HStack {
                UaiButtonSmall(rank: .terciary, icon: "circle", label: "Label", action: { print("click") }).disabled(true)
                UaiButtonSmall(rank: .terciary, icon: "circle", action: { print("click") }).disabled(true)
            }
            HStack {
                UaiButtonSmall(rank: .quaternary, icon: "circle", label: "Label", action: { print("click") })
                UaiButtonSmall(rank: .quaternary, icon: "circle", action: { print("click") })
            }
            HStack {
                UaiButtonSmall(rank: .quaternary, icon: "circle", label: "Label", action: { print("click") }).disabled(true)
                UaiButtonSmall(rank: .quaternary, icon: "circle", action: { print("click") }).disabled(true)
            }
        }
    }
}

import SwiftUI

public struct UaiBadge: View {
    
    enum Role {
        case regular, alert, warning
    }
    
    var icon: String = ""
    var label: String
    var role: Role?
    
    public var BaseBadge: some View {
        Group {
            if icon.isEmpty {
                
                HStack (spacing: Spacing.uaiTiny4) {
                    
                    Text(label)
                    
                }
                .uaiFont(.caption)
                .padding(.horizontal, Spacing.uaiTiny2)
                .frame(height: Spacing.uaiSmall)
                
            }
            
            else {
                
                HStack (spacing: Spacing.uaiTiny4) {
                    
                    Label("icon", systemImage: icon).labelStyle(.iconOnly)
                    Text(label)
                    
                }
                .uaiFont(.caption)
                .padding(.leading, Spacing.uaiTiny3)
                .padding(.trailing, Spacing.uaiTiny2)
                .frame(height: Spacing.uaiSmall)
                
            }
            
        }
    }
    
    public var BadgeRegular: some View {
        
        BaseBadge
            .foregroundColor(Color.uaiAccent70)
            .background(Color.uaiAccent20)
            .clipShape(Capsule())
        
    }
    
    public var BadgeAlert: some View {
        
        BaseBadge
            .foregroundColor(Color.uaiAlert10)
            .background(Color.uaiAlert60)
            .clipShape(Capsule())
        
    }
    
    public var BadgeWarning: some View {
        
        BaseBadge
            .foregroundColor(Color.uaiWarning10)
            .background(Color.uaiWarning60)
            .clipShape(Capsule())
        
    }
    
    public var body: some View {
        switch role {
        case .regular:
            return AnyView(BadgeRegular)
        case .alert:
            return AnyView(BadgeAlert)
        case .warning:
            return AnyView(BadgeWarning)
        default:
            return AnyView(BadgeRegular)
        }
    }
    
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                UaiBadge(icon:  "circle.fill",label: "Label")
                UaiBadge(label: "Label", role: .alert)
                UaiBadge(label: "Label", role: .warning)
            }
            .padding()
        }
    }
}

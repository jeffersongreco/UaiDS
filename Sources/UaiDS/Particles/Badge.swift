import SwiftUI

public struct Badge: View {
    
    enum Role {
        case regular, alert, warning
    }
    
    var icon: String = ""
    var label: String = ""
    var role: Role?
    
    fileprivate func BaseBadge() -> some View {
        Group {
            if !icon.isEmpty && !label.isEmpty {
                
                HStack (spacing: Spacing.uaiTiny4) {
                    
                    Label("icon", systemImage: icon).labelStyle(.iconOnly)
                    Text(label)
                    
                }
                .uaiFont(.caption)
                .padding(.leading, Spacing.uaiTiny3)
                .padding(.trailing, Spacing.uaiTiny2)
                .frame(height: Spacing.uaiSmall1)
                
            }
            
            if icon.isEmpty {
                
                Text(label)
                    .uaiFont(.caption)
                    .padding(.horizontal, Spacing.uaiTiny2)
                    .frame(height: Spacing.uaiSmall1)
                
            }
            
            if label.isEmpty {
                
                Label("icon", systemImage: icon).labelStyle(.iconOnly)
                    .uaiFont(.caption)
                    .frame(width: Spacing.uaiSmall1, height: Spacing.uaiSmall1)
                
            }
        }
    }
    
    fileprivate func BadgeRegular() -> some View {
        
        BaseBadge()
            .foregroundColor(Color.uaiAccent70)
            .background(Color.uaiAccent20)
            .clipShape(Capsule())
        
    }
    
    fileprivate func BadgeAlert() -> some View {
        
        BaseBadge()
            .foregroundColor(Color.uaiAlert10)
            .background(Color.uaiAlert60)
            .clipShape(Capsule())
        
    }
    
    fileprivate func BadgeWarning() -> some View {
        
        BaseBadge()
            .foregroundColor(Color.uaiWarning10)
            .background(Color.uaiWarning60)
            .clipShape(Capsule())
        
    }
    
    public var body: some View {
        switch role {
        case .regular:
            return AnyView(BadgeRegular())
        case .alert:
            return AnyView(BadgeAlert())
        case .warning:
            return AnyView(BadgeWarning())
        default:
            return AnyView(BadgeRegular())
        }
    }
    
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                Badge(icon: "circle.fill", label: "Label")
                Badge(icon: "circle.fill", label: "Label", role: .alert)
                Badge(icon: "circle.fill", label: "Label", role: .warning)
            }
            .padding()
        }
    }
}

import SwiftUI

public struct UaiButton: View {
    
    public enum Style {
        case regular, iconHidden, textHidden
    }
    
    public enum Size {
        case small, regular, big
    }
    
    public enum Variant {
        case accent, primary, secondary, glass
    }
    
    public var text: String
    public var style: Style
    public var icon: String?
    public var size: Size
    public var variant: Variant?
    public var action: () -> Void
    
    public init(text: String, style: Style, icon: String? = nil, size: Size, variant: Variant? = nil, action: @escaping () -> Void) {
        self.text = text
        self.style = style
        self.icon = icon
        self.size = size
        self.variant = variant
        self.action = action
    }
    
    
    
    //MARK: Label - Size, Style
    
    ///Small styles
    
    public var LabelSmallRegular: some View {
        Group {
            Button(action: action) {
                HStack (alignment: .center, spacing: Spacing.uaiTiny2) {
                    Label(text, systemImage: icon!).labelStyle(.titleOnly)
                        .uaiFont(.button3)
                    Label(text, systemImage: icon!).labelStyle(.iconOnly)
                        .uaiFont(.button3).imageScale(.small)
                }
                .padding(.leading, Spacing.uaiSmall2)
                .padding(.trailing, Spacing.uaiSmall4)
                .frame(height: Spacing.uaiMedium3)
            }
        }
    }
    
    public var LabelSmallIconHidden: some View {
        Group {
            Button(action: action) {
                HStack (alignment: .center) {
                    Label(text, systemImage: icon!).labelStyle(.titleOnly)
                        .uaiFont(.button3)
                }
                .padding(.leading, Spacing.uaiSmall2)
                .padding(.trailing, Spacing.uaiSmall2)
                .frame(height: Spacing.uaiMedium3)
            }
        }
    }
    
    public var LabelSmallTextHidden: some View {
        Group {
            Button(action: action) {
                HStack (alignment: .center) {
                    Label(text, systemImage: icon!).labelStyle(.iconOnly)
                        .uaiFont(.button3).imageScale(.small)
                }
                .frame(width: Spacing.uaiMedium3, height: Spacing.uaiMedium3)
            }
        }
    }
    
    //Small
    
    public var LabelSmall: some View {
        switch style {
        case .regular:
            return AnyView(LabelSmallRegular)
        case .iconHidden:
            return AnyView(LabelSmallIconHidden)
        case .textHidden:
            return AnyView(LabelSmallTextHidden)
        }
    }
    
    
    ///Regular styles
    
    public var LabelRegularRegular: some View {
        Group {
            Button(action: action) {
                HStack (alignment: .center, spacing: Spacing.uaiTiny2) {
                    Label(text, systemImage: icon!).labelStyle(.titleOnly)
                        .uaiFont(.button2)
                    Label(text, systemImage: icon!).labelStyle(.iconOnly)
                        .uaiFont(.button2).imageScale(.small)
                }
                .padding(.leading, Spacing.uaiSmall)
                .padding(.trailing, Spacing.uaiSmall2)
                .frame(height: Spacing.uaiMedium4)
            }
        }
    }
    
    public var LabelRegularIconHidden: some View {
        Group {
            Button(action: action) {
                HStack (alignment: .center) {
                    Label(text, systemImage: icon!).labelStyle(.titleOnly)
                        .uaiFont(.button2)
                }
                .padding(.leading, Spacing.uaiSmall)
                .padding(.trailing, Spacing.uaiSmall)
                .frame(height: Spacing.uaiMedium4)
            }
        }
    }
    
    public var LabelRegularTextHidden: some View {
        Group {
            Button(action: action) {
                HStack (alignment: .center) {
                    Label(text, systemImage: icon!).labelStyle(.iconOnly)
                        .uaiFont(.button2).imageScale(.small)
                }
                .frame(width: Spacing.uaiMedium4, height: Spacing.uaiMedium4)
            }
        }
    }
    
    //Regular
    
    public var LabelRegular: some View {
        switch style {
        case .regular:
            return AnyView(LabelRegularRegular)
        case .iconHidden:
            return AnyView(LabelRegularIconHidden)
        case .textHidden:
            return AnyView(LabelRegularTextHidden)
        }
    }
    
    ///Big styles
    
    public var LabelBigRegular: some View {
        Group {
            Button(action: action) {
                HStack (alignment: .center, spacing: Spacing.uaiTiny2) {
                    Label(text, systemImage: icon!).labelStyle(.titleOnly)
                        .uaiFont(.button)
                    Label(text, systemImage: icon!).labelStyle(.iconOnly)
                        .uaiFont(.button).imageScale(.small)
                }
                .padding(.leading, Spacing.uaiMedium2)
                .padding(.trailing, Spacing.uaiMedium)
                .frame(height: Spacing.uaiLarge2)
            }
        }
    }
    
    public var LabelBigIconHidden: some View {
        Group {
            Button(action: action) {
                HStack (alignment: .center) {
                    Label(text, systemImage: icon!).labelStyle(.titleOnly)
                        .uaiFont(.button)
                }
                .padding(.leading, Spacing.uaiMedium2)
                .padding(.trailing, Spacing.uaiMedium2)
                .frame(height: Spacing.uaiLarge2)
            }
        }
    }
    
    public var LabelBigTextHidden: some View {
        Group {
            Button(action: action) {
                HStack (alignment: .center) {
                    Label(text, systemImage: icon!).labelStyle(.iconOnly)
                        .uaiFont(.button).imageScale(.small)
                }
                .frame(width: Spacing.uaiLarge2, height: Spacing.uaiLarge2)
            }
        }
    }
    
    //Big
    
    public var LabelBig: some View {
        switch style {
        case .regular:
            return AnyView(LabelBigRegular)
        case .iconHidden:
            return AnyView(LabelBigIconHidden)
        case .textHidden:
            return AnyView(LabelBigTextHidden)
        }
    }
    
    //Size
    
    public var ButtonLabel: some View {
        switch size {
        case .small:
            return AnyView(LabelSmall)
        case .regular:
            return AnyView(LabelRegular)
        case .big:
            return AnyView(LabelBig)
        }
    }
    
    
    
    //MARK: Variant
    
    //Accent
    
    public var ButtonAccent: some View {
        Group {
            ButtonLabel
                .foregroundColor(Color.uaiHeadingWhite)
                .background(Color.uaiSurfaceAccent)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(Color.uaiShadeStroke)
                )
        }
    }
    
    public var ButtonPrimary: some View {
        Group {
            ButtonLabel
                .foregroundColor(Color.uaiHeadingWhite)
                .background(Color.uaiSurfacePrimary)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(Color.uaiShadeStroke)
                )
        }
    }
    
    public var ButtonSecondary: some View {
        Group {
            ButtonLabel
                .foregroundColor(Color.uaiHeading)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(Color.uaiShadeStroke, lineWidth: Spacing.uaiMicro)
                )
        }
    }
    
    public var ButtonGlass: some View {
        Group {
            ButtonLabel
                .foregroundColor(Color.uaiHeading)
                .background(
                    ZStack {
                        Blur(style: .systemUltraThinMaterial)
                        Color.uaiSurfaceGlass
                    }
                )
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(Color.uaiShadeStroke, lineWidth: Spacing.uaiMicro)
                )
        }
    }
    
    
    //MARK: Button
    
    public var body: some View {
        switch variant {
        case .accent:
            return AnyView(ButtonAccent)
        case .primary:
            return AnyView(ButtonPrimary)
        case .secondary:
            return AnyView(ButtonSecondary)
        case .glass:
            return AnyView(ButtonGlass)
        default:
            return AnyView(ButtonSecondary)
        }
    }
}



struct UaiButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            UaiButton(text: "Text", style: .regular, icon: "circle", size: .regular, variant: .accent, action: { print("click") })
            UaiButton(text: "Text", style: .regular, icon: "circle", size: .regular, variant: .primary, action: { print("click") })
            UaiButton(text: "Text", style: .regular, icon: "circle", size: .regular, variant: .secondary, action: { print("click") })
            UaiButton(text: "Text", style: .regular, icon: "circle", size: .regular, variant: .glass, action: { print("click") })
        }
    }
}

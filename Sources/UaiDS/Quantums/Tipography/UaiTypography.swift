import SwiftUI

public struct UaiFont: ViewModifier {
    
    public enum Style {
        
        /// Title
        case hugeTitle, largeTitle, title, title2, title3
        
        /// Headline
        case headline, subhead
        
        /// Body
        case quote, body, footnote
        
        /// Caption
        case caption
        
        /// Button
        case button, button2
    }
    
    public var style: Style
    
    public func body(content: Content) -> some View {
        
        switch style {
            
        case .hugeTitle: return content
                .font(Font.custom("Inter-SemiBold", size: 42, relativeTo: .largeTitle)).lineSpacing((48 - 42) / 2)
        case .largeTitle: return content
                .font(Font.custom("Inter-SemiBold", size: 36, relativeTo: .largeTitle)).lineSpacing((42 - 36) / 2)
        case .title: return content
                .font(Font.custom("Inter-Medium", size: 28, relativeTo: .title)).lineSpacing((34 - 28) / 2)
        case .title2: return content
                .font(Font.custom("Inter-Medium", size: 24, relativeTo: .title2)).lineSpacing((28 - 24) / 2)
        case .title3: return content
                .font(Font.custom("Inter-Medium", size: 20, relativeTo: .title3)).lineSpacing((24 - 20) / 2)
        case .headline: return content
                .font(Font.custom("Inter-Medium", size: 18, relativeTo: .headline)).lineSpacing((22 - 18) / 2)
        case .subhead: return content
                .font(Font.custom("Inter-Regular", size: 14, relativeTo: .subheadline)).lineSpacing((20 - 14) / 2)
        case .quote: return content
                .font(Font.custom("Inter-Regular", size: 18, relativeTo: .headline)).lineSpacing((22 - 18) / 2)
        case .body: return content
                .font(Font.custom("Inter-Regular", size: 14, relativeTo: .body)).lineSpacing((20 - 14) / 2)
        case .footnote: return content
                .font(Font.custom("Inter-Regular", size: 12, relativeTo: .footnote)).lineSpacing((16 - 12) / 2)
        case .caption: return content
                .font(Font.custom("Inter-Regular", size: 10, relativeTo: .caption2)).lineSpacing(0)
        case .button: return content
                .font(Font.custom("Inter-Medium", size: 14, relativeTo: .subheadline)).lineSpacing(0)
        case .button2: return content
                .font(Font.custom("Inter-Medium", size: 12, relativeTo: .footnote)).lineSpacing(0)
            
        }
        
    }
    
}

public extension View {
    func uaiFont(_ style: UaiFont.Style) -> some View {
        self
            .modifier(UaiFont(style: style))
    }
    
    func uaiFont(_ style: UaiFont.Style, color: Color) -> some View {
        self
            .modifier(UaiFont(style: style))
            .foregroundColor(color)
    }
}

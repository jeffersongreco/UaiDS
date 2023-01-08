import SwiftUI

public struct UaiFont: ViewModifier {
    
    public enum Style {
        
        /// Title
        case hugeTitle, largeTitle, title1, title2, title3
        
        /// Headline
        case headline, subhead
        
        /// Body
        case quote, body, footnote
        
        /// Caption
        case caption
        
        /// Button
        case button1, button2
    }
    
    public var style: Style
    
    public func body(content: Content) -> some View {
        
        switch style {
            
        case .hugeTitle: return content
                .font(Font.custom("Inter-SemiBold", size: 42)).lineSpacing((48 - 42) / 2)
            
        case .largeTitle: return content
                .font(Font.custom("Inter-SemiBold", size: 36)).lineSpacing((42 - 36) / 2)
            
        case .title1: return content
                .font(Font.custom("Inter-Medium", size: 28)).lineSpacing((34 - 28) / 2)
        case .title2: return content
                .font(Font.custom("Inter-Medium", size: 24)).lineSpacing((28 - 24) / 2)
        case .title3: return content
                .font(Font.custom("Inter-Medium", size: 20)).lineSpacing((24 - 20) / 2)
        case .headline: return content
                .font(Font.custom("Inter-Medium", size: 18)).lineSpacing((22 - 18) / 2)
        case .subhead: return content
                .font(Font.custom("Inter-Regular", size: 14)).lineSpacing((20 - 14) / 2)
        case .quote: return content
                .font(Font.custom("Inter-Regular", size: 18)).lineSpacing((22 - 18) / 2)
        case .body: return content
                .font(Font.custom("Inter-Regular", size: 14)).lineSpacing((20 - 14) / 2)
        case .footnote: return content
                .font(Font.custom("Inter-Regular", size: 12)).lineSpacing((16 - 12) / 2)
        case .caption: return content
                .font(Font.custom("Inter-Regular", size: 10)).lineSpacing(0)
        case .button1: return content
                .font(Font.custom("Inter-Medium", size: 14)).lineSpacing(0)
        case .button2: return content
                .font(Font.custom("Inter-Medium", size: 12)).lineSpacing(0)
            
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

import SwiftUI

struct Thumbnail: View {
    
    enum Ratio {
        case wide
    }
    
    var ratio: Ratio?
    var image: String = ""
    
    public func BaseThumbnailSquare() -> some View {
        return Group {
            if image.isEmpty {
                Image.uaiPlaceholderThumb
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: Spacing.uaiLarge3, height: Spacing.uaiLarge3)
                    .clipShape(RoundedRectangle(cornerRadius: Spacing.uaiSmall2))
            } else {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: Spacing.uaiLarge3, height: Spacing.uaiLarge3)
                    .clipShape(RoundedRectangle(cornerRadius: Spacing.uaiSmall2))
            }
        }
    }
    
    public func BaseThumbnailWide() -> some View {
        return Group {
            if image.isEmpty {
                Image.uaiPlaceholderThumb
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: Spacing.uaiHuge2, height: Spacing.uaiLarge3)
                    .clipShape(RoundedRectangle(cornerRadius: Spacing.uaiSmall2))
            } else {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: Spacing.uaiHuge2, height: Spacing.uaiLarge3)
                    .clipShape(RoundedRectangle(cornerRadius: Spacing.uaiSmall2))
            }
        }
    }
    
    var body: some View {
        
        switch ratio {
        case .wide:
            return AnyView(BaseThumbnailWide())
        default:
            return AnyView(BaseThumbnailSquare())
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Thumbnail()
            Thumbnail(ratio: .wide)
        }
    }
}

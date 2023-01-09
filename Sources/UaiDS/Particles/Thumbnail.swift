import SwiftUI

struct Thumbnail: View {
    
    enum Badge {
        case badgeBottom, badgeTop
    }
    
    var badge: Badge?
    var image: String = ""
    
    fileprivate func BaseThumbnail() -> some View {
        return Group {
            if image.isEmpty {
                Image.uaiPlaceholderThumb
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: Spacing.uaiLarge2, height: Spacing.uaiLarge2)
                    .clipShape(RoundedRectangle(cornerRadius: Spacing.uaiSmall1))
            } else {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: Spacing.uaiLarge2, height: Spacing.uaiLarge2)
                    .clipShape(RoundedRectangle(cornerRadius: Spacing.uaiSmall1))
            }
        }
    }
    
    var body: some View {
        
        BaseThumbnail()
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Thumbnail()
    }
}

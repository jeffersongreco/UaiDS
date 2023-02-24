import SwiftUI


public struct UaiOpening<Background: View, ContentBottom: View, ContentTop: View>: View {
    
    @Environment(\.safeAreaInsets) var safeAreaInsets
    
    var background: () -> Background
    var contentBottom: () -> ContentBottom
    var contentTop: () -> ContentTop

    public init(@ViewBuilder background: @escaping () -> Background,
         @ViewBuilder contentBottom: @escaping () -> ContentBottom,
         @ViewBuilder contentTop: @escaping () -> ContentTop) {
        self.background = background
        self.contentBottom = contentBottom
        self.contentTop = contentTop
    }
    
    public var body: some View {
        
        ZStack {
            
            ZStack {
                background()
            }

            
            ZStack (alignment: .bottomLeading) {
                contentBottom()
            }
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth, alignment: .bottomLeading)
            
            ZStack (alignment: .topLeading) {
                contentTop()
            }
            .padding(safeAreaInsets)
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth, alignment: .topLeading)
            
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth)
        
        
    }
    
}

struct UaiOpening_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            UaiOpening(
                background: {
                    Group { Image.uaiPlaceholderAvatarBig.resizable().aspectRatio(contentMode: .fill) }
                }, contentBottom: {
                    Group { Image.uaiPlaceholderAvatar }
                }, contentTop: {
                    Group { Image.uaiPlaceholderAvatar }
                })
        }
        .ignoresSafeArea()
    }
}

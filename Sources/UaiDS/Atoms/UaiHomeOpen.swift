import SwiftUI


public struct UaiHomeOpen<Background: View, ContentBottom: View, ContentTop: View>: View {
    
    var background: () -> Background
    var contentBottom: () -> ContentBottom
    var contentTop: () -> ContentTop

    init(@ViewBuilder background: @escaping () -> Background,
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
            .ignoresSafeArea()
            
            ZStack (alignment: .bottomLeading) {
                contentBottom()
            }
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth, alignment: .bottomLeading)
            
            ZStack (alignment: .topLeading) {
                contentTop()
            }
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth, alignment: .topLeading)
            
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth)
        .safeAreaInset(edge: .top) {
            Blur(style: .systemMaterialDark)
                .mask {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0, green: 0, blue: 0, opacity: 0), Color.black]), startPoint: .bottom, endPoint: .top))
                }
        }
        
    }
    
}

struct UaiHomeOpen_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            UaiHomeOpen(
                background: {
                    Group { Image.uaiPlaceholderAvatarBig.resizable().aspectRatio(contentMode: .fill) }
                }, contentBottom: {
                    Group { Image.uaiPlaceholderAvatar }
                }, contentTop: {
                    Group { Image.uaiPlaceholderAvatar }
                })
        }
    }
}
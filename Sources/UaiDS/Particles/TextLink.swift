import SwiftUI

struct TextLink: View {
    
    var text: String
    var destination: String
    
    var body: some View {
        Link(text, destination: URL(string: destination)!)//.foregroundColor(Color.uaiAccent60)
    }
}

struct TextLink_Previews: PreviewProvider {
    static var previews: some View {
        TextLink(text: "Link", destination: "https://www.google.com")
    }
}

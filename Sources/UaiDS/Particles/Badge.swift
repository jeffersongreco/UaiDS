import SwiftUI

struct Badge: View {
    
    enum Style {
        case regular, alert, warning
    }
    
    //var style: Style
    
    var body: some View {
        HStack {
            Label("Label", systemImage: "uai.symbol.placeholder")

        }
    }
}

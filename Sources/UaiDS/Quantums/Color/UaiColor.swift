import SwiftUI
import UIKit

public extension Color {
    
    /// Text
    static let uaiHeading = Color("Heading", bundle: .module)
    static let uaiText = Color("Text", bundle: .module)
    static let uaiTextSubdued = Color("Text Subdued", bundle: .module)
    static let uaiHeadingSubdued = Color("Heading Subdued", bundle: .module)
    static let uaiDisabled = Color("Disabled", bundle: .module)
    /// Text - White
    static let uaiHeadingWhite = Color("Heading White", bundle: .module)
    static let uaiTextWhite = Color("Text White", bundle: .module)
    static let uaiTextSubduedWhite = Color("Text Subdued White", bundle: .module)
    static let uaiHeadingSubduedWhite = Color("Heading Subdued White", bundle: .module)
    static let uaiDisabledWhite = Color("Disabled White", bundle: .module)
    /// Text - Black
    static let uaiHeadingBlack = Color("Heading Black", bundle: .module)
    static let uaiTextBlack = Color("Text Black", bundle: .module)
    static let uaiTextSubduedBlack = Color("Text Subdued Black", bundle: .module)
    static let uaiHeadingSubduedBlack = Color("Heading Subdued Black", bundle: .module)
    static let uaiDisabledBlack = Color("Disabled Black", bundle: .module)
    
}

extension Color {
    
    // Colors
    /// Blue
    static let uaiBlue10 = Color("Blue 10", bundle: .module)
    static let uaiBlue20 = Color("Blue 20", bundle: .module)
    static let uaiBlue30 = Color("Blue 30", bundle: .module)
    static let uaiBlue40 = Color("Blue 40", bundle: .module)
    static let uaiBlue50 = Color("Blue 50", bundle: .module)
    static let uaiBlue60 = Color("Blue 60", bundle: .module)
    static let uaiBlue70 = Color("Blue 70", bundle: .module)
    static let uaiBlue80 = Color("Blue 80", bundle: .module)
    static let uaiBlue90 = Color("Blue 90", bundle: .module)
    
}

protocol Theme {
    var accentColor: String { get }
    var uaiTheme: String { get }
}

struct ThemeBlue: Theme {
    var accentColor: String = "Blue"
    var uaiTheme: String = "uaiBlue"
}

public enum ThemeManager {
    static let themes: [Theme] = [ThemeBlue()]
    
    func getTheme(_ theme: Int) -> Theme {
        Self.themes[theme]
    }
}

/*
 
 #1. In AppDelegate, add this folowing code:
 
 Import SwiftUI
 
 class DataSource: ObservableObject {                      //
    @Published var selectedTheme: Theme = ThemeBlue()      //
 }                                                         //
 
 @main
 struct AppName: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataSource())           //
        }
    }
 }
 
 #2. In each view, add this:
 
 struct ContentView: View {
    @EnvironmentObject var dataSource: DataSource
 
 */

public extension Color {
    @EnvironmentObject var dataSource: DataSource
    
    /// Accent
    static let uaiAccent50 = Color("\(dataSource.selectedTheme.accentColor) 50", bundle: .module)
    
}

//
//  PhoneContentView.swift
//  This source file is part of the StackOv open source project
//

import SwiftUI
import Palette

struct PhoneContentView: View {

    var body: some View {
        TabView {
            MainBar.tabs
        }
        .accentColor(Palette.white)
        .introspectTabBarController {
            $0.tabBar.barTintColor = PaletteCore.grayblue
        }
    }
}

// MARK: - Previews

struct PhoneContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        PhoneContentView()
    }
}
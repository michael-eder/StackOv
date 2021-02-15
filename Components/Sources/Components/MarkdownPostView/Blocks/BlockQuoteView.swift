//
//  BlockQuoteView.swift
//  StackOv (Components module)
//
//  Created by Erik Basargin
//  Copyright © 2021 Erik Basargin. All rights reserved.
//

import SwiftUI
import Markdown
import Palette

extension Markdown {
    
    struct BlockQuoteView: MarkdownUnitView {
        
        // MARK: - Properties
        
        let unit: Unit
        
        // MARK: - View
        
        var body: some View {
            HStack(alignment: .top, spacing: 6) {
                Color.background.frame(width: 4)
                GlobalBlockView(unit: unit)
            }
            .padding(.bottom, 3)
            .fixedSize(horizontal: false, vertical: true)
        }
    }
    
}

// MARK: - Previews

struct BlockQuoteView_Previews: PreviewProvider {
    
    static let unit = Markdown.Unit("> Test test test")!.children.first!
    
    static var previews: some View {
        Group {
            Markdown.BlockQuoteView(unit: unit)
                .padding()
                .previewLayout(.sizeThatFits)
                .background(Palette.bluishblack)
                .environment(\.colorScheme, .light)
            
            Markdown.BlockQuoteView(unit: unit)
                .padding()
                .previewLayout(.sizeThatFits)
                .background(Palette.bluishblack)
                .environment(\.colorScheme, .dark)
        }
    }
}

// MARK: - Extensions

fileprivate extension Color {
    
    static let background = Palette.dullGray
}
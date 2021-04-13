//
//  CodeBlockView.swift
//  StackOv (Components module)
//
//  Created by Erik Basargin
//  Copyright © 2021 Erik Basargin. All rights reserved.
//

import SwiftUI
import Markdown
import Palette

extension Markdown {
    
    struct CodeBlockView: MarkdownUnitView {
        
        // MARK: - Properties
        
        let unit: Unit
        
        // MARK: - View
        
        var body: some View {
            if case let .codeBlock(_, code) = unit.type {
                content(code: code)
            }
        }
        
        // MARK: - View methods
        
        func content(code: String) -> some View {
            ScrollView(.horizontal, showsIndicators: true) {
                VStack(alignment: .center, spacing: .zero) {
                    Text(code)
                        .font(.custom("Menlo-Regular", size: 13))
                        .foregroundColor(.foreground)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding([.leading, .top, .trailing], 12)
            .background(Color.background)
            .cornerRadius(6)
            .padding(.bottom, 3)
        }
    }
}

// MARK: - Previews

struct CodeBlockView_Previews: PreviewProvider {
    
    static let unit = Markdown.Unit("""
    ```
    func convertHtml() -> NSAttributedString {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            return attributedString
        } else {
            return NSAttributedString()
        }
    }
    ```
    """)!.children.first!
    
    static var previews: some View {
        Group {
            Markdown.CodeBlockView(unit: unit)
                .padding()
                .previewLayout(.sizeThatFits)
                .background(Palette.bluishblack)
                .environment(\.colorScheme, .light)
            
            Markdown.CodeBlockView(unit: unit)
                .padding()
                .previewLayout(.sizeThatFits)
                .background(Palette.bluishblack)
                .environment(\.colorScheme, .dark)
        }
    }
}

// MARK: - Extensions

fileprivate extension Color {
    
    static let background = Color.white.opacity(0.04)
    static let foreground = Color.white
}

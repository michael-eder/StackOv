//
//  RetingView.swift
//  StackOv (ThreadFlow module)
//
//  Created by Владислав Климов
//  Copyright © 2021 Erik Basargin. All rights reserved.
//

import SwiftUI
import Palette

struct RetingView: View {
    
    // MARK: - Properties
    
    var viewed: String
    var isVertical: Bool
    
    // MARK: - Views
    
    var body: some View {
        if isVertical {
            verticalContent
        } else {
            horisontalContent
        }
    }
    
    var verticalContent: some View {
        VStack(alignment: .center, spacing: 8) {
            Button(action: {}, icon: .handThumbsupFill)
                .frame(width: 24, height: 24)
            Text(viewed)
                .font(.footnote)
            Button(action: {}, icon: .handThumbsdownFill)
                .frame(width: 24, height: 24)
        }
        .foregroundColor(Palette.slateGray | Palette.dullGray)
    }
    
    var horisontalContent: some View {
        HStack(alignment: .center, spacing: 12) {
            Button(action: {}, icon: .handThumbsupFill)
                .frame(width: 24, height: 24)
            Text(viewed)
                .font(.footnote)
            Button(action: {}, icon: .handThumbsdownFill)
                .frame(width: 24, height: 24)
        }
        .foregroundColor(Palette.slateGray | Palette.dullGray)
    }
    
}

// MARK: - Previews

struct RetingView_Previews: PreviewProvider {
    
    static var previews: some View {
        RetingView(viewed: "365", isVertical: false)
    }
}

//
//  Key.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 03/09/22.
//

import SwiftUI

protocol Key {
    
    var cornerRadius: CGFloat { get set }
    var width: CGFloat { get set }
    var heigth: CGFloat { get set }
    
}

struct KeyBlank: View, Key {
    
    let lineWidth: CGFloat = 2
    
    var cornerRadius: CGFloat = 6
    var width: CGFloat = 34
    var heigth: CGFloat = 50
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(.gray, lineWidth: lineWidth)
            .frame(width: width, height: heigth)
    }
}

struct KeyColor: View, Key {
    
    var cornerRadius: CGFloat = 6
    var width: CGFloat = 34
    var heigth: CGFloat = 50
    
    var color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .foregroundColor(color)
            .frame(width: width, height: heigth)
    }
    
}

struct Key_Previews: PreviewProvider {
    static var previews: some View {
        KeyBlank()
        KeyColor(color: .green)
    }
}

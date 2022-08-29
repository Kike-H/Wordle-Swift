//
//  Cube.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 29/08/22.
//

import SwiftUI

protocol Cube {
    
    var lineWidth: CGFloat { get set }
    var cornerRadius: CGFloat { get set }
    var size: CGFloat { get set }
    
}

struct CubeBlank: View, Cube {
    
//  Constants
    var lineWidth: CGFloat = 4
    var cornerRadius: CGFloat = 8
    var size: CGFloat = 60

    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(.gray, lineWidth: lineWidth)
            .frame(width: size, height: size)
    }
}

struct CubeColor: View, Cube {
    
//  Constants
    var lineWidth: CGFloat = 4
    var cornerRadius: CGFloat = 8
    var size: CGFloat = 60
    let sizeLetter = CGFloat(25)
    
// Variable
    var color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .frame(width: size, height: size)
            .foregroundColor(color)
            .overlay(
                Text("H")
                    .font(.system(size: sizeLetter, weight: .bold))
                    .foregroundColor(Color.white)
            )
    }
}

struct Cube_Previews: PreviewProvider {
    static var previews: some View {
        CubeBlank()
        CubeColor(color: Color.green)
    }
}

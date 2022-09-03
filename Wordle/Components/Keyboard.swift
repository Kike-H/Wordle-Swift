//
//  Keyboard.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 03/09/22.
//

import SwiftUI

struct Keyboard: View {
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 20), spacing: 0), count: 10)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(keyboardData, id: \.self) {k in
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.gray)
                    .frame(width: 34, height: 50)
                    .overlay {
                        Button {
                            debugPrint("adding a letter")
                        } label: {
                            Text(k.letter)
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                        }
                    }
            }
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
    }
}

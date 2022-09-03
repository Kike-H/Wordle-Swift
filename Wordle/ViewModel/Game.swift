//
//  BoardController.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 03/09/22.
//

import Foundation

final class Game: ObservableObject {
    
    var numRow = 0
    var message = "Presiona 🚀 para una nueva palabra"
    private let emptyBoard: [[CubeModel]]  = Array(repeating: (0...4).map { .init(_letter: "\($0)") } , count: 6)
    
    @Published var answer: [String] = Array("ZORRO").map {String($0)}
    @Published var word: [String] = []
    @Published var board: [[CubeModel]]
    @Published var isMessage: Bool = false
    
    init() {
        self.board = emptyBoard
    }
    
    func addLetter(cube: CubeModel) {
        if (cube.letter == "🚀") {
            isMessage = false
            word = []
            numRow = 0
            board = emptyBoard
            message = "Presiona 🚀 para una nueva palabra"
            return
        }
        
        if (word.count < 5) {
            
            word.append(cube.letter)
            let status = getNewSatus()
            
            board[numRow][word.count-1] = CubeModel(_letter: cube.letter, _status: status)
            
        }
        
        if (word.count == 5) {
//            Check if exits winner
            if(!isWinner() && numRow < 5) {
                word = []
                numRow += 1
                isMessage = false
            }
            else if (isWinner()) {
                message = "Ganaste. " + message
                isMessage = true
            }
            else {
                message = "Perdiste. La respuesta era \(self.answer.joined()) " + message
                isMessage = true
            }
            
        }
        
    }
    
    private func getNewSatus() -> Status {
        var status: Status = .dontAppear
        let currentLetter = word[word.count-1]
        if(answer.contains(where: { $0 ==  currentLetter})) {
            status = .appear
            if (currentLetter == answer[word.count-1]) {
                status = .match
            }
        }
        return status
    }
    
    private func isWinner() -> Bool {
        return answer.joined() == word.joined() ? true : false
    }
    
}

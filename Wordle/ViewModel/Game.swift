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
        if(cube.letter == "🚀") {
            isMessage = false
            word = []
            numRow = 0
            board = emptyBoard
            message = "Presiona 🚀 para una nueva palabra"
            return
        }
        
        if(word.count < 5) {
            
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
            if (isWinner()) {
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
        for(index, _) in word.enumerated() {
            let currentLetter = word[index]
            if(answer.contains(where: { $0 == currentLetter})) {
                status = .apear
                if(currentLetter == answer[index]) {
                    status = .match
                }
            }
        }
        return status
    }
    
    private func isWinner() -> Bool {
        let s1 = board[numRow][0].status
        let s2 = board[numRow][1].status
        let s3 = board[numRow][2].status
        let s4 = board[numRow][3].status
        let s5 = board[numRow][4].status
        let flag = s1 == .match && s2 == .match && s3 == .match && s4 == .match && s5 == .match ? true : false
        return flag
    }
    
}

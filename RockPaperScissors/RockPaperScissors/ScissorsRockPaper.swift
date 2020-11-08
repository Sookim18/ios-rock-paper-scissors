//
//  ScissorsRockPaper.swift
//  RockPaperScissors
//
//  Created by Kyungmin Lee on 2020/11/08.
//

import Foundation



/// 가위 바위 보 클래스
class ScissorsRockPaper {
    var gameStatus: ScissorsRockPaperStatus = .initializeGame
    var gameResult: GameResult?
    var userHand: Hand?
    var computerHand: Hand?
    
    
    enum ScissorsRockPaperStatus: Int {
        case initializeGame = 0
        case inputUser
        case inputComputer
        case decideResult
        case endGame
        
        mutating func goToNextStatus() {
            guard let nextStatus = ScissorsRockPaperStatus(rawValue: self.rawValue + 1) else {
                return
            }
         
            self = nextStatus
        }
        
        mutating func goTo(status: ScissorsRockPaperStatus) {
            self = status
        }
    }
    
    func progress() {
        switch gameStatus {
        case .initializeGame:
            printGame()
            gameStatus.goToNextStatus()
            
        case .inputUser:
            inputUser()
            gameStatus.goToNextStatus()
            
        case .inputComputer:
            inputComputer()
            gameStatus.goToNextStatus()
            
        case .decideResult:
            decideResult()
            printGame()
            if let gameResult = self.gameResult, gameResult == .draw {
                gameStatus.goTo(status: .initializeGame)
            } else {
                gameStatus.goToNextStatus()
            }
            break
            
        case .endGame:
            break
        }
        
        
    }
    
    func printGame() {
        switch gameStatus {
        case .initializeGame:
            print("가위(1), 바위(2), 보(3)! <종료 : 0 > : ", terminator: "")
        case .decideResult:
            guard let gameResult = self.gameResult else {
                break
            }
            
            switch gameResult {
            case .draw:
                print("비겼습니다!")
            case .win:
                print("이겼습니다!")
            case .lose:
                print("졌습니다!")
            }
        case .endGame:
            print("게임 종료")
        default:
            break
        }
    }
    
    
    func inputUser() {
        while true {
            guard let input = readLine(), let inputNumber = Int(input),inputNumber >= 0, inputNumber <= 3 else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            // 0입력시 바로 게임 종료
            guard inputNumber != 0 else {
                gameStatus.goTo(status: .endGame)
                return
            }
            
            userHand = Hand.scissorsRockPaper(number: inputNumber)
            return
        }
        
    }
    
    func inputComputer() {
        computerHand = Hand.scissorsRockPaper(number: Int.random(in: 1...3))
    }
    
    func decideResult() {
        guard let userHand = self.userHand, let computerHand = self.computerHand else {
            return
        }
        
        guard userHand != computerHand else {
            gameResult = .draw
            return
        }
        
        switch userHand {
        case .scissors:
            gameResult = (computerHand == .paper) ? .win : .lose
        case .rock:
            gameResult = (computerHand == .scissors) ? .win : .lose
        case .paper:
            gameResult = (computerHand == .rock) ? .win : .lose
        }
        
        print("나:\(userHand) vs \(computerHand):컴퓨터")
    }
}

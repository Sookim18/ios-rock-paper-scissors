//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

func winMessage(computerNumber:Int) {
    print("컴퓨터의 패 : \(computerNumber)")
    print("이겼습니다!")
    exit(0)
}

func loseMessage(computerNumber:Int) {
    print("컴퓨터의 패 : \(computerNumber)")
    print("졌습니다!")
    exit(0)
}

func sameMessage(computerNumber:Int) {
    print("컴퓨터의 패 : \(computerNumber)")
    print("비겼습니다!")
}

func inputUserScissors(computerNumber:Int) {
    switch computerNumber {
    case 1:
        sameMessage(computerNumber:computerNumber)
    case 2:
        loseMessage(computerNumber:computerNumber)
    default:
        winMessage(computerNumber:computerNumber)
    }
}

func inputUserRock(computerNumber:Int) {
    switch computerNumber {
    case 1:
        winMessage(computerNumber:computerNumber)
    case 2:
        sameMessage(computerNumber:computerNumber)
    default:
        loseMessage(computerNumber:computerNumber)
    }
}

func inputUserPaper(computerNumber:Int) {
    switch computerNumber {
    case 1:
        loseMessage(computerNumber:computerNumber)
    case 2:
        winMessage(computerNumber:computerNumber)
    default:
        sameMessage(computerNumber:computerNumber)
    }
}

func startGame() {
    while true {
        let computerNumber:Int = Int.random(in: 1...3)
        
        print("가위(1). 바위(2). 보(3)! <종료 : 0> :", terminator:"")
        let inputUserString = readLine()!
        
        if let inputUserNumber = Int(inputUserString) {
            if inputUserNumber == 1 {
                inputUserScissors(computerNumber:computerNumber)
            }
            else if inputUserNumber == 2 {
                inputUserRock(computerNumber:computerNumber)
            }
            else if inputUserNumber == 3 {
                inputUserPaper(computerNumber:computerNumber)
            }
            else if inputUserNumber == 0 {
                break
            }
        }
        else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

startGame()

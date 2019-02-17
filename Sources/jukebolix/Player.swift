//
//  Player.swift
//  jukebolix
//
//  Created by Bruno Koga on 17/02/2019.
//

import Foundation

protocol Player {
    func execute(_ operation: Operation)
}

class TestPlayer: Player {
    func execute(_ operation: Operation) {
        print(operation.debugDescription)
    }
}

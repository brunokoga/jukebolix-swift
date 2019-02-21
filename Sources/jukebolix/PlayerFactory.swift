//
//  PlayerFactory.swift
//  jukebolix
//
//  Created by Bruno Koga on 21/02/2019.
//

import Foundation

protocol PlayerFactory {
    func createPlayer() -> Player
}

struct TestPlayerFactory: PlayerFactory {
    func createPlayer() -> Player {
        return TestPlayer()
    }
}

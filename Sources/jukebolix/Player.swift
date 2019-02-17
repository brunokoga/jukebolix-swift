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
    private var lastPlayedProccessId: String?
    func execute(_ operation: Operation) {
        switch operation.action {
        case .stop:
            killLastPlayedProcessId()
        case .play(let audioFile):
            killLastPlayedProcessId()
            play(audioFile)
        default:
            break
        }
        print(operation.debugDescription)
    }
    
    private func play(_ audioFile: AudioFile) {
        print("Playing...")
    }
    
    private func killLastPlayedProcessId() {
        guard let lastPlayedProccessId = lastPlayedProccessId else { return }
            print(lastPlayedProccessId)
    }
}

struct Song {
    let id: SongId
    let filename: String
    let title: String
    
    public init(id: SongId) {
        self.id = id
        filename = ""
        title = ""
    }
}

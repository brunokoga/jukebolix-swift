//
//  Operation.swift
//  jukebolix
//
//  Created by Bruno Koga on 17/02/2019.
//

import Foundation

public typealias CardId = String
public typealias SongId = String

public struct Operation {
    let action: Action
    let id: CardId
    
    public init(id: CardId) {
        self.id = id
        self.action = Action(id: id)
    }
    
    public var debugDescription: String {
        return action.debugDescription
    }
}

public struct AudioFile {
    let id: SongId
}

public enum Action {
    case play(audioFile: AudioFile)
    case playPause
    case volumeUp
    case volumeDown
    
    public init(id: CardId) {
        if id == "p" {
            self = .playPause
        } else {
            let audioFile = AudioFile(id: id)
            self = .play(audioFile: audioFile)
        }
    }
    
    public var debugDescription: String {
        let description: String
        switch self {
        case .playPause:
            description = "play/pause"
        case .play(let audioFile):
            description = "Tocando música com id: \(audioFile.id)"
        case .volumeUp:
            description = "volume Up"
        case .volumeDown:
            description = "volume Down"
        }
        return description
    }
}



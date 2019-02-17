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
    let filename: String
    
    public init(id: SongId) {
        self.id = id
        filename = id + ".m4a"
    }
}

public enum Action {
    case play(audioFile: AudioFile)
    case playPause
    case stop
    case volumeUp
    case volumeDown
    
    public init(id: CardId) {
        switch id {
        case "p":
            self = .playPause
        case "s":
            self = .stop
        case "vup":
            self = .volumeUp
        case "vdown":
            self = .volumeDown
        default:
            let audioFile = AudioFile(id: id)
            self = .play(audioFile: audioFile)
        }
    }
    
    public var debugDescription: String {
        let description: String
        switch self {
        case .stop:
            description = "stop!"
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



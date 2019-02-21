//
//  Operation.swift
//  jukebolix
//
//  Created by Bruno Koga on 17/02/2019.
//

import Foundation

public typealias CardId = String
public typealias SongId = String

public struct Operation: CustomDebugStringConvertible {
    let action: Action
    let id: CardId
    
    public init(id: CardId) {
        self.id = id
        self.action = TestActionFactory.createAction(from: id)
    }
    
    public var debugDescription: String {
        return action.debugDescription
    }
}

protocol ActionFactory {
    static func createAction(from cardId: CardId) -> Action
}

struct TestActionFactory {
    static func createAction(from cardId: CardId) -> Action {
        let action: Action
        switch cardId {
        case "p":
            action = .playPause
        case "s":
            action = .stop
        case "vup":
            action = .volumeUp
        case "vdown":
            action = .volumeDown
        default:
            let audioFile = Audio(id: cardId)
            action = .play(audioFile: audioFile)
        }
        return action
    }
}


public enum Action: CustomDebugStringConvertible  {
    case play(audioFile: AudioFile)
    case playPause
    case stop
    case volumeUp
    case volumeDown
    
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

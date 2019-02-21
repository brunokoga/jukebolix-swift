//
//  AudioFile.swift
//  jukebolix
//
//  Created by Bruno Koga on 21/02/2019.
//

import Foundation

protocol AudioFile {
    var id: SongId { get }
    var filename: String { get }
    
    init(id: SongId)
}

public struct Audio: AudioFile {
    public let id: SongId
    public let filename: String
    
    public init(id: SongId) {
        self.id = id
        filename = id + ".m4a"
    }
}

public struct Song: AudioFile {
    let id: SongId
    let filename: String
    let title: String
    
    public init(id: SongId) {
        self.id = id
        filename = id + ".m4a"
        title = ""
    }
}

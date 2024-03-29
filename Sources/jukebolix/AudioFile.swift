//
//  AudioFile.swift
//  jukebolix
//
//  Created by Bruno Koga on 21/02/2019.
//

import Foundation

public protocol File {
    var path: String { get }
}

public protocol AudioFile {
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

public struct Song: AudioFile, Decodable {
    private enum CodingKeys: String, CodingKey {
        case id, filename, title
    }
    
    public let id: SongId
    public let filename: String
    public let title: String
    
    public init(id: SongId) {
        self.id = id
        filename = id + ".m4a"
        title = ""
    }
}

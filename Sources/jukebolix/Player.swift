//
//  Player.swift
//  jukebolix
//
//  Created by Bruno Koga on 17/02/2019.
//

import Foundation

protocol Playlist {
    var allSongs: [Song] { get }
    func song(for id: SongId) -> Song?
}

struct PlistPlaylist: Playlist {
    let allSongs: [Song]
    func song(for id: SongId) -> Song? {
        return nil
    }
    
    //https://stackoverflow.com/a/48140217/912254
    init(plistPath: String) {
        guard let data = FileManager.default.contents(atPath: plistPath) else {
            allSongs = []
            return
        }
        let decoder = PropertyListDecoder()
        guard let songs = try? decoder.decode([Song].self, from: data) else {
            allSongs = []
            return
        }
        allSongs = songs
    }
    
    
}

protocol Player {
    func execute(_ operation: Operation)
}

class JukebolixPlayer: Player {
    private let playlist: Playlist
    
    init(playlist: Playlist) {
        self.playlist = playlist
    }
    
    func execute(_ operation: Operation) {
        switch operation.action {
        case .stop:
            stop()
            break
        case .play(let audioFile):
            stop()
            play(audioFile)
        default:
            break
        }
        print(operation.debugDescription)
    }
    
    private func stop() {
        print("stop")
    }
    
    private func play(_ audioFile: AudioFile) {
        print(audioFile)
    }
    
}

class TestPlayer: Player {
    private var currentProcess: Process?
    
    func execute(_ operation: Operation) {
        switch operation.action {
        case .stop:
            killCurrentProcess()
        case .play(let audioFile):
            killCurrentProcess()
            play(audioFile)
        default:
            break
        }
        print(operation.debugDescription)
    }
    
    private func play(_ audioFile: AudioFile) {
        let directory = "/Users/brunokoga/Desktop/"
        let command = "afplay"
        let args = ["\(directory)\(audioFile.filename)"]
        let process = Process()
        currentProcess = process
        DispatchQueue.global().async {
            let result = process.shell(command: "\(command) \(args.joined(separator: " "))")
            print(result)
        }
    }
    
    private func killCurrentProcess() {
        currentProcess?.terminate()
    }
}

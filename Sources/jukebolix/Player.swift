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
//    private var lastPlayedProccessId: String?
    private var currentProccess: Process?
    
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
        let directory = "/Users/brunokoga/Desktop/"
        let command = "afplay"
        let args = ["\(directory)\(audioFile.filename)"]
        let process = Process()
        currentProccess = process
        DispatchQueue.global().async {
            let result = process.shell(command: "\(command) \(args.joined(separator: " "))")
            print(result)
        }
    }
    
    private func killLastPlayedProcessId() {
        currentProccess?.terminate()
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



extension Process {
    public func shell(command: String) -> String {
        launchPath = "/bin/bash"
        arguments = ["-c", command]
        
        let outputPipe = Pipe()
        standardOutput = outputPipe
        launch()
        
        let data = outputPipe.fileHandleForReading.readDataToEndOfFile()
        guard let outputData = String(data: data, encoding: String.Encoding.utf8) else { return "" }
        
        return outputData.reduce("") { (result, value) in
            return result + String(value)
        }
    }
}

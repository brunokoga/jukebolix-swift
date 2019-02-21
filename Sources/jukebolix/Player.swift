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

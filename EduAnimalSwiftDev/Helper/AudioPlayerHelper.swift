//
//  AudioPlayerHelper.swift
//  EduAnimalSwiftDev
//
//  Created by MacBook Pro on 02/05/24.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playAudio(fileName: String, fileFormat: String) -> AVAudioPlayer {
    if (Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil) {
        audioPlayer = try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        audioPlayer?.play()
    }
    
    return audioPlayer!
}

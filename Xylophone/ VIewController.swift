//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // This module allows playing sound.
class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer: AVAudioPlayer!
    var soundArray = ["note1","note2","note3","note4","note5","note6","note7"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func playSound(sound: String) {
        
        //Line 28 basically set up the location of where the sound is saved in our app and stores it
        //into soundURL. Now soundUrl is an actual constant with a song inside.
        let soundUrl = Bundle.main.url(forResource: sound, withExtension: "wav")
        do {
            //audioPlayer as we declared it but not assigned in line 13 will now take in that song.
            //the reason it is on a try method is because we want to make sure that actual sound exsists.
            //if it doesnt exsist then we will leave the try method and the code knows to go to a catch
            //and display the error.
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
            
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        let selectedSoundFileName: String = soundArray[sender.tag - 1]
        
        playSound(sound: selectedSoundFileName)
    }
    
  

}


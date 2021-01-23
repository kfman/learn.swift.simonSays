//
//  ViewController.swift
//  SimonSays
//
//  Created by Klaus Fischer on 23.01.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scoreLabels: [UILabel]!
    @IBOutlet var playerLabels: [UILabel]!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet var colorButtons: [CircularButton]!
    
    var currentPlayer = 0
    var scores = [0,0]
    
    var sequenceIndex = 0
    var colorSequence = [Int]()
    var colorsToTap = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colorButtons = colorButtons.sorted(){            $0.tag < $1.tag        }
        playerLabels = playerLabels.sorted(){            $0.tag < $1.tag        }
        scoreLabels = scoreLabels.sorted(){            $0.tag < $1.tag        }
        createNewGame()
    }

    func createNewGame(){
        colorSequence.removeAll()
                
        actionButton.setTitle("Start Game", for: .normal)
        actionButton.isEnabled = true
        for button in colorButtons{
            button.alpha = 0.5
            button.isEnabled = false
        }
    }
        
    func addNewColor(){
        colorSequence.append(Int(arc4random_uniform(UInt32(4))))
    }
    
    func playSequence(){
        if sequenceIndex < colorSequence.count {
            flash(button: colorButtons[colorSequence[sequenceIndex]])
            sequenceIndex += 1
        }
        else{
            colorsToTap = colorSequence
            view.isUserInteractionEnabled = true
            actionButton.setTitle("Tap the circles", for: .normal)
            for button in colorButtons{
                button.isEnabled = true
            }
        }
    }
    
    func flash(button: CircularButton){
        UIView.animate(withDuration: 0.5) {
            button.alpha = 1.0
            button.alpha = 0.5
        } completion: { (bool) in
            self.playSequence()
        }

        
    }
    
    @IBAction func colorButtonHandle(_ sender: CircularButton) {
        print("Button \(sender.tag) tapped")
        
    }
    
    @IBAction func actionButtonHandler(_ sender: UIButton) {
        sequenceIndex = 0
        actionButton.setTitle("Memorize", for: .normal)
        actionButton.isEnabled = false
        view.isUserInteractionEnabled = false
        
        addNewColor()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: playSequence)
    }
}


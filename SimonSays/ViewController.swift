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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colorButtons = colorButtons.sorted(){            $0.tag < $1.tag        }
        playerLabels = playerLabels.sorted(){            $0.tag < $1.tag        }
        scoreLabels = scoreLabels.sorted(){            $0.tag < $1.tag        }
        createNewGame()
    }

    func createNewGame(){
        actionButton.setTitle("Start Game", for: .normal)
        for button in colorButtons{
            button.alpha = 0.5
        }
    }
        
    @IBAction func colorButtonHandle(_ sender: CircularButton) {
        print("Button \(sender.tag) tapped")
        
    }
    
    @IBAction func actionButtonHandler(_ sender: UIButton) {
        print("Action Button")
    }
}


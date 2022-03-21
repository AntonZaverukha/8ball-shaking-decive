//
//  ViewController2.swift
//  8ball shaking
//
//  Created by Антон Заверуха on 20.03.2022.
//  Copyright © 2022 Антон Заверуха. All rights reserved.
//

import UIKit

protocol VC2Delegate {
    func filllabelwith(info: String)
}

class ViewController2 : UIViewController{
    
    var delegate: VC2Delegate?
    
    
    @IBOutlet weak var PhraseOneLabel: UILabel!
    
    @IBOutlet weak var PhraseTwoLabel: UILabel!
    
    @IBAction func OneSwitch(_ sender: Any) {
        let info = PhraseOneLabel.text
                delegate?.filllabelwith(info: info!)
    }
    
    @IBAction func TwoSwitch(_ sender: Any) {
        let info = PhraseTwoLabel.text
                       delegate?.filllabelwith(info: info!)
           }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

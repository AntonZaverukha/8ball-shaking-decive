//
//  ViewController.swift
//  8ball shaking
//
//  Created by Антон Заверуха on 17.03.2022.
//  Copyright © 2022 Антон Заверуха. All rights reserved.
//

import UIKit



class ViewController: UIViewController, VC2Delegate {
    func filllabelwith(info: String) {
        AnsLabel.text = info
        AnsLabel.isEnabled = true
        Label.isEnabled = false
    }
    

    
    @IBOutlet weak var AnsLabel: UILabel!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AnsLabel.isEnabled = false
        
        
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        makePostrequest(endpoint: "question?")
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
    }
    override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getData"{
            let destinationVC = segue.destination as! ViewController2
            destinationVC.delegate = self
        }
    }
    

    struct Magic : Codable {
        var magic : Ball
    }
    struct Ball : Codable{
        var question: String
        var answer: String
        var type: String
    }

    public func makePostrequest(endpoint: String){

        
        guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/\(endpoint)") else
           {return}
    
    print("Making call...")
    


    let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
        guard let data = data, error == nil else {return}

        do {
            let response = try JSONDecoder().decode(Magic.self, from: data)

            DispatchQueue.main.async{
                self.AnsLabel.text = response.magic.answer
                self.AnsLabel.isEnabled = true
                self.Label.isEnabled = false
            }
        }catch{
            print("error: ", error)
            
        }
    }
    task.resume()
    
    
}
   
}

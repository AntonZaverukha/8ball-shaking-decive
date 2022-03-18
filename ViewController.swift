//
//  ViewController.swift
//  8ball shaking
//
//  Created by Антон Заверуха on 17.03.2022.
//  Copyright © 2022 Антон Заверуха. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AnsLabel: UILabel!
    @IBOutlet weak var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // shaking device
        // then the function is performed
        makePostrequest(endpoint: "ques?")
    }
    
//    struct Response: Codable {
//
//        var body: String
//        var title: String
//        var id: Int
//        var userId: Int
//    }
    struct Magic : Codable {
        var magic : Ball
    }
    struct Ball : Codable{
        var question: String
        var answer: String
        var type: String
    }

    func makePostrequest(endpoint: String){
//    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else
//       {return}
        
        guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/\(endpoint)") else
           {return}
    
    print("Making call...")
    
    var request = URLRequest(url: url)

    request.httpMethod = "POST"
        
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

//    let body: [String: AnyHashable] = [
//
////        "userId": 1,
////        "title": "Hello",
////        "body": "lazy dog. ",
//        "question": "Quest?"
//
//    ]
//    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

        
    // request

    let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
        guard let data = data, error == nil else {return}

        do {
            let response = try JSONDecoder().decode(Magic.self, from: data)
//            print("Question: \(endpoint)")
//            print("Answer: \(response.magic.answer)")
            DispatchQueue.main.async{
                self.AnsLabel.text = response.magic.answer
            }
        }catch{
            print("error: ", error)
            
        }
    }
    task.resume()
    
    
}
   
}

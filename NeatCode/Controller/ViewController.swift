//
//  ViewController.swift
//  NeatCode
//
//  Created by Ayush Rajpal on 28/05/24.
//

import UIKit

class ViewController: UIViewController {

    // outlets
    
    @IBOutlet weak var semiProgress: SemiCircularProgressView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var noOfEasy: UILabel!
    @IBOutlet weak var noOfMedium: UILabel!
    @IBOutlet weak var noOfHard: UILabel!
    @IBOutlet weak var noOfTotal: UILabel!
    @IBOutlet weak var Ranking: UILabel!
    @IBOutlet weak var Reputation: UILabel!
    @IBOutlet weak var Contribution: UILabel!
    
    // objects and variables
    
    var leetcodeManager = LeetcodeManager()
    
    // view did load
    
    override func viewDidLoad() {
        
        semiProgress.trackColor = .lightGray
        semiProgress.progressColor = .systemYellow
        semiProgress.progress = 0.5
//        leetcodeManager.delegate = self
    }

}

//MARK: - UserAuthDelegate

extension ViewController : UserAuthDelegate{
    func searchUsername(username: String) {
        <#code#>
    }
    
    
}


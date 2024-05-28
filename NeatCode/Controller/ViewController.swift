//
//  ViewController.swift
//  NeatCode
//
//  Created by Ayush Rajpal on 28/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var semiProgress: SemiCircularProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        semiProgress.trackColor = .lightGray
        semiProgress.progressColor = .systemYellow
        semiProgress.progress = 0.5
    }


}


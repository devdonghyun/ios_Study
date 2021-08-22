//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 안동현 on 2021/08/17.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var result = ""
    var tip = 10
    var numOfPeople = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingLabel.text = "Split between \(numOfPeople), with \(tip)% tip."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

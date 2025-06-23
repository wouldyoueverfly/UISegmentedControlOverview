//
//  ViewController.swift
//  UISegmentedControlOverview
//
//  Created by Ruslan Khusainov on 23.06.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.isHidden = true
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
    }


    @IBAction func segmentAction(_ sender: Any) {
        
        label.isHidden = false
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "First"
            label.textColor = .magenta
        case 1:
            label.text = "Second"
            label.textColor = .cyan
        case 2:
            label.text = "Third"
            label.textColor = .orange
        default:
            print("No text")
        }
    }
}


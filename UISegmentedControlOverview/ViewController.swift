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
    
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = String(format: "%.0f", slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .cyan
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
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = String(format: "%.0f", sender.value)
        
        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value))
    }
}


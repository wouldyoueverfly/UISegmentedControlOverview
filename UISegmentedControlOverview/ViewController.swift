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
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 1
        
        label.text = String(format: "%.2f", slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .cyan
        
        datePicker.locale = Locale(identifier: "ru_RU")
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
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        guard handleTextField() else { return }
        
        label.text = textField.text
        textField.text = ""
    }
    
    
    @IBAction func pickerAction(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let date = dateFormatter.string(from: sender.date)
        
        label.text = date
    }
    
    private func handleTextField() -> Bool {
        guard textField.text?.isEmpty == false else { return false }
        
        if textField.text?.contains(where: { !$0.isLetter }) ?? false == true {
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your name", preferredStyle: .alert)
            let buttonAction = UIAlertAction(title: "OK", style: .default)
            
            alert.addAction(buttonAction)
            present(alert, animated: true)
            return false
        }
        return true
    }
}


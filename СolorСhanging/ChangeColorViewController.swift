//
//  ChangeColorViewController.swift
//  СolorСhanging
//
//  Created by Igor Makeev on 04.06.2021.
//

import UIKit

class ChangeColorViewController: UIViewController{
    
    @IBOutlet weak var mixColor: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mixColor.layer.cornerRadius = 15
    
        setColor()
        setValueLabel(for: redValueLabel, greenValueLabel, blueValueLabel)
        setValueTextField(for: redTextField, greenTextField, blueTextField)
        
    }
    
    private func setColor(){
        mixColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0)
    }
    
    private func setValueLabel(for labels: UILabel...){
        labels.forEach { label in
            switch label {
            case redValueLabel:
                label.text = string(from: redSlider)
            case greenValueLabel:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValueTextField(for textFields: UITextField...){
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                textField.text = string(from: redSlider)
            case greenTextField:
                textField.text = string(from: greenSlider)
            default:
                textField.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @IBAction func actionSlider(_ sender: UISlider) {
        setColor()
        setValueLabel(for: redValueLabel,greenValueLabel, blueValueLabel)
        setValueTextField(for: redTextField, greenTextField, blueTextField)
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func redTextFieldAction(_ sender: UITextField) {
        redValueLabel.text = redTextField.text
        redSlider.value = Float(redTextField.text!)!
    }
    
    @IBAction func greenTextFieldAction(_ sender: UITextField) {
        greenValueLabel.text = greenTextField.text
        greenSlider.value = Float(greenTextField.text!)!
    }
    
    @IBAction func blueTextFieldAction(_ sender: UITextField) {
        blueValueLabel.text = blueTextField.text
        blueSlider.value = Float(blueTextField.text!)!
    }
}
extension ChangeColorViewController{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

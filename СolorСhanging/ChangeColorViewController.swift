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
    
    var delegate: ColorDelegate?
    var colorViewController: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mixColor.layer.cornerRadius = 15
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        
        mixColor.backgroundColor = colorViewController
        
        setValueSlider()
        setValueLabel()
        setValueTextField()
        
        addDoneButton(redTextField)
        addDoneButton(greenTextField)
        addDoneButton(blueTextField)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    @IBAction func actionSlider(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redValueLabel.text = mackValue(from: sender)
            redTextField.text = mackValue(from: sender)
        case greenSlider:
            greenValueLabel.text = mackValue(from: sender)
            greenTextField.text = mackValue(from: sender)
        case blueSlider:
            blueValueLabel.text = mackValue(from: sender)
            blueTextField.text = mackValue(from: sender)
        default:
            break
        }
        setColor()
    }
    
    func setColor(){
        let newColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0)
        
        mixColor.backgroundColor = newColor
        delegate?.setColor(newColor)
    }
    
    private func setValueLabel() {
        redValueLabel.text = mackValue(from: redSlider)
        greenValueLabel.text = mackValue(from: greenSlider)
        blueValueLabel.text = mackValue(from: blueSlider)
    }
    
    private func setValueTextField() {
        redTextField.text = mackValue(from: redSlider)
        greenTextField.text = mackValue(from: greenSlider)
        blueTextField.text = mackValue(from: blueSlider)
    }
    
    private func setValueSlider(){
        let colorForSlider = CIColor(color: colorViewController)
        
        redSlider.value = Float(colorForSlider.red)
        greenSlider.value = Float(colorForSlider.green)
        blueSlider.value = Float(colorForSlider.blue)
    }
    
    private func mackValue(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @IBAction func doneAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
extension ChangeColorViewController: UITextFieldDelegate{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        redSlider.value = Float(redTextField.text ?? "0")!
        greenSlider.value = Float(greenTextField.text ?? "0")!
        blueSlider.value = Float(blueTextField.text ?? "0")!
        redValueLabel.text = redTextField.text
        greenValueLabel.text = greenTextField.text
        blueValueLabel.text = blueTextField.text
    }

}
extension ChangeColorViewController{
    private func addDoneButton(_ textField: UITextField){
        let numberToolbar = UIToolbar()
        textField.inputAccessoryView = numberToolbar
        numberToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        numberToolbar.items = [flexBarButton, doneButton]
    }
    @objc private func didTapDone(){
        view.endEditing(true)
    }
}

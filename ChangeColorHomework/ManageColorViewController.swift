//
//  ViewController.swift
//  ChangeColorHomework
//
//  Created by Grigoriy Kostyukhin on 11.02.2025.
//

import UIKit

class ManageColorViewController: UIViewController, UITextFieldDelegate {
    // MARK: - IB Outlets and properties
    @IBOutlet var changingColorView: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    
    @IBOutlet var redColorTextField: UITextField!
    @IBOutlet var blueColorTextField: UITextField!
    @IBOutlet var greenColorTextField: UITextField!
    
    var coloredView: UIColor!
    var delegate: ManageColorViewControllerDelegate!
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        changingColorView.backgroundColor = coloredView
        setupSlider(for: redColorSlider)
        setupSlider(for: blueColorSlider)
        setupSlider(for: greenColorSlider)
        
        redColorSlider.minimumTrackTintColor = .red
        blueColorSlider.minimumTrackTintColor = .blue
        greenColorSlider.minimumTrackTintColor = .green
        
        var redColor: CGFloat = 0
        var greenColor: CGFloat = 0
        var blueColor: CGFloat = 0
        
        changingColorView.backgroundColor?.getRed(&redColor,
                                                  green: &greenColor,
                                                  blue: &blueColor,
                                                  alpha: nil)
        
        redColorSlider.value = Float(redColor)
        blueColorSlider.value = Float(blueColor)
        greenColorSlider.value = Float(greenColor)
        
        redColorLabel.text = string(for: redColorSlider)
        blueColorLabel.text = string(for: blueColorSlider)
        greenColorLabel.text = string(for: greenColorSlider)
        
        redColorTextField.text = string(for: redColorSlider)
        blueColorTextField.text = string(for: blueColorSlider)
        greenColorTextField.text = string(for: greenColorSlider)
        
        changingColorView.layer.cornerRadius = 20
        setColor()
    }
    
    // MARK: - IB Actions
    @IBAction func redColorSliderAction() {
        redColorLabel.text = string(for: redColorSlider)
        redColorTextField.text = string(for: redColorSlider)
        setColor()
    }
    
    @IBAction func blueColorSliderAction() {
        blueColorLabel.text = string(for: blueColorSlider)
        blueColorTextField.text = string(for: blueColorSlider)
        setColor()
    }
    
    @IBAction func greenColorSliderAction() {
        greenColorLabel.text = string(for: greenColorSlider)
        greenColorTextField.text = string(for: greenColorSlider)
        setColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.changeColor(changingColorView.backgroundColor!)
        dismiss(animated: true)
    }
    
    @IBAction func redColorTextFieldAction() {
        actionOfTextFields(
            for: redColorTextField,
            change: redColorLabel,
            change: redColorSlider
        )
    }
    
    @IBAction func blueColorTextFieldAction() {
        actionOfTextFields(
            for: blueColorTextField,
            change: blueColorLabel,
            change: blueColorSlider
        )
    }
    
    @IBAction func greenColorTextFieldAction() {
        actionOfTextFields(
            for: greenColorTextField,
            change: greenColorLabel,
            change: greenColorSlider
        )
    }
    
    // MARK: - Private methods
    private func setColor() {
        changingColorView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value),
                                                    green: CGFloat(greenColorSlider.value),
                                                    blue: CGFloat(blueColorSlider.value),
                                                    alpha: 1)
    }
    
    private func string(for slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setupSlider(for slider: UISlider) {
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.maximumTrackTintColor = .gray
    }
    
    private func actionOfTextFields(for textField: UITextField,
                                    change label: UILabel,
                                    change slider: UISlider) {
        if textField.text == nil {
            label.text = "0"
            textField.text = "0"
            slider.value = 0
            setColor()
        } else if textField.text! > "1" {
            label.text = "1"
            textField.text = "1"
            slider.value = 1
            setColor()
        } else if textField.text! < "0" {
            label.text = "0"
            textField.text = "0"
            slider.value = 0
            setColor()
        } else {
            textField.text = textField.text?.replacingOccurrences(of: ",", with: ".")
            label.text = textField.text
            slider.value = Float(label.text!)!
            setColor()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

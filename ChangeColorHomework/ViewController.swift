//
//  ViewController.swift
//  ChangeColorHomework
//
//  Created by Grigoriy Kostyukhin on 11.02.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var changingColorView: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider(for: redColorSlider)
        setupSlider(for: blueColorSlider)
        setupSlider(for: greenColorSlider)
        
        redColorSlider.minimumTrackTintColor = .red
        blueColorSlider.minimumTrackTintColor = .blue
        greenColorSlider.minimumTrackTintColor = .green
        
        redColorLabel.text = string(for: redColorSlider)
        blueColorLabel.text = string(for: blueColorSlider)
        greenColorLabel.text = string(for: greenColorSlider)
        
        changingColorView.layer.cornerRadius = 20
        setColor()
    }
    
    @IBAction func redColorSliderAction() {
        redColorLabel.text = string(for: redColorSlider)
        setColor()
    }
    
    @IBAction func blueColorSliderAction() {
        blueColorLabel.text = string(for: blueColorSlider)
        setColor()
    }
    
    @IBAction func greenColorSliderAction() {
        greenColorLabel.text = string(for: greenColorSlider)
        setColor()
    }
    
    private func setColor() {
        changingColorView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value),
                                                    green: CGFloat(greenColorSlider.value),
                                                    blue: CGFloat(blueColorSlider.value),
                                                    alpha: 1)
    }
    
    private func string(for slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setMinimumAndMaximumValue(for slider: UISlider) {
        slider.minimumValue = 0
        slider.maximumValue = 1
    }
    
    private func setupSlider(for slider: UISlider) {
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.maximumTrackTintColor = .gray
        slider.value = 0
    }
}

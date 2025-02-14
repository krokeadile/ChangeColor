//
//  MainScreenViewController.swift
//  ChangeColorHomework
//
//  Created by Grigoriy Kostyukhin on 26.02.2025.
//

import UIKit

protocol ManageColorViewControllerDelegate {
    func changeColor(_ color: UIColor)
}

class MainScreenViewController: UIViewController {

    @IBOutlet var mainColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let manageColorVC = segue.destination as! ManageColorViewController
        manageColorVC.coloredView = mainColorView.backgroundColor
        manageColorVC.delegate = self
    }
}

extension MainScreenViewController: ManageColorViewControllerDelegate {
    func changeColor(_ color: UIColor) {
        mainColorView.backgroundColor = color
    }
}

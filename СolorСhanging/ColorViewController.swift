//
//  ColorViewController.swift
//  СolorСhanging
//
//  Created by Igor Makeev on 04.06.2021.
//

import UIKit

class ColorViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as! ChangeColorViewController
        colorVC.colorViewController = view.backgroundColor
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
        let colorVC = segue.source as! ChangeColorViewController
        colorVC.delegate = self
        colorVC.setColor()
    }
}
extension ColorViewController: ColorDelegate{
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

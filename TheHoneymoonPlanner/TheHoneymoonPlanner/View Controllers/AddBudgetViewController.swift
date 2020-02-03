//
//  AddToSettingsViewController.swift
//  TheHoneymoonPlanner
//
//  Created by Jonalynn Masters on 1/31/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

import UIKit
import CoreData

protocol addBudgetViewControllerDelegate: AnyObject {
    func budgetHasBeenUpdated()
}

class AddBudgetViewController: UIViewController {
    
    weak var delegate: addBudgetViewControllerDelegate?
    
    @IBOutlet weak var budgetSlider: UISlider!
    @IBOutlet weak var budgetValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider){
        let sliderValue = Double(sender.value)
        print(sliderValue)
        let roundedValue = round(sliderValue * 1.00) * 1000
        budgetValueLabel.text = currencyFormatter.string(from: NSNumber(value: roundedValue))

    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        saveBudgetToCoreData()
        
        delegate?.budgetHasBeenUpdated()
        self.dismiss(animated: true, completion: nil)
    }
    
    func roundedSliderValue() -> Double {
        let sliderValue = Double(budgetSlider.value * 1.00)
        let roundedValue = round(sliderValue) * 1000
        print(roundedValue)
        
        return roundedValue

    }
    
    func saveBudgetToCoreData() {
        UserDefaults.standard.setValue(roundedSliderValue(), forKey: "budgetTotal")
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

extension Double {
     static let twoFractionDigits: NumberFormatter = {
         let formatter = NumberFormatter()
         formatter.numberStyle = .decimal
         return formatter
     }()
     var formatted: String {
         return Double.twoFractionDigits.string(for: self) ?? ""
     }
 }

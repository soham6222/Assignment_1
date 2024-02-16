import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var measurementSegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set placeholder text for height and weight text fields
                heightTextField.placeholder = "Height"
                weightTextField.placeholder = "Weight"

    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        guard let heightText = heightTextField.text, let height = Double(heightText),
            let weightText = weightTextField.text, let weight = Double(weightText) else {
                resultLabel.text = "Invalid input"
                return
        }
        
        if height <= 0 || weight <= 0 {
            resultLabel.text = "Height and weight must be positive"
            return
        }
        
        var bmi: Double
        if measurementSegmentedControl.selectedSegmentIndex == 0 {
            // SI System (kg, cm)
            bmi = weight / pow(height / 100, 2)
        } else {
            // Imperial System (lb, in)
            bmi = (weight * 703) / pow(height, 2)
        }
        
        var bmiCategory: String
        if bmi < 18.5 {
            bmiCategory = "Underweight"
        } else if bmi < 25 {
            bmiCategory = "Normal"
        } else if bmi < 30 {
            bmiCategory = "Overweight"
        } else {
            bmiCategory = "Obese"
        }
        
        resultLabel.text = String(format: "BMI: %.2f - %@", bmi, bmiCategory)
    }
}

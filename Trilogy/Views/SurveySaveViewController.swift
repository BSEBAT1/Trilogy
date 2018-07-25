//
//  SurveySaveViewController.swift
//  Trilogy
//
//  Created by macbook pro on 7/23/18.
//  Copyright © 2018 Trilogy. All rights reserved.
//

import UIKit

class SurveySaveViewController: UIViewController, UITextFieldDelegate {

    let surveyResults = SurveyResultsClass()

    @IBOutlet weak var datePicker: UIDatePicker!

    @IBOutlet weak var unchecked1: UIImageView!

    @IBOutlet weak var unchecked4: UIImageView!

    @IBOutlet weak var unchecked3: UIImageView!

    @IBOutlet weak var unchecked2: UIImageView!
    
    @IBOutlet weak var saveSurveyTitle: UITextField!

    @IBOutlet weak var unckeck5: UIImageView!

    @IBOutlet weak var unckeck6: UIImageView!

    @IBOutlet weak var uncheck7: UIImageView!

    @IBOutlet weak var uncheck8: UIImageView!

    var office = false

    var mostly = false

    var mix = false

    var co = false

    var oneyear = false

    var two = false

    var three = false

    var five = false

    override func viewDidLoad() {

        super.viewDidLoad()

        saveSurveyTitle.delegate = self

        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SurveySaveViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)

    }

    @IBAction func officeIntensive(_ sender: Any) {

        if office {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.unchecked1.image = imagenamed

                self.unchecked1.setNeedsDisplay()

            }
            surveyResults.dictionary.updateValue("0", forKey: "Office Intensive")

               office = false

        } else {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.unchecked1.image = imagenamed

                self.unchecked1.setNeedsDisplay()

            }
            surveyResults.dictionary.updateValue("1", forKey: "Office Intensive")

            office = true
        }

    }

    @IBAction func mostlyOpen(_ sender: Any) {

        if mostly {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.unchecked2.image = imagenamed

                self.unchecked2.setNeedsDisplay()

            }

            surveyResults.dictionary.updateValue("0", forKey: "Mostly Open")

            mostly = false

        } else {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.unchecked2.image = imagenamed

                self.unchecked2.setNeedsDisplay()

            }

            surveyResults.dictionary.updateValue("1", forKey: "Mostly Open")

            mostly = true

        }

    }

    @IBAction func mixture(_ sender: Any) {

        if mix {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.unchecked3.image = imagenamed

                self.unchecked3.setNeedsDisplay()

            }

            mix = false

        } else {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.unchecked3.image = imagenamed

                self.unchecked3.setNeedsDisplay()

            }

            mix = true
        }

    }

    @IBAction func coWorking(_ sender: Any) {

        if co {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.unchecked4.image = imagenamed

                self.unchecked4.setNeedsDisplay()

            }

            co = false

        } else {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.unchecked4.image = imagenamed

                self.unchecked4.setNeedsDisplay()

            }

            co = true
        }

    }

    @IBAction func oneYear(_ sender: Any) {

        if oneyear {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.unckeck5.image = imagenamed

                self.unckeck5.setNeedsDisplay()

            }

            oneyear = false

        } else {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.unckeck5.image = imagenamed

                self.unckeck5.setNeedsDisplay()

            }

            oneyear = true

        }

    }

    @IBAction func twoYears(_ sender: Any) {

        if two {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.unckeck6.image = imagenamed

                self.unckeck6.setNeedsDisplay()

            }

            two = false

        } else {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.unckeck6.image = imagenamed

                self.unckeck6.setNeedsDisplay()

            }

            two = true

        }

    }

    @IBAction func threeYears(_ sender: Any) {

        if three {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.uncheck7.image = imagenamed

                self.uncheck7.setNeedsDisplay()

            }

            three = false

        } else {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.uncheck7.image = imagenamed

                self.uncheck7.setNeedsDisplay()

            }

            three = true

        }
    }

    @IBAction func fiveYears(_ sender: Any) {

        if five {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.uncheck8.image = imagenamed

                self.uncheck8.setNeedsDisplay()

            }

            five = false

        } else {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.uncheck8.image = imagenamed

                self.uncheck8.setNeedsDisplay()

            }

            five = true

        }

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

       self.saveSurveyTitle.resignFirstResponder()
        //or
        //self.view.endEditing(true)
        return true
    }


    @IBAction func datePickerChanged(_ sender: Any) {

        let date = datePicker.date

        let dateSeconds = date.timeIntervalSince1970

        SurveyResultsClass.shared.dictionary.updateValue(String(dateSeconds), forKey: "start_date")
    }

    //Calls this function when the tap is recognized.
  @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}

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

    }

    @IBAction func officeIntensive(_ sender: Any) {

        if office {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.unchecked1.image = imagenamed

                self.unchecked1.setNeedsDisplay()

            }

               office = false

        } else {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.unchecked1.image = imagenamed

                self.unchecked1.setNeedsDisplay()

            }

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

            mostly = false

        } else {

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.unchecked2.image = imagenamed

                self.unchecked2.setNeedsDisplay()

            }

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

    }

    @IBAction func twoYears(_ sender: Any) {

    }

    @IBAction func threeYears(_ sender: Any) {

    }

    @IBAction func fiveYears(_ sender: Any) {


    }



    @IBAction func datePickerChanged(_ sender: Any) {

        let date = datePicker.date

        let dateSeconds = date.timeIntervalSince1970

        print(dateSeconds)
    }

}

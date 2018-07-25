//
//  SliderViewController.swift
//  Trilogy
//
//  Created by macbook pro on 7/18/18.
//  Copyright © 2018 Trilogy. All rights reserved.
//

import UIKit
import RangeSeekSlider

class SliderViewController: UIViewController, UITextFieldDelegate {

     let slider = RangeSeekSlider()

    let mincontainer = UITextField()

    let maxcontainer = UITextField()

    let label = UILabel()

    let slider2 = RangeSeekSlider()

    let mincontainerPrice = UITextField()

    let maxcontainerPrice = UITextField()

    let mincontainerTotal = UITextField()

    let maxcontainerTotal = UITextField()

    let surveyResults = SurveyResultsClass.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "      SIZE (RENTABLE SQ FEET)"

        label.textColor = UIColor.white

        label.font = UIFont(name: "Helvetica", size:20)

        label.backgroundColor = UIColor(red:0.24, green:0.33, blue:0.40, alpha:1.0)

        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)

        slider.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(slider)

        slider.minDistance = 10

        slider.lineHeight = 10

        slider.handleDiameter = 20

        slider.tintColor = UIColor(red:0.56, green:0.66, blue:0.82, alpha:1.0)

        slider.handleColor = UIColor(red:0.45, green:0.64, blue:0.80, alpha:1.0)

        slider.colorBetweenHandles = UIColor.gray

        slider.minValue = 0

        slider.maxValue = 10000

        slider.selectedMinValue = 100

        slider.selectedMaxValue = 1000
        
        print(slider.selectedMinValue)

        print(slider.selectedMaxValue)

        slider.step = 10

        slider.enableStep = true

        slider.addTarget(self, action:Selector("slid"),for: UIControlEvents.allEvents)

        slider.addTarget(self, action:Selector("slidT"),for: UIControlEvents.allEvents)

         slider.addTarget(self, action:Selector("slidL"),for: UIControlEvents.allEvents)

        mincontainer.text = "100 RSF"

        maxcontainer.text = "1000 RSF"

        mincontainer.keyboardType = UIKeyboardType.numberPad

        maxcontainer.keyboardType = UIKeyboardType.numberPad

        mincontainer.allowsEditingTextAttributes = false

        maxcontainer.allowsEditingTextAttributes = false 

        mincontainer.delegate = self

        maxcontainer.delegate = self

        maxcontainer.font = UIFont(name: "Helvetica-Bold", size:20)

        mincontainer.font = UIFont(name: "Helvetica-Bold", size:20)

        view.addSubview(maxcontainer)

        view.addSubview(mincontainer)

        maxcontainer.translatesAutoresizingMaskIntoConstraints = false

        mincontainer.translatesAutoresizingMaskIntoConstraints = false

        let label2 = UILabel()

        label2.translatesAutoresizingMaskIntoConstraints = false

        label2.text = "RENTAL-RATE RANGE PER SF"

        label2.textAlignment = .center

        label2.font = UIFont(name: "Helvetica-Light", size:18)

        view.addSubview(label2)

        let label3 = UILabel()

        label3.text = "      BUDGET"

        label3.textColor = UIColor.white

        label3.font = UIFont(name: "Helvetica", size:20)

        label3.backgroundColor = UIColor(red:0.24, green:0.33, blue:0.40, alpha:1.0)

        label3.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label3)

        let label4 = UILabel()

        label4.translatesAutoresizingMaskIntoConstraints = false

        label4.text = "RENTAL-RATE RANGE PER SF"

        label4.textAlignment = .center

        label4.font = UIFont(name: "Helvetica-Light", size:18)

        view.addSubview(label4)

        view.addSubview(slider2)

        slider2.minDistance = 10

        slider2.lineHeight = 10

        slider2.handleDiameter = 20

        slider2.tintColor = UIColor(red:0.56, green:0.66, blue:0.82, alpha:1.0)

        slider2.handleColor = UIColor(red:0.45, green:0.64, blue:0.80, alpha:1.0)

        slider2.colorBetweenHandles = UIColor.gray

        slider2.minValue = 0

        slider2.maxValue = 300

        slider2.selectedMinValue = 49

        slider2.selectedMaxValue = 60

        print(slider2.selectedMinValue)

        print(slider2.selectedMaxValue)

        slider2.translatesAutoresizingMaskIntoConstraints = false

        slider2.addTarget(self, action:Selector("slid2"),for: UIControlEvents.allEvents)

        slider2.addTarget(self, action:Selector("slidT"),for: UIControlEvents.allEvents)

        slider2.addTarget(self, action:Selector("slidL"),for: UIControlEvents.allEvents)

        mincontainerPrice.keyboardType = UIKeyboardType.numberPad

        maxcontainerPrice.keyboardType = UIKeyboardType.numberPad

        mincontainerPrice.allowsEditingTextAttributes = false

        maxcontainerPrice.allowsEditingTextAttributes = false

        mincontainerPrice.delegate = self

        maxcontainerPrice.delegate = self

        maxcontainerPrice.font = UIFont(name: "Helvetica-Bold", size:20)

        mincontainerPrice.font = UIFont(name: "Helvetica-Bold", size:20)

        maxcontainerPrice.translatesAutoresizingMaskIntoConstraints = false

        mincontainerPrice.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(maxcontainerPrice)

        view.addSubview(mincontainerPrice)

        maxcontainerPrice.text = "$49"

        mincontainerPrice.text = "$60"

        let label5 = UILabel()

        label5.translatesAutoresizingMaskIntoConstraints = false

        label5.text = "PROJECTED MONTHLY RENT"

        label5.textAlignment = .center

        label5.font = UIFont(name: "Helvetica-Light", size:15)

        view.addSubview(label5)

        mincontainerTotal.keyboardType = UIKeyboardType.numberPad

        maxcontainerTotal.keyboardType = UIKeyboardType.numberPad

        mincontainerTotal.allowsEditingTextAttributes = false

        maxcontainerTotal.allowsEditingTextAttributes = false

        mincontainerTotal.delegate = self

        maxcontainerTotal.delegate = self

        maxcontainerTotal.font = UIFont(name: "Helvetica-Bold", size:20)

        mincontainerTotal.font = UIFont(name: "Helvetica-Bold", size:20)

        maxcontainerTotal.translatesAutoresizingMaskIntoConstraints = false

        mincontainerTotal.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(maxcontainerTotal)

        view.addSubview(mincontainerTotal)

        maxcontainerTotal.text = "$19995"

        mincontainerTotal.text = "$12250"


        let views: [String: AnyObject] = ["slider": slider, "min": mincontainer, "max": maxcontainer, "label": label, "label2": label2, "label3": label3, "label4": label4, "slider2": slider2, "max2": maxcontainerPrice, "min2": mincontainerPrice, "label5": label5, "mint": mincontainerTotal, "maxt": maxcontainerTotal]

        let hori =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-25-[slider]-25-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let hori2 =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-25-[min]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let vert2 =  NSLayoutConstraint.constraints(withVisualFormat:"V:[slider]-[min]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

         let vert3 =  NSLayoutConstraint.constraints(withVisualFormat:"V:[slider]-[max]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

         let vert4 =  NSLayoutConstraint.constraints(withVisualFormat:"H:[max]-35-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let hori5 =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-0-[label]-0-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

         let hori6 =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-20-[label2]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let hori7 =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-0-[label3]-0-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let vert5 =  NSLayoutConstraint.constraints(withVisualFormat:"V:|-[label(>=45)]-15-[label2]-8-[slider]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let hori8 =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-20-[label4]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let vert6 =  NSLayoutConstraint.constraints(withVisualFormat:"V:[max]-50-[label3(>=45)]-15-[label4]-[slider2]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

          let hori9 =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-25-[slider2]-25-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let hori10 =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-25-[min2]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let vert11 =  NSLayoutConstraint.constraints(withVisualFormat:"V:[slider2]-[min2]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let vert12 =  NSLayoutConstraint.constraints(withVisualFormat:"V:[slider2]-[max2]-10-[label5]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let vert13 =  NSLayoutConstraint.constraints(withVisualFormat:"H:[max2]-35-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let vert14 =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-10-[label5]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let hori12 =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-25-[mint]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let vert15 =  NSLayoutConstraint.constraints(withVisualFormat:"V:[label5]-[mint]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        let vert16 =  NSLayoutConstraint.constraints(withVisualFormat:"V:[label5]-[maxt]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

         let hori15 =  NSLayoutConstraint.constraints(withVisualFormat:"H:[mint]-10-[maxt]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)

        view.addConstraints(hori)

        view.addConstraints(hori2)

        view.addConstraints(vert2)

        view.addConstraints(vert3)

        view.addConstraints(vert4)

        view.addConstraints(hori5)

        view.addConstraints(vert5)

        view.addConstraints(hori6)

        view.addConstraints(hori7)

        view.addConstraints(vert6)

        view.addConstraints(hori8)

        view.addConstraints(hori9)

        view.addConstraints(hori10)

        view.addConstraints(vert11)

        view.addConstraints(vert12)

        view.addConstraints(vert13)

        view.addConstraints(vert14)

        view.addConstraints(vert15)

        view.addConstraints(hori12)

        view.addConstraints(vert16)

        view.addConstraints(hori15)

    }

 @objc func slid () {

    DispatchQueue.main.async {

        let slidervaluemin = Int(self.slider.selectedMinValue)

        let slidermax = Int(self.slider.selectedMaxValue)

        self.mincontainer.text = String(slidervaluemin)+" RSF"

        self.maxcontainer.text = String(slidermax)+" RSF"
    }
     self.surveyResults.dictionary.updateValue("area_size_start", forKey: self.mincontainer.text!)

     self.surveyResults.dictionary.updateValue("area_size_end", forKey: self.maxcontainer.text!)

    }

    @objc func slid2 () {

        DispatchQueue.main.async {

            let slidervaluemin = Int(self.slider2.selectedMinValue)

            let slidermax = Int(self.slider2.selectedMaxValue)

            self.mincontainerPrice.text = "$ " + String(slidervaluemin)

            self.maxcontainerPrice.text = "$ " + String(slidermax)

        }

        self.surveyResults.dictionary.updateValue("budget_start", forKey: self.mincontainerPrice.text!)

        self.surveyResults.dictionary.updateValue("budget_end", forKey: self.maxcontainerPrice.text!)
    }

    @objc func slidT () {

        DispatchQueue.main.async {

            let slidervaluemin = Int(self.slider.selectedMinValue)

            let slider2valuemin = Int(self.slider2.selectedMinValue)

            let minValue = slidervaluemin * slider2valuemin / 12

            self.mincontainerTotal.text = "$ " + String(minValue) + " to "


        }
    }

    @objc func slidL () {

        DispatchQueue.main.async {

            let slidervaluemin = Int(self.slider.selectedMaxValue)

            let slider2valuemin = Int(self.slider2.selectedMaxValue)

            let minValue = slidervaluemin * slider2valuemin / 12

            self.maxcontainerTotal.text = "$ " + String(minValue)

        }
    }
    
}


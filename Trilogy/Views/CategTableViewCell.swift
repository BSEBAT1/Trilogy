//
//  CategTableViewCell.swift
//  Trilogy
//
//  Created by macbook pro on 7/12/18.
//  Copyright © 2018 Trilogy. All rights reserved.
//

import UIKit
import QuartzCore

class CategTableViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var location1: UIButton!

    @IBOutlet weak var location2: UIButton!

    @IBOutlet weak var location3: UIButton!

    @IBOutlet weak var loctation4: UIButton!

    @IBOutlet weak var location5: UIButton!

    @IBOutlet weak var location6: UIButton!

    @IBOutlet weak var location7: UIButton!

    @IBOutlet weak var location8: UIButton!

    @IBOutlet weak var containerViewd: UIView!

    @IBOutlet var firstImage: UIImageView!

    @IBOutlet var secondImage: UIImageView!

    @IBOutlet var thirdImage: UIImageView!

    @IBOutlet var fourthImage: UIImageView!

    @IBOutlet var fifthImage: UIImageView!

    @IBOutlet var sixthImage: UIImageView!

    @IBOutlet var seventhImage: UIImageView!
    
    @IBOutlet var eightImage: UIImageView!

    private let expandedViewIndex: Int = 1

    let surveyResults = SurveyResultsClass()

    var arrayOptions = Array<Any>()

    enum CellState {
        case collapsed
        case expanded
    }

    var selected1 = false
    var selected2 = false
    var selected3 = false
    var selected4 = false
    var selected5 = false
    var selected6 = false
    var selected7 = false
    var selected8 = false

    var selectAll = false

    var state: CellState = .collapsed {
        didSet {
            toggle()
        }
    }

    override func awakeFromNib() {
        selectionStyle = .none
        
    }

    func update(name: String, buttons: Array<Any>) {

        titleLabel.text = name

        arrayOptions = buttons

        let button: [UIButton] = [location1, location2, location3, loctation4, location5, location6, location7, location8]

        let images: [UIImageView] = [firstImage, secondImage, thirdImage, fourthImage, fifthImage, sixthImage, seventhImage, eightImage]

        var index = 0

        while index < buttons.count {

            let buttonIndex = button[index]

            buttonIndex.isHidden = false

            let title = buttons[index] as! String

            buttonIndex.setTitle(title, for: .normal)

           // buttonIndex.titleLabel?.adjustsFontSizeToFitWidth = true

            buttonIndex.sizeToFit()

            index = index+1

        }

        let strings = ["firstLocation:", "secondLocation:", "thirdLocation:", "fourthLocation:", "fifthLocation:", "sixthLocation:", "seventhLocation:", "eightLocation:"]

        var secondindex = 0

        while secondindex < buttons.count {

            let imageview = images[secondindex]

            let string = strings[secondindex]

            let singleTap = UITapGestureRecognizer(target: self, action: Selector(string))

            singleTap.numberOfTapsRequired = 1

            imageview.isHidden = false

            imageview.isUserInteractionEnabled = true
            imageview.addGestureRecognizer(singleTap)


            secondindex = secondindex+1

        }

    }

    private func toggle() {
        
        stackView.arrangedSubviews[expandedViewIndex].isHidden = stateIsCollapsed()
        
    }

    private func stateIsCollapsed() -> Bool {

        return state == .collapsed
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepareForReuse() {

        let buttons: [UIButton] = [location1, location2, location3, loctation4, location5, location6, location7, location8]

        for views in buttons {

            views.isHidden = true

        }

        let images: [UIImageView] = [firstImage, secondImage, thirdImage, fourthImage, fifthImage, sixthImage, seventhImage, eightImage]

        for imageView in images {

            imageView.isHidden = true
        }

    }
    @IBAction func firstLocation(_ sender: Any) {

        if selected1 || selectAll {
            selected1 = false

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.firstImage.image = imagenamed

                self.firstImage.setNeedsDisplay()

            }

            let string = arrayOptions[0]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("0", forKey: stringType)
                print(stringType + "unchecked")
            }

        } else {
            selected1 = true

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.firstImage.image = imagenamed

                self.firstImage.setNeedsDisplay()

            }

            let string = arrayOptions[0]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("1", forKey: stringType)

                print(stringType + "checked")
            }
        }

    }

    @IBAction func secondLocation(_ sender: Any) {

        if selected2 {

            selected2 = false

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.secondImage.image = imagenamed

                self.secondImage.setNeedsDisplay()

            }

            let string = arrayOptions[1]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("0", forKey: stringType)
            }

        } else {
            selected2 = true

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.secondImage.image = imagenamed

                self.secondImage.setNeedsDisplay()

            }

            let string = arrayOptions[1]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("1", forKey: stringType)
            }

        }
    }

    @IBAction func thirdLocation(_ sender: Any) {

        if arrayOptions[2] as! String == "Select ALL" {

            selectAll(paramater: 2)

            let string = arrayOptions[2]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("0", forKey: stringType)
            }

        }

        if selected3 {

            selected3 = false

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.thirdImage.image = imagenamed

                self.thirdImage.setNeedsDisplay()

            }

            let string = arrayOptions[2]

            if let stringType = string as? String {
                print(stringType)
            }

        } else {
            selected3 = true

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.thirdImage.image = imagenamed

                self.thirdImage.setNeedsDisplay()

            }

            let string = arrayOptions[2]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("1", forKey: stringType)
            }
        }
    }

    @IBAction func fourthLocation(_ sender: Any) {

        if arrayOptions[3] as! String == "Select ALL" {

            selectAll(paramater: 3)

        }

        if selected4 {

            selected4 = false

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.fourthImage.image = imagenamed

                self.fourthImage.setNeedsDisplay()

            }

            let string = arrayOptions[3]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("0", forKey: stringType)
            }

        } else {
            selected4 = true

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.fourthImage.image = imagenamed

                self.fourthImage.setNeedsDisplay()

            }

            let string = arrayOptions[3]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("1", forKey: stringType)
            }
        }
    }
    @IBAction func fifthLocation(_ sender: Any) {

        if selected5 {

            selected5 = false

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.fifthImage.image = imagenamed

                self.fifthImage.setNeedsDisplay()

            }

            let string = arrayOptions[4]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("0", forKey: stringType)
            }

        } else {
            selected5 = true

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.fifthImage.image = imagenamed

                self.fifthImage.setNeedsDisplay()

            }

            let string = arrayOptions[4]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("1", forKey: stringType)
            }
        }
    }

    @IBAction func sixthLocation(_ sender: Any) {

        if selected6 {

            selected6 = false

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.sixthImage.image = imagenamed

                self.sixthImage.setNeedsDisplay()

            }

            let string = arrayOptions[5]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("0", forKey: stringType)
            }

        } else {
            selected6 = true

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.sixthImage.image = imagenamed

                self.sixthImage.setNeedsDisplay()

            }

            let string = arrayOptions[5]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("1", forKey: stringType)
            }
        }

    }

    @IBAction func seventhLocation(_ sender: Any) {

        if arrayOptions[6] as! String == "Select ALL" {

           selectAll(paramater: 6)

        }

        if selected7 {

            selected7 = false

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.seventhImage.image = imagenamed

                self.seventhImage.setNeedsDisplay()

            }

            let string = arrayOptions[6]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("0", forKey: stringType)
            }

        } else {
            selected7 = true

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.seventhImage.image = imagenamed

                self.seventhImage.setNeedsDisplay()

            }

            let string = arrayOptions[6]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("1", forKey: stringType)
            }
        }
    }

    @IBAction func eightLocation(_ sender: Any) {

        if arrayOptions[7] as! String == "Select ALL" {

            selectAll(paramater: 7)

        }

        if selected8 {

            selected8 = false

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "uncheck" )

                self.eightImage.image = imagenamed

                self.eightImage.setNeedsDisplay()

            }

            let string = arrayOptions[7]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("0", forKey: stringType)
            }

        } else {
            selected8 = true

            DispatchQueue.main.async {

                let imagenamed = UIImage.init(named: "check" )

                self.eightImage.image = imagenamed

                self.eightImage.setNeedsDisplay()

            }

            let string = arrayOptions[7]

            if let stringType = string as? String {
                surveyResults.dictionary.updateValue("1", forKey: stringType)
            }
        }
}

    func selectAll(paramater: Int) {

        let button: [UIButton] = [location1, location2, location3, loctation4, location5, location6, location7, location8]

        let selectedIndex = [selected1, selected2, selected3, selected4, selected5, selected6, selected7, selected8]

        var index = 0

        while index < arrayOptions.count {

        let selectedButton = button[index]

        var bool = selectedIndex[index]

        if !bool && index != paramater {

            selectedButton.sendActions(for: .touchUpInside)

            }
            index = index+1

        }

        if selectAll {

            var index2 = 0

            while index2 < arrayOptions.count {

                let selectedButton = button[index2]

                var bool = selectedIndex[index2]

                if bool && index2 != paramater {

                    selectedButton.sendActions(for: .touchUpInside)

                }
                index2 = index2+1

            }
            selectAll = false
        } else {
            selectAll = true

        }

    }

    
    }



//
//  TermsAndConditionsViewController.swift
//  Trilogy
//
//  Created by macbook pro on 6/25/18.
//  Copyright © 2018 Trilogy. All rights reserved.
//

import UIKit

class TermsAndConditionsViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {

        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white

        let textlabel = UILabel()

        textlabel.translatesAutoresizingMaskIntoConstraints=false

        textlabel.text="Trilogy For Tenants"

        textlabel.textColor=UIColor.black

        textlabel.textAlignment = .center

        textlabel.font = UIFont(name: "Futura-Medium", size:28)

        self.view.addSubview(textlabel)

        let infolabel = UILabel()

        infolabel.text = "Only the best of the best listings have been selected to be included in surveys for individual space requirments."

        infolabel.textColor=UIColor.black

        infolabel.font = UIFont(name: "Helvetica-Light", size:24)

        infolabel.textAlignment = .center

        infolabel.translatesAutoresizingMaskIntoConstraints=false

        infolabel.lineBreakMode = .byWordWrapping

        infolabel.numberOfLines = 0

        self.view.addSubview(infolabel)

        let infolabel2 = UILabel()

        infolabel2.text = " Higly Customized. Updated Daily"

        infolabel2.textColor=UIColor.black

        infolabel2.font = UIFont(name: "Helvetica-Light", size:20)

        infolabel2.textAlignment = .center

        infolabel2.translatesAutoresizingMaskIntoConstraints=false

        infolabel2.lineBreakMode = .byWordWrapping

        infolabel2.adjustsFontForContentSizeCategory = true

        infolabel2.numberOfLines = 1

        self.view.addSubview(infolabel2)

        let infolabel3 = UILabel()

        infolabel3.text = "YOUR COMMITMENT TO TRILOGY"

        infolabel3.textColor = UIColor(hue: 0.5, saturation: 1, brightness: 0.9, alpha: 1.0)

        infolabel3.font = UIFont(name: "Helvetica-Light", size:20)

        infolabel3.textAlignment = .center

        infolabel3.translatesAutoresizingMaskIntoConstraints=false

        infolabel3.lineBreakMode = .byWordWrapping

        infolabel3.adjustsFontForContentSizeCategory = true

        infolabel3.numberOfLines = 1

        self.view.addSubview(infolabel3)

        let legaltext = UITextView()

        legaltext.delegate = self as? UITextViewDelegate

        legaltext.text = " \n \n1. By agreeing to Trilogy Terms and conditions, you are granting Trilogy excluse right to repersent your company and negotiate on your behalf for any space that is curated and viewed on the app.\n \n2. Enjoy a free sample of curate listings. Terminate engagment and curated feed listings anytime. \n3.A ship sailing across the Black Sea in the year 1780 eventually would have come upon a lush shore at the eastern end of the dark gray waters (compare Odell 1977; Lotz et al. 1956; and the earliest account, Sanazaro 1506). If the course setting had been east-northeast, then this would have been the Circassian coast, a rolling land with distant mountains rising behind it. If due east, then the ship would have come upon the Abkhazian coast, with the hills and mountains descending to the beach and at a few points dipping into the sea. This stretch of shoreline might well be the same on which Jason and his argonauts are said to have landed three millennia earlier. In that year these were the watery boundaries of two large nations, Circassia and Abkhazia, with the land of the Ubykh falling between them and sharing allegiances with both. In Abkhazia the traveler would have encountered a state with a ruler, albeit under the thumb of the Ottoman Empire, whose inner boundary petered out in the high reaches of the mountains (see Lak'oba 1998). The nobles of Abkhazia shared pedigrees with the nobles of the small Ubykh tribe farther up the coast, on the far side of the river Psow. In Circassia the traveler would have encountered a series of tribes structured by clan lineages and allegiances, all of whom called themselves Adyghey, including the small Ubykh tribe. This realm would extend eastward through tribes, each having its own dialect, across the Caucasus Mountains, which run for one thousand kilometers from the northwest to the southeast, and along the south bank of the Kuban River, to the very center of the North Caucasus. Here, in the shadow of Mount Elbruz, the highest mountain in Europe, the Kabardian tribe dominated with an almost statelike cohesion over the Turkic-speaking Noghay nomads of the plains and the Iranian-speaking Ossetian mountaineers. Here too the Terek River began its eastward flow to form the northern boundary of the Northeast Caucasus. In the mountain pastures of the Circassian realm lived Turkic-speaking pastoralists, the Karachais and Malkars (or Balkars). Some northern Abkhaz, the Abazas, also lived among them. Across the Kuban and Terek Rivers were settlements of Russian- and Ukrainian-speaking people who had fled the system of serfdom farther north and who had intermarried with many of the Caucasian and Turkic women. These were the Cossacks. In many ways they resembled their Caucasian neighbors but traditionally maintained a hostile relationship with them. They were the vanguard of the invasion that was to come in the next century."

        legaltext.translatesAutoresizingMaskIntoConstraints = false

        legaltext.showsVerticalScrollIndicator = true

        legaltext.isEditable = false

        legaltext.isScrollEnabled = true

        legaltext.scrollRangeToVisible(NSMakeRange(0, 0))

        legaltext.setContentOffset(CGPoint(x: 0, y: 0), animated: false)

        legaltext.font = UIFont(name: "Helvetica-Light", size:20)

        self.view.addSubview(legaltext)

        let okbutton = UIButton()

        okbutton.setTitle("AGREE", for: .normal)

        okbutton.setTitleColor(UIColor(hue: 0.5, saturation: 1, brightness: 0.9, alpha: 1.0), for: .normal)

        okbutton.layer.cornerRadius = 5

        okbutton.layer.borderWidth = 1

        okbutton.layer.borderColor = UIColor(hue: 0.5, saturation: 1, brightness: 0.9, alpha: 1.0).cgColor

        okbutton.translatesAutoresizingMaskIntoConstraints = false

        okbutton.addTarget(self, action: #selector(action), for:  UIControlEvents.touchUpInside)

        self.view.addSubview(okbutton)

        let views: [String: AnyObject] = ["title": textlabel, "body": infolabel, "info": infolabel2, "commit": infolabel3, "legal":legaltext, "ok": okbutton ]

        let hori = NSLayoutConstraint.constraints(withVisualFormat: "V:|-65-[title]-15-[body]-20-[info]-20-[commit]-10-[legal]-[ok(20@650)]-|" , options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)

        let vert = NSLayoutConstraint.constraints(withVisualFormat: "H:|-25-[title]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)

        let vert2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[body]-25-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)

        let vert3 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[info]-25-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)

        let vert4 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[commit]-25-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)

         let vert5 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[legal]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)

         let vert6 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-25-[ok]-25-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)

        self.view.addConstraints(hori)

        self.view.addConstraints(vert)

        self.view.addConstraints(vert2)

        self.view.addConstraints(vert3)

        self.view.addConstraints(vert4)

        self.view.addConstraints(vert5)

        self.view.addConstraints(vert6)
    }

    @objc func action(sender:UIButton!) {
        DispatchQueue.main.async {

            let main = UIStoryboard(name:"Main" , bundle:nil)

            let controller = main.instantiateViewController(withIdentifier: "land")

            self.present(controller, animated: true, completion: nil)
        }
    }
}

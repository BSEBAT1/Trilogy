//
//  CategTableViewCell.swift
//  Trilogy
//
//  Created by macbook pro on 7/12/18.
//  Copyright © 2018 Trilogy. All rights reserved.
//

import UIKit

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

    private let expandedViewIndex: Int = 1

    var canToggle: Bool = true

    enum CellState {
        case collapsed
        case expanded
    }

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

        if name == "LOCATION" {
            canToggle = false
        }

        let button: [UIButton] = [location1, location2, location3, loctation4, location5, location6, location7, location8]

        var index = 0

        while index < buttons.count {

            let buttonIndex = button[index]

            buttonIndex.isHidden = false

            let title = buttons[index] as! String

            buttonIndex.setTitle(title, for: .normal)

            buttonIndex.sizeToFit()

            index = index+1

        }

    }

    private func toggle() {
        if canToggle {
        stackView.arrangedSubviews[expandedViewIndex].isHidden = stateIsCollapsed()

        }
        
    }

    private func stateIsCollapsed() -> Bool {
        return state == .collapsed
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepareForReuse() {

        canToggle = true

        let buttons: [UIButton] = [location1, location2, location3, loctation4, location5, location6, location7, location8]

        for views in buttons {

            views.isHidden = true

        }

    }

}

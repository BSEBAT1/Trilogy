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

    @IBOutlet weak var Location1: UIButton!

    @IBOutlet weak var Location2: UIButton!

    @IBOutlet weak var Location3: UIButton!

    @IBOutlet weak var Loctation4: UIButton!

    @IBOutlet weak var Location5: UIButton!

    @IBOutlet weak var Location6: UIButton!

    @IBOutlet weak var Location7: UIButton!

    @IBOutlet weak var containerViewd: UIView!

    private let expandedViewIndex: Int = 1

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

    }

    private func toggle() {
        stackView.arrangedSubviews[expandedViewIndex].isHidden = stateIsCollapsed()
        
    }

    private func stateIsCollapsed() -> Bool {
        return state == .collapsed
    }

}

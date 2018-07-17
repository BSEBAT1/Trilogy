//
//  LandingController.swift
//  Trilogy
//
//  Created by macbook pro on 6/23/18.
//  Copyright © 2018 Trilogy. All rights reserved.
//

import UIKit

class LandingController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var nextButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
    }
    
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)

        let nav = self.navigationController?.navigationBar

        let color = UIColor(red:0.25, green:0.33, blue:0.40, alpha:1.0)

        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: color]
    }
    

   let dataSource = LandingScreenDataSource()

    override func viewDidLoad() {

        super.viewDidLoad()

        tableViewSetup()

        nextButton.layer.borderWidth = 2.0

        nextButton.layer.borderColor = UIColor.blue.cgColor
    }

    
  //Mark Load UI Setup Views

    private func tableViewSetup() {

        tableView.delegate = self

        tableView.dataSource = dataSource

        tableView.rowHeight = UITableViewAutomaticDimension

        tableView.estimatedRowHeight = 350

        tableView.separatorStyle = .none

        tableView.backgroundView?.backgroundColor = UIColor.black

    }
    
}

extension LandingController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CategTableViewCell

        cell.state = .expanded
        dataSource.addExpandedIndexPath(indexPath)

        tableView.beginUpdates()
        tableView.endUpdates()
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CategTableViewCell

        cell.state = .collapsed
        dataSource.removeExpandedIndexPath(indexPath)

        tableView.beginUpdates()
        tableView.endUpdates()
    }
}


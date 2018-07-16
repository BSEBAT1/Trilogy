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

   let dataSource = LandingScreenDataSource()

    override func viewDidLoad() {

        super.viewDidLoad()

        tableViewSetup()

//        if let font = UIFont(name: "Helvetica-Bold", size: 12) {
//            print("font");
//
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: font]
//
//        }
    }


    override func viewWillAppear(_ animated: Bool) {

        let color = UIColor(red:0.26, green:0.34, blue:0.42, alpha:1.0)
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: color, NSAttributedStringKey.backgroundColor: UIColor.white]

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


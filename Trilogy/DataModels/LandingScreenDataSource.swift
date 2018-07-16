//
//  LandingScreenDataSource.swift
//  Trilogy
//
//  Created by macbook pro on 7/12/18.
//  Copyright © 2018 Trilogy. All rights reserved.
//

import UIKit

class LandingScreenDataSource: NSObject, UITableViewDataSource {

    private let cellIdentifier = "SelectionCell"

    private var items: [AreaSelection] = [AreaSelection(title: "Manhattan", checkboxes:["Colombus Circle", "Grand Central", "Penn Plaza", "Plaza District", "Times Square", "UN Plaza", "Select ALL"]), AreaSelection(title: "Midtown South", checkboxes:["Chelsea", "Gramercy", "Murray Hill", "Select ALL"]), AreaSelection(title: "Uptown", checkboxes:["Upper East Side", "Upper West Side ", "Select ALL"]), AreaSelection(title: "DownTown", checkboxes:["City Hall", "Financial District", "Greenwich Village", "Harlem", "Hudson Square", "Insurance District", "World Trade Center", "Select ALL"]), AreaSelection(title: "Brooklyn", checkboxes:["Downtown BK"])
    ]

    //Mark TableView Methods


    fileprivate var indexPaths: Set<IndexPath> = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CategTableViewCell

        let titleName = self[indexPath].title
        let checkboxesList = self[indexPath].checkboxes


        cell.update(name: titleName,buttons: checkboxesList)

        cell.state = cellIsExpanded(at: indexPath) ? .expanded : .collapsed

        return cell
    }
}

extension LandingScreenDataSource {
    func cellIsExpanded(at indexPath: IndexPath) -> Bool {
        return indexPaths.contains(indexPath)
    }

    func addExpandedIndexPath(_ indexPath: IndexPath) {
        indexPaths.insert(indexPath)
    }

    func removeExpandedIndexPath(_ indexPath: IndexPath) {
        indexPaths.remove(indexPath)
    }
}

extension LandingScreenDataSource {
    subscript(indexPath: IndexPath) -> AreaSelection {
        return items[indexPath.row]
    }



}

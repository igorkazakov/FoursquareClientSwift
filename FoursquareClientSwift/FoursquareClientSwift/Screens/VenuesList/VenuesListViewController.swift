//
//  VenuesListViewController.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 28.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit

protocol VenuesListViewProtocol: class {
    
    func showVenues(_ venues: [Venue])
}

class VenuesListViewController: UIViewController, VenuesListViewProtocol {

    private var presenter: VenuesListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = VenuesListPresenter(view: self, repository: Repository.shared)
    }
    
    func showVenues(_ venues: [Venue]) {
        
    }
}

// MARK: UITableViewDelegate extension

extension VenuesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension VenuesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//
//  VenuesListViewController.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 28.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit

protocol VenuesListViewProtocol: class {
    
    func showVenues(_ venues: [VenueViewModel])
}

class VenuesListViewController: UIViewController, VenuesListViewProtocol {

    private var presenter: VenuesListPresenter?
    private var venueModels = [VenueViewModel]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName = UINib(nibName: String(describing: VenueTableViewCell.self), bundle:nil)
        self.tableView.register(nibName, forCellReuseIdentifier: VenueTableViewCell.reuseIdentifier)
        presenter = VenuesListPresenter(view: self, repository: Repository.shared)
    }
    
    func showVenues(_ venues: [VenueViewModel]) {
        self.venueModels = venues
        self.tableView.reloadData()
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
        return self.venueModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:VenueTableViewCell.reuseIdentifier, for: indexPath) as? VenueTableViewCell  else {
            fatalError("The dequeued cell is not an instance of NotificationCell.")
        }
        
        cell.initWithViewModel(self.venueModels[indexPath.row])
        return cell;
    }
}

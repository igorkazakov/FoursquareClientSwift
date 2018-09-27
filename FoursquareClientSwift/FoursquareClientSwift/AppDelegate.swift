//
//  AppDelegate.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 25.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let disposeBag = DisposeBag()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        disposeBag.insert(Repository.shared.loadVenueRecommendations()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (result) in
                print(result)
            }, onError: { (error) in
                print(error)
            }, onCompleted: {},
               onDisposed: {}))
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}
}


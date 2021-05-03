//
//  ViewController.swift
//  WheatherApp
//
//  Created by Оля on 24.04.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    // MARK: - Variables
    var tabBarVC = UITabBarController()
    
    // MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarControllers()
    }
    
    // MARK: - Methods
    func setTabBarControllers() {
        tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: TodayViewController())
        let vc2 = UINavigationController(rootViewController: ForecastViewController())
        vc1.title = "Today"
        vc2.title = "Forecast"
        tabBarVC.viewControllers = [vc1, vc2]
        self.view.addSubview(tabBarVC.view)
        
        guard let items = tabBarVC.tabBar.items else { return }
        let images = ["sun.max", "moon.stars"]
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
    }
}



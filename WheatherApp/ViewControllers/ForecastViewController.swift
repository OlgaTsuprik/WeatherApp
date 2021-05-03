//
//  ForecastViewController.swift
//  WheatherApp
//
//  Created by Оля on 24.04.2021.
//

import UIKit
import SnapKit
import CoreLocation

class ForecastViewController: UIViewController, CLLocationManagerDelegate {
    // MARK: Variables
    var weatherH: HourlyWeather?
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    var items: [HourlyWeatherEntry] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    var networkWeatherManager = NetworkWeatherManager()
    private var inset: CGFloat = 5
    
    // MARK: GUI Variables
    private lazy var dateFormatterForHourly: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:00 EEEE"
        
        return dateFormatter
    }()
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "background")
        
        return imageView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HourlyWeatherCell.self, forCellReuseIdentifier: HourlyWeatherCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    // MARK: Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Forecast"
        self.view.addSubview(self.backgroundImage)
        self.view.addSubview(self.tableView)
        self.setupConstraints()
        setupLocation()
        requestWheatherForLocation()
    }
    
    // MARK: Methods
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWheatherForLocation()
        }
    }
    
    func requestWheatherForLocation() {
        guard let currentLocation = currentLocation else { return }
        let long = currentLocation.coordinate.longitude
        let lat = currentLocation.coordinate.latitude
        networkWeatherManager.fetchHourlyWeather(latitude: lat, longitude: long) { [weak self] data in
            DispatchQueue.main.async {
                self?.items = data.hourlyWeatherEntries
                self?.tableView.reloadData()
            }
        }
    }
    
    func setupConstraints() {
        self.backgroundImage.snp.updateConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        self.tableView.snp.updateConstraints { (make) in
            make.left.top.right.bottom.equalTo(backgroundImage).inset(self.inset)
        }
    }
}

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: HourlyWeatherCell.reuseIdentifier, for: indexPath)
        cell.contentView.backgroundColor = .clear
        cell.backgroundColor = .clear
        cell.layer.backgroundColor = UIColor.clear.cgColor
        if let cell = cell as? HourlyWeatherCell {
            let item = items[indexPath.row]
            let time = dateFormatterForHourly.string(from: item.dateD)
            cell.set(temp: items[indexPath.row].temperatureString, description: items[indexPath.row].description, icon: items[indexPath.row].systemIconNameString, time: time)
        }
        cell.selectionStyle = .none
        return cell
    }
}

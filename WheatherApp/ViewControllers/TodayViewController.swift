//
//  TodayViewController.swift
//  WheatherApp
//
//  Created by Оля on 24.04.2021.
//

import UIKit
import SnapKit
import CoreLocation

class TodayViewController: UIViewController, CLLocationManagerDelegate {
    // MARK: Variables
    var networkWeatherManager = NetworkWeatherManager()
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var weatherS: TodayWeather?
    var weatherH: HourlyWeather?
    
    private var buttonInset: CGFloat = 50
    private var buttonHeight: CGFloat = 50
   
   // MARK: GUI Variables
    private lazy var mainView: TodayView = {
        let view = TodayView()
    
        return view
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.titleLabel?.textColor = UIColor.systemPink
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)

        return button
    }()
    
    // MARK: Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Today"
        setupLocation()
        requestWheatherForLocation()
        self.view.addSubview(self.mainView)
        self.view.addSubview(self.shareButton)
        self.setupConstraints()
        guard weatherS != nil else { return }
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
        guard let currentLocation = currentLocation else {
            return
        }
        let long = currentLocation.coordinate.longitude
        let lat = currentLocation.coordinate.latitude
        networkWeatherManager.fetchtWeather(latitude: lat, longitude: long) { data in
            guard data != nil else { return }
            self.weatherS = data
            DispatchQueue.main.async {
                self.mainView.set(cityNameWeek: self.weatherS?.cityContry ?? "",
                                  temp: self.weatherS?.temperatureString ?? "",
                                  description: self.weatherS?.description ?? "",
                                  icon: self.weatherS?.systemIconNameString ?? "",
                                  humidityIcon: "cloud.rain.fill",
                                  humidity: self.weatherS?.humidityString ?? "",
                                  rainIcon: "drop.fill",
                                  rainL: self.weatherS?.rainLevelString ?? "",
                                  pressureIcon: "waveform.path.ecg",
                                  pressure: self.weatherS?.pressureString ?? "",
                                  wsIcon: "wind",
                                  windSpeed: self.weatherS?.windSpeedString ?? "",
                                  wdIcon: "location.north.line.fill",
                                  wDir: self.weatherS?.windDirection ?? "")
            }
        }
    }
    
    func setupConstraints() {
        self.mainView.snp.updateConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        self.shareButton.snp.updateConstraints { (make) in
            make.bottom.equalTo(mainView.snp_bottomMargin).inset(self.buttonInset)
            make.height.equalTo(self.buttonHeight)
            make.centerXWithinMargins.equalToSuperview()
        }
    }
    
    // MARK: Button action
    @objc private func buttonPressed(_ sender: UIBarButtonItem) {
        let text = ["The weather", weatherS?.temperature ?? 0] as [Any]
        let activityVC = UIActivityViewController(activityItems: text, applicationActivities: nil)
        activityVC.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("It is sent")
            }
        }
        activityVC.popoverPresentationController?.barButtonItem = sender
        activityVC.popoverPresentationController?.permittedArrowDirections = .any
        self.present(activityVC, animated: true, completion: nil)
    }
}

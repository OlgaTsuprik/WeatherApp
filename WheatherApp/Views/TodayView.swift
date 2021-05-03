//
//  TodayView.swift
//  WheatherApp
//
//  Created by Оля on 28.04.2021.
//

import UIKit
import SnapKit

class TodayView: UIView {
    // MARK: Variables
    private  var edgeInsert = UIEdgeInsets(all: 16)
    private var windStackoffSet: CGFloat = 50
    private var offSet: CGFloat = 30
    
    private var textSize: CGFloat = 40
    private var bigSizeText: CGFloat = 35
    private var smallSizeText: CGFloat = 20
    
    private var stackSpacing: CGFloat = 10
    private var stackSpacingMin: CGFloat = 0
    
    private var iconInset: CGFloat = 150
    private var iconHeight: CGFloat = 150
    private var stackHeight: CGFloat = 50
    private var totalStackHeight: CGFloat = 100
    
    // MARK: GUI Variables
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "background")
        
        return imageView
    }()
    
    private lazy var totalStackView: UIStackView = {
       let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = self.stackSpacing
        
        return stack
    }()
    
    private lazy var iconOfWeather: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.tintColor = .white
        
        return image
    }()
    
    private lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: self.bigSizeText)
        
        return label
    }()
    
    private lazy var temperatureStackView: UIStackView = {
       let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.spacing = self.stackSpacing
        
        return stack
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: self.bigSizeText)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: self.bigSizeText)
        
        return label
    }()
    
    private lazy var dataStackView: UIStackView = {
       let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = self.stackSpacing

        return stack
    }()
 
    private lazy var humidityStackView: UIStackView = {
       let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = self.stackSpacingMin
        
        return stack
    }()
    
    private lazy var iconOfHumidity: UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.tintColor = .label
        return image
    }()
    
    private lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: self.smallSizeText)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var rainLevelStackView: UIStackView = {
       let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = self.stackSpacingMin
        
        return stack
    }()
    
    private lazy var iconOfRainLevel: UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.tintColor = .label
        
        return image
    }()
    
    private lazy var rainlevelLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: self.smallSizeText)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var pressureStackView: UIStackView = {
       let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = self.stackSpacingMin
        
        return stack
    }()
    
    private lazy var iconOfPressure: UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.tintColor = .label
        
        return image
    }()
    
    private lazy var pressureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: self.smallSizeText)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var dataWindStackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = self.stackSpacingMin
        
        return stack
    }()
    
    private lazy var windSpeedStackView: UIStackView = {
       let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = self.stackSpacingMin
        
        return stack
    }()
    
    private lazy var iconOfWindSpeed: UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.tintColor = .label
        
        return image
    }()
    
    private lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: self.smallSizeText)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var windDirStackView: UIStackView = {
       let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = self.stackSpacingMin
        
        return stack
    }()
    
    private lazy var iconOfWindDir: UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.tintColor = .label
        
        return image
    }()
    
    private lazy var windDirLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: self.smallSizeText)
        label.textColor = .label
        
        return label
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initView() {
        self.addSubviews([self.backgroundImage,
                          self.iconOfWeather,
                          self.totalStackView,
                          self.temperatureStackView,
                          self.dataStackView,
                          self.dataWindStackView])

        self.dataStackView.addArrangedSubview(humidityStackView)
        self.dataStackView.addArrangedSubview(rainLevelStackView)
        self.dataStackView.addArrangedSubview(pressureStackView)
        self.dataWindStackView.addArrangedSubview(windSpeedStackView)
        self.dataWindStackView.addArrangedSubview(windDirStackView)
     
        self.humidityStackView.addArrangedSubview(self.iconOfHumidity)
        self.humidityStackView.addArrangedSubview(self.humidityLabel)
        self.rainLevelStackView.addArrangedSubview(self.iconOfRainLevel)
        self.rainLevelStackView.addArrangedSubview(self.rainlevelLabel)
        self.pressureStackView.addArrangedSubview(self.iconOfPressure)
        self.pressureStackView.addArrangedSubview(self.pressureLabel)
        self.windSpeedStackView.addArrangedSubview(self.iconOfWindSpeed)
        self.windSpeedStackView.addArrangedSubview(self.windSpeedLabel)
        self.windDirStackView.addArrangedSubview(self.iconOfWindDir)
        self.windDirStackView.addArrangedSubview(self.windDirLabel)
      
        dataStackView.translatesAutoresizingMaskIntoConstraints = false
        humidityStackView.translatesAutoresizingMaskIntoConstraints = false
        rainLevelStackView.translatesAutoresizingMaskIntoConstraints = false
        pressureStackView.translatesAutoresizingMaskIntoConstraints = false
        windSpeedStackView.translatesAutoresizingMaskIntoConstraints = false
        windDirStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.totalStackView.addArrangedSubview(self.cityNameLabel)
        self.totalStackView.addArrangedSubview(self.temperatureStackView)
        self.temperatureStackView.addArrangedSubview(self.temperatureLabel)
        self.temperatureStackView.addArrangedSubview(self.descriptionLabel)
        
        totalStackView.translatesAutoresizingMaskIntoConstraints = false
        temperatureStackView.translatesAutoresizingMaskIntoConstraints = false
        self.setupConstraints()
    }
    
    // MARK: - Methods
    func setupConstraints() {
        // background image
        self.backgroundImage.snp.updateConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        self.iconOfWeather.snp.updateConstraints { (make) in
            make.top.equalTo(backgroundImage).inset(self.iconInset)
            make.width.height.equalTo(self.iconHeight)
            make.centerX.equalToSuperview()
        }
        self.totalStackView.snp.updateConstraints { (make) in
            make.top.equalTo(iconOfWeather.snp_bottomMargin).offset(self.offSet)
            make.left.right.equalTo(backgroundImage).inset(edgeInsert)
            make.height.equalTo(self.totalStackHeight)
        }
        self.dataStackView.snp.updateConstraints { (make) in
            make.top.equalTo(totalStackView.snp_bottomMargin).offset(self.offSet)
            make.left.right.equalTo(backgroundImage).inset(edgeInsert)
            make.height.equalTo(self.stackHeight)
        }
        self.dataWindStackView.snp.updateConstraints { (make) in
            make.top.equalTo(dataStackView.snp_bottomMargin).offset(self.offSet)
            make.left.right.equalTo(backgroundImage).inset(self.windStackoffSet)
            make.height.equalTo(self.stackHeight)
        }
    }
    
    // MARK: - Setter
    func set(cityNameWeek: String, temp: String, description: String, icon: String, humidityIcon: String, humidity: String, rainIcon: String, rainL: String, pressureIcon: String, pressure: String, wsIcon: String, windSpeed: String, wdIcon: String, wDir: String ) {
        self.cityNameLabel.text = cityNameWeek
        self.temperatureLabel.text = temp
        self.descriptionLabel.text = description
        self.iconOfWeather.image = UIImage(systemName: icon)
        self.iconOfHumidity.image = UIImage(systemName: humidityIcon)
        self.humidityLabel.text = humidity
        self.iconOfRainLevel.image = UIImage(systemName: rainIcon)
        self.rainlevelLabel.text = rainL
        self.iconOfPressure.image = UIImage(systemName: pressureIcon)
        self.pressureLabel.text = pressure
        self.iconOfWindSpeed.image = UIImage(systemName: wsIcon)
        self.windSpeedLabel.text = windSpeed
        self.iconOfWindDir.image = UIImage(systemName: wdIcon)
        self.windDirLabel.text = wDir
    }
}

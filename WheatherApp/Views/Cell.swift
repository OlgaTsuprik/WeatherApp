//
//  Cell.swift
//  WheatherApp
//
//  Created by Оля on 29.04.2021.
//

import UIKit

class HourlyWeatherCell: UITableViewCell {
    // MARK: Variables
    static var reuseIdentifier = "HourlyWeatherCell"
    
    private var bigSizeText: CGFloat = 35
    private var smallSizeText: CGFloat = 20
    private var iconSize: CGFloat = 60
    private var labelWidth: CGFloat = 100
    private var inSet: CGFloat = 10
    private var ofSet: CGFloat = 20
    private var stackSpacingMin: CGFloat = 0
 
    // MARK: GUI Variables
    private lazy var iconOfWeather: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.tintColor = .orange
        
        return image
    }()
    
    private lazy var timeStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = self.stackSpacingMin
        
        return stack
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: self.smallSizeText)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.font = UIFont.systemFont(ofSize: self.smallSizeText)
        
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: self.bigSizeText)
        
        return label
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initView() {
        self.addSubviews([self.iconOfWeather,
                          self.timeStackView,
                          self.temperatureLabel
                          ])

        self.timeStackView.addArrangedSubview(self.timeLabel)
        self.timeStackView.addArrangedSubview(self.descriptionLabel)
        self.setupConstraints()
    }
    
    // MARK: - Methods
    func setupConstraints() {
        self.iconOfWeather.snp.updateConstraints { (make) in
            make.left.top.bottom.equalToSuperview().inset(self.inSet)
            make.width.height.greaterThanOrEqualTo(self.iconSize)
        }
        self.timeStackView.snp.updateConstraints { (make) in
            make.left.equalTo(iconOfWeather.snp_rightMargin).offset(self.ofSet)
            make.top.bottom.equalToSuperview().inset(self.inSet)
        }
        self.temperatureLabel.snp.updateConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(self.labelWidth)
        }
    }
    
    func set(temp: String,
             description: String,
             icon: String,
             time: String) {
        self.temperatureLabel.text = temp
        self.descriptionLabel.text = description
        self.iconOfWeather.image = UIImage(systemName: icon)
        self.timeLabel.text = time
    }
}

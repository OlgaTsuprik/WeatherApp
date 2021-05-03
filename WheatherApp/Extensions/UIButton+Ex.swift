//
//  UIButton+Ex.swift
//  WheatherApp
//
//  Created by Оля on 29.04.2021.
//

import UIKit

extension UIButton {
    func set(fontSize: CGFloat) {
        if let titleLabel = titleLabel {
             titleLabel.font = UIFont(name: titleLabel.font.fontName, size: fontSize)
        }
    }
}

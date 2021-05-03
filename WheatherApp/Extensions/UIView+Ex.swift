//
//  UIView+Ex.swift
//  WheatherApp
//
//  Created by Оля on 28.04.2021.
//


import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            self.addSubview($0)
        }
    }
}


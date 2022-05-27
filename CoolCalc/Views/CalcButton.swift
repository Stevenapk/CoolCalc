//
//  CalcButton.swift
//  CoolCalc
//
//  Created by Steven Sullivan on 5/22/22.
//

import UIKit

class CalcButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .black
        layer.cornerRadius = 7
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.37
    }

}

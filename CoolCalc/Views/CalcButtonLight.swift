//
//  CalcButtonLight.swift
//  CoolCalc
//
//  Created by Steven Sullivan on 5/23/22.
//

import UIKit

class CalcButtonLight: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = #colorLiteral(red: 0.9448513985, green: 0.9527524114, blue: 0.9652761817, alpha: 1)
        layer.cornerRadius = 7
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.37
    }
}

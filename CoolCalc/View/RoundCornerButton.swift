//
//  RoundCornerButton.swift
//  CoolCalc
//
//  Created by Carlos Cardoso on 9/3/21.
//

import UIKit

class RoundCornerButton: UIButton {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
    }


}

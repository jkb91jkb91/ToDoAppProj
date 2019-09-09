//
//  ButtonExtension.swift
//  ToDoApp
//
//  Created by XCodeClub on 2019-09-04.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit


class ButtonView: UIButton {
    
 override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setViews()
        
  }
    
    
    func setViews() {
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 15
    }
}

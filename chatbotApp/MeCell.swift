//
//  MeCell.swift
//  chatbotApp
//
//  Created by 정민경 on 2023/01/24.
//

import Foundation
import UIKit

class MeCell : UITableViewCell {
    
    @IBOutlet weak var meLabel : UILabel!
    
    @IBOutlet weak var insetView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
                print("<#comment#> -", #fileID, #function, #line)
        
        insetView.layer.borderColor = UIColor.black.cgColor
        insetView.layer.borderWidth = 3
        insetView.layer.cornerRadius = 10
    }
}

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
                print("<#comment#> -", #fileID, #function, #line)
        
    }
}

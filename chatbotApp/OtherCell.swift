//
//  OtherCell.swift
//  chatbotApp
//
//  Created by 정민경 on 2023/01/24.
//

import Foundation
import UIKit

class OtherCell : UITableViewCell {
    
    @IBOutlet weak var botLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
                print("<#comment#> -", #fileID, #function, #line)
    }
}

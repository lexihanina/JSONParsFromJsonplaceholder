//
//  AllCommentsTableViewCell.swift
//  JSONParsFromJsonplaceholder
//
//  Created by Lexi Hanina on 27.01.24.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillCellWith(name: String, email: String, andBody: String) {
        nameLabel.text = name
        emailLabel.text = name
        bodyLabel.text = name
    }
}

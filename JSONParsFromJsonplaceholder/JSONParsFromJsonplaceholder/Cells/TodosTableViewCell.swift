//
//  TodosTableViewCell.swift
//  JSONParsFromJsonplaceholder
//
//  Created by Lexi Hanina on 27.01.24.
//

import UIKit

class TodosTableViewCell: UITableViewCell {
    @IBOutlet weak var checkBoxOutlet: UIButton!
    @IBOutlet weak var titleLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBoxOutlet.setImage(UIImage(named: "checkboxChecked"), for: .selected)
        checkBoxOutlet.setImage(UIImage(named: "checkboxUnchecked"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didTapCheckBox(_ sender: Any) {
        checkBoxOutlet.isSelected = !checkBoxOutlet.isSelected
    }
    
    func fillCellWith(title: String, completed: Bool) {
        titleLable.text = title
        checkBoxOutlet.isSelected = completed
    }
}

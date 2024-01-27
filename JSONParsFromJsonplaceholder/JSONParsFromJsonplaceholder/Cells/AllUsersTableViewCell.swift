//
//  AllUsersTableViewCell.swift
//  JSONParsFromJsonplaceholder
//
//  Created by Lexi Hanina on 27.01.24.
//

import UIKit

class AllUsersTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var lngLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillCellWith(name: String, username: String, email: String,
                      userID: Int, street: String, suite: String,
                      city: String, zipcode: String, lat: String,
                      lng: String, phone: String, website: String,
                      company: String, catchPhrase: String, bs: String) {
        nameLabel.text = name
        usernameLabel.text = username
        emailLabel.text = email
        userIDLabel.text = String(userID)
        streetLabel.text = street
        suiteLabel.text = suite
        cityLabel.text = city
        zipcodeLabel.text = zipcode
        latLabel.text = lat
        lngLabel.text = lng
        phoneLabel.text = phone
        websiteLabel.text = website
        companyNameLabel.text = company
        catchPhraseLabel.text = catchPhrase
        bsLabel.text = bs
    }
}

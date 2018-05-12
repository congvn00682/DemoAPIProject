//
//  HeroTableViewCell.swift
//  DemoAPI
//
//  Created by Vu Ngoc Cong on 5/10/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit

class HeroTableViewCell: UITableViewCell {

    
    @IBOutlet weak var photoHero: UIImageView!
    @IBOutlet weak var nameEN: UILabel!
    @IBOutlet weak var nameVN: UILabel!
    @IBOutlet weak var level: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameEN.text = nil
        nameVN.text = nil
        photoHero.image = nil
        level.text = nil
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  UniversityTableViewCell.swift
//  List
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import UIKit

class UniversityTableViewCell: UITableViewCell {

    @IBOutlet weak var universityNameLable: UILabel!
    @IBOutlet weak var universityStateLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension UniversityTableViewCell: UniversityTableViewCellProtocol {
    func configure(with model:  UniversityCellVM) {
        universityNameLable.text = model.name
        universityStateLable.text = model.stateProvince
    }
}

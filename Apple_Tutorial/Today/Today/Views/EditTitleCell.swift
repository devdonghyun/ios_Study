//
//  EditTitleCell.swift
//  Today
//
//  Created by 안동현 on 2021/12/26.
//

import UIKit

class EditTitleCell: UITableViewCell {
    @IBOutlet var titleTextField: UITextField!
    
    func configure(title: String) {
        titleTextField.text = title
    }
}

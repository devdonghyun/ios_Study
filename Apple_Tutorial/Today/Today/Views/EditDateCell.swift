//
//  EditDateCell.swift
//  Today
//
//  Created by 안동현 on 2021/12/26.
//

import UIKit

class EditDateCell: UITableViewCell {
    @IBOutlet var datePicker: UIDatePicker!
    
    func configure(date: Date) {
        datePicker.date = date
    }
}

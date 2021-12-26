//
//  EditNotesCell.swift
//  Today
//
//  Created by 안동현 on 2021/12/26.
//

import UIKit

class EditNotesCell: UITableViewCell {
    @IBOutlet var notesTextView: UITextView!
    
    func configure(notes: String?) {
        notesTextView.text = notes
    }
}

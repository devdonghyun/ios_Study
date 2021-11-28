//
//  ReminderDetailViewController.swift
//  Today
//
//  Created by 안동현 on 2021/11/27.
//

import UIKit

class ReminderDetailViewController: UITableViewController {
    enum ReminderRow: Int, CaseIterable {
        case title
        case date
        case time
        case notes
        
        
        /* This method returns the appropriate text
           to display based on the current enumeration case.*/
        
        func displayText(for reminder: Reminder?) -> String? {
            switch self {
            case .title:
                return reminder?.title
            case .date:
                return reminder?.dueDate.description
            case .time:
                return reminder?.dueDate.description
            case .notes:
                return reminder?.notes
            }
        }
        
        
        /* This method returns the appropriate image
           to display based on the current enumeration case.*/
        
        var cellImage: UIImage? { // Computed Property
            switch self {
            case .title:
                return nil
            case .date:
                return UIImage(systemName: "calendar.circle")
            case .time:
                return UIImage(systemName: "clock")
            case .notes:
                return UIImage(systemName: "square.and.pencil")
            }
        }
        
    }

    
    /*
     When initializing a view controller from a storyboard, iOS calls the init(coder:) initializer. This configure method approach is useful for configuring after initializing, such as injecting dependencies.
     */
    var reminder: Reminder?
    func configure(with reminder: Reminder) {
        self.reminder = reminder
    }
}

//MARK: - for my data source methods at the bottom of the file


/*
 
 tableView(_:numberOfRowsInSection:)
 tableView(_:cellForRowAt:)
 The UITableViewDataSource protocol requires these two methods.
 
 */

extension ReminderDetailViewController {
    /*
     Always codify identifier strings to ensure your app doesn’t crash
     because of a mistyped identifier.
    */
    static let reminderDetailCellIdentifier = "ReminderDetailCell" // constant for the cell identifier
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*
         A table view asks its data source for the number of rows in a section
         when determining how many cells can be displayed on screen.
        */
        return ReminderRow.allCases.count
         //The number of rows in the table view equals the number of cases in the enumeration.
         
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderDetailCellIdentifier, for: indexPath)
        let row = ReminderRow(rawValue: indexPath.row)
        cell.textLabel?.text = row?.displayText(for: reminder) // Use the ReminderRow instance to update the cell’s label.
        cell.imageView?.image = row?.cellImage
        
        return cell
        
        /* Because the enumeration encapsulates the displayText(for:) method and image property, the data source method can focus on cell configuration. */
    }
}

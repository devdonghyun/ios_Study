//
//  ReminderDetailViewDataSource.swift
//  Today
//
//  Created by 안동현 on 2021/12/26.
//

import UIKit

class ReminderDetailViewDataSource: NSObject {
    enum ReminderRow: Int, CaseIterable {
        case title
        case date
        case time
        case notes
        
        /*
         Create a static property that formats a date
         with the short presentation of the time and no date
         */
        
        static let timeFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            return formatter
        } ()
        
        /*
         Create a static property that formats a date
         with the long presentation of the date and no time information
         
         DateFormatter has several predefined formats to use with enumeration values,
         such as .none, .short, and .long
         */
        
        static let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.timeStyle = .none
            formatter.dateStyle = .long
            return formatter
        } ()
        
        
        /* This method returns the appropriate text
           to display based on the current enumeration case.*/
        
        func displayText(for reminder: Reminder?) -> String? {
            switch self{
            case .title:
                return reminder?.title
            case .date:
                guard let date = reminder?.dueDate else { return nil }
                return Self.dateFormatter.string(from: date)
            case .time:
                guard let date = reminder?.dueDate else { return nil }
                return Self.timeFormatter.string(from: date)
            case .notes:
                return reminder?.notes
            }
        }
        
        
        /* This method returns the appropriate image
           to display based on the current enumeration case. */
        
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
    
    private var reminder: Reminder
    init(reminder: Reminder) {
        self.reminder = reminder
        super.init()
    }

}

extension ReminderDetailViewDataSource: UITableViewDataSource {
    /*
     Always codify identifier strings to ensure your app doesn’t crash
     because of a mistyped identifier.
    */
    static let reminderDetailCellIdentifier = "ReminderDetailCell" // constant for the cell identifier
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*
         A table view asks its data source for the number of rows in a section
         when determining how many cells can be displayed on screen.
        */
        return ReminderRow.allCases.count
         //The number of rows in the table view equals the number of cases in the enumeration.
         
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderDetailCellIdentifier, for: indexPath)
        let row = ReminderRow(rawValue: indexPath.row)
        cell.textLabel?.text = row?.displayText(for: reminder) // Use the ReminderRow instance to update the cell’s label.
        cell.imageView?.image = row?.cellImage
        
        return cell
        
        /* Because the enumeration encapsulates the displayText(for:) method and image property, the data source method can focus on cell configuration. */
    }
}

//
//  ReminderListDataSource.swift
//  Today
//
//  Created by 안동현 on 2021/12/26.
//

import UIKit

class ReminderListDataSource: NSObject {
    
    private lazy var dateFormatter = RelativeDateTimeFormatter()
    
}

extension ReminderListDataSource: UITableViewDataSource {
    // Add a constant for the cell identifier
    // The identifier determines which cell to display in the table row.
    
    static let reminderListCellIdentifier = "ReminderListCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reminder.testData.count // Return the number of sample reminders
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? ReminderListCell else {
            fatalError("Unable to dequeue ReminderCell")
        }
        
        let reminder = Reminder.testData[indexPath.row]
//        let image = reminder.isComplete ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
//        cell.titleLabel.text = reminder.title
//        cell.dateLabel.text = reminder.dueDate.description
//        cell.doneButton.setBackgroundImage(image, for: .normal)
//        cell.doneButtonAction = {
//            Reminder.testData[indexPath.row].isComplete.toggle()
//            tableView.reloadRows(at: [indexPath], with: .none)
//        }
        
        let dateText = dateFormatter.localizedString(for: reminder.dueDate, relativeTo: Date())
        
        cell.configure(title: reminder.title, dateText: dateText, isDone: reminder.isComplete) {
            Reminder.testData[indexPath.row].isComplete.toggle()
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        
        return cell
    }
    
}

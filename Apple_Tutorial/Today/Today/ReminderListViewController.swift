//
//  ViewController.swift
//  Today
//
//  Created by 안동현 on 2021/11/23.
//

import UIKit

class ReminderListViewController: UITableViewController {
    private var reminderListDataSource: ReminderListDataSource?
    
    
    static let showDetailSegueIdentifier = "ShowReminderDetailSegue"
    
    // This method notifies the view controller before a segue is performed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.showDetailSegueIdentifier,
           let destination = segue.destination as? ReminderDetailViewController,
           let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let reminder = Reminder.testData[indexPath.row]
            destination.configure(with: reminder)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  The viewDidLoad() method of UIViewController executes after the view controller loads the view into memory. This method is useful for initialization steps that require the view to be present.
        reminderListDataSource = ReminderListDataSource()
        tableView.dataSource = reminderListDataSource
    }
}

//extension ReminderListViewController {
//    // Add a constant for the cell identifier
//    // The identifier determines which cell to display in the table row.
//
//    static let reminderListCellIdentifier = "ReminderListCell"
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Reminder.testData.count // Return the number of sample reminders
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? ReminderListCell else {
//            fatalError("Unable to dequeue ReminderCell")
//        }
//
//        let reminder = Reminder.testData[indexPath.row]
////        let image = reminder.isComplete ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
////        cell.titleLabel.text = reminder.title
////        cell.dateLabel.text = reminder.dueDate.description
////        cell.doneButton.setBackgroundImage(image, for: .normal)
////        cell.doneButtonAction = {
////            Reminder.testData[indexPath.row].isComplete.toggle()
////            tableView.reloadRows(at: [indexPath], with: .none)
////        }
//
//        cell.configure(title: reminder.title, dateText: reminder.dueDate.description, isDone: reminder.isComplete) {
//            Reminder.testData[indexPath.row].isComplete.toggle()
//            tableView.reloadRows(at: [indexPath], with: .none)
//        }
//
//        return cell
//    }
//}
//

//
//  TableViewController.swift
//  Expenses
//
//  Created by Dylan Mouser on 1/25/19.
//  Copyright © 2019 Dylan Mouser. All rights reserved.
//

import UIKit

struct ExpensesData{
    let title: String?
    let amount: Double
    let date: Date
}

class ExpensesTableViewCell: UITableViewCell {
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var AmountLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
}

class TableViewController: UITableViewController {

    var data = [ExpensesData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [ExpensesData.init(title: "Dinner", amount: 32.50, date: convertToDate(dateString: "June 1, 2018 18:30")),
                ExpensesData.init(title: "Office Supplies", amount: 59.34, date: convertToDate(dateString: "May 30, 2018 12:17")),
                ExpensesData.init(title: "Uber", amount: 16.23, date: convertToDate(dateString: "May 30, 2018 11:43")),
                ExpensesData.init(title: "Coffee", amount: 3.95, date: convertToDate(dateString: "May 29, 2018 8:45"))]
    }
    
    func convertToDate(dateString: String) -> Date{
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MMMM d, yyyy HH:mm"
        
        let date = dateformatter.date(from: dateString)
        
        return date!
    }
    
    func convertToStringFromDate(date: Date) -> String{
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MMMM d, yyyy HH:mm"
        
        let dateString = dateformatter.string(from: date)
        
        return dateString
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpensesCell", for: indexPath) as! ExpensesTableViewCell
        
        let expenses = data[indexPath.row]
        cell.TitleLabel?.text = expenses.title
        cell.AmountLabel.text = "$" + expenses.amount.description
        cell.DateLabel.text = convertToStringFromDate(date: expenses.date)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}



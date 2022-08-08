//
//  ViewController.swift
//  MaxiDigitalCaseStudy
//
//  Created by MacOS on 8.08.2022.
//

import UIKit

class FaqViewController: UIViewController {
    
    static let FORM_CELL_IDENTIFIER = "FaqCell"
    
    // MARK: -- UI Items
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: -- Variables
    let formData = FaqDataModel()
    var expandedCellIndexes: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSetup()
        self.setGradientBackground()
    }
    
    // MARK: -- UI Setup
    
    func tableViewSetup() {
        self.tableView.register(UINib(nibName: FaqViewController.FORM_CELL_IDENTIFIER, bundle: nil), forCellReuseIdentifier: FaqViewController.FORM_CELL_IDENTIFIER)
        self.tableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)
        self.tableView.tableHeaderView = FaqTableHeaderView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 100))
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor.systemBlue.cgColor
        let colorBottom = UIColor.black.cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }

}

// MARK: -- UITableView DataSource

extension FaqViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.formData.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FaqCell = tableView.dequeueReusableCell(withIdentifier: FaqViewController.FORM_CELL_IDENTIFIER, for: indexPath) as! FaqCell
        let question = self.formData.questions[indexPath.row]
        let answer = self.formData.answers[indexPath.row]
        cell.questionLabel.text = question
        cell.answerLabel.text = answer
        cell.isExpanded = self.expandedCellIndexes.contains(indexPath.row)
        return cell
    }
}

// MARK: -- UITableView Delegate

extension FaqViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.expandedCellIndexes.contains(indexPath.row) == true {
            self.expandedCellIndexes.remove(at: self.expandedCellIndexes.firstIndex(of: indexPath.row)!)
        } else {
            self.expandedCellIndexes.append(indexPath.row)
        }
        self.tableView.reloadRows(at: [indexPath], with: .fade)
    }
}


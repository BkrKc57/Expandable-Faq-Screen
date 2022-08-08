//
//  FormTableViewCell.swift
//  MaxiDigitalCaseStudy
//
//  Created by MacOS on 8.08.2022.
//

import UIKit

class FaqCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var expandIconImageView: UIImageView!
    @IBOutlet weak var answerContainerView: UIView!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    var isExpanded: Bool = false {
        didSet {
            self.expandableValueChanged()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func expandableValueChanged() {
        self.answerContainerView.isHidden = !self.isExpanded
        self.expandIconImageView.image = self.isExpanded == true ? UIImage(named: "minus") : UIImage(named: "plus")
    }
}

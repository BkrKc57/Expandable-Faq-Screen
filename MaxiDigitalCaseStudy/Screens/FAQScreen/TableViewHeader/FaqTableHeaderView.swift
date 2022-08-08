//
//  TableHeaderView.swift
//  MaxiDigitalCaseStudy
//
//  Created by MacOS on 8.08.2022.
//

import UIKit

class FaqTableHeaderView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadFromNib()
    }
    
    func loadFromNib() {
        Bundle.main.loadNibNamed("FaqTableHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

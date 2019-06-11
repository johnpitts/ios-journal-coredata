//
//  EntryTableViewCell.swift
//  journal-coredata
//
//  Created by John Pitts on 6/10/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateViews() {
        
        guard let entry = entry else {return}
        titleLabel.text = entry.title
        storyLabel.text = entry.bodyText
        formatter.dateFormat = "dd.MM.yyyy"
        dateLabel.text = formatter.string(from: entry.timestamp!) // allowed to kill a kitten?
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    let formatter = DateFormatter()
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var storyLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    
}

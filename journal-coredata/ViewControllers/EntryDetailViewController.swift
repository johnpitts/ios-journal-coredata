//
//  EntryDetailViewController.swift
//  journal-coredata
//
//  Created by John Pitts on 6/10/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        guard let text = TextField.text,
        let textBody = textView.text else {return}
        if let entry = entry {  // entry is populated if coming from detail segue
            entryController?.updateEntry(entry: entry, title: text, bodyText: textBody)
        } else {
            entryController?.createEntry(title: text, bodyText: textBody)
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    
    private func updateViews() {
        guard isViewLoaded else {return} // to prevent shit from happening before viewDidLoad happens, view loaded from memory
        
        title = entry?.title ?? "Create Journal Entry" // sets nav-item title depending on situation, if entry = nil you get whats after the ??
        TextField.text = entry?.title
        textView.text = entry?.bodyText
        
    }
    
    @IBOutlet var TextField: UITextField!
    @IBOutlet var textView: UITextView!
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    @IBOutlet var segmentedControl: UIStackView!
    
    var entryController: EntryController?
}

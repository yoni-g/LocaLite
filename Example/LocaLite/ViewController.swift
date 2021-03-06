//
//  ViewController.swift
//  LocaLite
//
//  Created by Yonathan Goriachnick on 07/13/2020.
//  Copyright (c) 2020 Yonathan Goriachnick. All rights reserved.
//

import UIKit
import LocaLite

class ViewController: UIViewController {
    
    
    var languages = [String]()
    var currentUserLanguage: String!
    var currentSelection: String!
    
    @IBOutlet weak var testLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        testLabel.text = "some_text".localized()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.text = LocaLite.shared.getUserSelectedLangCode()
        label.textColor = .systemBlue
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        
//        self.view.bounds.
        //   LocaLite.printName()
         
//        languages = LocaLite.getAvailableLanguages() ?? []
//        currentUserLanguage = LocaLite.getUserSelectedLang()
//        currentSelection = currentUserLanguage
//
//        LocaLite.setUserSelectedlangCodeLang(with: self.currentSelection)
        // Do any additional setup after loading the view, typically from a nib.
//        let settings : [Localite.LocaLiteSettings] = [
//            .supportRTL(false),
//            .forceLTRViews(["SomeView"]),
//            .supportedLanguagesCodes(["he","fr","en"]),
//            .defaultLanguageCode("en")
//        ]
        
//
    }
    @IBAction func buttonTapedAction(_ sender: Any) {
        let lang = LocaLite.shared.getUserSelectedLangCode() == "he" ? "en" : "he"
        
        LocaLite.shared.setSelectedLang(lang, withHandler: {
            print("chnaged")
        }, runDefualtHandler: false)
//        testLabel.relo
//        self.viewToReload.layoutIfNeeded()
//        testLabel.text = "Some stufffff"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentSelection = languages[indexPath.row]
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "langTableViewCell", for: indexPath) as UITableViewCell
        let langCode = languages[indexPath.row]
//        guard let language = LocaLite.getLanguageDisplayName(langCode: langCode) else {
//            return cell
//        }
        cell.textLabel?.text = langCode
        cell.isSelected = langCode == currentSelection
        return cell
    }
}


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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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


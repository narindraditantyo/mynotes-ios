//
//  ViewController.swift
//  mynotes
//
//  Created by Narindra Aditantyo on 08/11/20.
//  Copyright © 2020 Narindra Aditantyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var notesTV: UITableView!
    
    var toggleCategories: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MyNotes"
        
        registerSettingsBundle()
        toggleCategoryFromDefaults()
        
        notesTV.dataSource = self
        notesTV.delegate = self
        
        notesTV.register(UINib(nibName: "NotesTableViewCell", bundle: nil), forCellReuseIdentifier: "NotesCell")
    }
    
    func registerSettingsBundle() {
        let noteDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: noteDefaults)
    }
    
    func toggleCategoryFromDefaults() {
        toggleCategories = UserDefaults.standard.bool(forKey: "toggleCategories")
    }
    
    @IBAction func addNote(_ sender: Any) {
        let addNote = AddEditViewController(nibName: "AddEditViewController", bundle: nil)
        
        addNote.categoryIndex = nil
        addNote.noteIndex = nil
        
        self.navigationController?.pushViewController(addNote, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editNote = AddEditViewController(nibName: "AddEditViewController", bundle: nil)
        
        editNote.category = arrCategories[indexPath.section]
        editNote.note = arrNotes[indexPath.section][indexPath.row]
        editNote.categoryIndex = indexPath.section
        editNote.noteIndex = indexPath.row
        
        self.navigationController?.pushViewController(editNote, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrNotes[indexPath.section].remove(at: indexPath.row)
            self.notesTV.deleteRows(at: [indexPath], with: .automatic)
            
            if arrNotes[indexPath.section].count == 0 {
                arrNotes.remove(at: indexPath.section)
                arrCategories.remove(at: indexPath.section)
                self.notesTV.deleteSections(IndexSet(arrayLiteral: indexPath.section), with: .automatic)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrCategories.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return toggleCategories ? UITableView.automaticDimension : 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrCategories[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNotes[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell  = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as? NotesTableViewCell {
            let note = arrNotes[indexPath.section][indexPath.row]
            
            cell.textTitle.text = note.title
            cell.textDesc.text = note.desc
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        notesTV.reloadData()
    }
    
}

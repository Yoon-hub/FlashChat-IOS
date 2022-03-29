//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var meesages : [Message] = [
        Message(sender: "1@2.com", body: "Hey!"),
        Message(sender: "a@b.com", body: "Hey!"),
        Message(sender: "1@2.com", body: "Hey!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.delegate = self
        tableView.dataSource = self
        title = "⚡️FlashChat"
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        navigationController?.popToRootViewController(animated: true)
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
      
    }
    
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meesages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        //프로토타입셀을 가지고 몇개를 만들까
        cell.textLabel?.text = meesages[indexPath.row].body  //셀 데이터를 요청하는 행 번호에 해당
        return cell
    }
}

//extension ChatViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//    }
//
//}

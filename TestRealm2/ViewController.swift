//
//  ViewController.swift
//  TestRealm2
//
//  Created by 高橋 辰之 on 2019/04/18.
//  Copyright © 2019年 TatsuyukiTakahashi. All rights reserved.
//

import UIKit
import RealmSwift

/*
 *
 */
class ViewController: UIViewController {

    @IBOutlet weak var tField: UITextField!
    @IBOutlet weak var customTable: UITableView!
    var itemList: Results<TodoModel>!

    override func viewDidLoad() {

        super.viewDidLoad()
        let insRealm1 = try! Realm()
        self.itemList = insRealm1.objects(TodoModel.self)
    }

    @IBAction func btnAdd(_ sender: Any) {

        let insTodoModel:TodoModel = TodoModel()
        insTodoModel.itemName = self.tField.text
        let insRealm2 = try! Realm()

        try! insRealm2.write {
            insRealm2.add(insTodoModel)
        }

        self.customTable.reloadData()
        self.tField.text = ""
    }
}

/*
 *
 */
extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.itemList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let customCell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        let item:TodoModel = self.itemList[(indexPath as NSIndexPath).row]
        customCell.textLabel?.text = item.itemName

        return customCell
    }
}

//
//  ViewController.swift
//  Basic-TableView
//
//  Created by Kang Paul on 2018/9/9.
//  Copyright © 2018年 Kang Paul. All rights reserved.
//
//1. 將 TableView 加到 ViewController，並設定適當大小。
//2. 將 TableViewCell 加到 Table View，將 Identifier 設為 itemCell。
//3. 在 ViewController.swift 中，
//   3.a ViewController class 宣告使用 UITableViewDelegate, UITableViewDataSource 兩個 protocols。
//   3.b 連結 TableView 名為 tableView 的 IBOutlet。
//   3.c 宣告要在 TableViewCell 顯示的字串陣列，itemArray。
//   3.d 在 viewDidLoad() 中設定 tableView 中 dataSource 和 delegate 為 self。
//   3.e 在 viewDidLoad() 中初始 itemArray。
//   3.f 實作 tableView dataSource protocol 的 numberOfRowInSection，傳回 itemArray 內項目的個數。
//   3.g 實作 tableView dataSource protocol 的 cellForRowAt，會用到奇怪的 dequeReusableCell 見這裡說明。
//   3.h 實作 tableView delegate protocol 的 didSelectRowAt，這裡只 print 訊息，然後[optional] deselect 該 row。


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var itemArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        for i in 1...100 {
            itemArray.append("Item #\(i)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select row at \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


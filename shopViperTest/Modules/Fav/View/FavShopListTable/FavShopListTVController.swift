//
//  TableViewController.swift
//  Flash Chat
//
//  Created by Elias on 03/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
//import Firebase

class FavShopListTVController: NSObject, UITableViewDelegate, UITableViewDataSource {
  
  weak var tableView: UITableView! = nil
  public weak var delegate: Protocol!
  
  var data = [ShopListElement]()
  var protocolVC: FavSharedWithTable?
  
  override init() {}
  
  convenience init(tableView: UITableView) {
    self.init()
    
    self.tableView = tableView
    
    tableView.register(UINib(nibName: "FavShopListTVCell", bundle: nil), forCellReuseIdentifier: "FavShopListTVCell")
    
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 120.0
  }
  
//  convenience init(tableView: UITableView, delegate: Protocol!) {
//    self.init()
//
//    self.tableView = tableView
//    tableView.delegate = self
//    tableView.dataSource = self
//    self.delegate = delegate
//
//    tableView.rowHeight = UITableView.automaticDimension
//    tableView.estimatedRowHeight = 120.0
//  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "FavShopListTVCell", for: indexPath)  as! FavShopListTVCell
    
    cell.imageOfItem.image = data[row].image
    cell.titleOfItem.text = data[row].name
    cell.descriptionOfItem.text = data[row].shortDescription
    cell.priceOfItem.text = "$ \(data[row].price!)"
    
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return data.count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let row = indexPath.row
//    print(row)
    protocolVC?.onTableCellTap(element: data[row])
    
  }
  
  public func updateData(array: [ShopListElement]) {
    data = array
    tableView.reloadData()
    protocolVC?.hud!.dismiss(animated: true)
  }
  
  
}

//
//  ScrollDemo.swift
//  AlamofireDemo
//
//  Created by ispl Mac Mini on 8/9/17.
//  Copyright © 2017 infinium. All rights reserved.
//

import UIKit

class ScrollDemo: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate{

    @IBOutlet var tblView: UITableView!
    
    @IBOutlet var scrView: UIScrollView!
    @IBOutlet var viewContainer: UIView!
    @IBOutlet var btnDataAdd: UIButton!
    var  arrTxtData:NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ScrollDemo.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        scrView.contentSize=viewContainer.frame.size
        arrTxtData=NSMutableArray(array: ["hi.."])
        
        self.btnDataAdd.layoutIfNeeded()
    }

    override func viewWillLayoutSubviews() {
        btnDataAdd.frame = CGRect(x: btnDataAdd.frame.origin.x, y: (self.tblView.frame.origin.y + (CGFloat(arrTxtData.count*150))), width: btnDataAdd.frame.size.width, height: btnDataAdd.frame.size.height)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrTxtData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell") as! ScrollDemoCell
        
        cell.txtData.text=arrTxtData.object(at: indexPath.row) as! String
        
        cell.btnAdd.tag=indexPath.row
        cell.btnAdd.addTarget(self, action: #selector(ScrollDemo.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
        
        cell.txtData.tag=indexPath.row
        cell.txtData.delegate=self
        
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        
        return cell
    }
    func textViewDidChange(_ textView: UITextView)
    {
        arrTxtData.replaceObject(at: textView.tag, with: textView.text)
    }
    func buttonClicked(_ sender : UIButton)
    {
        arrTxtData.insert("hello..", at: sender.tag+1)
        
        self.tblView.frame = CGRect(x: self.tblView.frame.origin.x,y: self.tblView.frame.origin.y,width: self.tblView.frame.size.width,height: (CGFloat(arrTxtData.count*150)))
        
        btnDataAdd.frame = CGRect(x: btnDataAdd.frame.origin.x, y: (self.tblView.frame.origin.y + (CGFloat(arrTxtData.count*150))), width: btnDataAdd.frame.size.width, height: btnDataAdd.frame.size.height)
        
        viewContainer.frame = CGRect(x: viewContainer.frame.origin.x, y: viewContainer.frame.origin.y, width: viewContainer.frame.size.width, height: (btnDataAdd.frame.origin.y + 40))
        tblView.reloadData()
    
        scrView.contentSize=viewContainer.frame.size
        
        self.tblView.translatesAutoresizingMaskIntoConstraints = true
        self.btnDataAdd.translatesAutoresizingMaskIntoConstraints = true
        self.viewContainer.translatesAutoresizingMaskIntoConstraints = true
    }
}

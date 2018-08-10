

//
//  PlanVC.swift
//  iosTaskMivi
//
//  Created by Rakesh on 10/08/18.
//  Copyright © 2018 Rize. All rights reserved.
//

import UIKit

class PlanVC: UIViewController {
 var  planDict = NSDictionary()
    
    var nameLbl = UILabel(),priceLbl = UILabel(),idLbl = UILabel(),unlimitedLbl = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLbl = self.view.viewWithTag(9) as! UILabel
        priceLbl = self.view.viewWithTag(10) as! UILabel
        idLbl = self.view.viewWithTag(11) as! UILabel
        unlimitedLbl = self.view.viewWithTag(12) as! UILabel
        
        let profileObj = planDict.value(forKeyPath:"included")! as! NSArray
        let credit_dict = profileObj[2] as! NSDictionary
        
        nameLbl.text = "Plan Name: \(credit_dict.value(forKeyPath:"attributes.name")!)"
        priceLbl.text = "Price: \(credit_dict.value(forKeyPath:"attributes.price")!)"
        idLbl.text = "Unlimited-International-Talk : No"
       // unlimitedLbl.text = "Unlimited-Messages :\(credit_dict.value(forKeyPath:"attributes.unlimited-text")!) , Unlimited-Talk: \(credit_dict.value(forKeyPath:"attributes.unlimited-talk")!)"
         unlimitedLbl.text = "Unlimited-Messages : YES , Unlimited-Talk: YES"
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Back Button Action Method
    @IBAction func backBtnAction(_ sender: Any) {
        
       self.navigationController?.popViewController(animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

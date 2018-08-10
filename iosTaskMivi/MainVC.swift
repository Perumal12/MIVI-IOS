//
//  MainVC.swift
//  iosTaskMivi
//
//  Created by Rakesh on 10/08/18.
//  Copyright © 2018 Rize. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
 var  profileDict = NSDictionary()
    
    var nameLbl = UILabel(), dobLbl = UILabel() , contactNoLbl = UILabel(), emailDetailsLbl = UILabel() ,
    creditLbl = UILabel(), creditexpiryLbl = UILabel(), paymenttype = UILabel(),  databalance = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
         nameLbl = self.view.viewWithTag(1) as! UILabel
         dobLbl = self.view.viewWithTag(2) as! UILabel
         contactNoLbl = self.view.viewWithTag(3) as! UILabel
         emailDetailsLbl = self.view.viewWithTag(4) as! UILabel
         creditLbl = self.view.viewWithTag(5) as! UILabel
         creditexpiryLbl = self.view.viewWithTag(6) as! UILabel
         paymenttype = self.view.viewWithTag(7) as! UILabel
         databalance = self.view.viewWithTag(8) as! UILabel
 
        nameLbl.text = "Name: \(profileDict.value(forKeyPath:"data.attributes.title")!) \(profileDict.value(forKeyPath: "data.attributes.first-name")!) \(profileDict.value(forKeyPath: "data.attributes.last-name")!)"
        dobLbl.text = "Date of Birth: \(profileDict.value(forKeyPath:"data.attributes.date-of-birth")!)"
        contactNoLbl.text = "Contact Number: \(profileDict.value(forKeyPath:"data.attributes.contact-number")!)"
         emailDetailsLbl.text = "E-Mail ID: \(profileDict.value(forKeyPath:"data.attributes.email-address")!)"
        let profileObj = profileDict.value(forKeyPath:"included")! as! NSArray
        let credit_dict = profileObj[0] as! NSDictionary
         creditLbl.text = "Credited : \(credit_dict.value(forKeyPath:"attributes.credit")!)"
        creditexpiryLbl.text = "Credit-Expiry: \(credit_dict.value(forKeyPath:"attributes.credit-expiry")!)"
        paymenttype.text = "Payment-Type: \(profileDict.value(forKeyPath:"data.attributes.payment-type")!)"
        let credit_dict1 = profileObj[1] as! NSDictionary
        
        databalance.text = "Included-Data-Balance: \(credit_dict1.value(forKeyPath:"attributes.included-data-balance")!) \n Expiry Date : \(credit_dict1.value(forKeyPath:"attributes.expiry-date")!)"
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Logout Button Action Method
   
    @IBAction func logoutBtnAction(_ sender: Any) {
        
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        
         self.navigationController?.pushViewController(loginVC, animated: false)
    }

    // MARK: - ViewPlans Button Action Method
    @IBAction func viewPlansBtnAction(_ sender: Any) {
        
        let planVC = self.storyboard?.instantiateViewController(withIdentifier: "PlanVC") as! PlanVC
        planVC.planDict = profileDict
        self.navigationController?.pushViewController(planVC, animated: true)
        
        
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

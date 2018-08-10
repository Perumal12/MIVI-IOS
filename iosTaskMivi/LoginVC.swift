//
//  LoginVC.swift
//  iosTaskMivi
//
//  Created by Rakesh on 10/08/18.
//  Copyright © 2018 Rize. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var mobileNumberTF: UITextField!
    
 
    @IBOutlet var passwordTF: UITextField!
    
    var collectionDict = NSDictionary()
   // var dataDict = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        collectionDict = loadJson(filename: "collection")! as NSDictionary
        //mobileNumberTF.text = "test@mivi.com"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
     // MARK: - Login Button Action Method
    
    @IBAction func loginBtnAction(_ sender : UIButton){
        
        if (mobileNumberTF.text?.isEmpty)!{
            
            alertView(title:"Login", message: "Please fill the details")
            
        }else{
            
            if mobileNumberTF.text == collectionDict.value(forKeyPath: "data.attributes.contact-number")! as? String || mobileNumberTF.text == collectionDict.value(forKeyPath: "data.attributes.email-address")! as? String{
                
                let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainVC
                mainVC.profileDict = collectionDict
                self.navigationController?.pushViewController(mainVC, animated: true)
                
                
            }else{
                
                alertView(title:"Error", message: "Enter Valid Email/Mobile Number Details")
                
            }
          
        }

   }
    
     // MARK: - TextField Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        return true
    }
    // MARK: - To Load Json Data From Collection
    
    func loadJson(filename fileName: String) -> [String: AnyObject]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf:url)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? [String: AnyObject] {
                    
                    return dictionary
                }
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        return nil
    }
    // MARK: - Display AlertView Method
    
    func alertView(title : String ,message : String){
        let alertView = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction.init(title: "OK", style: .default, handler: { (UIAlertAction) in
            self.mobileNumberTF.text = ""
            self.passwordTF.text = ""
            
        })
        alertView.addAction(okAction)
        
        self.present(alertView, animated: true, completion: nil)
    }

}

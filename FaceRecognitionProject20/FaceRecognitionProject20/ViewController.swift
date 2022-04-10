//
//  ViewController.swift
//  FaceRecognitionProject20
//
//  Created by Yavuz Güner on 23.02.2022.
//

import UIKit
import LocalAuthentication
//Bunu yüz tanıma için yapmamız lazım.

class ViewController: UIViewController {

    @IBOutlet weak var warningLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInButtonClicked(_ sender: Any) {
        
        //Segue yapıcaz ama ondan önce yüz okuma gerçekleşmesi lazım.
        let autContext = LAContext()
        var error : NSError?
        
        if autContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            autContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { (success, error) in
                if success == true{
                    DispatchQueue.main.async {
                        //successful auth. Başarılı giriş oldu mu segueyi yaparız.
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                }else{
                    DispatchQueue.main.async {
                        self.warningLabel.text = "Error!"
                    }
                    
                }
            }
            
        }
            
            //ya deviceOwnerAuthentication yapıp yüz tanımlamayı yapacağız
        
    }
    
}


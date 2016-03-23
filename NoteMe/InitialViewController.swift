//
//  InitialViewController.swift
//  Notester
//
//  Created by Pierre on 3/22/16.
//  Copyright © 2016 pierre. All rights reserved.
//

import UIKit
import DigitsKit


class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let userSession = Digits.sharedInstance().session()
        
        let authButton = DGTAuthenticateButton(authenticationCompletion: { (session: DGTSession?, error: NSError?) in
            if (session != nil) {
                // TODO: associate the session userID with your user model
                let message = "Phone number: \(session!.phoneNumber)"
                let alertController = UIAlertController(title: "You are logged in!", message: message, preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: .None))
                self.presentViewController(alertController, animated: true, completion: .None)
            } else {
                NSLog("Authentication error: %@", error!.localizedDescription)
            }
        
            //MARK: Contact Search
            let contacts = DGTContacts(userSession: userSession)
            contacts.startContactsUploadWithCompletion({ (result, error) -> Void in
                if (error != nil) {
                    print(error.localizedDescription)
                }
                contacts.lookupContactMatchesWithCursor(nil, completion: { (contacts, nextCursor, error) -> Void in
                    let userArray = contacts as? [DGTUser]
                    self.performSegueWithIdentifier("friendSegue", sender: self)
                })
            })
        })
        authButton.center = self.view.center
        self.view.addSubview(authButton)
        
        
        /*
        //MARK: Access User Email
        let configuration = DGTAuthenticationConfiguration(accountFields: .Email)
        configuration.title = "Login to Digits"
        let digits = Digits.sharedInstance()
        digits.authenticateWithViewController(nil, configuration: configuration) { session, error in
            // Inspect session to access the email address of the user
        }
        */
        
        
        //MARK: Find Your Friends
        
  
        
        
        //MARK: Appearance
        
        // Create and initialize a DGTAppearance object with default appearance:
        let digits = Digits.sharedInstance()
        let configuration = DGTAuthenticationConfiguration(accountFields: .DefaultOptionMask)
        configuration.appearance = DGTAppearance()
        
        // Start the authentication flow with the custom appearance. Nil parameters for default values.
        digits.authenticateWithViewController(nil, configuration:configuration) { (session, error) in
            // Inspect session/error objects
        }
        
        // Change color properties to customize the look:
        configuration.appearance.backgroundColor = UIColor.blackColor()
        configuration.appearance.accentColor = UIColor.greenColor()
        
        // Change font properties to customize the look:
        configuration.appearance.headerFont = UIFont(name: "HelveticaNeue", size: 18)
        configuration.appearance.labelFont = UIFont(name: "HelveticaNeue-Bold", size: 16)
        configuration.appearance.bodyFont = UIFont(name: "HelveticaNeue-Italic", size: 16)

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

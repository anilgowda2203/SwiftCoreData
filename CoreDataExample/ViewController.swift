//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Anil Gowda on 10/8/14.
//  Copyright (c) 2014 Adeptpros. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var textUsername:UITextField!
    @IBOutlet var textPassword:UITextField!

   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fetch()
    {
        var appDel:AppDelegate=(UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext=appDel.managedObjectContext!
        
        var request=NSFetchRequest(entityName: "Credentials")
        request.returnsObjectsAsFaults = false
        
        var results:NSArray=context.executeFetchRequest(request, error: nil)!
        
        for res in results
        {
            println(res)
        }
    }
    @IBAction func save()
    {
        var appDel:AppDelegate=(UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext=appDel.managedObjectContext!
        
        var newUser: AnyObject!=NSEntityDescription.insertNewObjectForEntityForName("Credentials", inManagedObjectContext: context)
        newUser.setValue(textUsername.text, forKey: "username")
        newUser.setValue(textPassword.text , forKey: "password")
        
        var error:NSErrorPointer!
        context.save(nil)
        
        println(newUser)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return textField.resignFirstResponder()
    }
}


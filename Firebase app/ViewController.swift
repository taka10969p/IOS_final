//
//  ViewController.swift
//  Firebase app
//
//  Created by Aaron Xue on 2021/5/26.
//

import Foundation
import UIKit

import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class ViewController: UIViewController {    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = FirestoreSettings()
       
        Firestore.firestore().settings = settings
    }
}

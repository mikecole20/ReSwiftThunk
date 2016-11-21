//
//  ViewController.swift
//  ReSwiftThunkDemo
//
//  Created by Mike Cole on 11/21/16.
//  Copyright © 2016 iOS Mike. All rights reserved.
//

import ReSwift
import UIKit

class ViewController: UIViewController, StoreSubscriber {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var loggingInLabel: UILabel!
    @IBOutlet weak var loggedInLabel: UILabel!
    @IBOutlet weak var loginErrorLabel: UILabel!
    
    @IBOutlet weak var loginGoodButton: UIButton!
    @IBOutlet weak var loginBadButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    // MARK: - Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        mainStore.unsubscribe(self)
    }
    
    // MARK: - IBActions
    
    @IBAction func loginWithGoodCredentials(_ sender: Any) {
        let action = ActionCreators.login(validCredentials: true)
        mainStore.dispatch(action)
    }
    
    @IBAction func loginWithBadCredentials(_ sender: Any) {
        let action = ActionCreators.login(validCredentials: false)
        mainStore.dispatch(action)
    }
    
    @IBAction func logout(_ sender: Any) {
        let action = ActionCreators.logout()
        mainStore.dispatch(action)
    }
    
    // MARK: - StoreSubscriber
    
    func newState(state: AppState) {
        loginGoodButton.isEnabled = !state.loggedIn && !state.loggingIn
        loginBadButton.isEnabled = !state.loggedIn && !state.loggingIn
        logoutButton.isEnabled = state.loggedIn
        
        loggingInLabel.text = "Logging in: \(state.loggingIn)"
        loggedInLabel.text = "Logged in: \(state.loggedIn)"
        loginErrorLabel.text = "Login Error: \(state.loginError)"
    }

}


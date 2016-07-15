//
//  ViewController.swift
//  tapper
//
//  Created by Maurice Ben-Oduro on 7/15/16.
//  Copyright © 2016 iocreate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    @IBAction func playBtnPressed(sender: UIButton!){
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != ""{
            
            logoImg.hidden = true
            howManyTapsTxt.hidden = true
            playBtn.hidden = true
            
            tapBtn.hidden = false
            tapsLbl.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLbl()
            
        }
    }
    
    @IBAction func coinBtnPressed(sender: UIButton!){
        
        currentTaps += 1
        
        updateTapsLbl()
        
        if isGameOver(){
            restartGame()
        }
    }
    
    func updateTapsLbl(){
        tapsLbl.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool{
        if currentTaps >= maxTaps{
            return true
        }else{
            return false
        }
    }
    
    func restartGame(){
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.hidden = false
        howManyTapsTxt.hidden = false
        playBtn.hidden = false
        
        tapBtn.hidden = true
        tapsLbl.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

}


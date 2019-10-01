//
//  ViewController.swift
//  LocusApp
//
//  Created by macbook on 2019-09-18.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderval: UISlider!
    @IBOutlet weak var txtout: UITextField!
    @IBOutlet weak var Scoretext: UITextField!
    @IBOutlet weak var roundtext: UILabel!
    @IBOutlet weak var slidervalueminustarget: UITextField!
    var randomNUM = 0
    var SCORE = 0
    var ROUND=0
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomInt = Int.random(in: 5..<99)
        randomNUM=randomInt
        txtout.text = "Try to get the slider to hit:" + String(randomInt)
        roundtext.text="Round:"+String(ROUND)
        
        
        // Do any additional setup after loading the view.
    }

   
    @IBAction func locusslider(_ sender: UISlider) {
        _ = Int(sender.value)
        let difference = Int(sliderval.value)-randomNUM
        if difference < 0{
            
            slidervalueminustarget.text="Move right: "+String(abs(difference))+"units"
        }
        else if difference > 0{
            slidervalueminustarget.text="Move left: "+String(abs(difference))+"units"
        }
        else{
            slidervalueminustarget.text="Your right over it!!!"
        }
        
}

    @IBAction func btnhit(_ sender: Any) {
        if Int(sliderval.value) >= randomNUM-10 && Int(sliderval.value) <= randomNUM+10{
            if(Int(sliderval.value) ==  randomNUM){
                SCORE = SCORE + 101
            }
            else if Int(sliderval.value) >= randomNUM-1 && Int(sliderval.value) <= randomNUM+1{
                SCORE = SCORE + 51
            }
            else{
            SCORE = SCORE + 1
            }
            Scoretext.text = "Score:"+String(SCORE)
            let alert = UIAlertController(title:"Good one!",message:"Score One up! ",preferredStyle: .actionSheet)
            let action = UIAlertAction(title:" Back",style:.default,handler:nil)
            alert.addAction(action)
            present(alert,animated:true,completion:nil)
            let randomInt = Int.random(in: 5..<99)
            randomNUM=randomInt
            txtout.text = "Try to get the slider to hit:" + String(randomInt)
        }
        else{
            let alert = UIAlertController(title:"Sorry",message:"Score Stays the same!! ",preferredStyle: .actionSheet)
            let action = UIAlertAction(title:"Back",style:.default,handler:nil)
            alert.addAction(action)
            present(alert,animated:true,completion:nil)
            let randomInt = Int.random(in: 5..<99)
            randomNUM=randomInt
            txtout.text = "Try to get the slider to hit:" + String(randomInt)
    }
}


    @IBAction func startover(_ sender: Any) {
        Scoretext.text = "Score:0"
        SCORE = 0
        ROUND=ROUND+1
        roundtext.text="Round:"+String(ROUND)
        let randomInt = Int.random(in: 5..<99)
        randomNUM=randomInt
        txtout.text = "Try to get the slider to hit:" + String(randomInt)
    }
    
}

// My btnhit function is the show alert function,it is the button action itself instance variables are variables that are variable of the class or object. A object is instance of a class ,so variables
//Class variables are Scoretext,txtout,sliderval etc and local variables are variables used locally like inside button functions or slider functions for example difference,randomInt etc.
//SCORE randomNUM etc are globally declared.

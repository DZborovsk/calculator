//
//  ViewController.swift
//  ex03
//
//  Created by Danyil ZBOROVKYI on 6/24/19.
//  Copyright © 2019 Danyil ZBOROVKYI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    let add = 11
    let subtraction = 12
    let multiply = 15
    let devision = 16
    let result = 17
    let min = -2147483649
    let max = 2147483648
    
    var val1 = 0
    var val2 = 0
    var type = 0
    var isOperation: Bool = false
    var permissionForMath: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func acButton() {
        resultLabel.text = "0"
        val1 = 0
        val2 = 0
        isOperation = false
        permissionForMath = false
        type = 0
    }
    
    func math() {
        if type == add && val1 + val2 < max {
            val1 = val1 + val2
        } else if type == subtraction && val2 - val1 > min {
            val1 = val2 - val1
        } else if type == multiply && val1 * val2 < max && val1 * val2 > min {
            val1 = val1 * val2
        } else if type == devision && val1 != 0 && val2 / val1 < max {
            val1 = val2 / val1
        } else {
            print("overflow")
            acButton()
        }
        resultLabel.text = String(val1)
    }
    
    @IBAction func button(_ sender: UIButton) {
        if isOperation {
            isOperation = false
            val1 = 0
            
            if type == result {
                val2 = 0
            } else {
                permissionForMath = true
            }
        }
        if val1 >= 0 && val1 * 10 + sender.tag < max {
            val1 = val1 * 10 + sender.tag
        } else if val1 < 0 && val1 * 10 - sender.tag > min {
            val1 = val1 * 10 - sender.tag
        } else {
            print("overflow")
            acButton()
        }
        resultLabel.text = String(val1)
    }
    
    @IBAction func operationButton(_ sender: UIButton) {
        isOperation = true
        if sender.tag == result && permissionForMath == true {
            permissionForMath = false
            if type == devision && val1 == 0 {
                resultLabel.text = "Not a number"
            } else {
                math()
            }
        }
        if permissionForMath == true {
            permissionForMath = false
            if type == devision && val1 == 0 {
                resultLabel.text = "Not a number"
            } else {
                math()
            }
            val2 = val1
        } else {
            val2 = val1
        }
        type = sender.tag
    }
    
    @IBAction func negButton(_ sender: UIButton) {
        if val1 < max {
            val1 = -val1
            resultLabel.text = String(val1)
        } else if -val1 > min {
            val1 = -val1
            resultLabel.text = String(val1)
        } else {
            print("overflow")
            acButton()
        }
    }
}

//
//  ViewController.swift
//  AccelerometerApp
//
//  Created by Salvador Marquez on 6/7/19.
//  Copyright © 2019 Citsa Digital. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var lblX: UILabel!
    @IBOutlet weak var lblY: UILabel!
    @IBOutlet weak var lblZ: UILabel!
    
    var motionManager : CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }

    func updateLabels(data: CMAccelerometerData?, error: Error?){
        guard let accelerometerData = data else {return}
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 2
        
        let x = formatter.string(for: accelerometerData.acceleration.x)
        let y = formatter.string(for:accelerometerData.acceleration.y)
        let z = formatter.string(for: accelerometerData.acceleration.z)
        
        lblX.text = "X: \(x!)"
        lblY.text = "Y: \(y!)"
        lblZ.text = "Z: \(z!)"
        
    }


}


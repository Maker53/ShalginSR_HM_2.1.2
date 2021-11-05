//
//  ViewController.swift
//  ShalginSR_HM_2.1.2
//
//  Created by Станислав on 05.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var redSignal: UIView!
    @IBOutlet var orangeSignal: UIView!
    @IBOutlet var greenSignal: UIView!
    
    @IBOutlet var changeSignalButton: UIButton!
    
    //MARK: - Private Properties
    private var currentSignal = CurrentSignal.red
    private let signalIsOn: CGFloat = 1.0
    private let signalIsOff: CGFloat = 0.3
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeSignalButton.layer.cornerRadius = 10
    }
    
    override func viewWillLayoutSubviews() {
        redSignal.layer.cornerRadius = redSignal.frame.width / 2
        orangeSignal.layer.cornerRadius = redSignal.frame.width / 2
        greenSignal.layer.cornerRadius = redSignal.frame.width / 2
    }
    
    // MARK: - IB Actions
    @IBAction func changeSignalButtonPressed() {
        if changeSignalButton.currentTitle == "START" {
            changeSignalButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentSignal {
        case .red:
            greenSignal.alpha = signalIsOff
            redSignal.alpha = signalIsOn
            currentSignal = .orange
        case .orange:
            redSignal.alpha = signalIsOff
            orangeSignal.alpha = signalIsOn
            currentSignal = .green
        case .green:
            orangeSignal.alpha = signalIsOff
            greenSignal.alpha = signalIsOn
            currentSignal = .red
        }
    }
}

// MARK: - Private enum
extension ViewController {
    private enum CurrentSignal {
        case red
        case orange
        case green
    }
}

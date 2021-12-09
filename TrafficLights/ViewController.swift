//
//  ViewController.swift
//  TrafficLights
//
//  Created by Сашок on 07.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchStateButton: UIButton!
    @IBOutlet weak var trafficLightsStackView: UIStackView!
    
    private let startTitle = "START"
    private let nextTitle = "NEXT"
    
    private let turnOffAlpha = CGFloat(0.3)
    private let turnOnAlpha = CGFloat(1)
    
    private var currentLightIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchStateButton.setTitle(startTitle, for: .normal)
        
        trafficLightsStackView.subviews.forEach() {
            $0.alpha = turnOffAlpha
        }
    }
    
    override func viewWillLayoutSubviews() {
        switchStateButton.layer.cornerRadius = 10
        
        trafficLightsStackView.subviews.forEach() {
            $0.layer.cornerRadius = $0.frame.width * 0.5
        }
    }

    @IBAction func switchStateButtonPressed() {
        currentLightIndex += 1
        currentLightIndex %= trafficLightsStackView.subviews.count
        
        let title = currentLightIndex < 0 ? startTitle : nextTitle
        switchStateButton.setTitle(title, for: .normal)
        
        trafficLightsStackView.subviews.enumerated().forEach() {
            let alphaValue = $0.offset == currentLightIndex ? turnOnAlpha : turnOffAlpha
            $0.element.alpha = alphaValue
        }
    }
}


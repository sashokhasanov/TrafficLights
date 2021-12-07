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
    
    var currentLightIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchStateButton.setTitle(startTitle, for: .normal)
        
        trafficLightsStackView.subviews.forEach() {
            $0.layer.cornerRadius = $0.bounds.width * 0.5
        }
    }

    @IBAction func switchStateButtonPressed() {
        
        let title = currentLightIndex < 0 ? startTitle : nextTitle
        switchStateButton.setTitle(title, for: .normal)
        
        currentLightIndex += 1
        currentLightIndex %= trafficLightsStackView.subviews.count
        
        trafficLightsStackView.subviews.enumerated().forEach() {
            $0.element.alpha =
                $0.offset == currentLightIndex ? turnOnAlpha : turnOffAlpha
        }
    }
    
    private let startTitle = "START"
    private let nextTitle = "NEXT"
    
    private let turnOffAlpha = CGFloat(0.5)
    private let turnOnAlpha = CGFloat(1)
    
}


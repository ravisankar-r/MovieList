//
//  FilterViewController.swift
//  MovieList
//
//  Created by ctsuser1 on 5/6/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation
import UIKit

protocol FilterViewDelegate {
    
    func onApplyFilterAction(maxYear:String,minYear:String)
}

class FilterViewController : UIViewController , UIGestureRecognizerDelegate{
    
    @IBOutlet weak var labelMinYear : UILabel!
    @IBOutlet weak var labelMaxyear : UILabel!
    @IBOutlet weak var sliderMinYear : UISlider!
    @IBOutlet weak var sliderMaxYear : UISlider!
    @IBOutlet weak var buttonApplyFilter : UIButton!
    
    var delegate: FilterViewDelegate?
    var filterValues:(maxyear:String,minYear:String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filter = filterValues{
                updateSliderValues(maxYear: filter.maxyear, minYear: filter.minYear)
        }
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapGesture))
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.delegate = self
        self.view.addGestureRecognizer(tapGestureRecognizer)
    
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == gestureRecognizer.view
    }

    func onTapGesture(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            dismissView()
        }
    }
    
    func dismissView(){
        self.dismiss(animated: false, completion: nil)
    }
    
    func updateSliderValues(maxYear:String,minYear:String){
        
        sliderMinYear.value = Float(minYear) ?? 1940
        sliderMaxYear.value = Float(maxYear) ?? 2017
        sliderMaxYear.minimumValue = sliderMinYear.value
        sliderMinYear.maximumValue = sliderMaxYear.value
        labelMaxyear.text = maxYear
        labelMinYear.text = minYear

    }
    
    @IBAction func applyFiterAction(_ sender: Any) {
        
        guard let minYear = labelMinYear.text,
              let maxYear = labelMaxyear.text else{
                return
        }
        delegate?.onApplyFilterAction(maxYear: maxYear, minYear: minYear)
        dismissView()
        
    }
    
    @IBAction func minYearSliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        sliderMaxYear.minimumValue = sender.value
        labelMinYear.text = "\(currentValue)"
    }
    
    @IBAction func maxYearSliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        sliderMinYear.maximumValue = sender.value
        labelMaxyear.text = "\(currentValue)"
    }
    
    }

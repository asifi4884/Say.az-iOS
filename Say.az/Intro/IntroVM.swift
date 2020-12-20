//
//  IntroVM.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/16/20.
//

import UIKit

class IntroVM {
    
    // MARK: - Get intro texts and button text
    func getText(of index: Int) -> (title: String, subTitle: String) {
    
        switch index {
        
        case 0:
            return ("introText", "DAVAM ET")
        case 1:
            return ("introText", "DAVAM ET")
        case 2:
            return ("introText", "DAXİL OL")
        default:
            fatalError("index is out of bounds")
        }
    }
    
    //MARK: - Get image of index
    func getImage(of index: Int) -> UIImage {
        guard let image = UIImage(named: "carousel.\(index)")
        else { fatalError("image cannot be founded") }
        
        return image
            
    }
    
}

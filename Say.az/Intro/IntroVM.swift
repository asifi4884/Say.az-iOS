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

        let title = "intro.top.title.\(index)".localize()
        let subtitle = "intro.subtitle.\(index)".localize()

        return (title, subtitle)
    }
    
    //MARK: - Get image of index
    func getImage(of index: Int) -> UIImage {
        guard let image = UIImage(named: "carousel.\(index)")
        else { fatalError("image cannot be founded") }
        
        return image
            
    }
    
}

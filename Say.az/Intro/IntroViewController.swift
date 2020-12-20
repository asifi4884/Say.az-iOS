//
//  IntroViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/16/20.
//

import UIKit

class IntroViewController: CustomNavigationBarVC {
    
    //MARK: - IBOutlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backgroundImg: UIImageView!
    
    //MARK: - Variables
    let introVM = IntroVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupViews()
    }
    
}


//MARK: - Methods(functions)
extension IntroViewController {
    func setupViews() {
        let index = pageControl.currentPage
        let text = introVM.getText(of: index)
        let img = introVM.getImage(of: index)
        
        UIView.transition(with: backgroundImg,
        duration: 0.75,
        options: .transitionCrossDissolve,
        animations: { [unowned self] in
            self.backgroundImg.image = img
            self.titleLbl.text = text.title
            self.subTitleLbl.text = text.subTitle
        },
        completion: nil)
        
    }
    
    func addGestureRecognizer() {
        let leftGestureRec = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleLeftSwipe))
        leftGestureRec.edges = .left
        
        let rightGestureRec = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleRightSwipe))
        rightGestureRec.edges = .right
        
        view.addGestureRecognizer(rightGestureRec)
        view.addGestureRecognizer(leftGestureRec)
        

    }
    
    @objc func handleLeftSwipe(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            guard pageControl.currentPage != 0 else { return }
            pageControl.currentPage = pageControl.currentPage - 1
            setupViews()
        }
    }
    
    @objc func handleRightSwipe(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            guard pageControl.currentPage != 2
            else {
                openLoginOption()
                return }
            pageControl.currentPage = pageControl.currentPage + 1
            setupViews()
        }
    }
    
    func openLoginOption() {
        performSegue(withIdentifier: SegueID.login_option.rawValue, sender: nil)
    }
}

//MARK: - IBActions
extension IntroViewController {
    @IBAction func nextBtnTapped() {
        guard pageControl.currentPage != 2
        else {
            openLoginOption()
            return }
        pageControl.currentPage = pageControl.currentPage + 1
        setupViews()
    }
    
    @IBAction func passBtnTapped() {
       openLoginOption()
    }
    
    
}

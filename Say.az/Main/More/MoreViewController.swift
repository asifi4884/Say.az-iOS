//
//  MoreViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/24/20.
//

import UIKit

class MoreViewController: CustomNavigationBarVC {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var sketchyTopViewHeight: NSLayoutConstraint!
    @IBOutlet weak var sketchyTopView: UIView!
    @IBOutlet var profileActionViews: [SimpleCardView]! {
        didSet {
            profileActionViews[1].titleLbl.text = "3412341234132"
            profileActionViews[2].titleLbl.text = "6JSDEDX"
            for (index, view) in profileActionViews.enumerated() {
                view.backgroundColor = .clear
                view.addTapGestureRecognizer {
                    self.profileAction(at: index)
                }
            }
        }
    }

    @IBOutlet var settingsActionViews: [SimpleCardView]! {
        didSet {
            for (index, view) in settingsActionViews.enumerated() {
                view.backgroundColor = .clear
                view.addTapGestureRecognizer {
                    self.settingsAction(at: index)
                }
            }
        }
    }

    @IBOutlet var otherActionViews: [SimpleCardView]! {
        didSet {
            for (index, view) in otherActionViews.enumerated() {
                view.backgroundColor = .clear
                view.addTapGestureRecognizer {
                    self.otherAction(at: index)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        changeModeTitle()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

            if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                changeModeTitle()
            }
    }

    private func changeModeTitle() {
        if traitCollection.userInterfaceStyle == .dark {
            settingsActionViews[1].leftTitle = "dark.appearance.title"
        }
        else {
            settingsActionViews[1].leftTitle = "light.appearance.title"
        }
    }

}


extension MoreViewController {
    func profileAction(at index: Int) {
        switch index {
        case 3:
            let vc = BankCardViewController().initialize(fromSb: .bank_account)!
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let email = "office@taxes.gov.az"
            if let url = URL(string: "mailto:\(email)") {
                UIApplication.shared.open(url)
            }
        default:
            break
        }
    }

    func settingsAction(at index: Int) {
        switch index {
        case 0:
            changeLang()
//        case 1:
//            Helper.shared.getWindow()?.overrideUserInterfaceStyle = traitCollection.userInterfaceStyle == .dark ? .light : .dark
        default:
           break
        }
    }

    func otherAction(at index: Int) {
        switch index {
        case 0:
            self.performSegue(withIdentifier: "about.app", sender: nil)
        case 1:
            showAlert(with: "delete.profile.alert.title".localize(), preferredStyle: .alert, actions:
                        [(title: "yes.button.title".localize(), style: .default),
                         (title: "cancel.button.title".localize(), style: .cancel)
                        ]) { (_, action) in
                if action.style == .default {
                    //TODO: action to delete profile
                    Storage.isLogged = false
                    let vc = IntroViewController().initialize(fromSb: .intro)!
                    Helper.shared.makeRoot(vc)
                }
            }
        case 2:
            showAlert(with: "logout.profile.alert.title".localize(), preferredStyle: .alert, actions:
                        [(title: "yes.button.title".localize(), style: .default),
                         (title: "cancel.button.title".localize(), style: .cancel)
                        ]) { (_, action) in
                if action.style == .default {
                    //TODO: action to delete profile
                    Storage.isLogged = false
                    let vc = IntroViewController().initialize(fromSb: .intro)!
                    Helper.shared.makeRoot(vc)
                }
            }
        default:
           break
        }
    }


    private func changeLang() {
        showAlert(with: "language.title".localize(), preferredStyle: .actionSheet, actions:
                    [(title: "en.lang.title".localize(), style: .default),
                     (title: "az.lang.title".localize(), style: .default),
                     (title: "ru.lang.title".localize(), style: .default),
                     (title: "cancel.button.title".localize(), style: .cancel)
                    ]) { (index, action) in
            if action.style != .cancel  {
                self.setLang(for: index)

            }
        }
    }

    private func setLang(for index: Int) {
        switch index {
        case 0:
            LocalizationManager.shared.setLanguage(languageCode: "en")
        case 1:
            LocalizationManager.shared.setLanguage(languageCode: "az")
        case 2:
            LocalizationManager.shared.setLanguage(languageCode: "ru")
        default:
            fatalError()
        }

        let vc = CustomTabBarController().initialize(fromSb: .home)!
        Helper.shared.makeRoot(vc)

    }

}

extension MoreViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let offsetY = scrollView.contentOffset.y

        if offsetY > 0, 200 - offsetY > 140
        {
            let height = 200 - offsetY
            sketchyTopViewHeight.constant = height
            sketchyTopView.transform = CGAffineTransform(scaleX: height/200, y: height/200)
        }
        else if offsetY < 0
        {
            sketchyTopViewHeight.constant = 200
            sketchyTopView.transform = .identity
        }
    }

}

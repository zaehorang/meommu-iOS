//
//  ViewController.swift
//  meommu-iOS
//
//  Created by 이예빈 on 2023/09/17.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var firstMainLabel: UILabel!
    @IBOutlet weak var secondMainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    @IBOutlet weak var loginImageView: UIImageView!
    
    var kindergartenName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLebel()
        setupButton()
        setupCornerRadius()
        setupImageView()
    }
    
    //MARK: - 코너 레디어스 값 설정 메서드
    func setupCornerRadius() {
        nextButton.setCornerRadius(6.0)
    }
    
    func setupButton() {
        nextButton.backgroundColor = .prilmaryA
        nextButton.setTitleColor(.white, for: .normal)
        
    }
    
    func setupLebel() {
        firstMainLabel.textColor = .gray900
        secondMainLabel.textColor = .gray900
        subLabel.textColor = .gray400
        
        if let kindergartenName {
            firstMainLabel.text = "\(kindergartenName)님,"
        }
    }
    
    func setupImageView() {
        loginImageView.image = UIImage(named: "Onboarding3")
    }
    
    // UIWindow의 rootViewController를 변경하여 화면전환 함수
    func changeRootViewController(_ viewControllerToPresent: UIViewController) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = viewControllerToPresent
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
        } else {
            viewControllerToPresent.modalPresentationStyle = .overFullScreen
            self.present(viewControllerToPresent, animated: true, completion: nil)
        }
    }
    
    // Diary 화면으로 전환
    @IBAction func changeWindowButtonToDiary(_ sender: Any) {
        let newStoryboard = UIStoryboard(name: "Diary", bundle: nil)
        let newViewController = newStoryboard.instantiateViewController(identifier: "DiaryViewController")
        self.changeRootViewController(newViewController)
    }
    
    
}


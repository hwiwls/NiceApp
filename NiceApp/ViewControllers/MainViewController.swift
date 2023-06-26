//
//  ViewController.swift
//  NiceApp
//
//  Created by hwijinjeong on 2023/06/26.
//

import UIKit
import Lottie

class MainViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "메인 화면"
        label.font = UIFont.boldSystemFont(ofSize: 70)
        
        return label
    }()
    
    // 애니메이션뷰
    let animationView: LottieAnimationView = {
        let animView = LottieAnimationView(name: "133076-welcome")
        animView.frame = CGRect(x:0, y:0, width:400, height:400)   // 크기. x축과 y축 모두 0에서 시작
        animView.contentMode = .scaleAspectFit   // 이미지를 확대할건지 축소할건지
        
        
        return animView
    }()

    // 뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .black
        view.addSubview(animationView)
        animationView.center = view.center
        
        // 애니메이션 실행
        animationView.play{ (finish) in
            // animationView.play가 실행되고 아래가 실행된다.
            print("애니메이션이 끝났습니다.")
            
            // 클로저 안에 있을 때는 'self'를 명시해주어야 한다.
            self.view.backgroundColor = .white
            
            // 애니메이션 끝내기
            self.animationView.removeFromSuperview()
            
            self.view.addSubview(self.titleLabel)
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
    }
}


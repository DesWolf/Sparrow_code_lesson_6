//
//  ViewController.swift
//  SixLesson
//
//  Created by Максим Окунеев on 18.07.2023.
//

import UIKit

//На экране синий квадарт. По нажатию на экран, центр квадрата анимировано перемешается в точку нажатия.
//
//- Квадрат должен двигаться как физический объект - если проходит большое расстояние, то есть отскок с инерцией.
//- Есть небольшой поворот квадрата при движении в новую точку.

class ViewController: UIViewController {
    
    lazy var roundedView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 5
        
        view.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        return view
    }()
    
    var snap: UISnapBehavior?
    var animator: UIDynamicAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(roundedView)
    
        animator = UIDynamicAnimator(referenceView: view)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
       
            if let snap = snap {
                animator?.removeBehavior(snap)
            }

            let snap = UISnapBehavior(item: roundedView, snapTo: position)
            animator?.addBehavior(snap)
            self.snap = snap
        }
    }
}


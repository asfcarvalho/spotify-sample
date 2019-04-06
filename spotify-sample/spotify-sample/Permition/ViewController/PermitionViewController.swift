//
//  PermitionViewController.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 05/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

class PermitionViewController: UIViewController {
    
    var presenter: PermitionPresenterInputProtocol?
    
    @IBOutlet weak var btnPermition: UIButton!
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()

        getPermition()
    }
    
    @IBAction func btnPermitionAction(_ sender: Any) {
        getPermition()
    }
    
    func getPermition() {
        self.presenter?.viewDidLoad()
    }
}

extension PermitionViewController: PermitionViewControllerProtocol {
    
    func onError(error: String) {
        presenter?.showAlert(from: self)
    }
}

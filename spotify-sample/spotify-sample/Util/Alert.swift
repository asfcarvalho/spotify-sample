//
//  Alert.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

class Alert {
    static func showAlert(from view: UIViewController?, message: String, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "Attemption", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: completion))
        view?.present(alert, animated: true, completion: nil)
    }
}

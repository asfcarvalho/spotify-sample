//
//  PermitionWireFrame.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

class PermitionWireFrame: PermitionWireFrameProtocol {

    

    class func createViewController() -> UIViewController {
        
        var presenter: PermitionPresenterInputProtocol & PermitionWorkerOutputProtocol = PermitionPresenter()
        var worker: PermitionWorkerInputProtocol = PermitionWorker()
        let wireFrame: PermitionWireFrameProtocol = PermitionWireFrame()
        
        let vc = PermitionViewController()
        vc.presenter = presenter
        presenter.view = vc
        presenter.worker = worker
        worker.presenter = presenter
        presenter.wireFrame = wireFrame
        
        return vc
    }
    
    func showPlaylist(from view: PermitionViewControllerProtocol) {
        let playlist = PlaylistWireframe.createViewController()
        
        if let viewPermition = view as? UIViewController {
            viewPermition.present(playlist, animated: false, completion: nil)
        }
    }
    
    func showAlert(from view: UIViewController) {
        let alert = UIAlertController(title: "Attemption", message: "This app requires Spotify permition!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
    
}

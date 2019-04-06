//
//  PlayerViewController.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var probressView: UIProgressView!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var albumImage: UIImageView!
    
    var playlist: Playlist?
    var presenter: PlayerPresenterInputProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        
//        PlayerWork().playFetch(value: "spotify:album:5ht7ItJgpBH7W6vJ5BqpPr")

//        initializaPlayer()
    }

    @IBAction func btnPlayAction(_ sender: Any) {
    }
    @IBAction func btnBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func initializaPlayer(){
        
        var player = SPTAudioStreamingController.sharedInstance()

////        player.playbackDelegate = self
////        self.player!.delegate = self
        try! player?.start(withClientId: Commons.clientId)
        player?.login(withAccessToken: Commons.codeSuccess)

        player?.playSpotifyURI("spotify:album:5ht7ItJgpBH7W6vJ5BqpPr", startingWith: 0, startingWithPosition: 0, callback: { (err) in
            if err != nil {
                print(err?.localizedDescription)
            } else {

            }
        })
    }
}

extension PlayerViewController: PlayerPresenterOutputProtocol {
    func showLoading() {
        Loading.showLoading(view)
    }
    
    func stopLoading() {
        Loading.stopLoading()
    }
    

    
    func onError(error: String) {
        presenter?.showAlert(from: self, message: error)
    }
    
    func showPlaying(playing: Playing) {
        DispatchQueue.main.async {
            self.albumLabel.text = playing.item?.album?.name
            self.artistName.text = playing.item?.artists?.first?.name
            self.nameLabel.text = playing.item?.name
            self.durationLabel.text = (Double(playing.item?.durationMS ?? 0) / 1000.0).description
            
            do {
                if let url = playing.item?.album?.images?.first?.url,
                    let value = URL(string: url){
                    let data = try Data(contentsOf: value)
                    self.albumImage.image = UIImage(data: data)
                }
            }catch {
                
            }
        }
        
        
        
    }
    
    
}

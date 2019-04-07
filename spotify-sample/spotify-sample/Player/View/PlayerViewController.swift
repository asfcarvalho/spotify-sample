//
//  PlayerViewController.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var probressView: UIProgressView!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var albumImage: UIImageView!
    
    var player: AVAudioPlayer?
    
    var playlist: Playlist?
    var presenter: PlayerPresenterInputProtocol?
    fileprivate var playPause: PlayPauseType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            if let value = URL(string: "https://p.scdn.co/mp3-preview/4ba3be95cdc4b3ef1af95950f56f4feae04b25db?cid=ddc15eac36134225b71ccf3f18ff3966") {
                self.player = try AVAudioPlayer(contentsOf: value)
                self.player?.prepareToPlay()
                self.player?.play()
            }
        }catch {
            print(error)
        }
        
//        presenter?.viewDidLoad()
        
//        PlayerWork().playFetch(value: "spotify:album:5ht7ItJgpBH7W6vJ5BqpPr")

//        initializaPlayer()
    }

    @IBAction func btnPlayAction(_ sender: Any) {
        self.presenter?.playPause(type: playPause ?? PlayPauseType.pause)
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
    func playPauseSuccess(type: PlayPauseType) {
        
        if type == PlayPauseType.play {
            playPause = PlayPauseType.pause
            
        }else {
            playPause = PlayPauseType.play
        }
        let image = playPause?.rawValue ?? PlayPauseType.pause.rawValue
        DispatchQueue.main.async {
            self.btnPlay.setBackgroundImage(UIImage(named: image), for: .normal)
        }
    }
    
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
            self.durationLabel.text = "Duration time: \(String(format: "%.2f", (Double(playing.item?.durationMS ?? 0) / 10000.0)))"
            
            do {
                if let url = playing.item?.album?.images?.first?.url,
                    let value = URL(string: url){
                    let data = try Data(contentsOf: value)
                    self.albumImage.image = UIImage(data: data)
                }
                if let url = playing.item?.href, let value = URL(string: "https://open.spotify.com/track/0o9AEYW61Jb0dwmHlVhXk5") {
                    self.player = try AVAudioPlayer(contentsOf: value)
                    self.player?.prepareToPlay()
                    self.player?.play()
                }
            }catch {
                
            }
            
            
        }
        
        
        
    }
    
    
}

//
//  PlayerViewController.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController, UIApplicationDelegate {
    
    var myAudioPlayer: AVAudioPlayer?

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var probressView: UIProgressView!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var albumImage: UIImageView!
    
    var player: AVAudioPlayer?
    
    var uri: String?
    var playlist: Playlist?
    var presenter: PlayerPresenterInputProtocol?
    fileprivate var playPause: PlayPauseType?
    fileprivate var playing: Playing?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad(uri: uri ?? "")
        
        btnPlay.layer.cornerRadius = btnPlay.bounds.width / 2
        btnPlay.backgroundColor = UIColor.white
        
        setGradientBackground(colorTop: UIColor.brown.withAlphaComponent(0.1), colorBottom: UIColor.black)
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, UIColor.brown.withAlphaComponent(0.3).cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    @IBAction func btnPlayAction(_ sender: Any) {
        self.presenter?.playPause(type: playPause ?? PlayPauseType.pause, positionMS: playing?.progressMS ?? 0)
    
    }
    @IBAction func btnBackAction(_ sender: Any) {
        self.presenter?.playPause(type: PlayPauseType.pause, positionMS: 0)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}



extension PlayerViewController: PlayerPresenterOutputProtocol {
    func noDevice(error: String) {
        self.view.isHidden = true
        self.presenter?.showAlert(from: self, message: error, completion: { (alert) in
            self.dismiss(animated: true, completion: nil)
        })
    }
    
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
        presenter?.showAlert(from: self, message: error, completion: nil)
    }
    
    func showPlaying(playing: Playing) {
        self.playing = playing
        if playPause == PlayPauseType.pause {
            DispatchQueue.main.async {
                self.albumLabel.text = playing.item?.album?.name
                self.artistName.text = playing.item?.artists?.first?.name
                self.nameLabel.text = playing.item?.name
                self.durationLabel.text = "Duration time: \(String(format: "%.2f", (Double(playing.item?.durationMS ?? 0) / 60000.0)))"
                
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
    
    
}

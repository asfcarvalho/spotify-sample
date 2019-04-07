//
//  PlaylistTableViewCell.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var algumImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    
//    var _image: String?
//    var _albumName: String?
//    var _artistName: String?
//    var _musicName: String?
//    var _duration: Int?

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(image: String?, albumName: String?, artistName: String?, musicName: String?, duration: Int?) {
        if let value = image, let url = URL(string: value) {
            do {
                let data = try Data(contentsOf: url)
                self.algumImage.image = UIImage(data: data) ?? UIImage(named: "Spotify_Icon_RGB_Green")
            }catch {
                
            }
        }else {
            self.algumImage.image = UIImage(named: "Spotify_Icon_RGB_Green")
        }
        self.albumName.text = albumName
        self.artistName.text = artistName
        self.musicName.text = musicName
        if let duration = duration {
            let value = String(format: "%.2f", Double(duration) / 10000)
            self.durationLabel.text = value
        }
    }
    
    
}

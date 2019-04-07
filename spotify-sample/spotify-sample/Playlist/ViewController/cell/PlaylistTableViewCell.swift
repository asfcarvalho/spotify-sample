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

    @IBOutlet weak var viewMain: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(image: String?, albumName: String?, artistName: String?, musicName: String?) {
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
        
        viewMain.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        viewMain.layer.shadowOffset = CGSize(width: 2, height: 2)
        viewMain.layer.shadowRadius = 6
        viewMain.layer.shadowOpacity = 0.5
        viewMain.layer.cornerRadius = 6
    }
    
    
}

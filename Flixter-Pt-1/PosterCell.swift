//
//  PosterCell.swift
//  Flixter-Pt-1
//
//  Created by Kennedy Parks on 3/13/23.
//

import UIKit
import Nuke

class PosterCell: UICollectionViewCell {
 
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var poster_path: UIImageView!
    
    
    /// Configures the cell's UI for the given track.
    func configure(with movie: Movie) {

        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with:URL(string:"https://image.tmdb.org/t/p/w500" +
                                movie.poster_path.absoluteString)!, into: poster_path)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}

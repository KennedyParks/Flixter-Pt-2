//
//  MovieCell.swift
//  Flixter-Pt-1
//
//  Created by Kennedy Parks on 3/3/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {
    
    
    
    @IBOutlet weak var poster_path: UIImageView!
    @IBOutlet weak var original_titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    
    
    /// Configures the cell's UI for the given track.
    func configure(with movie: Movie) {
        original_titleLabel.text = movie.original_title
        overviewLabel.text = movie.overview

        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with:URL(string:"https://image.tmdb.org/t/p/w500" +
                                movie.poster_path.absoluteString)!, into: poster_path) 
    } 
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

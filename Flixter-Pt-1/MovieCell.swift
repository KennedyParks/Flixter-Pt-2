//
//  MovieCell.swift
//  Flixter-Pt-1
//
//  Created by Kennedy Parks on 3/3/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var original_titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    
    
    /// Configures the cell's UI for the given track.
    func configure(with movie: Movie) {
        original_titleLabel.text = movie.original_title
        overviewLabel.text = movie.overview

        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with: movie.poster_path, into: movieImageView)
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

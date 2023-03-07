//
//  DetailViewController.swift
//  Flixter-Pt-1
//
//  Created by Kennedy Parks on 3/4/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    
    @IBOutlet weak var original_titleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var popularityLabel: UILabel!
    
    @IBOutlet weak var vote_countLabel: UILabel!
    
    @IBOutlet weak var vote_averageLabel: UILabel!
    
    
    var movie: Movie!
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        
        // Load the image located at the `artworkUrl100` URL and set it on the image view.
           
            Nuke.loadImage(with: movie.poster_path, into: movieImageView)

            // Set labels with the associated track values.
            original_titleLabel.text = movie.original_title
            overviewLabel.text = movie.overview
            popularityLabel.text = movie.popularity
            vote_countLabel.text = movie.vote_count
            vote_averageLabel.text = movie.vote_average
        

            // Create a date formatter to style our date and convert it to a string
             

            // Use helper method to convert milliseconds into `mm:ss` string format
            

        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



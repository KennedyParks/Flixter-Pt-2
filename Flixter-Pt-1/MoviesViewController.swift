//
//  ViewController.swift
//  Flixter-Pt-1
//
//  Created by Kennedy Parks on 3/3/23.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource {
    
    var movies: [Movie] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a cell with identifier, "TrackCell"
        // the `dequeueReusableCell(withIdentifier:)` method just returns a generic UITableViewCell so it's necessary to cast it to our specific custom cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

        // Get the track that corresponds to the table view row
        let movie = movies[indexPath.row]

        // Configure the cell with it's associated track
        cell.configure(with: movie)

        // return the cell for display in the table view
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // TODO: Pt 1 - Pass the selected track to the detail view controller
        // Get the cell that triggered the segue
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = movieView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {

            // Use the index path to get the associated track
            let movie = movies[indexPath.row]

            // Set the track on the detail view controller
            detailViewController.movie = movie
        }

    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieView.dataSource = self
        
        movies = Movie.mockMovies
        print(movies)
    }
    
    override func viewWillAppear(_ animated: Bool) { 
        super.viewWillAppear(animated)
        
        // Get the index path for the current selected table view row (if exists)
        if let indexPath = movieView.indexPathForSelectedRow {

            // Deselect the row at the corresponding index path
            movieView.deselectRow(at: indexPath, animated: true)
        }
       
    }


    @IBOutlet weak var movieView: UITableView!
    
    
}


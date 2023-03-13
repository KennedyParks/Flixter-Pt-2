//
//  PostersViewController.swift
//  Flixter-Pt-1
//
//  Created by Kennedy Parks on 3/13/23.
//

import UIKit
import Nuke

class PostersViewController: UIViewController, UICollectionViewDataSource {
    
    var posters: [Poster] = []
    var movies: [Movie] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get a collection view cell (based in the identifier you set in storyboard) and cast it to our custom AlbumCell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell

            // Use the indexPath.item to index into the albums array to get the corresponding album
            let poster = posters[indexPath.row]

            // Get the artwork image url
            let imageUrl = poster.poster_path 

            // Set the image on the image view of the cell
        Nuke.loadImage(with:URL(string:"https://image.tmdb.org/t/p/w500" +
                                poster.poster_path.absoluteString)!, into: cell.posterImageView) 

            return cell 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // TODO: Pt 1 - Pass the selected track to the detail view controller
        // Get the cell that triggered the segue
        if let cell = sender as? UICollectionViewCell,
           // Get the index path of the cell from the table view
           let indexPath = collectionView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {

            // Use the index path to get the associated track
            let poster = posters[indexPath.row]

            // Set the track on the detail view controller
            detailViewController.poster = poster
        }

    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self

        // Create a search URL for fetching albums (`entity=album`)
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=391129973639c0483bf6dc77f30c617b")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            // Create a JSON Decoder
            
            do {
                let decoder = JSONDecoder()
                // Try to parse the response into our custom model
                let dateFormatter = DateFormatter()

                // Set a custom date format based on what we see coming back in the JSON
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

                // Set the decoding strategy on the JSON decoder to use our custom date format
                decoder.dateDecodingStrategy = .formatted(dateFormatter)

                // Use the JSON decoder to try and map the data to our custom model.
                // TrackResponse.self is a reference to the type itself, tells the decoder what to map to.
                let response = try decoder.decode(PosterSearchResponse.self, from: data)

                // Access the array of tracks from the `results` property
                let posters = response.results
                print("✅ \(posters)")
                
                // Execute UI updates on the main thread when calling from a background callback
                DispatchQueue.main.async {

                    // Set the view controller's tracks property as this is the one the table view references
                    self?.posters = posters

                    // Make the table view reload now that we have new data
                    self?.collectionView.reloadData()
                }
                
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
            
        }

        // Initiate the network request
        task.resume()
        print("Yo!")
        print(posters)
        
        // Get a reference to the collection view's layout
        // We want to dynamically size the cells for the available space and desired number of columns.
        // NOTE: This collection view scrolls vertically, but collection views can alternatively scroll horizontally.
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 4

        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 4

        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 3

        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

        // Set the size that each tem/cell should display at
        layout.itemSize = CGSize(width: width, height: width)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }

}

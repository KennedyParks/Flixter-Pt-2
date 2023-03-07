//
//  Movie.swift
//  Flixter-Pt-1
//
//  Created by Kennedy Parks on 3/3/23.
//

import Foundation

struct Movie {
    let original_title: String
    let overview: String
    let poster_path: URL
    
    let vote_average: String
    let vote_count: String
    let popularity: String
}
 
extension Movie {
 
    
    static var mockMovies: [Movie]  = [
        Movie(original_title: "Knock at the Cabin",
              overview: "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost.",
              poster_path:  URL(string:"https://image.tmdb.org/t/p/w500/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg")!,
              vote_average: "6.5 Vote Average",
              vote_count: "670 Votes",
              popularity: "4112.616 Popularity"),

        
        
        Movie(original_title: "Black Panther: Wakanda Forever",
              overview: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death. As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
              poster_path: URL(string: "https://image.tmdb.org/t/p/w500/sv1xJUazXeYqALzczSZ3O6nkH75.jpg")!,
              vote_average: "7.4 Vote Average",
              vote_count: "3708 Votes",
              popularity: "2678.485 Popularity"),
       
        
        Movie(original_title: "Puss in Boots: The Last Wish",
              overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
              poster_path: URL(string: "https://image.tmdb.org/t/p/w500/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,
              vote_average: "6.9 Vote Average",
              vote_count: "717 Votes",
              popularity: "2311.833 Popularity"),
        
        Movie(original_title: "Plane",
              overview: "After a heroic job of successfully landing his storm-damaged aircraft in a war zone, a fearless pilot finds himself between the agendas of multiple militias planning to take the plane and its passengers hostage.",
              poster_path: URL(string: "https://image.tmdb.org/t/p/w500/qi9r5xBgcc9KTxlOLjssEbDgO0J.jpg")!,
              vote_average: "6.9 Vote Average",
              vote_count: "717 Votes",
              popularity: "2001.922 Popularity"),
        
        Movie(original_title: "Huesera: The Bone Woman",
              overview: "Valeria's joy at becoming a first-time mother is quickly taken away when she's cursed by a sinister entity. As danger closes in, she's forced deeper into a chilling world of dark magic that threatens to consume her.",
              poster_path: URL(string: "https://image.tmdb.org/t/p/w500/1mZcxuL4GLUvPdEXC4iZPjG2EO3.jpg")!,
              vote_average: "6.6 Vote Average",
              vote_count: "40 Votes",
              popularity: "1514.435 Popularity")
    ]

    
}

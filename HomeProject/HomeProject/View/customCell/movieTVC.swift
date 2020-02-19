//
//  movieTVC.swift
//  HomeProject
//
//  Created by elad schwartz on 19/02/2020.
//  Copyright © 2020 elad schwartz. All rights reserved.
//

import UIKit

class movieTVC: UITableViewCell {
    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(movie: Movie) {
        self.titleLabel.text = movie.title
        self.overViewLabel.text = movie.overview
        if let posterUrl = movie.posterPath {
            downloadImage(from: "https://image.tmdb.org/t/p/w500/" + posterUrl)
        }
    }
    
    func downloadImage(from urlString: String) {
        
        let cache = NetworkManager.shared.cache
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {  self.posterView.image = image }
        
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                self.posterView.image = image
            }
        }
        task.resume()
    }
}

//
//  AtricleCell.swift
//  Intrinsic Value
//
//  Created by Chris Boshoff on 2022/03/09.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    var articleToDisplay:Article?
    
    func displayArticle(_ article: Article) {
        
        // Clean up the cell before displaying the next article
        articleImageView.image = nil
        articleImageView.alpha = 0
        headlineLabel.text = ""
        headlineLabel.alpha = 0
        
        
        // Keep a reference to the article
        articleToDisplay = article
        
        // Set the headline
        headlineLabel.text = articleToDisplay!.title
        
        // Animate the label into view
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations:  {
           
            self.headlineLabel.alpha = 1
            
        }, completion: nil)

                
        // Download and display the image
        
        // Check that the article actually has an image
        guard articleToDisplay!.urlToImage != nil else {
            return
        }
        
        // Create url string
        let urlString = articleToDisplay!.urlToImage!
        
        // Check the cache manager before downloading any image data
        if let imageData = CacheManager.retrieveData(urlString) {
            
            // There is image data, set the imageview and return
            articleImageView.image = UIImage(data: imageData)
            
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations:  {
               
                self.articleImageView.alpha = 1
                
            }, completion: nil)
            
            return
        }
        
        // Create url
        let url = URL(string: urlString)
        
        // Check that url isn't nill
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        
        // Get a url session
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check that there were no errors
            if error == nil && data != nil {
                
                // Save the data to the cache
                CacheManager.saveData(urlString, data!)
               
                // Check if the url string that the data task went off to download matches the article this cell is set to display
                if self.articleToDisplay!.urlToImage == urlString {
                    
                    DispatchQueue.main.async {
                        // Display the image data in the image view
                        self.articleImageView.image = UIImage(data: data!)
                        
                        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations:  {
                           
                            self.articleImageView.alpha = 1
                            
                        }, completion: nil)
                    }
                }
                
           
            }
        }
        
        // Kick off the data task
        dataTask.resume()
        
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


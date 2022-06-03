//
//  NewsViewController.swift
//  Intrinsic Value
//
//  Created by Chris Boshoff on 2022/03/04.
//

import UIKit
import CoreML
import NaturalLanguage
import SwifteriOS
import SwiftyJSON

class CommunityViewController: UIViewController {
 
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buySellLabel: UILabel!
    
    let swifter = Swifter(consumerKey: "iLxA5zXQ9J1BQgELgaDslwCSc", consumerSecret: "RcKshLTuBW8YRvyMFAWQuCRxWb5TAn3S7AkfIaGPXifwoRkQcl")
    let sentimentClassifier = TweetSentimentClassifier()
    let tweetCount = 100

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func searchPressed(_ sender: UIButton) {

        getTweets()
        textField.text = ""
        
    }
    
    func getTweets() {
     
        if let searchText = textField.text {
            
            swifter.searchTweet(using: searchText, lang: "en", count: tweetCount, tweetMode: .extended) { results, searchMetadata in
                
                var tweets = [TweetSentimentClassifierInput]()
                
                for i in 0..<self.tweetCount {
                    if let tweet = results[i]["full_text"].string {
                        let tweetForClassification = TweetSentimentClassifierInput(text: tweet)
                        tweets.append(tweetForClassification)
                    }
                }
                
                self.makePrediction(with: tweets)
                
            } failure: { error in
                print("Error with Twitter API request, \(error)")
            }

        }
        
    }
    func makePrediction(with tweets: [TweetSentimentClassifierInput]) {
        
        do {
            
            let prediction = try self.sentimentClassifier.predictions(inputs: tweets)
            
            var sentimentScore = 0
            
            for pred in prediction {
                let sentiment = pred.label
                
                if sentiment == "Pos" {
                    sentimentScore += 1
                } else if sentiment == "Neg" {
                    sentimentScore -= 1
                }
            }
            
            updateUI(with: sentimentScore)
        } catch {
            print("There was an error making a prediction, \(error)")
        }
        
    }
    
    func updateUI(with sentimentScore: Int) {
        
        if sentimentScore > 0 {
            self.buySellLabel.text = "BUY"
        } else if sentimentScore == 0 {
            self.buySellLabel.text = "HOLD"
        } else {
            self.buySellLabel.text = "SELL"
        }
    }

    
    @IBAction func textFieldTapped(_ sender: Any) {
        
        buySellLabel.text = ""
    }
 
}

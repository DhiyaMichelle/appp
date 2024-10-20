//
//  ViewController.swift
//  CareQuest2
//
//  Created by Dhiya Michelle on 19/10/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        struct Article: Codable {
            let title: String
            let description: String?
        }

        struct NewsResponse: Codable {
            let articles: [Article]
        }

        class NewsViewController: UIViewController {

            override func viewDidLoad() {
                super.viewDidLoad()
                fetchNews()
            }

            func fetchNews() {
                let apiKey = "1503374c0271460c9dcdcb7637e08dee"
                let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
                
                guard let url = URL(string: urlString) else { return }
                
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        print("Error fetching data: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let data = data else { return }
                    
                    do {
                        let decoder = JSONDecoder()
                        let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                        let articles = newsResponse.articles
                        
                        // Print titles for debugging
                        for article in articles {
                            print("Title: \(article.title)")
                        }
                        
                        // Now you can update your UI with the articles (title, description, etc.)
                        DispatchQueue.main.async {
                            // Update UI
                        }
                        
                    } catch let jsonError {
                        print("Failed to decode JSON: \(jsonError)")
                    }
                }
                
                task.resume()
            }
        }

        // Do any additional setup after loading the view.
    }


}


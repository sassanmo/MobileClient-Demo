//
//  ViewController.swift
//  MobileClient
//
//  Created by NovaTec on 20.11.17.
//  Copyright © 2017 Matteo Sassano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func loadContent() {
        let pictureUrl = URL(string: "https://www.thebluediamondgallery.com/highlighted/images/content.jpg")!
        let session = URLSession.shared;
        var request = URLRequest(url: pictureUrl)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            do{
                if let httpResponse = response as? HTTPURLResponse {
                    if (httpResponse.statusCode == 200) {
                        if let receivedData = data {
                            let image = UIImage(data: receivedData)
                            DispatchQueue.main.async {
                                self.imageView.image = image
                            }
                        }
                    }
                }
            }
        })
        task.resume()
    }
    @IBAction func loadContentButtonPressed(_ sender: Any) {
        loadContent()
    }
}


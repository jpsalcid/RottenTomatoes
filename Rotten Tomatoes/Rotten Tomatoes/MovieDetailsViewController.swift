//
//  MovieDetailsViewController.swift
//  Rotten Tomatoes
//
//  Created by Jasen Salcido on 8/27/15.
//  Copyright (c) 2015 Jasen Salcido. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: NSDictionary!

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["synopsis"] as? String

        var url = movie.valueForKeyPath("posters.thumbnail") as! String
        
        var range = url.rangeOfString(".*cloudfront.net/", options: .RegularExpressionSearch)
        if let range = range {
            url = url.stringByReplacingCharactersInRange(range, withString: "https://content6.flixster.com/")
        }
        
        //let url = NSURL(string: movie.valueForKeyPath("posters.detailed") as! String)!
        posterImageView.setImageWithURL( NSURL(string: url)!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

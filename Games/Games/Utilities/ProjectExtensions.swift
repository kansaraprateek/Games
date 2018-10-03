//
//  ProjectExtensions.swift
//  Games
//
//  Created by Prateek Kansara on 03/10/18.
//  Copyright © 2018 Prateek. All rights reserved.
//

import Foundation
import UIKit


/// Tags for activity loader showing while image is been downlaoded.
private let activityTag = 12011992
private let activitySize : CGFloat = 20


// MARK: - UIIMageView extension for storing and showing the image from the URL. And put a temporary image while it downloads.
extension UIImageView{
    
    /**
     Extending UIImageView class to handle image downloading
     
     - parameter url: image URL as String
     */
    
    func downloadedFrom(url: String, placeholderImage : UIImage?) {
        guard let url = URL(string: url) else { return }
        self.image = UIImage(named: "brokenImage")
        self.updateConstraintsIfNeeded()
        showAnimating()
        if UtilityMethods.isInternetAvailable(){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200, let _data = data, let image = UIImage(data: _data)
                    else {return}
                DispatchQueue.main.async(execute: {
                    self.endAnimating()
                    self.image = image
                    if data != nil{}
                    else{
                        self.endAnimating()
                        if placeholderImage != nil{
                            self.image = placeholderImage
                        }
                    }
                    
                })
                }.resume()
        }else{
            self.endAnimating()
            if placeholderImage != nil{
                self.image = placeholderImage
            }
        }
    }
    
    /**
     Custom method to show activity indicator within UIImageView when image is downloaded
     */
    private func showAnimating(){
        let activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView.init(style: .white)
        activityIndicator.frame = CGRect(x:frame.width/2, y:frame.height/2, width:activitySize, height: activitySize)
        //        activityIndicator.center = CGPoint.init(x: frame.width/2, y:frame.width/2)
        activityIndicator.tag = activityTag
        activityIndicator.color = UIColor.lightGray
        activityIndicator.startAnimating()
        addSubview(activityIndicator)
    }
    
    /**
     Custom method to called when image is fully downlaoded.
     */
    private func endAnimating(){
        
        if let activityView = self.viewWithTag(activityTag) as? UIActivityIndicatorView{
            activityView.stopAnimating()
            activityView.removeFromSuperview()
        }
    }
    
    /// Setting blur effect to current image view
    func setImageViewBlur(){
        self.layoutIfNeeded()
        let blur = UIBlurEffect(style: .dark)
        let effectView = UIVisualEffectView(effect: blur)
        effectView.frame = self.bounds
        self.addSubview(effectView)
    }
    
    
    /// Creating circular frame for imageview
    func createCircularFrame() {
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.size.height/2;
        self.clipsToBounds = true
    }
}

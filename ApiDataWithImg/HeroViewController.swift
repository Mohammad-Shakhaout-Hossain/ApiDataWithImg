//
//  HeroViewController.swift
//  ApiDataWithImg
//
//  Created by Shakhawat Hossain Shakib on 10/12/20.
//

import UIKit
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class HeroViewController: UIViewController {

    var hero: HeroStats?
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var attributeLbl: UILabel!
    @IBOutlet weak var attactLbl: UILabel!
    @IBOutlet weak var legsLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = hero?.localized_name
        attributeLbl.text = hero?.primary_attr
        attactLbl.text = hero?.attack_type
        legsLbl.text =  "\((hero?.legs)!)"
        
        let urlString = "https://api.opendota.com"+(hero?.img)!
        let url = URL(string: urlString)
        imgView.downloaded(from: url!)
//        print(url)
    }
    
}


//
//  DetailViewController.swift
//  MemeMe
//
//  Created by Eric Pedersen on 11/20/18.
//  Copyright © 2018 Eric Pedersen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    @IBOutlet weak var memeImage: UIImageView!
    var meme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New", style: .plain, target: self, action: #selector(newMeme))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editMeme))
        memeImage.image = meme.memedImage
    }
    @objc func newMeme(){
        let newMemeController = self.storyboard!.instantiateViewController(withIdentifier: "NewMemeViewController") as! NewMemeViewController
        self.navigationController!.pushViewController(newMemeController, animated: true)
    }
    @objc func editMeme(){
        let newMemeController = self.storyboard!.instantiateViewController(withIdentifier: "NewMemeViewController") as! NewMemeViewController
        newMemeController.meme = meme
        
        present(newMemeController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

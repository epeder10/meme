//
//  MemeNavigationController.swift
//  MemeMe
//
//  Created by Eric Pedersen on 11/20/18.
//  Copyright © 2018 Eric Pedersen. All rights reserved.
//

import UIKit


@objc func newMeme(){
    let newMemeController = self.storyboard!.instantiateViewController(withIdentifier: "NewMemeViewController") as! NewMemeViewController
    self.navigationController!.pushViewController(newMemeController, animated: true)
}
@objc func newMeme(){
    let newMemeController = self.storyboard!.instantiateViewController(withIdentifier: "NewMemeViewController") as! NewMemeViewController
    self.navigationController!.pushViewController(newMemeController, animated: true)
}

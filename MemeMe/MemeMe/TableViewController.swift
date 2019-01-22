//
//  TableViewController.swift
//  MemeMe
//
//  Created by Eric Pedersen on 11/20/18.
//  Copyright © 2018 Eric Pedersen. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{
    var memes: [Meme]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMemes()
        tableView.reloadData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(newMeme))
    }
    
    @objc func newMeme(){
        let newMemeController = self.storyboard!.instantiateViewController(withIdentifier: "NewMemeViewController") as! NewMemeViewController
        
        present(newMemeController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    /*
     * Return table cell
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meme = memes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCollectionTableCell", for: indexPath) as! MemeCollectionTableCell
        
        cell.imageView?.image = meme.memedImage
        cell.memeText?.text = "\(meme.topText) \(meme.bottomText)"
        
        return cell
    }
    
    /*
     * Display preview controller by clicking by cell
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    /*
     * Delete record by swipe left on cell
     */
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.memes.remove(at: indexPath.row)
            memes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    func getMemes(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
    }
}

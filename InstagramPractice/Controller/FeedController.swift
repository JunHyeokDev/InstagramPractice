//
//  FeedController.swift
//  InstagramPractice
//
//  Created by 김준혁 on 2023/03/09.
//

import UIKit


private let reuseIdentifier = "Cell"


class FeedController : UICollectionViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI ()
    }
    
    // MARK: - Helpers
    
    func configureUI () {
        //view.backgroundColor = .white doesn't work cuz It's now CollectionView.
        collectionView.backgroundColor = .white
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
}

// MARK: - UICollectionViewDataSource
extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    // Imagine that we have 1000 images to show in our intagram main view.
    // Are u wanna load all of it at once? or only show it when it is really needed!
    // That's why we use Q and Dequeue it like this function!
    // So.. when we back scroll the app, iOS looks the cache momories so it doesn't
    // create the new cell entirely
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
        return cell
    }
}


// MARK: - UICollectionViewCell Sizing here!
extension FeedController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        var height = width + 8 + 40 + 8
        height += 50
        height += 60
        
        return CGSize(width: width, height: height)
    }
}



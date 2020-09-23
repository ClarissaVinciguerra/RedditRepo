//
//  PostTableViewCell.swift
//  redditAPI
//
//  Created by Clarissa Vinciguerra on 9/23/20.
//

import UIKit

// MARK: - Protocol

protocol PresentErrorToUserDelegate: AnyObject {
    func presentError(error: LocalizedError)
}

class PostTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upvoteLabel: UILabel!
    
    // MARK: - Properties
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: PresentErrorToUserDelegate?
    
    // MARK: - Helper Functions and Methods
    func updateViews() {
        guard let post = post else { return }
        titleLabel.text = post.title
        upvoteLabel.text = "Upvotes⬆: \(post.ups)"
        thumbnailImageView.image = nil
        
        PostController.fetchThumbnailFor(post: post) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.thumbnailImageView.image = image
                case .failure(let error):
                    //Present error to user - we need to create a custom protocol to pass this info along!
                    self.delegate?.presentError(error: error)
                    print(error.localizedDescription)
                }
            }
        }
    }
}

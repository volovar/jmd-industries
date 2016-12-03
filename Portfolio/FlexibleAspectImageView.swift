//
//  FlexibleAspectImageView.swift
//  AspectImageViewTest
//
//  Created by Charlie Hieger on 11/16/16.
//  Copyright © 2016 Charlie Hieger. All rights reserved.
//

import UIKit

@IBDesignable class FlexibleAspectImageView: UIView {

    fileprivate var imageView = UIImageView()

    @IBInspectable var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            configureFlexibleContentMode()
        }
    }

    @IBInspectable var isFlexibleAspectFit: Bool = false {
        didSet {
            configureFlexibleContentMode()
        }
    }

    override var frame: CGRect {
        didSet {
            configureFlexibleContentMode()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    func initSubviews() {
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        configureFlexibleContentMode()
        addSubview(imageView)
    }
}

extension FlexibleAspectImageView {
    func setFlexibleAspectFit() {
        if let image = self.image {
            if aspectRatio > image.aspectRatio {
                imageView.frame.size.height = frame.size.height
                imageView.frame.size.width = frame.size.height * image.aspectRatio
            } else {
                imageView.frame.size.width = frame.size.width
                imageView.frame.size.height = frame.size.width / image.aspectRatio
            }
            imageView.center = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        }
    }

    func setFlexibleAspectFill() {
        imageView.frame = bounds
    }

    func configureFlexibleContentMode() {
        if isFlexibleAspectFit {
            setFlexibleAspectFit()
        } else {
            setFlexibleAspectFill()
        }
    }

    func setFlexibleAspectFit(animated: Bool, duration: Double? = nil) {
        if animated {
            let duration = duration ?? 0.4
            UIView.animate(withDuration: duration) {
                self.setFlexibleAspectFit()
            }
        } else {
            setFlexibleAspectFit()
        }
    }

    func setFlexibleAspectFill(animated: Bool, duration: Double? = nil) {
        if animated {
            let duration = duration ?? 0.4
            UIView.animate(withDuration: duration) {
                self.setFlexibleAspectFill()
            }
        } else {
            setFlexibleAspectFill()
        }
    }
}

extension UIView {
    var aspectRatio: CGFloat {
        return frame.size.width / frame.size.height
    }
}

extension UIImage {
    var aspectRatio: CGFloat {
        return size.width / size.height
    }
}


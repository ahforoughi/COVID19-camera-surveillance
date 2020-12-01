//
//  UIView.swift
//  FMD
//
//  Created by ali on 10/30/20.
//

import UIKit

extension UIView {
    
    /// This returns all subviews of View controller
    var allSubViews : [UIView] {

        var array = [self.subviews].flatMap {$0}

        array.forEach { array.append(contentsOf: $0.allSubViews) }

        return array
    }

    /**
        This function adds the required constraints to centralize a view inside another view
        - parameter subview: the view that we wanna put in center
        - parameter equalSize: If true, the size of 2 views will be equal.
    */
    func constrainCentered(_ subview: UIView, equalSize: Bool = true)  {
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let verticalContraint = NSLayoutConstraint(
            item: subview,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0)
        
        let horizontalContraint = NSLayoutConstraint(
            item: subview,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0)
        
        let heightContraint = NSLayoutConstraint(
            item: subview,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: subview.frame.height)
        
        let widthContraint = NSLayoutConstraint(
            item: subview,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: subview.frame.width)

        if equalSize{
            addConstraints([
                horizontalContraint,
                verticalContraint,
                heightContraint,
                widthContraint])
        } else {
            addConstraints([
                horizontalContraint,
                verticalContraint
            ])
        }
        
    }

/**
      This function adds the required constraints to make a subview appear in the same exact coordinates of its parent view. it adds trailing,leading,top and bottom constraints in order to achieve this goal.
      - parameter subview: the view that we want to put in the same coordinates.
*/
func constrainToEdges(_ subview: UIView) {
    
    subview.translatesAutoresizingMaskIntoConstraints = false
    
    let topContraint = NSLayoutConstraint(
        item: subview,
        attribute: .top,
        relatedBy: .equal,
        toItem: self,
        attribute: .top,
        multiplier: 1.0,
        constant: 0)
    
    let bottomConstraint = NSLayoutConstraint(
        item: subview,
        attribute: .bottom,
        relatedBy: .equal,
        toItem: self,
        attribute: .bottom,
        multiplier: 1.0,
        constant: 0)
    
    let leadingContraint = NSLayoutConstraint(
        item: subview,
        attribute: .leading,
        relatedBy: .equal,
        toItem: self,
        attribute: .leading,
        multiplier: 1.0,
        constant: 0)
    
    let trailingContraint = NSLayoutConstraint(
        item: subview,
        attribute: .trailing,
        relatedBy: .equal,
        toItem: self,
        attribute: .trailing,
        multiplier: 1.0,
        constant: 0)
    
    addConstraints([
        topContraint,
        bottomConstraint,
        leadingContraint,
        trailingContraint])
}
}

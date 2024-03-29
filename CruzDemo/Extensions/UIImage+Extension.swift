//
//  UIImage+Extension.swift
//  Lendu
//
//   
//


import UIKit.UIImage

extension UIImage {
    
    public convenience init?(color: UIColor, size: CGSize!) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

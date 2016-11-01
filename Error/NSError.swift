//
//  NSError.swift
//  Error
//
//  Created by Christian Otkjær on 16/11/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation
import UIKit

extension NSError
{
    public var underlyingError : NSError? { return userInfo[NSUnderlyingErrorKey] as? NSError }
    
    public convenience init(
        domain: String,
        code: Int,
        description: String? = nil,
        reason: String? = nil,
        underlyingError: NSError? = nil)
    {
        var errorUserInfo: [String : AnyObject] = [:]
        
        if description != nil
        {
            errorUserInfo[NSLocalizedDescriptionKey] = description as AnyObject?? ?? "" as AnyObject?
        }
        if reason != nil
        {
            errorUserInfo[NSLocalizedFailureReasonErrorKey] = reason as NSString?
//            errorUserInfo[NSLocalizedFailureReasonErrorKey] = reason as AnyObject?? ?? "" as AnyObject?
        }
        
        if underlyingError != nil
        {
            errorUserInfo[NSUnderlyingErrorKey] = underlyingError
        }
        
        self.init(domain: domain, code: code, userInfo: errorUserInfo)
    }
}

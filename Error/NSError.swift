//
//  NSError.swift
//  Silverback
//
//  Created by Christian Otkjær on 16/11/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation
import UIKit

extension NSError
{
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
            errorUserInfo[NSLocalizedDescriptionKey] = description ?? ""
        }
        if reason != nil
        {
            errorUserInfo[NSLocalizedFailureReasonErrorKey] = reason ?? ""
        }
        
        if underlyingError != nil
        {
            errorUserInfo[NSUnderlyingErrorKey] = underlyingError
        }
        
        self.init(domain: domain, code: code, userInfo: errorUserInfo)
    }
}
//
//  ResponseDataModel.swift
//  SuryaSoftInteriew
//
//  Created by Ganesh on 3/1/19.
//  Copyright © 2019 Mithu. All rights reserved.
//

import Foundation
class ResponseDataModel{
var urlImage = ""
var emailId = ""
var firstName = ""
var lastName = ""


init(urlImage: String, emailId: String, firstName: String, lastName: String) {
    self.urlImage = urlImage
    self.emailId = emailId
    self.firstName = firstName
    self.lastName = lastName
    
}
}

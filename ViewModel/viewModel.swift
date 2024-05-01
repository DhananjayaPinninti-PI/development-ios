

import Foundation

class viewModel {
    var propertyid:Int!
    var accountId:Int!
          
    
    var bot_id:String!
    var user_id:String!
    var type:String!
    var senc_dict:JSONDictionary!
    var assigntome_dict:JSONDictionary!
    var assigntoOthers_dict:JSONDictionary!
    var base64_image:String!
    var image_extension:String!
    var media_type:String!
    var batch_number:Int!
    
    var base64_pdf:String!
    var PdfExtention:String!
    var skipCount:Int!
    var pageSize:Int!
    var favoritePurpose:Int!
    var impressionId = Helpers.getImpressionId()
    
    func getList(completion: @escaping((Int,JSONDictionary?,APIError?) -> ())) {
        APIController.makeRequestReturnJSON(.getList(dict: senc_dict, skipCount:skipCount , pageSize: pageSize)) { (data, code, error, dict1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error)
                    }else{
                        completion(code, data, error)
                    }
                })
            }else{
                completion(code,nil, error)
            }
        }
    }
    func signUp(completion: @escaping((Int,JSONDictionary?,APIError?,Data) -> ())) {
        APIController.makeRequestReturnJSON(.signUp(dict: senc_dict)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error, data1)
                    }
                })
            }else{
                completion(code,nil, error, data1)
            }
        }
    }
    func signIn(completion: @escaping((Int,JSONDictionary?,APIError?,Data) -> ())) {
        APIController.makeRequestReturnJSON(.signIn(dict: senc_dict)) { (data, code, error,data1) in
            
            print(data!)
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error, data1)
                    }
                })
            }else{
                completion(code,nil, error, data1)
            }
        }
    }
    func getCountryList(completion: @escaping((Int,JSONDictionary?,APIError?,Data) -> ())) {
        APIController.makeRequestReturnJSON(.getCountryList) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error, data1)
                    }
                })
            }else{
                completion(code,nil, error, data1)
            }
        }
    }
    
    func getPropertyDetails(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.getPropertyDetails(propertyId: propertyid)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func getAmenities(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.getAmenities(propertyId: propertyid)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func getMediaDetails(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.getMediaDetails(propertyId: propertyid)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func getLocationList(completion: @escaping((Int,JSONDictionary?,APIError?,Data) -> ())) {
        APIController.makeRequestReturnJSON(.getLocationList(dict: senc_dict)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error, data1)
                    }
                })
            }else{
                completion(code,nil, error, data1)
            }
        }
    }
    func savepropertyfavorite(completion: @escaping((Int,JSONDictionary?,APIError?,Data) -> ())) {
        APIController.makeRequestReturnJSON(.savepropertyfavorite(dict: senc_dict)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error, data1)
                    }
                })
            }else{
                completion(code,nil, error, data1)
            }
        }
    }
    func saveAccountfavorite(completion: @escaping((Int,JSONDictionary?,APIError?,Data) -> ())) {
        APIController.makeRequestReturnJSON(.saveAccountfavorite(dict: senc_dict)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error, data1)
                    }
                })
            }else{
                completion(code,nil, error, data1)
            }
        }
    }
    func getFavoritesList(completion: @escaping((Int,JSONDictionary?,APIError?,Data) -> ())) {
        APIController.makeRequestReturnJSON(.getFavoritesList(purpose: favoritePurpose)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error, data1)
                    }
                })
            }else{
                completion(code,nil, error, data1)
            }
        }
    }
    func getAccountsFavoritesList(completion: @escaping((Int,JSONDictionary?,APIError?,Data) -> ())) {
        APIController.makeRequestReturnJSON(.getAccountsFavoritesList) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error, data1)
                    }
                })
            }else{
                completion(code,nil, error, data1)
            }
        }
    }
    func leadinquiry(completion: @escaping((Int,JSONDictionary?,APIError?,Data) -> ())) {
        APIController.makeRequestReturnJSON(.leadinquiry(dict: senc_dict)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error, data1)
                    }
                })
            }else{
                completion(code,nil, error, data1)
            }
        }
    }
    func groupWiseCategories(completion: @escaping((Int,JSONDictionary?,APIError?,Data) -> ())) {
        APIController.makeRequestReturnJSON(.groupWiseCategories) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error, data1)
                    }
                })
            }else{
                completion(code,nil, error, data1)
            }
        }
    }
    func getAccountDetails(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.getAccountDetails(accountId: accountId)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func getBannerDetails(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.getBanneretails(accountId: accountId)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func getAccountProjects(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.getAccountProjects(accountId: accountId)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func getAccountService(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.getAccountService(accountId: accountId)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func getAccountVideoProfiles(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.getAccountVideoProfiles(accountId: accountId)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func getAccountIdeabooks(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.getAccountIdeabooks(accountId: accountId)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func getAccountBrochures(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.getAccountBrochures(accountId: accountId)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func getAccountAchievements(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.getAccountAchievements(accountId: accountId)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func getPropertyTypes(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.getPropertyTypes) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func getImpression(completion: @escaping((Int,JSONDictionary?,APIError?,Data) -> ())) {
        APIController.makeRequestReturnJSON(.getImpression(dict: senc_dict)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error, data1)
                    }
                })
            }else{
                completion(code,nil, error, data1)
            }
        }
    }
    func impressionPropertyId(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.impressionPropertyId(propertyId1: self.propertyid, impression: self.impressionId)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func impressionAgentId(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.impressionAgentId(agentId: self.propertyid, impression: self.impressionId)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func impressionCategoryId(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.impressionAgentId(agentId: self.propertyid, impression: self.impressionId)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func impressionAccountProjectId(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.impressionAccountProjectId(projectId: self.propertyid, impression: self.impressionId)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
    func impressionProjectProjectId(completion: @escaping((Int,JSONDictionary?,APIError?, Data) -> ())) {
        APIController.makeRequestReturnJSON(.impressionProjectProjectId(projectId: self.propertyid, impression: self.impressionId)) { (data, code, error,data1) in
            if data != nil {
                //let code = data!["code"] as! Int
                APIController.validateJason("\(code)", completion: { (bool) in
                    if bool {
                        completion(code, data, error,data1)
                    }else{
                        completion(code, data, error,data1)
                    }
                })
            }else{
                completion(code, data, error,data1)
            }
        }
    }
}




import Moya
//import Result
import Alamofire

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}
//let APIProvider = MoyaProvider<API>()

let plugin: PluginType = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))

let APIProvider = MoyaProvider<API>(plugins: [plugin])

enum API {
    case getList(dict:JSONDictionary,skipCount: Int,pageSize: Int)
    case signUp(dict:JSONDictionary)
    case signIn(dict:JSONDictionary)
    case getCountryList
    case getPropertyDetails(propertyId: Int)
    case getMediaDetails(propertyId: Int)
    case getLocationList(dict: JSONDictionary)
    case savepropertyfavorite(dict: JSONDictionary)
    case saveAccountfavorite(dict: JSONDictionary)
    case getFavoritesList(purpose: Int)
    case getAccountsFavoritesList
    case leadinquiry(dict: JSONDictionary)
    case groupWiseCategories
    case getAccountDetails(accountId: Int)
    case getBanneretails(accountId: Int)
    case getAccountProjects(accountId: Int)
    case getAccountService(accountId: Int)
    case getAccountVideoProfiles(accountId: Int)
    case getAccountIdeabooks(accountId: Int)
    case getAccountBrochures(accountId: Int)
    case getAccountAchievements(accountId: Int)
    case getPropertyTypes
    case getImpression(dict: JSONDictionary)
    case impressionPropertyId(propertyId1: Int, impression: String)
    case impressionAgentId(agentId: Int, impression: String)
    case impressionCategoryId(categoryId: Int, impression: String)
    case impressionAccountProjectId(projectId: Int, impression: String)
    case impressionProjectProjectId(projectId: Int, impression: String)
    case getAmenities(propertyId: Int)
    

    
//    case login(id:String,password:String,device_token:String)
    
}
extension API: TargetType {
    
    public var headers: [String : String]? {
        let userToken = UserDefaults.standard.string(forKey: "devicetoken")
        print(Helpers.userToken())
        if userToken == "" {
            return ["Authorization":""]
        }else if userToken == nil {
            return ["Authorization":""]

        }else{
            print(userToken as Any)
            return ["Authorization":"Bearer \(userToken ?? "")"]//\(Helpers.userToken())
        }
    }
    
    var baseURL : URL { return URL(string: Constants.API.baseURL)! }

    var path: String {
        switch self {
        case .getList( _ ,let skipCount, let pageSize):
            return "pp/v1/properties/\(skipCount)/\(pageSize)"
        case .signUp(_):
            return "users/v1/signup"
        case .signIn(_):
            return "users/v1/authenticate"
        case .getCountryList:
            return "common/v1/countries"
        case .getPropertyDetails(let property):
            return "pp/v1/property/\(property)/details"
        case .getMediaDetails(let property):
            return "pp/v1/property/\(property)/medias"
        case .getLocationList(_):
            return "pp/v1/getlocations"
        case .savepropertyfavorite(_):
            return "users/v1/savepropertyfavorite"
        case .saveAccountfavorite(_):
            return "users/v1/saveaccountfavorite"
        case .getFavoritesList(let purpose):
            return "users/v1/favorite/properties/\(purpose)/1/0/100"
        case .getAccountsFavoritesList:
            return "users/v1/favorite/Accounts/0/100"
        case .leadinquiry(_):
            return "crm/v1/leadinquiry"
        case .groupWiseCategories:
            return "crm/v1/groupwisecategories"
        case .getAccountDetails(let account):
            return "pps/v1/account/\(account)/details"
        case .getBanneretails(let account):
            return "pps/v1/account/\(account)/banner"
        case .getAccountProjects(let account):
            return "pps/v1/account/\(account)/projects"
        case .getAccountService(let account):
            return "pps/v1/account/\(account)/service"
        case .getAccountVideoProfiles(let account):
            return "pps/v1/account/\(account)/videoprofiles"
        case .getAccountIdeabooks(let account):
            return "pps/v1/account/\(account)/ideabooks"
        case .getAccountBrochures(let account):
            return "pps/v1/account/\(account)/brochures"
        case .getAccountAchievements(let account):
            return "pps/v1/account/\(account)/achievements"
        case .getPropertyTypes:
            return "crm/v1/property/types"
        case .getImpression(_):
            return "impression"
        case .impressionPropertyId(let propertyId1, let impression):
            return "impression/v1/\(impression)/pp/property/\(propertyId1)"
        case .impressionAgentId(let agentId, let impression):
            return "impression/v1/\(impression)/pp/agent/\(agentId)"
        case .impressionCategoryId(let categoryId, let impression):
            return "impression/v1/\(impression)/pps/category/\(categoryId)"
        case .impressionAccountProjectId(let projectId, let impression):
            return "impression/v1/\(impression)/pps/category/\(projectId)"
        case .impressionProjectProjectId(let projectId, let impression):
            return "impression/v1/\(impression)/pps/category/\(projectId)"
        case .getAmenities(let productId):
            return "pp/v1/property/\(productId)/amenities"
            
        }
    }
    public var method: Moya.Method {
        switch self {
        case .getList, .signUp, .signIn, .getLocationList,.savepropertyfavorite, .leadinquiry, .saveAccountfavorite, .getImpression:
            return .post
        case .getCountryList, .getPropertyDetails, .getAmenities, .getMediaDetails, .getFavoritesList, .groupWiseCategories, .getAccountDetails, .getBanneretails, .getAccountProjects, .getAccountService, .getAccountVideoProfiles, .getAccountIdeabooks, .getAccountBrochures, .getAccountAchievements, .getPropertyTypes, .getAccountsFavoritesList, .impressionPropertyId, .impressionAgentId, .impressionCategoryId, .impressionAccountProjectId, .impressionProjectProjectId:
            return .get
        }
    }
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
            
        case .getList(_, let skipCount, let pageCount):
            return .requestParameters(parameters: ["skipcount":skipCount,"pagesize":pageCount], encoding: JSONEncoding.default)
        case .signUp(dict: let dict), .signIn(dict: let dict), .getLocationList(dict: let dict), .savepropertyfavorite(dict: let dict), .leadinquiry(dict: let dict), .saveAccountfavorite(dict: let dict), .getImpression(dict: let dict):
            return .requestParameters(parameters: dict, encoding: JSONEncoding.default)
        case .getCountryList, .getPropertyDetails, .getMediaDetails, .getAmenities, .getFavoritesList, .groupWiseCategories, .getAccountDetails, .getBanneretails, .getAccountProjects, .getAccountService, .getAccountVideoProfiles, .getAccountIdeabooks, .getAccountBrochures, .getAccountAchievements,.getPropertyTypes, .getAccountsFavoritesList, .impressionPropertyId, .impressionAgentId, .impressionCategoryId,.impressionAccountProjectId, .impressionProjectProjectId :
            return .requestPlain
        }
    }
    struct JsonArrayEncoding: Moya.ParameterEncoding {
        public static var `default`: JsonArrayEncoding { return JsonArrayEncoding() }
        public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
            print("urlRequestt\(urlRequest)")
            var req = try urlRequest.asURLRequest()
            let json = try JSONSerialization.data(withJSONObject: parameters!["jsonArray"]!, options: JSONSerialization.WritingOptions.prettyPrinted)
            req.setValue("application/json", forHTTPHeaderField: "Content-Type")
            req.httpBody = json
            return req
        }
    }
}


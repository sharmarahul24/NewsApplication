//
//  NewsViewModel.swift
//  NewsApplication
//
//  Created by R92 on 08/04/24.
//

import Foundation
class NewsApi : NSObject
{
    var Newsmodel : Apiservice = Apiservice()
    var newsapicaling : News?
    
    var model2 : Newsmodel?
    override init() {
        super.init()
    }
    
    func getNewsapi(country : String,category:String,_ loaded : @escaping () -> Void)
    {
        Newsmodel.newsModelapi(country: country, category: category) { news in
            self.newsapicaling = news
            loaded()
        }
    }
    
    func getNewmodel(topic: String, _ loaded : @escaping () -> Void)
    {
        Newsmodel.newApimodel(topic: topic) { news in
            self.model2 = news
            loaded()
        }
    }
}

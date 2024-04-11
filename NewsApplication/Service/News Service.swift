//
//  News Service.swift
//  NewsApplication
//
//  Created by R92 on 08/04/24.
//

import Foundation
class Apiservice {
    
    
    var apii : News?
    var model : Newsmodel?
    
    
    
    func newsModelapi(country : String,category : String ,_ loded : @escaping (_ news: News) -> Void)
    {
        let api = "https://newsapi.org/v2/top-headlines?country=\(country)&category=\(category)&apiKey=595ea1ea95d94d7faa825378f401c7b1"
        
        var urlrequest = URLRequest(url: URL(string: api)!)
        
        urlrequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlrequest) { [self] data, response, error in
            do
            {
                if(data != nil)
                {
                    apii = try JSONDecoder().decode(News.self , from: data!)
                    print(apii!)
                    loded(apii!)
                }
            }
            catch
            {
                print(error.localizedDescription)
            }
        }.resume()
        
        
    }
    
    
    func newApimodel(topic: String,_ lodede : @escaping (_ news: Newsmodel) -> Void)
    {
        let link = "https://newsapi.org/v2/everything?q=\(topic)&from=2024-03-11&sortBy=publishedAt&apiKey=595ea1ea95d94d7faa825378f401c7b1"
        
        var urlrequest = URLRequest(url: URL(string: link)!)
        
        urlrequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlrequest) { [self] data, response, error in
            do
            {
                if(data != nil)
                {
                    model = try JSONDecoder().decode(Newsmodel.self , from: data!)
                    print(model!)
                    lodede(model!)
                }
            }
            catch
            {
                print(error.localizedDescription)
            }
        }.resume()
        
        
    }
    
}

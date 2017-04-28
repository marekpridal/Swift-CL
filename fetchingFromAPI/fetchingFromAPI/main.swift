//
//  main.swift
//  fetchingFromAPI
//
//  Created by Marek Pridal on 28.04.17.
//  Copyright (c) 2017 marekpridal. All rights reserved.
//

import Foundation

public func fetch(completionHandler: @escaping (Array<String>?,String?,Bool) -> Void)
{
    var videos:Array<String> = []
    // Set up the URL request
    let todoEndpoint: String = "https://vr.profiq.com/api/vid/video/?format=json"
    guard let url = URL(string: todoEndpoint) else
    {
        print("Error: cannot create URL")
        return
    }
    // set up the session
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    // make the request
    let task = session.dataTask(with: urlRequest as URLRequest)
    {
        (data, response, error) in
        guard error == nil else
        {
            print("error calling GET on /todos/1")
            completionHandler(nil,"Check your internet connection",true)
            //print(error)
            return
        }
        // make sure we got data
        guard let responseData = data else
        {
            print("Error: did not receive data")
            completionHandler(nil,"Cannot fetch data",false)
            return
        }
        // parse the result as JSON, since that's what the API provides
        do
        {
            if let jsonObj = try JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as? [[String:Any]]
            {
                //printing the json in console
                
                for video in jsonObj
                {
                    guard let name = video["name"] as? String else
                    {
                        throw NSError.init(domain: "Error in getting values\nLine 54", code: 1, userInfo: nil)
                    }
                    videos.append(name)
                }
                
                completionHandler(videos,nil,false)
            }
        }
        catch let error as NSError
        {
            print("\(error.domain)")
            
            completionHandler(nil,error.domain,true)
        }
        catch
        {
            print("Error in parsing")
        }
    }
    task.resume()
}
var fetching = true
fetch
{
    (names, errorMessage, error) in
    
    if let names = names
    {
        
        print("Videos")
        print("----------------------------------------")
        var i = 0
        for name in names
        {
            i += 1
            print("| \(i) \(name)")
        }
        
        print("----------------------------------------")
    }
    
    
    fetching = false
}

while fetching
{
    
}

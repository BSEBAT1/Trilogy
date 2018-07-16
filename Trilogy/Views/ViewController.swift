//
//  ViewController.swift
//  Trilogy
//
//  Created by macbook pro on 6/11/18.
//  Copyright © 2018 Trilogy. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UIWebViewDelegate {
    
    let linkedInKey = "77erxpnuryjn1p"
    
    let linkedInSecret = "YTdNkmMke1QZZG72"
    
    let authorizationEndPoint = "https://www.linkedin.com/uas/oauth2/authorization"
    
    let accessTokenEndPoint = "https://www.linkedin.com/uas/oauth2/accessToken"
    
    let WebView:UIWebView = UIWebView();
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = UIButton(type: .custom)
        if let image = UIImage(named:"Linkdn.png"){
            button.setImage(image, for:.normal)
        }
        let textlabel = UILabel()
        textlabel.translatesAutoresizingMaskIntoConstraints=false
        textlabel.text="Trilogy App"
        textlabel.textColor=UIColor.white
        textlabel.textAlignment = .center
        textlabel.font = UIFont(name: "Futura-Medium", size:28)
        textlabel.sizeToFit()
        let infolabel = UILabel()
        infolabel.text = "You are moments away from the best curated commercial real estate listings in New York City"
        infolabel.textColor=UIColor.white
        infolabel.font = UIFont(name: "Helvetica-Light", size:24)
        infolabel.textAlignment = .center
        infolabel.translatesAutoresizingMaskIntoConstraints=false
        infolabel.lineBreakMode = .byWordWrapping
        infolabel.numberOfLines=0;
        self.view.addSubview(infolabel)
        self.view.addSubview(textlabel)
        let background = UIImage(named: "back")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)

        if UserDefaults.standard.object(forKey: "trilogyID") != nil {
            DispatchQueue.main.async {

                let alert = self.storyboard?.instantiateViewController(withIdentifier:"next") as! NextViewController

                self.present(alert, animated: false, completion:nil)
            }
        }
        
        if UserDefaults.standard.object(forKey: "id") != nil {
            let firstname:String? = UserDefaults.standard.object(forKey:"firstName") as? String
            let lastname:String? = UserDefaults.standard.object(forKey:"lastName") as? String
            let company:String? = UserDefaults.standard.object(forKey:"company") as? String
            let linkdID:String? = UserDefaults.standard.object(forKey:"id") as? String
            let email: String? = UserDefaults.standard.object(forKey:"email") as? String

            DispatchQueue.main.async {
                
                self.WebView.removeFromSuperview()

                let parameters: [String: Any] = [
                    "firstname": firstname ?? NSNull(),
                    "linkedin_id": linkdID ?? NSNull(),
                    "lastname": lastname ?? NSNull(),
                    "company": company ?? NSNull(),
                    "user_type": "tenant",
                    "email_id": email ?? NSNull()
                ]

                Alamofire.request("http://meettrilogy.com:8080/TrilogyWebService/User/add", method: .post, parameters: parameters, encoding: JSONEncoding.default)
                    .responseJSON { response in

                        if let result = response.result.value {
                            let JSON = result as! NSDictionary

                            let trilogyID = JSON["userID"] as! Int

                            UserDefaults.standard.set(trilogyID, forKey:"trilogyID")

                            UserDefaults.standard.synchronize()
                        }

                        let alert = self.storyboard?.instantiateViewController(withIdentifier:"next") as! NextViewController

                        self.present(alert, animated: false, completion:nil)
                }
        }

        }
        
        button.translatesAutoresizingMaskIntoConstraints=false;
        self.view.addSubview(button)
        let views:[String:AnyObject] = ["Button":button,"header":textlabel,"info":infolabel];
        button.addTarget(self, action:#selector(action), for: UIControlEvents.touchUpInside)
        
     let heighthalf = self.view.frame.size.height/4
     let lengthhalf = self.view.frame.size.width/4
     
        let metrics = ["height":heighthalf,"length":lengthhalf];
        
                let hori =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-50-[Button(50@100)]-50-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:metrics, views:views)
        
        let hori2 =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-50-[header]-50-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:metrics, views:views)
         let hori3 =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-25-[info]-25-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:metrics, views:views)
     
                let ver =  NSLayoutConstraint.constraints(withVisualFormat:"V:|-60-[header]-15-[info]-85-[Button(50@1000)]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:metrics, views:views)
                self.view.addConstraints(hori)
                self.view.addConstraints(ver)
                self.view.addConstraints(hori2)
                self.view.addConstraints(hori3)
        
        
    }
 
    func checkForExistingAccessToken() {
        
        if UserDefaults.standard.object(forKey: "LIAccessToken") != nil {
            if let accessToken = UserDefaults.standard.object(forKey: "LIAccessToken"){
                let targetURLString = "https://api.linkedin.com/v1/people/~:(id,first-name,email-address,last-name,headline,picture-url,industry,summary,specialties,positions:(id,title,summary,start-date,end-date,is-current,company:(id,name,type,size,industry,ticker)),educations:(id,school-name,field-of-study,start-date,end-date,degree,activities,notes),associations,interests,num-recommenders,date-of-birth,publications:(id,title,publisher:(name),authors:(id,name),date,url,summary),patents:(id,title,summary,number,status:(id,name),office:(name),inventors:(id,name),date,url),languages:(id,language:(name),proficiency:(level,name)),skills:(id,skill:(name)),certifications:(id,name,authority:(name),number,start-date,end-date),courses:(id,name,number),recommendations-received:(id,recommendation-type,recommendation-text,recommender),honors-awards,three-current-positions,three-past-positions,volunteer)?format=json"

            let req = NSMutableURLRequest(url: NSURL(string: targetURLString)! as URL)
            
            // Indicate that this is a GET request.
            req.httpMethod = "GET"
            
            // Add the access token as an HTTP header field.
            req.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
                // Initialize a NSURLSession object.
                let session = URLSession(configuration: URLSessionConfiguration.default)

                // Make the request.
                let task: URLSessionDataTask = session.dataTask(with: req as URLRequest) { (data, response, error) -> Void in
                    
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    
                    if statusCode == 200 {
                        // Convert the received JSON data into a dictionary.
                        do {

                            let dataDictionary:[String:Any]? = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]

                            if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                                if let prettyPrintedData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                                    print(String(bytes: prettyPrintedData, encoding: String.Encoding.utf8) ?? "NIL")
                                }
                            }
                            
                            if let id:String = dataDictionary!["id"] as? String {

                                if let email: String = dataDictionary!["emailAddress"] as? String {

                                    UserDefaults.standard.set(email, forKey:"email")
                                    UserDefaults.standard.synchronize()

                                }

                                UserDefaults.standard.set(id, forKey:"id")
                                UserDefaults.standard.synchronize()

                            if let profiledictionary:NSDictionary = dataDictionary!["positions"] as? NSDictionary {

                            if let profilevalues:NSArray = profiledictionary["values"] as? NSArray {

                            if let dictionary = profilevalues[0] as? NSDictionary {
                            
                            if let companies = dictionary["company"] as? NSDictionary {
                            
                            if let companylist = companies["name"]as? NSString {
                            
                            if let firstnamedict = dataDictionary!["lastName"] as? String {
                          if let lastnamedict = dataDictionary!["firstName"] as? String {
                          
                            UserDefaults.standard.set(companylist, forKey: "company")
                              UserDefaults.standard.set(firstnamedict, forKey: "lastName")
                            UserDefaults.standard.set(lastnamedict, forKey: "firstName")
                            UserDefaults.standard.synchronize()
                            }
                            }
                            }
                            }
                            }
                            }
                            }
                            }

                            DispatchQueue.main.async {

                                self.WebView.removeFromSuperview();

                                let next = NextViewController()
                                
                                self.present(next, animated: false, completion:nil)
                            }
                        }
                        catch {
                            print("Could not convert JSON data into a dictionary.")
                        }
                    }
                }
                
                task.resume()
            }
        } else {
            startAuthorization()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startAuthorization() {
        self.view.addSubview(WebView)
        WebView.delegate = self;
        WebView.translatesAutoresizingMaskIntoConstraints = false;
        let views:[String:AnyObject] = ["Webview":WebView];
        
        let hori =  NSLayoutConstraint.constraints(withVisualFormat:"H:|-0-[Webview]-0-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        
        let ver =  NSLayoutConstraint.constraints(withVisualFormat:"V:|-0-[Webview]-0-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        self.view.addConstraints(hori)
        self.view.addConstraints(ver)
        self.view.bringSubview(toFront: WebView)
        
        
        // Specify the response type which should always be "code".
        let responseType = "code"
        
        // Set the redirect URL. Adding the percent escape characthers is necessary.
        let redirectURL = "https://com.trilogy.linkedin.oauth/oauth".addingPercentEncoding(withAllowedCharacters:.alphanumerics)!
        // Create a random string based on the time interval (it will be in the form linkedin12345679).
        let state = "linkedin\(Int(NSDate().timeIntervalSince1970))"
        
        // Set preferred scope.
        let scope = "r_basicprofile%20r_emailaddress"
        
        // Create the authorization URL string.
        var authorizationURL = "\(authorizationEndPoint)?"
        authorizationURL += "response_type=\(responseType)&"
        authorizationURL += "client_id=\(linkedInKey)&"
        authorizationURL += "redirect_uri=\(redirectURL)&"
        authorizationURL += "state=\(state)&"
        authorizationURL += "scope=\(scope)"
        
        print(authorizationURL)
        
        let request = NSURLRequest(url: NSURL(string: authorizationURL)! as URL)
        WebView.loadRequest(request as URLRequest)
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.url!
       // print(url)
        print("host is")
        print(url.host!)
        if url.host == "com.trilogy.linkedin.oauth" {
            
            if url.absoluteString.range(of:"code") != nil {
                let urlParts = url.absoluteString.components(separatedBy:"?")
                let code = urlParts[1].components(separatedBy:"=")[1]
                
                print(code)
                
                requestForAccessToken(authorizationCode: code)
            } else if url.absoluteString.range(of:"access_denied") != nil{
                  self.WebView.removeFromSuperview()
            }
        }
        
        return true
    }
    

    func requestForAccessToken(authorizationCode: String) {
        
        let grantType = "authorization_code"
        
           let redirectURL = "https://com.trilogy.linkedin.oauth/oauth".addingPercentEncoding(withAllowedCharacters:.alphanumerics)!
        // Set the POST parameters.
        var postParams = "grant_type=\(grantType)&"
        postParams += "code=\(authorizationCode)&"
        postParams += "redirect_uri=\(redirectURL)&"
        postParams += "client_id=\(linkedInKey)&"
        postParams += "client_secret=\(linkedInSecret)"
        let postData = postParams.data(using: String.Encoding.utf8)
        let request = NSMutableURLRequest(url: NSURL(string: accessTokenEndPoint)! as URL)
        // Indicate that we're about to make a POST request.
        request.httpMethod = "POST"
        
        // Set the HTTP body using the postData object created above.
        request.httpBody = postData
        request.addValue("application/x-www-form-urlencoded;", forHTTPHeaderField: "Content-Type")
        // Initialize a NSURLSession object.
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        // Make the request.
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            
            // Get the HTTP status code of the request.
            let statusCode = (response as! HTTPURLResponse).statusCode
            
            if statusCode == 200 {
                // Convert the received JSON data into a dictionary.
                do {
                    let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any]
                    
                    let accessToken = dataDictionary!["access_token"] as! String
                    UserDefaults.standard.set(accessToken, forKey: "LIAccessToken")
                    UserDefaults.standard.synchronize()
                     self.checkForExistingAccessToken()
                    
                }
                catch {
                    print("Could not convert JSON data into a dictionary.")
                }
            }
        }
        
        task.resume()
        
    }
    
    @objc func action(sender:UIButton!) {
        checkForExistingAccessToken()
    }
}



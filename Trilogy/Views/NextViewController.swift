//
//  NextViewController.swift
//  Trilogy
//
//  Created by macbook pro on 6/14/18.
//  Copyright © 2018 Trilogy. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let textlabel = UILabel()
        textlabel.translatesAutoresizingMaskIntoConstraints=false
        textlabel.text="Trilogy App"
        textlabel.textColor=UIColor.white
        textlabel.textAlignment = .center
        textlabel.font = UIFont(name: "Futura-Medium", size:28)
        let infolabel = UILabel()
        infolabel.text = "The Trilogy research team has combined thousands of listings for more then 80 spaces requirments that vary by size, location, budget, term, and condition and timing."
        infolabel.textColor=UIColor.white
        infolabel.font = UIFont(name: "Helvetica-Light", size:24)
        infolabel.textAlignment = .center
        infolabel.translatesAutoresizingMaskIntoConstraints=false
        infolabel.lineBreakMode = .byWordWrapping
        infolabel.numberOfLines=0;
        let custom = UILabel()
        let background = UIImage(named: "back2")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        custom.text = "Higly customized. Updated daily"
        custom.font = UIFont(name: "Futura-CondensedExtraBold", size: 20)
        custom.textColor = UIColor.white
        custom.translatesAutoresizingMaskIntoConstraints=false
        let tenant = UIImage(named:"tenants")
        let owners = UIImage(named: "owners")
        let imageviewtenants = UIImageView()
        let imageviewowners = UIImageView()
        
        imageviewowners.image = owners
        imageviewtenants.image = tenant
        imageviewtenants.translatesAutoresizingMaskIntoConstraints=false
        imageviewowners.translatesAutoresizingMaskIntoConstraints = false
        imageviewtenants.contentMode = .scaleAspectFit
        imageviewowners.contentMode = .scaleAspectFit
        imageviewtenants.clipsToBounds=true
        imageviewowners.clipsToBounds=true
        let tenant_text=UILabel()
        let owner_text = UILabel()
        tenant_text.text="For Tenants"
        owner_text.text="For Owners"
        owner_text.font = UIFont(name: "Futura-CondensedExtraBold", size: 18)
        tenant_text.font = UIFont(name: "Futura-CondensedExtraBold", size: 18)
        tenant_text.translatesAutoresizingMaskIntoConstraints=false;
        owner_text.translatesAutoresizingMaskIntoConstraints=false;
        owner_text.textColor = UIColor.white
        tenant_text.textColor = UIColor.white
        
        let views:[String:AnyObject] = ["textlabel":textlabel,"infolabel":infolabel,"custom":custom,"tenant":imageviewtenants,"owner":imageviewowners,"tenant_text":tenant_text,"owner_text":owner_text]
        self.view.addSubview(textlabel)
        self.view.addSubview(infolabel)
        self.view.addSubview(custom)
        self.view.addSubview(imageviewtenants)
        self.view.addSubview(imageviewowners)
        self.view.addSubview(tenant_text)
        self.view.addSubview(owner_text)
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(NextViewController.tapDetected))
        imageviewtenants.isUserInteractionEnabled=true
        imageviewtenants.addGestureRecognizer(singleTap)
        
        let hori = NSLayoutConstraint.constraints(withVisualFormat:"V:|-55-[textlabel]-20-[infolabel]-15-[custom]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
      
        let vert = NSLayoutConstraint.constraints(withVisualFormat:"H:|-50-[textlabel]-50-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        
        let vert2 = NSLayoutConstraint.constraints(withVisualFormat:"H:|-25-[infolabel]-25-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        
        let vert3 = NSLayoutConstraint.constraints(withVisualFormat:"H:|-50-[custom]-20-|" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
          let vert4 = NSLayoutConstraint.constraints(withVisualFormat:"H:|-35-[tenant(100@1000)]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        let vert5 = NSLayoutConstraint.constraints(withVisualFormat:"V:[custom]-40-[tenant(100@1000)]" , options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:views)
        
        let vert6 = NSLayoutConstraint.constraints(withVisualFormat:"H:[tenant]-100-[owner(100@1000)]" , options:.alignAllCenterY, metrics:nil, views:views)
        let vert7 = NSLayoutConstraint.constraints(withVisualFormat:"V:[tenant]-6-[tenant_text]" , options:.alignAllCenterX, metrics:nil, views:views)
        let vert8 = NSLayoutConstraint.constraints(withVisualFormat:"H:[tenant_text]-110-[owner_text]" , options:.alignAllCenterY, metrics:nil, views:views)

        self.view.addConstraints(vert)
        self.view.addConstraints(hori)
        self.view.addConstraints(vert2)
        self.view.addConstraints(vert3)
        self.view.addConstraints(vert4)
        self.view.addConstraints(vert5)
        self.view.addConstraints(vert6)
        self.view.addConstraints(vert7)
        self.view.addConstraints(vert8)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tapDetected() {
        DispatchQueue.main.async {
            let main = UIStoryboard(name:"Main" , bundle:nil)
            let controller = main.instantiateViewController(withIdentifier: "terms")
          
            self.present(controller, animated: true, completion: nil)
        }
        
    }

}

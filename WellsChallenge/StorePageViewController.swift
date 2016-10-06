//
//  StorePageViewController.swift
//  WellsChallenge
//
//  Created by Mohamed Ayadi on 10/05/16.
//  Copyright © 2016 Ayadi. All rights reserved.
//

import UIKit

class StorePageViewController : UIPageViewController{
    

    //hardcoded page data
    var pageData = [PageData(title: "", desc: "", jumpText: "", background: "red_sneaker"),
                    PageData(title: "", desc: "", jumpText: "", background: "black_heel"),
                    PageData(title: "Fashion Show", desc: "December 1st 2015", jumpText: "Get Tickets", background: "fashion_show"),
                    PageData(title: "Personal Shopper", desc: "", jumpText: "Book Now", background: "personal_shopper")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        //init the page view controller
        if let pageVc = self.viewPage(0){
            let pagesVcs  = [pageVc]
            setViewControllers(pagesVcs, direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        }
    }
    
    //returns the relevant pageview populated from the page data
    func viewPage(index: Int) -> PageContentViewController? {
        if let storyboard = storyboard,
            page = storyboard.instantiateViewControllerWithIdentifier("PageContentViewController")
                as? PageContentViewController {
            page.MyPageData = self.pageData[index]
            page.PageIndex = index
            return page
        }
        return nil
    }
    
    //MARK: - Indicator
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageData.count
    }
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

//MARK: - PageViewDelegate
extension StorePageViewController : UIPageViewControllerDelegate{
    
}
//MARK: - PageViewDatasource
extension StorePageViewController : UIPageViewControllerDataSource{
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? PageContentViewController {
            var index = viewController.PageIndex
            
            if(index == 0){
                index = self.pageData.count - 1
            }else{
                index = index - 1
            }
            
            return viewPage(index)
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? PageContentViewController {
            var index = viewController.PageIndex
            
            if(index >= self.pageData.count - 1){
                index = 0
            }else{
                index = index + 1
            }            
            return viewPage(index)
        }

        return nil
    }
}

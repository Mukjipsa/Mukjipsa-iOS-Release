//
//  TabBarController.swift
//  Mukjipsa-iOS-Release
//
//  Created by 황찬미 on 2023/01/31.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setRootTabBar()
    }
}

private extension TabBarController {
    func makeTabBar(viewController: UIViewController,
                            title: String,
                            tabBarImg: UIImage,
                            tabBarSelectedImg: UIImage,
                            renderingMode: UIImage.RenderingMode) -> UIViewController {
        
        let tab = UINavigationController(rootViewController: viewController)
        tab.isNavigationBarHidden = true
        tab.tabBarItem = UITabBarItem(title: title,
                                      image: tabBarImg.withRenderingMode(renderingMode),
                                      selectedImage: tabBarSelectedImg.withRenderingMode(renderingMode))
        return tab
    }
    
    func setTabBar() {
        let recipeTab = makeTabBar(viewController: MyRecipeViewController(),
                                   title: "레시피",
                                   tabBarImg: Image.tabbarRecipe ?? UIImage(),
                                   tabBarSelectedImg: Image.tabbarRecipeSelected ?? UIImage(),
                                   renderingMode: .alwaysTemplate)
        let ingredientTap = makeTabBar(viewController: MyIngredientViewController(),
                                       title: "나의 재료",
                                       tabBarImg: Image.tabbarIngredient ?? UIImage(),
                                 tabBarSelectedImg: Image.tabbarIngredientSelected ?? UIImage(),
                                 renderingMode: .alwaysTemplate)
        let bookmarkTap = makeTabBar(viewController: BookmarkViewController(),
                                     title: "북마크",
                                     tabBarImg: Image.tabbarBookmark ?? UIImage(),
                                 tabBarSelectedImg: Image.tabbarBookmarkSelected ?? UIImage(),
                                 renderingMode: .alwaysTemplate)
        
        let tabs = [recipeTab, ingredientTap, bookmarkTap]
    
        self.setViewControllers(tabs, animated: false)
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
    }
    
    func setRootTabBar() {
        self.selectedIndex = 1
    }
}


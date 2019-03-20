//
//  RecipeDetailViewController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 17/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import UIKit
import Firebase

class RecipeDetailViewController: UIViewController {
    
    var coordinator:MainCoordinator?

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeInfoView: UIView!
    @IBOutlet weak var recipeTableView: UITableView!
    @IBOutlet weak var segmentedControl: SegmentedControl!
    @IBOutlet weak var addIngredients: UIButton!
    
    
    var docRef:DocumentReference!
    
    var recipe:RecipeExpandable!
    
    private enum SourceType: Int {
        case directions, ingredients
    }

    var steps:[Step] = Step.loadSteps()
    var ingredients:[Ingredient] = Ingredient.loadIngredients()
    
    
    
    var currentDataSource:(UITableViewDelegate & UITableViewDataSource)?{
        didSet{
            if let _ = currentDataSource as? DirectionsDataSource {
                recipeTableView.delegate = self
            }
            else{
                recipeTableView.delegate = currentDataSource
            }
            
            recipeTableView.dataSource = currentDataSource
            recipeTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        recipeTableView.estimatedRowHeight = recipeTableView.rowHeight
//        recipeTableView.rowHeight = UITableView.automaticDimension
            }
    
    override func viewWillDisappear(_ animated: Bool) {
       // navigationController?.navigationBar.isHidden = false
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        
        setUpVC(recipe: recipe)
        setUpTagLabels()
        addIngredients.isHidden = true
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        var docRef = Firestore.firestore().document("recipe/ZbDBusdqU3dL1iNwaGZl")
        
        NetworkController.getRecipe{
                recipe in
            self.setUpVC(recipe: recipe)
        }
        
        self.setDataSource(type:.directions)
        
        recipeTableView.rowHeight = 319
        recipeTableView.estimatedRowHeight = 319
        recipeTableView.rowHeight = UITableView.automaticDimension


  
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    
    //Abstract Class
    func setUpTagLabels(){
        // Map Trending Data Tags
        // ADD Subview
        let tagLabel = TagLabel(text: "Quick Fix")
        recipeInfoView.addSubview(tagLabel)
        
        tagLabel.leadingAnchor.constraint(equalTo: recipeInfoView.leadingAnchor,constant:20).isActive = true
        tagLabel.bottomAnchor.constraint(equalTo: recipeInfoView.bottomAnchor,constant:-20).isActive = true
        
    }
    
    @objc func segmentChanged(_ sender:UISegmentedControl){
        let type = SourceType(rawValue: sender.selectedSegmentIndex) ?? .directions
        self.setDataSource(type: type)

    }
    
    private func setDataSource(type:SourceType){
        switch type {
        case .directions:
            currentDataSource = DirectionsDataSource(steps: steps)
            addIngredients.isHidden = true
        case .ingredients:
            currentDataSource =  IngredientsDataSource(ingredients: ingredients)
            addIngredients.isHidden = false
        }
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addIngredientsTapped(_ sender: Any) {
        Alert.showBasicAlert(on: self, with: "Ingredients🌽🍕", message: "Ingredients Saved ✅")
        ShoppingListController.addItem(curatorName: "", recipeName:  recipe.recipeName, time: 30)
    }
    
    func setUpVC(recipe:RecipeExpandable){
        recipeTitleLabel.text = recipe.recipeName
    }
    
    func setUpVC(recipe:Recipe){
        recipeTitleLabel.text = recipe.recipeName
        
        guard let imageURL = URL(string: recipe.recipeImage) else {return}
        ImageService.getImage(withURL: imageURL){
        recipeImage in
            self.recipeImageView.image = recipeImage
        }
    }
}

extension RecipeDetailViewController:UITableViewDelegate{
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let stepText = steps[indexPath.row].text

    var height:CGFloat = 0
    let imageHeight = view.frame.width * 0.65
    
    let approximateWidthOfStepTextView = view.frame.width - 84
    let size = CGSize(width: approximateWidthOfStepTextView, height: 1000)
    
    let attributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-SemiBold", size: 14)]
    
    let estimatedFrame = NSString(string: stepText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes , context: nil)
    
    let totalHeightPadding:CGFloat = 45.0
    
    height = estimatedFrame.height + totalHeightPadding
    
    guard let _ = steps[indexPath.row].imageURL else { return height }
    
    return height + imageHeight
    
    }
    
}


extension RecipeDetailViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        if offsetY < 0{
          //  recipeImageView.transform = CGAffineTransform(translationX: 0, y: offsetY)
        }
        
    }
}

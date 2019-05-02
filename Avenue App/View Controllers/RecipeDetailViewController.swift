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

    let date = Date()
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeInfoView: UIView!
    @IBOutlet weak var recipeTableView: UITableView!
    @IBOutlet weak var segmentedControl: SegmentedControl!
    @IBOutlet weak var addIngredients: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var curatorImageView: UIImageView!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var tags:[String] = []
    
    var docRef:DocumentReference!
    
    var expandableRecipe:RecipeExpandable!
    
    var recipe:Recipe!
    
    var recipeName:String!
    var recipeImage:String!

    
    private enum SourceType: Int {
        case directions, ingredients
    }

    var steps:[Step] = [Step]()
    var ingredients:[Ingredient] = [Ingredient]()
    
    
    
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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        
        
        
        
        addIngredients.isHidden = true
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        
        
        
        self.setDataSource(type:.directions)
        
        recipeTableView.rowHeight = 319
        recipeTableView.estimatedRowHeight = 319
        recipeTableView.rowHeight = UITableView.automaticDimension

        addIngredients.alpha = 0
        
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
        setUpVC()
        
        NetworkController.getRecipe{
            recipe in
            self.setUpVC(recipe: recipe)
            self.recipe = recipe
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        
        
        
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        
        favoriteButton.isSelected.toggle()
        

        if recipe != nil {
            guard favoriteButton.isSelected else {
                FavoriteController.removeFavorite(id: recipe.recipeID)
                return
            }
            
            guard !FavoriteController.faveExistsInDB(id: recipe.recipeID)  else { return }
        FavoriteController.makeFavorite(recipeID: recipe.recipeID, curatorName: recipe.curatorName, recipeImage: recipe.recipeImage, recipeName: recipe.recipeName, time: recipe.time)
        }
        
        
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
        if recipe != nil {
            guard ShoppingListController.itemExistsinDB(with: recipe.recipeID) else {
                Alert.showBasicAlert(on: self, with: "Ingredients🌽🍕", message: "Ingredients Saved ✅")
                ShoppingListController.addItem(recipeID:recipe.recipeID,curatorName: recipe.curatorName, recipeName:  recipe.recipeName, time: 30,ingredients: recipe.ingredients,recipeImage:recipe.recipeImage)
                return
            }
                Alert.showBasicAlert(on: self, with: "Oops", message: "This Ingredient Exists in your Shopping List")
            
            
        }
    }
    
    func setUpVC(){
        
        recipeTitleLabel.text = recipeName
        guard let imageURL = URL(string: recipeImage) else {return}
        ImageService.getImage(withURL: imageURL){
            recipeImage in
            self.recipeImageView.image = recipeImage
        }

    }
    
    func setUpVC(recipe:Recipe){
        recipeTitleLabel.text = recipe.recipeName
        servingsLabel.text = "\(recipe.servings) People"
        timeLabel.text = "\(recipe.time) mins"
        tags = recipe.tags
        steps = recipe.steps
        ingredients = recipe.ingredients
        
        tagCollectionView.reloadData()
        
        setDataSource(type: .directions)
        
        guard let curatorImageURL = URL(string: recipe.curatorImage) else { return }
        
        ImageService.getImage(withURL: curatorImageURL, completion: {
            image in
            self.curatorImageView.image = image
        })
        
        favoriteButton.isSelected = FavoriteController.faveExistsInDB(id: recipe.recipeID)
        
        

        //Load Steps
        
        //Load Ingredients
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.viewRecipeSlide(steps: steps, indexPath: indexPath)
    }
    
}


extension RecipeDetailViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        
        
        if offsetY > view.frame.height * 0.1{
            //  recipeImageView.transform = CGAffineTransform(translationX: 0, y: offsetY)
            UIView.animate(withDuration: 0.3, animations: {
                self.addIngredients.alpha = 1
            })
            
        }
        
        if offsetY > view.frame.height * 0.3{
          //  recipeImageView.transform = CGAffineTransform(translationX: 0, y: offsetY)
            UIView.animate(withDuration: 0.3, animations: {
                self.favoriteButton.alpha = 0
            })
            
        }
        if offsetY < view.frame.height * 0.2{
            //  recipeImageView.transform = CGAffineTransform(translationX: 0, y: offsetY)
            UIView.animate(withDuration: 0.3, animations: {
                self.favoriteButton.alpha = 1
            })
            
        }
        if offsetY < view.frame.height * 0.1{
            //  recipeImageView.transform = CGAffineTransform(translationX: 0, y: offsetY)
            UIView.animate(withDuration: 0.3, animations: {
                self.addIngredients.alpha = 0
            })
            
        }

        
    }
}

extension RecipeDetailViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        guard tags.count < 3 else { return 3}
         return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionCell", for: indexPath) as! TagCollectionViewCell
        
        cell.tagLabel.text = tags[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tagTextCount = tags[indexPath.row].count
        
        let width = (tagTextCount * 5) + 14
        
        let size = CGSize(width: width, height: 18)
        return size
    }

    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        
        UIView.animate(withDuration: 0.3){
            self.segmentedControl.buttonBar.frame.origin.x = (self.segmentedControl.frame.width / CGFloat(self.segmentedControl.numberOfSegments)) * CGFloat(self.segmentedControl.selectedSegmentIndex)

        }
    }

    

    
    

}

//
//  tabview1ViewController.swift
//  NewsApplication
//
//  Created by R92 on 08/04/24.
//

import UIKit

class tabview1ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var tableviewoutlet: UITableView!
    @IBOutlet weak var collectionviewoutlet: UICollectionView!
    
    
    @IBOutlet weak var activityoutlet: UIActivityIndicatorView!
    
    
    var allNews: News?
    var viewModel: NewsApi = NewsApi()
    var modelapi2 : Newsmodel?
    var country = "in"
    var category = "business"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityoutlet.startAnimating()
        viewModel.getNewmodel(topic: "tesla") {
            DispatchQueue.main.async { [self] in
                modelapi2 = viewModel.model2
                collectionviewoutlet.reloadData()
            }
        }
        
        
        
        viewModel.getNewsapi(country: "in", category: "business") {
            DispatchQueue.main.async { [self] in
                allNews = viewModel.newsapicaling!
                tableviewoutlet.reloadData()
                activityoutlet.stopAnimating()
                activityoutlet.hidesWhenStopped = true
            }
        }
    }
    func modelnewsapi(country : String,category : String)
    {
        viewModel.getNewsapi(country: country, category: category) {
            DispatchQueue.main.async {
                self.allNews = self.viewModel.newsapicaling!
                self.tableviewoutlet.reloadData()
            }
        }
    }
    
    
    
    @IBAction func indiabuttonaction(_ sender: Any) {
        country = "in"
        
        modelnewsapi(country: country, category: category)
    }
    
    
    @IBAction func ausbutttonaction(_ sender: Any) {
        country = "au"
        
        modelnewsapi(country: country, category: category)
    }
    
    
    @IBAction func chinabuttonaction(_ sender: Any) {
        country = "ch"
        
        modelnewsapi(country: country, category: category)
    }
    
    
    @IBAction func rassiabuttonaction(_ sender: Any) {
        country = "rs"
        modelnewsapi(country: country, category: category)
    }
    
    
    @IBAction func businessbuttonaction(_ sender: Any) {
        category = "business"
        modelnewsapi(country: country, category: category)
    }
    
    
    @IBAction func sportsbuttonaction(_ sender: Any) {
        category = "sports"
        modelnewsapi(country: country, category: category)
    }
    
    @IBAction func politicsbuttonaction(_ sender: Any) {
        category = "politics"
        modelnewsapi(country: country, category: category)
    }
    
    
    @IBAction func healthbuttonaction(_ sender: Any) {
        category = "health"
        modelnewsapi(country: country, category: category)
    }
    
    func urlToImage(url: String) -> UIImage? {
        guard let data = try? Data(contentsOf: URL(string: url)! as URL) else {return nil}
        return UIImage(data: data, scale: -1)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNews?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! newsmodelTableViewCell
        cell.lb1.text = allNews?.articles![indexPath.row].author
        cell.titlelable.text = allNews?.articles?[indexPath.row].title
        cell.image1.image = urlToImage(url: allNews?.articles![indexPath.row].urlToImage ?? "nil")
        
        cell.image1.layer.cornerRadius = 10
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelapi2?.articles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewsmodelCollectionViewCell
        cell.titleoutlet.text = modelapi2?.articles![indexPath.row].title
        cell.imageoutlet.image = urlToImage(url: (modelapi2?.articles?[indexPath.row].urlToImage ?? "nil"))
        
        cell.imageoutlet.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 361, height: 189)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let naviget = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        naviget.namee = allNews?.articles?[indexPath.row].author ?? ""
        naviget.tit = allNews?.articles?[indexPath.row].title ?? ""
        naviget.dis = (allNews?.articles![indexPath.row].description) ?? ""
        naviget.img = urlToImage(url: (allNews?.articles?[indexPath.row].urlToImage)!)
        navigationController?.pushViewController(naviget, animated: true)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let list = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        list.tit = (modelapi2?.articles?[indexPath.row].title)!
        list.img = urlToImage(url: (modelapi2?.articles![indexPath.row].urlToImage)!)
        
        navigationController?.pushViewController(list, animated: true)
        
    }
    
}

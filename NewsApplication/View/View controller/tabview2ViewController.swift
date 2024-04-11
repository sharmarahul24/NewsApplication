//
//  tabview2ViewController.swift
//  NewsApplication
//
//  Created by R92 on 08/04/24.
//

import UIKit

class tabview2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var allNews: News?
    var viewModel: NewsApi = NewsApi()
    var modelapi2 : Newsmodel?
    var apple = ""
    
    
    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    
    
    
    @IBOutlet weak var Searchbaroutlet: UISearchBar!
    
    
    @IBOutlet weak var tableviewoutlet: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        activityindicator.startAnimating()
        viewModel.getNewmodel(topic: "tesla") {
            DispatchQueue.main.async { [self] in
                modelapi2 = viewModel.model2
                tableviewoutlet.reloadData()
                activityindicator.stopAnimating()
                activityindicator.hidesWhenStopped = true
            }
        }
    }
    
    @IBAction func searchbuttonaction(_ sender: Any) {
        
        apple = Searchbaroutlet.text ?? ""
        
        viewModel.getNewmodel(topic: apple) {
            DispatchQueue.main.async { [self] in
                modelapi2 = viewModel.model2
                tableviewoutlet.reloadData()
            }
        }
    }
    
    func urlToImage(url: String) -> UIImage? {
        guard let data = try? Data(contentsOf: URL(string: url)! as URL) else {return nil}
        return UIImage(data: data, scale: -1)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelapi2?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewTableViewCell
        cell.lb1.text = modelapi2?.articles?[indexPath.row].author
        cell.imageoutlet.image = urlToImage(url: (modelapi2?.articles?[indexPath.row].urlToImage ?? "nil"))
        cell.lb2.text = modelapi2?.articles?[indexPath.row].description
        cell.imageoutlet.layer.cornerRadius = 10
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list1  = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        
        list1.namee = modelapi2?.articles?[indexPath.row].author ?? ""
        list1.tit = modelapi2?.articles?[indexPath.row].title ?? ""
        list1.dis = (modelapi2?.articles![indexPath.row].description) ?? ""
        list1.img = urlToImage(url: (modelapi2?.articles?[indexPath.row].urlToImage) ?? "nil")
        
        navigationController?.pushViewController(list1, animated: true)
        
    }
    

   

}

//
//  ViewController.swift
//  SevenWonders
//
//  Created by 王文琪 on 3/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {


    let wonders = ["the Taj Mahal", "the Colosseum", "the Chichen Itza", "Machu Picchu", "Christ the Redeemer", "Petra", "the Great Wall of China"]
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        cell.imgContainer.image = UIImage(named: wonders[indexPath.row])
        cell.lblImage.text = wonders[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.loadView()
        detailViewController.textView.text = getDescription(for: indexPath.row)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }

    func getDescription(for row: Int) -> String {
        switch row {
        case 0:
            return "The Taj Mahal is a white marble mausoleum located in Agra, India. It was built by Mughal emperor Shah Jahan in memory of his wife Mumtaz Mahal."
        case 1:
            return "The Colosseum, also known as the Flavian Amphitheatre, is an oval amphitheatre in the centre of Rome, Italy. It is considered one of the greatest works of Roman architecture and engineering."
        case 2:
            return "Chichen Itza is a large pre-Columbian city built by the Maya civilization. It is located in the Yucatan Peninsula of Mexico and is famous for its well-preserved stepped pyramids."
        case 3:
            return "Machu Picchu is an Incan citadel set high in the Andes Mountains of Peru. It is believed to have been built in the 15th century and abandoned after the Spanish conquest."
        case 4:
            return "Christ the Redeemer is a statue of Jesus Christ located in Rio de Janeiro, Brazil. It was completed in 1931 and stands 98 feet tall on top of the Corcovado Mountain."
        case 5:
            return "Petra is an ancient city located in Jordan. It is famous for its rock-cut architecture and water conduit system. It was named one of the New Seven Wonders of the World in 2007."
        case 6:
            return "The Great Wall of China is a series of fortifications made of brick, tamped earth, wood, and other materials, generally built along an east-to-west line across the historical northern borders of China to protect the Chinese states and empires against the raids and invasions of the various nomadic groups of the Eurasian Steppe."
        default:
            return ""
        }
    }

    


}


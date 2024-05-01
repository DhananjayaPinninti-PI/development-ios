//
//  ViewController.swift
//  CustomSideMenuiOSExample
//
//  Created by John Codeos on 2/§/21.
//

import UIKit

class HomeViewController: UIViewController {
    var categoryes: Array<Any> = []
    @IBOutlet var sideMenuBtn: UIBarButtonItem!
    @IBOutlet weak var gridCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        setUpCollectionView()
        categoryes = ["Scan & Pay","Add Billers", "Quick pay - electricity", "Quick pay - Water"]
        // Menu Button Tint Color
        navigationController?.navigationBar.tintColor = .white
        sideMenuBtn.target = revealViewController()
        sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)
    }
    
    private func setUpCollectionView() {
         gridCollectionView
                .register(UICollectionViewCell.self,
                 forCellWithReuseIdentifier: "cell")
         gridCollectionView.delegate = self
         gridCollectionView.dataSource = self
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         layout.minimumLineSpacing = 10
         layout.minimumInteritemSpacing = 10
         gridCollectionView.setCollectionViewLayout(layout, animated: true)
       }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if indexPath.row == 0 {
            let imageview:UIImageView=UIImageView(frame: CGRect(x: 0, y: 50, width: 200, height: 200));
            let img : UIImage = UIImage(named:"AppIcon")!
            imageview.image = img
            cell.contentView.addSubview(imageview)
            let title = UILabel(frame: CGRect(x: 10, y: 200, width: cell.bounds.size.width + 20, height: 50))
            title.text = categoryes[indexPath.row] as? String
            title.font = UIFont(name: "AvenirNext-Bold", size: 15)
            title.textAlignment = .center
            cell.contentView.addSubview(title)
        } else if indexPath.row == 1 {
            
            let imageview:UIImageView=UIImageView(frame: CGRect(x: 0, y: 50, width: 200, height: 200));
            let img : UIImage = UIImage(named:"AppIcon")!
            imageview.image = img
            cell.contentView.addSubview(imageview)
            let title = UILabel(frame: CGRect(x: 10, y: 200, width: cell.bounds.size.width + 20, height: 50))
            title.text = categoryes[indexPath.row] as? String
            title.font = UIFont(name: "AvenirNext-Bold", size: 15)
            title.textAlignment = .center
            cell.contentView.addSubview(title)
        } else if indexPath.row == 2 {
            
            let imageview:UIImageView=UIImageView(frame: CGRect(x: 0, y: 50, width: 200, height: 200));
            let img : UIImage = UIImage(named:"AppIcon")!
            imageview.image = img
            cell.contentView.addSubview(imageview)
            let title = UILabel(frame: CGRect(x: 10, y: 200, width: cell.bounds.size.width + 20, height: 50))
            title.text = categoryes[indexPath.row] as? String
            title.font = UIFont(name: "AvenirNext-Bold", size: 15)
            title.textAlignment = .center
            cell.contentView.addSubview(title)
        } else if indexPath.row == 3 {
            
            let imageview:UIImageView=UIImageView(frame: CGRect(x: 0, y: 50, width: 200, height: 200));
            let img : UIImage = UIImage(named:"AppIcon")!
            imageview.image = img
            cell.contentView.addSubview(imageview)
            let title = UILabel(frame: CGRect(x: 10, y: 200, width: cell.bounds.size.width + 20, height: 50))
            title.text = categoryes[indexPath.row] as? String
            title.font = UIFont(name: "AvenirNext-Bold", size: 15)
            title.textAlignment = .center
            cell.contentView.addSubview(title)
        }
        return cell
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                  layout collectionViewLayout: UICollectionViewLayout,
                  insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }

    func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
    
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
    
        return CGSize(width: widthPerItem - 8, height: 200)
    }
    // Distance Between Item Cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
}
/// Extension for random value get.
extension CGFloat {
    static func randomValue() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
/// Extension for random color using random value.
extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(
           red:   .randomValue(),
           green: .randomValue(),
           blue:  .randomValue(),
           alpha: 1.0
        )
    }
}
// Conform to UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      // Access data for the selected cell (optional)
  // let selectedItem = categoryes[indexPath.row] // Access data if needed

      if indexPath.row == 0 {
          let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
          let vc = storyBoard.instantiateViewController(withIdentifier: "AddbillerViewController") as! AddbillerViewController
          self.navigationController?.pushViewController(vc, animated: true)
          
      } else if indexPath.row == 1 {
          let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
          let vc = storyBoard.instantiateViewController(withIdentifier: "AddbillerViewController") as! AddbillerViewController
          self.navigationController?.pushViewController(vc, animated: true)
      } else if indexPath.row == 2 {
          
          let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
          let vc = storyBoard.instantiateViewController(withIdentifier: "AddbillerViewController") as! AddbillerViewController
          self.navigationController?.pushViewController(vc, animated: true)
      }else if indexPath.row == 3 {
          
          let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
          let vc = storyBoard.instantiateViewController(withIdentifier: "AddbillerViewController") as! AddbillerViewController
          self.navigationController?.pushViewController(vc, animated: true)
      }
  }
}

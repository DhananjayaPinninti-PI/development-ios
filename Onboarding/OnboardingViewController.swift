//
//  OnboardingViewController.swift
//  Onboarding
//   Created by Param on 29/04/24.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    var skipButton: UIButton! = nil
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
                skipButton.isHidden = true
                
            } else {
                skipButton.isHidden = false
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(nextBtn)
        slides = [
            OnboardingSlide(title: "Unlocking a World of Possibilities", description: "Reading can help you gain knowledge, better understand the world around you, and even help you relax.", image: #imageLiteral(resourceName: "logo")),
            OnboardingSlide(title: "Discover the Joys of a Good Story", description: "Books are more than just entertainment - they can also teach valuable lessons, help you explore new worlds, and provide comfort in difficult times", image: #imageLiteral(resourceName: "logo")),
            OnboardingSlide(title: "Helping Young Minds Grow", description: "Reading helps children develop their creativity and understanding of the world around them.", image: #imageLiteral(resourceName: "logo"))
        ]
        pageControl.numberOfPages = slides.count

        // Create a button
        skipButton = UIButton(type: .system)
        skipButton.setTitle("Skip", for: .normal)

          // Add target-action for the button
          skipButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

          // Create a bar button item from the button
          let barButtonItem = UIBarButtonItem(customView: skipButton)

          // Add the bar button item to the navigation bar
          self.navigationItem.rightBarButtonItem = barButtonItem
    }

    @objc func buttonTapped(_ sender: UIButton) {
      // Handle button tap here
        let controller = storyboard?.instantiateViewController(identifier: "LoginVC") as!
        UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "LoginVC") as!
            UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}


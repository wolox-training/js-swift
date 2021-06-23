//
//  NewBookController.swift
//  WBooks
//
//  Created by Juan Silva on 18/06/2021.
//

import Foundation
import UIKit

final class NewBookController: UIViewController {
    private lazy var newBookView = NewBookView()
    let newBookViewModel: NewBookViewModel
    
    
    init(newBookViewModel: NewBookViewModel) {
        self.newBookViewModel = newBookViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = newBookView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationNavigationBar()
        newBookView.imageBookButton.addTarget(self, action: #selector(imageBookButtonPressed), for: .touchUpInside)
        newBookView.submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        newBookView.submitButton.setTitle(NSLocalizedString("SUBMIT_BUTTON", comment: "Submit text button"), for: .normal)
        
        newBookViewModel.setValidate(inputField: newBookView.bookNameInput)
        newBookViewModel.setValidate(inputField: newBookView.bookAuthorInput)
        newBookViewModel.setValidate(inputField: newBookView.bookYearInput)
        newBookViewModel.setValidate(inputField: newBookView.bookTopicInput)
    }
    
    func configurationNavigationBar() {
        // Set Title
        navigationItem.title = NSLocalizedString("ADD_NEW_TITLE", comment: "Title for the navigation bar")
    }
    
    private func createBook() -> UnidentifiedBook {
        return UnidentifiedBook (
            title: newBookView.bookNameInput.text ?? "",
            author: newBookView.bookAuthorInput.text ?? "",
            genre: newBookView.bookTopicInput.text ?? "",
            year: newBookView.bookYearInput.text ?? "",
            image: "ImageURL",
            status: Status.available)
    }
    
    private func cleanInputs() {
        newBookView.bookNameInput.text = ""
        newBookView.bookAuthorInput.text = ""
        newBookView.bookYearInput.text = ""
        newBookView.bookTopicInput.text = ""
        newBookView.bookDescriptionInput.text = ""
    }
    
    @objc private func imageBookButtonPressed() {
        let alertController = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
        
        // Gallery option
        let chooseAction = UIAlertAction(title: "Gallery", style: .default) { _ in
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: .none)
        }
        alertController.addAction(chooseAction)
        
        // Camera option
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let takeAction = UIAlertAction(title: "Camera", style: .default) { _ in
                let imagePickerController = UIImagePickerController()
                imagePickerController.delegate = self
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: .none)
            }
            alertController.addAction(takeAction)
        }

        // Cancel option
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: .none)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc private func submitButtonPressed() {
        newBookViewModel.addBook(book: createBook(),
                                 onSuccess: { [weak self] in self?.onSubmitSuccess() },
                                 onError: { [weak self] error in self?.onSubmitError(error: error) }
        )
    }
    
    private func onSubmitError(error: Error) {
        let alert = UIAlertController(title: NSLocalizedString("ALERT_ERROR_TITLE", comment: "Title error"),
                                      message: NSLocalizedString("ALERT_SUBMIT_ERROR_MESSAGE", comment: "Message error"),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ALERT_ERROR_CLOSE", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func onSubmitSuccess() {
        let alert = UIAlertController(title: NSLocalizedString("ALERT_SUBMIT_SUCCESS_TITLE", comment: "Title error"),
                                      message: NSLocalizedString("ALERT_SUBMIT_SUCCESS_MESSAGE", comment: "Message error"),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ALERT_ERROR_CLOSE", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        cleanInputs()
    }

}

extension NewBookController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        newBookView.imageBookButton.setBackgroundImage(image, for: .normal)
        picker.dismiss(animated: true, completion: nil)
    }
}

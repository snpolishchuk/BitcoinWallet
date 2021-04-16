//
//  MainView.swift
//  BitcoinWallet
//
//  Created by Oleksandr Polishchuk on 16.04.2021.
//

import UIKit

fileprivate typealias K = Constants.MainView

protocol MainViewDelegate {
    func addTransactionButtonPressed()
}

class MainView: UIView {
    private weak var descriptionLabel: UILabel!
    private weak var countLabel: UILabel!
    private weak var balanceStackView: UIStackView!
    private weak var addTransactionButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
    }
}

// MARK: - Private UI Setup
private extension MainView {
    func createSubviews() {
        createBalanceDescriptionLabel()
        createBalanceStackView()
        createAddTransactionButton()
        createTransactionHistoryView()
    }
    
    // MARK: - "Current balance" part
    
    // "Balance" label
    func createBalanceDescriptionLabel() {
        let label = UILabel()
        label.text = K.balanceTitle + "\n"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        descriptionLabel = label
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: K.balanceTitleVertSpacing).isActive = true
    }
    
    // Stack view holding balance count and fulfill button
    func createBalanceStackView() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = K.balanceStackViewSpacing
        balanceStackView = stackView
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: K.balanceStackViewVertSpacing).isActive = true
        
        createBalanceCountLabel()
        createAddFundsButton()
    }
    
    // Balance count
    func createBalanceCountLabel() {
        let label = UILabel()
        label.text = "10" + K.bitcoinLogo
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        countLabel = label
        balanceStackView.addArrangedSubview(label)
    }
    
    // Fulfill button
    func createAddFundsButton() {
        let button = UIButton(type: .contactAdd)
        button.tintColor = .black
        balanceStackView.addArrangedSubview(button)
    }
    
    // MARK: - "Add transaction" part
    func createAddTransactionButton() {
        let button = UIButton()
        button.setTitle("Add transaction", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.titleLabel?.textAlignment = .center
        addTransactionButton = button
        addSubview(button)
        
        addTransactionButton.translatesAutoresizingMaskIntoConstraints = false
        addTransactionButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addTransactionButton.topAnchor.constraint(equalTo: balanceStackView.bottomAnchor, constant: K.addTransactionButtonVertSpacing).isActive = true
    }
    
    
    // MARK: - "Transaction history" part
    func createTransactionHistoryView() {
        let transactionHistoryView = TransactionHistoryView()
        addSubview(transactionHistoryView)
        
        transactionHistoryView.translatesAutoresizingMaskIntoConstraints = false
        transactionHistoryView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        transactionHistoryView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        transactionHistoryView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        transactionHistoryView.topAnchor.constraint(equalTo: addTransactionButton.bottomAnchor, constant: K.transactionHistoryViewVertSpacing).isActive = true
    }
}

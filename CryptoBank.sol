//Licencia
//SPDX-License-Identifier: LGPL-3.0-only
//Version
pragma solidity 0.8.24;

//Functions
    //1.Deposit ether
    //2.Withdraw ether
    //3.Set fees
//Rules
    //1.Multiuser
    //2.Only can deposit ether
    //3.Can set fees
    //4.User con only withdraw previusly deposited ether
    //5.Max balance  = 5 ether
    //6.Max balance modifiable by owner
    //User A deposit 5 ether
    //User B deposit 2 ether 
    //Bank balance = 7 ether 
    

//Contract
contract CryptoBank{
    uint256 public fee ;
    uint256 public maxBalance = 1*1 ether;
    address public admin;
    mapping (address=>uint256) public userBalance;
//Events
    event etherDeposit (address user_, uint256 etherAmount_);
    event etherWithdraw (address user_, uint256 etherAmount_);
    event SetFees(uint256 _fee);
    event BalanceModify(uint256 newMaxBalance);
//Modidiers
    modifier onlyAdmin() {
        require (msg.sender == admin,"Only admin");
    _;}
//Constructor
    constructor (uint256 maxBalance_, address admin_, uint256 _fee){
        require (_fee < 100);
    maxBalance = maxBalance_;
    admin = admin_;
    fee = _fee;
    }
//Functions
//1.Deposit
function depositEther() external payable{
    require (userBalance[msg.sender] + msg.value <= maxBalance,"Exeeds max");
    userBalance[msg.sender] += msg.value; //userBalance[msg.sender] = userBalance[msg.sender] + msg.value

emit etherDeposit(msg.sender,msg.value);
}
//2.Withdraw
function withdrawEther(uint256 amount_) external {
    uint256 feeAmount = (amount_*fee)/100;
    require (amount_ + feeAmount <= userBalance[msg.sender],"Insufficient ether");
    uint256 totalAmount = amount_ + feeAmount;
    require (userBalance[msg.sender] <= totalAmount, "Exceeds amount");
    //Update state
    userBalance[msg.sender] -= totalAmount;
    //Transfer ether
    (bool success,) = msg.sender.call{value: amount_}("");
    require(success,"Transfer failed");
    // Transfer fee to the owner
    (bool sentFee, ) = admin.call{value: feeAmount}("");
    require(sentFee, "Fee transfer failed");

    emit etherWithdraw(msg.sender,amount_);
}
//3.Set fees
function setFees (uint256 newFee) external onlyAdmin {
    require (newFee < 100,"Out of range");
    fee = newFee;

    emit SetFees(newFee);
}

//4.Modify max balance
function modifyMaxBalance (uint256 newMaxBalance) external onlyAdmin{
   require (newMaxBalance > 0,"Invalid");
    maxBalance = newMaxBalance;

    emit BalanceModify(newMaxBalance);
}

}

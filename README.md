## 🏦 CryptoBank – Decentralized Banking on Ethereum ##
[![License: LGPL-3.0](https://img.shields.io/badge/License-LGPL--3.0-blue.svg)](https://www.gnu.org/licenses/lgpl-3.0)

**Secure Ether Deposits • Transparent Withdrawals • Configurable Fees**  
Ethereum smart contracts for decentralized fund management and basic banking operations.

---

## 📝 Overview
CryptoBank is a blockchain-based solution designed for decentralized financial management. It allows multiple users to deposit Ether (up to a configurable maximum balance) and withdraw funds, while applying a configurable fee (expressed as a percentage on withdrawals) that is transferred directly to the admin. 

It is ideal for:
- **Decentralized Savings Platforms**
- **Community Fund Management**
- **Basic DeFi Banking Services**

Key guarantees include:
- User funds are securely stored on-chain with strict withdrawal rules.
- Withdrawals charge a fee percentage, ensuring automatic revenue splitting.
- All operations are transparently recorded via events.

---

## ✨ Key Features

### 📥 Deposit Functionality
- **Ether Deposits:** Users can deposit Ether into their account up to a maximum balance (default: 5 ETH, modifiable by admin).
- **Input Validation:** Ensures that deposits do not exceed the maximum balance.

### 💸 Withdrawal Functionality
- **Percentage Fee Withdrawal:** When a user withdraws Ether, a configurable percentage fee is deducted and transferred to the admin.
- **User-Only Withdrawals:** Users can only withdraw previously deposited funds.
  
### ⚙️ Administrative Controls
- **Set Fees:** The admin can update the fee percentage (ranging from 0 to 100%).
- **Modify Max Balance:** The admin can update the maximum allowed balance per user.
- **Event Logging:** Critical operations like deposits, withdrawals, fee updates, and max balance modifications emit events for traceability.

---

## 📜 Contract Architecture

### Core Contracts

| Contract          | Key Functions                                   | Description                                          |
|-------------------|-------------------------------------------------|------------------------------------------------------|
| **`CryptoBank.sol`** | `depositEther()`<br>`withdrawEther(uint256 amount_)`<br>`setFees(uint256 newFee)`<br>`modifyMaxBalance(uint256 newMaxBalance)` | Manages user deposits and withdrawals with fee application. |

### Function Overview

- **`depositEther()`**:  
  Users deposit Ether, as long as their total balance does not exceed `maxBalance`.

- **`withdrawEther(uint256 amount_)`**:  
  Users withdraw a specified amount (entered in Ether units, converted to wei internally). A fee is calculated as a percentage of the withdrawal amount and transferred to the admin. The user's balance is updated accordingly.

- **`setFees(uint256 newFee)`**:  
  Allows the admin to set a new fee percentage (0–100).

- **`modifyMaxBalance(uint256 newMaxBalance)`**:  
  Enables the admin to update the maximum balance allowed per user.

---

## ⚙️ Prerequisites

- **Node.js & npm:** Ensure Node.js is installed ([Download Node.js](https://nodejs.org/)).
- **Ethereum Development Environment:** Hardhat, Foundry, or Remix IDE.
- **MetaMask:** For interacting with the contracts on testnets (e.g., Sepolia, Goerli).

---

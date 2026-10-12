class BankAccount {
  // TODO
  final int accountId;
  final String accountOwner;
  double _balance;

  BankAccount({
    required this.accountId,
    required this.accountOwner,
    double checkBalance = 0,
  }) : _balance = checkBalance;

  double get balance => this._balance;

  double withdraw(double amount) {
    if (amount > _balance) {
      throw Exception('Insufficient balance for withdraw!');
    }
    return _balance -= amount;
  }

  double credit(double amount) {
    return _balance += amount;
  }
}

class Bank {
  // TODO
  final String name;
  Bank({required this.name});

  List<BankAccount> account = [];

  BankAccount createAccount(int accountId, String accountOwner) {
    for (var accounts in account) {
      if (accounts.accountId == accountId) {
        throw Exception("This user's ID: $accountId is already existed");
      }
    }

    var newAccount = BankAccount(
      accountId: accountId,
      accountOwner: accountOwner,
    );
    account.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}

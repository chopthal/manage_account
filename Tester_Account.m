id = 'admin';
password = '>dVTN;o8ooD7[pdC';
tier = 'Admin';
[isGenerated, stateMsg] = GenerateAccount(id, password, tier);

disp(stateMsg);

[isLoggedIn, tier, stateMsg] = LoginAccount(id, password);
disp(isLoggedIn);
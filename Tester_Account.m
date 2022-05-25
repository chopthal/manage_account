id = 'user8';
password = 'asdi          ojf asΔiodj＆';
tier = 'Admin';
[isGenerated, stateMsg] = GenerateAccount(id, password, tier);

disp(stateMsg);

[isLoggedIn, tier, stateMsg] = LoginAccount(id, password);
disp(isLoggedIn);
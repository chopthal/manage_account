function password = ResetAccounts(accountFileName, accountVariableName, accountFormFileName, accountFormVariableName)

    if isempty(accountFileName)
    
        accountFileName = 'accounts.mat';
    
    end
    
    if isempty(accountVariableName)
    
        accountVariableName = 'Accounts';
    
    end
    
    if isempty(accountFormFileName)
    
        accountFormFileName = 'account_forms.mat';
    
    end
    
    if isempty(accountFormVariableName)
    
        accountFormVariableName = 'AccountForms';
    
    end
    
    PASSWORD_LENGTH = 8;
    
    id = 'admin';
    password = GenerateRandomPassword(PASSWORD_LENGTH);
    name = '관리자';
    tier = 'Admin';
    emailName = 'admin';
    phoneNumber = '01012345678';
    prevAccountStruct = [];
    
    % Get data from account_forms.mat
    ManageAccountFormAction('Check', '', '', accountFormFileName, accountFormVariableName);
    tmp = load(accountFormFileName, accountFormVariableName);
    affiliationIndex = 1;
    emailDomainIndex = 1;
    
    [~, ~, newAccountStruct] =...
        GenerateAccount(id, password, name, tier, affiliationIndex, emailName, emailDomainIndex, phoneNumber, prevAccountStruct);
    
    % Add All authorities
    newAccountStruct.(id).Authority.Auth1.Accessible = true;
    newAccountStruct.(id).Authority.Auth1.Option1 = 4;
    newAccountStruct.(id).Authority.Auth1.Option2 = 4;
    
    newAccountStruct.(id).Authority.Auth2.Accessible = true;
    newAccountStruct.(id).Authority.Auth3.Accessible = true;
    newAccountStruct.(id).Authority.Auth4.Accessible = true;
    
    % Add Manage Account authority
    newAccountStruct.(id).Authority.Auth5.Accessible = true;
    newAccountStruct.(id).Authority.Auth5.Option1 = 3;
    newAccountStruct.(id).Authority.Auth5.Option2 = 3;
    newAccountStruct.(id).Authority.Auth5.Option3 = 2;
    newAccountStruct.(id).Authority.Auth5.Option4 = 2;
    newAccountStruct.(id).Authority.Auth5.Option5 = 3;
    
    tmp.(accountVariableName) = newAccountStruct;
    save(accountFileName, '-struct', 'tmp', accountVariableName);

end
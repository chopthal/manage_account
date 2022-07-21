function password = ResetAccounts(ACCOUNTS_FILENAME, ACCOUNTS_VARIABLENAME, ACCOUNT_FORMS_FILENAME, ACCOUNT_FORMS_VARIABLENAME)

if isempty(ACCOUNTS_FILENAME)

    ACCOUNTS_FILENAME = 'accounts.mat';

end

if isempty(ACCOUNTS_VARIABLENAME)

    ACCOUNTS_VARIABLENAME = 'Accounts';

end

if isempty(ACCOUNT_FORMS_FILENAME)

    ACCOUNT_FORMS_FILENAME = 'account_forms.mat';

end

if isempty(ACCOUNT_FORMS_VARIABLENAME)

    ACCOUNT_FORMS_VARIABLENAME = 'AccountForms';

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
ManageAccountFormAction('Check', '', '', ACCOUNT_FORMS_FILENAME, ACCOUNT_FORMS_VARIABLENAME);
tmp = load(ACCOUNT_FORMS_FILENAME, ACCOUNT_FORMS_VARIABLENAME);
affiliation = tmp.(ACCOUNT_FORMS_VARIABLENAME).Affiliation{1};
emailDomain = tmp.(ACCOUNT_FORMS_VARIABLENAME).EmailDomain{1};

[~, ~, newAccountStruct] =...
    GenerateAccount(id, password, name, tier, affiliation, emailName, emailDomain, phoneNumber, prevAccountStruct);

% Add Manage Account authority
newAccountStruct.(id).Authority.Auth5.Accessible = true;
newAccountStruct.(id).Authority.Auth5.Option1 = 3;
newAccountStruct.(id).Authority.Auth5.Option2 = 3;
newAccountStruct.(id).Authority.Auth5.Option3 = 2;
newAccountStruct.(id).Authority.Auth5.Option4 = 2;
newAccountStruct.(id).Authority.Auth5.Option5 = 3;

tmp.(ACCOUNTS_VARIABLENAME) = newAccountStruct;
save(ACCOUNTS_FILENAME, '-struct', 'tmp', ACCOUNTS_VARIABLENAME);

end
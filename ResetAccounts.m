function password = ResetAccounts

ACCOUNTS_FILENAME = 'accounts.mat';
ACCOUNTS_VARIABLENAME = 'Accounts';
PASSWORD_LENGTH = 8;

id = 'admin';
password = GenerateRandomPassword(PASSWORD_LENGTH);
name = '관리자';
tier = 'admin';
affiliation = 'admin';
emailName = 'admin';
emailDomain = '@gmail.com';
phoneNumber = '01012345678';
prevAccountStruct = [];

[isGenerated, stateMsg, newAccountStruct] =...
    GenerateAccount(id, password, name, tier, affiliation, emailName, emailDomain, phoneNumber, prevAccountStruct);

tmp.(ACCOUNTS_VARIABLENAME) = newAccountStruct;
save(ACCOUNTS_FILENAME, '-struct', 'tmp', ACCOUNTS_VARIABLENAME);

end
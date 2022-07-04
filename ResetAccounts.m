function ResetAccounts

ACCOUNTS_FILENAME = 'accounts.mat';
ACCOUNTS_VARIABLENAME = 'Accounts';

id = 'admin';
password = 'rhksflwk10#';
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

% disp(isGenerated);
% disp(stateMsg);
% disp(newAccountStruct);

end
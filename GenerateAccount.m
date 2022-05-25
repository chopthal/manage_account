function [isGenerated, stateMsg] = GenerateAccount(id, password, tier)

% isGenerated = GenerateAccount(id, password, tier)
% id : string
% password : string
% tier : string

isGenerated = false;

if isempty(id); stateMsg = 'Please enter your ID'; return; end
if isempty(password); stateMsg = 'Please enter your Password'; return; end

[isValid, stateMsg] = ValidatePassword(id, password);
if ~isValid; return; end

Accounts = struct;
hashedPassword = StringToHashedHex(password);

if isfile('accounts.mat')
    loadedVariable = load('accounts.mat');
    Accounts = loadedVariable.Accounts;
end

if isempty(fieldnames(Accounts))    
end

if isfield(Accounts, id)        
    stateMsg = 'Exist ID';
    return;
end

Accounts.(id).Password = hashedPassword;
Accounts.(id).Tier = tier;
save('accounts.mat', 'Accounts');
isGenerated = true;
stateMsg = 'Your account is generated successfully';

end
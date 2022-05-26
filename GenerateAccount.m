function [isGenerated, stateMsg, newAccountStruct] = GenerateAccount(id, password, tier, prevAccountStruct)
    % isGenerated = GenerateAccount(id, password, tier)
    % id : string
    % password : string
    % tier : string
    
    isGenerated = false;
    newAccountStruct = '';
    if isempty(id); stateMsg = 'Please enter your ID'; return; end

    if isempty(password); stateMsg = 'Please enter your Password'; return; end
    
    [isValid, stateMsg] = ValidateId(id);
    if ~isValid; return; end
    
    [isValid, stateMsg] = ValidatePassword(id, password);
    if ~isValid; return; end
    
    hashedPassword = StringToHashedHex(password);
    if isfield(prevAccountStruct, id); stateMsg = 'Exist ID'; return; end
    
    newAccountStruct = prevAccountStruct;
    newAccountStruct.(id).Password = hashedPassword;
    newAccountStruct.(id).Tier = tier;
    isGenerated = true;
    stateMsg = 'Your account is generated successfully';
end
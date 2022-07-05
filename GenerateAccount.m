function [isGenerated, stateMsg, newAccountStruct] =...
    GenerateAccount(id, password, name, tier,...
    affiliation, emailName, emailDomain, phoneNumber,...
    prevAccountStruct)
    % isGenerated = GenerateAccount(id, password, tier)
    % id : string
    % password : string
    % name : string
    % tier : string
    % affiliation : string
    % email : string
    % phone : string
    
    isGenerated = false;
    newAccountStruct = '';
    if isempty(id); stateMsg = 'Please enter your ID'; return; end
    if isempty(password); stateMsg = 'Please enter your Password'; return; end
    if isempty(name); stateMsg = 'Please enter your Name'; return; end
    if isempty(tier); stateMsg = 'Please enter your Tier'; return; end
    if isempty(affiliation); stateMsg = 'Please enter your Affiliation'; return; end
    if isempty(emailName); stateMsg = 'Please enter your E-mail name'; return; end
    if isempty(emailDomain); stateMsg = 'Please enter your E-mail domain'; return; end
    if isempty(phoneNumber); stateMsg = 'Please enter your Phone number'; return; end
    
    [isValid, stateMsg] = ValidateId(id);
    if ~isValid; return; end
    
    [isValid, stateMsg] = ValidatePassword(id, password);
    if ~isValid; return; end

    [isValid, stateMsg] = ValidateName(name);
    if ~isValid; return; end

    [isValid, stateMsg] = ValidateEmailName(emailName);
    if ~isValid; return; end
    
    phoneNumber(strfind(phoneNumber, '-')) = ''; % Delete all '-'s
    [isValid, stateMsg] = ValidatePhoneNumber(phoneNumber);
    if ~isValid; return; end
    
    hashedPassword = StringToHashedHex(password);
    if isfield(prevAccountStruct, id); stateMsg = 'Exist ID'; return; end
    
    newAccountStruct = prevAccountStruct;
    newAccountStruct.(id).Password = hashedPassword;
    newAccountStruct.(id).Name = name;
    newAccountStruct.(id).Tier = tier;
    newAccountStruct.(id).Affiliation = affiliation;
    newAccountStruct.(id).EmailName = emailName;
    newAccountStruct.(id).EmailDomain = emailDomain;
    newAccountStruct.(id).PhoneNumber = phoneNumber;
    isGenerated = true;
    stateMsg = 'Your account is generated successfully';
end

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
        
    [isValid, stateMsg] = ValidateInput('Id', id, '');
    if ~isValid; return; end
    
    [isValid, stateMsg] = ValidateInput('Password', password, id);    
    if ~isValid; return; end

    [isValid, stateMsg] = ValidateInput('Name', name, '');
    if ~isValid; return; end
    
    [isValid, stateMsg] = ValidateInput('EmailName', emailName, '');
    if ~isValid; return; end
        
    [isValid, stateMsg] = ValidateInput('PhoneNumber', phoneNumber, '');
    if ~isValid; return; end
    phoneNumber(strfind(phoneNumber, '-')) = ''; % Delete all '-'s
    
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

    NUM_AUTH_RESERVE = 200;
    NUM_OPTION_RESERVE = 200;
    authStruct = struct;
    authStruct.Accesible = false;
    for i = 1:NUM_AUTH_RESERVE
        optionName = sprintf('Option%d', i);
        authStruct.(optionName) = 1;
    end

    for i = 1:NUM_OPTION_RESERVE
        authName = sprintf('Auth%d', i);
        newAccountStruct.(id).Authority.(authName) = authStruct;
    end

    isGenerated = true;
    stateMsg = 'Your account is generated successfully';
end

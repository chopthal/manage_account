function [isValid, stateMsg] = ValidateInput(type, input, id)

% Type
% - Affiliation (input)
% - EmailDomain (input)
% - EmailName (input)
% - Id (input)
% - Name (input)
% - Password (input : password, id)
% - PhoneNumber (input)

isValid = false;
stateMsg = '';

if strcmpi(type, 'Affiliation')
elseif strcmpi(type, 'EmailDomain')
elseif strcmpi(type, 'EmailName')
elseif strcmpi(type, 'Id')
elseif strcmpi(type, 'Name')
elseif strcmpi(type, 'Password')
    % Including ID?
    if ~isempty(id)
        isContainId = contains(input, id);
        if isContainId
            isValid = false;
            stateMsg = 'Passwords cannot contain the user ID pattern.'; 
            return;
        end
    end

    % Black List
    tmpTable = readtable('blacklist_100000.txt');
    blackList = table2cell(tmpTable);
    isInclude = sum(strcmp(blackList, input));
    if isInclude
        isValid = false;
        stateMsg = 'Cannot use this password';
        return;
    end

    minLength = 8;    
    maxLength = 70;
    regExp    
elseif strcmpi(type, 'PhoneNumber')
end

if length(input) < minLength
    stateMsg = sprintf('%s should be longer than %d letters', type, minLength);
    return;
end

if length(input) > naxLength
    stateMsg = sprintf('%s should be shorther than %d letters', type, maxLength);
    return;
end

isValid = true;
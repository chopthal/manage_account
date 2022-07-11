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
minLength = 0;
maxLength = 100;
tmp = input;
tmp(strfind(tmp, ' ')) = '';

if isempty(tmp)

    stateMsg = 'Invalid Input (only spaces)';
    
    return;

end

if strcmpi(type, 'Affiliation')

    minLength = 1;
    maxLength = 30;
    regExp = '^[^\s]+[a-zA-Z가-힣0-9\s]+$';

elseif strcmpi(type, 'EmailDomain')

    minLength = 4;
    maxLength = 30;
    regExp = '^[a-zA-Z가-힣0-9.]+$';

elseif strcmpi(type, 'EmailName')
    
    minLength = 4;
    maxLength = 30;
    regExp = '^[a-zA-Z0-9가-힣\_\.\-]+$';

elseif strcmpi(type, 'Id')

    minLength = 4;
    maxLength = 30;
    regExp = '^[a-zA-Z0-9가-힣\_\.\-]+$';

elseif strcmpi(type, 'Name')

    minLength = 1;
    maxLength = 50;
    regExp = '^[^\s]+[a-zA-Z가-힣\,\.\-\`\''\s]+$';

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
    regExp = '[a-zA-Z0-9\:-\@\[-\`\{-\~\s]+$';

elseif strcmpi(type, 'PhoneNumber')

    minLength = 3;
    maxLength = 30;
    regExp = '^[\+]{0,1}[0-9\-]+$';

end

if length(input) < minLength

    stateMsg = sprintf('%s should be longer than %d letters', type, minLength);

    return;

end

if length(input) > maxLength

    stateMsg = sprintf('%s should be shorther than %d letters', type, maxLength);

    return;

end

out = regexp(input, regExp, 'match');

if isempty(out)
    
    stateMsg = 'Invalid input';

    return;
    
end
isValid = true;
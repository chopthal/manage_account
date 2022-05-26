function [isValid, stateMsg] = ValidatePassword(id, password)
    isValid = false;
    stateMsg = '';
    MIN_PASSWORD_LENGTH = 8;
    MAX_PASSWORD_LENGTH = 70;
    
    %% Length
    if length(password) < MIN_PASSWORD_LENGTH        
        stateMsg = sprintf('Password should be longer than %d words\n', MIN_PASSWORD_LENGTH);
        return;
    end
    
    if length(password) > MAX_PASSWORD_LENGTH    
        stateMsg = sprintf('Password should be shorter than %d words\n', MAX_PASSWORD_LENGTH);
        return;
    end
    
    %% UNICODE
    
    %% Black-list
    tmpTable = readtable('blacklist_100000.txt');
    blackList = table2cell(tmpTable);
    isInclude = sum(strcmp(blackList, password));    

    if isInclude
        isValid = false;
        stateMsg = 'Cannot use this password';
        return;
    end

    %% Including ID
    isContain = contains(password, id);
    if isContain
        isValid = false;
        stateMsg = 'Passwords cannot contain the user ID pattern.'; 
        return;
    end

    isValid = true;
end
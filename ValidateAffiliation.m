function [isValid, stateMsg] = ValidateAffiliation(affiliation)
    isValid = false;
    stateMsg = '';
    tmp = affiliation;
    tmp(strfind(tmp, ' ')) = '';
    if isempty(tmp)
        stateMsg = 'Invalid Input (only spaces)';
        return;
    end
    
    affiliationReg = '^[^\s]+[a-zA-Z가-힣0-9\s]+$'; % First space : X, Alpahbet, Korean, number, space
    out = regexp(affiliation, affiliationReg, 'match');
    if isempty(out)
        stateMsg = 'Invalid Name';
        return;
    end
    
    isValid = true;
end
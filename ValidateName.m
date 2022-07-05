function [isValid, stateMsg] = ValidateName(name)
    isValid = false;
    stateMsg = '';
    nameReg = '^[^\s]+[a-zA-Z가-힣\s]+$'; % English, Korean, Space    
    out = regexp(name, nameReg, 'match');    
    if isempty(out)
        stateMsg = 'Invalid Name';
        return;
    end

    isValid = true;
end
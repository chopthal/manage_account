function [isValid, stateMsg] = ValidateName(name)
    isValid = false;
    stateMsg = '';
    nameReg = '^[a-zA-Z\s가-힣]+$'; % English, Korean, Space    
    out = regexp(name, nameReg, 'match');    
    if isempty(out)
        stateMsg = 'Invalid Name';
        return;
    end

    isValid = true;
end
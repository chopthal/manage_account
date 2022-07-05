function [isValid, stateMsg] = ValidateEmailDomain(emailDomain)
    isValid = false;
    stateMsg = '';
    
    emailReg = '^[a-zA-Z가-힣0-9.]+$'; % Alpahbet, Korean, number
    out = regexp(emailDomain, emailReg, 'match');
    if isempty(out)
        stateMsg = 'Invalid Name';
        return;
    end
    
    isValid = true;
end
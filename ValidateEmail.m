function [isValid, stateMsg] = ValidateEmail(email)
    isValid = false;
    stateMsg = '';
    emailReg = '^[a-zA-Z0-9가-힣_\.\-]+$'; % English, Korean, Number, ., _, -

    MIN_EMAIL_LENGTH = 1;
    MAX_EMAIL_LENGTH = 64;
    
    %% Length
    if length(email) < MIN_EMAIL_LENGTH        
        stateMsg = sprintf('Email address should be longer than %d words\n', MIN_EMAIL_LENGTH);
        return;
    end
    
    if length(email) > MAX_EMAIL_LENGTH    
        stateMsg = sprintf('Email address should be shorter than %d words\n', MAX_EMAIL_LENGTH);
        return;
    end

    %% Expression
    out = regexp(name, emailReg, 'match');    
    if isempty(out)
        stateMsg = 'Invalid Email address';
        return;
    end
    
    isValid = true;
end
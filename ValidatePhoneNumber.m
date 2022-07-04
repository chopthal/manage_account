function [isValid, stateMsg] = ValidatePhoneNumber(phoneNumber)
    isValid = false;
    stateMsg = '';
    phoneNumberReg = '^[\+]{0,1}[0-9]+$'; % + (Country number init str), number    

    MIN_PHONENUMBER_LENGTH = 4;
    MAX_PHONENUMBER_LENGTH = 20;
    
    %% Length
    if length(phoneNumber) < MIN_PHONENUMBER_LENGTH        
        stateMsg = sprintf('Phone number should be longer than %d words\n', MIN_PHONENUMBER_LENGTH);
        return;
    end
    
    if length(phoneNumber) > MAX_PHONENUMBER_LENGTH    
        stateMsg = sprintf('Phone number should be shorter than %d words\n', MAX_PHONENUMBER_LENGTH);
        return;
    end

    %% Expression
    out = regexp(phoneNumber, phoneNumberReg, 'match');    
    if isempty(out)
        stateMsg = 'Invalid Phone number';
        return;
    end
    
    isValid = true;
end
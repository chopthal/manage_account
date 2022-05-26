function [isValid, stateMsg] = ValidateId(id)
    isValid = false;
    stateMsg = '';
    MIN_LENGTH_ID = 4;
    MAX_LENGTH_ID = 16;    
    if isempty(id); stateMsg = 'Please enter the ID'; return; end
    
    idNo = double(id);
    if any(idNo < double('0')) ||...
            any(idNo > double('9') & idNo < double('A')) ||...
            any(idNo > double('Z') & idNo < double('a')) ||...
            any(idNo > double('z'))
        stateMsg = 'ID could only consist of letters and numbers';
        return;
    end
    
    if length(id) < MIN_LENGTH_ID ||...
            length(id) > MAX_LENGTH_ID
        stateMsg = 'ID could be between 4 and 16 characters in length';
        return;
    end
    
    isValid = true;
end
function [isLoggedIn, stateMsg] = LoginAccount(id, password)

    isLoggedIn = false;
    stateMsg = '';
    
    if isempty(id); stateMsg = 'Please enter your ID'; 
    
        return;
    
    end
    
    if isempty(password)
        
        stateMsg = 'Please enter your Password'; 
        
        return; 
    
    end
    
    Accounts = struct;
    hashedPassword = StringToHashedHex(password);
    
    if isfile('accounts.mat')
    
        loadedVariable = load('accounts.mat');
        Accounts = loadedVariable.Accounts;
    
    end
    
    if ~isfield(Accounts, id)
    
        stateMsg = 'Invalid ID';
    
        return;
    
    end
    
    if ~isfield(Accounts.(id), 'Password')
    
        stateMsg = 'Invalid Account. Please contact the Administrator!';
    
        return;
    
    end
    
    if isequal(hashedPassword, Accounts.(id).Password)
    
        isLoggedIn = true;
        
    else
    
        stateMsg = 'Invalid Password!';

    end

end
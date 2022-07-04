function [result, msg] = ManageAccountFormAction(action, type, items, accountFormFileName, accountFormVariableName)
    %% Inputs
    % action
    %   - 'Update' : Update accounts_inform.mat with input items
    %   - 'Check' : Check accounts_inform.mat is valid (exist)
    % type : 'Affiliation' or 'MailDomain'
    % items : [N x 1] string cell
    
    %% Initilize outputs
    result = false;
    msg = '';

    %% Check action
    if ~isfile(accountFormFileName)
        % Default forms
        affiliation = {
            'Team1';
            'Team2';
            'Team3';
            'Team4'
            };
    
        emailDomain = {
            'gmail.com';
            'naver.com';
            'kakao.com'
            };
        
        try
            tmp.(accountFormVariableName).Affiliation = affiliation;
            tmp.(accountFormVariableName).EmailDomain = emailDomain;
        catch
            msg = 'Invalid account form variable name';
            return;
        end

        try
            save(accountFormFileName, '-struct', 'tmp', accountFormVariableName);
        catch
            msg = 'Invalid account form file name';
            return;
        end
    end
    
    %% Exceptions
    if strcmpi(action, 'Check')
        result = true;
        msg = 'accounts_inform.mat file is checked!';
        return;
    end
    
    if ~strcmpi(action, 'Update')
        msg = 'Invalid Action type';
        return;
    end
    
    if isempty(type)
        msg = 'Empty type';
        return;
    end
    
    if ~strcmpi(type, 'Affiliation') && ~strcmpi(type, 'MailDomain')
        msg = 'Invalid type input';
        return;
    end
    
    if isempty(items)
        msg = 'Empty items';
        return;
    end
    
    if size(items, 2) ~= 1
        msg = 'Invalid items size';
        return;
    end
    
    
    %% Business function
    loadedVar = load(accountFormFileName);
    loadedVar.(accountFormVariableName).(type) = items;

    try
        save(accountFormFileName, '-struct', 'loadedVar', accountFormVariableName);
    catch
        msg = 'Invalid account form file name';
        return;
    end
    result = true;
end
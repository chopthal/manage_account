% Analysis
% Save SPR Images
% Autosampler Setting
% Manage Audit-trail

id = 'admin';
% Generate time ~ 20 ms
NUM_AUTH_RESERVE = 200;
NUM_OPTION_RESERVE = 200;

authStruct = struct;
authStruct.Accesible = true;
for i = 1:NUM_AUTH_RESERVE
    optionName = sprintf('Option%d', i);
    authStruct.(optionName) = '';
end

idStruct = struct;
for i = 1:NUM_OPTION_RESERVE
    authName = sprintf('Auth%d', i);
    idStruct.Authority.(authName) = authStruct; 
end

Accounts.(id) = idStruct;


[isGenerated, stateMsg, newAccountStruct] =...
    GenerateAccount('abcd', 'icluebio10#', 'abcde', 'admin',...
    'Team1', 'abcd', 'icluebio.co.kr', '01012341234',...
    []);
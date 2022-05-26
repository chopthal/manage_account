function password = GenerateRandomPassword(lengthPassword)

    % TODO : to pcode
    START_ASCII_NUM = 48; 
    END_ASCII_NUM = 126;    
    password = char(START_ASCII_NUM + rand(1, lengthPassword) * (END_ASCII_NUM-START_ASCII_NUM));    

end
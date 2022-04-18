*** Variables ***
${ErrorMessage_Locator_Login}    //ul[@class="woocommerce-error"]
${ErrorMessage_WrongUsername_Login}    Error: The username ${Wrong_Login_Username} is not registered on this site. If you are unsure of your username, try your email address instead.
${UsernameINput_Login}    id:username
${PasswordInput_Login}    name:password
${LoginBtn_LoginPage}    //*[@name="login"]
${ErrorMessage_Locator_Login}    //ul[@class="woocommerce-error"]
${EmptyUser_Error_message}    Error: Username is required.
${LoginLabel_LoginPage}    //div[@class="u-column1 col-1"]/h2

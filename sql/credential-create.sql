ARGUMENT 1 DEFAULT 'ALL'

define user_param=&1
undefine 1

prompt "Creating credential: &user_param"

-- Get the config information
@config.sql

-- This procedure will recreate credentials. You can specify a credential type (storage, OpenAI)

DECLARE
    l_exists number := 0;
    l_type varchar2(20) := nvl(upper('&user_param'),'ALL');
BEGIN
    -- Azure OpenAI
    if l_type in ('OPENAI','ALL') then
        -- Create your credential. Replace it if already exists
        select COUNT(*)
        into l_exists
        from user_credentials    
        where upper(credential_name)=upper('&AZURE_OPENAI_CREDENTIAL_NAME');

        IF l_exists = 1 THEN
            dbms_cloud.drop_credential (
                credential_name => '&AZURE_OPENAI_CREDENTIAL_NAME'
            );
        END IF;

        dbms_cloud.create_credential (                                                 
            credential_name => '&AZURE_OPENAI_CREDENTIAL_NAME',                                            
            username => 'AZURE_OPENAI',                                                 
            password => '&AZURE_OPENAI_KEY'
        );

    END IF; -- Azure OpenAI

    if l_type in ('STORAGE','ALL') then
        -- Create your credential. Replace it if already exists
        select COUNT(*)
        into l_exists
        from user_credentials    
        where upper(credential_name)=upper('&STORAGE_CREDENTIAL_NAME');

        IF l_exists = 1 THEN
            dbms_cloud.drop_credential (
                credential_name => '&STORAGE_CREDENTIAL_NAME'
            );
        END IF;
                          
        dbms_cloud.create_credential(
            credential_name => '&STORAGE_CREDENTIAL_NAME',
            username => '&STORAGE_ACCOUNT_NAME',
            password => '&STORAGE_KEY'
        );

    END IF; -- Storage   
END;
/

-- Review the credentials
COLUMN credential_name FORMAT A40
COLUMN username FORMAT A40

select 
    credential_name, 
    username 
from user_credentials;

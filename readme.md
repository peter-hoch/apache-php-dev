# apache-php-dev docker image

## Disclaimer

The image is for development and education only.  
The configuration is unsecure in order to enable debugging etc.  
Do NOT connect to the internet!  
Use only in a safe sandboxed environment!  

## Debugging PHP 

XDebug is installed and enabled  
xdebug.discover_client_host is activated - most convenient **but most insecure**  

## Authentication and Authorization

password files with admin:password

### Basic Authentication

https://httpd.apache.org/docs/2.4/howto/auth.html


Create the Password File
```bash
# The first time we use this utility, we need to add the -c option to create the specified file. We specify a username (sammy in this example) at the end of the command to create a new entry within the file:
htpasswd -cb /etc/apache2/.htpasswd admin password

htpasswd -b /etc/apache2/.htpasswd another_user password

```

### Digest Authentication

https://httpd.apache.org/docs/2.4/programs/htdigest.html


`RealmName == AuthName` 

```bash
htdigest -c /etc/apache2/.htdigest RealmName admin 
```




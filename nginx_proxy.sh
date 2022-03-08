sudo apt-get -y update
sudo apt-get -y install nginx
service nginx start
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl.key -out /etc/nginx/ssl.crt -subj "/C=US/ST=state/L=locality/O=organization/OU=organizationalunit/CN=CN/emailAddress=email"

sudo cat << EOF > /etc/nginx/sites-enabled/nginx.conf
upstream backend_servers {
    server 172.30.1.1:80 weight=1;
    server 172.30.2.1:80 weight=1;
}
    server {
    listen        8082;
    listen        4443 ssl;
    server_name localhost;

    return 301 https://$host:4443$request_uri
    #ssl           on;
    ssl_certificate  /etc/nginx/ssl.crt;
    ssl_certificate_key /etc/nginx/ssl.key;
    location / {
        proxy_pass http://backend_servers;
    }
}
EOF

service nginx reload

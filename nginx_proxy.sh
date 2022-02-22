sudo apt-get -y update
sudo apt-get -y install nginx
service nginx start

sudo cat << EOF > /etc/nginx/sites-enabled/nginx.conf
upstream backend_servers {
    server 172.30.1.1:80 weight=1;
    server 172.30.2.1:80 weight=1;
}
    server {
    listen        8082;
    server_name _;
    location / {
        proxy_pass http://backend_servers;
    }
}
EOF

service nginx reload
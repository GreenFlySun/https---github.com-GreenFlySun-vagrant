sudo apt-get -y update
sudo apt-get -y install nginx
service nginx start
sudo apt-get -y install net-tools

sudo cat << EOF > /var/www/html/index.nginx-debian.html
<!DOCTYPE html>
<html>
<head>
<tittle>It's a Pink page<tittle>
<style>
    body{
        widht:35em;
        margin:0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
        background-color: pink;
    }
</style>
</head>
<body>
<h1>It's a Pink page for Stas</h1>
<p>It's very PINK PAGE</p>
</body>
</html>
EOF
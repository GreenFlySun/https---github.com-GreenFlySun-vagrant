sudo apt-get -y update
sudo apt-get -y install nginx
service nginx start
sudo apt-get -y install net-tools

sudo cat << EOF > /var/www/html/index.nginx-debian.html
<!DOCTYPE html>
<html>
<head>
<tittle>It's a LightBlue page<tittle>
<style>
    body{
        widht:35em;
        margin:0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
        background-color: lightblue;
    }
</style>
</head>
<body>
<h1>It's a LightBlue page for Stas</h1>
<p>It's very LIGHTBLUE PAGE</p>
</body>
</html>
EOF
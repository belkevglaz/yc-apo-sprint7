Для работы minikube с NetworkPolicy запускать minikube надо с параметром cni calico. По-умолчанию vanilla minikube не поддерживает NetworkPolicy

```shell
minikube start --cni calico
```
Ниже примеры вызовов после включения сетевых политик

Результаты обращений из пода `admin-front-end-app` к подам `admin-back-end-api` и `back-end-api`

```
root@admin-front-end-app:/# hostname
admin-front-end-app

root@admin-front-end-app:/# curl http://admin-back-end-api.default.svc.cluster.local:80 --connect-timeout 3
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>

root@admin-front-end-app:/# curl http://back-end-api.default.svc.cluster.local:80 --connect-timeout 3
curl: (28) Failed to connect to back-end-api.default.svc.cluster.local port 80 after 3001 ms: Timeout was reached

```

Результаты обращений из пода `front-end-app` к подам `admin-back-end-api` и `back-end-api`

```
root@front-end-app:/# hostname
front-end-app

root@front-end-app:/# curl http://admin-back-end-api.default.svc.cluster.local:80 --connect-timeout 3
curl: (28) Failed to connect to admin-back-end-api.default.svc.cluster.local port 80 after 3000 ms: Timeout was reached

root@front-end-app:/# curl http://back-end-api.default.svc.cluster.local:80  --connect-timeout 3
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
root@front-end-app:/# 


```
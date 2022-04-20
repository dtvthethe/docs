<h1>Protecting Routes</h1>

```
->middleware('auth');
```

<p>Để điều chỉnh rediẻct sang 1 trang khác thì vào `app/Http/Middleware/Authenticate.php` sửa lại hàm `redirectTo()`</p>

<h1>Chỉ định 1 guad</h1>

<p>guard phải có trong mảng của auth.php</p> //TODO

```
->middleware('auth:admin');
```

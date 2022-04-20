`@auth` `@guest` được sử dụng để kiểm tra user hiện tại đc xác thực hay là guest

```
@auth
    // The user is authenticated...
@endauth
 
@guest
    // The user is not authenticated...
@endguest
```
//TODO
```
@auth('admin')
    // The user is authenticated...
@endauth
 
@guest('admin')
    // The user is not authenticated...
@endguest
```

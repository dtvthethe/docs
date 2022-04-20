<h1>Auth</h1>
<ul>
  <li>::user()</li>
  <li>::id() lấy id</li>
</ul>
```
$user = Auth::user();
```

<h1>Request</h1>
```
public function update(Request $request)
{
    $request->user()
}
```

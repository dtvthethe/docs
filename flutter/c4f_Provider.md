Provider: là 1 thư viện giúp quản lí các state object đơn gian hơn
</br>
xem `c4f_Provider`
</br>


<h1>Provider</h1>

Cài đặt thư viện / package `provider`.</br>
Sự khác biệt khi gọi bằng `Consumer` và `Provider.of<T>`:
- `Consumer` Khi truyền wg vào để tránh rebuil thì <b>ko bị</b> rebuild lại khi Provider có update data
- `Provider.of<T>` Khi truyền wg vào để tránh rebuil thì <b>bị</b> rebuild lại khi Provider có update data
- Sử dụng `.value` khi nào:
Khi muốn các child dùng đc các giá trị là 1 value/object hoặc là kết quả của Provider đã có ở trên
- Cách khởi tạo bằng `constructor()` và `.value`
  -  `constructor()`: dùng constructor khởi tạo state object khi object đó là mới hoàn toàn. (1) 
  -  `.value`: còn trong trường hợp có state object đã xử lý trước đó rồi (1) mà muốn sử dụng lại thì dùng `.value` hoặc là 1 value/object
- `watch` vs `read`:
	- context.watch<CounterSign>(): dùng để lấy biến nếu có thay đổi lập tức sẽ đc thông báo
	- context.read<CounterSign>(): thường dùng để gọi hàm.
<h2>Expose a value cách sử dụng basic</h2>

<i>basic_use.dart</i>

- <s>Dùng `Provider<T>(..)` để tạo ko dùng `.value` nếu data bên trong ko thay đổi</s>
- Tạo 1 wg stl trong hàm build return về `Provider`
- Thiết lập type `<T>` cho Provider
- Gán `create` (là function(context)) , `child` (UI) cho `Provider`
- Gọi bằng `Consumer` gán `builder` (context, object, child)
- Gọi bằng `of<T>` `Provider.of<T>(context)`

<h2>Expose a value cách sử dụng basic</h2>

<i>ex_change_notifier.dart</i>

- Listenable: lắng nghe sự thay đổi trong object và sẽ có tương tác vs các wg con, <b>class này là của Flutter</b>
- <s>Dùng `ChangeNotifierProvider.value(..)` để tạo vì có data đc thay đổi bên trong</s>
- trong Model sử dụng `notifyListeners()` từ mixin `ChangeNotifier` để thông báo có sự update

<h2>Multiple Provider</h2>

- 1 App có thể có nhiều State Object
- Sử dunj Multiple Provider để các wg child dùng đc State Object

<h2>Proxy Provider</h2>

- `DI` (tiêm) vì đứng giữa nên gọi là Proxy
- `ProxyProvider<T, R>`: `T` input type, `R` return type
- nó sẽ dùng các provider đã khai báo ở trên gom vào type `T` của proxy Proxyxxx`<T..., R>` để tạo ra 1 object `R` mới 
- nhiệm vụ là gom hết những cái provider ở trên để tạo ra 1 object mới

	<pre>
	// ProxyProvider gom (Counter) lại để tạo ra obj mới là CounterSerice
	providers: [
		Provider<Counter>(create: (_) => Counter()),
		ProxyProvider<Counter, CounterSerice>(
			update: (context, counter, counterModel) => CounterSerice(counter),
		)
	],
	</pre>

<i>ex_proxy_provider.dart</i>


<h2>Future Provider</h2>

<i>ex_future_provider.dart</i>

<h2>Stream Provider</h2>

<i>ex_stream_provider.dart</i>

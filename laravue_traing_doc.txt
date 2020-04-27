# Basic:
- bootstrap.js: load cac thu vien, config...
- app.js: import file `.vue`, la file khoi tao ban dau cho project, thiet lap ve `data`, `method` vs pham vi la global => tim den `id = #app` 

- computed: được sử dụng gần giống như methods, computed vs method:
    + khi gọi computed ko có dấu `()`
    + ko có tham số -> chỉ sử dụng các dữ liệu có sẵn trong `data()`
    + computed sẽ chạy lại nếu các giá trị của biến bị thay đổi còn method thì khi gọi sự kiện mới thay đổi. điều đặc biệt là nó sẽ được 
    cached nên giả sử bạn có 1 computed với hàng loạt tính toán, lặp trong đó, thì nếu các các biến phụ thuộc không thay đổi thì khi sử 
    dụng nó sẽ chỉ mất thời gian tính 1 lần, những lần sau kết quả sẽ được sử dụng lại từ lần trước
    
- watch: giống trigger, thay đổi 1 thuộc tính trong Object thì sử dụng thông qua computed

- v-show | v-if:
    + v-show: add style display: none    
    + v-if ko render ra ngay ma` tùy vào giá trị còn v-show thì add thêm style display 
    + khi nào nên dùng v-show: nội dung trong block ít, trong quá trình sử dụng bị tác động nhiều    
    + khi nào nên dùng v-if: nội dung block nhiều + nhiều xử lý, nội dung ít thay đổi
- v-for:
    ```
    <li v-for="item in lits">
        {{ item }}
    </li>
    ```
    ```
    <li v-for="(item, index) in lits">
        {{ item }}
    </li>
    ```
    Loop an object Ex:
    
    ```
    myInfo: {
        name: 'My Name',
        age: '2x',
        country: 'vietnam'
    }
    
     <li v-for="item of myInfo">
        {{ item }}
    </li>
    
    <li v-for="(value, key) of myInfo">
        {{ key }} - {{ value }}
    </li>
    ```
- Check Object not null by this way:
    ```Object.keys(<objectName>).length !== 0```
    
- Emit multiple parameters to parent:
    ```
    this.$emit('userSelected', user, this.number, this.string)
    
    childrenSelectUser(user, number, string) {
        ...
    }
    ``` 
    or N parameters
    ```
    childrenSelectUser('test', ...arguments) #=> ...
    
    childrenSelectUser(text, user, number, string) { #=> sau do truyen du? tham so

    }
    ```
# Vue Life Cycle:
- Creating: Là quá trình diễn ra trước nhất trên Component, chúng ta có thể tực hiện các thao tác dưới trước khi đc đưa vào DOM:
        + thao tác vs dữ liệu: load data từ backend
        + thiết lập các thống số 
        + lấy dữ liệu
          
    * beforeCreate:  phần data + method step này chưa dc khởi tạo
    * created: data + method trong component đã có thể đc sử dụng, nhưng template và DOM ảo chưa đc mount và render 

- Mounting: trước và sau khi component được khởi tạo, 
    * beforeMount: được gọi sau khi component đã được compile và trước lần render đầu tiên, có thể in ra `this` nhưng 
    chưa thể truy cập đến các p. tử trong DOM
    * mounted: có thể truy cập vào các p. tử DOM, data, template
        
- Updating: quá trình này đc gọi bất kì khi dữ liệu `reactive` bị thay đổi hoặc bị tác động cho thay đổi khiến cho component phải re-render.
    * beforeUpdate: dc gọi ngay khi data trên component bị thay đỏi và trc' khi DOM re-render 
    * updated: xảy ra sau `beforeUpdate` ở step này DOM đã đc cập nhật lại
    
- Destroy;
    * beforeDestroy: xảy ra trước khi component bị hủy(chuyển từ component này sang componwnt khác, chuyển route,...) tại step 
    này component vaanx còn đầy đủ data, methods... thường dùng để xóa đi các sự kiện không cần thiết sau khi component bị hủy,
    VD: 
        ```
        chức năng chat realtime, khi khởi tạo component mình sẽ lắng nghe sự kiện khi có một người dùng gửi tin nhắn đến sẽ có 
        tiếng "Bíp", nếu chúng ta để nguyên thì khi chuyển route, qua component khác, khi có người dùng nhắn tin đến vẫn thấy 
        tiếng kêu "Bíp", bởi vì mình vẫn đang tiếp tục lắng nghe sự kiện, do đó mình đã phải dùng tới beforeDestroy để huỷ lắng 
        nghe khi chuyển trang
        ``` 
    * destroyed: data, methods đã bị xóa nhưng có thể làm một số việt như thồng báo cho remote server là component cừa bị hủy.

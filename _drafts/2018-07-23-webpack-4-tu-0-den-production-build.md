---
layout: post
title: Webpack 4 từ 0 cho đến production build
feature-img: "assets/img/posts/cdn/cdn.png"
thumbnail: "assets/img/posts/cdn/cdn.png"
tags: [webpack, webpack4, huongdan, guide]
---

## Giới thiệu về Webpack

Ý tưởng nguyên thủy của Webpack là một module bundler, tức là một công cụ đóng gói module, như css, js. 

Nhưng với việc cộng đồng các lập trình viên trên thế giới với những đóng góp không ngừng nghỉ của mình đã làm phai nhạt ranh giới giữa một module bundler và task runner, điển hình như Gulp.

Qua gần 6 năm từ khi xuất hiện, Webpack đã được đón nhận như một công cụ không thể thiếu giúp cho viện phát triển web, mặc dù Webpack không giới hạn ở web. 

Hiện tại Webpack đang ở phiên bản 4.16.2. Với sự phát triển và thay đổi khá nhanh của mình thì rất nhiều plugin/loader đã bị outdated nhưng không thể phủ nhận sự cải thiện mạnh mẽ của công cụ này.

Hôm nay mình muốn giới thiệu về cách config Webpack 4 từ 0 cho đến bản production build.

## Cách sử dụng Webpack 4

Bắt đầu, hãy khởi tạo một vài thứ cần cho bài hướng dẫn này. Mở cmd (terminal) của bạn lên và cd đến thư mục làm việc của bạn, sau đó chạy mấy dòng command sau:

```ruby
mkdir webpack4-awesome
cd webpack4-awesome
```

Khởi tạo package.json
```ruby
npm init -y
```
Cài đặt webpack và webpack-cli (2 package khác nhau nhé)
```ruby
npm i webpack webpack-cli -D
```
Với `-D` (tương đương với `--save-dev`) thì npm sẽ tự động thêm webpack và webpack-cli vào _devDependencies_(trong `package.json`). Còn việc _dependencies_ và _devDependencies_ khác nhau như thế nào các bạn hãy tự tìm hiểu thêm nhé.

-------------------------

#### 0 
Khi mình nói 0, mình thực sự nói là 0. Webpack 4 mặc định không cần file config. Tada!!!

Vậy thử chạy webpack nhá, vào `package.json` thêm một build script như sau:

```ruby
{
    "scripts": {
        "build": "webpack"
    }
}
```
Lưu và chạy thử lệnh sau:
```ruby
npm run build
```
Bạn sẽ nhận được một thông báo lỗi như sau:
```ruby
ERROR in Entry module not found: Error: Can't resolve './src' in 'C:\code4po\webpack4-awesome'
npm ERR! code ELIFECYCLE
npm ERR! errno 2
npm ERR! webpack4-awesome@1.0.0 build: `webpack`
npm ERR! Exit status 2
npm ERR!
npm ERR! Failed at the webpack4-awesome@1.0.0 build script.
npm ERR! This is probably not a problem with npm. There is likely additional logging output above.

npm ERR! A complete log of this run can be found in:
npm ERR!     C:\Users\po\AppData\Roaming\npm-cache\_logs\2018-07-23T17_19_17_039Z-debug.log
```

Bên cạnh đó là một warning nhè nhẹ như thế này
```ruby
WARNING in configuration
The 'mode' option has not been set, webpack will fallback to 'production' for this value. Set 'mode' option to 'development' or 'production' to enable defaults for each environment.
You can also set it to 'none' to disable any default behavior. Learn more: https://webpack.js.org/concepts/mode/
```
Cái này liên quan tới build mode của Webpack 4 nhưng tạm thời mình chưa cần quan tâm đến cái này vội.

Nói về lỗi ở trên thì như bạn có thể đọc thấy, bạn không có file entry (_Entry module not found_), tức là file "đầu vào". Mặc định webpack sẽ lấy từ `src/index.js`.

Vậy thì mình thử tạo file đó rồi ghi một dòng code đơn giản như là:
```ruby
console.log('Đây là index.js');
```
Sau đó chạy lại 
```ruby
npm run build
```
Nhìn vào thư mục `webpack4-awesome` bạn sẽ thấy một thư mục mới được tạo nên và có 1 file trong đó: `dist/main.js`.

Đúng rồi đấy, bạn cũng không config thì Webpack mới build ra được file output

**>>>>> Webpack 4 không cần config file entry và output**

-------------------------

#### Development và Production mode của Webpack 4
Bây giờ hãy nói về cái warning trên:

```ruby
WARNING in configuration
The 'mode' option has not been set, webpack will fallback to 'production' for this value. Set 'mode' option to 'development' or 'production' to enable defaults for each environment.
You can also set it to 'none' to disable any default behavior. Learn more: https://webpack.js.org/concepts/mode/
```
Đọc sơ qua có thể thấy được là Webpack yêu cầu một đầu vào là _mode_ và nếu như bạn không cung cấp thì Webpack mặc định sẽ để là mode production.

Vậy 2 mode này khác nhau như thế nào? Bạn cũng có thể tưởng tượng ra rồi đấy, ở production mode thì file sẽ được compress (minify/uglify) để cho gọn nhẹ dễ deploy. Hãy thử mở file `main.js` được Webpack build ra từ lệnh build khi nãy nhé, nó sẽ có dạng như thế này:
```ruby
!function(e){var t={};function n(r){if(t[r])return t[r].exports;var o=t[r]={i:r,l:!1,exports:{}};return e[r].call(o.exports,o,o.exports,n),o.l=!0,o.exports}n.m=e,n.c=t,n.d=function(e,t,r){n.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:r})},n.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},n.t=function(e,t){if(1&t&&(e=n(e)),8&t)return e;if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var r=Object.create(null);if(n.r(r),Object.defineProperty(r,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var o in e)n.d(r,o,function(t){return e[t]}.bind(null,o));return r},n.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return n.d(t,"a",t),t},n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},n.p="",n(n.s=0)}([function(e,t){console.log("Đây là index.js")}]);
```

Đúng như bạn đang thấy thì nó chỉ có 1 dòng duy nhất.

Trước đây thì bạn phải dùng một plugin như `uglifyjs-webpack-plugin` để đạt được điều này, và bây giờ với Webpack 4 thì chức năng này đã được built-in.

Và ngược lại thì development mode sẽ giữ nguyên cấu trúc của file cho dễ nhìn. Để Webpack nhận dạng mode nào thì bạn có thể chạy thử 1 trong 2 command sau:
```ruby
webpack --mode development
```
```ruby
webpack --mode production
```

Để chọn tiện sử dụng và bổ sung những đầu vào cần thiết thì bạn hãy thêm 2 script này vào `package.json`

```ruby
{
    "scripts": {
        "build": "webpack --mode production",
        "build:dev": "webpack --mode development"
    }
}
```

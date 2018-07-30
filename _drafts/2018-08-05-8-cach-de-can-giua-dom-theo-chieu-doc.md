---
layout: post
title: 8 cách để căn giữa DOM theo chiều dọc
feature-img: "assets/img/posts/vertical-centering/vertical-centering.jpg"
thumbnail: "assets/img/posts/vertical-centering/vertical-centering.jpg"
tags: [css, vertical-align, vertical-centering, guide]
---
![Vertical Centering](/assets/img/posts/vertical-centering/vertical-centering.jpg "Vertical Centering")

## vertical-align
Đã bao nhiêu lần bạn đã thử dùng `vertical-align: middle;` để thử căn giữa một DOM theo chiều dọc? Mình thì ít nhất là chục lần!
Thoạt nhìn thì có vẻ logic, nhưng loay hoay một lúc thì phát hiện nó chả hoạt động gì?! 

Chắc bạn (và mình) cũng đã từng nghĩ, tại sao căn giữa theo chiều ngang (khá) dễ  thì chiều dọc lại làm khó mình vậy nhỉ???
Thực ra mình đ** hiểu lắm và có vẻ nhiều dev khác cũng cảm thấy vậy! Và nhiều cách "work around" đã được nghĩ ra để giải quyết (một cách không triệt để lắm) vấn đề này, ví dụ như: _table_, _float_, _inline-block_, _position_.

Hôm nay mình muốn cùng thử tất cả 8 cách (mà mình được biết) để giải quyết việc căn giữa theo chiều dọc một DOM.

## 1. line-height (Áp dụng cho text và image)
_Ghi nhớ là kỹ thuật này chỉ áp dụng cho **1 dòng text**_

Hãy thử với một vài dòng html và css như sau:

#### >> Text
**html**

```html
<div id="parent">
    <div id="child">Text</div>
</div>
```

**css**
```css
#child {
    height: 200px;
    line-height: 200px;
}
```

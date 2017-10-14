var p = document.getElementById("httpsrec");
var x = "":
if (self != top) {
  
x = "rotw@surge 被嵌入。请注意您的浏览安全。"
}

if ( window.location.protocol == "https://"){
  x = "您在使用 HTTP 协议访问我们的站点。建议<a href="https://rotw.surge.sh">使用 HTTPS 协议</a>，更安全。"
}

if (x != "") {
  p.innerHTML = x;
  p.style.display = "block";
}
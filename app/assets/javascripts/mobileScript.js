$(document).ready(function() {
  $("#message_store_id").change(function(e){
    $('#mobile_k').click(function(){
        kakao.link("talk").send({
            msg : "이브자리 이벤트3에 참여하세요!!; \n상품 짱많음!!!!!",
            url : "http://event3.evezary.co.kr",
            appid : "event3.evezary.co.kr",
            appver : "1.0",
            appname : "이브자리",
            type : "link"
        });
    });
    $('#mobile_ks').click(function(){
        kakao.link("story").send({
            post : "이브자리 이벤트3에 참여하세요!!; \n상품 짱많음!!!!! \nhttp://event3.evezary.co.kr",
            appid : "event3.evezary.co.kr",
            appver : "1.0",
            appname : "이브자리",
            urlinfo : JSON.stringify({title:"이브자리 이벤트3!", desc:"이브자리 이벤트3 부제목.", imageurl:["http://rm-rf.kr/sigh.png"], type:"article"})
        });
    });
});
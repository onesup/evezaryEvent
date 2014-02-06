$(document).ready(function() {
  $("#message_store_id").change(function(e){
    console.log("kjf");
    navigator.geolocation.getCurrentPosition (function (pos)
    {
      var lat = pos.coords.latitude;
      var lng = pos.coords.longitude;
	    $.ajax({
	      type: "GET",
	      url: "/near_stores.json?lat="+lat+"&lng="+lng,
	      dataType: "json",
	      headers: {
	        'X-Transaction': 'POST Example',
	        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
	      },
	      success: function(data){
          console.log(data.stores);
	      }
              });
        });
    });
    $('#mobile_k').click(function(){
        kakao.link("talk").send({
            msg : "이브자리 이벤트3에 참여하세요!!; \n상품 짱많음!!!!!",
            url : "http://event3.evezary.co.kr",
            appid : "event3.evezary.co.kr",
            appver : "1.0",
            appname : "이브자리",
            type : "link"
        });
        _gaq.push('send', 'event', 'button', 'click', '카톡 모바일 1551');
         loadJsFile("http://i51.icast-ad.com/track?ccd=1251&mcd=01040601&pcd=1551");
    });
    $('#mobile_ks').click(function(){
        kakao.link("story").send({
            post : "이브자리 이벤트3에 참여하세요!!; \n상품 짱많음!!!!! \nhttp://event3.evezary.co.kr",
            appid : "event3.evezary.co.kr",
            appver : "1.0",
            appname : "이브자리",
            urlinfo : JSON.stringify({title:"이브자리 이벤트3!", desc:"이브자리 이벤트3 부제목.", imageurl:["http://rm-rf.kr/sigh.png"], type:"article"})
        });
        _gaq.push('send', 'event', 'button', 'click', '카스 모바일 1552');
         loadJsFile("http://i51.icast-ad.com/track?ccd=1251&mcd=01040601&pcd=1552");
    });
    $('#mobile_f').click(function(){
        _gaq.push('send', 'event', 'button', 'click', '페북버튼 모바일 1553');
         loadJsFile("http://i51.icast-ad.com/track?ccd=1251&mcd=01040601&pcd=1553");
    });
    $('#location').click(function(){
        _gaq.push('send', 'event', 'button', 'click', '위치 모바일');
    });
    $('#m1_sendButton').click(function(){
         if( $('#myPhone_1').val() == "" || $('#myPhone_2').val() == "" || $('#myPhone_3').val() == "" || $('#momPhone_1').val() == "" || $('#momPhone_2').val() == "" || $('#momPhone_3').val() == "" || $('#ta').val() == "" )
        {
            alert("내용을 모두 입력해주세요.");
        }
        else
        {
            _gaq.push('send', 'event', 'button', 'click', '첫번째 페이지 끝 모바일 1549');
            loadJsFile("http://i51.icast-ad.com/track?ccd=1251&mcd=01040601&pcd=1549");
            location.href = "mobile_apply_2";
        }
    });
    $('#m2_personButton').click(function(){
        _gaq.push('send', 'event', 'button', 'click', '약관 모바일');
    });
    $('#m2_endButton').click(function(){
         if( $('#m2_name').val() == "" || $('#m2_phone_1').val() == "" || $('#m2_phone_2').val() == "" || $('#m2_phone_3').val() == "" || $('#m2_email').val() == "" )
        {
            alert("내용을 모두 입력해주세요.");
        }
        else
        {
            if($(':radio[name="agree"]:checked').val() == "d")
            {
              alert("개인정보 동의를 하셔야 진행하실 수 있습니다.");
            }
            else
            {
                 _gaq.push('send', 'event', 'button', 'click', '두번째 페이지 끝 모바일 1550');
                  loadJsFile("http://i51.icast-ad.com/track?ccd=1251&mcd=01040601&pcd=1550");
                location.href = "mobile_index";
            }
        }
    });
    $('#mobile_apply').click(function(){
         _gaq.push('send', 'event', 'button', 'click', '모바일 goto apply_1 1548');
                  loadJsFile("http://i51.icast-ad.com/track?ccd=1251&mcd=01040601&pcd=1548");
                location.href = "mobile_apply_1";
    });
});

function loadJsFile(filename){

var fileref=document.createElement('script');

fileref.setAttribute("type","text/javascript");

fileref.setAttribute("src", filename);

if(typeof fileref!="undefined"){

document.getElementsByTagName("head")[0].appendChild(fileref);

}

}

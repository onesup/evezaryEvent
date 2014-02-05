// Must include 'jquery-1.11.0.min.js'
// Must include 'jquery-modal.min.js'

var c1, c2, c3, c4;

$(document).ready(function() {
    if( navigator.appVersion.indexOf("MSIE 6.0") >= 0
        || navigator.appVersion.indexOf("MSIE 7.0") >= 0
        || navigator.appVersion.indexOf("MSIE 8.0") >= 0 ) {
        // dkandmlaldjqtdma
    } else {
        // 구름 실시간 움직임
        c1 = ( ( Math.random() * 1000 ) + 100 ) / 1000;
        c2 = ( ( Math.random() * 1000 ) + 100 ) / 1000;
        c3 = ( ( Math.random() * 1000 ) + 100 ) / 1000;
        c4 = ( ( Math.random() * 1000 ) + 100 ) / 1000;
        setInterval( loopCloud, 1 );
    }

    // '데이트 신청하기' 버튼 클릭시
    $('#applyButton').click(function(e){
        _gaq.push('send', 'event', 'button', 'click', '데이트 신청하기');
        e.preventDefault();
        $('#popUp').load('home_popup_1', function(e) {
            $('#popUp').modal();
            $('#closeModal').css('top', '-305px' );
            $('#closeModal').css('right', '-40px' );
            p1ClickImage(1);
            // '데이트 신청하기' 팝업에서 이미지 클릭 시
            $('#popUp_1_gi').click(function(e){
                _gaq.push('send', 'event', 'button', 'click', '데이트 신청하기 팝업에서 이미지 클릭 시 1');
                e.preventDefault();
                p1ClickImage(1);
            });
            $('#popUp_2_gi').click(function(e){
                _gaq.push('send', 'event', 'button', 'click', '데이트 신청하기 팝업에서 이미지 클릭 시 2');
                e.preventDefault();
                p1ClickImage(2);
            });
            $('#popUp_3_gi').click(function(e){
                _gaq.push('send', 'event', 'button', 'click', '데이트 신청하기 팝업에서 이미지 클릭 시 3');
                e.preventDefault();
                p1ClickImage(3);
            });
            $('#popUp_4_gi').click(function(e){
                _gaq.push('send', 'event', 'button', 'click', '데이트 신청하기 팝업에서 이미지 클릭 시 1');
                e.preventDefault();
                p1ClickImage(4);
            });

            // '경품 선택하기' 후 넘어가는 팝업
            $('#applyPopup1_selectButton').click(function(e){
                _gaq.push('send', 'event', 'button', 'click', '경품 선택하기');
                e.preventDefault();
                $('#popUp').empty();
                $('#popUp').load('home_popup_2', function(e) {
                    $('#popUp').modal();
                    $('#closeModal').css('top', '-391px' );
                    $('#closeModal').css('right', '-46px' );
                     $('#applyPopup2_nearButton').click(function(e){
                        e.preventDefault();
                        //근처 매장 버튼 눌렀을 때
                     });
                    // '문자 보내기' 후 넘어가는 팝업
                    $('#applyPopup2_sendButton').click(function(e){
                        var phone1 = $("#myPhone_1").val();
                        var phone2 = $("#myPhone_2").val();
                        var phone3 = $("#myPhone_3").val();
                        var send_phone = phone1 + "-" + phone2 + "-" + phone3;
                        $("#send-phone").val(send_phone);
                        $("#my-phone-1").val(phone1);
                        $("#my-phone-2").val(phone2);
                        $("#my-phone-3").val(phone3);
                        _gaq.push('send', 'event', 'button', 'click', '문자 보내기');
                        e.preventDefault();
                        $('#popUp').empty();
                        $('#popUp').load('home_popup_3', function() {
                            $('#popUp').modal();
                            $('#closeModal').css('top', '-349px' );
                            $('#closeModal').css('right', '-46px' );
                            $('#phone_1').val(phone1);
                            $('#phone_2').val(phone2);
                            $('#phone_3').val(phone3);
                            $('#apply_3_person').click(function(e){
                                _gaq.push('send', 'event', 'button', 'click', '개인정보');
                                e.preventDefault();
                                $('#person').css('display', 'block');
                                $('#applyPopup3_finButton2').click(function(e){
                                    _gaq.push('send', 'event', 'button', 'click', '개인정보 fin');
                                     e.preventDefault();
                                    $('#person').css('display', 'none' );
                                 });
                            });
                            // '완료' 후 넘어가는 팝업
                            $('#applyPopup3_finButton').click(function(e){
                                _gaq.push('send', 'event', 'button', 'click', '감사합니다로');
                                e.preventDefault();
                                $('#popUp').empty();
                                $('#popUp').load('home_popup_4', function() {
                                    $('#popUp').modal();
                                    $('#closeModal').css('top', '-150px' );
                                    $('#closeModal').css('right', '-46px' );
                                    // '완료' 후 넘어가는 팝업
                                    $('#applyPopup4_finButton').click(function(e){
                                        _gaq.push('send', 'event', 'button', 'click', '베스트5');
                                        e.preventDefault();
                                        $('#popUp').empty();
                                        $('#popUp').load('home_popup_5', function() {
                                            $('#popUp').modal();
                                            $('#closeModal').css('top', '-283px' );
                                            $('#closeModal').css('right', '-79px' );

                                            var page = 1;
                                            var popNum = 1;

                                             $('#applyPopup5_finButton_1').click(function(e){
                                                _gaq.push('send', 'event', 'button', 'click', '신혼베스트');
                                                  e.preventDefault();
                                                  if( page == 2 ){
                                                    $('#popUp_5_move_2').css('display', 'none' );
                                                    $('#popUp_5_move_2').css('left', '0px' );
                                                    $('#popUp_5_move_1').css('display', 'block' );
                                                    popNum = 1;
                                                    page = 1;
                                                  }
                                             });
                                             $('#applyPopup5_finButton_2').click(function(e){
                                                _gaq.push('send', 'event', 'button', 'click', '부모님 베스트');
                                                  e.preventDefault();
                                                  if( page == 1 ){
                                                    $('#popUp_5_move_2').css('display', 'block' );
                                                    $('#popUp_5_move_1').css('left', '0px' );
                                                    $('#popUp_5_move_1').css('display', 'none' );
                                                    popNum = 1;
                                                    page = 2;
                                                  }
                                             });
                                         

                                            $('#arrow_left').click(function(e){
                                                _gaq.push('send', 'event', 'button', 'click', '왼쪽 버튼');
                                                e.preventDefault();
                                                popNum--;
                                                if( popNum < 1 ){
                                                    popNum = 5;
                                                }
                                                if( page == 1 ){
                                                    $('#popUp_5_move_1').animate({
                                                        left: 542 * ( popNum - 1 ) * -1
                                                    }, 500);
                                                } else if( page == 2 ){
                                                    $('#popUp_5_move_2').animate({
                                                        left: 542 * ( popNum - 1 ) * -1
                                                    }, 500);
                                                }
                                            });
                                            $('#arrow_right').click(function(e){
                                                _gaq.push('send', 'event', 'button', 'click', '오른쪽 버튼');
                                                e.preventDefault();
                                                popNum++;
                                                if( popNum > 5 ){
                                                    popNum = 1;
                                                }
                                                if( page == 1 ){
                                                    $('#popUp_5_move_1').animate({
                                                        left: 542 * ( popNum - 1 ) * -1
                                                    }, 500);
                                                } else if( page == 2 ){
                                                    $('#popUp_5_move_2').animate({
                                                        left: 542 * ( popNum - 1 ) * -1
                                                    }, 500);
                                                }
                                            });
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
    });
    $('#blogButton').click(function(e){
        _gaq.push('send', 'event', 'button', 'click', '블로그');
        e.preventDefault();
        $('#popUp').empty();
        $('#popUp').load('home_popup_blog', function() {
            $('#popUp').modal();
            $('#closeModal').css('top', '-225px' );
            $('#closeModal').css('right', '-46px' );
        });
    });
    $('#fbButton').click(function(e){
        _gaq.push('send', 'event', 'button', 'click', '페이스북');
        e.preventDefault();
        window.open('https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fevent3.evezary.co.kr', 'window', "width = '300px', height = '200px'");
    });
});

function p1ClickImage(num){
  $("#gift-select").val(num);
    if( num == 1 ){
        $('#popUp_1_gift').css('border-width', '8px');
        $('#popUp_1_gift').css('margin', '4px');

        $('#popUp_2_gift').css('border-width', '0px');
        $('#popUp_2_gift').css('margin', '12px');

        $('#popUp_3_gift').css('border-width', '0px');
        $('#popUp_3_gift').css('margin', '12px');

        $('#popUp_4_gift').css('border-width', '0px');
        $('#popUp_4_gift').css('margin', '12px');
    }
    else if( num == 2 ){
        $('#popUp_1_gift').css('border-width', '0px');
        $('#popUp_1_gift').css('margin', '12px');

        $('#popUp_2_gift').css('border-width', '8px');
        $('#popUp_2_gift').css('margin', '4px');

        $('#popUp_3_gift').css('border-width', '0px');
        $('#popUp_3_gift').css('margin', '12px');

        $('#popUp_4_gift').css('border-width', '0px');
        $('#popUp_4_gift').css('margin', '12px');
    }
    else if( num == 3 ){
        $('#popUp_1_gift').css('border-width', '0px');
        $('#popUp_1_gift').css('margin', '12px');

        $('#popUp_2_gift').css('border-width', '0px');
        $('#popUp_2_gift').css('margin', '12px');

        $('#popUp_3_gift').css('border-width', '8px');
        $('#popUp_3_gift').css('margin', '4px');

        $('#popUp_4_gift').css('border-width', '0px');
        $('#popUp_4_gift').css('margin', '12px');
    }
    else if( num == 4 ){
        $('#popUp_1_gift').css('border-width', '0px');
        $('#popUp_1_gift').css('margin', '12px');

        $('#popUp_2_gift').css('border-width', '0px');
        $('#popUp_2_gift').css('margin', '12px');

        $('#popUp_3_gift').css('border-width', '0px');
        $('#popUp_3_gift').css('margin', '12px');

        $('#popUp_4_gift').css('border-width', '8px');
        $('#popUp_4_gift').css('margin', '4px');
    }
}

function loopCloud(){
    var c1_left = parseFloat($('#cloud_1').css('margin-left'));
    c1_left += c1;
    if( c1_left >= 1000 )
    {
        c1_left = -200;
        c1 = ( ( Math.random() * 1000 ) + 100 ) / 1000;
    }
    else if(c1_left == 0)
    {
        c1_left += 1;
    }
    $('#cloud_1').css('margin-left', c1_left);

    var c2_left = parseFloat($('#cloud_2').css('margin-left'));
    c2_left += c2;
    if( c2_left >= 1000 )
    {
        c2_left = -200;
        c2 = ( ( Math.random() * 1000 ) + 100 ) / 1000;
    }
    else if(c2_left == 0)
    {
        c2_left += 1;
    }
    $('#cloud_2').css('margin-left', c2_left);

    var c3_left = parseFloat($('#cloud_3').css('margin-left'));
    c3_left += c3;
    if( c3_left >= 1000 )
    {
        c3_left = -200;
        c3 = ( ( Math.random() * 1000 ) + 100 ) / 1000;
    }
    else if(c3_left == 0)
    {
        c3_left += 1;
    }
    $('#cloud_3').css('margin-left', c3_left);

    var c4_left = parseFloat($('#cloud_4').css('margin-left'));
    c4_left += c4;
    if( c4_left >= 1000 )
    {
        c4_left = -200;
        c4 = ( ( Math.random() * 1000 ) + 100 ) / 1000;
    }
    else if(c4_left == 0)
    {
        c4_left += 1;
    }
    $('#cloud_4').css('margin-left', c4_left);
}
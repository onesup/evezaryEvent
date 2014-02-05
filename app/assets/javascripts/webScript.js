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
        e.preventDefault();
        console.log("click");
        $('#popUp').load('home_popup_1', function(e) {
            console.log("load");
            $('#popUp').modal();
            $('#closeModal').css('top', '-305px' );
            $('#closeModal').css('right', '-40px' );
            console.log("open modal");
            // '데이트 신청하기' 팝업에서 이미지 클릭 시
            $('#popUp_1_gi').click(function(e){
                e.preventDefault();
                p1ClickImage(1);
            });
            $('#popUp_2_gi').click(function(e){
                e.preventDefault();
                p1ClickImage(2);
            });
            $('#popUp_3_gi').click(function(e){
                e.preventDefault();
                p1ClickImage(3);
            });
            $('#popUp_4_gi').click(function(e){
                e.preventDefault();
                p1ClickImage(4);
            });

            // '경품 선택하기' 후 넘어가는 팝업
            $('#applyPopup1_selectButton').click(function(e){
                e.preventDefault();
                $('#popUp').empty();
                $('#popUp').load('home_popup_2', function(e) {
                    $('#popUp').modal();
                    $('#closeModal').css('top', '-391px' );
                    $('#closeModal').css('right', '-46px' );
                    // '문자 보내기' 후 넘어가는 팝업
                    $('#applyPopup2_sendButton').click(function(e){
                        e.preventDefault();
                        $('#popUp').empty();
                        $('#popUp').load('home_popup_3', function() {
                            $('#popUp').modal();
                            $('#closeModal').css('top', '-349px' );
                            $('#closeModal').css('right', '-46px' );
                            // '완료' 후 넘어가는 팝업
                            $('#applyPopup3_finButton').click(function(e){
                                e.preventDefault();
                                $('#popUp').empty();
                                $('#popUp').load('home_popup_4', function() {
                                    $('#popUp').modal();
                                    $('#closeModal').css('top', '-150px' );
                                    $('#closeModal').css('right', '-46px' );
                                    // '완료' 후 넘어가는 팝업
                                    $('#applyPopup4_finButton').click(function(e){
                                        e.preventDefault();
                                        $('#popUp').empty();
                                        $('#popUp').load('home_popup_5', function() {
                                            $('#popUp').modal();
                                            $('#closeModal').css('top', '-283px' );
                                            $('#closeModal').css('right', '-79px' );

                                            var popNum = 1;

                                            $('#arrow_left').click(function(e){
                                                e.preventDefault();
                                                popNum--;
                                                if( popNum < 1 ){
                                                    popNum = 8;
                                                }
                                                $('#popUp_5_move').animate({
                                                    left: 542 * ( popNum - 1 ) * -1
                                                }, 500);
                                            });
                                            $('#arrow_right').click(function(e){
                                                e.preventDefault();
                                                popNum++;
                                                if( popNum > 8 ){
                                                    popNum = 1;
                                                }
                                                $('#popUp_5_move').animate({
                                                    left: 542 * ( popNum - 1 ) * -1
                                                }, 500);
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
        e.preventDefault();
        $('#popUp').empty();
        $('#popUp').load('home_popup_blog', function() {
            $('#popUp').modal();
            $('#closeModal').css('top', '-225px' );
            $('#closeModal').css('right', '-46px' );
        });
    });
    $('#fbButton').click(function(e){
        e.preventDefault();
        window.open('https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fevent3.evezary.co.kr', 'window', "width = '0px', height = '0px'");
    });
});

function p1ClickImage(num){
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
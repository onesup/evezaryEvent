// Must include 'jquery-2.1.0.min.js'
// Must include 'jquery-modal.min.js'
var c1, c2, c3, c4;

$(document).ready(function() {
	if( detectDevice() == true )
	{
		//Mobile
		$('#indexBody').load('./html/mobile.html', function() {
            
		});
	}
	else
	{
		$('#indexBody').load('./html/web.html', function() {

			if( navigator.appVersion.indexOf("MSIE 6.0") >= 0 
				|| navigator.appVersion.indexOf("MSIE 7.0") >= 0 
				|| navigator.appVersion.indexOf("MSIE 8.0") >= 0 ) {
				$('#applyBtnI').css("margin-left", "354px")
			} else {
				// 구름 실시간 움직임
				c1 = ( ( Math.random() * 1000 ) + 100 ) / 1000;
				c2 = ( ( Math.random() * 1000 ) + 100 ) / 1000;
				c3 = ( ( Math.random() * 1000 ) + 100 ) / 1000;
				c4 = ( ( Math.random() * 1000 ) + 100 ) / 1000;
				setInterval( loopCloud, 1);
			}

			// '데이트 신청하기' 버튼 클릭시
			$('#applyButton').click(function(){
				$('#popUp').load('./html/popUp_1.html', function() {
					$('#popUp').modal();
					$('#closeModal').css('top', '-305px' );
					$('#closeModal').css('right', '-40px' );

					// '데이트 신청하기' 팝업에서 이미지 클릭 시
					$('#popUp_1_gi').click(function(){
						$('#popUp_gift_border').css('display', 'block');
						$('#popUp_gift_border').css('top', "146px");
						$('#popUp_gift_border').css('left', "24px");
					});
					$('#popUp_2_gi').click(function(){
						$('#popUp_gift_border').css('display', 'block');
						$('#popUp_gift_border').css('top', "146px");
						$('#popUp_gift_border').css('left', "302px");
					});
					$('#popUp_3_gi').click(function(){
						$('#popUp_gift_border').css('display', 'block');
						$('#popUp_gift_border').css('top', "314px");
						$('#popUp_gift_border').css('left', "24px");
					});
					$('#popUp_4_gi').click(function(){
						$('#popUp_gift_border').css('display', 'block');
						$('#popUp_gift_border').css('top', "314px");
						$('#popUp_gift_border').css('left', "302px");
					});

					// '경품 선택하기' 후 넘어가는 팝업
					$('#applyPopup1_selectButton').click(function(){
						$('#popUp').empty();
						$('#popUp').load('./html/popUp_2.html', function() {
							$('#popUp').modal();
							$('#closeModal').css('top', '-391px' );
							$('#closeModal').css('right', '-46px' );
							// '문자 보내기' 후 넘어가는 팝업
							$('#applyPopup2_sendButton').click(function(){
								$('#popUp').empty();
								$('#popUp').load('./html/popUp_3.html', function() {
									$('#popUp').modal();
									$('#closeModal').css('top', '-349px' );
									$('#closeModal').css('right', '-46px' );
									// '완료' 후 넘어가는 팝업
									$('#applyPopup3_finButton').click(function(){
										$('#popUp').empty();
										$('#popUp').load('./html/popUp_4.html', function() {
											$('#popUp').modal();
											$('#closeModal').css('top', '-150px' );
											$('#closeModal').css('right', '-46px' );
											// '완료' 후 넘어가는 팝업
											$('#applyPopup4_finButton').click(function(){
												$('#popUp').empty();
												$('#popUp').load('./html/popUp_5.html', function() {
													$('#popUp').modal();
													$('#closeModal').css('top', '-283px' );
													$('#closeModal').css('right', '-79px' );
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
			$('#blogButton').click(function(){
				$('#popUp').empty();
				$('#popUp').load('./html/popUp_blog.html', function() {
					$('#popUp').modal();
					$('#closeModal').css('top', '-225px' );
					$('#closeModal').css('right', '-46px' );
				});
			});
		});
	}
});

function detectDevice(){
	if( navigator.userAgent.match(/Android/i)
		|| navigator.userAgent.match(/webOS/i)
		|| navigator.userAgent.match(/iPhone/i)
		|| navigator.userAgent.match(/iPad/i)
		|| navigator.userAgent.match(/iPod/i)
		|| navigator.userAgent.match(/BlackBerry/i)
		|| navigator.userAgent.match(/Windows Phone/i))
		return true;
	else
		return false;
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
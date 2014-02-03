// Must include 'jquery-2.1.0.min.js'
// Must include 'jquery-modal.min.js'
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

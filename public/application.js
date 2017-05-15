var g_board_root_url = 'http://pocket-api.madup.net:3000/';
var g_join_auth_url = 'http://pocket-dev.madup.net:8080/';
var yy = '';
var mm = '';
var dd = '';

//apk webview chromium에서 Array.reverse()를 지원하지 않아 만든 함수
function reverse_array(arr) {
 var result = [],
		 ii = arr.length;
 for (var i = ii - 1;i >= 0;i--) {
		 result.push(arr[i]);
 }
 return result;
}


function number_comma(number){
	return number.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
}

function sort_date(date_time) {
	yy = date_time.getFullYear().toString().substring(2,5);
	mm = (date_time.getMonth() + 1).toString();
	dd = date_time.getDate().toString();
	return yy + '.' + (mm[1] ? mm : '0' + mm[0]) + '.' + (dd[1] ? dd : '0' + dd[0]);
}

////////////////////////////////////////////////
//버튼 누를때 반응성 보이게 하는 함수 by hongs//
////////////////////////////////////////////////
function addClass(target,className) {
	$(target).addClass(className);
	event.preventDefault();
}

function removeClass(target,className) {
	$(target).removeClass(className);
}

function btnOn(target,className) {
	$("." + className).removeClass(className);
	$(target).addClass(className);
}
function touch(class_or_id,className) {
	$(class_or_id).on('touchstart',function(e,data){
		var target = e.target
		console.log("touchstart")
		console.log($(target).attr("class"))
		if ($(target).hasClass(className)){
			removeClass($(target),className);
		} else {
			addClass($(target),className);
		}
	});
	$(class_or_id).on('touchend',function(e,data){
		var target = e.target
		console.log("touchend")
		console.log($(target).attr("class"))
		if (!($(target).hasClass(className))){
			console.log(1)
			addClass($(target),className);
		} else {
			console.log(2)
			removeClass($(target),className);
		}
	});
}

//target element에 대해서 className이 touchable하고,클릭시 다른 element들은 className이 remove된다.
function onlyEventBtn(target_of_function,className,onTapEvent) {
	touchFunction(target_of_function,
		function touchStart(){
			console.log("touchstart")
			console.log($(target_of_function).attr("class"))
			if ($(target_of_function).hasClass(className)){
				removeClass($(target_of_function),className);
			} else {
				addClass($(target_of_function),className);
			}
		},
		function touchEnd(){
			console.log("touchend")
			console.log("className is ." + className)
			console.log($(target_of_function).attr("class"))
			console.log($(target_of_function).hasClass(className))
			if (!($(target_of_function).hasClass(className))){
				console.log(1)
				addClass($(target_of_function),className);
			} else {
				console.log(2)
				removeClass($(target_of_function),className);
			}
		}
	)
	tappable(target_of_function , {
		onTap: function(e, target){
			console.log("EVENT || Tappable event!")
			removeClass("." + className,className);
			addClass($(target),className);
			if ((onTapEvent!= null) && (onTapEvent!="")) {
				console.log($(target))
				onTapEvent(target)
			}
		}
	})
}

function eventBtn(target_of_function,className,tappable_event) {
	touch(target_of_function,className)
	tappable(target_of_function , {
		onTap: function(e, target){
			console.log("EVENT || Tappable event!")
			addClass($(target),className);
			if ((tappable_event!= null) && (tappable_event!="")) {
				tappable_event(target)
			}
		}
	})
}

function checkBtn(target_of_function,className,onEvent,offEvent) {
	touch(target_of_function,className)
	tappable(target_of_function , {
		onTap: function(e, target){
			if ($(target).attr("check") != "true"){
				addClass($(target),className);
				$(target).attr("check","true")
				if (onEvent!= null) {
					console.log("EVENT || Check OnEvent!")
					onEvent(target)
				}
			} else {
				removeClass($(target),className)
				$(target).attr("check","false")
				if (offEvent!= null) {
					console.log("EVENT || Check OffEvent!")
					offEvent(target)
				}
			}
		}
	})
}

function touchFunction(target,functionStart, functionEnd) {
	$(target).on('touchstart',function(target){
		if (functionStart==null){
		} else {
			functionStart(target);
		}
	});
	$(target).on('touchend',function(){
		if (functionEnd==null){
		} else {
			functionEnd(target);
		}
	});
}

//숫자만 입력하게 하는 기능들.. onkey down event 시에 발동한다!!
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9 || keyID == 16 || keyID ==17) 
			return;
	else
			return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39  || keyID == 9 || keyID == 16 || keyID ==17) 
			return;
	else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

function calc(classOrId, attribute, px){
	$(classOrId).each(function() {
		var original_px = $(this).css(attribute)
		$(this).css(attribute,"100%").css(attribute,"-=" + px)
		if ($(this).css(attribute).substr(0,1) == "-") {
			$(this).css(attribute,original_px)
		}
	})
}
function calc_half(classOrId, attribute, px){
	$(classOrId).each(function() {
		var original_px = $(this).css(attribute)
		$(this).css(attribute,"50%").css(attribute,"-=" + px/2)
		if ($(this).css(attribute).substr(0,1) == "-") {
			$(this).css(attribute,original_px)
		}
	})
}

(function(){

const ryan = document.querySelector('#ryan');
const face = document.querySelectorAll('.ears, .eyes, .muzzle');
const email = document.querySelector('input[type="text"]');
const password = document.querySelector('input[type="password"]');
const fauxInput = document.createElement('div');
const span = document.createElement('span');
let timer = null;

function rotate3d(x, y, z, rad) {
    const value = `rotate3d(${x}, ${y}, ${z}, ${rad}rad)`;
    for (let i=0; i < face.length; i++) {
        face[i].style.transform = value;
    }
}

function focus(event) {
    event.target.classList.add('focused');
    copyStyles(event.target);
    event.target.type === 'password' ? lookAway(event) : look(event);
}

function reset(event) {
    event.target.classList.remove('focused');
    ryan.classList.remove('playing');

    clearTimeout(timer);
    timer = setTimeout( () => {
        ryan.classList.remove('look-away', 'down', 'up');
        rotate3d(0,0,0,0);
    }, 1 );
}

function copyStyles(el) {
    const props = window.getComputedStyle(el, null);

    if ( fauxInput.parentNode === document.body ) {
        document.body.removeChild(fauxInput);
    }

    fauxInput.style.visibility = 'hidden';
    fauxInput.style.position = 'absolute';
    fauxInput.style.top = Math.min(el.offsetHeight * -2, -999) + 'px';

    for(let i=0; i < props.length; i++) {
        if (['visibility','display','opacity','position','top','left','right','bottom'].indexOf(props[i]) !== -1) {
            continue;
        }
        fauxInput.style[props[i]] = props.getPropertyValue(props[i]);
    }

    document.body.appendChild(fauxInput);
}

function look(event) {
    const el = event.target;
    const text = el.value.substr(0, el.selectionStart);

    span.innerText = text || '.';

    const ryanRect = ryan.getBoundingClientRect();
    const inputRect = el.getBoundingClientRect();
    const caretRect = span.getBoundingClientRect();
    const caretPos = caretRect.left + Math.min(caretRect.width, inputRect.width) * !!text;
    const distCaret = ryanRect.left + ryanRect.width/2 - inputRect.left - caretPos;
    const distInput = ryanRect.top + ryanRect.height/2 - inputRect.top;
    const y = Math.atan2(-distCaret, Math.abs(distInput)*3);
    const x =  Math.atan2(distInput, Math.abs(distInput)*3 / Math.cos(y));
    const angle = Math.max(Math.abs(x), Math.abs(y));

    rotate3d(x/angle, y/angle, y/angle/2, angle);
}

function lookAway(event) {
    const el = event.target;
    const ryanRect = ryan.getBoundingClientRect();
    const inputRect = el.getBoundingClientRect();
    const distInput = ryanRect.top + ryanRect.height/2 - inputRect.top;

    ryan.classList.add( 'look-away', distInput < 0 ? 'up' : 'down' );

    clearTimeout(timer);
    timer = setTimeout( () => {
        ryan.classList.add( 'playing' );
    }, 300);
}

fauxInput.appendChild(span);

email.addEventListener( 'focus', focus, false );
email.addEventListener( 'keyup', look, false );
email.addEventListener( 'click', look, false );
email.addEventListener( 'blur', reset, false );

password.addEventListener( 'focus', lookAway, false );
password.addEventListener( 'blur', reset, false );

})();

$("#_btnLogin").click(function() {
			if ($("#id").val().trim() == "") {
				alert("id를 입력해 주십시오");
				$("#id").focus();
			} else if ($("#pwd").val().trim() == "") {
				alert("password를 입력해 주십시오");
				$("#pwd").focus();
			} else {
				$("#frm").attr({
					"action" : "login",
                    "method": "post"
				}).submit();
			}
		});

		var user_id = $.cookie("user_id");
		if (user_id != null) { // 지정한 쿠키가 있을 때
			// alert("쿠키 있음");
			$("#id").val(user_id);
			$("#chk_save_id").attr("checked", "checked");
        }
        
		$("#chk_save_id").click(function() {

			if ($("#chk_save_id").is(":checked")) { // 체크 되었을 때
				//	alert("체크 됨");
				if ($("#id").val().trim() == "") {
					alert("id를 입력해 주십시오");
					$("#chk_save_id").prop("checked", false);
				} else { // 정상 기입한 경우
					// 쿠키 저장
					$.cookie("user_id", $("#id").val().trim(), {
						expires : 7,
						path : './'
					});
				}
			} else {
				//	alert("체크 없어짐");
				$.removeCookie("user_id", {
					path : './'
				});
			}

		});
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp"%>


<script type="text/javascript">
$(document).ready(function(){
	$('table .ans').hide();
	$('table .title').click(function(){
		var toggleAction = $(this).next('table .ans').toggle()
		var toggleActionCss = $(this).toggleClass('current')

		if($(this).next('table .ans') !== null){
			toggleAction();
			toggleActionCss();
		} else {}
	})
});
</script>

<!-- content 영역 -->
<div class="containerWrap qna">
	<div class="container_inner">
		<div class="cont1 content clearfix">
			<div class="inner">
				<h2>자주하는 질문</h2>
				<div class="qnaWrap">
					<table>
						<tr class="title">
							<td>
								베이비시터 교육은 믿을만하게 진행되나요?
								<p>Oh My Baby</p>
							</td>
						</tr>
						<tr class="ans">
							<td conspan="0">
								<div class="fr-view text-left">
									<div class="forum-write w740">
										<p>
											당사 시터로 소속되어 활동하시는 건 프로가 되는 겁니다.<br>&nbsp; &nbsp; 동네에서
											옆집아이나 친척아이를 돌봐주는 것이 아니라 정당한 보수를<br>&nbsp; &nbsp;받고 일을
											하시기 때문에 내아이를 키워본 경험 만으로는 부족합니다.<br>
											<br>&nbsp; &nbsp; 특히 요새는 아이가 대부분 하나인 가정이 많으며 육아 방법이나<br>
											&nbsp; &nbsp;새로운 육아용품도 많습니다.<br>
											<br>&nbsp; &nbsp; 당사 교육이외에도 열심히 활동하시는 주부님들은 유아 마사지,
											종이접기등<br>&nbsp; &nbsp;특기 교육을 따로 받으시어 열심으로 활동하시는 분들도
											많습니다.<br>
											<br>&nbsp; &nbsp; 당사에서 일을 알선하여 드리기는 하지만<br> &nbsp;
											&nbsp;아이를 돌보는 일이므로 잘하시는 분을 선호하고 찾으시는 부모의 마음을<br> &nbsp;
											&nbsp;헤아리신 다면 교육의 필요성은 더 말씀드리지 않아도 이해하시리라<br>&nbsp;
											&nbsp;생각됩니다.
										</p>
									</div>
								</div>
							</td>
						</tr>
						<tr class="title">
							<td>
								시터가 하시는 일의 영역은 어디까지 인가요?
								<p>Oh My Baby</p>
							</td>
						</tr>
						<tr class="ans">
							<td conspan="0">
								<div class="fr-view text-left">
									<div class="forum-write w740">
										<p>
											당사 시터로 소속되어 활동하시는 건 프로가 되는 겁니다.<br>&nbsp; &nbsp; 동네에서
											옆집아이나 친척아이를 돌봐주는 것이 아니라 정당한 보수를<br>&nbsp; &nbsp;받고 일을
											하시기 때문에 내아이를 키워본 경험 만으로는 부족합니다.<br>
											<br>&nbsp; &nbsp; 특히 요새는 아이가 대부분 하나인 가정이 많으며 육아 방법이나<br>
											&nbsp; &nbsp;새로운 육아용품도 많습니다.<br>
											<br>&nbsp; &nbsp; 당사 교육이외에도 열심히 활동하시는 주부님들은 유아 마사지,
											종이접기등<br>&nbsp; &nbsp;특기 교육을 따로 받으시어 열심으로 활동하시는 분들도
											많습니다.<br>
											<br>&nbsp; &nbsp; 당사에서 일을 알선하여 드리기는 하지만<br> &nbsp;
											&nbsp;아이를 돌보는 일이므로 잘하시는 분을 선호하고 찾으시는 부모의 마음을<br> &nbsp;
											&nbsp;헤아리신 다면 교육의 필요성은 더 말씀드리지 않아도 이해하시리라<br>&nbsp;
											&nbsp;생각됩니다.
										</p>
									</div>
								</div>
							</td>
						</tr>
						<tr class="title">
							<td>
								베이비시터가 마음에 들지 않으면 어떻게 하나요?
								<p>Oh My Baby</p>
							</td>
						</tr>
						<tr class="ans">
							<td conspan="0">
								<div class="fr-view text-left">
									<div class="forum-write w740">
										<p>
											당사 시터로 소속되어 활동하시는 건 프로가 되는 겁니다.<br>&nbsp; &nbsp; 동네에서
											옆집아이나 친척아이를 돌봐주는 것이 아니라 정당한 보수를<br>&nbsp; &nbsp;받고 일을
											하시기 때문에 내아이를 키워본 경험 만으로는 부족합니다.<br>
											<br>&nbsp; &nbsp; 특히 요새는 아이가 대부분 하나인 가정이 많으며 육아 방법이나<br>
											&nbsp; &nbsp;새로운 육아용품도 많습니다.<br>
											<br>&nbsp; &nbsp; 당사 교육이외에도 열심히 활동하시는 주부님들은 유아 마사지,
											종이접기등<br>&nbsp; &nbsp;특기 교육을 따로 받으시어 열심으로 활동하시는 분들도
											많습니다.<br>
											<br>&nbsp; &nbsp; 당사에서 일을 알선하여 드리기는 하지만<br> &nbsp;
											&nbsp;아이를 돌보는 일이므로 잘하시는 분을 선호하고 찾으시는 부모의 마음을<br> &nbsp;
											&nbsp;헤아리신 다면 교육의 필요성은 더 말씀드리지 않아도 이해하시리라<br>&nbsp;
											&nbsp;생각됩니다.
										</p>
									</div>
								</div>
							</td>
						</tr>
						<tr class="title">
							<td>
								시터들의 신원과 건강상태를 맏을 수 있나요?
								<p>Oh My Baby</p>
							</td>
						</tr>
						<tr class="ans">
							<td conspan="0">
								<div class="fr-view text-left">
									<div class="forum-write w740">
										<p>
											당사 시터로 소속되어 활동하시는 건 프로가 되는 겁니다.<br>&nbsp; &nbsp; 동네에서
											옆집아이나 친척아이를 돌봐주는 것이 아니라 정당한 보수를<br>&nbsp; &nbsp;받고 일을
											하시기 때문에 내아이를 키워본 경험 만으로는 부족합니다.<br>
											<br>&nbsp; &nbsp; 특히 요새는 아이가 대부분 하나인 가정이 많으며 육아 방법이나<br>
											&nbsp; &nbsp;새로운 육아용품도 많습니다.<br>
											<br>&nbsp; &nbsp; 당사 교육이외에도 열심히 활동하시는 주부님들은 유아 마사지,
											종이접기등<br>&nbsp; &nbsp;특기 교육을 따로 받으시어 열심으로 활동하시는 분들도
											많습니다.<br>
											<br>&nbsp; &nbsp; 당사에서 일을 알선하여 드리기는 하지만<br> &nbsp;
											&nbsp;아이를 돌보는 일이므로 잘하시는 분을 선호하고 찾으시는 부모의 마음을<br> &nbsp;
											&nbsp;헤아리신 다면 교육의 필요성은 더 말씀드리지 않아도 이해하시리라<br>&nbsp;
											&nbsp;생각됩니다.
										</p>
									</div>
								</div>
							</td>
						</tr>
						<tr class="title">
							<td>
								시터는 어디까시 일을 해주시나요?
								<p>Oh My Baby</p>
							</td>
						</tr>
						<tr class="ans">
							<td conspan="0">
								<div class="fr-view text-left">
									<div class="forum-write w740">
										<p>
											당사 시터로 소속되어 활동하시는 건 프로가 되는 겁니다.<br>&nbsp; &nbsp; 동네에서
											옆집아이나 친척아이를 돌봐주는 것이 아니라 정당한 보수를<br>&nbsp; &nbsp;받고 일을
											하시기 때문에 내아이를 키워본 경험 만으로는 부족합니다.<br>
											<br>&nbsp; &nbsp; 특히 요새는 아이가 대부분 하나인 가정이 많으며 육아 방법이나<br>
											&nbsp; &nbsp;새로운 육아용품도 많습니다.<br>
											<br>&nbsp; &nbsp; 당사 교육이외에도 열심히 활동하시는 주부님들은 유아 마사지,
											종이접기등<br>&nbsp; &nbsp;특기 교육을 따로 받으시어 열심으로 활동하시는 분들도
											많습니다.<br>
											<br>&nbsp; &nbsp; 당사에서 일을 알선하여 드리기는 하지만<br> &nbsp;
											&nbsp;아이를 돌보는 일이므로 잘하시는 분을 선호하고 찾으시는 부모의 마음을<br> &nbsp;
											&nbsp;헤아리신 다면 교육의 필요성은 더 말씀드리지 않아도 이해하시리라<br>&nbsp;
											&nbsp;생각됩니다.
										</p>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="./include/footer.jsp"%>
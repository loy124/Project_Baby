<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./include/header.jsp"%>
<style>
@import url("//unpkg.com/element-ui@2.13.0/lib/theme-chalk/index.css");

.el-carousel__item h3 {
	color: #475669;
	font-size: 14px;
	opacity: 0.75;
	line-height: 200px;
	margin: 0;
}

.el-carousel__item:nth-child(2n) {
	background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n+1) {
	background-color: #d3dce6;
}

.el-carousel__container {
	height: 400px !important;
}

.text {
	font-size: 14px;
}

.item {
	margin-bottom: 18px;
}

.clearfix:before, .clearfix:after {
	display: table;
	content: "";
}

.clearfix:after {
	clear: both
}

.box-card {
	width: 300px;
	margin-left: 20px;
	margin-top: 30px;
}

.box-card-wrapper {
	margin-top: 40px;
}

.box-card-wrapper:last-of-type {
	margin-bottom: 40px;
}

.box-container {
	display: flex;
	justify-content: center;
}

.baby-welcome {
	display: flex;
	margin-top: 60px;
	padding-bottom: 60px;
}

.baby-welcome-text {
	margin-left: 20px;
}
</style>

<script src="//unpkg.com/vue/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.13.0/lib/index.js"></script>
<div id="app">
	<div>
		<template> <el-divider></el-divider>
		<div>Oh My Baby 프로젝트 연대기</div>
		<div style="margin-left: 40px;" class="block">
			<el-timeline> <el-timeline-item
				v-for="(activity, index) in activities" :key="index"
				:icon="activity.icon" :type="activity.type" :color="activity.color"
				:size="activity.size" :timestamp="activity.timestamp">
			{{activity.content}} </el-timeline-item> </el-timeline>
		</div>
		</template>
	</div>
</div>

<%@ include file="./include/footer.jsp"%>

<script>
/* new Vue().$mount('#app'); */
let app1 = new Vue({
	el: "#app",
	data() {
		return{
			lists:[{img: "https://cdn.pixabay.com/photo/2013/02/21/19/10/mother-84628_1280.jpg"},
			{img: "https://cdn.pixabay.com/photo/2012/03/04/01/01/baby-22194_1280.jpg"},	
				{img: "https://cdn.pixabay.com/photo/2018/03/28/04/59/child-3268265_1280.jpg"}],
				 activities: [{
			          content: 'Oh-my-baby 프로젝트 종료',
			          timestamp: '2020-02-21 17:00',
			          size: 'large',
			          type: 'primary',
			          icon: 'el-icon-more'
			        }, {
			          content: '프로젝트 진행중',
			          timestamp: '2020-02-10 12:46',
			          color: '#0bbd87'
			        }, {
			          content: 'Oh-My-Baby 탄생',
			          timestamp: '2020-02-05 12:46',
			          size: 'large',
			          color: '#0bbd87'
			        }, {
			          content: '팀프로젝트 시작',
			          timestamp: '2020-02-04 10:00',
			          color: '#0bbd87'
			        }],
			         users:[{
			        	name: "홍길동",
			        	star: "⭐⭐⭐⭐⭐",
			        	review: "너무 친절하게 돌봐주세요"
			        },
			        {
			        	name: "일지매",
			        	star: "⭐⭐⭐⭐⭐",
			        	review: "너무 친절"
			        },
			        {
			        	name: "정수동",
			        	star: "⭐⭐⭐⭐⭐",
			        	review: "너무 친절하게 돌봐주세요"
			        }, 
			        {
			        	name: "정보라",
			        	star: "⭐⭐⭐⭐⭐",
			        	review: "너무 친절하게 돌봐주세요"
			        }, {
			        	name: "이민제",
			        	star: "⭐⭐⭐⭐⭐",
			        	review: "너무 친절하게 돌봐주세요"
			        }, {
			        	name: "방경률",
			        	star: "⭐⭐⭐⭐⭐",
			        	review: "너무 친절하게 돌봐주세요"
			        },       {
			        	name: "황밝으리",
			        	star: "⭐⭐⭐⭐⭐",
			        	review: "너무 친절하게 돌봐주세요"
			        }, 
			        {
			        	name: "이온유",
			        	star: "⭐⭐⭐⭐⭐",
			        	review: "너무 친절하게 돌봐주세요"
			        },
			        {
			        	name: "김아무개",
			        	star: "⭐⭐⭐⭐⭐",
			        	review: "너무 친절하게 돌봐주세요"
			        }] 
		}
	}
}); 
</script>
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
  .el-carousel__container{
  	height: 400px !important;
  }
  
  .text {
    font-size: 14px;
  }

  .item {
    margin-bottom: 18px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }

  .box-card {
    width: 300px;
    margin-left: 20px;
  }
  .box-card-wrapper{
  margin-top:40px;
  }
  
  .box-card-wrapper:last-of-type {
	margin-bottom:40px;
}
  

</style>
<!-- content 영역 -->
<%
	// BabyMemberDto babyMemberDto = (BabyMemberDto)session.getAttribute("login");
	if (babyMemberDto != null) {
		System.out.println("로그인후 dto" + babyMemberDto.toString());
		if (babyMemberDto.getAuth() == 1) {
%>
<script>
	location.href = "admin?type=moveAdmin";
</script>
<%
	}
	}
%>

<script src="//unpkg.com/vue/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.13.0/lib/index.js"></script>
<div id="app">
<div>
<template>
  <el-carousel :interval="4000" type="card" height="200px">
    <el-carousel-item  v-for="list in lists" :key="item">
      <!-- <h3 class="medium">{{ item }}</h3> -->
      <img style="width: 100%; height: auto;" :src="list.img">
    </el-carousel-item>
  </el-carousel>
</template>

</div>
<div>
이게 베이비시터지ㅋㅋㅋ
</div>

<div class="box-container">
<div class="box-card-wrapper" style="display: flex; justify-content: center">
<el-card class="box-card">
  <div slot="header" class="clearfix">
    <span>Card name</span>
  </div>
  <div v-for="o in 4" :key="o" class="text item">
    {{'List item ' + o }}
  </div>
</el-card>
<el-card class="box-card">
  <div slot="header" class="clearfix">
    <span>Card name</span>
  </div>
  <div v-for="o in 4" :key="o" class="text item">
    {{'List item ' + o }}
  </div>
</el-card>
<el-card class="box-card">
  <div slot="header" class="clearfix">
    <span>Card name</span>
  </div>
  <div v-for="o in 4" :key="o" class="text item">
    {{'List item ' + o }}
  </div>
</el-card>
</div>

<div class="box-card-wrapper" style="display: flex; justify-content: center">
<el-card class="box-card">
  <div slot="header" class="clearfix">
    <span>Card name</span>
  </div>
  <div v-for="o in 4" :key="o" class="text item">
    {{'List item ' + o }}
  </div>
</el-card>
<el-card class="box-card">
  <div slot="header" class="clearfix">
    <span>Card name</span>
  </div>
  <div v-for="o in 4" :key="o" class="text item">
    {{'List item ' + o }}
  </div>
</el-card>
<el-card class="box-card">
  <div slot="header" class="clearfix">
    <span>Card name</span>
  </div>
  <div v-for="o in 4" :key="o" class="text item">
    {{'List item ' + o }}
  </div>
</el-card>
</div>
</div>

<div>Oh My Baby 프로젝트 연대기</div>
<div style="margin-left:40px;" class="block">
  <el-timeline>
    <el-timeline-item
      v-for="(activity, index) in activities"
      :key="index"
      :icon="activity.icon"
      :type="activity.type"
      :color="activity.color"
      :size="activity.size"
      :timestamp="activity.timestamp">
      {{activity.content}}
    </el-timeline-item>
  </el-timeline>
</div>

</div>
<!-- <div class="containerWrap main">
	<div class="container_inner">
		필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!!
		<div class="cont1 content clearfix" style="background-color: #ccc;">
		
		
		</div>
		<div class="cont2 content clearfix" style="background-color: #eee;"></div>
		<div class="cont3 content clearfix" style="background-color: #ccc;"></div>
	</div>
</div> -->
<!--// container -->


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
			          timestamp: '2018-04-12 20:46',
			          size: 'large',
			          type: 'primary',
			          icon: 'el-icon-more'
			        }, {
			          content: '프로젝트 진행중',
			          timestamp: '2018-04-03 20:46',
			          color: '#0bbd87'
			        }, {
			          content: 'Oh-My-Baby 탄생',
			          timestamp: '2018-04-03 20:46',
			          size: 'large',
			          color: '#0bbd87'
			        }, {
			          content: '팀프로젝트 시작',
			          timestamp: '2018-04-03 20:46',
			          color: '#0bbd87'
			        }]
		}
	}
}); 
</script>
<%@page import="commission.CommissionDao"%>
<%@page import="commission.CommissionDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<%@ include file="./include/header.jsp"%>

<%
	int money = CommissionDao.getInstance().getCommision();

	String dataType = "";
%>
<%-- <table class="table table-condensed">
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>돈</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<th><%=i + 1%></th>
				<td><%=list.get(i).getId()%></td>
				<td><%=list.get(i).getCommission()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table> --%>
<div style="display:flex; justify-content: center;">
<div style="width: 800px">
	<canvas id="myChart"></canvas>
</div>
</div>

<script>
const chartData = [];
let chartD;

let commission1 = "";
let commission;

let id1 = "";
let id;

$(document).ready(function(){
	
	$.ajax({
		url: "./admin",
		type:"get",
		data: {
			"type" : "chart",
		},
		success: function(data){
			console.log(data);
			chartD = data;
		
			chartD.map((d) => {
				chartData.push(d);
				console.log(d.commission);
				(commission1 = commission1 +","+ d.commission);
				id1 = id1 +"," + d.id
			});
			console.log("commission1=" + commission1);
			commission1 = commission1.substring(1, commission1.length);
			commission = commission1.split(",");
			console.log(commission);
			
			id1 = id1.substring(1, id1.length);
			id = id1.split(",");
			
			// 우선 컨텍스트를 가져옵니다. 
			var ctx = document.getElementById("myChart").getContext('2d');
			/*
			- Chart를 생성하면서, 
			- ctx를 첫번째 argument로 넘겨주고, 
			- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
			*/
			var myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: id,
			        datasets: [{
			            label: '누적 커미션(ID별)',
			            data: commission,
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255,99,132,1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        }
			    }
			});
		}
		
	})
	/* console.log(chartData); */
	/* console.log(str) */
	});
	
	




</script>

<%@ include file="./include/footer.jsp"%>

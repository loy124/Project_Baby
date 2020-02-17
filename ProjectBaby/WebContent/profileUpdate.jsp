<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 수정 양식</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
/* 파일 업로드 디자인 */

.btn-file{
  position: relative;
  overflow: hidden;
}
.btn-file input[type=file]{
  position: absolute;
  top: 0;
  right: 0;
  min-width: 100%;
  min-height: 100%;
  font-size: 100px;
  text-align: right;
  filter: alpha(opacity=0);
  opacity: 0;
  outline: none;
  background: white;
  cursor: inherit;
  display: block;
}

</style>


</head>
<body>
	<form method="post" action="./userProfile"
		enctype="multipart/form-data">
		<!--  action 수정필요 -->
		<table style="text-align: center; border: 1px solid black;">


			<tr>
				<td style="width: 300px; font-size: 14px;">	<span class="btn btn-default btn-file">이 곳을 눌러 이미지를 업로드하세요.	
				<input type="file" name="userProfile"></span>
				</td>
			</tr>
<!-- 			<tr>
				<td>
				<span class="btn btn-default btn-file">
				<input type="file" name="userProfile"></span>
				</td>
			</tr> -->
		</table>
<p align=left>		
<input class="btn" type="submit" value="등록">
</p>
	</form>


</body>
</html>
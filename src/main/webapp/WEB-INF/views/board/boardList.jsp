<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		$j("#checkAll").click(function(){
			if($j("#checkAll").prop("checked")){
				console.log("체크 성공");
				$j(".typeCk").prop("checked", true);
			}else{
				console.log("체크 해제");
				$j(".typeCk").prop('checked',false);
			}
		});

		var codeNameLength = ${fn:length(codeName)};
			
/* 한개 체크박스 해제 시 전체 체크박스 해제 */
		$j(".typeCk").click(function(){
			if($j("input[name='codeId']:checked").length == codeNameLength){
				$j("#checkAll").prop("checked", true);
			}else{
				$j("#checkAll").prop("checked", false);
			}
		});	
		$j("#btnSearch").click(function(){
			console.log("조회");
			$j('#selectType').submit();
		}); 
	});

</script>
<body>
<form id="selectType" class="selectType" method="get" action="/board/boardList.do">
<table  align="center">
	<tr>
		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							${list.codeName}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">글쓰기</a>
		</td>
	</tr>
	<tr>
		<td align ="left">
			<input type="checkbox" id="checkAll" name = "checkAll" value = "all">전체
							<c:forEach var="codeList" items="${codeList}">
							<input type="checkbox" class="typeCk" name = "codeId"  value = "${codeList.codeId}"/>${codeList.codeName}
 					  		</c:forEach>
		<input id="btnSearch" type="button" value="조회">
		
		
		</td>
	</tr>
</table>	
</form>
</body>
</html>
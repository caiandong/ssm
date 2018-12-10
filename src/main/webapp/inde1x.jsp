<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="ff" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="cc" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
		 <form class="form-horizontal">		 		
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="inputEmail3" name="empName" placeholder="张三" aria-describedby="helpBlock2">
			      <span id="helpBlock2" class="help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
			    </div>
			  </div>
			  <div class="form-group">
			   	<label for="inputEmail3" class="col-sm-2 control-label">性别</label>
			    <div class="col-sm-10">
			      	<label class="radio-inline">
					  <input type="radio" name="gender" id="inlineRadio1" value="'M'">男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="inlineRadio2" value="'F'">女
					</label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">邮箱</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="inputPassword3" name="email" placeholder="sdsdd@dsads.com">
			      <span id="helpBlock2" class="help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
			    </div>
			  </div>
			  <div class="form-group">
			  	<label for="inputEmail3" class="col-sm-2 control-label">部门</label>
			  	<div class="col-sm-3">
				    <select class="form-control" name="dId">
					  <option>1</option>
					  <option>2</option>
					  <option>3</option>
					  <option>4</option>
					  <option>5</option>
					</select>
				</div>
			  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</div>
<div class="text-center">
<button type="button" class="btn btn-primary btn-lg " data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>
</div>
<ff:form>
	<button>sdda</button>
</ff:form>
<cc:forEach  begin="1" end="5" var="s">
	${s}
</cc:forEach>
<a id="5"></a>
<script type="text/javascript">
/* alert($("a").attr("id")); */

</script>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
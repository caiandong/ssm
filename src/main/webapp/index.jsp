<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="ss" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

<div class="container">
	<div class="row col-md-12 text-left">
		<h1>员工管理</h1>
	</div>
	<div class="row">
		<table class="table  col-md-10" id="tab1"> 
		<thead>
		  <tr>
		  	<th># </th>
		    <th>id </th>
		    <th>姓名</th>
		    <th>姓别</th>
		    <th>邮件</th>	    
		    <th>部门</th>
		    
		  </tr>	
		</thead>
		  <tbody>
		  	
		  </tbody> 
		</table>
	</div>	
	<div class="row col-md-12 text-right">
		<nav aria-label="Page navigation">
			<div id="allpage"></div>
			<div id="allnum"></div>
			<input  type="checkbox"></input>
		  	<ul class="pagination">	  	
		    	<li>
		      		<a href="#" aria-label="Previous">
		        		<span aria-hidden="true">首页</span>
		      		</a>
		    	</li>
		    <li id="id1">
		    <a href="#">1</a></li>
		    <li id="id2"><a href="#">2</a></li>
		    <li id="id3"><a href="#">3</a></li>
		    <li id="id4"><a href="#">4</a></li>
		    <li id="id5"><a href="#">5</a></li>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">尾页</span>
		      </a>
		    </li>
		    <button class="btn btn-default" id="new">新增</button>
			<button class="btn btn-default" id="delete">删除</button>
		  </ul>	  		
		</nav>		
	</div>
</div>
<br>

<div class="row">


</div>
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
			    <div id="no1" class="col-sm-5">
			      <input type="text" class="form-control" id="inputEmail3" name="empName" placeholder="张三">	
			      <span id="helpBlock2" class="help-block">A block of help text that breaks onto a new line and may extend</span>	      			      
			    </div>
			   		    
			  </div>
			  <div class="form-group">
			   	<label for="inputEmail3" class="col-sm-2 control-label">性别</label>
			    <div class="col-sm-10">
			      	<label class="radio-inline">
					  <input type="radio" name="gender" id="inlineRadio1" value="M">男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="inlineRadio2" value="F">女
					</label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">邮箱</label>
			    <div id="no2" class="col-sm-8 ">
			      <input type="text" class="form-control" id="inputPassword3" name="email" placeholder="sdsdd@dsads.com">			      
			      <span id="helpBlock2" class="help-block">A block of help text that breaks onto a new line and may extend</span>	 	 
			    </div>			    
			  </div>
			  <div class="form-group">
			  	<label for="inputEmail3" class="col-sm-2 control-label">部门</label>
			  	<div class="col-sm-3">
				    <select class="form-control" name="dId">
					  
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
<script type="text/javascript">
var cunpage=0;
var allnum=0;
	$(function(){
		ajks(1);
		
	});
	
		function ajks(page){
			$.ajax({
				url:"${pageContext.request.contextPath}/select/"+page,
				type:"get",
				success:function(re){
					creat_ta(re);
				}
			});
		}
		function ajkd(num){
			$.ajax({
				url:"${pageContext.request.contextPath}/delete/"+num,
				type:"delete",
				success:function(re){
					ajks(cunpage);
					//alert(re.mess);
				}
			});
		}
		// <span id="helpBlock2" class="help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span> has-success
		$("#myModal button.btn-primary").click(function(){
			/* $('#myModal form')[0].reset(); */
			$('#myModal div[id]').removeClass("has-error has-success");
			$.ajax({
				url:"${pageContext.request.contextPath}/insert",
				type:"post",
				data:$("#myModal form").serialize(),
				success:function(result){
					
					$('#myModal #no1 span').text(result.empName);
					$('#myModal #no2 span').text(result.email);
					$("#myModal form #no1").addClass(result.stuempName);
					
					$("#myModal form #no2").addClass(result.stuemail); 
					
					if(result.mess=="添加失败")
						return
					$("#myModal").modal('hide');
					ajks(allnum);
					}								
				});
			
		});
		$("nav button[id='new']").click(function(){
			$('#myModal form').get(0).reset();
			$('#myModal select').empty(); 
			$('#myModal span').empty();
			$("#myModal form div div").removeClass("has-error has-success")
			$('#myModal').modal({backdrop:'static'});
			
			$.ajax({
				url:"${pageContext.request.contextPath}/dep",
				type:"get",
				success:function(result){
					$.each(result.dep,function(i,item){
						/* $('#myModal select').append("<option></option>").text val(item.deptId)  attr("value",item.deptId)*/
						$("<option></option>").text(item.deptName).attr("value",item.deptId).appendTo('#myModal select');						
					});
					
					
				}			
		});
	});	
		$("nav input").click(function(){
			
			if($(this).prop("checked"))
				{
				
				$("tbody tr td input").prop("checked",true);
				}
			else{
				
				$("tbody tr td input").prop("checked",false);
			}
		});
		$("tbody").on("mouseenter","tr",function(e){			 
			var bu1=$("<button></button>").addClass("btn btn-default").attr("type","button").text("修改");
			var bu2=$("<button></button>").addClass("btn btn-default").attr("type","button").text("删除");
			
			var div=$("<div></div>").addClass("btn-group").attr({role: "group"}).append(bu1).append(bu2);
			$("<td></td>").append(div).appendTo(this);
			$(bu2).click(function(){
				var x=$(this).parent().parent().parent().children().eq(1).attr("id");
				
				ajkd(x);
			});
		});
		  $("tbody").on("mouseleave ","tr",function(){			
				$(this).children().find("div").parent().remove();				
		});  
		  $("nav ul li").first().click(function(){
			  ajks(1);
		  });
		 
		  $.each($("nav ul li[id]"),function(i,item){
			 $(item).on("click",function(){
				 var n=$(this).children().text();
				 ajks(n);
			 })
		  });
	
	function creat_ta(re){
		$("tbody").empty();
		$("nav ul li[id]").removeClass("active");
		$("nav div[id]").empty();
		cunpage=re.cnum;
		/* var sss=$("nav ul li[id='id3']").addClass("active").children().; */
		$.each($("nav ul li[id]"),function(i,item){
			$(item).children().text(re.ff+i);
			if(re.ff+i==re.cnum)
				$(item).addClass("active");
		})
		 $("nav ul li").last().click(function(){
			  ajks(re.allnum);
		  });
		/* alert(sss[0]); */
		$("nav div[id='allpage']").append("共:").append(re.allpage).append("页");
		$("nav div[id='allnum']").append("总记录:").append(re.allnum).append("条");
		allnum=re.allnum;
		$.each(re.list,function(i,item){
			var checkbox=$("<input></input>	").attr("type","checkbox");
			var p0=$("<td></td>").append(checkbox);
			var p1=$("<td></td>").append(item.empId).attr("id",item.empId);
			var p2=$("<td></td>").append(item.empName);
			var p3=$("<td></td>").append(item.gender=='M'?"男":"女");
			var p4=$("<td></td>").append(item.email);
			var p5=$("<td></td>").append(item.department.deptName);
	
			$("<tr></tr>").append(p0).append(p1).append(p2).append(p3).append(p4).append(p5).appendTo("tbody"); 
			
		})
	}
	function nextpage(num){
		
	}
</script>

<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
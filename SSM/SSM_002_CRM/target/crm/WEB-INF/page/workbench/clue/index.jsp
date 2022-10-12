<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">

	<meta charset="UTF-8">

	<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" type="text/css" href="jquery/bs_pagination-master/css/jquery.bs_pagination.min.css">

	<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>

	<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript" src="jquery/bs_pagination-master/js/jquery.bs_pagination.min.js"></script>
	<script type="text/javascript" src="jquery/bs_pagination-master/localization/en.js"></script>


<%--	<script type="text/javascript">

		$(function(){
			//给"创建"按钮添加单击事件
			$("#createClueBtn").click(function () {
				//初始化工作
				$("#createClueForm")[0].reset();
				//弹出模态窗口
				$("#createClueModal").modal("show");
			});

			//给"保存"按钮添加单击事件
			$("#saveCreateClueBtn").click(function () {
				//收集参数
				var fullname       =$.trim($("#create-fullname").val());
				var appellation    =$("#create-appellation").val();
				var owner          =$("#create-owner").val();
				var company        =$.trim($("#create-company").val());
				var job            =$.trim($("#create-job").val());
				var email          =$.trim($("#create-email").val());
				var phone          =$.trim($("#create-phone").val());
				var website        =$.trim($("#create-website").val());
				var mphone         =$.trim($("#create-mphone").val());
				var state          =$("#create-state").val();
				var source         =$("#create-source").val();
				var description    =$.trim($("#create-description").val());
				var contactSummary =$.trim($("#create-contactSummary").val());
				var nextContactTime=$.trim($("#create-nextContactTime").val());
				var address        =$.trim($("#create-address").val());
				//表单验证(作业)
				//带*非空
				//正则表达式验证

				//发送请求
				$.ajax({
					url:'workbench/clue/saveCreateClue.action',
					data:{
						fullname       :fullname       ,
						appellation    :appellation    ,
						owner          :owner          ,
						company        :company        ,
						job            :job            ,
						email          :email          ,
						phone          :phone          ,
						website        :website        ,
						mphone         :mphone         ,
						state          :state          ,
						source         :source         ,
						description    :description    ,
						contactSummary :contactSummary ,
						nextContactTime:nextContactTime,
						address        :address
					},
					type:'post',
					dataType:'json',
					success:function (data) {
						if(data.code=="1"){
							//关闭模态窗口
							$("#createClueModal").modal("hide");
							//刷新线索列表，显示第一页数据，保持每页显示条数不变(作业)

						}else{
							//提示信息
							alert(data.message);
							//模态窗口不关闭
							$("#createClueModal").modal("show");
						}
					}
				});
			});


		});

	</script>--%>
	<script type="text/javascript">
		$(function(){

			selectClueByConditionForPage(1,5);
			//查询
			$("#selectpartBtn").click(function () {

				selectClueByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
			});

			$("#chckAll").click(function () {
				$("#tBody input[type='checkbox']").prop("checked",this.checked);
			});

			$("#tBody").on("click","input[type='checkbox']",function () {
				//如果列表中的所有checkbox都选中，则"全选"按钮也选中
				if($("#tBody input[type='checkbox']").size()==$("#tBody input[type='checkbox']:checked").size()){
					$("#chckAll").prop("checked",true);
				}else{//如果列表中的所有checkbox至少有一个没选中，则"全选"按钮也取消
					$("#chckAll").prop("checked",false);
				}
			});
	//给"创建"按钮添加单击事件
			$("#createClueBtn").click(function () {
				//初始化工作
				//重置表单
				$("#createClueForm").get(0).reset();

				//弹出创建市场活动的模态窗口
				$("#createClueModal").modal("show");
			});

			//给"保存"按钮添加单击事件
			$("#saveCreateClueBtn").click(function () {
				//收集参数
				var owner=$("#create-clueOwner").val();
				var company=$.trim($("#create-company").val());
				var appellation=$.trim($("#create-call").val());
				var fullname=$.trim($("#create-surname").val());
				var job=$.trim($("#create-job").val());
				var email=$.trim($("#create-email").val());
				var phone=$.trim($("#create-phone").val());
				var website=$.trim($("#create-website").val());
				var mphone=$.trim($("#create-mphone").val());
				var state=$("#create-status").val();
				var source=$("#create-source").val();
				var description=$.trim($("#create-describe").val());
				var contactSummary=$.trim($("#create-contactSummary").val());
				var nextContactTime=$.trim($("#create-nextContactTime").val());
				var address=$.trim($("#create-address").val());

				//表单验证
				if(owner==""){
					alert("所有者不能为空");
					return;
				}
				if(company==""){
					alert("公司不能为空");
					return;
				}
				if(fullname==""){
					alert("姓名不能为空");
					return;
				}

				//发送请求
				$.ajax({
					url:'workbench/clue/insertClue.action',
					data:{
						owner:owner,
						company:company,
						appellation:appellation,
						fullname:fullname,
						job:job,
						email:email,
						phone:phone,
						website:website,
						mphone:mphone,
						state:state,
						source:source,
						description:description,
						contactSummary:contactSummary,
						nextContactTime:nextContactTime,
						address:address
					},
					type:'post',
					dataType:'json',
					success:function (data) {
						if(data.code=="1"){
							//关闭模态窗口
							$("#createClueModal").modal("hide");
							//刷新市场活动列，显示第一页数据，保持每页显示条数不变(保留)
							selectClueByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
						}else{
							alert(data.message);
							$("#createClueModal").modal("show");
						}
					}
				});
			});


			//删除
			$("#deleteClueBtn").click(function () {
				//收集参数
				//获取列表中所有被选中的checkbox
				var chekkedIds=$("#tBody input[type='checkbox']:checked");
				if(chekkedIds.size()==0){
					alert("请选择要删除的市场活动");
					return;
				}

				if(window.confirm("确定删除吗？")){
					var ids="";
					$.each(chekkedIds,function () {//id=xxxx&id=xxx&.....&id=xxx&
						ids+="id="+this.value+"&";
					});
					ids=ids.substr(0,ids.length-1);//id=xxxx&id=xxx&.....&id=xxx

					//发送请求
					$.ajax({
						url:'workbench/clue/deleteById.action',
						data:ids,
						type:'post',
						dataType:'json',
						success:function (data) {
							if(data.code=="1"){
								//刷新市场活动列表,显示第一页数据,保持每页显示条数不变
								selectClueByConditionForPage(1,$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
							}else{
								//提示信息
								alert(data.message);
							}
						}
					});
				}
			});

			//给"修改"按钮添加单击事件
			$("#editClueBtn").click(function () {
				//收集参数

				//获取列表中被选中的checkbox
				var chkedIds=$("#tBody input[type='checkbox']:checked");
				if(chkedIds.size()==0){
					alert("请选择要修改的市场活动");
					return;
				}
				if(chkedIds.size()>1){
					alert("每次只能修改一条市场活动");
					return;
				}
				var id=chkedIds[0].value;
				//发送请求
				$.ajax({
					url:'workbench/clue/selectAllById.action',
					data:{
						id:id
					},
					type:'post',
					dataType:'json',
					success:function (data) {
						//把市场活动的信息显示在修改的模态窗口上
						$("#edit-id").val(data.id);
						$("#edit-clueOwner").val(data.owner);
						$("#edit-company").val(data.company);
						$("#edit-call").val(data.appellation);
						$("#edit-surname").val(data.fullname);
						$("#edit-job").val(data.job);
						$("#edit-email").val(data.email);
						$("#edit-phone").val(data.phone);
						$("#edit-website").val(data.website);
						$("#edit-mphone").val(data.mphone);
						$("#edit-status").val(data.state);
						$("#edit-source").val(data.source);
						$("#edit-describe").val(data.description);
						$("#edit-contactSummary").val(data.contactSummary);
						$("#edit-nextContactTime").val(data.nextContactTime);
						$("#edit-address").val(data.address);

						//弹出模态窗口
						$("#editClueModal").modal("show");
					}
				});
			});

			//给"更新"按钮添加单击事件
			$("#saveEditClueBtn").click(function () {
				//收集参数
				var id=$("#edit-id").val();
				var owner=$("#edit-clueOwner").val();
				var company=$("#edit-company").val();
				var appellation=$("#edit-call").val();
				var fullname=$("#edit-surname").val();
				var job=$("#edit-job").val();
				var email=$("#edit-email").val();
				var phone=$("#edit-phone").val();
				var website=$("#edit-website").val();
				var mphone=$("#edit-mphone").val();
				var state=$("#edit-status").val();
				var source=$("#edit-source").val();
				var description=$("#edit-describe").val();
				var contactSummary=$("#edit-contactSummary").val();
				var nextContactTime=$("#edit-nextContactTime").val();
				var address=$("#edit-address").val();
				//表单验证(作业)
				//发送请求
				$.ajax({
					url:'workbench/clue/updateClueById.action',
					data:{
						id:id,
						owner:owner,
						company:company,
						appellation:appellation,
						fullname:fullname,
						job:job,
						email:email,
						phone:phone,
						website:website,
						mphone:mphone,
						state:state,
						source:source,
						description:description,
						contactSummary:contactSummary,
						nextContactTime:nextContactTime,
						address:address
					},
					type:'post',
					dataType:'json',
					success:function (data) {
						if(data.code=="1"){
							//关闭模态窗口
							$("#editClueModal").modal("hide");
							//刷新市场活动列表,保持页号和每页显示条数都不变
							selectClueByConditionForPage($("#demo_pag1").bs_pagination('getOption', 'currentPage'),$("#demo_pag1").bs_pagination('getOption', 'rowsPerPage'));
						}else{
							//提示信息
							alert(data.message);
							//模态窗口不关闭
							$("#editClueModal").modal("show");
						}
					}
				});
			});

















		});

		function selectClueByConditionForPage(pageNo,pageSize) {
			var fullname=$("#fullname").val();
			var company=$("#company").val();
			var phone=$("#phone").val();
			var mphone=$("#mphone").val();
			var source=$("#source").val();
			var owner=$("#owner").val();
			var state=$("#state").val();
			//异步ajax分页请求
			$.ajax({
				url:"workbench/clue/selectClueBySearchForPage.action",
				data:{
					fullname:fullname,
					company:company,
					phone:phone,
					mphone:mphone,
					source:source,
					owner:owner,
					state:state,
					pageNo:pageNo,
					pageSize:pageSize
				},
				type:"post",
				success:function (data) {
					var htmlStr = "";
					$.each(data.list, function (index,obj) {
						htmlStr += "<tr class=\"active\">";
						htmlStr += "<td><input type=\"checkbox\" value=\"" + obj.id + "\"/></td>";
						htmlStr+="<td><a style=\"text-decoration: none; cursor: pointer;\" onclick=\"window.location.href='workbench/clue/detailClue.action?id="+obj.id+"'\">"+obj.fullname+"</a></td>";
						htmlStr += "<td>" + obj.company + "</td>";
						htmlStr += "<td>" + obj.phone + "</td>";
						htmlStr += "<td>" + obj.mphone + "</td>";
						htmlStr += "<td>" + obj.source + "</td>";
						htmlStr += "<td>" + obj.owner + "</td>";
						htmlStr += "<td>" + obj.state + "</td>";
						htmlStr += "</tr>";
					});
					$("#tBody").html(htmlStr);
					$("#chckAll").prop("checked", false);
					//计算总页数
					var totalPages = 1;
					if (data.totalRows % pageSize == 0) {
						totalPages = data.totalRows / pageSize;
					} else {
						totalPages = parseInt(data.totalRows / pageSize) + 1;
					}

					//对容器调用bs_pagination工具函数，显示翻页信息
					$("#demo_pag1").bs_pagination({
						contentType: "application/x-www-form-urlencoded;charset=UTF-8",
						currentPage: pageNo,//当前页号,相当于pageNo

						rowsPerPage: pageSize,//每页显示条数,相当于pageSize
						totalRows: data.totalRows,//总条数
						totalPages: totalPages,  //总页数,必填参数.

						visiblePageLinks: 5,//最多可以显示的卡片数

						showGoToPage: true,//是否显示"跳转到"部分,默认true--显示
						showRowsPerPage: true,//是否显示"每页显示条数"部分。默认true--显示
						showRowsInfo: true,//是否显示记录的信息，默认true--显示


						//用户每次切换页号，都自动触发本函数;
						//每次返回切换页号之后的pageNo和pageSize
						onChangePage: function (event, pageObj) { // returns page_num and rows_per_page after a link has clicked
							//js代码
							//alert(pageObj.currentPage);
							//alert(pageObj.rowsPerPage);
							selectClueByConditionForPage(pageObj.currentPage, pageObj.rowsPerPage);
						}
					});
				}
			})
		}

	</script>
</head>
<body>

	<!-- 创建线索的模态窗口 -->
	<div class="modal fade" id="createClueModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 90%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">创建线索</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form" id="createClueForm">
					
						<div class="form-group">
							<label for="create-clueOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-clueOwner">
									<option value=""></option>
									<c:forEach items="${list}" var="u">
										<option value="${u.id}">${u.name}</option>
									</c:forEach>
								</select>
							</div>
							<label for="create-company" class="col-sm-2 control-label">公司<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-company">
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-call" class="col-sm-2 control-label">称呼</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-call">
									<option value=""></option>
									<c:forEach items="${appellation}" var="u">
										<option value="${u.id}">${u.value}</option>
									</c:forEach>
								</select>
							</div>
							<label for="create-surname" class="col-sm-2 control-label">姓名<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-surname">
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-job" class="col-sm-2 control-label">职位</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-job">
							</div>
							<label for="create-email" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-email">
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-phone" class="col-sm-2 control-label">公司座机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-phone">
							</div>
							<label for="create-website" class="col-sm-2 control-label">公司网站</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-website">
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-mphone" class="col-sm-2 control-label">手机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-mphone">
							</div>
							<label for="create-status" class="col-sm-2 control-label">线索状态</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-status">
									<option value=""></option>
									<c:forEach items="${clueState}" var="u">
										<option value="${u.id}">${u.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-source" class="col-sm-2 control-label">线索来源</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-source">
									<option value=""></option>
									<c:forEach items="${source}" var="u">
										<option value="${u.id}">${u.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						

						<div class="form-group">
							<label for="create-describe" class="col-sm-2 control-label">线索描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="create-describe"></textarea>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>
						
						<div style="position: relative;top: 15px;">
							<div class="form-group">
								<label for="create-contactSummary" class="col-sm-2 control-label">联系纪要</label>
								<div class="col-sm-10" style="width: 81%;">
									<textarea class="form-control" rows="3" id="create-contactSummary"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
								<div class="col-sm-10" style="width: 300px;">
									<input type="text" class="form-control" id="create-nextContactTime">
								</div>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>
						
						<div style="position: relative;top: 20px;">
							<div class="form-group">
                                <label for="create-address" class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="1" id="create-address"></textarea>
                                </div>
							</div>
						</div>
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="saveCreateClueBtn">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改线索的模态窗口 -->
	<div class="modal fade" id="editClueModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 90%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">修改线索</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<input type="hidden" id="edit-id">
						<div class="form-group">
							<label for="edit-clueOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-clueOwner">
									<option value=""></option>
									<c:forEach items="${list}" var="u">
										<option value="${u.id}">${u.name}</option>
									</c:forEach>
								</select>
							</div>
							<label for="edit-company" class="col-sm-2 control-label">公司<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-company" >
							</div>
						</div>

						<div class="form-group">
							<label for="edit-call" class="col-sm-2 control-label">称呼</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-call">
									<option value=""></option>
									<c:forEach items="${appellation}" var="u">
										<option value="${u.id}">${u.value}</option>
									</c:forEach>
								</select>
							</div>
							<label for="edit-surname" class="col-sm-2 control-label">姓名<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-surname" >
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-job" class="col-sm-2 control-label">职位</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-job" >
							</div>
							<label for="edit-email" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-email" >
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-phone" class="col-sm-2 control-label">公司座机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-phone">
							</div>
							<label for="edit-website" class="col-sm-2 control-label">公司网站</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-website" >
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-mphone" class="col-sm-2 control-label">手机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-mphone" >
							</div>
							<label for="edit-status" class="col-sm-2 control-label">线索状态</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-status">
									<option value=""></option>
									<c:forEach items="${clueState}" var="u">
										<option value="${u.id}">${u.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-source" class="col-sm-2 control-label">线索来源</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-source">
									<option value=""></option>
									<c:forEach items="${source}" var="u">
										<option value="${u.id}">${u.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-describe" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="edit-describe"></textarea>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>
						
						<div style="position: relative;top: 15px;">
							<div class="form-group">
								<label for="edit-contactSummary" class="col-sm-2 control-label">联系纪要</label>
								<div class="col-sm-10" style="width: 81%;">
									<textarea class="form-control" rows="3" id="edit-contactSummary">这个线索即将被转换</textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="edit-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
								<div class="col-sm-10" style="width: 300px;">
									<input type="text" class="form-control" id="edit-nextContactTime">
								</div>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                        <div style="position: relative;top: 20px;">
                            <div class="form-group">
                                <label for="edit-address" class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="1" id="edit-address"></textarea>
                                </div>
                            </div>
                        </div>
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="saveEditClueBtn">更新</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<div>
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>线索列表</h3>
			</div>
		</div>
	</div>
	
	<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
	
		<div style="width: 100%; position: absolute;top: 5px; left: 10px;">
		
			<div class="btn-toolbar" role="toolbar" style="height: 80px;">
				<form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">名称</div>
				      <input class="form-control" type="text" id="fullname">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">公司</div>
				      <input class="form-control" type="text" id="company">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">公司座机</div>
				      <input class="form-control" type="text" id="phone">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">线索来源</div>
					  <select class="form-control" id="source">
						  <option value=""></option>
						  <c:forEach items="${source}" var="u">
							  <option value="${u.id}">${u.value}</option>
						  </c:forEach>
					  </select>
				    </div>
				  </div>
				  
				  <br>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">所有者</div>
						<select class="form-control" id="owner">
							<option value=""></option>
							<c:forEach items="${list}" var="u">
								<option value="${u.id}">${u.name}</option>
							</c:forEach>
						</select>
				    </div>
				  </div>
				  
				  
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">手机</div>
				      <input class="form-control" type="text" id="mphone">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">线索状态</div>
					  <select class="form-control" id="state">
						  <option value=""></option>
						  <c:forEach items="${clueState}" var="u">
							  <option value="${u.id}">${u.value}</option>
						  </c:forEach>
					  </select>
				    </div>
				  </div>

				  <button type="button" class="btn btn-default" id="selectpartBtn">查询</button>
				  
				</form>
			</div>
			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 40px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createClueModal"><span class="glyphicon glyphicon-plus" id="createClueBtn"></span> 创建</button>
				  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#editClueModal" id="editClueBtn"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
				  <button type="button" class="btn btn-danger" id="deleteClueBtn"><span class="glyphicon glyphicon-minus" ></span> 删除</button>
				</div>
				
				
			</div>
			<div style="position: relative;top: 50px;">
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input type="checkbox" id="chckAll"/></td>
							<td>名称</td>
							<td>公司</td>
							<td>公司座机</td>
							<td>手机</td>
							<td>线索来源</td>
							<td>所有者</td>
							<td>线索状态</td>
						</tr>
					</thead>
					<tbody id="tBody">

					</tbody>
				</table>
				<div id="demo_pag1">

				</div>
		</div>
	</div>
	</div>
</body>
</html>
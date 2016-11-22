<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/tag.jsp"%>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="<c:url value='/admin/home/index.html'/>"><b>基于角色的权限管理系统</b></a>
	</div>
	<!-- /.navbar-header -->
	<ul class="nav navbar-top-links navbar-right">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#" aria-expanded="true">
				${loginUser.nickname } <i class="fa fa-user fa-fw"></i> <i
				class="fa fa-caret-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="<c:url value='/admin/user/setting.html'/>"><i
						class="fa fa-toggle-on fa-fw"></i> 个人设置 </a></li>
				<li class="divider"></li>
				<li><a href="<c:url value='/logout.html'/>"><i
						class="fa fa-sign-out fa-fw"></i> 退出登录 </a></li>
			</ul> <!-- /.dropdown-user --></li>
		<!-- /.dropdown -->
	</ul>
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<c:forEach items="${userMenuList }" var="menu" varStatus="status">
					<!-- 一级子菜单没有parentId,有url -->
					<c:if test="${empty menu.parentId and not empty menu.url}">
						<li><a href="<c:url value='${menu.url }'/>"> <i
								class="${menu.icon } fa-fw"></i> ${menu.name }
						</a></li>
					</c:if>
					<!-- 可展开的一级菜单，没有parentId,有url -->
					<c:if test="${empty menu.parentId and empty menu.url}">
						<li><a href="#"> <i class="${menu.icon } fa-fw"></i>
								${menu.name }<span class="fa arrow"></span>
						</a>
							<ul class="nav nav-second-level">
								<!-- 没有url的是三级菜单，有url的直接输出到li中 -->
								<c:forEach items="${menu.children}" var="secondChild"
									varStatus="status">
									<c:if test="${not empty secondChild.url }">
										<li><a href="<c:url value='${secondChild.url }'/>">${secondChild.name }</a>
										</li>
									</c:if>
									<!-- 二级菜单url为空，表示还有三级菜单 -->
									<c:if test="${empty secondChild.url }">
										<li><a href="#">${secondChild.name }<span
												class="fa arrow"></span></a>
											<ul class="nav nav-third-level">
												<c:forEach items="${secondChild.children}"
													var="thirdChild" varStatus="status">
													<li><a href="<c:url value='${thirdChild.url }'/>">${thirdChild.name }</a>
													</li>
												</c:forEach>
											</ul></li>
									</c:if>
								</c:forEach>
							</ul></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>
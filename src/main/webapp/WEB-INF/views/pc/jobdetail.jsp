<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wynfrith
  Date: 15-5-9
  Time: 下午3:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%request.setCharacterEncoding("UTF-8") ;%>
<jsp:include page="block/start.jsp">
  <jsp:param name="title" value="兼职-${job.title}"/>
</jsp:include>

<%--顶栏--%>
<jsp:include page="block/top-bar.jsp"/>
<%--页首--%>
<jsp:include page="block/header.jsp"/>

<div class="container">


  <%--轮播--%>
  <jsp:include page="block/silder.jsp"/>
  <%--侧边栏--%>
  <jsp:include page="block/side.jsp"/>

  <!-- 正文 -->
  <div class="detail main">
    <div class="detail-bar">
      <span>兼职详情</span>
      <a href="/"><p class="fl"><i class="fa fa-angle-left">&nbsp;&nbsp;</i>返回</p></a>
      <p class="fr">分享</p>
      <p class="fr"><i class="fa fa-heart-o">&nbsp;&nbsp;</i>收藏</p>
    </div>
    <div style="clean:both"></div>
    <div class="title">
      <p>${job.title}</p>
      <span>兼职类型 : ${job.categoryName}</span>
      <span>${job.verified ? '已认证' : '未认证'}</span>
      <span>发布时间 : ${job.postTime}</span>
    </div>
    <div class="info">
      <p class="money"><span>${job.wage}元/${job.salaryUnit}</span>${job.timeToPay}</p>
      <p>有效日期 : <span>${job.expiredTime}</span></p>
      <p>工作时间 : <span>${job.workTime}</span></p>
      <p>工作地点 : <span>${job.workPlace}</span></p>
    </div>
    <div class="description">
      <p class="pin-title">工作详情
        <i class="pin-arrow"></i>
      </p>
      <p>工作内容 : <span>${job.jobDetail}</span></p>
      <p>工作要求 : <span>${job.jobDescription}</span></p>
    </div>
    <div class="contact">
      <p>联系人 : <span>${job.contact}</span></p>
      <p class="phone" >联系电话 : <span >${job.contactPhone}</span></p>
    </div>
    <div class="comment">
      <p class="pin-title">用户评论
        <i class="pin-arrow"></i>
      </p>
      <div class="operates">
        <div class="operate">
          <span class="fa fa-thumbs-up"></span>
          <p>100</p>
        </div>
        <div class="operate">
          <span class="fa fa-thumbs-down"></span>
          <p>1</p>
        </div>
        <div class="operate">
          <span class="fa fa-comment"></span>
          <p>3</p>
        </div>
        <div class="operate">
          <span class="text">举报</span>
        </div>
      </div>
      <div class="content">
        <c:forEach var="review" items="${reviews}" varStatus="status">
        <div class="${status.index == status.count-1 ? 'no-border-bottom':null}" >
           <img src="/images/pig.jpg" alt="">
           <p>wynfrith</p>
           <span>${review.content}</span>
        </div>
        </c:forEach>
      </div>
      <div class="review-bar">
        <img src="/images/pig.jpg" alt="">
        <input type="text" class="review-input" placeholder="发表评论">
        <span class="review-span">评论</span>
      </div>
    </div>

  </div>


</div>

<%--脚部--%>
<jsp:include page="block/footer.jsp"/>

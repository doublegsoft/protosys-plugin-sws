<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:forEach items="${r'${'}${itemsName!'items'}${r'}'}" var="item">
<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
    <div class="panel panel-primary">
        <div class="row padall">
			<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
				<span></span>
				<img src="${item.image}" />
			</div>
			<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
				<div class="clearfix">
					<div class="pull-left">
						<span class="fa fa-dollar icon">675, 000</span>
					</div>
					<div class="pull-right">
						1,196 SqFt | 3 Bedrooms | 1 Bathroom                                
					</div>
				</div>
				<div>
					<h4><span class="fa fa-map-marker icon"></span>5108 24th St N</h4>
					Build 2011. Fully Furnished.<span class="fa fa-search icon pull-right">   More</span>
				</div>
			</div>
		</div>
		<div class="row padbig">
			<div id="map2" class="map">
			</div>
		</div>
	</div>
</div>
</c:forEach>
<%@ CODEPAGE=936%>
<!--#include virtual="/OA/inc/conn.asp" -->
<%
	Forum_sn="cku_forum"
	Forum_sn=Forum_sn & "_" & Request.servervariables("SERVER_NAME")
	username=trim(Request.Cookies(Forum_sn)("username"))
	cku_id=trim(Request.Cookies(Forum_sn)("cku_id"))
	newsid=1373
%>
<!doctype html>
<html>
<head>
<meta charset="gb2312">
<title>CKU成立十周年</title>
<link rel="stylesheet" href="/css/default.css">
<link href="/css/nav.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/cku10.css" type="text/css">
<script type="text/javascript" src="http://www.cku.org.cn/js/jquery-1.8.3.js"></script>
<script type="text/javascript"> 
		$(document).ready(function(){
			$("#replyHref").click(function(){
				username='<%=username%>';
				if(username=='')
				{
					alert('请先登录再评价!');
					window.location.href='/reg/login.asp?comeurl=/zhuanti/10year';
				}
				else
				{
					var addtextarea=$("#addtextarea").val().replace(/\n|\r\n/g,"<br />"); 
					//var addtextarea=$("#addtextarea").val();
					if(addtextarea=='')
					{
						alert('请说点话吧!');
						$("#addtextarea").focus();
						return false;	
					}
					else
					{
						$.ajax({
								   url:'pinglun.asp',
								   type: "POST",
								   dataType: "json",
								   data: ({
									   addtextarea:escape(addtextarea),
									   newsid:'<%=newsid%>',
									   username:escape('<%=username%>')
									   }),
								   beforeSend:function(){$("#replyHref").text("正在提交中");},
								   success:function(data){
									  	var data=eval(data);
										
									   if(data.msg=='ok')
									   {
										   alert('提交成功!');
										   
										   	html="<li>"
											html=html+"<dl>"
											html=html+"<dt>"
											html=html+"<strong>"+data.username+"</strong><var>"+data.addtime+"</var>"
											if(username=='xinhongwei' || username=='繁殖部-韩' || username=='Zhu子' || username==data.username)
											{
												html=html+"<a href=javascript:return false; onclick=del(this,"+data.id+")>删除</a>"
											}
											html=html+"	</dt>"
											html=html+"	<dd>"+data.addtextarea
											html=html+"</dd>"						
											html=html+"</dl>"
											html=html+"</li>"
										   
										   //$(".mescon ul li:first").before(html)
										   $(".mescon ul").prepend(html)
										   $('html, body').animate({
												scrollTop: $("#mes").offset().top
											}, 500);
											$(".mesconwarp").scrollTop(0);
											$("#addtextarea").val('');
									   }
									 }
                               });	
					}
						
				}
			
			});
			
		});
		function del(obj,id)
		{
			if(confirm("确认要删除？")) 
			{
				var id=id;
				$.ajax({
									   url:'pinglun.asp',
									   type: "POST",
									   dataType: "json",
									   data: ({
										   id:escape(id),
										   act:"del"
										   }),
									   success:function(data){
											var data=eval(data);
										   if(data.msg=='ok')
										   {
											   alert('删除成功!');
											   $(obj).parents("li").remove();
										   }
										   else
										   {
												alert('删除失败，请重新删除!');   
											}
										 }
								   });	
			}
			
		}
</script>
</head>

<body>

<div id="top">
  <!--#include virtual="/top_menu.asp" -->
</div>

<div class="ten_bar">
	<div class="bar_warp">
		<span class="barcon1">十载 感谢始终相伴</span>
		<span class="barcon2">十年光阴 我们情深意更浓</span>
	</div>
</div>

<div class="bg_white borbtm">
	<div class="navbtn">
		<a href="#event" title="参与活动" >参与活动</a>
		<a href="#mes" title="祝福互动" >祝福互动</a>
		<a href="http://www.cku.org.cn/introduced/history.asp" target="_blank" title="十年回首" class="last">十年回首</a>
	</div>
</div>


<div class="bg_white">

	<div class="conwarp2 ptb20">
		
		
		<div class="part1con">
			<div class="pat1_lf">
				<h2>2016年4月21日，CKU成立十周年。</h2>

				<p>十年，一路走来是你给予我们绝不放弃的信心，<br />
				是你赋予我们充沛饱满的力量。<br />
				十年凝聚十年长情，十年抛洒十年激情，<br />
				十年对未知毫不畏惧，<br />
				十年对记忆久存于心。</p>

				<span>
				十年峥嵘岁月，在不经意间向我们昭示着岁月的匆匆流逝，<br />
				回忆往昔点滴，每幕画面历历在目，近在耳边尽在言语间。<br />
				值此CKU成立十周年之际，<br />
				感谢十年间犬业爱好者诚挚的爱犬精神，<br />
				感谢十年间所有CKU会员的不离不弃和帮助，<br />
				感谢所有热情洋溢的犬业新人对我们的选择。<br />
				十年间我们不断探索付出，以不断刷新中国犬业记录为目标。<br />
				CKU必将不负大家的盼望勇攀巅峰、再创造犬业辉煌！
				</span>

			</div>
			<div class="pat1_rt"><img src="images/pat1img.jpg" alt="CKU十周年"></div>
		</div>

	</div>
	
</div>

<div class="bg_gray">

	<div class="conwarp ptb20">
	
		<p class="boldfont">2006~2016，这十年我们之间发生了哪些故事？<br />
		你是否还记得第一次初登赛场时的青涩不安？<br />
		你是否还记得第一次获得赏励时的激动喜悦？<br />
		你是否还记得那些年和CKU走过的难忘岁月？
		</p>

		<p>2016年5月27日，CKU将举办成立十周年庆典，现面向所有会员、所有犬业爱好者、所有行业内外媒体开设有奖征集活动，我们将在所有征集到的作品中，评选出最终奖项，在CKU十周年庆典晚宴上进行颁发。</p>

		<p>也许，这十年，使你我改变。你也许已经从懵懂少年成为圈内前辈，也许你已经从一名青涩美容师修炼为资深美容师，也许你已经从单纯的犬业爱好者成长为专业繁殖人，再或者，你已经离开这个圈子，从事着完全不同的工作。<br />
		但这都不影响我们对犬业的热爱，因为，你和我一样，不忘初心。</p>

		<p>千言万语变成一幅画、一段文、一片情、一刻念，一点一滴一丝一毫都镌写着我们的这十年。<br />
		我们想知道你眼中的大事小情，或感动或惊喜或搞笑，只要有爱有情有欢乐，我们愿意共同分享。</p>
	
	</div>
</div>


<div class="bg_yellow"  id="event">

	<div class="conwarp2 ptb20">
		
		
		<div class="part2con">
			<div class="pat2_lf">
				<h2>活动主题：不忘初心</h2>
				<h3>活动形式：<span>征集您与CKU十年故事的物品或照片或文字等</span></h3>

				<p>
					<strong>以下为征集的详细内容供参考：</strong>
					1.您手中保留的各版本CKU赛事/美容考试秩序册<br />
					2.您所拥有的CKU纸质版杂志<br />
					3.您首次参加比赛或美容或牵犬考试获得的奖杯/奖花<br />
					4.您收藏的CKU制作的系列徽章<br />
					5.您收藏过的印有CKU标志的T恤<br />
					6.您爱犬的老版证书<br />
					7.您入会至今的CKU会员卡<br />
					8.连续十年续缴纳会费的会员（不区分会员类型），说出你的十年故事。<br />
					9.加入CKU十年中，令您印象深刻的一张照片
				</p>


			</div>
			<div class="pat2_rt">
				<p>
					<em>注：</em>
					所有征集物品均可通过邮寄方式“备注您的姓名及十周年征集”后邮寄至协会<br />
					图文内容均可发送至以下邮箱，或关注CKU微信/微博直接发送私信。发送时请务必注明会员号+联系方式，以便活动结束后评奖和CKU十周年纪念礼品的发放。<br />
					<strong>邮寄地址：</strong><br />
					北京市朝阳区朝外大街3号铂宫国际D座301<br />
					<strong>收件人：</strong>兰竹<br />
					<strong>邮箱：</strong>magazine@cku.org.cn<br />
					<strong>微信订阅号：</strong>FCI-CKU<br />

					<img src="images/ewm1.png" /><br />

					<strong>微博：</strong>@中爱联合犬业俱乐部_CKU<br />

					<img src="images/ewm2.png" /><br />


					<strong>电话：</strong>010-61138880转8008<br />
				</p>
			</div>
		</div>

	</div>
	
</div>
<div class="mespart1" id="mes" >
	<div class="mespart">写下你的祝福！一起祝CKU十周岁生日快乐！</div>	
</div>
<div class="lastpart">

	<div class="conwarp">
	
		<h2>会员祝福</h2>
		<div class="mesconwarp">
			<div class="mescon">
				<ul>
					<!--<li>
						<dl>
							<dt>
								<strong>游客</strong><var>2016.4.21  11:30</var>
							</dt>
							<dd>							祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU。
							</dd>
							
						</dl>
					</li>
					<li>
						<dl>
							<dt>
								<strong>游客</strong><var>2016.4.21  11:30</var>
								<a href="javascript:return false;">删除</a>
							</dt>
							<dd>							祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU，祝福CKU。
							</dd>
							
						</dl>
					</li>-->
					<%
						set rs=conn.execute("select * from pinglun where newsid="&newsid&" order by id desc")
						while not rs.eof
					%>
                    <li>
						<dl>
							<dt>
								<strong><%=rs("username")%></strong><var><%=rs("addtime")%></var>
                                <%
									if username="xinhongwei" or username="繁殖部-韩" or username="Zhu子" or username=trim(rs("username")) then
								%>
                                <a href="javascript:return false;" onClick="del(this,<%=rs("id")%>)">删除</a>
								<%
									end if
								%>
                            </dt>
							<dd>							<%=rs("content")%>
							</dd>
							
						</dl>
					</li>
					<%
						rs.movenext
						wend
						rs.close
						set rs=nothing
					%>
                    
				</ul>
			</div>
		</div>
		
		
		<h3>我来说两句</h3>
		<div class="meswritwp">
			<p class="meswritpt">
				<var class="textareatxt">在此写下您的祝福！</var>
				<textarea id="addtextarea" onfocus="selectextarea()" onblur="blurtextarea()"></textarea>
			</p>
			
			<script>
				$(".textareatxt").click(function(){
					$(this).hide();
					$("#addtextarea").focus();												
				});
				function blurtextarea(){
					if($("#addtextarea").val()==""){
						$(".textareatxt").show();
					}
				}
				function selectextarea(){
					$(".textareatxt").hide();
					if($("#addtextarea").val()!==""){
						$(".textareatxt").hide();
					}
				}
			</script>
			
			
			
			<p class="meswritbtn">
				<input type="button" value="发表评论" id="replyHref" />
			</p>
		</div>
	
	</div>
	
</div>

<script>	
	$('.navbtn a').click(function(){
		var $anchor = $(this);
		$('html, body').animate({
			scrollTop: $($anchor.attr('href')).offset().top
		}, 500);
		return false;
	});		 
</script>

<div class="bound"> 
  <script src="../../mycku/js/bottom.js" language="javascript"></script> 
</div>

</body>
</html>

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
<title>CKU����ʮ����</title>
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
					alert('���ȵ�¼������!');
					window.location.href='/reg/login.asp?comeurl=/zhuanti/10year';
				}
				else
				{
					var addtextarea=$("#addtextarea").val().replace(/\n|\r\n/g,"<br />"); 
					//var addtextarea=$("#addtextarea").val();
					if(addtextarea=='')
					{
						alert('��˵�㻰��!');
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
								   beforeSend:function(){$("#replyHref").text("�����ύ��");},
								   success:function(data){
									  	var data=eval(data);
										
									   if(data.msg=='ok')
									   {
										   alert('�ύ�ɹ�!');
										   
										   	html="<li>"
											html=html+"<dl>"
											html=html+"<dt>"
											html=html+"<strong>"+data.username+"</strong><var>"+data.addtime+"</var>"
											if(username=='xinhongwei' || username=='��ֳ��-��' || username=='Zhu��' || username==data.username)
											{
												html=html+"<a href=javascript:return false; onclick=del(this,"+data.id+")>ɾ��</a>"
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
			if(confirm("ȷ��Ҫɾ����")) 
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
											   alert('ɾ���ɹ�!');
											   $(obj).parents("li").remove();
										   }
										   else
										   {
												alert('ɾ��ʧ�ܣ�������ɾ��!');   
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
		<span class="barcon1">ʮ�� ��лʼ�����</span>
		<span class="barcon2">ʮ����� �����������Ũ</span>
	</div>
</div>

<div class="bg_white borbtm">
	<div class="navbtn">
		<a href="#event" title="����" >����</a>
		<a href="#mes" title="ף������" >ף������</a>
		<a href="http://www.cku.org.cn/introduced/history.asp" target="_blank" title="ʮ�����" class="last">ʮ�����</a>
	</div>
</div>


<div class="bg_white">

	<div class="conwarp2 ptb20">
		
		
		<div class="part1con">
			<div class="pat1_lf">
				<h2>2016��4��21�գ�CKU����ʮ���ꡣ</h2>

				<p>ʮ�꣬һ·��������������Ǿ������������ģ�<br />
				���㸳�����ǳ��汥����������<br />
				ʮ������ʮ�곤�飬ʮ������ʮ�꼤�飬<br />
				ʮ���δ֪����η�壬<br />
				ʮ��Լ���ô����ġ�</p>

				<span>
				ʮ��������£��ڲ��������������ʾ�����µĴҴ����ţ�<br />
				����������Σ�ÿĻ����������Ŀ�����ڶ��߾�������䡣<br />
				ֵ��CKU����ʮ����֮�ʣ�<br />
				��лʮ���Ȯҵ�����߳�ֿ�İ�Ȯ����<br />
				��лʮ�������CKU��Ա�Ĳ��벻���Ͱ�����<br />
				��л�������������Ȯҵ���˶����ǵ�ѡ��<br />
				ʮ������ǲ���̽���������Բ���ˢ���й�Ȯҵ��¼ΪĿ�ꡣ<br />
				CKU�ؽ�������ҵ����������۷塢�ٴ���Ȯҵ�Իͣ�
				</span>

			</div>
			<div class="pat1_rt"><img src="images/pat1img.jpg" alt="CKUʮ����"></div>
		</div>

	</div>
	
</div>

<div class="bg_gray">

	<div class="conwarp ptb20">
	
		<p class="boldfont">2006~2016����ʮ������֮�䷢������Щ���£�<br />
		���Ƿ񻹼ǵõ�һ�γ�������ʱ����ɬ������<br />
		���Ƿ񻹼ǵõ�һ�λ������ʱ�ļ���ϲ�ã�<br />
		���Ƿ񻹼ǵ���Щ���CKU�߹����������£�
		</p>

		<p>2016��5��27�գ�CKU���ٰ����ʮ������䣬���������л�Ա������Ȯҵ�����ߡ�������ҵ����ý�忪���н�����������ǽ�����������������Ʒ�У���ѡ�����ս����CKUʮ������������Ͻ��а䷢��</p>

		<p>Ҳ����ʮ�꣬ʹ���Ҹı䡣��Ҳ���Ѿ����¶������ΪȦ��ǰ����Ҳ�����Ѿ���һ����ɬ����ʦ����Ϊ��������ʦ��Ҳ�����Ѿ��ӵ�����Ȯҵ�����߳ɳ�Ϊרҵ��ֳ�ˣ��ٻ��ߣ����Ѿ��뿪���Ȧ�ӣ���������ȫ��ͬ�Ĺ�����<br />
		���ⶼ��Ӱ�����Ƕ�Ȯҵ���Ȱ�����Ϊ�������һ�����������ġ�</p>

		<p>ǧ��������һ������һ���ġ�һƬ�顢һ���һ��һ��һ˿һ������д�����ǵ���ʮ�ꡣ<br />
		������֪�������еĴ���С�飬��ж���ϲ���Ц��ֻҪ�а������л��֣�����Ը�⹲ͬ����</p>
	
	</div>
</div>


<div class="bg_yellow"  id="event">

	<div class="conwarp2 ptb20">
		
		
		<div class="part2con">
			<div class="pat2_lf">
				<h2>����⣺��������</h2>
				<h3>���ʽ��<span>��������CKUʮ����µ���Ʒ����Ƭ�����ֵ�</span></h3>

				<p>
					<strong>����Ϊ��������ϸ���ݹ��ο���</strong>
					1.�����б����ĸ��汾CKU����/���ݿ��������<br />
					2.����ӵ�е�CKUֽ�ʰ���־<br />
					3.���״βμӱ��������ݻ�ǣȮ���Ի�õĽ���/����<br />
					4.���ղص�CKU������ϵ�л���<br />
					5.���ղع���ӡ��CKU��־��T��<br />
					6.����Ȯ���ϰ�֤��<br />
					7.����������CKU��Ա��<br />
					8.����ʮ�������ɻ�ѵĻ�Ա�������ֻ�Ա���ͣ���˵�����ʮ����¡�<br />
					9.����CKUʮ���У�����ӡ����̵�һ����Ƭ
				</p>


			</div>
			<div class="pat2_rt">
				<p>
					<em>ע��</em>
					����������Ʒ����ͨ���ʼķ�ʽ����ע����������ʮ�������������ʼ���Э��<br />
					ͼ�����ݾ��ɷ������������䣬���עCKU΢��/΢��ֱ�ӷ���˽�š�����ʱ�����ע����Ա��+��ϵ��ʽ���Ա�������������CKUʮ���������Ʒ�ķ��š�<br />
					<strong>�ʼĵ�ַ��</strong><br />
					�����г�����������3�Ų�������D��301<br />
					<strong>�ռ��ˣ�</strong>����<br />
					<strong>���䣺</strong>magazine@cku.org.cn<br />
					<strong>΢�Ŷ��ĺţ�</strong>FCI-CKU<br />

					<img src="images/ewm1.png" /><br />

					<strong>΢����</strong>@�а�����Ȯҵ���ֲ�_CKU<br />

					<img src="images/ewm2.png" /><br />


					<strong>�绰��</strong>010-61138880ת8008<br />
				</p>
			</div>
		</div>

	</div>
	
</div>
<div class="mespart1" id="mes" >
	<div class="mespart">д�����ף����һ��ףCKUʮ�������տ��֣�</div>	
</div>
<div class="lastpart">

	<div class="conwarp">
	
		<h2>��Աף��</h2>
		<div class="mesconwarp">
			<div class="mescon">
				<ul>
					<!--<li>
						<dl>
							<dt>
								<strong>�ο�</strong><var>2016.4.21  11:30</var>
							</dt>
							<dd>							ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��
							</dd>
							
						</dl>
					</li>
					<li>
						<dl>
							<dt>
								<strong>�ο�</strong><var>2016.4.21  11:30</var>
								<a href="javascript:return false;">ɾ��</a>
							</dt>
							<dd>							ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��ף��CKU��
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
									if username="xinhongwei" or username="��ֳ��-��" or username="Zhu��" or username=trim(rs("username")) then
								%>
                                <a href="javascript:return false;" onClick="del(this,<%=rs("id")%>)">ɾ��</a>
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
		
		
		<h3>����˵����</h3>
		<div class="meswritwp">
			<p class="meswritpt">
				<var class="textareatxt">�ڴ�д������ף����</var>
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
				<input type="button" value="��������" id="replyHref" />
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

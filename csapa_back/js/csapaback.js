$(function(){
	//左右两栏适应高度
	var healthifotit = $('.csapa_top').height();
	var zxb_bt = $('.csapa_bottom').height();
	var csaplthifoH=	$('.csapa_ifo').height();
	var csapbodyH=	$(window).height() - healthifotit - zxb_bt - 20;
	var csaconbox ;
	csaconbox = csapbodyH;
	$('.csapa_ifo').height(csaconbox);
	$('.csapaifo_lf').height(csaconbox);	
	$('.csapaifo_rt').height(csaconbox);	
	if($('.caspaifo_rtcon')){
		if($('.caspaifo_rtcon').height() > csaconbox){
			return;
		}else{			
			$('.caspaifo_rtcon').height(csaconbox-22);
		}
		
	};
	
	
});

$(window).resize(function(){
	var healthifotit = $('.csapa_top').height();
	var zxb_bt = $('.csapa_bottom').height();
	var csaplthifoH=	$('.csapa_ifo').height();
	var csapbodyH=	$(window).height() - healthifotit - zxb_bt - 20;
	var csaconbox ;
	csaconbox = csapbodyH;
	$('.csapa_ifo').height(csaconbox);
	$('.csapaifo_lf').height(csaconbox);	
	$('.csapaifo_rt').height(csaconbox);	
	if($('.caspaifo_rtcon')){
		if($('.caspaifo_rtcon').height() > csaconbox){
			return;
		}else{			
			$('.caspaifo_rtcon').height(csaconbox-22);
		}
		
	};
});

//显示当前时间
$(function(){
	if($('#time')){$('#time').html(currentTime);}
});
function currentTime(){
	var caspadaya = new Array("日", "一", "二", "三", "四", "五", "六");  
	var canspaweek = new Date().getDay();	
	var d = new Date(),caspstr = '';
	var caspasec = d.getSeconds();
	if(parseInt(caspasec)<10){
		caspasec = '0'+caspasec;
	}else{
		caspasec = caspasec;
	};
	caspstr += d.getFullYear()+'年';
	caspstr += d.getMonth() + 1+'月';
	caspstr += d.getDate()+'日 ';
	caspstr += "星期"+ caspadaya[canspaweek]+' ';
	caspstr += d.getHours()+':'; 
	caspstr += d.getMinutes()+':'; 
	caspstr += caspasec+''; 
	return caspstr;
}
if($('#time')) {
	setInterval(function(){
		$('#time').html(currentTime)
	},1000);
}


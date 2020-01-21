/**
 * 
 */
$(function ()
{
	$('#like').click(function(){
	  	if($("#likesId").val() != '')
	  	{
	  		alert("你已经赞过啦");
	  		return;
	  	}
	  	if($("#userId").val() == '')
	  	{
	  		location.href = 'login/toLogin';
	  		return;
	  	}
	  	console.info($("#likeForm").serialize());
	  	$.post(
	  		'likes/editStatus',
	  		$("#likeForm").serialize(),
	  		function (data)
	  		{
	  			if(data.info == 'success')
	  			{
	  				var count = $(".more-list p span").text();
	  				$(".more-list p span").text(parseInt(count)+1);
	  				$(".more-list .praise").addClass("on");
	  				$("#likesId").val("1");
	  			}
	  			else
  				{
	  				alert(data.info);
  				}
	  		},
	  		"json"
	  	);
	});
	
	$("#checkFollow").click(function ()
	{
		if($("#userId").val() == '')
	  	{
	  		location.href = 'login/toLogin';
	  		return;
	  	}
		$.post(
		  		'follow/addFollow',
		  		$("#likeForm").serialize(),
		  		function (data)
		  		{
		  			if(data.info == 'success')
		  			{
		  				var text = $(".name-btn .checkFollow-btn").text();
		  				if(text == '已关注')
	  					{
		  					$(".name-btn .checkFollow-btn").text('关注');
		  					$(".name-btn .checkFollow-btn").removeClass("in");
		  					$(".name-btn .checkFollow-btn").removeClass("off");
		  					$(".name-btn .checkFollow-btn").addClass("on");
	  					}
		  				else
		  				{
		  					$(".name-btn .checkFollow-btn").text('已关注');
		  					$(".name-btn .checkFollow-btn").removeClass("on");
		  					$(".name-btn .checkFollow-btn").removeClass("off");
		  					$(".name-btn .checkFollow-btn").addClass("in");
		  				}
		  			}
		  			else
	  				{
		  				alert(data.info);
	  				}
		  		},
		  		"json"
		  	);
	});
	
	$(".name-btn .checkFollow-btn").mouseover(function ()
	{
		if($(this).text() == '已关注')
		{
			$(this).text("取消关注");
			$(this).removeClass("in");
			$(this).removeClass("on");
			$(this).addClass("off");
		}
	});
	
	$(".name-btn .checkFollow-btn").mouseout(function ()
	{
		if($(this).text() == '取消关注')
		{
			$(this).text("已关注");
			$(this).removeClass("off");
			$(this).removeClass("on");
			$(this).addClass("in");
		}
	});
	
	$(".more-list .favorites").click(function ()
	{
		if($("#userId").val() == '')
	  	{
	  		location.href = 'login/toLogin';
	  		return;
	  	}
		$.post(
			'bookMark/editStatus',
			$("#likeForm").serialize(),
			function (data)
			{
				if(data.info == 'success')
				{
					if($("#isBookMarked").val() != '')
					{
						$(".more-list .favorites").removeClass("on");
						$("#isBookMarked").val('');
						console.info("isBookMarked:"+$("#isBookMarked").val());
					}
					else
					{
						$(".more-list .favorites").addClass("on");
						$("#isBookMarked").val('1');
					}
				}
				else
				{
					alert(data.info);
				}
			},
			"json"
		);
	});
	$(".delArticle").click(function ()
	{
		var id = $(this).attr("id");
		arr = [];
		arr.push(id);
		new AutoBox({
			content:'确定删除？',
			mask:"#000",
			Yes:'确定',
			No:'取消',
			yc:function(){
		        $.ajax({
		           	url:"article/delArticle",
		           	type:"post",
		           	traditional: true, 
		           	data:{"ids":arr},
		           	dataType:'json',
		           	success:function(data){
			            if(data.info == 'success'){
			              	location.href="index/toIndex";
			            }
			            else
			            {
			            	new AutoBox({content:'删除失败~',mask:"#000",autoClose:3});
			            }
		           	}
		        });
			}
		})
	});
});
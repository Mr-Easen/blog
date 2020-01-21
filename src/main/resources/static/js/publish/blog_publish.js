// zjf20171011
function setBlogTag() {//tab
	$("#for-tag").hide();
	var tag_value = $("#tag").val();
	var new_value = $("#for-tag").val();
	$("#for-tag").val("");
	new_value = $.trim(new_value);
	var tag_len = new_value.length;
	if(tag_len <= 1) {
		$("#for-tag").show();
		return false;
	}
    new_value = new_value.substring(0, tag_len-1);
    new_value = new_value.replace(/,/g, '');
	new_value = new_value.replace(/，/g, '');
	var tag_arr = tag_value == '' ? [] : tag_value.split(",");
	for (var i = 0; i < tag_arr.length; i++) {
		if(tag_arr[i] == new_value) {
			$("#for-tag").show();
			return false;
		}
	}
	var tag_new_value = tag_value == '' ? new_value : (tag_value + ',' + new_value);
	$("#tag").val(tag_new_value).change();
	var tagHtml = "<span>"+new_value+"<em></em></span>";
    $(".show-select-tab").append(tagHtml);
    tag_num++;
    if(tag_num >= 5) {
    	$("#for-tag").hide();
    } else {
    	$("#for-tag").show();
    }
}
$(function(){
	var arr = [$('.pulldown-title'),$('.system-one'),$('.system-two'),$('.myself')];
 	$.each(arr,function(n,m){
  		setHover(m)
  	})
  	setSelectTile()
  	setSelectSys()
  	inputRadio($('.reprint-list input'))
	inputRadio($('.public-radio input'))
  	if($('.reprint2, .reprint').text() == '原创'){
		$('.reprint-list').show()
	}else{
		$('.reprint-list').hide()
	}
	$('.advanced-options p').click(function(){//more select
		$(this).next().toggle();
	})
	/*$.getJSON("", function(data){// 一级下拉
	  var data = data.data
	  var sysli = '<li value="">请选择一级分类</li>';
	  var selected_text = '';//选中项的值
	  $.each(data,function(n,m){
	  	sysli += '<li value="'+m.id+'">'+m.name+'</li>';
	  	if(m.id == pid) {
	  		selected_text = m.name;
	  	}
	  })
	  $('.system-one ul').append(sysli)
	  if(!selected_text) {
	  	selected_text = $('.system-one ul li').eq(0).text()
	  }
	  $('.system-one p').text(selected_text)
	  $('.system-one ul li').click(function(){
	  	var index = $(this).index();
	  	var pid = $(this).attr('value');
	  	$("#cate_id").val(0).change();
	  	setSysList($('.system-two ul'), pid, 1)
	  })
  		setSelectSys()
	});*/
	
	
	if(blog_id){
		var pid = $('#pid').val()
		var cate_id = $('#cate_id').val()
		if(pid != '' || pid != 0){
			setSysList($('.system-two ul'), pid, 2)
		}
	}
	$("body").on("click", '.show-select-tab em', function(){//remove tab
	  var tag_index = $(this).parent().index();
	  var tag_value = $("#tag").val();
	  var tag_arr = tag_value.split(",");
	  var tag_new_value = '';
	  for(var i=0; i< tag_arr.length; i++) {
	  	if(tag_index != i) {
	  		tag_new_value += tag_arr[i] + ",";
	  	}
	  }
	  var new_tag_length = tag_new_value.length;
	  tag_new_value = tag_new_value.substring(0, new_tag_length - 1);
	  $("#tag").val(tag_new_value).change();
	  $(this).parent().remove();
	  tag_num--;
	  $("#for-tag").show();
	})
	$('#for-tag').bind('keyup',function(e){//tab click
	  if(e.keyCode == 188 || e.keyCode == 186  || e.keyCode == 59){
		setBlogTag()
	  }
	});
	function setSelectTile(){
		$('.pulldown-title li').click(function(){
			var me = $(this)
			setSelect(me)
			if($(this).text() == '原创'){
				$('.reprint-list').show()
			}else{
				$('.reprint-list').hide()
			}
		})
	}
	function setSelectSys(){
		$('.system-select li').click(function(){
			var me = $(this)
			setSelect(me)
		})
	}
	function setSelect(obj){
		obj.parent().prev().text(obj.text())
		obj.parent().parent().removeClass('on')
	}
	function inputRadio(obj){// radio
		obj.click(function(){
			obj.removeAttr('checked')
			$(this).prop('checked',true)
		})
	}
	function setSysList(obj,val,flag){// 二级下拉
		var cate_id = $("#cate_id").val();
		if(val > 0) {
			$.getJSON(selectUrl+'?pid='+val, function(data){
				var data = data.data
				if(flag == 2){
					var sysli = '<li value="">'+data[cate_id].name+'</li>';
				}else{
					var sysli = '<li value="">请选择二级分类</li>';
				}
				$.each(data,function(n,m){
					sysli += '<li value="'+m.id+'">'+m.name+'</li>'
				})
				obj.find('li').remove();
				obj.append(sysli)
				var text = obj.find('li').eq(0).text()
				obj.prev().text(text)
				setSelectSys()
			});
		} else {
			var sysli = '<li value="">请选择二级分类</li>';
			obj.find('li').remove();
			obj.append(sysli)
			var text = obj.find('li').eq(0).text()
			obj.prev().text(text)
			setSelectSys()
		}		
	}
	
	$("#publish").click(function ()
	{
	  	var pid = $('#parentId').val();
	  	console.info(pid);
	  	var type = $("#type").val();
	  	if(type == '9' || type == '')
	  	{
	  		alert("请选择文章类型");
	  		return;
	  	}
	  	if(pid == '0' || pid == '')
	  	{
	  		alert("请选择一级分类");
	  		return;
	  	}
	  	var categoryId = $('#categoryId').val();
	  	console.info(categoryId);
	  	if(categoryId == '0' || categoryId == '')
	  	{
	  		alert("请选择二级分类");
	  		return;
	  	}
		$("#articleForm").submit();
	});

	
	$('.system-one ul li').click(function(){
	  	var pid = $(this).attr('id');
	  	$("#parentId").val(pid);
	  	setSecondList($('.system-two ul'), pid);
	});
	
	
	$("ul#system-two-list").on("click","li",function(){   

		var categoryId = $(this).attr('id');
	  	$("#categoryId").val(categoryId);
	 });
	
	$("ul#article_type").on("click","li",function(){   
		var type = $(this).attr('value');
	  	$("#type").val(type);
	 });
	
	function setSecondList(obj,parentId)
	{
		var url = "category/findCategorysByPId";
		$.post(
			url,
			{"parentId":parentId},
			function (data)
			{
				var data = data.data;
				var sysli = '<li id="0">'+'请选择二级分类'+'</li>';
				$.each(data,function(n,m){
					sysli += '<li id="'+m.id+'">'+m.name+'</li>'
				});
				obj.find('li').remove();
				obj.append(sysli);
				var text = obj.find('li').eq(0).text()
				obj.prev().text(text);
				setSelectSys();
			},
			"json"
		);
	}
})


/**
 *
 * Created by wynfrith on 15-5-18.
 */

$(".submit-btn").click(function(){
    var msg = '';

    var photo = document.querySelector( "input[name=photoPath]");
    if(!photo.value) {
        msg = '请上传头像。';
    }
    photo.setCustomValidity(msg);

    var introduce = document.querySelector('textarea[name=introduce]');
    intro_len = introduce.value.length;
    if(intro_len < 15 || intro_len > 200) {
        msg = '长度在15-200字之间';
    }
    introduce.setCustomValidity(msg);
    $.tlj.postForm('#CreateResumeForm', location.pathname, function(data){
        console.log(JSON.stringify(data));
        location.href = '/user/resume/view';
    });
});

//$(".submit-btn").click(function(){
//    var data = $("#CreateResumeForm").serialize();
//    var type = this.getAttribute("data-type");
//    $(".dialog").jqm({
//        overlayClass: 'jqmOverlay'
//    })
//    //首先先上传图片
//    console.log(type);
//    $.ajax({
//        type:"POST",
//        data:data,
//        url:"/user/resume/"+type,
//        success:function(data){
//            console.log(data);
//            $(".tlj_modal_content").html(data.message);
//            console.log($('.dialog'));
//            $('.dialog').jqmShow();
//            if(data.result){
//                setTimeout(function(){
//                    location.href = "/user/resume/view";
//                },1000);
//            }
//        }
//    });
//});

var jc = new $.jc();

function go_signin() {
    swal({
        title: "提示信息",
        text: "您没有登录，3秒后跳转到登录页面！",
        type: "warning",
        confirmButtonText: "点击跳转",
        timer: 3000
    }, function (isConfirm) {
        if (isConfirm) {
            setTimeout(function () {
                window.location.href = '/signin';
            }, 300);
        } else {
            window.location.href = '/signin';
        }
    });
}

/* 
 弹出窗口居中
 */
function openWindow(url, name, iWidth, iHeight) {
    var url;                             //转向网页的地址;  
    var name;                            //网页名称，可为空;  
    var iWidth;                          //弹出窗口的宽度;  
    var iHeight;                         //弹出窗口的高度;  
    //获得窗口的垂直位置  
    var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
    //获得窗口的水平位置  
    var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
    window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no');
}

function dispatch() {
    var q = document.getElementById("q");
    if (q.value != "") {
        var url = 'https://www.google.com/search?q=site:java-china.org/topic%20' + q.value;
        if (navigator.userAgent.indexOf('iPad') > -1 || navigator.userAgent.indexOf('iPod') > -1 || navigator.userAgent.indexOf('iPhone') > -1) {
            location.href = url;
        } else {
            window.open(url, "_blank");
        }
        return false;
    } else {
        return false;
    }
}

function emoji(content) {
    if (content && content.indexOf(':') != -1) {
        return content.replace(/:([a-z-_]{2,30}):/g, "<img src='" + CDN_URL + "/assets/emojis/$1.png'  height='20' width='20' />");
    }
    return content;
}

function change_captcha() {
    var timestamp = (new Date()).valueOf();
    $('#captcha').attr('src', BASE + '/captcha?t=' + timestamp);
    return false;
}

//预览帖子
$('#topic-add .preview').on('click', function () {
    var content = $("#topic-add #content").val();
    if (content) {
        jc.post({
            url: BASE + '/markdown',
            data: {content: content},
            success: function (result) {
                if (result && result.success) {
                    $("#markdown_preview").html(result.payload).removeClass('hide');
                    $('#markdown_preview pre code').each(function (i, block) {
                        hljs.highlightBlock(block);
                    });
                }
            }
        });
    } else {
        $("#markdown_preview").html('').addClass('hide');
    }
});

$('#topic-edit .preview').on('click', function () {
    var content = $("#topic-edit #content").val();
    if (content) {
        $.post(BASE + '/markdown', {content: content}, function (response) {
            if (response) {
                $("#markdown_preview").html(response).removeClass('hide');
                $('#markdown_preview pre code').each(function (i, block) {
                    hljs.highlightBlock(block);
                });
            }
        });
    } else {
        $("#markdown_preview").html('').addClass('hide');
    }
});

//帖子点赞
$('.topic-footer .heart').on('click', function () {
    var _this = $(this);
    var A = $(this).attr("rel");
    var C = parseInt($("#likeCount").text());
    var D = $("#likeCount");
    $(this).css("background-position", "")
    if (A == 'like') {
        D.text(C + 1);
        _this.addClass("heartAnimation").attr("rel", "unlike");
    } else {
        D.text(C - 1);
        _this.removeClass("heartAnimation").attr("rel", "like");
        _this.css("background-position", "left");
    }
    var tid = $(this).attr('tid');
    $.post(BASE + '/favorite', {type: 'love', event_id: tid}, function (response) {
        if (response) {
            if (response.status == 200) {
            } else if (response.status == 401) {
                go_signin();
            } else {
                alertError(response.msg);
            }
        }
    });
});

//帖子下沉
$('.topic-detail-heading .sinks').on('click', function () {
    var tid = $(this).attr("tid");
    jc.post({
        url: '/topic/sink',
        data: {tid: tid},
        success: function (result) {
            if (result && result.success) {
                window.location.reload();
            } else {
                if (result.code == 401) {
                    go_signin();
                } else {
                    jc.alertError(result.msg || '帖子下沉失败');
                }
            }
        }
    });
});

//帖子收藏
$('.topic-footer .follow').on('click', function () {
    var tid = $(this).attr("tid");
    jc.post({
        url: '/favorite',
        data: {type: 'topic', event_id: tid},
        success: function (result) {
            if (result && result.success) {
                window.location.reload();
            } else {
                if (result.code == 401) {
                    go_signin();
                } else {
                    jc.alertError(result.msg || '帖子收藏失败');
                }
            }
        }
    });
});

//设置精华帖
$('.topic-footer .essence').on('click', function () {
    var tid = $(this).attr("tid");
    jc.post({
        url: '/topic/essence',
        data: {tid: tid},
        success: function (result) {
            if (result && result.success) {
                window.location.reload();
            } else {
                if (result.code == 401) {
                    go_signin();
                } else {
                    jc.alertError(result.msg || '设置精华失败');
                }
            }
        }
    });
    return false;
});

//管理员删帖
$('.topic-footer .deltopic').on('click', function () {
    var tid = $(this).attr("tid");
    jc.alertConfirm({
        title: '确定删除该帖子吗?',
        then: function () {
            tale.post({
                url: '/topic/delete',
                data: {tid: tid},
                success: function (result) {
                    if (result && result.success) {
                        jc.alertOk('帖子删除成功');
                    } else {
                        jc.alertError(result.msg || '帖子删除失败');
                    }
                }
            });
        }
    });
    return false;
});

//分享到微博
$('.topic-footer .share-weibo').on('click', function () {
    var title = $('.topic-detail-heading .panel-title').text();
    var href = window.location.href;
    var share_url = 'http://service.weibo.com/share/share.php?url=' + href + '&title=' + encodeURI(title) + ' | Java中国';
    openWindow(share_url, '', 550, 422);
});

//at用户
$('.comment-list .at-user').on('click', function () {
    var user_name = $(this).attr('alt');
    var ctn = $('#comment-form #content');
    var text = ctn.val();
    var at = '@' + user_name + ' ';
    if (text == at) {
        ctn.val('');
    } else {
        var br = text ? '\r\n' : '';
        ctn.val(text + br + at);
    }
    ctn.focus();
});

$('.profile .following').on('click', function () {
    var uid = $(this).attr("uid");
    jc.post({
        url: '/favorite',
        data: {type: 'following', event_id: uid},
        success: function (result) {
            if (result && result.success) {
                window.location.reload();
            } else {
                if (result.code == 401) {
                    go_signin();
                } else {
                    jc.alertError(result.msg || '帖子发布失败');
                }
            }
        }
    });
    return false;
});

//节点收藏
$('.node-head .favorite').on('click', function () {
    var nid = $(this).attr("nid");
    jc.post({
        url: '/favorite',
        data: {type: 'node', event_id: nid},
        success: function (result) {
            if (result && result.success) {
                window.location.reload();
            } else {
                if (result.code == 401) {
                    go_signin();
                } else {
                    jc.alertError(result.msg || '节点收藏失败');
                }
            }
        }
    });
    return false;
});
////////////////////帖子操作:START//////////////////////

var topic = {};
//编辑帖子
topic.edit = function () {
    var formData = $('#topic-edit').serialize();
    jc.post({
        url: '/topic/edit',
        data: formData,
        success: function (result) {
            if (result && result.success) {
                window.location.href = BASE + '/topic/' + result.payload;
            } else {
                if (result.code == 401) {
                    go_signin();
                } else {
                    jc.alertError(result.msg || '密码修改失败');
                }
            }
        }
    });
    return false;
};

////////////////////帖子操作:END//////////////////////

////////////////////Github绑定:START////////////////////
var github = {};
github.signup = function () {

    jc.post({
        url: BASE + '/oauth/user/bind',
        data: {
            type: 'signup',
            login_name: $('#github_signup_form #login_name').val(),
            email: $('#github_signup_form #email').val(),
            pass_word: $('#github_signup_form #pass_word').val()
        },
        success: function (result) {
            if (result && result.success) {
                $('#github-bind-tab').hide();
                $('#github-tab-content').hide();
                $('.col-md-9 #result').removeClass('hide').html('注册成功，已经向您的邮箱 ' + $('#github_signup_form #email').val() + ' 发送了一封激活申请，请注意查收！' +
                    '如未收到邮件可在垃圾邮件里查看或者联系网站管理员进行激活。');
            } else {
                jc.alertError(result.msg || '绑定失败');
            }
        }
    });
    return false;
};

github.signin = function () {
    jc.post({
        url: BASE + '/oauth/user/bind',
        data: {
            type: 'signin',
            login_name: $('#github_signin_form #login_name').val(),
            pass_word: $('#github_signin_form #pass_word').val()
        },
        success: function (result) {
            if (result && result.success) {
                window.location.href = '/';
            } else {
                jc.alertError(result.msg || '绑定失败');
            }
        }
    });
    return false;
};
////////////////////Github绑定:END//////////////////////

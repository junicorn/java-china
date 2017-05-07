$('a[data-toggle=layout-small-menu]').on('click', function (e) {
    e.preventDefault(), e.stopPropagation(), $('.layout-fixed-header').toggleClass("layout-small-menu");
});

var jc = new $.jc();

function len(o) {
    var n, count = 0;
    for (n in o) {
        if (o.hasOwnProperty(n)) {
            count++;
        }
    }
    return count;
}

// 激活用户
$('.user-table .activeAccount').on('click', function () {
    var uid = $(this).attr("uid");
    $.post(BASE + '/admin/status', {uid: uid, type: 'activeAccount'}, function (response) {
        if (response) {
            if (response.status == 200) {
                window.location.reload();
            } else {
                alertError(response.msg);
            }
        }
    });
});

// 重新发送激活邮件
$('.user-table .resendMail').on('click', function () {
    var uid = $(this).attr("uid");
    $.post(BASE + '/admin/status', {uid: uid, type: 'resend'}, function (response) {
        if (response) {
            if (response.status == 200) {
                alertOk('邮件已发送');
            } else {
                alertError(response.msg);
            }
        }
    });
});

//禁用用户
$('.user-table .disable').on('click', function () {
    var uid = $(this).attr("uid");
    $.post(BASE + '/admin/status', {uid: uid, type: 'disable'}, function (response) {
        if (response) {
            if (response.status == 200) {
                window.location.reload();
            } else {
                jc.alertError(response.msg);
            }
        }
    });
});

//取消管理员
$('.user-table .removeAdmin').on('click', function () {
    var uid = $(this).attr("uid");
    $.post(BASE + '/admin/status', {uid: uid, type: 'removeAdmin'}, function (response) {
        if (response) {
            if (response.status == 200) {
                window.location.reload();
            } else {
                jc.alertError(response.msg);
            }
        }
    });
});

//设置管理员
$('.user-table .setAdmin').on('click', function () {
    var uid = $(this).attr("uid");
    $.post(BASE + '/admin/status', {uid: uid, type: 'setAdmin'}, function (response) {
        if (response) {
            if (response.status == 200) {
                window.location.reload();
            } else {
                jc.alertError(response.msg);
            }
        }
    });
});

//恢复账户
$('.user-table .recoveryAccount').on('click', function () {
    var uid = $(this).attr("uid");
    $.post(BASE + '/admin/status', {uid: uid, type: 'recoveryAccount'}, function (response) {
        if (response) {
            if (response.status == 200) {
                window.location.reload();
            } else {
                jc.alertError(response.msg);
            }
        }
    });
});

var setting_data = {};
$("#setting_form :input").change(function () {
    var key = $(this).attr('name');
    if (key == 'allow_signup') {
        setting_data[key] = $(this).is(':checked');
    } else {
        setting_data[key] = $(this).val();
    }
});


// 保存系统设置
function save_settings() {
    if (len(setting_data) > 0) {
        $.post(BASE + '/admin/settings', setting_data, function (response) {
            setting_data = {};
            if (response) {
                if (response.status == 200) {
                    jc.alertOk("保存成功！");
                } else {
                    jc.alertError(response.msg);
                }
            }
        });
    }
    return false;
}

// 修改节点
function update_node() {
    var formData = $('#editnode_form').serialize();
    $.post(BASE + '/admin/nodes/edit', formData, function (response) {
        setting_data = {};
        if (response) {
            if (response.status == 200) {
                jc.alertOk("修改成功！");
            } else {
                jc.alertError(response.msg);
            }
        }
    });
    return false;
}
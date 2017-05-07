$(function () {
    $inputor = $('#content');
    if (comment_members.length > 0) {
        comment_members = unique(comment_members);
        var names = $.map(comment_members, function (value, i) {
            return {'id': i, 'name': value};
        });
        var at_config = {
            at: "@",
            data: names,
            headerTpl: '<div class="atwho-header">会员列表<small>↑&nbsp;↓&nbsp;</small></div>',
            insertTpl: '@\${name} ',
            displayTpl: "<li>\${name} </li>",
            limit: 200
        };
        $inputor.atwho(at_config)
    }
});
function unique(arr) {
    var uniqueArr = [];
    $.each(arr, function (i, el) {
        if ($.inArray(el, uniqueArr) === -1) uniqueArr.push(el);
    });
    return uniqueArr;
}
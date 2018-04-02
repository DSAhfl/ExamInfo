$(document).ready(function() {
    // //初始化快捷入口顺序
    // sortTable();
    // var clip = new ZeroClipboard($("#copy"));
    //日历多语言
    var datePikadayLang = {
        previousMonth: '上一月',
        nextMonth: '下一月',
        months: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
        weekdays: ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
        weekdaysShort: ['周日', '周一', '周二', '周三', '周四', '周五', '周六']
    };

    //初始化日历控件
    var $dateForm = $('#dateForm').pikaday({
        firstDay: 1,
        format: 'YYYY-MM-DD',
        minDate: new Date('2000-01-01'),
        maxDate: new Date('2020-12-31'),
        yearRange: [2000, 2030],
        i18n: datePikadayLang
    });
    var $dateTo = $('#dateTo').pikaday({
        firstDay: 1,
        format: 'YYYY-MM-DD',
        minDate: new Date('2000-01-01'),
        maxDate: new Date('2020-12-31'),
        yearRange: [2000, 2030],
        i18n: datePikadayLang
    });

    $("#grid-data").bootgrid({
        ajax: true,
        ajaxSettings: {
            method:"POST",
            cache: false
        },
        post: function ()
        {
            var sortOrder = $("#grid-data").bootgrid("getSortDictionary");
            var sortKey,sortOrderValue;
            var examName = $("input[name=exam_name]").val();
            var examStatus = $("select[name=status]").find("option:selected").val();
            var examStyle = $("input[name=exam_style]").val();
            var examStartTime = $("input[name=dateForm]").val();
            var examEndTime = $("input[name=dateTo]").val();
            $.each(sortOrder, function (name, value) {
                sortKey   = name;
                sortOrderValue = value;
            });
            return {
                "sortKey": sortKey,
                "sortOrder": sortOrderValue,
                "examName": examName,
                "examStatus": examStatus,
                "examStyle": examStyle,
                "examStartTime": examStartTime,
                "examEndTime": examEndTime
            };
        },
        url: "/admin/exam/mgr_grid/",
        selection: true,
        multiSelect: true,
        rowSelect: true,
        padding:1,
        navigation: 2,
        formatters: {
            "link": function(column, row)
            {
                return "<a href='#' class='icons8-edit updateExam' examId='"+row.id+"' data-toggle=\"tooltip\" data-placement=\"top\" data-container=\"body\" title='编辑'></a>"+
                    "<a href='#' class='icons8-attach linkExam' examId='"+row.id+"' data-toggle=\"tooltip\" data-placement=\"top\" data-container=\"body\" title='考试链接'></a>"+
                    "<a href='#' class='icons8-purchase-order linkTest' data-toggle=\"tooltip\" data-container=\"body\" data-placement=\"top\" title='考一下' examId='"+row.id+"'></a>"+
                    "<a href='#' class='icons8-edit-property-2 linkScore' data-toggle=\"tooltip\" data-placement=\"top\" data-container=\"body\" title='成绩查询批改' examId='"+row.id+"'></a>";
            }
        }
    }).on("loaded.rs.jquery.bootgrid", function (e){
        // initial tooltip
        $('#grid-data [data-toggle="tooltip"]').tooltip();

        $("#grid-data").colResizable({
            fixed:false,
            liveDrag:true,
            draggingClass:"dragging"
        });


        //新编辑考试
        $("#grid-data").bootgrid().find(".updateExam").on("click", function(e) {
            var examId = $(this).attr("examId");
            e.stopPropagation();
            e.preventDefault();
            //showUpdateUser(this, examId);
            examEditFn(examId);
        });


        //管理员成绩查询批改首页表格快捷入口
        $("#grid-data").bootgrid().find(".linkScore").on("click", function(e) {
            var examId = $(this).attr("examId");
            e.stopPropagation();
            e.preventDefault();
            window.open("/admin/result/mgr_new/?examInfoId=" + examId);
        });

    });

    //删除多个考试
    $("body").on("click", "#batchDel", function(e) {
        e.stopPropagation();
        e.preventDefault();
        var ids = $("#grid-data").bootgrid("getSelectedRows").join(",");
        if (ids == "") {
            alert("请选择要删除的考试！");
            return;
        }
        examDelFn(ids, true);
    });

    //点击搜索
    $("body").on("click", "#searchIcon", function(e) {
        var srch = $('input[name=exam_name]');
        srch.val($.trim(srch.val()));
        $("#grid-data").bootgrid("reload");
    });

    $("body").on("click", "#searchBtn", function(e) {
        e.stopPropagation();
        e.preventDefault();
        $("#grid-data").bootgrid("reload");
        $("advSearch").hide();
    });
    //搜索回车事件
    $("body").keydown(function() {
        var e = window.event || arguments.callee.caller.arguments[0];
        if (e && e.keyCode == "13") {//keyCode=13是回车键
            $('#searchIcon').click();
        }
    });


    //编辑考试
    function examEditFn(examId) {
        $.ajax({
            url: '/admin/exam/exam_can_edit/'+examId,
            type: 'get',
            cache: false,
            dataType: 'json',
            success: function(msg) {
                if (msg.success != false)
                    window.location.href = "/admin/exam/update/" + examId;
                else alert ('该考试与课程关联，请在课程中编辑');
            }
        })

    }



    //删除考试
    function examDelFn(examId, much) {
        BootstrapDialog.show({
                title: "",
                message: "删除考试会同步删除考试中的成绩和答题，是否继续？<br />(若考试中有人正在答题，将无法删除)",
                buttons: [{
                    label: "确认",
                    action: function(dialogItself)
                        {
                            dialogItself.close();
                            $.ajax({
                            type: "GET",
                            cache: false,
                            headers: { "cache-control": "no-cache" },
                            dataType: "json",
                            url: "/admin/exam/del/" + examId,
                            success: function(msg) {
                                    if (msg.success != true)
                                    {
                                        if (msg.code == 33061)
                                        {
                                            createDialog("有考生正在参加该考试，不能删除！");
                                        }
                                        else
                                        {
                                            createDialog("操作失败，请联系管理员！");
                                        }
                                    }
                                    else
                                    {
                                        window.location.reload();
                                    }
                                },
                            })
                        }
                    },
                    {
                        label: "取消",
                        action: function(dialogItself)
                        {
                            dialogItself.close();
                        }
                    }],
                });

        function createDialog(alertMsg) {
            BootstrapDialog.show({
                title: "",
                message: alertMsg,
                buttons: [{
                    label: "确认",
                    action: function(dialogItself) {
                            dialogItself.close();
                        }
                    }]
            });
        };
    }


});
//重新刷新页面
function reloadHtml() {
    location.reload(true);
}



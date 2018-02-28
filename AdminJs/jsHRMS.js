
var sDocumentFileName = "";

function jsOpenWindow(filename, width, height) {
    window.open(filename, "Window_" + Math.floor(Math.random() * 110), "toolbar=no,width=" + width + ",height=" + height + ",directories=no,status=yes,location=no,scrollbars=yes,resizable=yes,menubar=no");
}

function GetSelectedListBox(sListBoxName) {
    if ((document.getElementById(sListBoxName).options.length) > 0)
        return (document.getElementById(sListBoxName).options[document.getElementById(sListBoxName).options.selectedIndex].value);
    else
        return (0);
}

function GetSelectedListBoxValue(sListBoxName) {
    if ((document.getElementById(sListBoxName).options.length) > 0)
        return (document.getElementById(sListBoxName).options[document.getElementById(sListBoxName).options.selectedIndex].text);
    else
        return ("");
}

function AlertFocus(sMessage, sControl) {
    alert(sMessage);
    document.getElementById(sControl).focus();
    return (false);
}

function GetVal(divName) {
    if (document.getElementById(divName))
        return (document.getElementById(divName).value);
    else
        return ("");
}

function SetVal(divName, sValue) {
    if (document.getElementById(divName)) {
        document.getElementById(divName).value = sValue;
        return (true);
    }
    else
        return (false);
}

function SetDivVal(divName, sValue) {
    if (document.getElementById(divName)) {
        document.getElementById(divName).innerHTML = sValue;
        return (true);
    }
    else
        return (false);
}

function HideDiv(divName) {
    document.getElementById(divName).style.display = 'none';
}

function ShowDiv(divName) {
    document.getElementById(divName).style.display = '';
}

function ShowHideDiv(divName) {
    document.getElementById(divName).style.display = (document.getElementById(divName).style.display == '') ? 'none' : '';
}
function ShowHideTr(rowName) {
    if (navigator.appName = 'Netscape')
        document.getElementById(rowName).style.display = (document.getElementById(rowName).style.display == 'table-row') ? 'none' : 'table-row';
    else
        document.getElementById(rowName).style.display = (document.getElementById(rowName).style.display == 'visible') ? 'none' : 'visible';

}

function isValidUserName(val) {
    if (val.match(/^[a-z0-9_.]+$/))
        return true;
    else
        return false;
}

function isAlphaNumeric(val) {
    if (val.match(/^[a-zA-Z0-9]+$/))
        return true;
    else
        return false;
}

function isNumeric(val) {
    if (val.match(/^[0-9|.]+$/)) {
        return true;
    }
    else {
        return false;
    }
}

function isDate(val) {
    if (val.match(/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/))
        return true;
    else
        return false;
}


function isDateTime(val) {
    if (val.match(/^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}$/))
        return true;
    else
        return false;
}

function isTime(val) {
    if (val.match(/^[0-9]{2}:[0-9]{2}:[0-9]{2}$/))
        return true;
    else
        return false;
}

function isEmailAddress(val) {
    // /^([a-zA-Z0-9])+([.a-zA-Z0-9_-])*@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-]+)+/
    if (val.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9- ]+)*(\.[a-z]{2,3})+/))
        return true;
    else
        return false;
}

function MultiDimensionalArray(iRows, iCols) {
    var i;
    var j;
    var a = new Array(iRows);

    for (i = 0; i < iRows; i++) {
        a[i] = new Array(iCols);
        for (j = 0; j < iCols; j++)
            a[i][j] = "";
    }
    return (a);
}

function OptionsList_RemoveSelected(oListName) {
    if (document.getElementById(oListName).options.selectedIndex >= 0)
        document.getElementById(oListName).options[document.getElementById(oListName).options.selectedIndex] = null;
}

function OptionsList_RemoveAll(oListName) {
    document.getElementById(oListName).options.length = 0;
}

function toggleChecks(cbElem) {
    var f = cbElem.form;
    for (var elem, i = 0; (elem = f.elements[i]); i++)
        if (elem.type == 'checkbox' && elem != cbElem)
            if (elem.checked == true)
                elem.checked = false;
            else
                elem.checked = true;
}

function validEmail(email) {
    email = trim(email)
    invalidChars = " /:,;"
    if (email == "")
        return false

    for (i = 0; i < invalidChars.length; i++) {
        badChar = invalidChars.charAt(i)
        if (email.indexOf(badChar, 0) > -1)
            return false
    }

    atPos = email.indexOf("@", 1)
    if (atPos == -1)
        return false

    if (email.indexOf("@", atPos + 1) > -1)
        return false

    periodPos = email.indexOf(".", atPos)

    if (periodPos == -1)
        return false

    if (periodPos + 3 > email.length)
        return false

    return true
}

function FillSelectBox(sTargetListBox, sText, sValue) {
    insertNewOption(document.getElementById(sTargetListBox), sText, sValue);
}

function addCommas(nStr) {
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}

function AjaxPage(url, containerid) {
    $("#" + containerid).html('<br /><br /><div align="center"><img src="../images/loading.gif" /></div><br /><br />');
    $("#" + containerid).load(url);
}

function HR_Common_Documents_AddNewDocument(sComponentName, iComponentId, sTitle, iAccessLevel, sFileName) {
    if (sTitle.length <= 0)
        alert("Please enter the Title...");
    else if (sFileName.length <= 0)
        alert("Please upload a file first...");
    else if ((sFileName == "") || (sFileName == null) || (sFileName == "undefined"))
        alert("Please upload a file first!" + sFileName);
    else
        $.colorbox({ href: "../common/documents.php?componentname=" + sComponentName + "&id=" + iComponentId + "&action=AddDocument&iAccessLevel=" + iAccessLevel + "&txtFileName=" + sFileName + "&txtTitle=" + sTitle, width: "700px;", height: "620px;" });

    return (false);
}

function AddNewEmployees(sMultipleEmployees, sListBoxName) {
    sAddEmployeesString = sMultipleEmployees;
    aMultipleEmployees = sMultipleEmployees.split("~");
    for (i = 0; i < aMultipleEmployees.length; i++) {
        aEmployeeInfo = aMultipleEmployees[i].split("|");
        if (aEmployeeInfo.length > 2) {
            iEmployeeId = aEmployeeInfo[0];
            sEmployeeName = aEmployeeInfo[1];
            AddEmployeeToList(iEmployeeId, sEmployeeName, sListBoxName);
        }
    }
}

function RemoveSelectedEmployees(sListBoxName) {
    if (document.getElementById(sListBoxName).selectedIndex < 0) {

    }
    else {
        var options = document.getElementById(sListBoxName).options;
        for (var i = options.length - 1; i >= 0; i--)
            if (options[i].selected)
                options[i] = null;
        return false;
    }
}

function AddEmployees(sListBoxName) {
    var listLength = document.getElementById(sListBoxName).length;
    for (i = 0; i < listLength; i++)
        document.getElementById(sListBoxName).options[i].selected = true;

    document.getElementById('EmployeesString').value = sAddEmployeesString;
    return (true);
}

function AddEmployeeToList(iEmployeeId, sEmployeeName, sListBoxName) {
    maxLength = 100;

    list = document.getElementById(sListBoxName);
    var listLength = list.length;

    if ((listLength + 1) > maxLength) {
        alert("Cannot add more than " + maxLength + " employees!");
        return false;
    }

    var targetIndex = listLength;

    for (x = 0; x < list.length; x++)
        if (list.options[x].value == iEmployeeId)
            return false;

    list.options[targetIndex] = new Option(iEmployeeId);
    list.options[targetIndex].value = iEmployeeId;
    list.options[targetIndex].text = sEmployeeName;

    return true;
}

function SelectEmployee(selListBoxName, iEmployeeId) {
    document.getElementById(selListBoxName).value = iEmployeeId;
}
function StatusHistory_ChangeAction(sAction) {
    if (sAction == "Forward")
        ShowDiv("divForwardTo");
    else
        HideDiv("divForwardTo");
}


function ResetPassword() {
    if (GetVal('txtPassword') == "") return (AlertFocus('Please enter a valid Password', 'txtPassword'));
    if (GetVal('txtPasswordConfirm') == "") return (AlertFocus('Please enter a valid Password', 'txtPasswordConfirm'));
    if (GetVal('txtPassword') != GetVal('txtPasswordConfirm')) return (AlertFocus('Your two password should be the same!', 'txtPassword'));

    return true;
}

function ShowHideMCQAnswers() {
    iQuestionType = $("#selQuestionType").val();

    if (iQuestionType == 0) $("#divAddMCQAnswers").slideDown(800);
    else if (iQuestionType == 1) $("#divAddMCQAnswers").slideUp(800);
}

function ChangeDashboardGraph(iGraphNumber) {
    for (i = 1; i <= 3; i++) {
        HideDiv("divDashboardGraph" + i);
        document.getElementById("imgDashboardGraph" + i).src = "../images/icons/iconBullet_Orange.png";
    }

    ShowDiv("divDashboardGraph" + iGraphNumber);
    document.getElementById("imgDashboardGraph" + iGraphNumber).src = "../images/icons/iconBullet_Green.png";
}


// Things to do
function ThingsToDo_ShowEditTask(iTaskId) {
    $("#divUpdateTask1_" + iTaskId).hide();
    $("#divUpdateTask2_" + iTaskId).css("display", "inline");
}

function ThingsToDo_EditTask(iTaskId) {
    if ($("#txtEditTask_" + iTaskId).val() == "") return (false);

    AjaxPage("../home/pages.php?page=ThingsToDo_Tasks&action=EditTask&id=" + encodeURIComponent(iTaskId) + "&task=" + encodeURIComponent($("#txtEditTask_" + iTaskId).val()), "divThingsToDo_Tasks");
    return (false);
}

function ThingsToDo_AddNewTask() {
    if ($("#txtAddNewTask").val() == "") return (false);

    AjaxPage("../home/pages.php?page=ThingsToDo_Tasks&action=AddTask&id=0&task=" + encodeURIComponent($("#txtAddNewTask").val()), "divThingsToDo_Tasks");

    $("#txtAddNewTask").val("");
    $("#divAddNewTask").hide();

    return (false);
}
/* End of Things to do */


function ChangePayslipType(iPayslipType) {
    $("#divMonthlySalary").hide();
    $("#divHourlyWages").hide();

    if (iPayslipType == 0)
        $("#divMonthlySalary").show();
    else
        $("#divHourlyWages").show();
}

function Employees_Leaves_UpdateLeaveDuration() {
    iLeaveDuration = $("#ld").val();

    if (iLeaveDuration == 0) // Full Day Leave
    {
        $("#divField_lfrom").slideDown(800);
        $("#divField_lto").slideDown(800);

        $("#divField_hdld").slideUp(800);
        $("#divField_hdlp").slideUp(800);
    }
    else {
        $("#divField_lfrom").slideUp(800);
        $("#divField_lto").slideUp(800);

        $("#divField_hdld").slideDown(800);
        $("#divField_hdlp").slideDown(800);
    }
}

function EmployeeLeavesQuota() {
    var iEmployeeId = $("#selEmployee").val();
    $.colorbox({ href: '../home/pages.php?page=Employees_Leaves_LeavesQuota2&id=' + iEmployeeId, width: '550px;', height: '400px;' });
}

function UpdateLeavesQuota(iEmployeeId, iLeaveTypeId, sLeavesLeft) {
    $("#imgUpdateQuota_" + iLeaveTypeId).attr("src", "../images/loading.gif");
    $.colorbox({ href: '../home/pages.php?page=Employees_Leaves_LeavesQuota_UpdateQuota&id=' + iEmployeeId + '&leavetype=' + iLeaveTypeId + '&leavesleft=' + sLeavesLeft, width: '550px;', height: '400px;' });
}

function ChangeLeaveCarryOverYear() {
    var iYear = $("#selYear").val();
    $.colorbox({ href: '../home/pages.php?page=Employees_Leaves_LeavesCarryOver&year=' + iYear, width: '650px;', height: '440px;' });
}

function ResetLeavesQuota() {
    if (confirm('Do you really want to Reset the Leaves Quota?')) {
        $.colorbox({ href: '../home/pages.php?page=Employees_Leaves_ResetLeavesQuota_ConfirmReset', width: '550px;', height: '280px;' });
    }
}

/* Social Performance */

function SocialPerformanceChangeUser(iEmployeeId) {
    for (i = 0; i < iSocialPerformanceEmployees; i++) {
        $("#trEmployees_" + aSocialPerformance[i][0]).css("background-color", "#57769c");
        $("#imgArrow_" + aSocialPerformance[i][0]).hide();
    }

    $("#trEmployees_" + iEmployeeId).css("background-color", "#314b6a");
    $("#imgArrow_" + iEmployeeId).show();

    AjaxPage("../employees/socialperformance2.php?page=Profile&id=" + iEmployeeId, "divMainContainer");
}

/* Reports */

function Reports(sReportType, sReportName, sExtraParams) {
    jQuery("div#divReportButtons a").css({ "color": "#000000", "font-weight": "normal" });
    $("#a" + sReportName).css({ "color": "#0000ff", "font-weight": "bold" });

    AjaxPage("../reports2/reports.php?type=" + sReportType + "&report=" + sReportName + sExtraParams, "divReportsContainer");
}

/* News Feed */

function NewsFeedMore(iEmployeeId, iPageNo) {
    AjaxPage("../home/pages.php?page=NewsFeed_Items&id=" + iEmployeeId + "&pno=" + iPageNo, "divNewsFeed" + iPageNo);
}



var imgMaximize = "../images/icons/iconDown.png";
var imgMinimize = "../images/icons/iconUp.png";

function MinMax(sImageId, sBlockId) {
    if ($("#" + sImageId).attr("src") == imgMaximize)
        Maximize(sImageId, sBlockId);
    else
        Minimize(sImageId, sBlockId);
}

function Minimize(sImageId, sBlockId) {
    $("#" + sBlockId).slideUp(800);
    $("#" + sImageId).attr("src", imgMaximize);
}

function Maximize(sImageId, sBlockId) {
    $("#" + sBlockId).slideDown(800);
    $("#" + sImageId).attr("src", imgMinimize);
}


function ChangePage(sPageURL) {
    $("#divContainerMain").html('<div align="center"><img style="margin-top:120px; margin-bottom:200px;" src="../images/loading.gif" /></div>');
    $("#divContainerMain").load(sPageURL);
}

function WebHRSearch(sSearch) {
    AjaxPage("../home/pages.php?page=Search&search=" + encodeURIComponent(sSearch), "divWebHRSearchResults");
    return (false);
}


function Message(sMessage) {
    aMessage = sMessage.split("|");

    iMessageType = aMessage[0];
    sMessage = aMessage[1];

    if (iMessageType == 1)      // Warning
    {
        var sTableColor = "#FFFFA9";
        var sImage = "../images/icons/iconWarning.png";
    }
    else if (iMessageType == 2)   // Success
    {
        var sTableColor = "#C4D2F7";
        var sImage = "../images/icons/iconInformation.png";
    }

    sReturn = '<div id="divInfoWindow"><br /><table width="80%" bgcolor="' + sTableColor + '" border="1" bordercolor="#C0C0C0" style="border-collapse:collapse;" cellpadding="0" cellspacing="0" align="center"><tr><td><table width="100%" border="0" align="center" cellspacing="0" cellpadding="0"><tr><td align="center" style="width:40px; height:50px;"><img src="' + sImage + '" border="0" /></td><td align="center" valign="middle" style="font-family:Trebuchet MS, Arial; font-size:12px;">' + sMessage + '</td><td style="width:16px;" valign="top" align="center"><a href="#noanchor" onclick="jQuery(\'#divInfoWindow\').slideUp(800);"><img src="../../hr/images/icons/iconClose.png" border="0" alt="Close" title="Close" /></a>&nbsp;</td></tr></table></td></tr></table><br /></div>';

    return (sReturn);
}

function MessageDialog(height, width) {
    $("#dialog:ui-dialog").dialog("destroy");
    $("#divMessageDialog").dialog({
        resizable: false,
        height: height,
        width: width,
        modal: true
    });

}

function AccessDenied() {
    $("#dialog:ui-dialog").dialog("destroy");
    $("#divAccessDenied").dialog({
        resizable: false,
        height: 240,
        width: 320,
        modal: true
    });
}

function RecruitCandidate(iJobCandidateId) {
    var sUserName = $("#txtUserName").val();
    var sPassword = $("#txtPassword").val();
    var iEmployeeType = $("#selEmployeeType").val();
    var iEmployeeCategory = $("#selEmployeeCategory").val();
    var iEmployeeDesignation = $("#selEmployeeDesignation").val();
    var iEmployeeGrade = $("#selEmployeeGrade").val();
    var iStation = $("#selStation").val();
    var iDepartment = $("#selDepartment").val();
    var iWorkShift = $("#selShift").val();

    if (sUserName == "") return (AlertFocus('Please enter a valid User Name', 'txtUserName'));
    if (sPassword == "") return (AlertFocus('Please enter a valid Password', 'txtPassword'));
    if (iEmployeeType <= 0) return (AlertFocus('Please select a valid Employee Type', 'selEmployeeType'));
    if (iEmployeeCategory <= 0) return (AlertFocus('Please select a valid Employee Category', 'selEmployeeCategory'));
    if (iEmployeeDesignation <= 0) return (AlertFocus('Please select a valid Employee Designation', 'selEmployeeDesignation'));
    if (iEmployeeGrade <= 0) return (AlertFocus('Please select a valid Employee Grade', 'selEmployeeGrade'));
    if (iStation <= 0) return (AlertFocus('Please select a valid Station', 'selStation'));
    if (iDepartment <= 0) return (AlertFocus('Please select a valid Department', 'selDepartment'));
    if (iWorkShift <= 0) return (AlertFocus('Please select a valid Work Shift', 'selShift'));

    var sFields = "&txtUserName=" + encodeURIComponent(sUserName) + "&txtPassword=" + encodeURIComponent(sPassword) + "&selEmployeeType=" + encodeURIComponent(iEmployeeType) + "&selEmployeeCategory=" + encodeURIComponent(iEmployeeCategory) + "&selEmployeeDesignation=" + encodeURIComponent(iEmployeeDesignation) + "&selEmployeeGrade=" + encodeURIComponent(iEmployeeGrade) + "&selStation=" + encodeURIComponent(iStation) + "&selDepartment=" + encodeURIComponent(iDepartment) + "&selWorkShift=" + encodeURIComponent(iWorkShift);
    $.colorbox({ href: '../home/pages.php?page=Recruitment_JobCandidates_ConfirmRecruitCandidate&id=' + iJobCandidateId + '&action=RecruitCandidate' + sFields, width: '600px;', height: '350px;' });

    return (false);
}

function PerformanceEvaluationQuestions(iPerformanceEvaluationId, iPerformanceEvaluationQuestionId, sAction) {
    var sFields;

    var sQuestion = $("#txtQuestion").val();
    var iQuestionType = $("#selQuestionType").val();

    var sChoice1 = $("#txtChoice1").val();
    var sChoice2 = $("#txtChoice2").val();
    var sChoice3 = $("#txtChoice3").val();
    var sChoice4 = $("#txtChoice4").val();
    var sChoice5 = $("#txtChoice5").val();
    var iAllowComments = $("#selAllowComments").val();
    var iMandatoryQuestion = $("#selMandatoryQuestion").val();
    var iQuestionOrder = $("#txtQuestionOrder").val();

    var iChoice1Score = $("#selChoice1Score").val();
    var iChoice2Score = $("#selChoice2Score").val();
    var iChoice3Score = $("#selChoice3Score").val();
    var iChoice4Score = $("#selChoice4Score").val();
    var iChoice5Score = $("#selChoice5Score").val();

    if (sQuestion == "") { alert("Please enter a valid Question"); $("#txtQuestion").focus(); return (false); }

    sFields = "&q=" + encodeURIComponent(sQuestion);
    sFields += "&t=" + encodeURIComponent(iQuestionType);
    sFields += "&c1=" + encodeURIComponent(sChoice1);
    sFields += "&c2=" + encodeURIComponent(sChoice2);
    sFields += "&c3=" + encodeURIComponent(sChoice3);
    sFields += "&c4=" + encodeURIComponent(sChoice4);
    sFields += "&c5=" + encodeURIComponent(sChoice5);
    sFields += "&c=" + encodeURIComponent(iAllowComments);
    sFields += "&m=" + encodeURIComponent(iMandatoryQuestion);
    sFields += "&o=" + encodeURIComponent(iQuestionOrder);
    sFields += "&c1s=" + encodeURIComponent(iChoice1Score);
    sFields += "&c2s=" + encodeURIComponent(iChoice2Score);
    sFields += "&c3s=" + encodeURIComponent(iChoice3Score);
    sFields += "&c4s=" + encodeURIComponent(iChoice4Score);
    sFields += "&c5s=" + encodeURIComponent(iChoice5Score);

    $.colorbox({ href: '../home/pages.php?page=Employees_PerformanceEvaluation_Questions_Operations&componenttitle=PerformanceEvaluation&id=' + iPerformanceEvaluationId + '&qid=' + iPerformanceEvaluationQuestionId + '&action=' + sAction + sFields, width: '700px;', height: '320px;' });
    return false;
}

function PerformanceEvaluationEmployeesEvaluations(iPerformanceEvaluationId, iPerformanceEvaluationEmployeesEvaluationId, sAction) {
    var sFields;

    var sEvaluationTitle = $("#txtEvaluationTitle").val();

    var sEvaluationFor = $("#selEvaluationFor").val();
    var sEvaluationBy = $("#selEvaluationBy").val();

    var sEvaluationStartDate = $("#txtEvaluationStartDate").val();
    var sEvaluationEndDate = $("#txtEvaluationEndDate").val();

    var iSendNotification = ($("#chkSendNotification").prop("checked")) ? 1 : 0;

    if (sEvaluationTitle == "") { alert("Please enter a valid Title for your Evaluation"); $("#txtEvaluationTitle").focus(); return (false); }
    if (sEvaluationFor == null) { alert("Please select atleast one employee in Evaluation For field"); $("#selEvaluationFor").focus(); return (false); }
    if (sEvaluationBy == null) { alert("Please select atleast one employee in Evaluation By field"); $("#selEvaluationBy").focus(); return (false); }

    sFields = "&t=" + encodeURIComponent(sEvaluationTitle);
    sFields += "&by=" + encodeURIComponent(sEvaluationBy);
    sFields += "&for=" + encodeURIComponent(sEvaluationFor);
    sFields += "&st=" + encodeURIComponent(sEvaluationStartDate);
    sFields += "&en=" + encodeURIComponent(sEvaluationEndDate);
    sFields += "&n=" + encodeURIComponent(iSendNotification);

    $.colorbox({ href: '../home/pages.php?page=Employees_PerformanceEvaluation_EmployeesEvaluations_Operations&componenttitle=PerformanceEvaluation&id=' + iPerformanceEvaluationId + '&eid=' + iPerformanceEvaluationEmployeesEvaluationId + '&action=' + sAction + sFields, width: '700px;', height: '320px;' });
    return false;
}

function FillPerformanceEvaluation(iPerformanceEvaluationId, iPerformanceEvaluationEmployeesEvaluationId, sEvaluationCode, iNumberOfQuestions) {
    var sFields = "";
    var iQuestionId;
    var iQuestionType;
    var iMandatoryQuestion;
    var iScore;
    var iAnswer;
    var iAllowComments;
    var sComments;

    for (i = 0; i < iNumberOfQuestions; i++) {
        iAnswer = 0;
        iScore = 0;
        iAllowComments = 0;
        sComments = "";

        iQuestionId = $("#hdnQuestionId_" + i).val();
        iQuestionType = $("#hdnQuestionType_" + i).val();
        iMandatoryQuestion = $("#hdnMandatoryQuestion_" + i).val();
        iAllowComments = $("#hdnQuestion_" + i + "_AllowComments").val();
        sComments = encodeURIComponent($("#Answer" + i + "_Comments").val());

        if (iQuestionType == 0)     // Radio Select
        {
            iAnswer = jQuery("input[name='Answer" + i + "']:checked").val();
            iScore = $("#hdnChoice" + iAnswer + "Score_" + i).val();
        }
        else if (iQuestionType == 1)    // Checkbox Select
        {
            iAnswer = (($("#Answer" + i + "_1").prop("checked")) ? 1 : 0) + "|" + (($("#Answer" + i + "_2").prop("checked")) ? 1 : 0) + "|" + (($("#Answer" + i + "_3").prop("checked")) ? 1 : 0) + "|" + (($("#Answer" + i + "_4").prop("checked")) ? 1 : 0) + "|" + (($("#Answer" + i + "_5").prop("checked")) ? 1 : 0);
            iScore = 0;
        }
        else if (iQuestionType == 2)    // Text
        {
            iAnswer = encodeURIComponent($("#Answer" + i).val());
            iScore = 0;
        }

        if ((!iAnswer) || (iAnswer == "0|0|0|0|0")) {
            if (iMandatoryQuestion == 1) {
                jQuery("html,body").animate({ scrollTop: $("#divQuestion" + i).offset().top }, "slow");
                return (false);
            }
            else
                iAnswer = 0;
        }

        sFields += "&q" + (i + 1) + "=" + iQuestionId + "&qt" + (i + 1) + "=" + iQuestionType + "&a" + (i + 1) + "=" + iAnswer + "&s" + (i + 1) + "=" + iScore + "&ac" + (i + 1) + "=" + iAllowComments + "&c" + (i + 1) + "=" + sComments;
    }

    AjaxPage("../home/pages.php?page=Employees_PerformanceEvaluation_SubmitPerformanceEvaluation&id=" + iPerformanceEvaluationId + "&eid=" + iPerformanceEvaluationEmployeesEvaluationId + "&no=" + iNumberOfQuestions + "&code=" + sEvaluationCode + sFields, "divEvaluationQuestions");
    return (false);
}

function LeavesTypes(iLeaveTypeId, sAction) {
    var sFields;

    var iStationId = $("#st").val();
    var sTitle = $("#t").val();
    var iLeavesAllowedPerYear = $("#lapy").val();

    var iLeaveType = $("#lt").val();
    var iLeavesCarryOver = $("#lco").val();
    var iLeavesEncashment = $("#le").val();
    var iStatus = $("#s").val();

    if (sTitle == "") { alert("Please enter a valid Title"); $("#t").focus(); return (false); }

    sFields = "&t=" + encodeURIComponent(sTitle);
    sFields += "&st=" + encodeURIComponent(iStationId);
    sFields += "&lapy=" + encodeURIComponent(iLeavesAllowedPerYear);
    sFields += "&lt=" + encodeURIComponent(iLeaveType);
    sFields += "&lco=" + encodeURIComponent(iLeavesCarryOver);
    sFields += "&le=" + encodeURIComponent(iLeavesEncashment);
    sFields += "&s=" + encodeURIComponent(iStatus);

    $.colorbox({ href: '../home/pages.php?page=Employees_Leaves_Types_Operations&id=' + iLeaveTypeId + '&action=' + sAction + sFields, width: '600px;', height: '320px;' });

    return false;
}


function RequisitionsTypes(iRequisitionTypeId, sAction) {
    var sFields;

    var sTitle = $("#t").val();
    var iForwardTo = $("#f").val();

    if (sTitle == "") { alert("Please enter a valid Title"); $("#t").focus(); return (false); }

    sFields = "&t=" + encodeURIComponent(sTitle);
    sFields += "&f=" + encodeURIComponent(iForwardTo);

    $.colorbox({ href: '../home/pages.php?page=Employees_Requisitions_Types_Operations&id=' + iRequisitionTypeId + '&action=' + sAction + sFields, width: '600px;', height: '320px;' });

    return false;
}

function EmployeeDesignations(iEmployeeDesignationId, sAction) {
    var sFields;

    var sName = $("#ndn").val();
    var iParentId = $("#pd").val();

    if (sName == "") { alert("Please enter a valid Designation Name"); $("#ndn").focus(); return (false); }

    sFields = "&n=" + encodeURIComponent(sName);
    sFields += "&pd=" + encodeURIComponent(iParentId);

    $.colorbox({ href: '../home/pages.php?page=Employees_Designations_Operations&id=' + iEmployeeDesignationId + '&action=' + sAction + sFields, width: '600px;', height: '320px;' });

    return false;
}

function EmployeeGrades(iEmployeeGradeId, sAction) {
    var sFields;
    var sGrade = $("#neg").val();
    if (sGrade == "") { alert("Please enter a valid Grade"); $("#neg").focus(); return (false); }
    sFields = "&g=" + encodeURIComponent(sGrade);
    $.colorbox({ href: '../home/pages.php?page=Employees_Grades_Operations&id=' + iEmployeeGradeId + '&action=' + sAction + sFields, width: '600px;', height: '320px;' });
    return false;
}

function JobTestQuestions(iJobTestId, iJobTestQuestionId, sAction) {
    var sFields;

    var sQuestion = $("#txtQuestion").val();
    var iQuestionType = $("#selQuestionType").val();

    var sAnswer1 = $("#txtAnswer1").val();
    var sAnswer2 = $("#txtAnswer2").val();
    var sAnswer3 = $("#txtAnswer3").val();
    var sAnswer4 = $("#txtAnswer4").val();

    var iQuestionOrder = $("#txtQuestionOrder").val();
    var iCorrectAnswer = $("#selCorrectAnswer").val();

    if (sQuestion == "") { alert("Please enter a valid Question"); $("#txtQuestion").focus(); return (false); }

    sFields = "&q=" + encodeURIComponent(sQuestion);
    sFields += "&t=" + encodeURIComponent(iQuestionType);
    sFields += "&a1=" + encodeURIComponent(sAnswer1);
    sFields += "&a2=" + encodeURIComponent(sAnswer2);
    sFields += "&a3=" + encodeURIComponent(sAnswer3);
    sFields += "&a4=" + encodeURIComponent(sAnswer4);
    sFields += "&o=" + encodeURIComponent(iQuestionOrder);
    sFields += "&ca=" + encodeURIComponent(iCorrectAnswer);

    $.colorbox({ href: '../home/pages.php?page=Recruitment_JobTests_Questions_Operations&id=' + iJobTestId + '&qid=' + iJobTestQuestionId + '&action=' + sAction + sFields, width: '700px;', height: '320px;' });
    return false;
}

function AddFavorite() {
    $("#imgFavorite").attr("src", "../images/icons/iconFavorite2.png");
}

/* Inbox */
function Inbox_ShowComposeWindow() {
    $("#divInbox_ComposeMessage").show();
    AjaxPage("../home/pages.php?page=Inbox_ShowCompose&type=window", "divInbox_ComposeMessage");
}

function ShowCompose() {
    ClearMessageSelect();
    AjaxPage("../home/pages.php?page=Inbox_ShowCompose", "divInboxMessage");
}

function DeleteThread(iInboxThreadId) {
    var sData = "page=Inbox_DeleteThread&id=" + iInboxThreadId;
    $.ajax({
        type: "POST",
        url: "../home/pages.php", data: sData,
        success: function (msg) {
            if (msg == "SUCCESS") {
                Folders(iCurrentFolder);
            }
            else
                alert(msg);
        }
    });

    return (false);
}

function ShowThread(iMessageNo, iMessageThreadId) {
    ClearMessageSelect();

    $("#divMessage_" + iMessageNo).css("background-image", "url(../images/backgrounds/BlueBG.png)");
    $("#divMessage_" + iMessageNo).css("color", "#fff");
    $("#rs_" + iMessageNo).val(1);
    AjaxPage("../home/pages.php?page=Inbox_ShowThread&id=" + iMessageThreadId, "divInboxMessage");
}

function SendReply(iInboxThreadId) {
    var sData;
    var sReplyMessage = $("#r").val();

    $("#btnReply").prop("disabled", true);
    $("#imgReply").show();

    if (sReplyMessage.length < 2) { alert("Please enter a valid Message"); return (false); }
    sData = "page=Inbox_SendReply&id=" + iInboxThreadId + "&r=" + encodeURIComponent(sReplyMessage);

    $.ajax({
        type: "POST",
        url: "../home/pages.php", data: sData,
        success: function (msg) {
            if (msg == "SUCCESS") {
                Folders(iCurrentFolder);
                AjaxPage("../home/pages.php?page=Inbox_ShowThread&id=" + iInboxThreadId, "divInboxMessage");
            }
            else {
                $("#btnReply").prop("disabled", false);
                alert(msg);
            }
        }
    });

    return (false);
}


function AddFolder() {
    sFolderName = $("#fn").val();
    AjaxPage("../home/pages.php?page=Inbox_ShowFolders&action=AddFolder&id=0&fn=" + encodeURIComponent(sFolderName), "divFolders");
    return (false);
}

function RemoveFolder(iFolderId) {
    AjaxPage("../home/pages.php?page=Inbox_ShowFolders&action=RemoveFolder&id=" + iFolderId, "divFolders");
}

function Folders(iFolderId) {
    iCurrentFolder = iFolderId;
    for (i = 0; i < aFolders.length; i++) {
        $("#divFolders_" + aFolders[i]).css("background-color", "#f9f9f9");
    }

    $("#divFolders_" + iFolderId).css("background-color", "#b7d9f4");
    AjaxPage("../home/pages.php?page=Inbox_Folders&id=" + iFolderId, "divThreads");
}


function MoveToFolder(iInboxThreadId, iFolderId) {
    var sData = "page=Inbox_MoveThread&id=" + iInboxThreadId + "&fid=" + iFolderId;
    $.ajax({
        type: "POST",
        url: "../home/pages.php", data: sData,
        success: function (msg) {
            if (msg == "SUCCESS") {
                Folders(iCurrentFolder);
            }
            else
                alert(msg);
        }
    });

    return (false);
}

function ClearMessageSelect() {
    var iReadStatus = 0;
    for (i = 1; i <= iInboxList; i++) {
        $("#divMessage_" + i).css("color", "#5a5a5a");

        iReadStatus = $("#rs_" + i).val();

        if (iReadStatus == 0)
            $("#divMessage_" + i).css("background-image", "url(../images/backgrounds/BlueBG2.png)");
        else
            $("#divMessage_" + i).css("background-image", "");
    }
}



function SendMessage(sType) {
    var sData;
    var sMessageTo = $("#as-values-hdnInbox_" + sType + "_Data").val();
    var sSubject = $("#Inbox_" + sType + "_s").val();
    var sMessage = $("#Inbox_" + sType + "_m").val();

    if (sSubject.length < 2) { alert("Please enter a valid Subject"); return (false); }
    if (sMessageTo.length < 2) { alert("Please select atleast one recipient"); return (false); }
    if (sMessage.length < 3) { alert("Please enter a valid Message"); return (false); }

    $("#btnInbox_" + sType + "_SendMessage").prop("disabled", true);
    $("#imgInbox_" + sType + "_SendMessage").show();

    sData = "page=Inbox_SendMessage&to=" + sMessageTo + "&m=" + encodeURIComponent(sMessage) + "&s=" + encodeURIComponent(sSubject);

    $.ajax({
        type: "POST",
        url: "../home/pages.php", data: sData,
        success: function (msg) {
            if (msg == "SUCCESS") {
                $("#divInbox_" + sType + "_MessageSendSuccess").show();
                $("#divInbox_" + sType + "_ComposeMessage").hide();
            }
            else {
                $("#btnInbox_" + sType + "_SendMessage").prop("disabled", false);
                alert(msg);
            }
        }
    });

    return (false);
}
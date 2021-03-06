<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <script src="/static/jquery-latest.js"></script>
    <style>
        .approved { background-color: #00FF00; }
    </style>
</head>
<body>
Approved:
<ul>
% for n, hw in approved:
    <li>${hw}: ${n}</li>
% endfor
</ul>

Unapproved:
<ul>
% for n, hw in unapproved:
    <li>${hw}: ${n}</li>
% endfor
</ul>

<br/>

% for app in applications:
<div class="${app.approved and 'approved' or 'unapproved'}" id="app_${app.id}">${app.username},${app.hardware},${app.text}</div>

% if not app.approved:
<a id="approve_${app.id}" href="#" onclick="approve(${app.id})">Approve</a>
% endif
% endfor

</body>
<script>
function approve(id) {
    $.ajax({
        url: '/approve',
        data: {'id': id},
        success: function (data){
            $('#app_' + id).addClass("approved");
            $('#approve_' + id).remove();
        }
    });
}
</script>
</html>

SELECT  concat('<a target="_new" href="%%WWWROOT%%/course/view.php?id=',c.id,'">',c.fullname,'</a>') as coursefullname, c.shortname, c.idnumber 
FROM prefix_role_assignments ra
JOIN prefix_user u ON u.id = ra.userid
JOIN prefix_context ctx ON ra.contextid = ctx.id
JOIN prefix_course c ON c.id = ctx.instanceid
left join (
SELECT c.id
FROM prefix_course AS c
JOIN prefix_enrol AS e ON e.courseid = c.id
JOIN prefix_user_enrolments AS ue ON ue.enrolid = e.id
WHERE ue.userid =%%USERID%%
) as ue ON ue.id=c.id
WHERE ra.roleid =1
AND ctx.contextlevel =50
and u.id=%%USERID%%
and ue.id is null

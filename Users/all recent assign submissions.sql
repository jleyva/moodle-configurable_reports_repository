select 
concat('<a target="_new" href="%%WWWROOT%%/course/view.php?id=',c.id,'">',c.fullname,'</a>') as coursefullname,
concat('<a href="%%WWWROOT%%/mod/assign/view.php?id=',cm.id,'">',a.name,'</a>') AS Assignment,
concat('<a href="%%WWWROOT%%/user/view.php?id=',u.id,'&course=',c.id,'">',concat(u.firstname,' ', u.lastname),'</a>') as Student,
u.username,
CONCAT('Participant ',aum.id) AS participant,
DATE_FORMAT(FROM_UNIXTIME(asm.timemodified),'%a, %d-%M-%Y, %H:%i:%s') as modified
from prefix_course as c
JOIN prefix_enrol AS e ON e.courseid = c.id
JOIN prefix_user_enrolments AS ue ON ue.enrolid = e.id
join prefix_course_modules as cm on cm.course=c.id
join prefix_assign as a on cm.instance=a.id
join prefix_assign_submission as asm on asm.assignment=a.id
join prefix_assign_user_mapping AS aum on aum.userid=asm.userid and aum.assignment=a.id
join prefix_user as u on u.id=asm.userid
where ue.userid=%%USERID%% and cm.module=1 and ABS(unix_timestamp()-asm.timemodified)<86400
order by asm.timemodified desc

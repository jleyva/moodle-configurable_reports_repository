SELECT CONCAT('Participant ',p.id) AS participant,
u.username, 
concat('<a href="%%WWWROOT%%/user/view.php?id=',u.id,'&course=',c.id,'">',concat(u.firstname,' ', u.lastname),'</a>') as Student,
concat('<a href="%%WWWROOT%%/mod/assign/view.php?id=',cm.id,'">',a.name,'</a>') AS Assignment, 
concat('<a href="%%WWWROOT%%/course/view.php?id=',c.id,'">',c.fullname,'</a>') AS Course
FROM prefix_assign_user_mapping AS p
JOIN prefix_user AS u ON u.id=p.userid
JOIN prefix_assign AS a ON a.id=p.assignment
JOIN prefix_course AS c ON a.course=c.id
JOIN prefix_course_modules AS cm ON cm.course=c.id and cm.instance=a.id and cm.module=1
WHERE p.assignment>0
AND %%COURSEID%%=c.id

CREATE VIEW  v_pointages_journalieres as 
select `db_software_sarl`.`pointages`.`id_users` AS `id_users`
,`db_software_sarl`.`pointages`.`date_pointage` AS `date_pointage`
,sum(timestampdiff(SECOND,`db_software_sarl`.`pointages`.`time_in`,`db_software_sarl`.`pointages`.`time_out`)) AS `total` 
from `db_software_sarl`.`pointages` 
group by `db_software_sarl`.`pointages`.`id_users`,`db_software_sarl`.`pointages`.`date_pointage`


INSERT INTO pointages_journaliere(id_users,date_pointages)
SELECT id_users,date_pointage FROM `pointages` where  group by id_users,date_pointage
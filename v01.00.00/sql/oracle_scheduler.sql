USER_SCHEDULER_JOBS
/
USER_SCHEDULER_JOB_LOG
/
select owner as schema_name,
       job_name,
       job_style,
       case when job_type is null
                 then 'PROGRAM'
            else job_type end as job_type,
       case when job_type is null
                 then program_name
                 else job_action end as job_action,
       start_date,
       case when repeat_interval is null
            then schedule_name
            else repeat_interval end as schedule,
       last_start_date,
       next_run_date,
       state
from sys.all_scheduler_jobs
order by owner,
         job_name;
/
USER_SCHEDULER_JOB_RUN_DETAIL
select
    j.job_name,
    j.enabled,
    j.state,
    j.last_start_date,
    j.next_run_date,
    s.sid,
    s.serial#,
    s.username,
    s.status AS session_status
FROM
    all_scheduler_jobs j
JOIN
    v$session s
    ON s.sid = j.session_id
WHERE
    j.state = 'RUNNING'
    AND s.status = 'ACTIVE';
/
exec sys.dbms_scheduler.STOP_JOB(job_name=>'SYS.ORA$AT_OS_OPT_SY_12856', force=>true);
/
select job_name,enabled,run_count from user_scheduler_jobs;
/
exec dbms_scheduler.run_job(job_name=>'BATCH_JOB', use_current_session=>false);
/
select job_name,session_id, slave_process_id, slave_os_process_id, elapsed_time, log_id
  from dba_scheduler_running_jobs;
/
select o.object_name, start_date, last_enabled_time, last_start_date, next_run_date, last_end_date
  from dba_objects o, sys.scheduler$_job j
 where o.object_id = j.obj# and j.obj# in (3715269, 3715270, 3715271);
/
select job_name, enabled, state, run_count, failure_count, retry_count, start_date, last_start_date, next_run_date
  from dba_scheduler_jobs v where job_name like '%PEOPLE%';
/
select job_name, enabled, state, run_count, failure_count, retry_count, start_date, last_start_date, next_run_date
  from dba_scheduler_jobs v where job_name like '%TEST_JOB%';
/
select s.program, s.module, s.action, s.sid, s.serial#, p.pid, p.spid, s.event
  from v$session s, v$process p
 where s.paddr=p.addr and s.program like '%J0%';
/
select job_name, enabled, state, run_count, failure_count, retry_count, start_date, last_start_date, next_run_date
  from dba_scheduler_jobs v where job_name like '%TEST_JOB%';

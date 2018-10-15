# cerner_2^5_2018

# This is a simple powershell script to create a scheduled job that will open a URL.
# After running this script, ensure the scheduled job is listed in Task Scheduler and that
# the task is set to "Run only when user is logged on" or it may not run correctly.
# To uninstall, run "Unregister-ScheduledJob -Name OpenURLOnSchedule" in powershell.

# This sets the date and schedule our job should be triggered. Set to whatever date/time you require.
$jobTrigger = New-JobTrigger -Weekly -DaysOfWeek Friday -At 3:45PM
 
# Set job options. 
$options = New-ScheduledJobOption -RunElevated
 
# This will create a scheduled job to open the URL specified. Set to whatever URL you want to open. An example could be your timesheet!
Register-ScheduledJob -Name OpenURLOnSchedule -Trigger $jobTrigger -scriptblock {Start "www.google.com"} -ScheduledJobOption $options
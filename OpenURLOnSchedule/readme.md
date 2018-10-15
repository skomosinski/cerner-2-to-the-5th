# OpenURLOnSchedule

This is a submission for Cerner's 2018 2^5 programming competition. This year's theme is "Engineering Productivity".

This is a simple powershell script to create a scheduled job that will open a URL. I've never used powershell and wanted to learn a bit about it, and decided to try to create a scheduled job. I will be using this to launch my timesheet in a browser every Friday. :)

After running this script, ensure the scheduled job is listed in Task Scheduler and that
the task is set to "Run only when user is logged on" or it may not run correctly.

To uninstall, run "Unregister-ScheduledJob -Name OpenURLOnSchedule" in powershell.

#### Line counts according to [cloc](https://github.com/AlDanial/cloc):

| Language | Blank Lines | Comments | Code |
| --- | ---: | ---: | ---: |
| PowerShell | 4 | 8 | 3 |

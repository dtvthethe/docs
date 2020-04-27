<?php

namespace xxxxxxx;

use ...

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        Commands\XXXCommand::class,
        // commands....
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     *
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // xxx:zzzzz => copy XXXCommand.php $signature
        // '* * * * *' -> every minute
        $schedule->command('xxx:zzzzz')->cron('* * * * *');
        // schedule...
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__ . '/Commands');

        require base_path('routes/console.php');
    }
}

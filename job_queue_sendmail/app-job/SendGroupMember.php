<?php

namespace App\Jobs;

use Exception;
use Illuminate\Bus\Queueable;
use App\Mail\GroupMemberMailer;
use Illuminate\Support\Facades\Mail;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class SendGroupMember implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $mailType;
    protected $mailTo;
    protected $mailTitle;
    protected $group;
    protected $user;

    /**
     * Create a new job instance.
     *
     * @param  int  $mailType
     * @param  string  $mailTo
     * @param  string  $mailTitle
     * @param  Group  $group
     * @param  User  $user
     */
    public function __construct($mailType ,$mailTo, $mailTitle, $group, $user)
    {
        $this->mailType = $mailType;
        $this->mailTo = $mailTo;
        $this->mailTitle = $mailTitle;
        $this->group = $group;
        $this->user = $user;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        Mail::to($this->mailTo)
            ->queue((new GroupMemberMailer($this->mailType, $this->mailTitle, $this->group, $this->user))
                ->onConnection('database'));
    }

    /**
     * The job failed to process.
     *
     * @param  Exception  $exception
     * @return void
     */
    public function failed(Exception $exception)
    {
        report($exception);
    }
}

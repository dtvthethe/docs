<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class GroupMemberMailer extends Mailable
{
    use Queueable, SerializesModels;

    protected $mailType;
    protected $mailTitle;
    protected $group;
    protected $user;

    /**
     * Create a new message instance.
     *
     * @param  int  $mailType
     * @param  string  $mailTitle
     * @param  Group  $group
     * @param  User  $user
     */
    public function __construct($mailType, $mailTitle, $group, $user)
    {
        $this->mailType = $mailType;
        $this->mailTitle = $mailTitle;
        $this->group = $group;
        $this->user = $user;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        if ($this->mailType == config('groups.email_type.remove')) {
            return $this->view('emails.remove_user_from_group', ['group' => $this->group, 'user' => $this->user])
                ->subject(trans($this->mailTitle));
        } else {
            return $this->view('emails.add_user_to_group', ['group' => $this->group, 'user' => $this->user])
                ->subject(trans($this->mailTitle));
        }
    }
}

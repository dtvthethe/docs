<?php

namespace xxxxxxx;

use ...

class XXXCommand extends Command
{
    private $abcService;

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'xxx:zzzzz';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This is description';

    /**
     * Create a new command instance.
     *
     * @param  ABCService  $abcService
     */
    public function __construct(ABCService $abcService)
    {
        parent::__construct();
        $this->abcService = $abcService;
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $this->abcService->functionABC();
    }
}

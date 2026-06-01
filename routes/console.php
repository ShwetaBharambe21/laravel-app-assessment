<?php

use Illuminate\Support\Facades\Schedule;

Schedule::call(function () {

    \Log::info('Scheduler Running');

})->everyMinute();
<?php
Route::group(['module' => 'Country', 'middleware' => ['auth','web'], 'namespace' => 'App\Modules\Country\Controllers'], function() {
    Route::resource('country', 'CountryController');
});
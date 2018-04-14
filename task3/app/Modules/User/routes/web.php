<?php
Route::group(['module' => 'User', 'middleware' => ['auth','web'], 'namespace' => 'App\Modules\User\Controllers'], function() {
    Route::get('/user/emailvalidation/{id}', array('as' => 'user.emailvalidation', 'uses' => 'UserController@emailvalidation'));
    Route::resource('user', 'UserController');
});
?>

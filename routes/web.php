<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/pointageReport', 'PointageReportController@index');
Route::get('attestation_travail', 'AdminDocumentsController@getUser');
Route::get('attestation_travail', 'AdminDocumentsController@goToAttestationTravail','$data');
Route::get('attestation_emploie', 'AdminDocumentsController@goToAttestationPoleEmploie');
Route::get('bulletin_paie', 'AdminDocumentsController@goToBulletinPaie');
Route::get('attestation_salaire', 'AdminDocumentsController@goToAttestationSalaire');
Route::get('attestation_stage', 'AdminDocumentsController@goToAttestationStage');
Route::get('accuse_reception', 'AdminDocumentsController@goToAccuseReception');




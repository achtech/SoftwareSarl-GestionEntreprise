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

Route::get('home','HomeController@exportDatabase');
Route::get('admin/congeReport','AdminCongesController@getListOfConge');
Route::get('admin/statusSalarie','AdminCongesController@getStatusSalarie');
//Route::get('admin/statusSalarie','AdminStatusSalarieController@getStatusSalarie');
Route::get('admin/PrimesProjects','AdminProjectsController@getListOfPrimes');
Route::get('admin/home','HomeController@index');
Route::get('/pointageReport', 'PointageReportController@printpdf');
Route::Post('attestation_travail', 'AdminDocumentsController@getUser');
Route::Post('attestation_stage', 'AdminDocumentsController@getAttestationStage');
Route::Post('attestation_salaire', 'AdminDocumentsController@getAttestationSalaire');
Route::Post('accuse_reception', 'AdminDocumentsController@getAccuseReception');
Route::Post('attestation_pole_emploi', 'AdminDocumentsController@getUserToGetAttestationEmploi');
//Route::get('attestation_travail/printpdf', 'AdminDocumentsController@printpdf');
Route::get('admin/attestation_travail_print', 'AdminDocumentsController@printpdf');
Route::get('admin/attestation_stage_print', 'AdminDocumentsController@printStagepdf');
Route::get('admin/attestation_salaire_print', 'AdminDocumentsController@printSalairepdf');
Route::get('admin/attestation_emploi_print', 'AdminDocumentsController@printpdfofAttesstationEmploi');
Route::get('admin/accuse_reception_print', 'AdminDocumentsController@printAccusepdf');
Route::get('attestation_travail', 'AdminDocumentsController@goToAttestationTravail','$data');
Route::get('attestation_stage', 'AdminDocumentsController@goToAttestationStage','$data');
Route::get('attestation_emploie', 'AdminDocumentsController@goToAttestationPoleEmploie');
Route::get('bulletin_paie', 'AdminDocumentsController@goToBulletinPaie');
Route::get('admin/statusSalarie/printpdf', 'AdminCongesController@printpdf');
Route::get('attestation_salaire', 'AdminDocumentsController@goToAttestationSalaire','$data');
//Route::get('attestation_stage', 'AdminDocumentsController@goToAttestationStage');
Route::get('accuse_reception', 'AdminDocumentsController@goToAccuseReception');
Route::get('admin/factures_impression/{id}', 'AdminFacturesController@imprimerFacture');
Route::get('admin/historique_salaire/{id}', 'AdminPersonnels36Controller@historiqueSalaire');
Route::get('admin/factures/{id}', 'AdminFacturesController@createFacture');




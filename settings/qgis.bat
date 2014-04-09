@echo off
call "%~dp0\o4w_env.bat"
call "%OSGEO4W_ROOT%"\apps\grass\grass-6.4.3\etc\env.bat
@echo off
path %OSGEO4W_ROOT%\apps\qgis\bin;%OSGEO4W_ROOT%\apps\grass\grass-6.4.3\lib;%PATH%
set QGIS_PREFIX_PATH=%OSGEO4W_ROOT:\=/%/apps/qgis
set GDAL_FILENAME_IS_UTF8=YES
rem Set VSI cache to be used as buffer, see #6448
set VSI_CACHE=TRUE
set VSI_CACHE_SIZE=1000000
start "QGIS" /B "%OSGEO4W_ROOT%"\bin\qgis-bin.exe --configpath C:\QGIS\Valmiera


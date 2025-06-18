@ECHO OFF



@REM warning: command length is limited by 8191 characters, and pattern is a part of this
@REM split into several patterns and called subsequently if bigger chunk of replacements is needed
set "PATTERN=BundleAwarePlan:DisneyBundlePlanAware,BundleSub:DisneyBundleSubs,DV_BundleSubFinal:DV_DisneyBundleSubFinal,DV_BundleSubFinalTotal:DV_BundleSubFinalTotalYN,DV_BundleSubPlanRebaseT:DV_BundleSubTypeRebaseT,DV_DisBundleIntent:DV_BundleIntentTrended,DV_DisBundleIntentFull:DV_BundleIntentTrendedFull,DV_DisBundleHeadroomHis:DV_BundleHeadroomHis"



REM 302_TRun_HuluMainFile.mrs
python textsubstitutions.py --file "302_TRun_HuluMainFile.mrs" --pattern "%PATTERN%" --wordmatch
if %ERRORLEVEL% NEQ 0 ( echo ERROR: Failure && pause && exit /b %errorlevel% )

REM 303_TRun_HuluKPIFile.mrs
python textsubstitutions.py --file "303_TRun_HuluKPIFile.mrs" --pattern "%PATTERN%" --wordmatch
if %ERRORLEVEL% NEQ 0 ( echo ERROR: Failure && pause && exit /b %errorlevel% )

REM 304_TRun_HuluMulticulturalQuarterly.mrs
python textsubstitutions.py --file "304_TRun_HuluMulticulturalQuarterly.mrs" --pattern "%PATTERN%" --wordmatch
if %ERRORLEVEL% NEQ 0 ( echo ERROR: Failure && pause && exit /b %errorlevel% )

REM 312_TRun_HuluSTK.mrs
python textsubstitutions.py --file "312_TRun_HuluSTK.mrs" --pattern "%PATTERN%" --wordmatch
if %ERRORLEVEL% NEQ 0 ( echo ERROR: Failure && pause && exit /b %errorlevel% )

REM T_Banners_HuluKPIsFile.mrs
python textsubstitutions.py --file "T_Banners_HuluKPIsFile.mrs" --pattern "%PATTERN%" --wordmatch
if %ERRORLEVEL% NEQ 0 ( echo ERROR: Failure && pause && exit /b %errorlevel% )

REM T_Banners_HuluMulticulturalQuarterly.mrs
python textsubstitutions.py --file "T_Banners_HuluMulticulturalQuarterly.mrs" --pattern "%PATTERN%" --wordmatch
if %ERRORLEVEL% NEQ 0 ( echo ERROR: Failure && pause && exit /b %errorlevel% )

REM T_Banners_HuluSTK.mrs
python textsubstitutions.py --file "T_Banners_HuluSTK.mrs" --pattern "%PATTERN%" --wordmatch
if %ERRORLEVEL% NEQ 0 ( echo ERROR: Failure && pause && exit /b %errorlevel% )

REM T_Banners_HuluTabsMainFile.mrs
python textsubstitutions.py --file "T_Banners_HuluTabsMainFile.mrs" --pattern "%PATTERN%" --wordmatch
if %ERRORLEVEL% NEQ 0 ( echo ERROR: Failure && pause && exit /b %errorlevel% )

REM T_Tables_HuluKPIsFile.mrs
python textsubstitutions.py --file "T_Tables_HuluKPIsFile.mrs" --pattern "%PATTERN%" --wordmatch
if %ERRORLEVEL% NEQ 0 ( echo ERROR: Failure && pause && exit /b %errorlevel% )

REM T_Tables_HuluMulticulturalQuarterly.mrs
python textsubstitutions.py --file "T_Tables_HuluMulticulturalQuarterly.mrs" --pattern "%PATTERN%" --wordmatch
if %ERRORLEVEL% NEQ 0 ( echo ERROR: Failure && pause && exit /b %errorlevel% )

REM T_Tables_HuluSTK.mrs
python textsubstitutions.py --file "T_Tables_HuluSTK.mrs" --pattern "%PATTERN%" --wordmatch
if %ERRORLEVEL% NEQ 0 ( echo ERROR: Failure && pause && exit /b %errorlevel% )

REM T_Tables_HuluTabsMainFile.mrs
python textsubstitutions.py --file "T_Tables_HuluTabsMainFile.mrs" --pattern "%PATTERN%" --wordmatch
if %ERRORLEVEL% NEQ 0 ( echo ERROR: Failure && pause && exit /b %errorlevel% )


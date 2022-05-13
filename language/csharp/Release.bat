@echo ------ git branch list: ------
@git branch

@echo ------ Pleas Input Target Branch: ------
@set /p TARGET_BRANCH=

@echo ------ git checkout %TARGET_BRANCH% ------
@git checkout %TARGET_BRANCH%

@echo ------ git pull ------
@git pull

@echo ------ git status ------
@git status

@pause

@rem Add path to MSBuild Binaries
@if exist "%ProgramFiles%\MSBuild\14.0\bin" set PATH=%ProgramFiles%\MSBuild\14.0\bin;%PATH%
@if exist "%ProgramFiles(x86)%\MSBuild\14.0\bin" set PATH=%ProgramFiles(x86)%\MSBuild\14.0\bin;%PATH%

@rem run MSBuild

@echo ------ Build started: Solution ------
@msbuild {Path\To\Solution}.sln /t:Rebuild /p:Configuration=Release  /consoleloggerparameters:ErrorsOnly

@mkdir %TARGET_BRANCH%
@mkdir %TARGET_BRANCH%\Release
@mkdir %TARGET_BRANCH%\Release\XML

@echo ------ Copy [Release] to [%TARGET_BRANCH%\Release] ------
@xcopy "{Path\To\Project}\bin\Release" ".\%TARGET_BRANCH%\Release" /S /E /I /Q /R /Y

@echo ------ Copy [XML scripts] to [%TARGET_BRANCH%] ------
@xcopy ".\XML" ".\%TARGET_BRANCH%\Release\XML" /S /E /I /Q /R /Y

@echo ------ Copy [DB scripts] to [%TARGET_BRANCH%] ------
@xcopy ".\DB" ".\%TARGET_BRANCH%\Release\DB" /S /E /I /Q /R /Y

@pause


@echo OFF
set destination = "/Game/Config"
set arg = %1
set p=%~1\..\Game\Config

echo %p%
copy "Config\game.cfg" %p%
copy "Config\PersistedSettings.json" %p%

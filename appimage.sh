#!/bin/bash
project_name="com.github.kmalkenneth.monilet"

echo "change directory"
cd "$(dirname "$0")" || exit
echo "$PWD"
ls

# echo "Verify directory"
# ./"$project_name" >AppDir/AppRun

echo "Change directory permissions"
chmod +x AppDir/AppRun

echo "Link icon"
ln -sr AppDir/usr/share/icons/hicolor/128x128/apps/"$project_name".svg AppDir/"$project_name".svg

echo "Copy desktop file"
cp AppDir/usr/share/applications/"$project_name".desktop AppDir/"$project_name".desktop

echo "Download appimagetool"
curl -L https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage -o appimagetool-x86_64.AppImage

echo "Change appimagetool permissions"
chmod +x appimagetool-x86_64.AppImage

echo "Create appimage"
my_event=""

if [ "${GITHUB_EVENT_NAME}" == 'release' ] && [ "${GITHUB_TAG_NAME}" ]; then
    my_event=GITHUB_EVENT_NAME
else
    my_event="continuous"
fi

ARCH=x86_64 ./appimagetool-x86_64.AppImage AppDir/ "${project_name}-${my_event}-x86_64.AppImage"

# Dan Walkes
# 2014-01-29
# Find the latest version and download file link from the OpenCV sourceforge page

# We only want the latest version 2 (not version 3.0 or later)
#-version="$(wget -q -O - http://sourceforge.net/projects/opencvlibrary/files/opencv-unix | egrep -m1 -o '\"[0-9](\.[0-9]+)+(-[-a-zA-Z0-9]+)?' | cut -c2-)"
version="$(wget -q -O - http://sourceforge.net/projects/opencvlibrary/files/opencv-unix | egrep -m1 -o '\"2(\.[0-9]+)+(-[-a-zA-Z0-9]+)?' | cut -c2-)"
downloadfilelist="opencv-$version.tar.gz opencv-$version.zip"
downloadfile=
for file in $downloadfilelist;
do
        wget --spider http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/$version/$file/download
        if [ $? -eq 0 ]; then
                downloadfile=$file
        fi
done
if [ -z "$downloadfile" ]; then
        echo "Could not find download file on sourceforge page.  Please find the download file for version $version at"
        echo "http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/$version/ and update this script"
        exit  1
fi

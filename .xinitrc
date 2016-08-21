if [ -f .Xresources ] ; then
    xrdb ~/.Xresources
fi

if [ -f .screenlayout/default.sh ] ; then
     .screenlayout/default.sh
fi

exec i3

if [ -f .Xresources ] ; then
    xrdb ~/.Xresources
fi

if [ -f .screenlayout/default.sh ] ; then
     .screenlayout/default.sh
fi

if [ -f .fehbg ] ; then
    .fehbg
fi

exec i3

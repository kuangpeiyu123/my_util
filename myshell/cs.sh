#!/bin/sh

if [ ! -f "./.ctagsignore" ]; then
    if [ ! -n "$1" ]; then
        ctags -R --languages=c,c++
    else
        ctags -R --languages=c,c++ $1
    fi
else
    if [ ! -n "$1" ]; then
        ctags -R --languages=c,c++ --exclude=@.ctagsignore
    else
        ctags -R --languages=c,c++ --exclude=@.ctagsignore $1
    fi
fi

if [ ! -n "$1" ]; then
    cscope -Rbq
else
    if [ ! -n "$2" ]; then
        find $1 -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" |egrep -v $2 >cscope.files
    fi
    cscope -Rbq -I cscope.files
fi

#cs "! -path './thirdparty'"

dln this is a really minimal autoconf file

AC_INIT([bigforth],[2.5.0],[http://sourceforge.net/tracker/?atid=101028&group_id=1028&func=browse])
AC_CANONICAL_HOST
AC_PATH_PROG(BASH, bash)

WINDOWS=""
ARCHFLAGS=""
INI=".bigforthrc"
XINI=".xbigforthrc"
EXTFLAGS=""

case "$host_os" in
	*win32|cygwin)
		#EXTFLAGS="-mno-cygwin"
		CC="${CC-i686-w64-mingw32-gcc}"
		WINDOWS="-mwindows"
		ARCHFLAGS=""
		INI="bigforth.ini"
		XINI="xbigforth.ini"
		ARCH="win32"
		;;
	*bsd*|*dragonfly*)
		EXTFLAGS="-DBSD"
		ARCH="bsd"
		;;
	linux)
		ARCH="linux"
		;;
	darwin*)
		EXTFLAGS="-DDARWIN"
		ARCHFLAGS="-m32"
		ARCH="osx"
		;;
	*)
		ARCH="linux" # default to Linux
		;;
esac

AC_PROG_CC

case "$host_cpu" in
	*x86_64*)
		ARCHFLAGS="-m32"
		;;
esac

test "x$prefix" = xNONE && prefix=$ac_default_prefix
exec_prefix=$prefix
libdir=${libdir/64/}
libdirpath=`eval echo ${libdir}`

AC_CHECK_LIB(dl,dlopen)
AC_SUBST(EXTFLAGS)
AC_SUBST(ARCHFLAGS)
AC_SUBST(WINDOWS)
AC_SUBST(libdirpath)
AC_SUBST(INI)
AC_SUBST(XINI)
AC_SUBST(ARCH)

AC_OUTPUT(Makefile $INI $XINI)

\ portable network graphics

[defined] VFXFORTH [IF]
minos
library: libpng16.so.16

    LocalExtern: png_create_read_struct void * png_create_read_struct( int , int , char * , int );
    LocalExtern: png_create_info_struct void * png_create_info_struct( char * );
    LocalExtern:  png_destroy_read_struct void png_destroy_read_struct( char * , char * , char * );
    LocalExtern: png_read_png void png_read_png( char * , int , char * , char * );
    LocalExtern: png_init_io void png_init_io( char * , char * );
    LocalExtern: png_get_rows void * png_get_rows( char * , char * );
    LocalExtern: png_read_end void png_read_end( char * , char * );
    LocalExtern: png_free_data void png_free_data( int , int , char * , char * );
    
    LocalExtern: fdopen void * fdopen( char * , int );
    LocalExtern: _dup int dup( int , int );
    LocalExtern: setjmp int setjmp( void * );

    : init-png-lib ; \ not supported in VFX Forth
    true value png16
[ELSE]
    also DOS
    
    [defined] osx [IF]
	s" /usr/X11/lib/libpng16.dylib" file-status nip 0= [IF]
	    library libpng /usr/X11/lib/libpng16.dylib
	[THEN]
        : init-png-lib ; \ not necessary on Mac OS X
        true value png16
    [ELSE]
	[defined] bsd [IF]
	    library libpng libpng.so
	    : init-png-lib ; \ not necessary on BSD
	    true Value png3
	[ELSE]
	    true Value png16
	    library libpng libpng16.so.16
	    : init-png-lib ;
	[THEN]
    [THEN]
    
    legacy off
    
    libpng png_create_read_struct int ptr int int (ptr) png_create_read_struct
    libpng png_create_info_struct ptr (ptr) png_create_info_struct
    libpng png_destroy_read_struct ptr ptr ptr (void) png_destroy_read_struct
    libpng png_read_png ptr ptr int ptr (void) png_read_png
    libpng png_init_io ptr ptr (void) png_init_io
    libpng png_get_rows ptr ptr (ptr) png_get_rows ( read info -- rows )
    libpng png_read_end ptr ptr (void) png_read_end ( png info -- )
    libpng png_free_data ptr ptr int int (void) png_free_data ( png info mask seq -- )
    
    libc fdopen int ptr (ptr) fdopen
    libc _dup int (int) dup
    libc setjmp ptr (int) setjmp
    previous
[THEN]

Variable user_error_ptr

: info-struct ( readstruc -- infostruc readstruc ) >r
    r@ png_create_info_struct
    dup 0= IF  rp@ 0 0 png_destroy_read_struct
        true abort" no info struct"
    THEN r> ;

: init-png ( -- infostruc readstruc )
    init-png-lib
    0" 1.6.0" user_error_ptr ['] noop dup png_create_read_struct
    dup 0= abort" PNG: no read structure"
    info-struct dup setjmp IF
        dup png_destroy_read_struct
        true abort" PNG: setjmp received"
    THEN ;

struct{
cell width
cell height
cell valid
cell rowbytes
cell palette
short num_palette
short num_trans
byte bit_depth
byte color_type
byte compression_type
byte filter_type
byte interlace_type
byte channels
byte pixel_depth
byte spare_byte
8 string signature
8 string gamma
} png_info_struct

Variable color_type

: png2array ( readstruc infostruc -- addr w h color_type )
    dup png_info_struct width @
    over png_info_struct height @
    over2 png_info_struct color_type c@
    3 pick png_info_struct rowbytes @
    { png info w h ctype rowbytes }
    png info png_get_rows
    w h * cells NewPtr tuck
    h 0 ?DO  over @ over rowbytes move  cell rowbytes d+  LOOP
    2drop w h
\    png info png_read_end
    png info $7FFF -1 png_free_data ctype ;

also DOS

$0095 Value pngflags

: read-png-image ( fd -- addr w h color_type ) >r
    r@ [defined] filehandle [IF] filehandle @ [THEN]
    0" r" fdopen dup
    init-png >r r@ rot png_init_io
    r@ over pngflags 0 png_read_png
    nip r>
    r> close-file throw
    swap png2array ;

previous

\ \needs xconst | import xconst
\ \needs xrender include xrender.fs
also memory also xconst also x11 also xrender also minos

Create ARGB32
0 ,    \ id - dummy
1 ,    \ direct
$20 ,  \ depth
$10 w, \ red
$FF w,
8 w,   \ green
$FF w,
$0 w,  \ blue
$FF w,
$18 w, \ alpha
$FF w,
0 ,    \ colormap - dummy

: read-png-rgba ( img w h -- pixmap mask w h )
    screen xrc dpy @ 0 0 0 0 0 { img w h dpy pixmap rgba32 mpict ximg gc }
    dpy screen xwin @ w h $20 XCreatePixmap
    ARGB32 @ 0= IF
	dpy PictStandardARGB32 XRenderFindStandardFormat
	ARGB32 $20 move  THEN
    ARGB32 2dup dpy -rot 0 0 XRenderCreatePicture
    to mpict to rgba32 to pixmap
    dpy dup dup DefaultScreen DefaultVisual $20 ZPixmap 0 img w h $20 w 4*
    XCreateImage  dpy pixmap 0 0 XCreateGC to gc to ximg
    dpy pixmap gc ximg 0 0 0 0 w h XPutImage
    dpy gc XFreeGC
    ximg XImage data off  ximg XDestroyImage   img DisposPtr
    mpict -1 w h ;

: read-png-rgb ( img w h -- pixmap mask w h )
    pixmap-format XPixmapFormatValues bits_per_pixel @ 3 >>
    { data w h bits }
    data w h * 3* <>.24
    data w h * 3* w h
    create-pixmap 0 -rot ;

: read-png ( fd -- pixmap mask w h )
    read-png-image 4 and IF
	read-png-rgba
    ELSE
	read-png-rgb
    THEN ;
    
previous previous previous previous previous

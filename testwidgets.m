#! xbigforth
\ automatic generated code
\ do not edit

also editor also minos also forth

menu-window class test-widgets
public:
  early widget
  early open
  early all-open
  early modal-open
  viewport ptr view0
  info-menu ptr coolness
  topindex ptr (topindex-00)
  topindex ptr (topindex-01)
  topindex ptr (topindex-02)
  button ptr clone-button
  beamer ptr beam1
  canvas ptr nikolaus
  infotextfield ptr tex
  vabox ptr topics
  vabox ptr sub-topics
 ( [varstart] ) cell var cv1task
cell var kill-me
early draw-cv1 ( [varend] ) 
how:
  : open       screen self new >o show o> ;
  : all-open   screen self new >o show up@ app ! o> ;
  : modal-open screen self new >o show stop o> ;
class;

component class sub-menu1
public:
  early widget
  early open
  early dialog
  early open-app
 ( [varstart] )  ( [varend] ) 
how:
  : open     new DF[ 0 ]DF s" No Title" open-component ;
  : dialog   new DF[ 0 ]DF s" No Title" open-dialog ;
  : open-app new DF[ 0 ]DF s" No Title" open-application ;
class;

component class menu1
public:
  early widget
  early open
  early dialog
  early open-app
 ( [varstart] )  ( [varend] ) 
how:
  : open     new DF[ 0 ]DF s" No Title" open-component ;
  : dialog   new DF[ 0 ]DF s" No Title" open-dialog ;
  : open-app new DF[ 0 ]DF s" No Title" open-application ;
class;

component class color-menu1
public:
  early widget
  early open
  early dialog
  early open-app
 ( [varstart] )  ( [varend] ) 
how:
  : open     new DF[ 0 ]DF s" No Title" open-component ;
  : dialog   new DF[ 0 ]DF s" No Title" open-dialog ;
  : open-app new DF[ 0 ]DF s" No Title" open-application ;
class;

component class calc
public:
  early widget
  early open
  early dialog
  early open-app
  infotextfield ptr a#
  infotextfield ptr b#
  infotextfield ptr r#
 ( [varstart] )  ( [varend] ) 
how:
  : open     new DF[ 0 ]DF s" Calculator" open-component ;
  : dialog   new DF[ 0 ]DF s" Calculator" open-dialog ;
  : open-app new DF[ 0 ]DF s" Calculator" open-application ;
class;

calc implements
 ( [methodstart] )  ( [methodend] ) 
  : widget  ( [dumpstart] )
        ^^ SN[  ]SN ( MINOS ) &0. ]N ( MINOS ) S" A:" infotextfield new  ^^bind a#
        ^^ SN[  ]SN ( MINOS ) &0. ]N ( MINOS ) S" B:" infotextfield new  ^^bind b#
          ^^ S[ a# get b# get d+ r# assign ]S ( MINOS ) S" +" button new 
          ^^ S[ a# get b# get d- r# assign ]S ( MINOS ) S" -" button new 
          ^^ S[ a# get b# get d* r# assign ]S ( MINOS ) S" *" button new 
          ^^ S[ a# get b# get drop ud/mod r# assign drop ]S ( MINOS ) S" /" button new 
          ^^ S[ a# get 1. b# get drop 0 ?DO 2over d* LOOP r# assign 2drop ]S ( MINOS ) S" ^" button new 
          ^^ S[ r# get a# assign ]S ( MINOS ) S" >A" button new 
          ^^ S[ r# get b# assign ]S ( MINOS ) S" >B" button new 
        &7 hatbox new &1 hskips
        ^^ SN[  ]SN ( MINOS ) &0. ]N ( MINOS ) S" R:" infotextfield new  ^^bind r#
      &4 vabox new panel
    ( [dumpend] ) ;
  : init  ^>^^  assign  widget 1 super init ;
class;

color-menu1 implements
 ( [methodstart] )  ( [methodend] ) 
  : widget  ( [dumpstart] )
        ^^ S[ gray-colors s" Gray" test-widgets coolness assign ]S ( MINOS ) S" Gray" menu-entry new 
        ^^ S[ red-colors s" Red" test-widgets coolness assign ]S ( MINOS ) S" Red" menu-entry new 
        ^^ S[ blue-colors s" Blue" test-widgets coolness assign ]S ( MINOS ) S" Blue" menu-entry new 
        ^^ S[ bisque-colors s" Bisque" test-widgets coolness assign ]S ( MINOS ) S" Bisque" menu-entry new 
          $0 $1 *hfil $0 $1 *vfil glue new 
        &1 habox new -&1 borderbox
        ^^ S[ paper s" Paper" test-widgets coolness assign ]S ( MINOS ) S" Paper" menu-entry new 
        ^^ S[ wood s" Wood" test-widgets coolness assign ]S ( MINOS ) S" Wood" menu-entry new 
        ^^ S[ water s" Water" test-widgets coolness assign ]S ( MINOS ) S" Water" menu-entry new 
        ^^ S[ water1 s" Caustics" test-widgets coolness assign ]S ( MINOS ) S" Caustics" menu-entry new 
        ^^ S[ marble s" Red Marble" test-widgets coolness assign ]S ( MINOS ) S" Red Marble" menu-entry new 
        ^^ S[ cracle s" Cracle" test-widgets coolness assign ]S ( MINOS ) S" Cracle" menu-entry new 
        ^^ S[ mono s" Mono" test-widgets coolness assign ]S ( MINOS ) S" Mono" menu-entry new 
      &12 vabox new &2 borderbox
    ( [dumpend] ) ;
  : init  ^>^^  assign  widget 1 super init ;
class;

menu1 implements
 ( [methodstart] )  ( [methodend] ) 
  : widget  ( [dumpstart] )
        ^^ S[ s" Menu 0" test-widgets tex assign ]S ( MINOS ) S" Menu 0" menu-entry new 
        ^^ S[ s" Menu 1" test-widgets tex assign ]S ( MINOS ) S" Menu 1" menu-entry new 
        ^^ S[ s" Menu 2" test-widgets tex assign ]S ( MINOS ) S" Menu 2" menu-entry new 
      &3 vabox new &2 borderbox
    ( [dumpend] ) ;
  : init  ^>^^  assign  widget 1 super init ;
class;

sub-menu1 implements
 ( [methodstart] )  ( [methodend] ) 
  : widget  ( [dumpstart] )
        ^^ S[ s" Menu 0" test-widgets tex assign ]S ( MINOS ) S" Menu 0" menu-entry new 
        ^^ S[ s" Menu 1" test-widgets tex assign ]S ( MINOS ) S" Menu 1" menu-entry new 
        M: menu1 widget S" Sub-Menu" sub-menu new 
        ^^ S[ s" Menu 2" test-widgets tex assign ]S ( MINOS ) S" Menu 2" menu-entry new 
      &4 vabox new &2 borderbox
    ( [dumpend] ) ;
  : init  ^>^^  assign  widget 1 super init ;
class;

test-widgets implements
 ( [methodstart] ) : beam-clone  beam1 self
  screen self window new window with
      beamer with clone endwith s" Clone" assign show
  endwith ;
: show ( -- )
    &300 &400 geometry dpy sync super show  beam-clone ;
: xto ( x y n1 n2 -- )
    2dup >=
    IF    - $100 min tuck * 8 >> >r * 8 >> r> canvas to
    ELSE  2drop 2drop  THEN ;
: draw-cv1 ( o -- flag )
    canvas with
        $300 $400 steps
        timer@ $E << $1000 um* nip >r
        clear
         2 linewidth
         $00 $00 $FF rgb> drawcolor
         $FF $00 $00 rgb> fillcolor
         $080  $380 home!  path
         $000  $200 r@ $100 xto
         $100  $100 r@ $200 xto
         $100 -$100 r@ $300 xto
        -$200  $000 r@ $400 xto
         $200 -$200 r@ $500 xto
         $000  $200 r@ $600 xto
        -$200 -$200 r@ $700 xto
         $200  $000 r@ $800 xto
        r@ $900 >= IF  canvas fill  THEN  canvas stroke
        1 1 textpos
        icon" icons/green-dot" icon
        1 0 textpos
        r@ $000 $200 within IF s" wer" THEN
        r@ $200 $300 within IF s" malt" THEN
        r@ $300 $400 within IF s" das" THEN
        r@ $400 $500 within IF s" Haus" THEN
        r@ $500 $600 within IF s" vom" THEN
        r@ $600 $700 within IF s" Ni-" THEN
        r@ $700 $800 within IF s" Niko-" THEN
        r@ $800 >= IF s" Nikolaus" THEN  canvas text
        0 linewidth
        r> $900 >=
    endwith ;
: start-cv1
    cv1task @ IF  draw-cv1 drop  EXIT  THEN
    1 $1000 dup NewTask dup cv1task !  pass
    canvas with
        shown on
        BEGIN  ^ draw-cv1 dpy sync
            IF
                BEGIN
                    -1 &30 idle
                    timer@ $E << &1000 um* nip $100 <
                UNTIL
            ELSE  -1 &30 idle  THEN
            outer with kill-me @ endwith  UNTIL
    outer with
        kill-me @ IF  test-widgets :: dispose  THEN
    endwith endwith ;
: dispose  kill-me on ; ( [methodend] ) 
  : widget  ( [dumpstart] )
        M: menu1 widget S"  bigFORTH " menu-title new 
        M: sub-menu1 widget S"  File " menu-title new 
        M: color-menu1 widget S"  Options " menu-title new 
        $0 $1 *hfilll $0 $1 *vfil rule new 
      &4 hbox new vfixbox  &2 borderbox
        1 1 viewport new  ^^bind view0 DS[ 
                  ^^ S[ s" Testbutton" tex assign ]S ( MINOS ) S" Testbutton" lbutton new 
                    ^^ S[ s" Button 1" tex assign ]S ( MINOS ) S" Button 1" button new 
                    ^^ S[ s" But 2" tex assign ]S ( MINOS ) S" But 2" button new 
                    $10 $1 *hfil $10 $1 *vfil glue new 
                    ^^ S[ s" Button 3" tex assign ]S ( MINOS ) S" Button 3" button new 
                  &4 hatbox new &2 hskips &2 borderbox
                  M: color-menu1 widget S" Coolness:" info-menu new  ^^bind coolness
                      0 0 flipper S" Index 0" topindex new ^^bind (topindex-00)
                      0 0 flipper S" Index 1" topindex new ^^bind (topindex-01)
                      0 -1 flipper S" Index 2" topindex new ^^bind (topindex-02)
                      topglue new 
                    &4 harbox new
                        ^^ S[ s" Index 0" tex assign ]S ( MINOS ) S" Index 0" button new 
                        ^^ S[ s" Klick mal" tex assign ]S ( MINOS ) S" Klick mal" button new 
                        $10 $1 *hfilll $10 $1 *vfil glue new 
                      &3 harbox new flipbox  panel dup ^^ with C[ (topindex-00) ]C ( MINOS ) endwith 
                        ^^ S[ s" Index 1" tex assign ]S ( MINOS ) S" Index 1" button new 
                        ^^ S[ s" Kuck mal" tex assign ]S ( MINOS ) S" Kuck mal" button new 
                        $10 $1 *hfil $10 $1 *vfil glue new 
                      &3 hartbox new flipbox  panel dup ^^ with C[ (topindex-01) ]C ( MINOS ) endwith 
                        ^^ S[ s" Kuck" tex assign ]S ( MINOS ) S" Kuck" button new  font" -*-times new roman-medium-r-*--17-*-*-*-p-0-iso8859-15"
                        ^^ S[ s" mal" tex assign ]S ( MINOS ) S" mal" button new  font" -*-times new roman-medium-i-*--17-*-*-*-p-0-iso8859-15"
                        ^^ S[ s" wer" tex assign ]S ( MINOS ) S" wer" button new  font" -*-times new roman-bold-r-*--17-*-*-*-p-0-iso8859-15"
                        ^^ S[ s" da" tex assign ]S ( MINOS ) S" da" button new  font" -*-times new roman-bold-i-*--17-*-*-*-p-0-iso8859-15"
                        ^^ S[ s" spricht" tex assign ]S ( MINOS ) S" spricht" button new 
                      &5 harbox new panel dup ^^ with C[ (topindex-02) ]C ( MINOS ) endwith 
                    &3 habox new $10  noborderbox  &2 borderbox
                  &2 vabox new
                  ^^ S[ s" Button 4" tex assign ]S ( MINOS ) S" Button 4" button new 
                      ^^ S[ s" Printer-Icon" tex assign ]S ( MINOS )  icon" icons/printer" S" Printer-Icon" big-icon new 
                      $0 $1 *hfilll $10 $1 *vfilll rule new 
                        ^^ S[ beam-clone ]S ( MINOS ) S" Clone" button new  ^^bind clone-button
                      &1 habox new
                    &3 vabox new hfixbox 
                      :beamer beamer new  ^^bind beam1 D[ 
		        doublebuffer new D[
                          CV[ outer with nikolaus self start-cv1 endwith ]CV ( MINOS ) ^^ CK[ 2drop 2drop  ]CK ( MINOS ) $10 $A *hfil $10 $A *vfil canvas new  ^^bind nikolaus
                        &1 habox new ]D ( MINOS ) 
                      &1 habox new ]D ( MINOS ) 
                    &1 habox new -&2 borderbox
                  &2 habox new &1 hskips
                  ^^ ST[  ]ST ( MINOS ) T" " S" Text:" infotextfield new  ^^bind tex
                    ^^ 0 &64 &16 SL[ extend under dabs <# #S rot sign #> tex assign ]SL ( MINOS ) hslider new 
                    ^^ 0 &64 &16 SL[ extend under dabs <# #S rot sign #> tex assign ]SL ( MINOS ) hslider new 
                  &2 habox new
                  ^^ &0 &1000 SC[ extend under dabs <# #S rot sign #> tex assign ]SC ( MINOS ) hscaler new  -&500 SC# 
                        ^^  0 T[ topics +flip ][ ( MINOS ) topics -flip ]T ( MINOS ) S" -" T" +" togglebutton new 
                      &1 habox new hfixbox 
                      ^^ S[ s" Flip It" tex assign ]S ( MINOS ) S" Flip It!" lbutton new 
                    &2 habox new
                        $10 $1 *hpix $10 $1 *vfil rule new 
                          ^^ S[ sub-topics flip ]S ( MINOS ) S" Topic A" lbutton new 
                              $10 $1 *hpix $10 $1 *vfil rule new 
                                ^^ S[ s" Sub-Topic A.0" tex assign ]S ( MINOS ) S" Sub-Topic A.0" lbutton new 
                                ^^ S[ s" Sub-Topic A.1" tex assign ]S ( MINOS ) S" Sub-Topic A.1" lbutton new 
                                ^^ S[ s" Sub-Topic A.2" tex assign ]S ( MINOS ) S" Sub-Topic A.2" lbutton new 
                              &3 vabox new
                            &2 habox new
                          &1 vabox new ^^bind sub-topics flipbox 
                          ^^ S[ s" Topic B" tex assign ]S ( MINOS ) S" Topic B" lbutton new 
                          ^^ S[ s" Topic C" tex assign ]S ( MINOS ) S" Topic C" lbutton new 
                        &4 vabox new
                      &2 habox new
                    &1 vabox new ^^bind topics flipbox 
                  &2 vabox new
                &10 vabox new panel
                ^^ &0 &10000 SC[ 0 <# #S #> tex assign ]SC ( MINOS ) vscaler new 
              &2 habox new
              vrtsizer new 
            &2 vasbox new
            $10 $1 *hfil $0 $1 *vfil rule new 
              vrtsizer new 
                  $0 $1 *hfil $0 $1 *vfil rule new 
                  hrtsizer new 
                &2 hasbox new
                  1 1 vviewport new  DS[ 
                        ^^ -1 T[  ][ ( MINOS )  ]T ( MINOS )  2icon" icons/mini-cross"icons/mini-exclam" S" Toggle 0" ticonbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS )  2icon" icons/mini-cross"icons/mini-exclam" S" Toggle 1" ticonbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS )  2icon" icons/mini-cross"icons/mini-exclam" S" Toggle 2" ticonbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS )  2icon" icons/mini-cross"icons/mini-exclam" S" Toggle 3" ticonbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS ) S" Toggle 4" rbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS ) S" Toggle 5" rbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS ) S" Toggle 6" rbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS ) S" Toggle 7" rbutton new 
                      &8 varbox new
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS )  2icon" icons/red-dot"icons/green-dot" S" Toggle 8" ticonbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS )  2icon" icons/red-dot"icons/green-dot" S" Toggle 9" ticonbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS )  2icon" icons/red-dot"icons/green-dot" S" Toggle A" ticonbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS )  2icon" icons/red-dot"icons/green-dot" S" Toggle B" ticonbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS ) S" Toggle C" tbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS ) S" Toggle D" tbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS ) S" Toggle E" tbutton new 
                        ^^  0 T[  ][ ( MINOS )  ]T ( MINOS ) S" Toggle F" tbutton new 
                      &8 vabox new
                    &2 habox new
                  &1 vabox new ]DS ( MINOS ) 
                  hrtsizer new 
                &2 hasbox new
                $0 $1 *hfil $0 $1 *vfil rule new 
              &3 habox new
            &2 vasbox new
          &3 vabox new
        &1 habox new ]DS ( MINOS ) 
      &1 vabox new
    ( [dumpend] ) ;
  : title$  s" bigFORTH" ;
  : init  super init  ^ to ^^
    widget 1 0 modal new  title$ assign ;
class;

: main
  calc open-app
  test-widgets all-open
  $2 0 ?DO  stop  LOOP bye ;
script? [IF]  main  [THEN]
previous previous previous

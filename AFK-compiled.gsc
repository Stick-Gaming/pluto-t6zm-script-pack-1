?GSC
     ?	  6  ?	  <  z  "  ?  ?      @ e  2        AFK maps/mp/zombies/_zm_utility maps/mp/_utility maps/_utility common_scripts/utility maps/mp/zombies/_zm_spawner maps/mp/gametypes_zm/_hud_message maps/mp/gametypes_zm/_hud_util init onplayerconnect afkcommandlistener afkcheck end_game connected player afk_listener disconnect setupdone isafk flag_wait initial_blackscreen_passed iprintln AFK system creaded by ^2Nathan3197 afkcooldown int afk_cooldown autokick afk_autokick distoturnoff afk_distoturnoff autoafk afk_AutoAFK debugmode afk_debug afk_allowautoAFK allowautoafk playernamet name counter autokicktimer kickingplayernow afkdebug noinputafk autoafkcommandlisten ^2Thread AFK Listener ^2Counter before going AFK is ^2 iprintlnbold ^1You have ^3  ^1second until you can go ^2AFK ^3again adsbuttonpressed actionslotfourbuttonpressed Ready for player to enter AFK afkon attackbuttonpressed jumpbuttonpressed meleebuttonpressed throwbuttonpressed actionslotonebuttonpressed actionslottwobuttonpressed actionslotthreebuttonpressed sprintbuttonpressed changeseatbuttonpressed secondaryoffhandbuttonpressed fragbuttonpressed usebuttonpressed distance old_origin origin Player has press a button turning off AFK allclientsprint ^2 ^7 is ^1NOT ^6AFK^7 afkoff waittillframeend afkbargui processbar2 createprimaryprogressbar setpoint CENTER color bar alpha archived afk_text newclienthudelem x y alignx center aligny middle horzalign fullscreen vertalign fontscale hidewheninmenu label You be kick in:^1  fadeovertime updatebar setvalue destroyelem start_zombie_round_logic sessionstate playing prevorigin movecounter afkcommand .afk autoafkoff .autoafk say message isstrstart tolower Auto_AFK_toggle tell auto afk off tolowercase text Thread AFKON, enable afk ^7 is ^6AFK^7 setclantag ignoreme enableinvulnerability afkautokick destroy You need to wait a round before you can go afk. Thread AFKOFF dissable afk disableinvulnerability  nomultikickers KickingPlayernow player is AFK Timer and has ^2 ^7 untill kick ^1You will be kicked in ^2  ^6Seconds Player has been afk for longer then the timer kicking the player kicktheplayer _a992 _k992 players Kicking ^6  ^7For being AFK for to long executecommand clientkick_for_reason   getentitynumber  "  ^3Server^7: ^6You Where ^2AFK^6 For To Long " countdowntoendgame countdown4 countdownislive peoplespec peoplealive _a992 _k992 getplayers spectator printtoallplayeraboutafkwarning ^1All alive players are ^3AFK! ^1the match is about to restart in ^6 msg _a992 _k992 D   `   q      ?   ?   ?   &-4    ?   6-4      6-4      6 7
 $W
 -U$ %- 4   >  6???  &
$W
 $W
 KW! V(!`(-
 p. f  6-
 ?0    ?  6+-
 ?i.    ?  !?(-
?i.    ?  !?(-
?i.    ?  !?(-
i.    ?  !(-
&i.    ?  !(  ?F;  !?(  ?F; 	  ,!?(  ?F;  !?(  F;  <!(-
 0h.  ?  F;
 !A(? ! A(  Z!N(!`(!_(!g(!u(  F; 
 ! ?(? !?(-4    ?  6-4    ?  6  ?F; -
?0  ?  6! V(  _I=   `F; B !_B  ?F; -
? _N0   ?  6-
 ? _
 NN0  ?  6+? Y  _F=   `F; E -0 *  =  -0 ;  ; -  ?F; -
W0    ?  6-4    u  6	  ????+  `F;? 	   ??>+-0    ;  -0 {  -0 ?  -0 ?  -0 ?  -0 ?  -0 ?  -0 ?  -0   -0 .  -0 F  -0 d  -0 v  -  ? ?. ?   ?KCCCCCCCCCCCCC; C  ?F; -
?0  ?  6-
 ? N
 ?NN.   ?  6-4    ?  6	  ??>+	  ??L=+,? [?  &
$W
 $W
 KW-.    !  !(-d
C
 C 0   :  6^   7!J(^  7 P7!J(  7!T(  7!Z(-.    l  !c(@ c7!}(E c7!(
? c7!?(
? c7!?(
? c7!?(
? c7!?( c7!T(  c7!Z(	???? c7!?(  c7!?(? c7!?(-	    ? 0   ?  6  7!T(-	    ? c0   ?  6  c7!T(  `F;L -- _. ?  -  ?. ?  Q  0 ?  6--  _<Q.    ?   c0     6+,???-	     ? c0   ?  6 c7!T(-	      ? 0   ?  6 7!T(- 0     6- c0   6 HS
 $W
 $W
 KW-
p. f  6-
 . f  6	  ??>+  3
 @ AFEF;?  ?'(_;? 	 ??>+  _F=   `F; ? -0   ;  -0 {  -0 ?  -0 ?  -0 ?  -0 ?  -0 ?  -0 ?  -0   -0 .  -0 F  -0 d  -0 v  CCCCCCCCCCCC; 
  ' (?L  ?F; ' B  ?'(+ F;  -4   u  6  ' (? ?   ' (  ?'(??? ??  _o?7
 $W
 j'(
z'(+
 ?U$$ %--.  ?  .   ?  ;  - 4    u  6--.    ?  .   ?  ;  X
? V-
 ? 0 ?  6	  ??L=+,? ??  ?- 0   ?  6 &
$W
 $W
 KW ?F; -
?0    ?  6  3
 @F;?  _  VFEF;?  ?!g(  ?!_(-
 ? N
 ?NN. ?  6-
 @ 0    ?  6	     ?+  ?!?(! `(! (-0    6-0    &  6-4      6-0    2  6? -
:.   ?  6 &
$W
 $W
 KW ?F; -
j0    ?  6!`(!(-0    ?  6-
 ?0    ?  6-0    2  6 &X
 ?V
 ?W
 $W
 KW
 ?W `; ?  ?F; -
? g
 ?NN0    ?  6  gI=   `F;)  g<J; -
? g
 NN0    ?  6! gB  gF=  uF; 8  ?F; -
0    ?  6+!u(- Z4  R  6X
 ?V+?D? ?!g( Z`f7
 $W l'(p'(_; b ' ( 7 ZF;B -
t
 NN. ?  6+-
?- 0    ?  
 ?
 ?
 	NNNN.   ?  6? q'(? ??  7		#	3	>	`f
 KW
 $W
 -U$%'('('('('(-.    V	  '(p' ( _; B  '(7 `F=  7 3
 @F; 'A7  3
 a	F; 'A q' (???F; H K;@ '(I= F; 'B-
 ?	N4 k	  6+F=  F; X
$VK; '('('('(+? 4?  ?	`f7 l'(p'(_; " ' (- 0    ?  6q'(???  &
KW
 $W
 ?U%  A9! A(+? ??  (??	  ?   ?o?B"
  ?   S?F
  >  ???t    >???f  ?  ?1??    ?-b?@  ? Cf[R  u  %N6  ?  ??G??  &  ?f?!~  R !7[?    ??Ĳ  k	 ???R  ?  ? >   ?	  >   
  >   
  >>   8
  f>  j
  ?  ?  ?>  w
  ?  ?  _  1  H  s  W  ?    C  ?> 	 ?
  ?
  ?
  ?
  ?
  9  ?  ?  ?  ?>   ?  ?>   ?  ?>    ;  *>   :  ;>   F  ?  ?  u>   k  ?  ?  {>   ?  ?  ?>   ?  ?  ?>   ?  ?  ?>   ?  ?  ?>   ?    ?>   ?    ?>   ?    >   ?    .>   ?  &  F>   ?  .  d>   ?  6  v>   ?  >  ?>    ?>  H  ?  ?  ?>   S  !>   ?  :>  ?  l>  ?  ?>  ?  ?    8  ?>  ?  >  ?  >   P  ^  ?>  ?    ?>  ?    ?>  *  ?>  ?    >   ?  &>     >     2>     ?  ?>  ,  ?>   o  R>  ]  ?>   ?  ?>  ?  V	>   C  k	>  ?        7$
  ?  ?      $ (
  H
  N
  v  |  n  t  ?  T  Z  8  >  ?  ?     ?  Z  - .
  &  K T
  ?  z  `  D  ?    T  V\
  ?  ?  `b
  d  ?  0  ?  ?  ?  ?  d  ?  ?  h  p h
  ?  ? t
  ? ?
  ??
  ?
  ?
  ?  ? ?
  ??
  ?
    ?  ?  t  ? ?
  ??
         ?
  ?
  $  0  V  ?  ?  & ?
  ?
  |  0 6  AJ  T  ?  h  n  ZZ  Z  ?  ?  N^  @  ?  _j  ?  ?  ?    &  ?  ?  ?  ?  ?  g	p  ?  ?  ?  ?      "  x  uv  ,  T  ?
?  ?  ?  ?  R  $  f  J  ?  6  ? ?  ? ?  ?      W \  ?   ?  `  n  ?  ?  ?  ?  ? .  ? <  ?  ? D  ?  ?  ?  ?  ?  ?  ~  ?  ?  6  D  N  C ?  ?  J?  ?  P?  T?  @  ?  ?  (  H  Z?  L  c?  ?        &  2  <  H  V  b  n  ?  ?  ?    $  \  }?    ? 
  ?  ?   ?  ? "  .  ?*  ?6  ?Z  ?f  ? j  ?r  Hh  Sj   ?  3?  ?  t  ?  @ ?  ?  x  _?  o?  ??  j ?  z ?  ? ?  ?   `  ? &  ?B  ? p  ? ?  @  ?  ?  j  : *  j T  ? |  ? ?  ?  ? ?  h  ? ?  ? ?  ?    
   @  `?      f?      l?    t ?   ?  ? ?  ? ?  ? ?  	 ?  	
  	  #	  3	  >	  a	 ?  ?	 ?  ?	  
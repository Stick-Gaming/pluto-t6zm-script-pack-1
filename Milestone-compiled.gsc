�GSC
     �  �1  �  �1  �-  N.  DA  DA      @ �  !        Milestone maps/mp/zombies/_zm_utility maps/mp/_utility maps/_utility common_scripts/utility maps/mp/zombies/_zm_spawner maps/mp/gametypes_zm/_hud_message maps/mp/gametypes_zm/_hud_util maps/mp/zombies/_zm_perks init precacheshader zombies_rank_1 zombies_rank_2 zombies_rank_3 zombies_rank_4 zombies_rank_5 zombies_rank_3_ded zombies_rank_4_ded zombies_rank_5_ded setdvar usingMilestoneSystem onplayerconnect connected player milestone_setup disconnect end_game milestonedebug iprintln Threaded Milestone_setup milestoneround_1 milestoneround_2 milestoneround_3 milestoneround_4 milestoneround_5 milestoneround_6 milestoneround_7 milestoneround_8 moneyreward perkslotreward randperkreward healthreward maxammoreward randpowerup givepowerup textsetup1 givexpreward milestoneshaderlevel  milepowerupspawn all_perk_in_level perk_shader all_power_ups_in_level level_check_perk milestonetextsetup power_up_check milestone_check Threaded Milestone_Check Milestone V0.5 Created by ^2Nathan3197 end_of_round isafk milestonedorward start_of_round Round over checking if it a milestone round round_number milestone_round_done1 Round 5 giving Milestone rewards cashreward perkslotrewardnum zombies_milestone_rank_1 milestonerewardtrigger Milestone_over milestone_round_done2 Round 10 giving Milestone rewards zombies_milestone_rank_2 milestone_round_done3 Round 15 giving Milestone rewards zombies_milestone_rank_3 milestone_round_done4 zombies_milestone_rank_3_ded milestone_round_done5 zombies_milestone_rank_4 milestone_round_done6 zombies_milestone_rank_4_ded milestone_round_done7 zombies_milestone_rank_5 milestone_round_done8 xpreward zombies_milestone_rank_5_ded Minestone Over Destorying destroy array_randomize theperk random testnum hasperk you have all perks on the map. no free perk this time setrandperkshader Prep_Rank_Shader MileGui_Ready Milestone Gui Ready MileGui_on Turning on GUI score Milestone reach giving ^2 ^7 points perk_purchase_limit ^7 perk slots You now have ^2 full_ammo MileStone reach Max ammo has been drop dogiveperk Milestone reach giving random perk  thepowerup MileStone reach random power up has been drop MileGui_off threading MielstoneTextSetup Setting up milestone Text and shaders milestonetext createfontstring bigfixed setpoint CENTER alpha archived hidewheninmenu settext Milestone Reach!! milestoneicon newclienthudelem horzalign center vertalign x y width hight preshaderperk milestonecashrewardtext ^3Cash ^7Reward milestonerandomperktext ^1R^2a^3n^4d^5o^6m ^1P^2e^3r^4k ^7Reward milestoneperkslottext ^6Extra Perk Slot ^7Reward rewardwidth rewardhight int usingachivement cashrewaricon color setshader specialty_doublepoints_zombies randomperkreward1icon specialty_ads_zombies maxammorewardicon specialty_fastreload_zombies milestonemaxammotext ^2Max Ammo ^7Reward perkslotrewardicon specialty_doubletap_zombies Text will display are  Shader change to rank 1 Shader change to rank 2 Shader change to rank 3 Shader change to rank 3_ded Shader change to rank 4 Shader change to rank 4_ded Shader change to rank 5 Shader change to rank 5_ded ^2Final ^6Milestone ^7Reach!! final_milestone Turning on milestone shader fadeovertime Turning on milestone shader Moneyreward Turning on milestone shader perkslotreward Turning on milestone shader randperkreward1 Setting rand perk shader to ^2 Turning on milestone shader maxammoreward Turning off milestone shader powerup_name Spawning Power up ^2 zombie_include_powerups Power Ups ^1Not Supported ^7On This Map powerup_drop_count powerup maps/mp/zombies/_zm_powerups specific_powerup_drop origin teller_withdrawl value powerup_timeout perk perk_abort_drinking has_perk_paused gun perk_give_bottle_begin evt waittill_any_return fake_death death player_downed weapon_change_complete wait_give_perk perk_give_bottle_end maps/mp/zombies/_zm_laststand player_is_in_laststand intermission burp ^2Thread Level_check_perk zombiemode_using_juggernaut_perk specialty_armorvest specialty_juggernaut_zombies zombiemode_using_sleightofhand_perk specialty_fastreload zombiemode_using_revive_perk specialty_quickrevive specialty_quickrevive_zombies zombiemode_using_doubletap_perk specialty_rof zombiemode_using_marathon_perk specialty_longersprint specialty_marathon_zombies zombiemode_using_additionalprimaryweapon_perk specialty_additionalprimaryweapon specialty_additionalprimaryweapon_zombies zombiemode_using_deadshot_perk specialty_deadshot zombiemode_using_tombstone_perk specialty_scavenger specialty_tombstone_zombies _custom_perks specialty_flakjacket script zm_buried specialty_vulture_zombies specialty_nomotionsensor specialty_electric_cherry_zombie specialty_grenadepulldeath specialty_divetonuke_zombies zombiemode_using_chugabud_perk specialty_finalstand specialty_chugabud_zombies Check all perks that are in the level. perkname ^2SetRandPerkShader threaded ^2Setting PreshaderPerk to ^7 nuke insta_kill double_points carpenter fire_sale Check all powers up that are in the level. J   f   w   �   �   �   �   �   &-
'.   6-
 6.   6-
 E.   6-
 T.   6-
 c.   6-
 r.   6-
 �.   6-
 �.   6-
 �.   �  6-4    �  6 �
 �U$ %- 4 �  6?��  &
�W
 W
 W! (+ F; -
%0    6! >(
! O(! `(! q(! �(! �(#! �((! �(!�(!�(!�(!�(!�(!(!(!#(!.(
P!;(!Q(!b(!t(!�(-4  �  6-4    �  6-4    �  6+-4 �  6 &  F; -
�0      6
�W
 W
 W-
�0      6
U%+ 'F; 	 -0 -  6+? ��  &
�W
 W
 W
 >U%  F; -
M0      6  y >F=  �F; o  F; -
�0      6! �(�!�(!�(!�(!�(!�(!(! .(
�!;(! �(-4  �  6

U%  y OF=  F; q  F; -
/0    6! �(�!�(!�(!�(! �(!�(! (! .(
Q!;(! (-4  �  6

U%  y `F=  jF; u  F; -
�0    6! �(�	!�(! �(! �(! �(!�(! (! .(
�!;(! j(-4  �  6

U%  y qF=  �F; y  F; -
�0    6! �(L!�(! �(! �(! �(! �(! (! .(
�!;(! �(-4    �  6

U%  y �F=  �F; y  F; -
�0    6! �(@!�(! �(! �(! �(! �(! (! .(
!;(! �(-4    �  6

U%  y �F=  F; y  F; -
�0    6! �(�:!�(! �(! �(! �(! �(! (! .(
3!;(! (-4    �  6

U%  y �F=  PF; y  F; -
�0    6! �( N!�(! �(! �(! �(! �(! (! .(
f!;(! P(-4    �  6

U%  y �F=  F; }  F; -
�0    6! �(�a!�(!�(!�(! �(! �(! (! .(�!�(
�!;(! (-4    �  6

U%  F; -
�0      6-0    �  6   �
 �W
 W
 W bSI;� -  b. �  !b(- b. �  !�(' (- �0      ; P  2K; ! �(-
 0    6?0 ' A- b.   �  !b(- b. �  !�(	  ��L=+?��-  �0    B  6X
 TV
 eU%  F; -
s0      6+X
�V F; -
�0    6+ �F;3  � �N! �(  F; -
� �
 �NN0      6  �F=  �_=  �G; K  � �N! �(  F;1 -
� �
 �NN0      6-
 � �
 �NN0    6  �F;% -
�0    6  F; -
0    6  �F;- -  �0    .  6  F; -
9 �N0   6  F;- ! Q(- ]0    6  F; -
h0    6+X
�VX

V! �(!�(!�(!�(!�(!�(!(!.(
P!;(-0    �  6   �	�	G
S

 �W
 W
 W F; -
�0      6  #F; � F; -
�0      6-
 	.   �  !�(-�

 	
 	 �0 	  6 �7!	( �7!#	(  �7!,	(-
 C	 �0 ;	  6-.    c	  !U	(
~	 U	7!t	(
~	 U	7!�	("  U	7!�	(x  U	7!�	( U	7!	( U	7!#	(  U	7!,	(@'(@'(! #(
P!�	(-
 	. �  !�	(-^ W
 	
 	 �	0   	  6 �	7!	( �	7!#	(  �	7!,	(-
 �	 �	0 ;	  6-
 	.   �  !�	(-0 9
 	
 	 �	0   	  6 �	7!	( �	7!#	(  �	7!,	(-
 �	 �	0 ;	  6-
 	.   �  !
(- 0
 	
 	 
0   	  6 
7!	( 
7!#	(  
7!,	(-
 ,
 
0 ;	  6 '( ' (- c
.   _
  F;� -.   c	  !s
(
~	 s
7!t	(
~	 s
7!�	(� s
7!�	(�  s
7!�	( s
7!	( s
7!#	(  s
7!,	(��[  s
7!�
(- 
 �
 s
0 �
  6-
 	.   �  !�	(-^ W
 	
 	 �	0   	  6 �	7!	( �	7!#	(  �	7!,	(-
 �	 �	0 ;	  6-.    c	  !�
(
~	 �
7!t	(
~	 �
7!�	(� �
7!�	(�  �
7!�	( �
7!	( �
7!#	(  �
7!,	(- 
 �
 �
0 �
  6- c
. _
  F;� -.   c	  !�
(
~	 �
7!t	(
~	 �
7!�	(� �
7!�	(�  �
7!�	( �
7!	( �
7!#	(  �
7!,	(��[  �
7!�
(- 
 �
 �
0 �
  6-
 	.   �  !(- @
 	
 	 0   	  6 7!	( 7!#	(  7!,	(-
   0 ;	  6-.    c	  !4(
~	 47!t	(
~	 47!�	(� 47!�	( 47!�	( 47!	( 47!#	(  47!,	(��[  47!�
(- 
 G 40 �
  6
TU%  F;# -
c � � � �NNNN0      6  ;
 �F;+  F; -
z0    6-
 ' U	0 �
  6  ;
 QF;+  F; -
�0    6-
 6 U	0 �
  6  ;
 �F;+  F; -
�0    6-
 E U	0 �
  6  ;
 �F;+  F; -
�0    6-
 r U	0 �
  6  ;
 F;+  F; -
�0    6-
 T U	0 �
  6  ;
 3F;+  F; -
�0    6-
 � U	0 �
  6  ;
 fF;+  F; -
0    6-
 c U	0 �
  6  ;
 �F;B  F; -
*0    6-
 � U	0 �
  6-
 F �0 ;	  6X
 dVX
eV
 �U%  F; -
t0    6-	    ? �0   �  6  �7!	(-	    ? U	0   �  6  U	7!	(  �F;i  F; -
�0      6- c
. _
  F;? -	   ? �	0   �  6  �	7!	(-	    ? s
0   �  6  s
7!	(  �F;Y  F; -
�0      6-	    ? 
0   �  6  
7!	(-	    ? 40   �  6  47!	(  �F;� -  �0    B  6-  �	 �
0 �
  6  F;! -
�0    6-
  �	N0     6-	    ? �	0   �  6  �	7!	(-	    ? �
0   �  6  �
7!	(  �F;i  F; -
;0      6- c
. _
  F;? -	   ? 0   �  6  7!	(-	    ? �
0   �  6  �
7!	(
�U%  F; -
e0      6+-	     ? �0   �  6 �7!	(-	      ? U	0   �  6 U	7!	(- c
.   _
  F;= -	   ? �	0   �  6 �	7!	(-	      ? s
0   �  6 s
7!	(-	      ? 
0   �  6 
7!	(-	      ? 40   �  6 47!	(-	      ? �	0   �  6 �	7!	(-	      ? �
0   �  6 �
7!	(- c
.   _
  F;= -	   ? 0   �  6 7!	(-	      ? �
0   �  6 �
7!	(+? �  �� F; -
�N0     6  QF; k  �_9>   �SI9;  -
�0      6?C !Q(!�(- 20    ' (
9F;  � 7!J(- 4 P  6!Q(-0  �  6 `��
 �W
 W
 W
 eW-0   >  -0   y  9;x -0   �  '(-
 �
 �
 �
 �0  �  ' ( 
�F; -4 �  6-0      6-0    4  >   K_=  K;   X
 XV  &  F; -
]0      6  w_=  w;  
 �! b(
 �! t( �_=  �;  
 �!b(
 �
!t( _=  ;  
 !b(
 5!t( S_=  S;  
 s!b(
 G!t( �_=  �;  
 �!b(
 �!t( �_=  �;  
  !b(
 "!t( L_=  L;  
 k!b(
 �
!t( ~_=  ~;  
 �!b(
 �!t( �_=
 
 � �_= 	  �
 �G; 
 �!b(
 !t( �_=
 
  �_;  
 	!b(
 5	!t( �_=
 
 V �_;  
 V
!b(
 q
!t( �_=  �;  
 �!b(
 �!t( F; -
�0      6  F; -
0    6 
�F;   t! �	( 
�F;  t! �	( 
F;  t! �	( 
sF;  t! �	( 
�F;  t! �	( 
 F;  t! �	( 
kF;  t! �	( 
�F;  t! �	( 
�F;  t! �	( 
F; 	 t! �	( 
VF; 
 t! �	( 
�F;  t! �	(  F; -
* �	N0   6 &
H �_;  
 H! �(
 M �_;  
 M!�(
 � �_;  
 �!�(
 X �_;  
 X!�(
 f �_;  
 f!�(
 p �_;  
 p!�( F; -
z0    6 ����    ;�'YB  �  ��<N^  �  =�~�V  �  $X�W�  -  6e��  �  ��   �  A �<(   rRS�(  . �tUW�)  �  ,�W!�+  B ���Q
-  �  >  �  �  �  �  �        �>  ,  �>   7  �>   R  > / �  g  �  �    �    �  9  �  Y  �  g  �  W  y  �    !  Q  �  �  K  o  �"  �"  �"  #  Q#  �#  �#  �#  1$  �$  �$  W%  �%  �%  W&  �&  T(  �(  �)  �+  �+  -  �-  �>   )  �>   3  �>   ?  �>   N  ->   �  �>   a  �  u    �  #  �  G  �>   s    �(  �>  �     �>  �    >  �  )  B>  /  �%  >  9  �  .>  k  �>  �  V  �       |!  	>  �  t  �  4  4   �!  ;	>  �  �    f  f   �!  V$  c	>  �  �  o   �   �!  _
>  |  �   �$  f&  '  �'  �
>     �   n!  R"  �"  �"  .#  f#  �#  �#  $  F$  �%  �>  �$  �$  %  (%  l%  �%  &  (&  |&  �&  �&   '  0'  P'  p'  �'  �'  �'   (   (  � �(  P�  �(  y�  )  ��   )  �>  =)  ��  V)  �  c)  4  o)        ' �  �"  6 �  �"  E �  (#  T �  �#  c �  $  r   `#  �   �#  �   @$  � *  �D  � H  � `  r  �  �  ,  �(   f  l  x  ~  �  �  �  �  2  8  �(  �(  +t  |  Z  �    �    �  ,  �  L  �  Z  J  l  �  �  D  x  �  >  b  b"  �"  �"  #  D#  |#  �#  �#  $$  t$  �$  J%  �%  J&  �&  D(  �)  �+  �+  �,  �-  % �  >�  �  O�  v  `�  �  q�  �  ��    ��  �  ��  :  ��  �  ��    �  *  �  F  �  f  �  �  �  p"  �$  ��  ,  �  :  �  ^  �  ~  
  �  �  t"  @%  ��  >  �  J  �  f  �  �    �  \  �  |"  �%  ��  ��  8  �  P  �  n  �  �    ,  �  x"  @&  �  D  �  X  �  v    �  "  �     �  #�  X  D  .
  L  �  `  �  ~    �  *    P   
  H  ;  T  �  h  �  �    �  :    �"  �"   #  8#  p#  �#  �#  $  Q  �  `(  �(  �(  b  �  �  �  �  �  
    �)  �)  *  B*  j*  �*  �*  �*  +  J+  x+  �+  t  �)  �)  &*  N*  v*  �*  �*  �*  (+  V+  �+  �+  �+  ,  ,  4,  J,  `,  v,  �,  �,  �,  �,  �,  �$   -  :-  T-  n-  �-  �-  � d  � �   �  '�  > �  M �  y�  r  �  �    �  6  �  ��  \  �   �&  �  2  �  N  �  n  �  �  �  �  �2  �  B  �  V  �  v    �  �  �  � P  �"  
	 j  �  ~    �  .  �  R  �  ~  �  / �  Q �  �"  j  p  �   �  6  �  V  �  � d  #  ��  �  � �  <#  �"  �   �  t#  �    3   �#  PB  �  f �  �#  �  B  �2  � 6  $  � d  ��  ��  �    ,  h  �  �%   �  T <  Z"  e B  f$  s T  � f  l$  � v  ��  �  � �  �  � �  ��  �  �  �    �     �   � 6  @-  N-   N  9 �  ]�  h �  � �  �&  �	"  �	$  G
&  S
(  � H  � l  	 ~  T  �       z!  ��  �  �  �  �  �  T$  �$  �$  �&  �&  	 �  �  j  n  �  �  *  .  *   .   �!  �!  	�    �  �  D  �  D   �   8!  �!  "  �$  �$  %  :%  ~%  �%  &  :&  �&  �&  �&  '  @'  `'  �'  �'  �'  �'  (  0(  #	�  &  �  �  N  �  N   �   B!  �!  &"  ,	�  2  �  �  Z  �  Z   �   N!  �!  2"  C	 �  U	�  �  �        "  .  �"  �"  ,#  d#  �#  �#  $  D$  �$  �$  �&  '  ~	
 �  �  �  �  ~   �   !  !  �!  �!  t	�  �  �   
!  �!  �	�  �  �   !  �!  �	  �  �   "!  "  �	  �  �   .!  "  �	L  �%  �%  �+  ,  $,  :,  P,  f,  |,  �,  �,  �,  �,  �,  �,  �	^  r  �  �  �  �     2   @   J   V   d   %  %  .'  <'  �	 �  `   �	
�  �  �  �  �    &  &  �'  �'  �	    

  2  @  J  V  d  j%  z%  n'  |'  ,
 `  c
z  �   �$  d&  '  �'  s
�  �  �  �  �  �  �  �  �     &%  6%  N'  \'  �
�  ^!  B"  �
     �
z   �   �   �   �   �   �   �   �   �%  &&  6&  �'  �'  �
 �   �*  �
�   !  !  !  *!  4!  >!  J!  Z!  l!  �&  �&  (  ,(  �
 h!  �)  
�!  �!  �!  �!  �!  �!  z&  �&  �'  (    �!  4�!  �!  �!  "  "  "  ""  ."  >"  P"  �%  �%  �'  �'  G L"  H*  c l"  z �"  � �"  � #  � N#  � �#  � �#   �#  * .$  F P$  d `$  t ~$  � �$  � T%  � �%   �%  ; T&  e �&  �>(  �@(  � N(  �j(  t(  -  *-  D-  ^-  x-  �-  � �(  ��(  2�(  9 �(  J�(  `�(  ��(  ��(  e �(  � .)  J)  � 2)  � 6)  � :)  K~)  �)  X �)  ] �)  w�)  �)  � �)  �+  � �)  ��)  �)  � �)  �+  *  *   *  ,  5  *  S,*  4*  s <*  *,  �T*  \*  � d*  @,  � p*  �|*  �*    �*  V,  " �*  L�*  �*  k �*  l,  ~�*  �*  � �*  �,  � �*  ��*   +  .+  :+  \+  h+  � �*  +  �,  �
+  � +   "+   6+  D+  �,  5 P+  V d+  r+  �,  q ~+  ��+  �+  � �+  �,  � �+  � �+  �+   �+  * �,  H -  -  M &-  4-  X Z-  h-  f t-  �-  p �-  �-  z �-  
#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT="$(xrdb -get i3lock.foreground)cc"
TEXT="$(xrdb -get i3lock.foreground)ee"
OUT="$(xrdb -get i3lock.color3)ee"
WRONG='#A20000ee'
VERIFYING="$(xrdb -get i3lock.color3)bb"

i3lock --nofork \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$OUT         \
--bshl-color=$OUT          \
\
-i $(cat ~/.cache/wal/wal) \
\
--screen 1                   \
--blur 5                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"       \
--keylayout 1                \
&

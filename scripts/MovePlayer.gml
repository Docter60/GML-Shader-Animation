// Movement code
d_key = keyboard_check(ord('D'));
a_key = keyboard_check(ord('A'));
s_key = keyboard_check(ord('S'));
w_key = keyboard_check(ord('W'));

if(d_key && hspeed < MAXHSPEED) hspeed += ACC;
if(a_key && hspeed > -MAXHSPEED) hspeed -= ACC;

if(s_key && vspeed < MAXVSPEED) vspeed += ACC;
if(w_key && vspeed > -MAXVSPEED) vspeed -= ACC;

/*
Need to "normalize" the speed vector so moving diagonally is not faster
than horizontal or vertical movement.
*/

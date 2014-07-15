#include <macro.h>
/*
Author: CDawg
*/

switch (__GETC__(life_donator)) do {
	case  0: { donatorLevel = 1; };
	case  1: { donatorLevel = 1.25; };
	case  2: { donatorLevel = 1.75; };
	case  3: { donatorLevel = 2; };
	case  4: { donatorLevel = 2.25; };
	case  5: { donatorLevel = 2.75; };
};

donatorLevel


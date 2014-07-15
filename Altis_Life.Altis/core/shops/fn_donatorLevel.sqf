#include <macro.h>
/*
Author: CDawg
*/

switch (__GETC__(life_donator)) do {
	case  0: { donatorLevel = 1; };
	case  1: { donatorLevel = 1.5; };
	case  2: { donatorLevel = 2; };
	case  3: { donatorLevel = 2.5; };
	case  4: { donatorLevel = 3; };
	case  5: { donatorLevel = 3.5; };
};

donatorLevel


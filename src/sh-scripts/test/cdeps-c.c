#include "cdeps-c.h"

#ifdef FOO
#include "cdeps-b.h"
#endif

  int
cdeps_c( void )
{
  return 2;
}

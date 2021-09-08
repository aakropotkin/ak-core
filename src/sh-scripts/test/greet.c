
#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>

/* ========================================================================== */

extern const char * say_hello( void );
extern const char * say_howdy( void );


/* -------------------------------------------------------------------------- */

  int
main( int argc, char * argv[], char ** envp )
{
  printf( "%s, World!\n", say_hello() );
  printf( "%s, World!\n", say_howdy() );
  return EXIT_SUCCESS;
}


/* -------------------------------------------------------------------------- */



/* ========================================================================== */

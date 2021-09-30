
# Take the first `n' elements from input.
def take( n ):
  [limit( n; .[] )];


# Remove the first `n' elements from input.
def drop( n ):
  [reverse|limit( ( .|length ) - n; .[] )]|reverse;


# Drop the first element from input.
def rest: drop( 1 );


# Make list unique without changing order.
def dedup:
  reduce .[] as $x ( []; if ( .|contains( [$x] ) ) then . else . + [$x] end );


# Make list unique without changing order.
def dedup_except( ignores ):
  reduce .[] as $x
         ( [];
           if ( ( .|contains( [$x] ) ) and ( ignores|contains( [$x] )|not ) )
             then .
             else . + [$x]
           end
         );

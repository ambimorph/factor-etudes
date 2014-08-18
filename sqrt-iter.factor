! Trying to emulate the sqrt-iter example from SICP:
! http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-10.html#%_sec_1.1.7

: close-enough ( n m -- bool )
sq - abs .001 < ;

: avg ( n m -- a )
+ 2 / ;

: improve ( n m -- a )
[ / ] keep avg ;

: sqrt-iter ( m n -- a )
2dup close-enough
    [ [ drop ] dip ]
    [ [ dup ] dip improve sqrt-iter ]
    if ;

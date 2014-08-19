USING: kernel math tools.test ;
IN: sqrt-iter

! sqrt-iter example from SICP:
! http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-10.html#%_sec_1.1.7

: my-sq ( n -- m )
    dup * ;

: close-enough ( n m -- bool )
    my-sq - abs .001 < ;

: avg ( n m -- a )
    + 2 / ;

: improve ( n m -- a )
    [ / ] keep avg ;

: sqrt-iter ( m n -- a )
    2dup close-enough
    [ nip ]
    [ [ dup ] dip improve sqrt-iter ]
    if ;

: my-sqrt ( n -- m )
    1.0 sqrt-iter ;

[ 3.00009155413138 ] [ 9 my-sqrt ] unit-test
[ 11.704699917758145 ] [ 100 37 + my-sqrt ] unit-test
[ 1.7739279023207892 ] [ 2 my-sqrt 3 my-sqrt + my-sqrt ] unit-test
[ 1000.000369924366 ] [ 1000 my-sqrt sq ] unit-test

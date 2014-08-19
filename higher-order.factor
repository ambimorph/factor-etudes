USING: kernel math generalizations tools.test ;
IN: higher-order

! The sum example from SICP: http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-12.html#%_sec_1.3.1

: greater-than-3-back ( a b c d -- a b c d bool )
    ! pushes a > d
    [ pick ] dip dup [ > ] dip swap ; inline

: sum  ( a quot quot b -- n )
    greater-than-3-back
    [ 4drop 0 ]
    [
        [ [ bi ] 2keep ] dip sum +
    ] if ; inline

: inc ( n -- m )
    1 + ;

[ 55 ] [ 1 [ ] [ inc ] 10 sum ] unit-test

: cube ( n -- m )
    dup dup * * ;

[ 3025 ] [ 1 [ cube ] [ inc ] 10 sum ] unit-test

: pi-term ( x -- y )
     dup 2 + * 1.0 swap / ;

: pi-next ( x -- y )
    4 + ;

[ 3.139592655589783 ] [ 1 [ pi-term ] [ pi-next ] 1000 sum 8 * ] unit-test

! average-damp example
! http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-12.html#%_sec_1.3.4

: avg ( n m -- a )
+ 2 / ;

: average-damp ( quot -- quot )
    [ dup ] prepose [ avg ] compose ;

[ 55 ] [ 10 [ sq ] average-damp call ] unit-test

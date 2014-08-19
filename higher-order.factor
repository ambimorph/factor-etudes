USING: kernel math generalizations tools.test ;
IN: higher-order

! The sum example from SICP: http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-12.html#%_sec_1.3.1

: sum  ( a quot quot b -- n )
    [ pick ] dip dup [ > ] dip swap
    [ 3 nnip ]
    [
        [ [ bi ] 2keep ] dip sum +
    ] if ; inline
    
: inc ( n -- m )
    1 + ;

: cube ( n -- m )
    dup dup * * ;


[ 3035 ] [ 1 [ cube ] [ inc ] 10 sum ] unit-test

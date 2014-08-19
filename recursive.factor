USING: kernel math sequences tools.test ;
IN: rec

: fib-rec ( m -- n )
    dup 1 < [ drop 0 ] [
        dup 2 < [ drop 1 ] [ [ 1 - fib-rec ] [ 2 - fib-rec ] bi + ] if
    ] if ;

[ 13 ] [ 7 fib-rec ] unit-test
[ 0 1 1 2 3 5 8 13 ] [ { 0 1 2 3 4 5 6 7 } [ fib-rec ] each ] unit-test


: fib-iter ( b a c -- d )
     dup 0 =
     [ 2drop ]
     [ [ [ + ] keep swap ] dip 1 - fib-iter ]
     if ;

: fib ( m -- n )
    [ 0 1 ] dip fib-iter ;

[ 13 ] [ 7 fib ] unit-test
[ 0 1 1 2 3 5 8 13 ] [ { 0 1 2 3 4 5 6 7 } [ fib ] each ] unit-test

USING: kernel math generalizations tools.test sequences ;
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


! Exercise 1.46
! Write a procedure iterative-improve that takes two procedures as
! arguments: a method for telling whether a guess is good enough and a
! method for improving a guess. Iterative-improve should return as its
! value a procedure that takes a guess as argument and keeps improving
! the guess until it is good enough.

: almost-equal ( x y -- bool )
    - abs .001 < ;

: sqrt-good-enough ( x -- quot )
    ! Takes the number x we are trying to sqrt, and returns a word that
    ! takes a guess and returns whether or not it is good enough.

    [ swap sq almost-equal ] curry ;

[ t ] [ 3.0001 9 sqrt-good-enough call ] unit-test

: improve-sqrt ( x -- quote )
    ! Takes the number x we are trying to sqrt, and returns a word
    ! that averages a guess g with x / g.

    [ swap [ / ] keep avg ] curry ;

[ t ] [ 1.5 2 improve-sqrt call 1.4167 almost-equal ] unit-test

: iterative-improve ( quot quot -- quot )
    [ bi ] 3keep
    [ ] 2sequence
    [ iterative-improve ] append
    [ [ ] 1sequence ] dip
    [ swap ] dip
    curry
    if ; inline

[ 3+131072/50862608363 ]
[ 7 9 [ sqrt-good-enough ] [ improve-sqrt ] bi iterative-improve ]
unit-test

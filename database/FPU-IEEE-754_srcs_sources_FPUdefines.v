// This program was cloned from: https://github.com/akilm/FPU-IEEE-754
// License: MIT License

/*
----32 Bit Float----
Bits 0:22 - Mantissa
Bits 23:30 - Exponent
Bits 31 - sign bit
*/

/*
----IEEE-754 Encodings---- 
Exponent    Fraction    Object
    0           0       zero
    0        non-zero   denormalised number
  1-254     anything    floating point
   255          0       infinity
   255       non-zero   NaN (Not a Number)
*/


/*
Value of Float = (-1)^S x (1+fraction) x 2^(exponent-bias)
S-sign bit ; fraction - mantissa(without implicit one) ; bias - 127 
*/
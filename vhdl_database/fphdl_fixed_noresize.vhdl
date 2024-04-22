-------------------------------------------------------------------------------
--* Filename & Ext  :  fixed_noresize.vhdl
--* Author          :    <dbishop@vhdl.org>
--* Created         :  2006-08-29
--* Last modified   :  $Date: 2006-08-31 09:20:58-04 $
--* Description     :  fixed noresize package.  This package uses the same
--*                 :  logic as the "fixed_pkg", however it uses the sizing
--*                 :  rules of numeric_std.
--* Known Bugs      :
--*
--* RCS Summary     :  $Id: fixed_noresize.vhdl,v 1.2 2006-08-31 09:20:58-04 l435385 Exp l435385 $
--*                 :
--* Mod History     :  $Log: fixed_noresize.vhdl,v $
--* Mod History     :  Revision 1.2  2006-08-31 09:20:58-04  l435385
--* Mod History     :  Added several comments
--* Mod History     :
--* Mod History     :  Revision 1.1  2006-08-30 15:36:15-04  l435385
--* Mod History     :  Initial revision
--* Mod History     :
--*                 :
-------------------------------------------------------------------------------
-- In this package the sizing rules are very different from those in
-- "fixed_generic_pkg" or fixed_pkg.  In this package the follow more closely
-- the sizing rules from numeric_std.   See the functions for the range of what
-- they return.
-------------------------------------------------------------------------------


use std.textio.all;
library ieee, ieee_proposed;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;

package fixed_noresize is

  type fixedu is array (INTEGER range <>) of STD_ULOGIC;  -- fixedu
  type fixeds is array (INTEGER range <>) of STD_ULOGIC;  -- fixeds

  -- ===========================================================================
  -- Arithmetic Operators:
  -- ===========================================================================

  -- Absolute value, 2's complement
  -- abs fixeds(a downto b) = fixeds(a downto b)
  function "abs" (arg : fixeds) return fixeds;

  -- Negation, 2's complement
  -- - fixeds(a downto b) = fixeds(a downto b)
  function "-" (arg : fixeds)return fixeds;

  -- Addition
  -- fixedu(a downto b) + fixedu(c downto d)
  --   = fixedu(maximum(a,c) downto minimum(b,d))
  function "+" (l, r : fixedu) return fixedu;
  function "+" (l, r : fixeds) return fixeds;

  -- Subtraction
  -- fixedu(a downto b) - fixedu(c downto d)
  --   = fixedu(maximum(a,c) downto minimum(b,d))
  function "-" (l, r : fixedu) return fixedu;
  function "-" (l, r : fixeds) return fixeds;

  -- Multiplication
  -- fixedu(a downto b) * fixedu(c downto d) = fixedu(a+c+1 downto b+d)
  function "*" (l, r : fixedu) return fixedu;
  function "*" (l, r : fixeds) return fixeds;

  -- Division
  -- fixedu(a downto b) / fixedu(c downto d) = fixedu(a downto b)
  function "/" (l, r : fixedu) return fixedu;
  function "/" (l, r : fixeds) return fixeds;

  -- Remainder
  -- fixedu(a downto b) rem fixedu(c downto d) = fixedu(c downto d)
  function "rem" (l, r : fixedu) return fixedu;
  function "rem" (l, r : fixeds) return fixeds;

  -- Modulo
  -- fixedu(a downto b) mod fixedu(c downto d) = fixedu(c downto d)
  function "mod" (l, r : fixedu) return fixedu;
  function "mod" (l, r : fixeds) return fixeds;

  function "+" (l   : fixedu; r : REAL) return fixedu;
  function "+" (l   : REAL; r : fixedu) return fixedu;
  function "+" (l   : fixedu; r : NATURAL) return fixedu;
  function "+" (l   : NATURAL; r : fixedu) return fixedu;
  function "-" (l   : fixedu; r : REAL) return fixedu;
  function "-" (l   : REAL; r : fixedu) return fixedu;
  function "-" (l   : fixedu; r : NATURAL) return fixedu;
  function "-" (l   : NATURAL; r : fixedu) return fixedu;
  function "*" (l   : fixedu; r : REAL) return fixedu;
  function "*" (l   : REAL; r : fixedu) return fixedu;
  function "*" (l   : fixedu; r : NATURAL) return fixedu;
  function "*" (l   : NATURAL; r : fixedu) return fixedu;
  function "/" (l   : fixedu; r : REAL) return fixedu;
  function "/" (l   : REAL; r : fixedu) return fixedu;
  function "/" (l   : fixedu; r : NATURAL) return fixedu;
  function "/" (l   : NATURAL; r : fixedu) return fixedu;
  function "rem" (l : fixedu; r : REAL) return fixedu;
  function "rem" (l : REAL; r : fixedu) return fixedu;
  function "rem" (l : fixedu; r : NATURAL) return fixedu;
  function "rem" (l : NATURAL; r : fixedu) return fixedu;
  function "mod" (l : fixedu; r : REAL) return fixedu;
  function "mod" (l : REAL; r : fixedu) return fixedu;
  function "mod" (l : fixedu; r : NATURAL) return fixedu;
  function "mod" (l : NATURAL; r : fixedu) return fixedu;

  function "+" (l   : fixeds; r : REAL) return fixeds;
  function "+" (l   : REAL; r : fixeds) return fixeds;
  function "+" (l   : fixeds; r : INTEGER) return fixeds;
  function "+" (l   : INTEGER; r : fixeds) return fixeds;
  function "-" (l   : fixeds; r : REAL) return fixeds;
  function "-" (l   : REAL; r : fixeds) return fixeds;
  function "-" (l   : fixeds; r : INTEGER) return fixeds;
  function "-" (l   : INTEGER; r : fixeds) return fixeds;
  function "*" (l   : fixeds; r : REAL) return fixeds;
  function "*" (l   : REAL; r : fixeds) return fixeds;
  function "*" (l   : fixeds; r : INTEGER) return fixeds;
  function "*" (l   : INTEGER; r : fixeds) return fixeds;
  function "/" (l   : fixeds; r : REAL) return fixeds;
  function "/" (l   : REAL; r : fixeds) return fixeds;
  function "/" (l   : fixeds; r : INTEGER) return fixeds;
  function "/" (l   : INTEGER; r : fixeds) return fixeds;
  function "rem" (l : fixeds; r : REAL) return fixeds;
  function "rem" (l : REAL; r : fixeds) return fixeds;
  function "rem" (l : fixeds; r : INTEGER) return fixeds;
  function "rem" (l : INTEGER; r : fixeds) return fixeds;
  function "mod" (l : fixeds; r : REAL) return fixeds;
  function "mod" (l : REAL; r : fixeds) return fixeds;
  function "mod" (l : fixeds; r : INTEGER) return fixeds;
  function "mod" (l : INTEGER; r : fixeds) return fixeds;

  -- This version of divide gives the user more control
  -- fixedu(a downto b) / fixedu(c downto d) = fixedu(a downto b)
  function divide (
    l, r                 : fixedu;
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixedu;

  -- This version of divide gives the user more control
  -- fixeds(a downto b) / fixeds(c downto d) = fixeds(a downto b)
  function divide (
    l, r                 : fixeds;
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixeds;

  -- These functions return 1/X
  -- 1 / fixedu (a downto b) = fixedu (a downto b)
  function reciprocal (
    arg                  : fixedu;      -- fixed point input
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixedu;

  -- 1 / fixedu (a downto b) = fixedu (a downto b)
  function reciprocal (
    arg                  : fixeds;      -- fixed point input
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixeds;

  -- REM function
  -- fixedu(a downto b) rem fixedu(c downto d) = fixedu(c downto d)
  function remainder (
    l, r                 : fixedu;
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixedu;

  -- fixeds(a downto b) rem fixeds(c downto d) = fixeds(c downto d)
  function remainder (
    l, r                 : fixeds;
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixeds;

  -- mod function
  -- fixedu(a downto b) mod fixedu(c downto d) = fixedu(c downto d)
  function modulo (
    l, r                 : fixedu;
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixedu;

  -- fixeds(a downto b) mod fixeds(c downto d) = fixeds(c downto d)
  function modulo (
    l, r                    : fixeds;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style;
    constant guard_bits     : NATURAL                   := fixed_guard_bits)
    return fixeds;

  -- Procedure for those who need an "accumulator" function.
  -- add_carry (fixedu(a downto b), fixedu (c downto d))
  --         = fixedu (maximum(a,c) downto minimum(b,d))
  procedure add_carry (
    L, R   : in  fixedu;
    c_in   : in  STD_ULOGIC;
    result : out fixedu;
    c_out  : out STD_ULOGIC);

  -- add_carry (fixeds(a downto b), fixeds (c downto d))
  --         = fixeds (maximum(a,c) downto minimum(b,d))
  procedure add_carry (
    L, R   : in  fixeds;
    c_in   : in  STD_ULOGIC;
    result : out fixeds;
    c_out  : out STD_ULOGIC);

  -- Scales the result by a power of 2.  Width of input = width of output with
  -- the binary point moved.
  function scalb (y : fixedu; N : INTEGER) return fixedu;
  function scalb (y : fixedu; N : SIGNED) return fixedu;
  function scalb (y : fixeds; N : INTEGER) return fixeds;
  function scalb (y : fixeds; N : SIGNED) return fixeds;

  function Is_Negative (arg : fixeds) return BOOLEAN;

  -- ===========================================================================
  -- Comparison Operators
  -- ===========================================================================

  function ">" (l, r  : fixedu) return BOOLEAN;
  function ">" (l, r  : fixeds) return BOOLEAN;
  function "<" (l, r  : fixedu) return BOOLEAN;
  function "<" (l, r  : fixeds) return BOOLEAN;
  function "<=" (l, r : fixedu) return BOOLEAN;
  function "<=" (l, r : fixeds) return BOOLEAN;
  function ">=" (l, r : fixedu) return BOOLEAN;
  function ">=" (l, r : fixeds) return BOOLEAN;
  function "=" (l, r  : fixedu) return BOOLEAN;
  function "=" (l, r  : fixeds) return BOOLEAN;
  function "/=" (l, r : fixedu) return BOOLEAN;
  function "/=" (l, r : fixeds) return BOOLEAN;

  -- These will be replace with "?=", etc operators in VHDL-2006
  function \?=\ (l, r  : fixedu) return STD_ULOGIC;
  function \?/=\ (l, r : fixedu) return STD_ULOGIC;
  function \?>\ (l, r  : fixedu) return STD_ULOGIC;
  function \?>=\ (l, r : fixedu) return STD_ULOGIC;
  function \?<\ (l, r  : fixedu) return STD_ULOGIC;
  function \?<=\ (l, r : fixedu) return STD_ULOGIC;
  function \?=\ (l, r  : fixeds) return STD_ULOGIC;
  function \?/=\ (l, r : fixeds) return STD_ULOGIC;
  function \?>\ (l, r  : fixeds) return STD_ULOGIC;
  function \?>=\ (l, r : fixeds) return STD_ULOGIC;
  function \?<\ (l, r  : fixeds) return STD_ULOGIC;
  function \?<=\ (l, r : fixeds) return STD_ULOGIC;

  function std_match (l, r : fixedu) return BOOLEAN;
  function std_match (l, r : fixeds) return BOOLEAN;

  -- Overloads the default "maximum" and "minimum" function

  function maximum (l, r : fixedu) return fixedu;
  function minimum (l, r : fixedu) return fixedu;
  function maximum (l, r : fixeds) return fixeds;
  function minimum (l, r : fixeds) return fixeds;

  ----------------------------------------------------------------------------
  -- In these compare functions a natural is converted into a
  -- fixed point number of the bounds "maximum(l'high,0) downto 0"
  ----------------------------------------------------------------------------

  function "=" (l  : fixedu; r : NATURAL) return BOOLEAN;
  function "/=" (l : fixedu; r : NATURAL) return BOOLEAN;
  function ">=" (l : fixedu; r : NATURAL) return BOOLEAN;
  function "<=" (l : fixedu; r : NATURAL) return BOOLEAN;
  function ">" (l  : fixedu; r : NATURAL) return BOOLEAN;
  function "<" (l  : fixedu; r : NATURAL) return BOOLEAN;

  function "=" (l  : NATURAL; r : fixedu) return BOOLEAN;
  function "/=" (l : NATURAL; r : fixedu) return BOOLEAN;
  function ">=" (l : NATURAL; r : fixedu) return BOOLEAN;
  function "<=" (l : NATURAL; r : fixedu) return BOOLEAN;
  function ">" (l  : NATURAL; r : fixedu) return BOOLEAN;
  function "<" (l  : NATURAL; r : fixedu) return BOOLEAN;

  function \?=\ (l  : fixedu; r : NATURAL) return STD_ULOGIC;
  function \?/=\ (l : fixedu; r : NATURAL) return STD_ULOGIC;
  function \?>=\ (l : fixedu; r : NATURAL) return STD_ULOGIC;
  function \?<=\ (l : fixedu; r : NATURAL) return STD_ULOGIC;
  function \?>\ (l  : fixedu; r : NATURAL) return STD_ULOGIC;
  function \?<\ (l  : fixedu; r : NATURAL) return STD_ULOGIC;

  function \?=\ (l  : NATURAL; r : fixedu) return STD_ULOGIC;
  function \?/=\ (l : NATURAL; r : fixedu) return STD_ULOGIC;
  function \?>=\ (l : NATURAL; r : fixedu) return STD_ULOGIC;
  function \?<=\ (l : NATURAL; r : fixedu) return STD_ULOGIC;
  function \?>\ (l  : NATURAL; r : fixedu) return STD_ULOGIC;
  function \?<\ (l  : NATURAL; r : fixedu) return STD_ULOGIC;

  function maximum (l : fixedu; r : NATURAL)
    return fixedu;
  function minimum (l : fixedu; r : NATURAL)
    return fixedu;
  function maximum (l : NATURAL; r : fixedu)
    return fixedu;
  function minimum (l : NATURAL; r : fixedu)
    return fixedu;
  ----------------------------------------------------------------------------
  -- In these compare functions a real is converted into a
  -- fixed point number of the bounds "l'high+1 downto l'low"
  ----------------------------------------------------------------------------

  function "=" (l  : fixedu; r : REAL) return BOOLEAN;
  function "/=" (l : fixedu; r : REAL) return BOOLEAN;
  function ">=" (l : fixedu; r : REAL) return BOOLEAN;
  function "<=" (l : fixedu; r : REAL) return BOOLEAN;
  function ">" (l  : fixedu; r : REAL) return BOOLEAN;
  function "<" (l  : fixedu; r : REAL) return BOOLEAN;

  function "=" (l  : REAL; r : fixedu) return BOOLEAN;
  function "/=" (l : REAL; r : fixedu) return BOOLEAN;
  function ">=" (l : REAL; r : fixedu) return BOOLEAN;
  function "<=" (l : REAL; r : fixedu) return BOOLEAN;
  function ">" (l  : REAL; r : fixedu) return BOOLEAN;
  function "<" (l  : REAL; r : fixedu) return BOOLEAN;

  function \?=\ (l  : fixedu; r : REAL) return STD_ULOGIC;
  function \?/=\ (l : fixedu; r : REAL) return STD_ULOGIC;
  function \?>=\ (l : fixedu; r : REAL) return STD_ULOGIC;
  function \?<=\ (l : fixedu; r : REAL) return STD_ULOGIC;
  function \?>\ (l  : fixedu; r : REAL) return STD_ULOGIC;
  function \?<\ (l  : fixedu; r : REAL) return STD_ULOGIC;

  function \?=\ (l  : REAL; r : fixedu) return STD_ULOGIC;
  function \?/=\ (l : REAL; r : fixedu) return STD_ULOGIC;
  function \?>=\ (l : REAL; r : fixedu) return STD_ULOGIC;
  function \?<=\ (l : REAL; r : fixedu) return STD_ULOGIC;
  function \?>\ (l  : REAL; r : fixedu) return STD_ULOGIC;
  function \?<\ (l  : REAL; r : fixedu) return STD_ULOGIC;

  function maximum (l : fixedu; r : REAL) return fixedu;
  function maximum (l : REAL; r : fixedu) return fixedu;
  function minimum (l : fixedu; r : REAL) return fixedu;
  function minimum (l : REAL; r : fixedu) return fixedu;
  ----------------------------------------------------------------------------
  -- In these compare functions an integer is converted into a
  -- fixed point number of the bounds "maximum(l'high,1) downto 0"
  ----------------------------------------------------------------------------

  function "=" (l  : fixeds; r : INTEGER) return BOOLEAN;
  function "/=" (l : fixeds; r : INTEGER) return BOOLEAN;
  function ">=" (l : fixeds; r : INTEGER) return BOOLEAN;
  function "<=" (l : fixeds; r : INTEGER) return BOOLEAN;
  function ">" (l  : fixeds; r : INTEGER) return BOOLEAN;
  function "<" (l  : fixeds; r : INTEGER) return BOOLEAN;

  function "=" (l  : INTEGER; r : fixeds) return BOOLEAN;
  function "/=" (l : INTEGER; r : fixeds) return BOOLEAN;
  function ">=" (l : INTEGER; r : fixeds) return BOOLEAN;
  function "<=" (l : INTEGER; r : fixeds) return BOOLEAN;
  function ">" (l  : INTEGER; r : fixeds) return BOOLEAN;
  function "<" (l  : INTEGER; r : fixeds) return BOOLEAN;

  function \?=\ (l  : fixeds; r : INTEGER) return STD_ULOGIC;
  function \?/=\ (l : fixeds; r : INTEGER) return STD_ULOGIC;
  function \?>=\ (l : fixeds; r : INTEGER) return STD_ULOGIC;
  function \?<=\ (l : fixeds; r : INTEGER) return STD_ULOGIC;
  function \?>\ (l  : fixeds; r : INTEGER) return STD_ULOGIC;
  function \?<\ (l  : fixeds; r : INTEGER) return STD_ULOGIC;

  function \?=\ (l  : INTEGER; r : fixeds) return STD_ULOGIC;
  function \?/=\ (l : INTEGER; r : fixeds) return STD_ULOGIC;
  function \?>=\ (l : INTEGER; r : fixeds) return STD_ULOGIC;
  function \?<=\ (l : INTEGER; r : fixeds) return STD_ULOGIC;
  function \?>\ (l  : INTEGER; r : fixeds) return STD_ULOGIC;
  function \?<\ (l  : INTEGER; r : fixeds) return STD_ULOGIC;

  function maximum (l : fixeds; r : INTEGER)
    return fixeds;
  function maximum (l : INTEGER; r : fixeds)
    return fixeds;
  function minimum (l : fixeds; r : INTEGER)
    return fixeds;
  function minimum (l : INTEGER; r : fixeds)
    return fixeds;
  ----------------------------------------------------------------------------
  -- In these compare functions a real is converted into a
  -- fixed point number of the bounds "l'high+1 downto l'low"
  ----------------------------------------------------------------------------

  function "=" (l  : fixeds; r : REAL) return BOOLEAN;
  function "/=" (l : fixeds; r : REAL) return BOOLEAN;
  function ">=" (l : fixeds; r : REAL) return BOOLEAN;
  function "<=" (l : fixeds; r : REAL) return BOOLEAN;
  function ">" (l  : fixeds; r : REAL) return BOOLEAN;
  function "<" (l  : fixeds; r : REAL) return BOOLEAN;

  function "=" (l  : REAL; r : fixeds) return BOOLEAN;
  function "/=" (l : REAL; r : fixeds) return BOOLEAN;
  function ">=" (l : REAL; r : fixeds) return BOOLEAN;
  function "<=" (l : REAL; r : fixeds) return BOOLEAN;
  function ">" (l  : REAL; r : fixeds) return BOOLEAN;
  function "<" (l  : REAL; r : fixeds) return BOOLEAN;

  function \?=\ (l  : fixeds; r : REAL) return STD_ULOGIC;
  function \?/=\ (l : fixeds; r : REAL) return STD_ULOGIC;
  function \?>=\ (l : fixeds; r : REAL) return STD_ULOGIC;
  function \?<=\ (l : fixeds; r : REAL) return STD_ULOGIC;
  function \?>\ (l  : fixeds; r : REAL) return STD_ULOGIC;
  function \?<\ (l  : fixeds; r : REAL) return STD_ULOGIC;

  function \?=\ (l  : REAL; r : fixeds) return STD_ULOGIC;
  function \?/=\ (l : REAL; r : fixeds) return STD_ULOGIC;
  function \?>=\ (l : REAL; r : fixeds) return STD_ULOGIC;
  function \?<=\ (l : REAL; r : fixeds) return STD_ULOGIC;
  function \?>\ (l  : REAL; r : fixeds) return STD_ULOGIC;
  function \?<\ (l  : REAL; r : fixeds) return STD_ULOGIC;

  function maximum (l : fixeds; r : REAL) return fixeds;
  function maximum (l : REAL; r : fixeds) return fixeds;
  function minimum (l : fixeds; r : REAL) return fixeds;
  function minimum (l : REAL; r : fixeds) return fixeds;
  -- ===========================================================================
  -- Shift and Rotate Functions.
  -- Note that sra and sla are not the same as the BIT_VECTOR version
  -- ===========================================================================

  function "sll" (ARG : fixedu; COUNT : INTEGER)
    return fixedu;
  function "srl" (ARG : fixedu; COUNT : INTEGER)
    return fixedu;
  function "rol" (ARG : fixedu; COUNT : INTEGER)
    return fixedu;
  function "ror" (ARG : fixedu; COUNT : INTEGER)
    return fixedu;
  function "sla" (ARG : fixedu; COUNT : INTEGER)
    return fixedu;
  function "sra" (ARG : fixedu; COUNT : INTEGER)
    return fixedu;
  function "sll" (ARG : fixeds; COUNT : INTEGER)
    return fixeds;
  function "srl" (ARG : fixeds; COUNT : INTEGER)
    return fixeds;
  function "rol" (ARG : fixeds; COUNT : INTEGER)
    return fixeds;
  function "ror" (ARG : fixeds; COUNT : INTEGER)
    return fixeds;
  function "sla" (ARG : fixeds; COUNT : INTEGER)
    return fixeds;
  function "sra" (ARG : fixeds; COUNT : INTEGER)
    return fixeds;
  function SHIFT_LEFT (ARG : fixedu; COUNT : NATURAL)
    return fixedu;
  function SHIFT_RIGHT (ARG : fixedu; COUNT : NATURAL)
    return fixedu;
  function SHIFT_LEFT (ARG : fixeds; COUNT : NATURAL)
    return fixeds;
  function SHIFT_RIGHT (ARG : fixeds; COUNT : NATURAL)
    return fixeds;

  ----------------------------------------------------------------------------
  -- logical functions
  ----------------------------------------------------------------------------

  function "not" (l     : fixedu) return fixedu;
  function "and" (l, r  : fixedu) return fixedu;
  function "or" (l, r   : fixedu) return fixedu;
  function "nand" (l, r : fixedu) return fixedu;
  function "nor" (l, r  : fixedu) return fixedu;
  function "xor" (l, r  : fixedu) return fixedu;
  function "xnor" (l, r : fixedu) return fixedu;
  function "not" (l     : fixeds) return fixeds;
  function "and" (l, r  : fixeds) return fixeds;
  function "or" (l, r   : fixeds) return fixeds;
  function "nand" (l, r : fixeds) return fixeds;
  function "nor" (l, r  : fixeds) return fixeds;
  function "xor" (l, r  : fixeds) return fixeds;
  function "xnor" (l, r : fixeds) return fixeds;

  -- Vector and std_ulogic functions, same as functions in numeric_std
  function "and" (l : STD_ULOGIC; r : fixedu)
    return fixedu;
  function "and" (l : fixedu; r : STD_ULOGIC)
    return fixedu;
  function "or" (l : STD_ULOGIC; r : fixedu)
    return fixedu;
  function "or" (l : fixedu; r : STD_ULOGIC)
    return fixedu;
  function "nand" (l : STD_ULOGIC; r : fixedu)
    return fixedu;
  function "nand" (l : fixedu; r : STD_ULOGIC)
    return fixedu;
  function "nor" (l : STD_ULOGIC; r : fixedu)
    return fixedu;
  function "nor" (l : fixedu; r : STD_ULOGIC)
    return fixedu;
  function "xor" (l : STD_ULOGIC; r : fixedu)
    return fixedu;
  function "xor" (l : fixedu; r : STD_ULOGIC)
    return fixedu;
  function "xnor" (l : STD_ULOGIC; r : fixedu)
    return fixedu;
  function "xnor" (l : fixedu; r : STD_ULOGIC)
    return fixedu;
  function "and" (l : STD_ULOGIC; r : fixeds)
    return fixeds;
  function "and" (l : fixeds; r : STD_ULOGIC)
    return fixeds;
  function "or" (l : STD_ULOGIC; r : fixeds)
    return fixeds;
  function "or" (l : fixeds; r : STD_ULOGIC)
    return fixeds;
  function "nand" (l : STD_ULOGIC; r : fixeds)
    return fixeds;
  function "nand" (l : fixeds; r : STD_ULOGIC)
    return fixeds;
  function "nor" (l : STD_ULOGIC; r : fixeds)
    return fixeds;
  function "nor" (l : fixeds; r : STD_ULOGIC)
    return fixeds;
  function "xor" (l : STD_ULOGIC; r : fixeds)
    return fixeds;
  function "xor" (l : fixeds; r : STD_ULOGIC)
    return fixeds;
  function "xnor" (l : STD_ULOGIC; r : fixeds)
    return fixeds;
  function "xnor" (l : fixeds; r : STD_ULOGIC)
    return fixeds;

  -- Reduction operators, same as numeric_std functions
  function and_reduce (l  : fixedu) return STD_ULOGIC;
  function nand_reduce (l : fixedu) return STD_ULOGIC;
  function or_reduce (l   : fixedu) return STD_ULOGIC;
  function nor_reduce (l  : fixedu) return STD_ULOGIC;
  function xor_reduce (l  : fixedu) return STD_ULOGIC;
  function xnor_reduce (l : fixedu) return STD_ULOGIC;
  function and_reduce (l  : fixeds) return STD_ULOGIC;
  function nand_reduce (l : fixeds) return STD_ULOGIC;
  function or_reduce (l   : fixeds) return STD_ULOGIC;
  function nor_reduce (l  : fixeds) return STD_ULOGIC;
  function xor_reduce (l  : fixeds) return STD_ULOGIC;
  function xnor_reduce (l : fixeds) return STD_ULOGIC;

  -- returns arg'low-1 if not found
  function find_leftmost (arg : fixedu; y : STD_ULOGIC)
    return INTEGER;
  function find_leftmost (arg : fixeds; y : STD_ULOGIC)
    return INTEGER;

  -- returns arg'high+1 if not found
  function find_rightmost (arg : fixedu; y : STD_ULOGIC)
    return INTEGER;
  function find_rightmost (arg : fixeds; y : STD_ULOGIC)
    return INTEGER;

  -- ===========================================================================
  --   RESIZE Functions
  -- ===========================================================================
  -- resizes the number (larger or smaller)
  -- The returned result will be fixedu (left_index downto right_index)
  -- If "round_style" is fixed_round, then the result will be rounded.
  -- If the MSB of the remainder is a "1" AND the LSB of the unrounded result
  -- is a '1' or the lower bits of the remainder include a '1' then the result
  -- will be increased by the smallest representable number for that type.
  -- "overflow_style" can be fixed_saturate or fixed_wrap.
  -- In saturate mode, if the number overflows then the largest possible
  -- representable number is returned.  If wrap mode, then the upper bits
  -- of the number are truncated.
  
  function resize (
    arg                     : fixedu;   -- input
    constant left_index     : INTEGER;  -- integer portion
    constant right_index    : INTEGER;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixedu;

  -- "size_res" functions create the size of the output from the length
  -- of the "size_res" input.  The actual value of "size_res" is not used.
  function resize (
    arg                     : fixedu;   -- input
    size_res                : fixedu;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixedu;

  -- Note that in "wrap" mode the sign bit is not replicated.  Thus the
  -- resize of a negative number can have a positive result in wrap mode.
  function resize (
    arg                     : fixeds;   -- input
    constant left_index     : INTEGER;  -- integer portion
    constant right_index    : INTEGER;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixeds;

  function resize (
    arg                     : fixeds;   -- input
    size_res                : fixeds;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixeds;

  -- ===========================================================================
  -- Conversion Functions
  -- ===========================================================================

  -- integer (natural) to unsigned fixed point.
  -- arguments are the upper and lower bounds of the number, thus
  -- fixedu (7 downto -3) <= to_fixedu (int, 7, -3);
  function to_fixedu (
    arg                     : NATURAL;  -- integer
    constant left_index     : INTEGER;  -- size of integer portion
    constant right_index    : INTEGER                   := 0;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixedu;

  function to_fixedu (
    arg                     : NATURAL;  -- integer
    size_res                : fixedu;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixedu;

  -- real to unsigned fixed point
  function to_fixedu (
    arg                     : REAL;     -- real
    constant left_index     : INTEGER;  -- size of integer portion
    constant right_index    : INTEGER;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style;
    constant guard_bits     : NATURAL                   := fixed_guard_bits)
    return fixedu;

  function to_fixedu (
    arg                     : REAL;     -- real
    size_res                : fixedu;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style;
    constant guard_bits     : NATURAL                   := fixed_guard_bits)
    return fixedu;

  -- unsigned to unsigned fixed point
  function to_fixedu (
    arg                     : UNSIGNED;                        -- unsigned
    constant left_index     : INTEGER;  -- size of integer portion
    constant right_index    : INTEGER                   := 0;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixedu;

  function to_fixedu (
    arg                     : UNSIGNED;  -- unsigned
    size_res                : fixedu;    -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixedu;

  -- Performs a conversion.  fixedu (arg'range) is returned
  function to_fixedu (
    arg : UNSIGNED)                     -- unsigned
    return fixedu;

  -- Conversion from fixeds to fixedu (performs an "abs" function)
  function to_fixedu (
    arg : fixeds)
    return fixedu;

  -- unsigned fixed point to unsigned
  function to_unsigned (
    arg                     : fixedu;   -- fixed point input
    constant size           : NATURAL;  -- length of output
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return UNSIGNED;

  -- unsigned fixed point to unsigned
  function to_unsigned (
    arg                     : fixedu;    -- fixed point input
    size_res                : UNSIGNED;  -- used for length of output
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return UNSIGNED;

  -- unsigned fixed point to real
  function to_real (
    arg : fixedu)                       -- fixed point input
    return REAL;

  -- unsigned fixed point to integer
  function to_integer (
    arg                     : fixedu;   -- fixed point input
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return NATURAL;

  -- Integer to fixeds
  function to_fixeds (
    arg                     : INTEGER;  -- integer
    constant left_index     : INTEGER;  -- size of integer portion
    constant right_index    : INTEGER                   := 0;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixeds;

  function to_fixeds (
    arg                     : INTEGER;  -- integer
    size_res                : fixeds;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixeds;

  -- Real to fixeds
  function to_fixeds (
    arg                     : REAL;     -- real
    constant left_index     : INTEGER;  -- size of integer portion
    constant right_index    : INTEGER;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style;
    constant guard_bits     : NATURAL                   := fixed_guard_bits)
    return fixeds;

  function to_fixeds (
    arg                     : REAL;     -- real
    size_res                : fixeds;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style;
    constant guard_bits     : NATURAL                   := fixed_guard_bits)
    return fixeds;

  -- signed to fixeds
  function to_fixeds (
    arg                     : SIGNED;   -- signed
    constant left_index     : INTEGER;  -- size of integer portion
    constant right_index    : INTEGER                   := 0;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixeds;

  function to_fixeds (
    arg                     : SIGNED;   -- signed
    size_res                : fixeds;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixeds;

  -- signed to fixeds (output assumed to be size of signed input)
  function to_fixeds (
    arg : SIGNED)                       -- signed
    return fixeds;

  -- Conversion from fixedu to fixeds
  function to_fixeds (
    arg : fixedu)
    return fixeds;

  -- signed fixed point to signed
  function to_signed (
    arg                     : fixeds;   -- fixed point input
    constant size           : NATURAL;  -- length of output
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return SIGNED;

  -- signed fixed point to signed
  function to_signed (
    arg                     : fixeds;   -- fixed point input
    size_res                : SIGNED;   -- used for length of output
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return SIGNED;

  -- signed fixed point to real
  function to_real (
    arg : fixeds)                       -- fixed point input
    return REAL;

  -- signed fixed point to integer
  function to_integer (
    arg                     : fixeds;   -- fixed point input
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return INTEGER;


  -- purpose: returns a saturated number
  function saturate (
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixedu;

  -- purpose: returns a saturated number
  function saturate (
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixeds;

  function saturate (
    size_res : fixedu)                  -- only the size of this is used
    return fixedu;

  function saturate (
    size_res : fixeds)                  -- only the size of this is used
    return fixeds;

  -- ===========================================================================
  -- Translation Functions
  -- ===========================================================================

  -- maps meta-logical values
  function to_01 (
    s             : fixedu;             -- fixed point input
    constant XMAP : STD_ULOGIC := '0')  -- Map x to
    return fixedu;

  -- maps meta-logical values
  function to_01 (
    s             : fixeds;             -- fixed point input
    constant XMAP : STD_ULOGIC := '0')  -- Map x to
    return fixeds;

  function Is_X (arg    : fixedu) return BOOLEAN;
  function Is_X (arg    : fixeds) return BOOLEAN;
  function to_X01 (arg  : fixedu) return fixedu;
  function to_X01 (arg  : fixeds) return fixeds;
  function to_X01Z (arg : fixedu) return fixedu;
  function to_X01Z (arg : fixeds) return fixeds;
  function to_UX01 (arg : fixedu) return fixedu;
  function to_UX01 (arg : fixeds) return fixeds;

  -- straight vector conversion routines, needed for synthesis.
  -- These functions are here so that a std_logic_vector can be
  -- converted to and from fixeds and fixedu.  Note that you can
  -- not convert these vectors because of their negative index.
  
  function to_slv (
    arg : fixedu)                       -- fixed point vector
    return STD_LOGIC_VECTOR;
  alias to_StdLogicVector is to_slv [fixedu
                                     return STD_LOGIC_VECTOR];
  alias to_Std_Logic_Vector is to_slv [fixedu
                                       return STD_LOGIC_VECTOR];

  function to_slv (
    arg : fixeds)                       -- fixed point vector
    return STD_LOGIC_VECTOR;
  alias to_StdLogicVector is to_slv [fixeds
                                     return STD_LOGIC_VECTOR];
  alias to_Std_Logic_Vector is to_slv [fixeds
                                       return STD_LOGIC_VECTOR];

  function to_sulv (
    arg : fixedu)                       -- fixed point vector
    return STD_ULOGIC_VECTOR;
  alias to_StdULogicVector is to_sulv [fixedu
                                      return STD_ULOGIC_VECTOR];
  alias to_Std_ULogic_Vector is to_sulv [fixedu
                                        return STD_ULOGIC_VECTOR];

  function to_sulv (
    arg : fixeds)                       -- fixed point vector
    return STD_ULOGIC_VECTOR;
  alias to_StdULogicVector is to_sulv [fixeds
                                      return STD_ULOGIC_VECTOR];
  alias to_Std_ULogic_Vector is to_sulv [fixeds
                                        return STD_ULOGIC_VECTOR];

  function to_fixedu (
    arg                  : STD_ULOGIC_VECTOR;  -- shifted vector
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixedu;

  function to_fixedu (
    arg      : STD_ULOGIC_VECTOR;       -- shifted vector
    size_res : fixedu)                  -- for size only
    return fixedu;

  function to_fixeds (
    arg                  : STD_ULOGIC_VECTOR;  -- shifted vector
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixeds;

  function to_fixeds (
    arg      : STD_ULOGIC_VECTOR;       -- shifted vector
    size_res : fixeds)                  -- for size only
    return fixeds;

  -- As a concession to those who use a graphical DSP environment,
  -- these functions take parameters in those tools format and create
  -- fixed point numbers.  These functions are designed to convert from
  -- a std_logic_vector to the VHDL fixed point format using the conventions
  -- of these packages.  In a pure VHDL environment you should use the
  -- "to_fixedu" and "to_fixeds" routines.

  -- unsigned fixed point
  function to_FixU (
    arg      : STD_ULOGIC_VECTOR;
    width    : NATURAL;                 -- width of vector
    fraction : NATURAL)                 -- width of fraction
    return fixedu;

  -- signed fixed point
  function to_FixS (
    arg      : STD_ULOGIC_VECTOR;
    width    : NATURAL;                 -- width of vector
    fraction : NATURAL)                 -- width of fraction
    return fixeds;

-- rtl_synthesis off
-- pragma synthesis_off
  -- ===========================================================================
  -- string and textio Functions
  -- ===========================================================================

  -- purpose: writes fixed point into a line
  procedure WRITE (
    L         : inout LINE;             -- input line
    VALUE     : in    fixedu;           -- fixed point input
    JUSTIFIED : in    SIDE  := right;
    FIELD     : in    WIDTH := 0);

  -- purpose: writes fixed point into a line
  procedure WRITE (
    L         : inout LINE;             -- input line
    VALUE     : in    fixeds;           -- fixed point input
    JUSTIFIED : in    SIDE  := right;
    FIELD     : in    WIDTH := 0);

  procedure READ(L     : inout LINE;
                 VALUE : out   fixedu);

  procedure READ(L     : inout LINE;
                 VALUE : out   fixedu;
                 GOOD  : out   BOOLEAN);

  procedure READ(L     : inout LINE;
                 VALUE : out   fixeds);

  procedure READ(L     : inout LINE;
                 VALUE : out   fixeds;
                 GOOD  : out   BOOLEAN);

  alias bwrite is WRITE [LINE, fixedu, SIDE, width];
  alias bwrite is WRITE [LINE, fixeds, SIDE, width];
  alias bread is READ [LINE, fixedu];
  alias bread is READ [LINE, fixedu, BOOLEAN];
  alias bread is READ [LINE, fixeds];
  alias bread is READ [LINE, fixeds, BOOLEAN];
  alias BINARY_WRITE is WRITE [LINE, fixedu, SIDE, width];
  alias BINARY_WRITE is WRITE [LINE, fixeds, SIDE, width];
  alias BINARY_READ is READ [LINE, fixedu, BOOLEAN];
  alias BINARY_READ is READ [LINE, fixedu];
  alias BINARY_READ is READ [LINE, fixeds, BOOLEAN];
  alias BINARY_READ is READ [LINE, fixeds];

  -- octal read and write
  procedure OWRITE (
    L         : inout LINE;             -- input line
    VALUE     : in    fixedu;           -- fixed point input
    JUSTIFIED : in    SIDE  := right;
    FIELD     : in    WIDTH := 0);

  procedure OWRITE (
    L         : inout LINE;             -- input line
    VALUE     : in    fixeds;           -- fixed point input
    JUSTIFIED : in    SIDE  := right;
    FIELD     : in    WIDTH := 0);

  procedure OREAD(L     : inout LINE;
                  VALUE : out   fixedu);

  procedure OREAD(L     : inout LINE;
                  VALUE : out   fixedu;
                  GOOD  : out   BOOLEAN);

  procedure OREAD(L     : inout LINE;
                  VALUE : out   fixeds);

  procedure OREAD(L     : inout LINE;
                  VALUE : out   fixeds;
                  GOOD  : out   BOOLEAN);
  alias OCTAL_READ is OREAD [LINE, fixedu, BOOLEAN];
  alias OCTAL_READ is OREAD [LINE, fixedu];
  alias OCTAL_READ is OREAD [LINE, fixeds, BOOLEAN];
  alias OCTAL_READ is OREAD [LINE, fixeds];
  alias OCTAL_WRITE is OWRITE [LINE, fixedu, SIDE, WIDTH];
  alias OCTAL_WRITE is OWRITE [LINE, fixeds, SIDE, WIDTH];

  -- hex read and write
  procedure HWRITE (
    L         : inout LINE;             -- input line
    VALUE     : in    fixedu;           -- fixed point input
    JUSTIFIED : in    SIDE  := right;
    FIELD     : in    WIDTH := 0);

  -- purpose: writes fixed point into a line
  procedure HWRITE (
    L         : inout LINE;             -- input line
    VALUE     : in    fixeds;           -- fixed point input
    JUSTIFIED : in    SIDE  := right;
    FIELD     : in    WIDTH := 0);

  procedure HREAD(L     : inout LINE;
                  VALUE : out   fixedu);

  procedure HREAD(L     : inout LINE;
                  VALUE : out   fixedu;
                  GOOD  : out   BOOLEAN);

  procedure HREAD(L     : inout LINE;
                  VALUE : out   fixeds);

  procedure HREAD(L     : inout LINE;
                  VALUE : out   fixeds;
                  GOOD  : out   BOOLEAN);
  alias HEX_READ is HREAD [LINE, fixedu, BOOLEAN];
  alias HEX_READ is HREAD [LINE, fixeds, BOOLEAN];
  alias HEX_READ is HREAD [LINE, fixedu];
  alias HEX_READ is HREAD [LINE, fixeds];
  alias HEX_WRITE is HWRITE [LINE, fixedu, SIDE, WIDTH];
  alias HEX_WRITE is HWRITE [LINE, fixeds, SIDE, WIDTH];

  -- returns a string, useful for:
  -- assert (x = y) report "error found " & to_string(x) severity error;
  function to_string (value : fixedu) return STRING;

  alias to_bstring is to_string [fixedu return STRING];
  alias TO_BINARY_STRING is TO_STRING [fixedu return STRING];

  function to_ostring (value : fixedu) return STRING;
  alias TO_OCTAL_STRING is TO_OSTRING [fixedu return STRING];

  function to_hstring (value : fixedu) return STRING;
  alias TO_HEX_STRING is TO_HSTRING [fixedu return STRING];

  function to_string (value : fixeds) return STRING;
  alias to_bstring is to_string [fixeds return STRING];
  alias TO_BINARY_STRING is TO_STRING [fixeds return STRING];

  function to_ostring (value : fixeds) return STRING;
  alias TO_OCTAL_STRING is TO_OSTRING [fixeds return STRING];

  function to_hstring (value : fixeds) return STRING;
  alias TO_HEX_STRING is TO_HSTRING [fixeds return STRING];

  -- From string functions allow you to convert a string into a fixed
  -- point number.  Example:
  --  signal uf1 : fixedu (3 downto -3);
  --  uf1 <= from_string ("0110.100", uf1'high, uf1'low); -- 6.5
  -- The "." is optional in this syntax, however it exist and is
  -- in the wrong location an error is produced.  Overflow will
  -- result in saturation.
  
  function from_string (
    bstring              : STRING;      -- binary string
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixedu;
  alias from_bstring is from_string [STRING, INTEGER, INTEGER
                                     return fixedu];
  alias from_binary_string is from_string [STRING, INTEGER, INTEGER
                                           return fixedu];

  -- Octal and hex conversions work as follows:
  -- uf1 <= from_hstring ("6.8", 3, -3); -- 6.5 (bottom zeros dropped)
  -- uf1 <= from_ostring ("06.4", 3, -3); -- 6.5 (top zeros dropped)
  
  function from_ostring (
    ostring              : STRING;      -- Octal string
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixedu;
  alias from_octal_string is from_ostring [STRING, INTEGER, INTEGER
                                           return fixedu];

  function from_hstring (
    hstring              : STRING;      -- hex string
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixedu;
  alias from_hex_string is from_hstring [STRING, INTEGER, INTEGER
                                         return fixedu];

  function from_string (
    bstring              : STRING;      -- binary string
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixeds;
  alias from_bstring is from_string [STRING, INTEGER, INTEGER
                                     return fixeds];
  alias from_binary_string is from_string [STRING, INTEGER, INTEGER
                                           return fixeds];

  function from_ostring (
    ostring              : STRING;      -- Octal string
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixeds;
  alias from_octal_string is from_ostring [STRING, INTEGER, INTEGER
                                           return fixeds];

  function from_hstring (
    hstring              : STRING;      -- hex string
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixeds;
  alias from_hex_string is from_hstring [STRING, INTEGER, INTEGER
                                         return fixeds];

  -- Same as above, "size_res" is used for it's range only.
  function from_string (
    bstring  : STRING;                  -- binary string
    size_res : fixedu)
    return fixedu;
  alias from_bstring is from_string [STRING, fixedu
                                     return fixedu];
  alias from_binary_string is from_string [STRING, fixedu
                                           return fixedu];

  function from_ostring (
    ostring  : STRING;                  -- Octal string
    size_res : fixedu)
    return fixedu;
  alias from_octal_string is from_ostring [STRING, fixedu
                                           return fixedu];

  function from_hstring (
    hstring  : STRING;                  -- hex string
    size_res : fixedu)
    return fixedu;
  alias from_hex_string is from_hstring [STRING, fixedu
                                         return fixedu];

  function from_string (
    bstring  : STRING;                  -- binary string
    size_res : fixeds)
    return fixeds;
  alias from_bstring is from_string [STRING, fixeds
                                     return fixeds];
  alias from_binary_string is from_string [STRING, fixeds
                                           return fixeds];

  function from_ostring (
    ostring  : STRING;                  -- Octal string
    size_res : fixeds)
    return fixeds;
  alias from_octal_string is from_ostring [STRING, fixeds
                                           return fixeds];

  function from_hstring (
    hstring  : STRING;                  -- hex string
    size_res : fixeds)
    return fixeds;
  alias from_hex_string is from_hstring [STRING, fixeds
                                         return fixeds];

  -- Direct conversion functions.  Example:
  --  signal uf1 : fixedu (3 downto -3);
  --  uf1 <= from_string ("0110.100"); -- 6.5
  -- In this case the "." is not optional, and the size of
  -- the output must match exactly.
  
  function from_string (
    bstring : STRING)                   -- binary string
    return fixedu;
  alias from_bstring is from_string [STRING return fixedu];
  alias from_binary_string is from_string [STRING return fixedu];

  -- Direct octal and hex conversion functions.  In this case
  -- the string lengths must match.  Example:
  -- signal sf1 := fixeds (5 downto -3);
  -- sf1 <= from_ostring ("71.4") -- -6.5
  
  function from_ostring (
    ostring : STRING)                   -- Octal string
    return fixedu;
  alias from_octal_string is from_ostring [STRING return fixedu];

  function from_hstring (
    hstring : STRING)                   -- hex string
    return fixedu;
  alias from_hex_string is from_hstring [STRING return fixedu];

  function from_string (
    bstring : STRING)                   -- binary string
    return fixeds;
  alias from_bstring is from_string [STRING return fixeds];
  alias from_binary_string is from_string [STRING return fixeds];

  function from_ostring (
    ostring : STRING)                   -- Octal string
    return fixeds;
  alias from_octal_string is from_ostring [STRING return fixeds];

  function from_hstring (
    hstring : STRING)                   -- hex string
    return fixeds;
  alias from_hex_string is from_hstring [STRING return fixeds];
-- rtl_synthesis on
-- pragma synthesis_on

  -- IN VHDL-2006 std_logic_vector is a subtype of std_ulogic_vector, so these
  -- extra functions are needed for compatability.
  function to_fixedu (
    arg                  : STD_LOGIC_VECTOR;  -- shifted vector
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixedu;

  function to_fixedu (
    arg      : STD_LOGIC_VECTOR;        -- shifted vector
    size_res : fixedu)                  -- for size only
    return fixedu;

  function to_fixeds (
    arg                  : STD_LOGIC_VECTOR;  -- shifted vector
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixeds;

  function to_fixeds (
    arg      : STD_LOGIC_VECTOR;        -- shifted vector
    size_res : fixeds)                  -- for size only
    return fixeds;

  -- unsigned fixed point
  function to_FixU (
    arg      : STD_LOGIC_VECTOR;
    width    : NATURAL;                 -- width of vector
    fraction : NATURAL)                 -- width of fraction
    return fixedu;

  -- signed fixed point
  function to_FixS (
    arg      : STD_LOGIC_VECTOR;
    width    : NATURAL;                 -- width of vector
    fraction : NATURAL)                 -- width of fraction
    return fixeds;

end package fixed_noresize;

package body fixed_noresize is

  -- %%% Replicated functions
  function maximum (
    l, r : INTEGER)                     -- inputs
    return INTEGER is
  begin  -- function max
    if l > r then return l;
    else return r;
    end if;
  end function maximum;

  function minimum (
    l, r : INTEGER)                     -- inputs
    return INTEGER is
  begin  -- function min
    if l > r then return r;
    else return l;
    end if;
  end function minimum;
  -- %%% end replicated functions

  -- ===========================================================================
  -- Arithmetic Operators:
  -- ===========================================================================

  -- Absolute value, 2's complement
  function "abs" (arg : fixeds) return fixeds is
    variable argt : sfixed (arg'range);
  begin
    argt := resize (arg         => abs (sfixed(arg)),
                    left_index  => arg'high,
                    right_index => arg'low);
    return fixeds (argt);
  end function "abs";

  -- Negation, 2's complement
  -- - fixeds(a downto b) = fixeds(a+1 downto b)
  function "-" (arg : fixeds)return fixeds is
    variable argt : sfixed (arg'range);
  begin
    argt := resize (arg         => - (sfixed(arg)),
                    left_index  => arg'high,
                    right_index => arg'low);
    return fixeds (argt);
  end function "-";

  -- Addition
  function "+" (l, r : fixedu) return fixedu is
    variable result : ufixed (maximum (L'high, R'high) downto
                              minimum (L'low, R'low));
  begin
    result := resize (arg         => ufixed(l) + ufixed(r),
                      left_index  => result'high,
                      right_index => result'low);
    return fixedu (result);
  end function "+";

  function "+" (l, r : fixeds) return fixeds is
    variable result : sfixed (maximum (L'high, R'high) downto
                              minimum (L'low, R'low));
  begin
    result := resize (arg         => sfixed(l) + sfixed(r),
                      left_index  => result'high,
                      right_index => result'low);
    return fixeds (result);
  end function "+";

  -- Subtraction
  function "-" (l, r : fixedu) return fixedu is
    variable result : ufixed (maximum (L'high, R'high) downto
                              minimum (L'low, R'low));
  begin
    result := resize (arg         => ufixed(l) - ufixed(r),
                      left_index  => result'high,
                      right_index => result'low);
    return fixedu (result);
  end function "-";


  function "-" (l, r : fixeds) return fixeds is
    variable result : sfixed (maximum (L'high, R'high) downto
                              minimum (L'low, R'low));
  begin
    result := resize (arg         => sfixed(l) - sfixed(r),
                      left_index  => result'high,
                      right_index => result'low);
    return fixeds (result);
  end function "-";

  -- Multiplication
  function "*" (l, r : fixedu) return fixedu is
    variable result : ufixed (l'high + r'high + 1 downto r'low + l'low);
  begin
    result := ufixed(l) * ufixed(r);    -- No resize necessary
    return fixedu (result);
  end function "*";

  function "*" (l, r : fixeds) return fixeds is
    variable result : sfixed (l'high + r'high + 1 downto r'low + l'low);
  begin
    result := sfixed(l) * sfixed(r);    -- No resize necessary
    return fixeds (result);
  end function "*";

  -- Division
  function "/" (l, r : fixedu) return fixedu is
  begin
    return divide (l, r);
  end function "/";

  function "/" (l, r : fixeds) return fixeds is
  begin
    return divide (l, r);
  end function "/";

  -- Remainder
  function "rem" (l, r : fixedu) return fixedu is
  begin
    return remainder (l, r);
  end function "rem";

  function "rem" (l, r : fixeds) return fixeds is
  begin
    return remainder (l, r);
  end function "rem";

  -- Modulo
  function "mod" (l, r : fixedu) return fixedu is
  begin
    return modulo (l, r);
  end function "mod";

  function "mod" (l, r : fixeds) return fixeds is
  begin
    return modulo (l, r);
  end function "mod";

  function ">" (l, r : fixedu) return BOOLEAN is
  begin
    return ufixed(l) > ufixed(r);
  end function ">";
  function ">" (l, r : fixeds) return BOOLEAN is
  begin
    return sfixed(l) > sfixed(r);
  end function ">";
  function "<" (l, r : fixedu) return BOOLEAN is
  begin
    return ufixed(l) < ufixed(r);
  end function "<";
  function "<" (l, r : fixeds) return BOOLEAN is
  begin
    return sfixed(l) < sfixed(r);
  end function "<";
  function "<=" (l, r : fixedu) return BOOLEAN is
  begin
    return ufixed(l) <= ufixed(r);
  end function "<=";
  function "<=" (l, r : fixeds) return BOOLEAN is
  begin
    return sfixed(l) <= sfixed(r);
  end function "<=";
  function ">=" (l, r : fixedu) return BOOLEAN is
  begin
    return ufixed(l) >= ufixed(r);
  end function ">=";
  function ">=" (l, r : fixeds) return BOOLEAN is
  begin
    return sfixed(l) >= sfixed(r);
  end function ">=";
  function "=" (l, r : fixedu) return BOOLEAN is
  begin
    return ufixed(l) = ufixed(r);
  end function "=";
  function "=" (l, r : fixeds) return BOOLEAN is
  begin
    return sfixed(l) = sfixed(r);
  end function "=";
  function "/=" (l, r : fixedu) return BOOLEAN is
  begin
    return ufixed(l) /= ufixed(r);
  end function "/=";
  function "/=" (l, r : fixeds) return BOOLEAN is
  begin
    return sfixed(l) /= sfixed(r);
  end function "/=";

  function \?=\ (l, r : fixedu) return STD_ULOGIC is
  begin
    return \?=\ (ufixed(l), ufixed(r));
  end function \?=\;
  function \?/=\ (l, r : fixedu) return STD_ULOGIC is
  begin
    return \?/=\ (ufixed(l), ufixed(r));
  end function \?/=\;
  function \?>\ (l, r : fixedu) return STD_ULOGIC is
  begin
    return \?>\ (ufixed(l), ufixed(r));
  end function \?>\;
  function \?>=\ (l, r : fixedu) return STD_ULOGIC is
  begin
    return \?>=\ (ufixed(l), ufixed(r));
  end function \?>=\;
  function \?<\ (l, r : fixedu) return STD_ULOGIC is
  begin
    return \?<\ (ufixed(l), ufixed(r));
  end function \?<\;
  function \?<=\ (l, r : fixedu) return STD_ULOGIC is
  begin
    return \?<=\ (ufixed(l), ufixed(r));
  end function \?<=\;
  function \?=\ (l, r : fixeds) return STD_ULOGIC is
  begin
    return \?=\ (sfixed(l), sfixed(r));
  end function \?=\;
  function \?/=\ (l, r : fixeds) return STD_ULOGIC is
  begin
    return \?/=\ (sfixed(l), sfixed(r));
  end function \?/=\;
  function \?>\ (l, r : fixeds) return STD_ULOGIC is
  begin
    return \?>\ (sfixed(l), sfixed(r));
  end function \?>\;
  function \?>=\ (l, r : fixeds) return STD_ULOGIC is
  begin
    return \?>=\ (sfixed(l), sfixed(r));
  end function \?>=\;
  function \?<\ (l, r : fixeds) return STD_ULOGIC is
  begin
    return \?<\ (sfixed(l), sfixed(r));
  end function \?<\;
  function \?<=\ (l, r : fixeds) return STD_ULOGIC is
  begin
    return \?<=\ (sfixed(l), sfixed(r));
  end function \?<=\;

  function std_match (l, r : fixedu) return BOOLEAN is
  begin
    return std_match (ufixed(l), ufixed(r));
  end function std_match;
  function std_match (l, r : fixeds) return BOOLEAN is
  begin
    return std_match (sfixed(l), sfixed(r));
  end function std_match;

  function maximum (l, r : fixedu) return fixedu is
  begin
    return fixedu (maximum (ufixed(l), ufixed(r)));
  end function maximum;
  function minimum (l, r : fixedu) return fixedu is
  begin
    return fixedu (minimum (ufixed(l), ufixed(r)));
  end function minimum;
  function maximum (l, r : fixeds) return fixeds is
  begin
    return fixeds (maximum (sfixed(l), sfixed(r)));
  end function maximum;
  function minimum (l, r : fixeds) return fixeds is
  begin
    return fixeds (minimum (sfixed(l), sfixed(r)));
  end function minimum;
  -- Overloaded math functions for real
  function "+" (
    l : fixedu;                         -- fixed point input
    r : REAL)
    return fixedu is
  begin
    return (l + to_fixedu (r, l'high, l'low));
  end function "+";

  function "+" (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return (to_fixedu (l, r'high, r'low) + r);
  end function "+";

  function "+" (
    l : fixeds;                         -- fixed point input
    r : REAL)
    return fixeds is
  begin
    return (l + to_fixeds (r, l'high, l'low));
  end function "+";

  function "+" (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return fixeds is
  begin
    return (to_fixeds (l, r'high, r'low) + r);
  end function "+";

  function "-" (
    l : fixedu;                         -- fixed point input
    r : REAL)
    return fixedu is
  begin
    return (l - to_fixedu (r, l'high, l'low));
  end function "-";

  function "-" (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return (to_fixedu (l, r'high, r'low) - r);
  end function "-";

  function "-" (
    l : fixeds;                         -- fixed point input
    r : REAL)
    return fixeds is
  begin
    return (l - to_fixeds (r, l'high, l'low));
  end function "-";

  function "-" (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return fixeds is
  begin
    return (to_fixeds (l, r'high, r'low) - r);
  end function "-";

  function "*" (
    l : fixedu;                         -- fixed point input
    r : REAL)
    return fixedu is
  begin
    return (l * to_fixedu (r, l'high, l'low));
  end function "*";

  function "*" (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return (to_fixedu (l, r'high, r'low) * r);
  end function "*";

  function "*" (
    l : fixeds;                         -- fixed point input
    r : REAL)
    return fixeds is
  begin
    return (l * to_fixeds (r, l'high, l'low));
  end function "*";

  function "*" (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return fixeds is
  begin
    return (to_fixeds (l, r'high, r'low) * r);
  end function "*";

  function "/" (
    l : fixedu;                         -- fixed point input
    r : REAL)
    return fixedu is
  begin
    return (l / to_fixedu (r, l'high, l'low));
  end function "/";

  function "/" (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return (to_fixedu (l, r'high, r'low) / r);
  end function "/";

  function "/" (
    l : fixeds;                         -- fixed point input
    r : REAL)
    return fixeds is
  begin
    return (l / to_fixeds (r, l'high, l'low));
  end function "/";

  function "/" (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return fixeds is
  begin
    return (to_fixeds (l, r'high, r'low) / r);
  end function "/";

  function "rem" (
    l : fixedu;                         -- fixed point input
    r : REAL)
    return fixedu is
  begin
    return (l rem to_fixedu (r, l'high, l'low));
  end function "rem";

  function "rem" (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return (to_fixedu (l, r'high, r'low) rem r);
  end function "rem";

  function "rem" (
    l : fixeds;                         -- fixed point input
    r : REAL)
    return fixeds is
  begin
    return (l rem to_fixeds (r, l'high, l'low));
  end function "rem";

  function "rem" (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return fixeds is
  begin
    return (to_fixeds (l, r'high, r'low) rem r);
  end function "rem";

  function "mod" (
    l : fixedu;                         -- fixed point input
    r : REAL)
    return fixedu is
  begin
    return (l mod to_fixedu (r, l'high, l'low));
  end function "mod";

  function "mod" (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return (to_fixedu (l, r'high, r'low) mod r);
  end function "mod";

  function "mod" (
    l : fixeds;                         -- fixed point input
    r : REAL)
    return fixeds is
  begin
    return (l mod to_fixeds (r, l'high, l'low));
  end function "mod";

  function "mod" (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return fixeds is
  begin
    return (to_fixeds (l, r'high, r'low) mod r);
  end function "mod";

  -- Overloaded math functions for integers
  function "+" (
    l : fixedu;                         -- fixed point input
    r : NATURAL)
    return fixedu is
  begin
    return (l + to_fixedu (r, l'high, 0));
  end function "+";

  function "+" (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return (to_fixedu (l, r'high, 0) + r);
  end function "+";

  function "+" (
    l : fixeds;                         -- fixed point input
    r : INTEGER)
    return fixeds is
  begin
    return (l + to_fixeds (r, l'high, 0));
  end function "+";

  function "+" (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return fixeds is
  begin
    return (to_fixeds (l, r'high, 0) + r);
  end function "+";

  -- Overloaded functions
  function "-" (
    l : fixedu;                         -- fixed point input
    r : NATURAL)
    return fixedu is
  begin
    return (l - to_fixedu (r, l'high, 0));
  end function "-";

  function "-" (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return (to_fixedu (l, r'high, 0) - r);
  end function "-";

  function "-" (
    l : fixeds;                         -- fixed point input
    r : INTEGER)
    return fixeds is
  begin
    return (l - to_fixeds (r, l'high, 0));
  end function "-";

  function "-" (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return fixeds is
  begin
    return (to_fixeds (l, r'high, 0) - r);
  end function "-";

  -- Overloaded functions
  function "*" (
    l : fixedu;                         -- fixed point input
    r : NATURAL)
    return fixedu is
  begin
    return (l * to_fixedu (r, l'high, 0));
  end function "*";

  function "*" (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return (to_fixedu (l, r'high, 0) * r);
  end function "*";

  function "*" (
    l : fixeds;                         -- fixed point input
    r : INTEGER)
    return fixeds is
  begin
    return (l * to_fixeds (r, l'high, 0));
  end function "*";

  function "*" (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return fixeds is
  begin
    return (to_fixeds (l, r'high, 0) * r);
  end function "*";

  -- Overloaded functions
  function "/" (
    l : fixedu;                         -- fixed point input
    r : NATURAL)
    return fixedu is
  begin
    return (l / to_fixedu (r, l'high, 0));
  end function "/";

  function "/" (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return (to_fixedu (l, r'high, 0) / r);
  end function "/";

  function "/" (
    l : fixeds;                         -- fixed point input
    r : INTEGER)
    return fixeds is
  begin
    return (l / to_fixeds (r, l'high, 0));
  end function "/";

  function "/" (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return fixeds is
  begin
    return (to_fixeds (l, r'high, 0) / r);
  end function "/";

  function "rem" (
    l : fixedu;                         -- fixed point input
    r : NATURAL)
    return fixedu is
  begin
    return (l rem to_fixedu (r, l'high, 0));
  end function "rem";

  function "rem" (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return (to_fixedu (l, r'high, 0) rem r);
  end function "rem";

  function "rem" (
    l : fixeds;                         -- fixed point input
    r : INTEGER)
    return fixeds is
  begin
    return (l rem to_fixeds (r, l'high, 0));
  end function "rem";

  function "rem" (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return fixeds is
  begin
    return (to_fixeds (l, r'high, 0) rem r);
  end function "rem";

  function "mod" (
    l : fixedu;                         -- fixed point input
    r : NATURAL)
    return fixedu is
  begin
    return (l mod to_fixedu (r, l'high, 0));
  end function "mod";

  function "mod" (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return (to_fixedu (l, r'high, 0) mod r);
  end function "mod";

  function "mod" (
    l : fixeds;                         -- fixed point input
    r : INTEGER)
    return fixeds is
  begin
    return (l mod to_fixeds (r, l'high, 0));
  end function "mod";

  function "mod" (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return fixeds is
  begin
    return (to_fixeds (l, r'high, 0) mod r);
  end function "mod";

  -- overloaded fixedu compare functions with integer
  function "=" (
    l : fixedu;
    r : NATURAL)                        -- fixed point input
    return BOOLEAN is
  begin
    return (l = to_fixedu (r, l'high, l'low));
  end function "=";

  function "/=" (
    l : fixedu;
    r : NATURAL)                        -- fixed point input
    return BOOLEAN is
  begin
    return (l /= to_fixedu (r, l'high, l'low));
  end function "/=";

  function ">=" (
    l : fixedu;
    r : NATURAL)                        -- fixed point input
    return BOOLEAN is
  begin
    return (l >= to_fixedu (r, l'high, l'low));
  end function ">=";

  function "<=" (
    l : fixedu;
    r : NATURAL)                        -- fixed point input
    return BOOLEAN is
  begin
    return (l <= to_fixedu (r, l'high, l'low));
  end function "<=";

  function ">" (
    l : fixedu;
    r : NATURAL)                        -- fixed point input
    return BOOLEAN is
  begin
    return (l > to_fixedu (r, l'high, l'low));
  end function ">";

  function "<" (
    l : fixedu;
    r : NATURAL)                        -- fixed point input
    return BOOLEAN is
  begin
    return (l < to_fixedu (r, l'high, l'low));
  end function "<";

  function \?=\ (
    l : fixedu;
    r : NATURAL)                        -- fixed point input
    return STD_ULOGIC is
  begin
    return \?=\ (l, to_fixedu (r, l'high, l'low));
  end function \?=\;

  function \?/=\ (
    l : fixedu;
    r : NATURAL)                        -- fixed point input
    return STD_ULOGIC is
  begin
    return \?/=\ (l, to_fixedu (r, l'high, l'low));
  end function \?/=\;

  function \?>=\ (
    l : fixedu;
    r : NATURAL)                        -- fixed point input
    return STD_ULOGIC is
  begin
    return \?>=\ (l, to_fixedu (r, l'high, l'low));
  end function \?>=\;

  function \?<=\ (
    l : fixedu;
    r : NATURAL)                        -- fixed point input
                 return STD_ULOGIC is
  begin
    return \?<=\ (l, to_fixedu (r, l'high, l'low));
  end function \?<=\;

  function \?>\ (
    l : fixedu;
    r : NATURAL)                        -- fixed point input
    return STD_ULOGIC is
  begin
    return \?>\ (l, to_fixedu (r, l'high, l'low));
  end function \?>\;

  function \?<\ (
    l : fixedu;
    r : NATURAL)                        -- fixed point input
    return STD_ULOGIC is
  begin
    return \?<\ (l, to_fixedu (r, l'high, l'low));
  end function \?<\;

  function maximum (
    l : fixedu;                         -- fixed point input
    r : NATURAL)
    return fixedu is
  begin
    return maximum (l, to_fixedu (r, l'high, l'low));
  end function maximum;

  function minimum (
    l : fixedu;                         -- fixed point input
    r : NATURAL)
    return fixedu is
  begin
    return minimum (l, to_fixedu (r, l'high, l'low));
  end function minimum;

  -- NATURAL to fixedu
  function "=" (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixedu (l, r'high, r'low) = r);
  end function "=";

  function "/=" (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixedu (l, r'high, r'low) /= r);
  end function "/=";

  function ">=" (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixedu (l, r'high, r'low) >= r);
  end function ">=";

  function "<=" (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixedu (l, r'high, r'low) <= r);
  end function "<=";

  function ">" (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixedu (l, r'high, r'low) > r);
  end function ">";

  function "<" (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixedu (l, r'high, r'low) < r);
  end function "<";

  function \?=\ (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?=\ (to_fixedu (l, r'high, r'low), r);
  end function \?=\;

  function \?/=\ (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?/=\ (to_fixedu (l, r'high, r'low), r);
  end function \?/=\;

  function \?>=\ (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?>=\ (to_fixedu (l, r'high, r'low), r);
  end function \?>=\;

  function \?<=\ (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
                 return STD_ULOGIC is
  begin
    return \?<=\ (to_fixedu (l, r'high, r'low), r);
  end function \?<=\;

  function \?>\ (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?>\ (to_fixedu (l, r'high, r'low), r);
  end function \?>\;

  function \?<\ (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?<\ (to_fixedu (l, r'high, r'low), r);
  end function \?<\;

  function maximum (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return maximum (to_fixedu (l, r'high, r'low), r);
  end function maximum;

  function minimum (
    l : NATURAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return minimum (to_fixedu (l, r'high, r'low), r);
  end function minimum;

  -- overloaded fixedu compare functions with real
  function "=" (
    l : fixedu;
    r : REAL)
    return BOOLEAN is
  begin
    return (l = to_fixedu (r, l'high, l'low));
  end function "=";

  function "/=" (
    l : fixedu;
    r : REAL)
    return BOOLEAN is
  begin
    return (l /= to_fixedu (r, l'high, l'low));
  end function "/=";

  function ">=" (
    l : fixedu;
    r : REAL)
    return BOOLEAN is
  begin
    return (l >= to_fixedu (r, l'high, l'low));
  end function ">=";

  function "<=" (
    l : fixedu;
    r : REAL)
    return BOOLEAN is
  begin
    return (l <= to_fixedu (r, l'high, l'low));
  end function "<=";

  function ">" (
    l : fixedu;
    r : REAL)
    return BOOLEAN is
  begin
    return (l > to_fixedu (r, l'high, l'low));
  end function ">";

  function "<" (
    l : fixedu;
    r : REAL)
    return BOOLEAN is
  begin
    return (l < to_fixedu (r, l'high, l'low));
  end function "<";

  function \?=\ (
    l : fixedu;
    r : REAL)
    return STD_ULOGIC is
  begin
    return \?=\ (l, to_fixedu (r, l'high, l'low));
  end function \?=\;

  function \?/=\ (
    l : fixedu;
    r : REAL)
    return STD_ULOGIC is
  begin
    return \?/=\ (l, to_fixedu (r, l'high, l'low));
  end function \?/=\;

  function \?>=\ (
    l : fixedu;
    r : REAL)
    return STD_ULOGIC is
  begin
    return \?>=\ (l, to_fixedu (r, l'high, l'low));
  end function \?>=\;

  function \?<=\ (
    l : fixedu;
    r : REAL)
    return STD_ULOGIC is
  begin
    return \?<=\ (l, to_fixedu (r, l'high, l'low));
  end function \?<=\;

  function \?>\ (
    l : fixedu;
    r : REAL)
    return STD_ULOGIC is
  begin
    return \?>\ (l, to_fixedu (r, l'high, l'low));
  end function \?>\;

  function \?<\ (
    l : fixedu;
    r : REAL)
    return STD_ULOGIC is
  begin
    return \?<\ (l, to_fixedu (r, l'high, l'low));
  end function \?<\;

  function maximum (
    l : fixedu;
    r : REAL)
    return fixedu is
  begin
    return maximum (l, to_fixedu (r, l'high, l'low));
  end function maximum;

  function minimum (
    l : fixedu;
    r : REAL)
    return fixedu is
  begin
    return minimum (l, to_fixedu (r, l'high, l'low));
  end function minimum;

  -- real and fixedu
  function "=" (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixedu (l, r'high, r'low) = r);
  end function "=";

  function "/=" (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixedu (l, r'high, r'low) /= r);
  end function "/=";

  function ">=" (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixedu (l, r'high, r'low) >= r);
  end function ">=";

  function "<=" (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixedu (l, r'high, r'low) <= r);
  end function "<=";

  function ">" (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixedu (l, r'high, r'low) > r);
  end function ">";

  function "<" (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixedu (l, r'high, r'low) < r);
  end function "<";

  function \?=\ (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?=\ (to_fixedu (l, r'high, r'low), r);
  end function \?=\;

  function \?/=\ (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?/=\ (to_fixedu (l, r'high, r'low), r);
  end function \?/=\;

  function \?>=\ (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?>=\ (to_fixedu (l, r'high, r'low), r);
  end function \?>=\;

  function \?<=\ (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?<=\ (to_fixedu (l, r'high, r'low), r);
  end function \?<=\;

  function \?>\ (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?>\ (to_fixedu (l, r'high, r'low), r);
  end function \?>\;

  function \?<\ (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?<\ (to_fixedu (l, r'high, r'low), r);
  end function \?<\;
  
  function maximum (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return maximum (to_fixedu (l, r'high, r'low), r);
  end function maximum;

  function minimum (
    l : REAL;
    r : fixedu)                         -- fixed point input
    return fixedu is
  begin
    return minimum (to_fixedu (l, r'high, r'low), r);
  end function minimum;

  -- overloaded fixeds compare functions with integer
  function "=" (
    l : fixeds;
    r : INTEGER)
    return BOOLEAN is
  begin
    return (l = to_fixeds (r, l'high, l'low));
  end function "=";

  function "/=" (
    l : fixeds;
    r : INTEGER)
    return BOOLEAN is
  begin
    return (l /= to_fixeds (r, l'high, l'low));
  end function "/=";

  function ">=" (
    l : fixeds;
    r : INTEGER)
    return BOOLEAN is
  begin
    return (l >= to_fixeds (r, l'high, l'low));
  end function ">=";

  function "<=" (
    l : fixeds;
    r : INTEGER)
    return BOOLEAN is
  begin
    return (l <= to_fixeds (r, l'high, l'low));
  end function "<=";

  function ">" (
    l : fixeds;
    r : INTEGER)
    return BOOLEAN is
  begin
    return (l > to_fixeds (r, l'high, l'low));
  end function ">";

  function "<" (
    l : fixeds;
    r : INTEGER)
    return BOOLEAN is
  begin
    return (l < to_fixeds (r, l'high, l'low));
  end function "<";

  function \?=\ (
    l : fixeds;
    r : INTEGER)
    return STD_ULOGIC is
  begin
    return \?=\ (l, to_fixeds (r, l'high, l'low));
  end function \?=\;

  function \?/=\ (
    l : fixeds;
    r : INTEGER)
    return STD_ULOGIC is
  begin
    return \?/=\ (l, to_fixeds (r, l'high, l'low));
  end function \?/=\;

  function \?>=\ (
    l : fixeds;
    r : INTEGER)
    return STD_ULOGIC is
  begin
    return \?>=\ (l, to_fixeds (r, l'high, l'low));
  end function \?>=\;

  function \?<=\ (
    l : fixeds;
    r : INTEGER)
    return STD_ULOGIC is
  begin
    return \?<=\ (l, to_fixeds (r, l'high, l'low));
  end function \?<=\;

  function \?>\ (
    l : fixeds;
    r : INTEGER)
    return STD_ULOGIC is
  begin
    return \?>\ (l, to_fixeds (r, l'high, l'low));
  end function \?>\;

  function \?<\ (
    l : fixeds;
    r : INTEGER)
    return STD_ULOGIC is
  begin
    return \?<\ (l, to_fixeds (r, l'high, l'low));
  end function \?<\;

  function maximum (
    l : fixeds;
    r : INTEGER)
    return fixeds is
  begin
    return maximum (l, to_fixeds (r, l'high, l'low));
  end function maximum;

  function minimum (
    l : fixeds;
    r : INTEGER)
    return fixeds is
  begin
    return minimum (l, to_fixeds (r, l'high, l'low));
  end function minimum;

  -- integer and fixeds
  function "=" (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixeds (l, r'high, r'low) = r);
  end function "=";

  function "/=" (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixeds (l, r'high, r'low) /= r);
  end function "/=";

  function ">=" (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixeds (l, r'high, r'low) >= r);
  end function ">=";

  function "<=" (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixeds (l, r'high, r'low) <= r);
  end function "<=";

  function ">" (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixeds (l, r'high, r'low) > r);
  end function ">";

  function "<" (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixeds (l, r'high, r'low) < r);
  end function "<";

  function \?=\ (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?=\ (to_fixeds (l, r'high, r'low), r);
  end function \?=\;

  function \?/=\ (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?/=\ (to_fixeds (l, r'high, r'low), r);
  end function \?/=\;

  function \?>=\ (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?>=\ (to_fixeds (l, r'high, r'low), r);
  end function \?>=\;

  function \?<=\ (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?<=\ (to_fixeds (l, r'high, r'low), r);
  end function \?<=\;

  function \?>\ (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?>\ (to_fixeds (l, r'high, r'low), r);
  end function \?>\;

  function \?<\ (
    l : INTEGER;
    r : fixeds)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?<\ (to_fixeds (l, r'high, r'low), r);
  end function \?<\;

  function maximum (
    l : INTEGER;
    r : fixeds)
    return fixeds is
  begin
    return maximum (to_fixeds (l, r'high, r'low), r);
  end function maximum;

  function minimum (
    l : INTEGER;
    r : fixeds)
    return fixeds is
  begin
    return minimum (to_fixeds (l, r'high, r'low), r);
  end function minimum;

  -- overloaded fixeds compare functions with real
  function "=" (
    l : fixeds;
    r : REAL)
    return BOOLEAN is
  begin
    return (l = to_fixeds (r, l'high, l'low));
  end function "=";

  function "/=" (
    l : fixeds;
    r : REAL)
    return BOOLEAN is
  begin
    return (l /= to_fixeds (r, l'high, l'low));
  end function "/=";

  function ">=" (
    l : fixeds;
    r : REAL)
    return BOOLEAN is
  begin
    return (l >= to_fixeds (r, l'high, l'low));
  end function ">=";

  function "<=" (
    l : fixeds;
    r : REAL)
    return BOOLEAN is
  begin
    return (l <= to_fixeds (r, l'high, l'low));
  end function "<=";

  function ">" (
    l : fixeds;
    r : REAL)
    return BOOLEAN is
  begin
    return (l > to_fixeds (r, l'high, l'low));
  end function ">";

  function "<" (
    l : fixeds;
    r : REAL)
    return BOOLEAN is
  begin
    return (l < to_fixeds (r, l'high, l'low));
  end function "<";

  function \?=\ (
    l : fixeds;
    r : REAL)
    return STD_ULOGIC is
  begin
    return \?=\ (l, to_fixeds (r, l'high, l'low));
  end function \?=\;

  function \?/=\ (
    l : fixeds;
    r : REAL)
    return STD_ULOGIC is
  begin
    return \?/=\ (l, to_fixeds (r, l'high, l'low));
  end function \?/=\;

  function \?>=\ (
    l : fixeds;
    r : REAL)
    return STD_ULOGIC is
  begin
    return \?>=\ (l, to_fixeds (r, l'high, l'low));
  end function \?>=\;

  function \?<=\ (
    l : fixeds;
    r : REAL)
    return STD_ULOGIC is
  begin
    return \?<=\ (l, to_fixeds (r, l'high, l'low));
  end function \?<=\;

  function \?>\ (
    l : fixeds;
    r : REAL)
    return STD_ULOGIC is
  begin
    return \?>\ (l, to_fixeds (r, l'high, l'low));
  end function \?>\;

  function \?<\ (
    l : fixeds;
    r : REAL)
    return STD_ULOGIC is
  begin
    return \?<\ (l, to_fixeds (r, l'high, l'low));
  end function \?<\;

  function maximum (
    l : fixeds;
    r : REAL)
    return fixeds is
  begin
    return maximum (l, to_fixeds (r, l'high, l'low));
  end function maximum;

  function minimum (
    l : fixeds;
    r : REAL)
    return fixeds is
  begin
    return minimum (l, to_fixeds (r, l'high, l'low));
  end function minimum;

  -- REAL and fixeds
  function "=" (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixeds (l, r'high, r'low) = r);
  end function "=";

  function "/=" (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixeds (l, r'high, r'low) /= r);
  end function "/=";

  function ">=" (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixeds (l, r'high, r'low) >= r);
  end function ">=";

  function "<=" (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixeds (l, r'high, r'low) <= r);
  end function "<=";

  function ">" (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixeds (l, r'high, r'low) > r);
  end function ">";

  function "<" (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return BOOLEAN is
  begin
    return (to_fixeds (l, r'high, r'low) < r);
  end function "<";

  function \?=\ (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?=\ (to_fixeds (l, r'high, r'low), r);
  end function \?=\;

  function \?/=\ (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?/=\ (to_fixeds (l, r'high, r'low), r);
  end function \?/=\;

  function \?>=\ (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?>=\ (to_fixeds (l, r'high, r'low), r);
  end function \?>=\;

  function \?<=\ (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?<=\ (to_fixeds (l, r'high, r'low), r);
  end function \?<=\;

  function \?>\ (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?>\ (to_fixeds (l, r'high, r'low), r);
  end function \?>\;

  function \?<\ (
    l : REAL;
    r : fixeds)                         -- fixed point input
    return STD_ULOGIC is
  begin
    return \?<\ (to_fixeds (l, r'high, r'low), r);
  end function \?<\;

  function maximum (
    l : REAL;
    r : fixeds)
    return fixeds is
  begin
    return maximum (to_fixeds (l, r'high, r'low), r);
  end function maximum;

  function minimum (
    l : REAL;
    r : fixeds)
    return fixeds is
  begin
    return minimum (to_fixeds (l, r'high, r'low), r);
  end function minimum;

  -- This version of divide gives the user more control
  function divide (
    l, r                 : fixedu;
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixedu is
    variable result : ufixed (l'high downto l'low);
  begin
    result := resize (divide (l           => ufixed(l),
                              r           => ufixed(r),
                              round_style => round_style,
                              guard_bits  => guard_bits),
                      left_index  => result'high,
                      right_index => result'low,
                      round_style => round_style,
                      overflow_style => overflow_style);
    return fixedu(result);
  end function divide;

  -- This version of divide gives the user more control
  function divide (
    l, r                 : fixeds;
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixeds is
    variable result : sfixed (l'high downto l'low);
  begin
    result := resize (arg         => divide (l => sfixed(l),
                                     r           => sfixed(r),
                                     round_style => round_style,
                                     guard_bits  => guard_bits),
                      left_index  => result'high,
                      right_index => result'low,
                      round_style => round_style,
                      overflow_style => overflow_style);
    return fixeds(result);
  end function divide;

  -- These functions return 1/X
  function reciprocal (
    arg                  : fixedu;      -- fixed point input
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixedu is
    variable result : ufixed (arg'high downto arg'low);
  begin
    result := resize (arg          => reciprocal(arg => ufixed(arg),
                                         round_style => round_style,
                                         guard_bits  => guard_bits),
                       left_index  => arg'high,
                       right_index => arg'low,
                       round_style => round_style,
                      overflow_style => overflow_style);
    return fixedu(result);
  end function reciprocal;

  function reciprocal (
    arg                  : fixeds;      -- fixed point input
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixeds is
    variable result : sfixed (arg'high downto arg'low);
  begin
    result := resize (arg          => reciprocal(arg => sfixed(arg),
                                         round_style => round_style,
                                         guard_bits  => guard_bits),
                       left_index  => arg'high,
                       right_index => arg'low,
                       round_style => round_style,
                      overflow_style => overflow_style);
    return fixeds(result);
  end function reciprocal;

  -- REM function
  function remainder (
    l, r                 : fixedu;
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixedu is
    variable result : ufixed (r'high downto r'low);
  begin
    result := resize (arg => remainder (l           => ufixed(l),
                                 r           => ufixed(r),
                                 round_style => round_style,
                                 guard_bits  => guard_bits),
                      left_index  => result'high,
                      right_index => result'low,
                      round_style => round_style,
                      overflow_style => overflow_style);
    return fixedu(result);
  end function remainder;

  function remainder (
    l, r                 : fixeds;
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixeds is
    variable result : sfixed (l'high downto l'low);
  begin
    result := resize (arg => remainder (l => sfixed(l),
                                        r           => sfixed(r),
                                        round_style => round_style,
                                        guard_bits  => guard_bits),
                      left_index  => result'high,
                      right_index => result'low,
                      round_style => round_style,
                      overflow_style => overflow_style);
    return fixeds(result);
  end function remainder;

  -- mod function
  function modulo (
    l, r                 : fixedu;
    constant round_style : fixed_round_style_type := fixed_round_style;
    constant guard_bits  : NATURAL                := fixed_guard_bits;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style)
    return fixedu is
    variable result : ufixed (r'high downto r'low);
  begin
    result := resize (arg => modulo (l           => ufixed(l),
                              r           => ufixed(r),
                              round_style => round_style,
                              guard_bits  => guard_bits),
                      left_index  => result'high,
                      right_index => result'low,
                      round_style => round_style,
                      overflow_style => overflow_style);
    return fixedu(result);
  end function modulo;

  function modulo (
    l, r                    : fixeds;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style;
    constant guard_bits     : NATURAL                   := fixed_guard_bits)
    return fixeds is
    variable result : sfixed (l'high downto l'low);
  begin
    result := resize (arg         => modulo (l => sfixed(l),
                                     r           => sfixed(r),
                                     round_style => round_style,
                                     guard_bits  => guard_bits),
                      left_index  => result'high,
                      right_index => result'low,
                      round_style => round_style,
                      overflow_style => overflow_style);
    return fixeds(result);
  end function modulo;

  -- Procedure for those who need an "accumulator" function.
  -- add_carry (fixedu(a downto b), fixedu (c downto d))
  --         = fixedu (maximum(a,c) downto minimum(b,d))
  procedure add_carry (
    L, R   : in  fixedu;
    c_in   : in  STD_ULOGIC;
    result : out fixedu;
    c_out  : out STD_ULOGIC) is
    variable resultx : ufixed (maximum (L'high, R'high) downto
                               minimum (L'low, R'low));
  begin
    add_carry (L      => ufixed (L),
               R      => ufixed (R),
               c_in   => c_in,
               result => resultx,
               c_out  => c_out);
    result := fixedu(resultx);
  end procedure add_carry;

  -- add_carry (fixeds(a downto b), fixeds (c downto d))
  --         = fixeds (maximum(a,c) downto minimum(b,d))
  procedure add_carry (
    L, R   : in  fixeds;
    c_in   : in  STD_ULOGIC;
    result : out fixeds;
    c_out  : out STD_ULOGIC) is
    variable resultx : sfixed (maximum (L'high, R'high) downto
                               minimum (L'low, R'low));
  begin
    add_carry (L      => sfixed (L),
               R      => sfixed (R),
               c_in   => c_in,
               result => resultx,
               c_out  => c_out);
    result := fixeds (resultx);
  end procedure add_carry;

  -- Scales the result by a power of 2.  Width of input = width of output with
  -- the binary point moved.
  function scalb (y : fixedu; N : INTEGER) return fixedu is
  begin
    return fixedu (scalb (ufixed(y), N));
  end function scalb;
  function scalb (y : fixedu; N : SIGNED) return fixedu is
  begin
    return fixedu (scalb (ufixed(y), N));
  end function scalb;
  function scalb (y : fixeds; N : INTEGER) return fixeds is
  begin
    return fixeds (scalb (sfixed(y), N));
  end function scalb;
  function scalb (y : fixeds; N : SIGNED) return fixeds is
  begin
    return fixeds (scalb (sfixed(y), N));
  end function scalb;

  function Is_Negative (arg : fixeds) return BOOLEAN is
  begin
    return to_x01 (arg (arg'high)) = '1';
  end function Is_Negative;

  -- ===========================================================================
  -- Shift and Rotate Functions.
  -- Note that sra and sla are not the same as the BIT_VECTOR version
  -- ===========================================================================

  function "sll" (ARG : fixedu; COUNT : INTEGER)
    return fixedu is
  begin
    return fixedu (ufixed(ARG) sll COUNT);
  end function "sll";
  function "srl" (ARG : fixedu; COUNT : INTEGER)
    return fixedu is
  begin
    return fixedu (ufixed(ARG) srl COUNT);
  end function "srl";
  function "rol" (ARG : fixedu; COUNT : INTEGER)
    return fixedu is
  begin
    return fixedu (ufixed(ARG) rol COUNT);
  end function "rol";
  function "ror" (ARG : fixedu; COUNT : INTEGER)
    return fixedu is
  begin
    return fixedu (ufixed(ARG) ror COUNT);
  end function "ror";
  function "sla" (ARG : fixedu; COUNT : INTEGER)
    return fixedu is
  begin
    return fixedu (ufixed(ARG) sla COUNT);
  end function "sla";
  function "sra" (ARG : fixedu; COUNT : INTEGER)
    return fixedu is
  begin
    return fixedu (ufixed(ARG) sra COUNT);
  end function "sra";
  function "sll" (ARG : fixeds; COUNT : INTEGER)
    return fixeds is
  begin
    return fixeds (sfixed(ARG) sll COUNT);
  end function "sll";
  function "srl" (ARG : fixeds; COUNT : INTEGER)
    return fixeds is
  begin
    return fixeds (sfixed(ARG) srl COUNT);
  end function "srl";
  function "rol" (ARG : fixeds; COUNT : INTEGER)
    return fixeds is
  begin
    return fixeds (sfixed(ARG) rol COUNT);
  end function "rol";
  function "ror" (ARG : fixeds; COUNT : INTEGER)
    return fixeds is
  begin
    return fixeds (sfixed(ARG) ror COUNT);
  end function "ror";
  function "sla" (ARG : fixeds; COUNT : INTEGER)
    return fixeds is
  begin
    return fixeds (sfixed(ARG) sla COUNT);
  end function "sla";
  function "sra" (ARG : fixeds; COUNT : INTEGER)
    return fixeds is
  begin
    return fixeds (sfixed(ARG) sra COUNT);
  end function "sra";
  function SHIFT_LEFT (ARG : fixedu; COUNT : NATURAL)
    return fixedu is
  begin
    return fixedu (SHIFT_LEFT (ufixed(ARG), COUNT));
  end function SHIFT_LEFT;
  function SHIFT_RIGHT (ARG : fixedu; COUNT : NATURAL)
    return fixedu is
  begin
    return fixedu (SHIFT_RIGHT (ufixed(ARG), COUNT));
  end function SHIFT_RIGHT;
  function SHIFT_LEFT (ARG : fixeds; COUNT : NATURAL)
    return fixeds is
  begin
    return fixeds (SHIFT_LEFT (sfixed(ARG), COUNT));
  end function SHIFT_LEFT;
  function SHIFT_RIGHT (ARG : fixeds; COUNT : NATURAL)
    return fixeds is
  begin
    return fixeds (SHIFT_RIGHT (sfixed(ARG), COUNT));
  end function SHIFT_RIGHT;

  ----------------------------------------------------------------------------
  -- logical functions
  ----------------------------------------------------------------------------

  function "not" (l : fixedu) return fixedu is
  begin
    return fixedu (not ufixed(l));
  end function "not";
  function "and" (l, r : fixedu) return fixedu is
  begin
    return fixedu (ufixed(l) and ufixed(r));
  end function "and";
  function "or" (l, r : fixedu) return fixedu is
  begin
    return fixedu (ufixed(l) or ufixed(r));
  end function "or";
  function "nand" (l, r : fixedu) return fixedu is
  begin
    return fixedu (ufixed(l) nand ufixed(r));
  end function "nand";
  function "nor" (l, r : fixedu) return fixedu is
  begin
    return fixedu (ufixed(l) nor ufixed(r));
  end function "nor";
  function "xor" (l, r : fixedu) return fixedu is
  begin
    return fixedu (ufixed(l) xor ufixed(r));
  end function "xor";
  function "xnor" (l, r : fixedu) return fixedu is
  begin
    return fixedu (ufixed(l) xnor ufixed(r));
  end function "xnor";
  function "not" (l : fixeds) return fixeds is
  begin
    return fixeds (not sfixed(l));
  end function "not";
  function "and" (l, r : fixeds) return fixeds is
  begin
    return fixeds (sfixed(l) and sfixed(r));
  end function "and";
  function "or" (l, r : fixeds) return fixeds is
  begin
    return fixeds (sfixed(l) or sfixed(r));
  end function "or";
  function "nand" (l, r : fixeds) return fixeds is
  begin
    return fixeds (sfixed(l) nand sfixed(r));
  end function "nand";
  function "nor" (l, r : fixeds) return fixeds is
  begin
    return fixeds (sfixed(l) nor sfixed(r));
  end function "nor";
  function "xor" (l, r : fixeds) return fixeds is
  begin
    return fixeds (sfixed(l) xor sfixed(r));
  end function "xor";
  function "xnor" (l, r : fixeds) return fixeds is
  begin
    return fixeds (sfixed(l) xnor sfixed(r));
  end function "xnor";

  -- Vector and std_ulogic functions, same as functions in numeric_std
  function "and" (l : STD_ULOGIC; r : fixedu)
    return fixedu is
  begin
    return fixedu (l and ufixed(r));
  end function "and";
  function "and" (l : fixedu; r : STD_ULOGIC)
    return fixedu is
  begin
    return fixedu (ufixed(l) and r);
  end function "and";
  function "or" (l : STD_ULOGIC; r : fixedu)
    return fixedu is
  begin
    return fixedu (l or ufixed(r));
  end function "or";
  function "or" (l : fixedu; r : STD_ULOGIC)
    return fixedu is
  begin
    return fixedu (ufixed(l) or r);
  end function "or";
  function "nand" (l : STD_ULOGIC; r : fixedu)
    return fixedu is
  begin
    return fixedu (l nand ufixed(r));
  end function "nand";
  function "nand" (l : fixedu; r : STD_ULOGIC)
    return fixedu is
  begin
    return fixedu (ufixed(l) nand r);
  end function "nand";
  function "nor" (l : STD_ULOGIC; r : fixedu)
    return fixedu is
  begin
    return fixedu (l nor ufixed(r));
  end function "nor";
  function "nor" (l : fixedu; r : STD_ULOGIC)
    return fixedu is
  begin
    return fixedu (ufixed(l) nor r);
  end function "nor";
  function "xor" (l : STD_ULOGIC; r : fixedu)
    return fixedu is
  begin
    return fixedu (l xor ufixed(r));
  end function "xor";
  function "xor" (l : fixedu; r : STD_ULOGIC)
    return fixedu is
  begin
    return fixedu (ufixed(l) xor r);
  end function "xor";
  function "xnor" (l : STD_ULOGIC; r : fixedu)
    return fixedu is
  begin
    return fixedu (l xnor ufixed(r));
  end function "xnor";
  function "xnor" (l : fixedu; r : STD_ULOGIC)
    return fixedu is
  begin
    return fixedu (ufixed(l) xnor r);
  end function "xnor";
  function "and" (l : STD_ULOGIC; r : fixeds)
    return fixeds is
  begin
    return fixeds (l and sfixed(r));
  end function "and";
  function "and" (l : fixeds; r : STD_ULOGIC)
    return fixeds is
  begin
    return fixeds (sfixed(l) and r);
  end function "and";
  function "or" (l : STD_ULOGIC; r : fixeds)
    return fixeds is
  begin
    return fixeds (l or sfixed(r));
  end function "or";
  function "or" (l : fixeds; r : STD_ULOGIC)
    return fixeds is
  begin
    return fixeds (sfixed(l) or r);
  end function "or";
  function "nand" (l : STD_ULOGIC; r : fixeds)
    return fixeds is
  begin
    return fixeds (l nand sfixed(r));
  end function "nand";
  function "nand" (l : fixeds; r : STD_ULOGIC)
    return fixeds is
  begin
    return fixeds (sfixed(l) nand r);
  end function "nand";
  function "nor" (l : STD_ULOGIC; r : fixeds)
    return fixeds is
  begin
    return fixeds (l nor sfixed(r));
  end function "nor";
  function "nor" (l : fixeds; r : STD_ULOGIC)
    return fixeds is
  begin
    return fixeds (sfixed(l) nor r);
  end function "nor";
  function "xor" (l : STD_ULOGIC; r : fixeds)
    return fixeds is
  begin
    return fixeds (l xor sfixed(r));
  end function "xor";
  function "xor" (l : fixeds; r : STD_ULOGIC)
    return fixeds is
  begin
    return fixeds (sfixed(l) xor r);
  end function "xor";
  function "xnor" (l : STD_ULOGIC; r : fixeds)
    return fixeds is
  begin
    return fixeds (l xnor sfixed(r));
  end function "xnor";
  function "xnor" (l : fixeds; r : STD_ULOGIC)
    return fixeds is
  begin
    return fixeds (sfixed(l) xnor r);
  end function "xnor";

  -- Reduction operators, same as numeric_std functions
  function and_reduce (l : fixedu) return STD_ULOGIC is
  begin
    return and_reduce (ufixed(l));
  end function and_reduce;
  function nand_reduce (l : fixedu) return STD_ULOGIC is
  begin
    return nand_reduce (ufixed(l));
  end function nand_reduce;
  function or_reduce (l : fixedu) return STD_ULOGIC is
  begin
    return or_reduce (ufixed(l));
  end function or_reduce;
  function nor_reduce (l : fixedu) return STD_ULOGIC is
  begin
    return nor_reduce (ufixed(l));
  end function nor_reduce;
  function xor_reduce (l : fixedu) return STD_ULOGIC is
  begin
    return xor_reduce (ufixed(l));
  end function xor_reduce;
  function xnor_reduce (l : fixedu) return STD_ULOGIC is
  begin
    return xnor_reduce (ufixed(l));
  end function xnor_reduce;
  function and_reduce (l : fixeds) return STD_ULOGIC is
  begin
    return and_reduce (sfixed(l));
  end function and_reduce;
  function nand_reduce (l : fixeds) return STD_ULOGIC is
  begin
    return nand_reduce (sfixed(l));
  end function nand_reduce;
  function or_reduce (l : fixeds) return STD_ULOGIC is
  begin
    return or_reduce (sfixed(l));
  end function or_reduce;
  function nor_reduce (l : fixeds) return STD_ULOGIC is
  begin
    return nor_reduce (sfixed(l));
  end function nor_reduce;
  function xor_reduce (l : fixeds) return STD_ULOGIC is
  begin
    return xor_reduce (sfixed(l));
  end function xor_reduce;
  function xnor_reduce (l : fixeds) return STD_ULOGIC is
  begin
    return xnor_reduce (sfixed(l));
  end function xnor_reduce;

  -- returns arg'low-1 if not found
  function find_leftmost (arg : fixedu; y : STD_ULOGIC)
    return INTEGER is
  begin
    return find_leftmost (ufixed(arg), y);
  end function find_leftmost;
  function find_leftmost (arg : fixeds; y : STD_ULOGIC)
    return INTEGER is
  begin
    return find_leftmost (sfixed(arg), y);
  end function find_leftmost;

  -- returns arg'high+1 if not found
  function find_rightmost (arg : fixedu; y : STD_ULOGIC)
    return INTEGER is
  begin
    return find_rightmost (ufixed(arg), y);
  end function find_rightmost;
  function find_rightmost (arg : fixeds; y : STD_ULOGIC)
    return INTEGER is
  begin
    return find_rightmost (sfixed(arg), y);
  end function find_rightmost;

  -- ===========================================================================
  --   RESIZE Functions
  -- ===========================================================================
  -- resizes the number (larger or smaller)
  -- The returned result will be fixedu (left_index downto right_index)
  -- If "round_style" is fixed_round, then the result will be rounded.
  -- If the MSB of the remainder is a "1" AND the LSB of the unrounded result
  -- is a '1' or the lower bits of the remainder include a '1' then the result
  -- will be increased by the smallest representable number for that type.
  -- "overflow_style" can be fixed_saturate or fixed_wrap.
  -- In saturate mode, if the number overflows then the largest possible
  -- representable number is returned.  If wrap mode, then the upper bits
  -- of the number are truncated.
  
  function resize (
    arg                     : fixedu;   -- input
    constant left_index     : INTEGER;  -- integer portion
    constant right_index    : INTEGER;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixedu is
    variable result : ufixed (left_index downto right_index);
  begin
    result := resize (arg            => ufixed (arg),
                      left_index     => left_index,
                      right_index    => right_index,
                      overflow_style => overflow_style,
                      round_style    => round_style);
    return fixedu(result);
  end function resize;

  -- "size_res" functions create the size of the output from the length
  -- of the "size_res" input.  The actual value of "size_res" is not used.
  function resize (
    arg                     : fixedu;   -- input
    size_res                : fixedu;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixedu is
    variable result : ufixed (size_res'range);
  begin
    result := resize (arg            => ufixed (arg),
                      left_index     => size_res'high,
                      right_index    => size_res'low,
                      overflow_style => overflow_style,
                      round_style    => round_style);
    return fixedu(result);
  end function resize;

  -- Note that in "wrap" mode the sign bit is not replicated.  Thus the
  -- resize of a negative number can have a positive result in wrap mode.
  function resize (
    arg                     : fixeds;   -- input
    constant left_index     : INTEGER;  -- integer portion
    constant right_index    : INTEGER;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixeds is
    variable result : sfixed (left_index downto right_index);
  begin
    result := resize (arg            => sfixed (arg),
                      left_index     => left_index,
                      right_index    => right_index,
                      overflow_style => overflow_style,
                      round_style    => round_style);
    return fixeds(result);
  end function resize;

  function resize (
    arg                     : fixeds;   -- input
    size_res                : fixeds;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixeds is
    variable result : sfixed (size_res'range);
  begin
    result := resize (arg            => sfixed (arg),
                      left_index     => size_res'high,
                      right_index    => size_res'low,
                      overflow_style => overflow_style,
                      round_style    => round_style);
    return fixeds(result);
  end function resize;

  -- ===========================================================================
  -- Conversion Functions
  -- ===========================================================================

  -- integer (natural) to unsigned fixed point.
  -- arguments are the upper and lower bounds of the number, thus
  -- fixedu (7 downto -3) <= to_fixedu (int, 7, -3);
  function to_fixedu (
    arg                     : NATURAL;  -- integer
    constant left_index     : INTEGER;  -- size of integer portion
    constant right_index    : INTEGER                   := 0;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixedu is
    variable result : ufixed (left_index downto right_index);
  begin
    result := to_ufixed (arg            => arg,
                         left_index     => left_index,
                         right_index    => right_index,
                         overflow_style => overflow_style,
                         round_style    => round_style);
    return fixedu (result);
  end function to_fixedu;

  function to_fixedu (
    arg                     : NATURAL;  -- integer
    size_res                : fixedu;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixedu is
    variable result : ufixed (size_res'range);
  begin
    result := to_ufixed (arg            => arg,
                         left_index     => size_res'high,
                         right_index    => size_res'low,
                         overflow_style => overflow_style,
                         round_style    => round_style);
    return fixedu (result);
  end function to_fixedu;

  -- real to unsigned fixed point
  function to_fixedu (
    arg                     : REAL;     -- real
    constant left_index     : INTEGER;  -- size of integer portion
    constant right_index    : INTEGER;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style;
    constant guard_bits     : NATURAL                   := fixed_guard_bits)
    return fixedu is
    variable result : ufixed (left_index downto right_index);
  begin
    result := to_ufixed (arg            => arg,
                         left_index     => left_index,
                         right_index    => right_index,
                         overflow_style => overflow_style,
                         round_style    => round_style,
                         guard_bits     => guard_bits);
    return fixedu (result);
  end function to_fixedu;

  function to_fixedu (
    arg                     : REAL;     -- real
    size_res                : fixedu;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style;
    constant guard_bits     : NATURAL                   := fixed_guard_bits)
    return fixedu is
    variable result : ufixed (size_res'range);
  begin
    result := to_ufixed (arg            => arg,
                         left_index     => size_res'high,
                         right_index    => size_res'low,
                         overflow_style => overflow_style,
                         round_style    => round_style,
                         guard_bits     => guard_bits);
    return fixedu (result);
  end function to_fixedu;

  -- unsigned to unsigned fixed point
  function to_fixedu (
    arg                     : UNSIGNED;                        -- unsigned
    constant left_index     : INTEGER;  -- size of integer portion
    constant right_index    : INTEGER                   := 0;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixedu is
    variable result : ufixed (left_index downto right_index);
  begin
    result := to_ufixed (arg            => arg,
                         left_index     => left_index,
                         right_index    => right_index,
                         overflow_style => overflow_style,
                         round_style    => round_style);
    return fixedu (result);
  end function to_fixedu;

  function to_fixedu (
    arg                     : UNSIGNED;  -- unsigned
    size_res                : fixedu;    -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixedu is
    variable result : ufixed (size_res'range);
  begin
    result := to_ufixed (arg            => arg,
                         left_index     => size_res'high,
                         right_index    => size_res'low,
                         overflow_style => overflow_style,
                         round_style    => round_style);
    return fixedu (result);
  end function to_fixedu;

  -- Performs a conversion.  fixedu (arg'range) is returned
  function to_fixedu (
    arg : UNSIGNED)                     -- unsigned
    return fixedu is
    variable result : ufixed (arg'range);
  begin
    result := to_ufixed (arg);
    return fixedu (result);
  end function to_fixedu;

  -- Conversion from fixeds to fixedu (performs an "abs" function)
  function to_fixedu (
    arg : fixeds)
    return fixedu is
  begin
    return fixedu (abs (arg));
  end function to_fixedu;

  -- unsigned fixed point to unsigned
  function to_unsigned (
    arg                     : fixedu;   -- fixed point input
    constant size           : NATURAL;  -- length of output
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return UNSIGNED is
  begin
    return to_unsigned (arg             => ufixed (arg),
                         size           => size,
                         overflow_style => overflow_style,
                         round_style    => round_style);
  end function to_unsigned;

  -- unsigned fixed point to unsigned
  function to_unsigned (
    arg                     : fixedu;    -- fixed point input
    size_res                : UNSIGNED;  -- used for length of output
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return UNSIGNED is
  begin
    return to_unsigned (arg             => ufixed (arg),
                         size           => size_res'length,
                         overflow_style => overflow_style,
                         round_style    => round_style);
  end function to_unsigned;

  -- unsigned fixed point to real
  function to_real (
    arg : fixedu)                       -- fixed point input
    return REAL is
  begin
    return to_real (ufixed (arg));
  end function to_real;

  -- unsigned fixed point to integer
  function to_integer (
    arg                     : fixedu;   -- fixed point input
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return NATURAL is
  begin
    return to_integer (arg             => ufixed (arg),
                        overflow_style => overflow_style,
                        round_style    => round_style);
  end function to_integer;

  -- Integer to fixeds
  function to_fixeds (
    arg                     : INTEGER;  -- integer
    constant left_index     : INTEGER;  -- size of integer portion
    constant right_index    : INTEGER                   := 0;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixeds is
    variable result : sfixed (left_index downto right_index);
  begin
    result := to_sfixed (arg            => arg,
                         left_index     => left_index,
                         right_index    => right_index,
                         overflow_style => overflow_style,
                         round_style    => round_style);
    return fixeds (result);
  end function to_fixeds;

  function to_fixeds (
    arg                     : INTEGER;  -- integer
    size_res                : fixeds;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixeds is
    variable result : sfixed (size_res'range);
  begin
    result := to_sfixed (arg            => arg,
                         left_index     => size_res'high,
                         right_index    => size_res'low,
                         overflow_style => overflow_style,
                         round_style    => round_style);
    return fixeds (result);
  end function to_fixeds;

  -- Real to fixeds
  function to_fixeds (
    arg                     : REAL;     -- real
    constant left_index     : INTEGER;  -- size of integer portion
    constant right_index    : INTEGER;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style;
    constant guard_bits     : NATURAL                   := fixed_guard_bits)
    return fixeds is
    variable result : sfixed (left_index downto right_index);
  begin
    result := to_sfixed (arg            => arg,
                         left_index     => left_index,
                         right_index    => right_index,
                         overflow_style => overflow_style,
                         round_style    => round_style,
                         guard_bits     => guard_bits);
    return fixeds (result);
  end function to_fixeds;

  function to_fixeds (
    arg                     : REAL;     -- real
    size_res                : fixeds;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style;
    constant guard_bits     : NATURAL                   := fixed_guard_bits)
    return fixeds is
    variable result : sfixed (size_res'range);
  begin
    result := to_sfixed (arg            => arg,
                         left_index     => size_res'high,
                         right_index    => size_res'low,
                         overflow_style => overflow_style,
                         round_style    => round_style,
                         guard_bits     => guard_bits);
    return fixeds (result);
  end function to_fixeds;

  -- signed to fixeds
  function to_fixeds (
    arg                     : SIGNED;   -- signed
    constant left_index     : INTEGER;  -- size of integer portion
    constant right_index    : INTEGER                   := 0;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixeds is
    variable result : sfixed (left_index downto right_index);
  begin
    result := to_sfixed (arg            => arg,
                         left_index     => left_index,
                         right_index    => right_index,
                         overflow_style => overflow_style,
                         round_style    => round_style);
    return fixeds (result);
  end function to_fixeds;

  function to_fixeds (
    arg                     : SIGNED;   -- signed
    size_res                : fixeds;   -- for size only
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return fixeds is
    variable result : sfixed (size_res'range);
  begin
    result := to_sfixed (arg            => arg,
                         left_index     => size_res'high,
                         right_index    => size_res'low,
                         overflow_style => overflow_style,
                         round_style    => round_style);
    return fixeds (result);
  end function to_fixeds;

  -- signed to fixeds (output assumed to be size of signed input)
  function to_fixeds (
    arg : SIGNED)                       -- signed
    return fixeds is
    variable result : sfixed (arg'range);
  begin
    result := to_sfixed (arg);
    return fixeds (result);
  end function to_fixeds;

  -- Conversion from fixedu to fixeds
  function to_fixeds (
    arg : fixedu)
    return fixeds is
    variable result : sfixed (arg'high+1 downto arg'low);
  begin
    result := to_sfixed (ufixed (arg));
    return fixeds (result);
  end function to_fixeds;

  -- signed fixed point to signed
  function to_signed (
    arg                     : fixeds;   -- fixed point input
    constant size           : NATURAL;  -- length of output
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return SIGNED is
  begin
    return to_signed (arg             => sfixed (arg),
                       size           => size,
                       overflow_style => overflow_style,
                       round_style    => round_style);
  end function to_signed;

  -- signed fixed point to signed
  function to_signed (
    arg                     : fixeds;   -- fixed point input
    size_res                : SIGNED;   -- used for length of output
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return SIGNED is
  begin
    return to_signed (arg             => sfixed (arg),
                       size           => size_res'length,
                       overflow_style => overflow_style,
                       round_style    => round_style);
  end function to_signed;

  -- signed fixed point to real
  function to_real (
    arg : fixeds)                       -- fixed point input
    return REAL is
  begin
    return to_real (sfixed(arg));
  end function to_real;

  -- signed fixed point to integer
  function to_integer (
    arg                     : fixeds;   -- fixed point input
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;
    constant round_style    : fixed_round_style_type    := fixed_round_style)
    return INTEGER is
  begin
    return to_integer (arg            => sfixed (arg),
                       overflow_style => overflow_style,
                       round_style    => round_style);
  end function to_integer;

  -- purpose: returns a saturated number
  function saturate (
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixedu is
    variable result : ufixed (left_index downto right_index);
  begin
    result := saturate (left_index, right_index);
    return fixedu (result);
  end function saturate;

  -- purpose: returns a saturated number
  function saturate (
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixeds is
    variable result : sfixed (left_index downto right_index);
  begin
    result := saturate (left_index, right_index);
    return fixeds (result);
  end function saturate;

  function saturate (
    size_res : fixedu)                  -- only the size of this is used
    return fixedu is
    variable result : ufixed (size_res'range);
  begin
    result := saturate (size_res'high, size_res'low);
    return fixedu (result);
  end function saturate;

  function saturate (
    size_res : fixeds)                  -- only the size of this is used
    return fixeds is
    variable result : sfixed (size_res'range);
  begin
    result := saturate (size_res'high, size_res'low);
    return fixeds (result);
  end function saturate;

  -- ===========================================================================
  -- Translation Functions
  -- ===========================================================================

  -- maps meta-logical values
  function to_01 (
    s             : fixedu;             -- fixed point input
    constant XMAP : STD_ULOGIC := '0')  -- Map x to
    return fixedu is
    variable result : ufixed (s'range);
  begin
    result := to_01 (ufixed(s), XMAP);
    return fixedu (result);
  end function to_01;

  -- maps meta-logical values
  function to_01 (
    s             : fixeds;             -- fixed point input
    constant XMAP : STD_ULOGIC := '0')  -- Map x to
    return fixeds is
    variable result : sfixed (s'range);
  begin
    result := to_01 (sfixed(s), XMAP);
    return fixeds (result);
  end function to_01;

  function Is_X (arg : fixedu) return BOOLEAN is
  begin
    return Is_X (ufixed(arg));
  end function Is_X;
  function Is_X (arg : fixeds) return BOOLEAN is
  begin
    return Is_X (sfixed(arg));
  end function Is_X;
  function to_X01 (arg : fixedu) return fixedu is
    variable result : ufixed (arg'range);
  begin
    result := to_X01 (ufixed(arg));
    return fixedu (result);
  end function to_X01;
  function to_X01 (arg : fixeds) return fixeds is
    variable result : sfixed (arg'range);
  begin
    result := to_X01 (sfixed(arg));
    return fixeds (result);
  end function to_X01;
  function to_X01Z (arg : fixedu) return fixedu is
    variable result : ufixed (arg'range);
  begin
    result := to_X01Z (ufixed(arg));
    return fixedu (result);
  end function to_X01Z;
  function to_X01Z (arg : fixeds) return fixeds is
    variable result : sfixed (arg'range);
  begin
    result := to_X01Z (sfixed(arg));
    return fixeds (result);
  end function to_X01Z;
  function to_UX01 (arg : fixedu) return fixedu is
    variable result : ufixed (arg'range);
  begin
    result := to_UX01 (ufixed(arg));
    return fixedu (result);
  end function to_UX01;
  function to_UX01 (arg : fixeds) return fixeds is
    variable result : sfixed (arg'range);
  begin
    result := to_UX01 (sfixed(arg));
    return fixeds (result);
  end function to_UX01;

  -- straight vector conversion routines, needed for synthesis.
  -- These functions are here so that a std_logic_vector can be
  -- converted to and from fixeds and fixedu.  Note that you can
  -- not convert these vectors because of their negative index.
  
  function to_slv (
    arg : fixedu)                       -- fixed point vector
    return STD_LOGIC_VECTOR is
  begin
    return to_slv (ufixed(arg));
  end function to_slv;

  function to_slv (
    arg : fixeds)                       -- fixed point vector
    return STD_LOGIC_VECTOR is
  begin
    return to_slv (sfixed(arg));
  end function to_slv;

  function to_sulv (
    arg : fixedu)                       -- fixed point vector
    return STD_ULOGIC_VECTOR is
  begin
    return to_sulv (ufixed(arg));
  end function to_sulv;


  function to_sulv (
    arg : fixeds)                       -- fixed point vector
    return STD_ULOGIC_VECTOR is
  begin
    return to_sulv (sfixed(arg));
  end function to_sulv;

  function to_fixedu (
    arg                  : STD_ULOGIC_VECTOR;  -- shifted vector
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixedu is
    variable result : ufixed (left_index downto right_index);
  begin
    result := to_ufixed (arg         => arg,
                         left_index  => left_index,
                         right_index => right_index);
    return fixedu (result);
  end function to_fixedu;

  function to_fixedu (
    arg      : STD_ULOGIC_VECTOR;       -- shifted vector
    size_res : fixedu)                  -- for size only
    return fixedu is
    variable result : ufixed (size_res'range);
  begin
    result := to_ufixed (arg         => arg,
                         left_index  => size_res'high,
                         right_index => size_res'low);
    return fixedu (result);
  end function to_fixedu;

  function to_fixeds (
    arg                  : STD_ULOGIC_VECTOR;  -- shifted vector
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixeds is
    variable result : sfixed (left_index downto right_index);
  begin
    result := to_sfixed (arg         => arg,
                         left_index  => left_index,
                         right_index => right_index);
    return fixeds (result);
  end function to_fixeds;

  function to_fixeds (
    arg      : STD_ULOGIC_VECTOR;       -- shifted vector
    size_res : fixeds)                  -- for size only
    return fixeds is
    variable result : sfixed (size_res'range);
  begin
    result := to_sfixed (arg         => arg,
                         left_index  => size_res'high,
                         right_index => size_res'low);
    return fixeds (result);
  end function to_fixeds;

  -- As a concession to those who use a graphical DSP environment,
  -- these functions take parameters in those tools format and create
  -- fixed point numbers.  These functions are designed to convert from
  -- a std_logic_vector to the VHDL fixed point format using the conventions
  -- of these packages.  In a pure VHDL environment you should use the
  -- "to_fixedu" and "to_fixeds" routines.

  -- unsigned fixed point
  function to_FixU (
    arg      : STD_ULOGIC_VECTOR;
    width    : NATURAL;                 -- width of vector
    fraction : NATURAL)                 -- width of fraction
    return fixedu is
  begin
    return to_fixedu (arg, width-fraction, -fraction);
  end function to_FixU;

  -- signed fixed point
  function to_FixS (
    arg      : STD_ULOGIC_VECTOR;
    width    : NATURAL;                 -- width of vector
    fraction : NATURAL)                 -- width of fraction
    return fixeds is
  begin
    return to_fixeds (arg, width-fraction, -fraction);
  end function to_FixS;

-- rtl_synthesis off
-- pragma synthesis_off
  -- ===========================================================================
  -- string and textio Functions
  -- ===========================================================================

  -- purpose: writes fixed point into a line
  procedure WRITE (
    L         : inout LINE;             -- input line
    VALUE     : in    fixedu;           -- fixed point input
    JUSTIFIED : in    SIDE  := right;
    FIELD     : in    WIDTH := 0) is 
  begin
    WRITE (L         => L,
           VALUE     => ufixed(VALUE),
           JUSTIFIED => JUSTIFIED,
           FIELD     => FIELD);
  end procedure WRITE;

  -- purpose: writes fixed point into a line
  procedure WRITE (
    L         : inout LINE;             -- input line
    VALUE     : in    fixeds;           -- fixed point input
    JUSTIFIED : in    SIDE  := right;
    FIELD     : in    WIDTH := 0) is 
  begin
    WRITE (L         => L,
           VALUE     => sfixed(VALUE),
           JUSTIFIED => JUSTIFIED,
           FIELD     => FIELD);
  end procedure WRITE;

  procedure READ(L     : inout LINE;
                 VALUE : out   fixedu) is 
    variable result : ufixed (VALUE'range);
  begin
    READ (L     => L,
          VALUE => result);
    VALUE := fixedu (result);
  end procedure READ;

  procedure READ(L     : inout LINE;
                 VALUE : out   fixedu;
                 GOOD  : out   BOOLEAN) is 
    variable result : ufixed (VALUE'range);
  begin
    READ (L     => L,
          VALUE => result,
          GOOD  => GOOD);
    VALUE := fixedu (result);
  end procedure READ;

  procedure READ(L     : inout LINE;
                 VALUE : out   fixeds) is 
    variable result : sfixed (VALUE'range);
  begin
    READ (L     => L,
          VALUE => result);
    VALUE := fixeds (result);
  end procedure READ;

  procedure READ(L     : inout LINE;
                 VALUE : out   fixeds;
                 GOOD  : out   BOOLEAN) is 
    variable result : sfixed (VALUE'range);
  begin
    READ (L     => L,
          VALUE => result,
          GOOD  => GOOD);
    VALUE := fixeds (result);
  end procedure READ;

  -- octal read and write
  procedure OWRITE (
    L         : inout LINE;             -- input line
    VALUE     : in    fixedu;           -- fixed point input
    JUSTIFIED : in    SIDE  := right;
    FIELD     : in    WIDTH := 0) is 
  begin
    OWRITE (L         => L,
            VALUE     => ufixed(VALUE),
            JUSTIFIED => JUSTIFIED,
            FIELD     => FIELD);
  end procedure OWRITE;

  procedure OWRITE (
    L         : inout LINE;             -- input line
    VALUE     : in    fixeds;           -- fixed point input
    JUSTIFIED : in    SIDE  := right;
    FIELD     : in    WIDTH := 0) is 
  begin
    OWRITE (L         => L,
            VALUE     => sfixed(VALUE),
            JUSTIFIED => JUSTIFIED,
            FIELD     => FIELD);
  end procedure OWRITE;

  procedure OREAD(L     : inout LINE;
                  VALUE : out   fixedu) is 
    variable result : ufixed (VALUE'range);
  begin
    OREAD (L     => L,
           VALUE => result);
    VALUE := fixedu (result);
  end procedure OREAD;

  procedure OREAD(L     : inout LINE;
                  VALUE : out   fixedu;
                  GOOD  : out   BOOLEAN) is 
    variable result : ufixed (VALUE'range);
  begin
    OREAD (L     => L,
           VALUE => result,
           GOOD  => GOOD);
    VALUE := fixedu (result);
  end procedure OREAD;

  procedure OREAD(L     : inout LINE;
                  VALUE : out   fixeds) is 
    variable result : sfixed (VALUE'range);
  begin
    OREAD (L     => L,
           VALUE => result);
    VALUE := fixeds (result);
  end procedure OREAD;

  procedure OREAD(L     : inout LINE;
                  VALUE : out   fixeds;
                  GOOD  : out   BOOLEAN) is 
    variable result : sfixed (VALUE'range);
  begin
    OREAD (L     => L,
           VALUE => result,
           GOOD  => GOOD);
    VALUE := fixeds (result);
  end procedure OREAD;

  -- hex read and write
  procedure HWRITE (
    L         : inout LINE;             -- input line
    VALUE     : in    fixedu;           -- fixed point input
    JUSTIFIED : in    SIDE  := right;
    FIELD     : in    WIDTH := 0) is 
  begin
    HWRITE (L         => L,
            VALUE     => ufixed(VALUE),
            JUSTIFIED => JUSTIFIED,
            FIELD     => FIELD);
  end procedure HWRITE;

  -- purpose: writes fixed point into a line
  procedure HWRITE (
    L         : inout LINE;             -- input line
    VALUE     : in    fixeds;           -- fixed point input
    JUSTIFIED : in    SIDE  := right;
    FIELD     : in    WIDTH := 0) is 
  begin
    HWRITE (L         => L,
            VALUE     => sfixed(VALUE),
            JUSTIFIED => JUSTIFIED,
            FIELD     => FIELD);
  end procedure HWRITE;

  procedure HREAD(L     : inout LINE;
                  VALUE : out   fixedu) is 
    variable result : ufixed (VALUE'range);
  begin
    HREAD (L     => L,
           VALUE => result);
    VALUE := fixedu (result);
  end procedure HREAD;

  procedure HREAD(L     : inout LINE;
                  VALUE : out   fixedu;
                  GOOD  : out   BOOLEAN) is 
    variable result : ufixed (VALUE'range);
  begin
    HREAD (L     => L,
           VALUE => result,
           GOOD  => GOOD);
    VALUE := fixedu (result);
  end procedure HREAD;

  procedure HREAD(L     : inout LINE;
                  VALUE : out   fixeds) is 
    variable result : sfixed (VALUE'range);
  begin
    HREAD (L     => L,
           VALUE => result);
    VALUE := fixeds (result);
  end procedure HREAD;

  procedure HREAD(L     : inout LINE;
                  VALUE : out   fixeds;
                  GOOD  : out   BOOLEAN) is 
    variable result : sfixed (VALUE'range);
  begin
    HREAD (L     => L,
           VALUE => result,
           GOOD  => GOOD);
    VALUE := fixeds (result);
  end procedure HREAD;

  -- returns a string, useful for:
  -- assert (x = y) report "error found " & to_string(x) severity error;
  function to_string (value : fixedu) return STRING is
  begin
    return to_string (ufixed (value));
  end function to_string;

  function to_ostring (value : fixedu) return STRING is
  begin
    return to_ostring (ufixed (value));
  end function to_ostring;

  function to_hstring (value : fixedu) return STRING is
  begin
    return to_hstring (ufixed (value));
  end function to_hstring;

  function to_string (value : fixeds) return STRING is
  begin
    return to_string (sfixed (value));
  end function to_string;

  function to_ostring (value : fixeds) return STRING is
  begin
    return to_ostring (sfixed (value));
  end function to_ostring;

  function to_hstring (value : fixeds) return STRING is
  begin
    return to_hstring (sfixed (value));
  end function to_hstring;

  -- From string functions allow you to convert a string into a fixed
  -- point number.  Example:
  --  signal uf1 : fixedu (3 downto -3);
  --  uf1 <= from_string ("0110.100", uf1'high, uf1'low); -- 6.5
  -- The "." is optional in this syntax, however it exist and is
  -- in the wrong location an error is produced.  Overflow will
  -- result in saturation.
  
  function from_string (
    bstring              : STRING;      -- binary string
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixedu is
    variable result : ufixed (left_index downto right_index);
  begin
    result := from_string (bstring     => bstring,
                           left_index  => left_index,
                           right_index => right_index);
    return fixedu (result);
  end function from_string;

  -- Octal and hex conversions work as follows:
  -- uf1 <= from_hstring ("6.8", 3, -3); -- 6.5 (bottom zeros dropped)
  -- uf1 <= from_ostring ("06.4", 3, -3); -- 6.5 (top zeros dropped)
  
  function from_ostring (
    ostring              : STRING;      -- Octal string
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixedu is
    variable result : ufixed (left_index downto right_index);
  begin
    result := from_ostring (ostring     => ostring,
                            left_index  => left_index,
                            right_index => right_index);
    return fixedu (result);
  end function from_ostring;

  function from_hstring (
    hstring              : STRING;      -- hex string
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixedu is
    variable result : ufixed (left_index downto right_index);
  begin
    result := from_hstring (hstring     => hstring,
                            left_index  => left_index,
                            right_index => right_index);
    return fixedu (result);
  end function from_hstring;

  function from_string (
    bstring              : STRING;      -- binary string
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixeds is
    variable result : sfixed (left_index downto right_index);
  begin
    result := from_string (bstring     => bstring,
                           left_index  => left_index,
                           right_index => right_index);
    return fixeds (result);
  end function from_string;

  function from_ostring (
    ostring              : STRING;      -- Octal string
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixeds is
    variable result : sfixed (left_index downto right_index);
  begin
    result := from_ostring (ostring     => ostring,
                            left_index  => left_index,
                            right_index => right_index);
    return fixeds (result);
  end function from_ostring;

  function from_hstring (
    hstring              : STRING;      -- hex string
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixeds is
    variable result : sfixed (left_index downto right_index);
  begin
    result := from_hstring (hstring     => hstring,
                            left_index  => left_index,
                            right_index => right_index);
    return fixeds (result);
  end function from_hstring;

  -- Same as above, "size_res" is used for it's range only.
  function from_string (
    bstring  : STRING;                  -- binary string
    size_res : fixedu)
    return fixedu is
    variable result : ufixed (size_res'range);
  begin
    result := from_string (bstring     => bstring,
                           left_index  => size_res'high,
                           right_index => size_res'low);
    return fixedu (result);
  end function from_string;

  function from_ostring (
    ostring  : STRING;                  -- Octal string
    size_res : fixedu)
    return fixedu is
    variable result : ufixed (size_res'range);
  begin
    result := from_ostring (ostring     => ostring,
                            left_index  => size_res'high,
                            right_index => size_res'low);
    return fixedu (result);
  end function from_ostring;

  function from_hstring (
    hstring  : STRING;                  -- hex string
    size_res : fixedu)
    return fixedu is
    variable result : ufixed (size_res'range);
  begin
    result := from_hstring (hstring     => hstring,
                            left_index  => size_res'high,
                            right_index => size_res'low);
    return fixedu (result);
  end function from_hstring;

  function from_string (
    bstring  : STRING;                  -- binary string
    size_res : fixeds)
    return fixeds is
    variable result : sfixed (size_res'range);
  begin
    result := from_string (bstring     => bstring,
                           left_index  => size_res'high,
                           right_index => size_res'low);
    return fixeds (result);
  end function from_string;

  function from_ostring (
    ostring  : STRING;                  -- Octal string
    size_res : fixeds)
    return fixeds is
    variable result : sfixed (size_res'range);
  begin
    result := from_ostring (ostring     => ostring,
                            left_index  => size_res'high,
                            right_index => size_res'low);
    return fixeds (result);
  end function from_ostring;

  function from_hstring (
    hstring  : STRING;                  -- hex string
    size_res : fixeds)
    return fixeds is
    variable result : sfixed (size_res'range);
  begin
    result := from_hstring (hstring     => hstring,
                            left_index  => size_res'high,
                            right_index => size_res'low);
    return fixeds (result);
  end function from_hstring;

  -- purpose: find a dot in a string, return -1 if no dot (internal function)
  function finddot (
    arg : STRING)
    return INTEGER is
    alias xarg : STRING (arg'length downto 1) is arg;  -- make it a downto
  begin
    for i in xarg'reverse_range loop
      if (xarg(i) = '.') then
        return i-1;
      end if;
    end loop;
    return -1;
  end function finddot;

  -- Direct conversion functions.  Example:
  --  signal uf1 : fixedu (3 downto -3);
  --  uf1 <= from_string ("0110.100"); -- 6.5
  -- In this case the "." is not optional, and the size of
  -- the output must match exactly.
  
  function from_string (
    bstring : STRING)                   -- binary string
    return fixedu is
    variable result : ufixed (bstring'length-2 downto 0);
    variable dot    : NATURAL;
  begin 
    dot := finddot(bstring);
    result := from_string (bstring);
    return to_fixedu (to_sulv (result), result'high-dot, -dot);
  end function from_string;
  -- Direct octal and hex conversion functions.  In this case
  -- the string lengths must match.  Example:
  -- signal sf1 := fixeds (5 downto -3);
  -- sf1 <= from_ostring ("71.4") -- -6.5
  
  function from_ostring (
    ostring : STRING)                   -- Octal string
    return fixedu is
    variable result : ufixed ((ostring'length-1)*3-1 downto 0);
    variable dot    : NATURAL;
  begin 
    dot := finddot(ostring);
    result := from_ostring (ostring);
    return to_fixedu (to_sulv (result), (ostring'length-1-dot)*3-1, -dot*3);
  end function from_ostring;

  function from_hstring (
    hstring : STRING)                   -- hex string
    return fixedu is
    variable result : ufixed ((hstring'length-1)*4-1 downto 0);
    variable dot    : NATURAL;
  begin 
    dot := finddot(hstring);
    result := from_hstring (hstring);
    return to_fixedu (to_sulv (result), (hstring'length-1-dot)*4-1, -dot*4);
  end function from_hstring;

  function from_string (
    bstring : STRING)                   -- binary string
    return fixeds is
    variable result : sfixed (bstring'length-2 downto 0);
    variable dot    : NATURAL;
  begin 
    dot := finddot(bstring);
    result := from_string (bstring);
    return to_fixeds (to_sulv (result), result'high-dot, -dot);
  end function from_string;

  function from_ostring (
    ostring : STRING)                   -- Octal string
    return fixeds is
    variable result : sfixed ((ostring'length-1)*3-1 downto 0);
    variable dot    : NATURAL;
  begin 
    dot := finddot(ostring);
    result := from_ostring (ostring);
    return to_fixeds (to_sulv (result), (ostring'length-1-dot)*3-1, -dot*3);
  end function from_ostring;

  function from_hstring (
    hstring : STRING)                   -- hex string
    return fixeds is
    variable result : sfixed ((hstring'length-1)*4-1 downto 0);
    variable dot    : NATURAL;
  begin 
    dot := finddot(hstring);
    result := from_hstring (hstring);
    return to_fixeds (to_sulv (result), (hstring'length-1-dot)*4-1, -dot*4);
  end function from_hstring;
-- rtl_synthesis on
-- pragma synthesis_on

  -- IN VHDL-2006 std_logic_vector is a subtype of std_ulogic_vector, so these
  -- extra functions are needed for compatability.
  function to_fixedu (
    arg                  : STD_LOGIC_VECTOR;  -- shifted vector
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixedu is
    variable result : ufixed (left_index downto right_index);
  begin
    result := to_ufixed (arg         => arg,
                         left_index  => left_index,
                         right_index => right_index);
    return fixedu (result);
  end function to_fixedu;

  function to_fixedu (
    arg      : STD_LOGIC_VECTOR;        -- shifted vector
    size_res : fixedu)                  -- for size only
    return fixedu is
    variable result : ufixed (size_res'range);
  begin
    result := to_ufixed (arg         => arg,
                         left_index  => size_res'high,
                         right_index => size_res'low);
    return fixedu (result);
  end function to_fixedu;

  function to_fixeds (
    arg                  : STD_LOGIC_VECTOR;  -- shifted vector
    constant left_index  : INTEGER;
    constant right_index : INTEGER)
    return fixeds is
    variable result : sfixed (left_index downto right_index);
  begin
    result := to_sfixed (arg         => arg,
                         left_index  => left_index,
                         right_index => right_index);
    return fixeds (result);
  end function to_fixeds;

  function to_fixeds (
    arg      : STD_LOGIC_VECTOR;        -- shifted vector
    size_res : fixeds)                  -- for size only
    return fixeds is
    variable result : sfixed (size_res'range);
  begin
    result := to_sfixed (arg         => arg,
                         left_index  => size_res'high,
                         right_index => size_res'low);
    return fixeds (result);
  end function to_fixeds;

  -- unsigned fixed point
  function to_FixU (
    arg      : STD_LOGIC_VECTOR;
    width    : NATURAL;                 -- width of vector
    fraction : NATURAL)                 -- width of fraction
    return fixedu is
  begin
    return to_fixedu (arg, width-fraction, -fraction);
  end function to_FixU;

  -- signed fixed point
  function to_FixS (
    arg      : STD_LOGIC_VECTOR;
    width    : NATURAL;                 -- width of vector
    fraction : NATURAL)                 -- width of fraction
    return fixeds is
  begin
    return to_fixeds (arg, width-fraction, -fraction);
  end function to_FixS;


end package body fixed_noresize;

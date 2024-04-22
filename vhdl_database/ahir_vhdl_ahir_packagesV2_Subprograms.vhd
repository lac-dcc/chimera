------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Utilities.all;

library aHiR_ieee_proposed;
-- use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;

package Subprograms is

  function ApIntZero( l: integer) return ApInt;
  function ApFloatZero( characteristic,mantissa: integer) return ApFloat;

  function To_Boolean ( inp : ApInt) return boolean;
  function To_Boolean (  x : std_logic) return Boolean;
  function To_BooleanArray( inp: std_logic_vector) return BooleanArray;
  function To_Std_Logic ( x : boolean)   return std_logic;

  -- missing in std_logic_1164.
  function To_Std_Logic(x: bit) return std_logic;

  function To_ApInt ( inp : boolean) return ApInt;
  function To_ApInt ( inp : signed) return ApInt;
  function To_Apint ( inp : unsigned) return ApInt;
  function To_ApInt ( inp : std_logic_vector) return ApInt;
  function To_ApInt ( inp : IStdLogicVector) return ApInt;

  -- already present in float_pkg in aHiR_ieee_proposed
  --function To_Float ( x                       : std_logic_vector;
  --                    constant exponent_width : integer;
  --                    constant fraction_width : integer)
  --  return Unresolved_Float;
  
  function To_Float ( inp : ApFloat) return float;

  function To_Signed ( inp : ApInt) return signed;
  function To_Signed ( inp : std_logic_vector) return signed;
  function To_Unsigned ( inp : ApInt) return unsigned;
  function To_Unsigned ( inp : std_logic_vector) return unsigned;
  function To_Unsigned(constant W : in integer; inp : std_logic_vector) return unsigned;


  function To_SLV ( x: ApInt) return std_logic_vector;
  function To_SLV ( x: IStdLogicVector) return std_logic_vector;
  function To_SLV ( x: ApFloat) return std_logic_vector;
  function To_SLV( x : BooleanArray) return std_logic_vector;
  function To_SLV( x : Boolean) return std_logic_vector;  
  function To_SLV( x : Signed) return std_logic_vector;
  function To_SLV( x : Unsigned) return std_logic_vector;
  function Float_To_SLV( x : UNRESOLVED_float) return std_logic_vector;  
  
  function To_SLV (x : StdLogicArray2D) return std_logic_vector; 
  function To_SLV_Shuffle(x : StdLogicArray2D) return std_logic_vector;

  function To_ISLV(inp: ApInt) return IStdLogicVector;
  function To_ISLV(inp: ApFloat) return IStdLogicVector;
  function To_ISLV(inp : BooleanArray) return IStdLogicVector;
  function To_ISLV(inp : std_logic_vector) return IStdLogicVector;
  function To_ISLV(inp: Float) return IStdLogicVector;
  
  function To_StdLogicArray2D( inp: ApIntArray) return StdLogicArray2D;
  function To_StdLogicArray2D( inp: ApFloatArray) return StdLogicArray2D;
  function To_StdLogicArray2D( inp: std_logic_vector) return StdLogicArray2D;
  function To_StdLogicArray2D( inp: std_logic_vector; word_size: integer) return StdLogicArray2D;

  function To_StdLogicArray2D_Shuffle( inp: std_logic_vector; word_size: integer) return StdLogicArray2D;

  function To_ApIntArray(inp : StdLogicArray2D) return ApIntArray;
  function To_ApIntArray (inp : ApInt)   return ApIntArray;
  function To_ApIntArray (inp : integer; width : integer)   return ApIntArray;

  function To_ApFloatArray(inp : StdLogicArray2D) return ApFloatArray;
  function To_ApFloatArray (inp : ApFloat)   return ApFloatArray;

  function "&" (x : ApInt; y : ApInt) return ApInt;
  function "&" (x : ApFloat; y : ApFloat) return ApFloat;
  -- function "&" (x : std_logic_vector; y : std_logic_vector) return std_logic_vector;

  procedure Unflatten (signal z : out ApIntArray; x : in  ApInt);
  procedure Unflatten (signal z : out ApFloatArray; x : in  ApFloat);
  procedure Unflatten (signal z : out StdLogicArray2D; x : in std_logic_vector);

  function zero_pad (x : IStdLogicVector; constant h, l : integer)
    return IStdLogicVector;

  function zero_pad (x : std_logic_vector; constant h, l : integer)
    return std_logic_vector;

  function zero_pad (x : ApInt; constant h, l : integer)
    return ApInt;

  function zero_pad (x : ApFloat; constant h, l : integer)
    return ApFloat;

  function Stack( x, y : StdLogicArray2D) return StdLogicArray2D;
  procedure Split(x : in  StdLogicArray2D; y, z : out StdLogicArray2D);

  function To_ApFloat( x : float)   return ApFloat;
  function To_ApFloat( x : std_logic_vector)   return ApFloat;
  function To_ApFloat( x : std_logic_vector;  characteristic, mantissa: integer)   return ApFloat;
  function To_ApFloat( x : ApInt;  characteristic, mantissa: integer)   return ApFloat;
  function To_ApFloat ( inp : IStdLogicVector) return ApFloat;
  function To_ApFloat (x : real; characteristic, mantissa : integer) return ApFloat;
  function To_ApFloat (x : integer; characteristic, mantissa : integer) return ApFloat;

  function Extract( x : StdLogicArray2D;  idx : integer) return std_logic_vector;
  function Extract( x: ApIntArray;  idx: integer) return ApInt;
  function Extract( x: ApFloatArray;  idx: integer) return ApFloat;


  procedure Extract(source: in std_logic_vector; index: in integer; target: out std_logic_vector);
  procedure Insert(target: out std_logic_vector; index: in integer; source: in std_logic_vector);


  procedure Insert(x: out StdLogicArray2D; idx: in integer; w: in std_logic_vector );
  procedure Insert(x: out ApIntArray; idx: in integer; w: in ApInt );
  procedure Insert(x: out ApFloatArray; idx: in integer; w: in ApFloat );


  function PriorityEncode(x: BooleanArray) return BooleanArray;
  function PriorityEncode(x: std_logic_vector) return std_logic_vector;

  function OrReduce(x: BooleanArray) return boolean;
  function OrReduce(x: std_logic_vector) return std_logic;
  function OrReduce(x: unsigned) return std_logic;

  function AndReduce(x: BooleanArray) return boolean;
  function AndReduce(x: std_logic_vector) return std_logic;

  function XorReduce(x: std_logic_vector) return std_logic;

  -- generic encoders/decoders
  function GenericEncode(x: std_logic_vector) return std_logic_vector;
  function GenericDecode(x: std_logic_vector) return std_logic_vector;

  function MuxOneHot (
    constant din : StdLogicArray2D;     -- input data
    constant sel : std_logic_vector)    -- select vector (one hot)
    return std_logic_vector;

  function MuxOneHot(x: std_logic_vector; sel: BooleanArray) return std_logic_vector;
  

  function Swap_Bytes(x: std_logic_vector) return std_logic_vector;

end package Subprograms;


package body Subprograms is

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function ApIntZero( l: integer) return ApInt is
    variable ret_var : ApInt(l-1 downto 0);
  begin
    ret_var := (others => '0');
    return(ret_var);
  end ApIntZero;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function ApFloatZero( characteristic,mantissa: integer) return ApFloat is
    variable ret_var : ApFloat(characteristic downto -mantissa);
  begin
    ret_var := (others => '0');
    return(ret_var);
  end ApFloatZero;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_Boolean ( inp : ApInt) return boolean is
  begin
    if(inp(inp'left) = '1') then
      return(true);
    else
      return(false);
    end if;
  end To_Boolean;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_Boolean (  x : std_logic) return Boolean is
  begin
    if( x = '1') then
      return(true);
    else
      return(false);
    end if;
  end To_Boolean;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_BooleanArray( inp: std_logic_vector) return BooleanArray is
    alias linp : std_logic_vector(1 to inp'length) is inp;
    variable ret_var : BooleanArray(1 to inp'length);
  begin
    for I in 1 to inp'length loop
      ret_var(I) := To_Boolean(linp(I));
    end loop;  -- I
    return(ret_var);
  end To_BooleanArray;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_Std_Logic ( x : boolean)   return std_logic is
  begin
    if(x) then
      return('1');
    else
      return('0');
    end if;
  end To_Std_Logic;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_Std_Logic(x: bit) return std_logic is
	variable ret_var : std_logic;
  begin
	if(x = '1') then 
		ret_var := '1';
	else
		ret_var := '0';
	end if;
	return(ret_var);
  end To_Std_Logic;


  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ApInt ( inp : boolean) return ApInt is
    variable ret_var : ApInt(0 downto 0);
  begin
    if(inp) then
      ret_var(0) := '1';
    else
      ret_var(0) := '0';
    end if;
    return(ret_var);
  end To_ApInt;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ApInt ( inp : signed) return ApInt is
    alias linp : signed(1 to inp'length) is inp;
    variable ret_var : ApInt(1 to inp'length);
  begin
    for I in 1 to inp'length loop
      ret_var(I) := linp(I);
    end loop;  -- I
    return(ret_var);
  end To_ApInt;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_Apint ( inp : unsigned) return ApInt is
    alias linp : unsigned(1 to inp'length) is inp;
    variable ret_var : ApInt(1 to inp'length);
  begin
    for I in 1 to inp'length loop
      ret_var(I) := linp(I);
    end loop;  -- I
    return(ret_var);
  end To_ApInt;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ApInt ( inp : std_logic_vector) return ApInt is
    alias linp : std_logic_vector(1 to inp'length) is inp;
    variable ret_var : ApInt(1 to inp'length);
  begin
    for I in 1 to inp'length loop
      ret_var(I) := linp(I);
    end loop;  -- I
    return(ret_var);
  end To_ApInt;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ApInt ( inp : IStdLogicVector) return ApInt is
    alias linp: IStdLogicVector(inp'high downto inp'low) is inp;
    variable ret_var :ApInt(inp'high downto inp'low);
  begin
    for I in linp'range loop
      ret_var(I) := linp(I);
    end loop;
    return(ret_var);
  end To_ApInt;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  --function To_Float ( x                       : std_logic_vector;
  --                    constant exponent_width : integer;
  --                    constant fraction_width : integer)
  --  return Unresolved_Float is
  --  alias lx : std_logic_vector(0 to x'length-1) is x;
  --  variable ret_var : Unresolved_Float(exponent_width downto -fraction_width);
  --begin
  --  for I in 0 to x'length loop
  --    ret_var(exponent_width-I) := lx(I);
  --  end loop;
  --  return(ret_var);
  --end To_Float;
  
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_Float ( inp : ApFloat) return float is
    -- note : Apfloat is always of the form (exp downto -mantessa)
    alias linp : ApFloat(inp'high downto inp'low) is inp;
    variable ret_var : float(inp'high downto inp'low);
  begin
    for I in inp'range loop
      ret_var(I) := linp(I);
    end loop;  -- I
    return(ret_var);
  end To_Float;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_Signed ( inp : ApInt) return signed is
    alias linp : ApInt(1 to inp'length) is inp;
    variable ret_var : signed(1 to inp'length);
  begin
    for I in 1 to inp'length loop
      ret_var(I) := linp(I);
    end loop;  -- I
    return(ret_var);
  end To_Signed;


  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_Signed ( inp : std_logic_vector) return signed is
    alias linp : std_logic_vector(1 to inp'length) is inp;
    variable ret_var : signed(1 to inp'length);
  begin
    for I in 1 to inp'length loop
      ret_var(I) := linp(I);
    end loop;  -- I
    return(ret_var);
  end To_Signed;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_Unsigned ( inp : ApInt) return unsigned is
    alias linp : ApInt(1 to inp'length) is inp;
    variable ret_var : unsigned(1 to inp'length);
  begin
    for I in 1 to inp'length loop
      ret_var(I) := linp(I);
    end loop;  -- I
    return(ret_var);
  end To_Unsigned;


  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_Unsigned ( inp : std_logic_vector) return unsigned is
    alias linp : std_logic_vector(1 to inp'length) is inp;
    variable ret_var : unsigned(1 to inp'length);
  begin
    for I in 1 to inp'length loop
      ret_var(I) := linp(I);
    end loop;  -- I
    return(ret_var);
  end To_Unsigned;


  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_Unsigned(constant W : in integer; inp : std_logic_vector) return unsigned is
    alias linp : std_logic_vector(inp'length downto 1) is inp;
    variable ret_var : unsigned(Minimum(W,inp'length) downto 1);
  begin
    for I in 1 to ret_var'length loop
      ret_var(I) := linp(I);
    end loop;  -- I
    return(ret_var);
  end To_Unsigned;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_SLV( x: ApInt) return std_logic_vector is
    alias lx: ApInt(x'length-1 downto 0) is x;
    variable rv: std_logic_vector(x'length-1 downto 0);
  begin
    for I in 1 to x'length loop
      rv(I-1) := lx(I-1);
    end loop;
    return(rv);
  end function To_SLV;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_SLV( x: IStdLogicVector) return std_logic_vector is
    alias lx: IStdLogicVector(x'length-1 downto 0) is x;
    variable rv: std_logic_vector(x'length-1 downto 0);
  begin
    for I in 1 to x'length loop
      rv(I-1) := lx(I-1);
    end loop;
    return(rv);
  end function To_SLV;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_SLV ( x: ApFloat) return std_logic_vector is
    alias lx: ApFloat(x'length-1 downto 0) is x;
    variable rv: std_logic_vector(x'length-1 downto 0);
  begin
    for I in 1 to x'length loop
      rv(I-1) := lx(I-1);
    end loop;
    return(rv);
  end function To_SLV;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_SLV ( x: BooleanArray) return std_logic_vector is
    alias lx: BooleanArray(x'length-1 downto 0) is x;
    variable rv: std_logic_vector(x'length-1 downto 0);
  begin
    for I in 1 to x'length loop
      if(lx(I-1)) then
        rv(I-1) := '1';
      else
        rv(I-1) := '0';
      end if;
    end loop;
    return(rv);
  end function To_SLV;


  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_SLV ( x: Boolean) return std_logic_vector is
    variable rv: std_logic_vector(0 downto 0);
  begin
    if(x) then
      rv(0) := '1';
    else
      rv(0) := '0';
    end if;
    return(rv);
  end function To_SLV;

  
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_SLV ( x: Signed) return std_logic_vector is
    alias lx: Signed(1 to x'length) is x;
    variable rv: std_logic_vector(1 to x'length);
  begin
    for I in 1 to x'length loop
      rv(I) := lx(I);
    end loop;
    return(rv);
  end function To_SLV;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_SLV ( x: Unsigned) return std_logic_vector is
    alias lx: Unsigned(1 to x'length) is x;
    variable rv: std_logic_vector(1 to x'length);
  begin
    for I in 1 to x'length loop
      rv(I) := lx(I);
    end loop;
    return(rv);
  end function To_SLV;


  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function Float_To_SLV (x: UNRESOLVED_float) return std_logic_vector is
    alias lx: UNRESOLVED_float(1 to x'length) is x;
    variable rv: std_logic_vector(1 to x'length);
  begin
    for I in 1 to x'length loop
      rv(I) := lx(I);
    end loop;
    return(rv);
  end function Float_To_SLV;
  

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ISLV(inp: ApInt) return IStdLogicVector is
    alias linp: ApInt(inp'high downto inp'low) is inp;
    variable ret_var :IStdLogicVector(inp'high downto inp'low);
  begin
    for I in linp'range loop
      ret_var(I) := linp(I);
    end loop;
    return(ret_var);
  end To_ISLV;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ISLV(inp: ApFloat) return IStdLogicVector is
    alias linp: ApFloat(inp'high downto inp'low) is inp;
    variable ret_var :IStdLogicVector(inp'high downto inp'low);
  begin
    for I in linp'range loop
      ret_var(I) := linp(I);
    end loop;
    return(ret_var);
  end To_ISLV;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ISLV(inp : BooleanArray) return IStdLogicVector is
    alias linp: BooleanArray(inp'high downto inp'low) is inp;
    variable ret_var :IStdLogicVector(inp'high downto inp'low);
  begin
    for I in linp'range loop
      ret_var(I) := To_Std_Logic(linp(I));
    end loop;
    return(ret_var);
  end To_ISLV;

    -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ISLV(inp : std_logic_vector) return IStdLogicVector is
    alias linp: std_logic_vector(inp'high downto inp'low) is inp;
    variable ret_var :IStdLogicVector(inp'high downto inp'low);
  begin
    for I in linp'range loop
      ret_var(I) := linp(I);
    end loop;
    return(ret_var);
  end To_ISLV;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ISLV(inp: Float) return IStdLogicVector is
    variable ret_var :IStdLogicVector(inp'high downto inp'low);
  begin
    for I in inp'range loop
      ret_var(I) := inp(I);
    end loop;
    return(ret_var);
  end To_ISLV;
  

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- purpose: convert a 2D array to SLV
  function To_SLV (
    x : StdLogicArray2D)
    return std_logic_vector is
    variable ret_var  : std_logic_vector((x'length(1)*x'length(2))-1 downto 0);
    variable lx : StdLogicArray2D(x'length(1)-1 downto 0, x'length(2)-1 downto 0);
  begin  -- To_SLV
    lx := x;
    for I in lx'range(1) loop
      for J in lx'range(2) loop
        ret_var((I*x'length(1))+J) := lx(I,J);
      end loop;  -- J
    end loop;  -- I
    return(ret_var);
  end To_SLV;
  
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_SLV_Shuffle(x : StdLogicArray2D) return std_logic_vector is
    variable ret_var  : std_logic_vector((x'length(1)*x'length(2))-1 downto 0);
    variable lx : StdLogicArray2D(x'length(1)-1 downto 0, x'length(2)-1 downto 0);
    variable I : integer;
  begin
    lx := x;
    I := 0;
    while I < lx'length(1)/2 loop
      for J in lx'high(2) downto lx'low(2) loop
        ret_var((2*I*x'length(2))+J) := lx(I,J);
        ret_var((((2*I)+1)*x'length(2))+J) := lx(I+(x'length(1)/2),J);
      end loop;  -- J
      I := I + 1;
    end loop;  -- I
    return(ret_var);
  end To_SLV_Shuffle;
  
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_StdLogicArray2D( inp: ApIntArray) return StdLogicArray2D is
    variable ret_var : StdLogicArray2D(inp'range(1), inp'range(2));
  begin
    for I in ret_var'range(1) loop
      for J in ret_var'range(2) loop
        ret_var(I,J) := inp(I,J);
      end loop;  -- J
    end loop;  -- I
    return(ret_var);
  end To_StdLogicArray2D;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_StdLogicArray2D( inp: ApFloatArray) return StdLogicArray2D is
    variable ret_var : StdLogicArray2D(inp'range(1), inp'range(2));
  begin
    for I in ret_var'range(1) loop
      for J in ret_var'range(2) loop
        ret_var(I,J) := inp(I,J);
      end loop;  -- J
    end loop;  -- I
    return(ret_var);
  end To_StdLogicArray2D;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_StdLogicArray2D( inp: std_logic_vector) return StdLogicArray2D is
    alias linp: std_logic_vector(inp'length-1 downto 0) is inp;
    variable ret_var : StdLogicArray2D(0 downto 0, inp'length-1 downto 0);
  begin
    for I in linp'range loop
      ret_var(0,I) := linp(I);
    end loop;
    return(ret_var);
  end To_StdLogicArray2D;
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------

  function To_StdLogicArray2D( inp: std_logic_vector; word_size: integer) return StdLogicArray2D is
    variable ret_var : StdLogicArray2D((inp'length/word_size)-1 downto 0, word_size-1 downto 0);
    alias linp : std_logic_vector(inp'length-1 downto 0) is inp;
  begin
    for I in ret_var'range(1) loop
      for J in word_size-1 downto 0 loop
        ret_var(I,J) := linp((I*word_size)+J);
      end loop;  -- J
    end loop;  -- I
    return(ret_var);
  end To_StdLogicArray2D;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  
  function To_StdLogicArray2D_Shuffle( inp: std_logic_vector; word_size: integer) return StdLogicArray2D is
    variable ret_var : StdLogicArray2D((inp'length/word_size)-1 downto 0, word_size-1 downto 0);
    alias linp : std_logic_vector(inp'length-1 downto 0) is inp;
    variable I : integer;
  begin
    I := 0;
    while I <  (ret_var'length(1)/2)-1 loop
      for J in word_size-1 downto 0 loop
        ret_var(I,J) := linp((2*I*word_size)+J);
        ret_var(I+ret_var'length(1),J) := linp((((2*I)+1)*word_size) + J);
      end loop;  -- J
      I := I + 1;
    end loop;  -- I
    return(ret_var);
  end To_StdLogicArray2D_Shuffle;


  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  
  function To_ApIntArray(inp : StdLogicArray2D) return ApIntArray is
    variable linp  : StdLogicArray2D(inp'high(1) downto inp'low(1), inp'high(2) downto inp'low(2));
    variable ret_var : ApIntArray(inp'high(1) downto inp'low(1), inp'high(2) downto inp'low(2));
  begin
    linp := inp;
    for I in linp'range(1) loop
      for J in linp'range(2) loop
        ret_var(I,J) := linp(I,J);
      end loop;  -- J
    end loop;  -- I
    return(ret_var);
  end To_ApIntArray;


  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ApIntArray (inp : ApInt)   return ApIntArray is
    variable ret_var : ApIntArray(0 downto 0, inp'range);
  begin
    for I in inp'range loop
      ret_var(0,I) := inp(I);
    end loop;  -- I
    return(ret_var);
  end To_ApIntArray;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ApIntArray(inp : integer; width: integer) return ApIntArray is
  begin
    return To_ApIntArray(To_ApInt(to_signed(inp, width)));
  end To_ApIntArray;

  -----------------------------------------------------------------------------
  function To_ApFloatArray(inp : StdLogicArray2D) return ApFloatArray is
    variable linp  : StdLogicArray2D(inp'high(1) downto inp'low(1), inp'high(2) downto inp'low(2));
    variable ret_var : ApFloatArray(inp'high(1) downto inp'low(1), inp'high(2) downto inp'low(2));
  begin
    linp := inp;
    for I in linp'range(1) loop
      for J in linp'range(2) loop
        ret_var(I,J) := linp(I,J);
      end loop;  -- J
    end loop;  -- I
    return(ret_var);
  end To_ApFloatArray;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ApFloatArray (inp : ApFloat)   return ApFloatArray is
    variable ret_var : ApFloatArray(0 downto 0, inp'range);
  begin
    for I in inp'range loop
      ret_var(0,I) := inp(I);
    end loop;  -- I
    return(ret_var);
  end To_ApFloatArray;


  -----------------------------------------------------------------------------
  function Stack ( x, y : StdLogicArray2D) return StdLogicArray2D is
    variable lx  : StdLogicArray2D(x'length(1)-1 downto 0, x'high(2) downto x'low(2));
    variable ly  : StdLogicArray2D(y'length(1)-1 downto 0, y'high(2) downto y'low(2));
    variable ret_var:  StdLogicArray2D(x'length(1) + y'length(1) - 1 downto 0, x'high(2) downto x'low(2));
  begin
    lx := x;
    ly := y;
    assert x'high(2) = y'high(2) and x'low(2) = y'low(2) report "high/low index mismatch in Stack"
      severity error;

    for I in lx'range(1) loop
      for J  in x'high(2) downto x'low(2) loop
        ret_var(I,J) := lx(I,J);
      end loop;  -- J
    end loop;  -- I

    for I in ly'range(1) loop
      for J  in y'high(2) downto y'low(2) loop
        ret_var(I+x'length(1),J) := ly(I,J);
      end loop;  -- J
    end loop;  -- I
    return(ret_var);
  end Stack;



  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  procedure Split(x : in  StdLogicArray2D; y, z : out StdLogicArray2D) is
    variable lx  : StdLogicArray2D(x'length(1)-1 downto 0, x'high(2) downto x'low(2));
    variable ly  : StdLogicArray2D(y'length(1)-1 downto 0, y'high(2) downto y'low(2));
    variable lz  : StdLogicArray2D(z'length(1)-1 downto 0, z'high(2) downto z'low(2));
  begin
    assert x'length = (y'length + z'length) report "length mismatch in Split" severity error;
    assert x'high(2) = y'high(2) and x'high(2) = z'high(2) and x'low(2) = y'low(2) and x'low(2) = z'low(2)
      report "high/low mismatch in Split" severity error;

    lx := x;
    for I in ly'range(1) loop
      for J  in y'high(2) downto y'low(2) loop
        ly(I,J) := lx(I,J);
      end loop;  -- J
    end loop;  -- I

    for I in lz'range(1) loop
      for J  in z'high(2) downto z'low(2) loop
        lz(I,J) := lx(I+ly'length(1),J);
      end loop;  -- J
    end loop;  -- I

    y := ly;
    z := lz;
  end Procedure Split;

  -----------------------------------------------------------------------------
  -- Rearrange a really long ApInt into an ApIntArray.
  -- Used by the data-path along with the concatentation operator "&"
  -- to populate an ApIntArray using various ApInt's.
  -----------------------------------------------------------------------------
  procedure Unflatten_var (z : out StdLogicArray2D; x : in  std_logic_vector) is
    alias lx : std_logic_vector(0 to x'length - 1) is x;
    variable p : integer := 0;
  begin
    assert z'length(1) * z'length(2) = x'length
      report "z and x don't match"
      severity error;
    
    p := 0;
    
    for i in z'range(1) loop
      for j in z'range(2) loop
        z(i, j) := lx(p);
        p := p + 1;
      end loop;  -- j
    end loop;  -- i
  end procedure Unflatten_var;

  procedure Unflatten (signal z : out ApIntArray; x : in  ApInt) is
    variable lz : StdLogicArray2D(z'range(1), z'range(2));
  begin
    Unflatten_var(lz, To_SLV(x));
    z <= To_ApIntArray(lz);
  end procedure Unflatten;

  procedure Unflatten (signal z : out ApFloatArray; x : in  ApFloat) is
    variable lz : StdLogicArray2D(z'range(1), z'range(2));
  begin
    Unflatten_var(lz, To_SLV(x));
    z <= To_ApFloatArray(lz);
  end procedure Unflatten;

  procedure Unflatten (signal z : out StdLogicArray2D; x : in std_logic_vector) is
    variable lz : StdLogicArray2D(z'range(1), z'range(2));
  begin
    Unflatten_var(lz, x);
    z <= lz;
  end procedure Unflatten;
  -----------------------------------------------------------------------------
  
  -----------------------------------------------------------------------------
  -- Concatenation operator for ApInt
  -----------------------------------------------------------------------------
  --function "&" (x : std_logic_vector; y : std_logic_vector) return std_logic_vector is
    --variable z : std_logic_vector(0 to x'length + y'length - 1);
  --begin
    --z(0 to x'length - 1) := x;
    --z(x'length to z'length - 1) := y;
    --return z;
  --end function "&";

  function "&" (x : ApInt; y : ApInt) return ApInt is
  begin
    return To_ApInt(To_SLV(x) & To_SLV(y));
  end function "&";

  function "&" (x : ApFloat; y : ApFloat) return ApFloat is
  begin
    return To_ApFloat(To_SLV(x) & To_SLV(y));
  end function "&";
  -----------------------------------------------------------------------------
  
  -----------------------------------------------------------------------------
  -- pad a given value with zeroes on either side.
  -----------------------------------------------------------------------------
  function zero_pad_ascending (x : IStdLogicVector; constant h, l : integer)
    return IStdLogicVector is
    variable z : IStdLogicVector(l to h);
  begin
    assert x'ascending report "expected an SLV with ascending range" severity error;
    assert x'high <= h and x'low >= l report "input out of range" severity error;

    if z'low < x'low then
      z(z'low to x'low - 1) := (others => '0');
    end if;

    if z'high > x'high then
      z(x'high + 1 to z'high) := (others => '0');
    end if;

    z(x'low to x'high) := x;

    return z;
  end zero_pad_ascending;

  function zero_pad_descending (x : IStdLogicVector; constant h, l : integer)
    return IStdLogicVector is
    variable z : IStdLogicVector(h downto l);
  begin
    assert not x'ascending report "expected an SLV with descending range" severity error;
    assert x'high <= h and x'low >= l report "input out of range" severity error;

    if z'low < x'low then
      z(x'low - 1 downto z'low) := (others => '0');
    end if;

    if z'high > x'high then
      z(z'high downto x'high + 1) := (others => '0');
    end if;

    z(x'high downto x'low) := x;

    return z;
  end zero_pad_descending;

  function zero_pad (x : IStdLogicVector; constant h, l : integer)
    return IStdLogicVector is
  begin
    if x'ascending then
      return zero_pad_ascending(x, h, l);
    else
      return zero_pad_descending(x, h, l);
    end if;
  end zero_pad;
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- pad ApInt and ApFloat values
  -----------------------------------------------------------------------------
  function zero_pad (
    x             : ApInt;
    constant h, l : integer)
    return ApInt is
  begin
    return To_ApInt(zero_pad(To_ISLV(x), h, l));
  end zero_pad;
  
  function zero_pad (
    x             : ApFloat;
    constant h, l : integer)
    return ApFloat is
  begin
    return To_ApFloat(zero_pad(To_ISLV(x), h, l));
  end zero_pad;

  function zero_pad (
    x             : std_logic_vector;
    constant h, l : integer)
    return std_logic_vector is
  begin
    return To_SLV(zero_pad(To_ISLV(x), h, l));
  end zero_pad;
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ApFloat( x : float)   return ApFloat is
    variable rv: ApFloat(x'high downto x'low);
  begin
    for I in x'range loop
      rv(I) := x(I);
    end loop;
    return(rv);
  end function To_ApFloat;


  -----------------------------------------------------------------------------
  function To_ApFloat( x : std_logic_vector)   return ApFloat is
    alias lx: std_logic_vector(0 to x'length-1) is x;
    variable rv: ApFloat(0 to x'length-1);
  begin
    for I in lx'range loop
      rv(I) := lx(I);
    end loop;
    return(rv);
  end function To_ApFloat;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ApFloat( x : std_logic_vector;  characteristic, mantissa: integer)   return ApFloat is
    --alias lx: std_logic_vector(characteristic downto mantissa) is x;
    -- will not work because mantissa will be negative
    variable rv: ApFloat(characteristic downto mantissa);
    variable J: integer;
  begin
    assert (x'length = characteristic-mantissa+1)
      report "Length Mismatch in To_ApFloat" severity error;

    J := characteristic;
    for I  in x'range loop
      rv(J) := x(I);
      J := J-1;
    end loop;  -- I
    return(rv);
  end To_ApFloat;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ApFloat( x : ApInt;  characteristic, mantissa: integer)   return ApFloat is
    alias lx: ApInt(characteristic downto mantissa) is x;
    variable rv: ApFloat(characteristic downto mantissa);
  begin
    for I  in lx'range loop
      rv(I) := lx(I);
    end loop;  -- I
    return(rv);
  end To_ApFloat;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ApFloat ( inp : IStdLogicVector) return ApFloat is
    alias linp: IStdLogicVector(inp'high downto inp'low) is inp;
    variable ret_var :ApFloat(inp'high downto inp'low);
  begin
    for I in linp'range loop
      ret_var(I) := linp(I);
    end loop;
    return(ret_var);
  end To_ApFloat;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ApFloat( x : real; characteristic, mantissa : integer)   return ApFloat is
  begin
    return to_apfloat(to_float(x, characteristic, mantissa));
  end function To_ApFloat;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function To_ApFloat( x : integer; characteristic, mantissa : integer)   return ApFloat is
  begin
    return to_apfloat(to_float(x, characteristic, mantissa));
  end function To_ApFloat;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function Extract( x : StdLogicArray2D;  idx : integer) return std_logic_vector is
    variable rv: IStdLogicVector(x'range(2));
  begin
    for I in x'range(2) loop
      rv(I) := x(idx,I);
    end loop;
    return To_SLV(rv);
  end function Extract;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function Extract( x: ApIntArray;  idx: integer) return ApInt is
    variable rv: ApInt(x'range(2));
  begin
    rv := To_ApInt(Extract(To_StdLogicArray2D(x),idx));
    return(rv);
  end function Extract;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function Extract( x: ApFloatArray;  idx: integer) return ApFloat is
    variable rv: ApFloat(x'range(2));
  begin
    rv := To_ApFloat(Extract(To_StdLogicArray2D(x),idx));
    return(rv);
  end function Extract;


  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  procedure Extract(source: in std_logic_vector; index: in integer; target: out std_logic_vector) is
  begin
    target := source(((index+1)*target'length)-1 downto (index*target'length));
  end procedure;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  procedure Insert(target: out std_logic_vector; index: in integer; source: in std_logic_vector) is
  begin
    target(((index+1)*source'length)-1 downto (index*source'length)) := source;
  end procedure;

  
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  procedure Insert(x: out StdLogicArray2D; idx: in integer; w: in std_logic_vector ) is
    alias lw: std_logic_vector(0 to w'length-1) is w;
    variable xI: integer;
  begin
    for I in lw'range loop
      if(x'ascending(2)) then
        xI := x'left(2) + I;
      else
        xI := x'left(2) - I;
      end if;
      x(idx,xI) := lw(I);
    end loop;
  end procedure Insert;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  procedure Insert(x: out ApIntArray; idx: in integer; w: in ApInt ) is
    alias lw: ApInt(0 to w'length-1) is w;
    variable xI: integer;
  begin
    for I in lw'range loop
      if(x'ascending(2)) then
        xI := x'left(2) + I;
      else
        xI := x'left(2) - I;
      end if;
      x(idx,xI) := lw(I);
    end loop;
  end procedure Insert;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  procedure Insert(x: out ApFloatArray; idx: in integer; w: in ApFloat ) is
    alias lw: ApFloat(0 to w'length-1) is w;
    variable xI: integer;
  begin
    for I in lw'range loop
      if(x'ascending(2)) then
        xI := x'left(2) + I;
      else
        xI := x'left(2) - I;
      end if;
      x(idx,xI) := lw(I);
    end loop;
  end procedure Insert;


  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function PriorityEncode(x: BooleanArray) return BooleanArray is
    alias lx  : BooleanArray(1 to x'length) is x;
    variable ret_var  : BooleanArray(1 to x'length);
  begin
    if(lx'length = 1) then
      ret_var(1) := lx(1);
    else
      ret_var := (others => false);
      if(OrReduce(lx(1 to (x'length/2)))) then
        ret_var(1 to (x'length/2)) := PriorityEncode(lx(1 to x'length/2));
      elsif(OrReduce(lx((x'length/2)+1 to x'length))) then
        ret_var((x'length/2)+1 to x'length) := PriorityEncode(lx((x'length/2)+1 to x'length));
      end if;
    end if;
    return(ret_var);
  end PriorityEncode;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function PriorityEncode(x: std_logic_vector) return std_logic_vector is
    alias lx  : std_logic_vector(1 to x'length) is x;
    variable ret_var  : std_logic_vector(1 to x'length);
  begin
    ret_var := (others => '0');
    for I in 1 to lx'length loop
       if(lx(I) = '1') then
           ret_var(I) := '1';
           exit;
       end if;
    end loop; 
    return(ret_var);
  end PriorityEncode;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function OrReduce(x: BooleanArray) return boolean is
    alias lx  : BooleanArray(1 to x'length) is x;
    variable ret_var  : Boolean;
  begin
    if(lx'length = 1) then
      ret_var := lx(1);
    else
      ret_var:= OrReduce(lx(1 to x'length/2)) or OrReduce(lx((x'length/2)+1 to x'length));
    end if;
    return(ret_var);
  end OrReduce;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function OrReduce(x: std_logic_vector) return std_logic is
	alias lx: std_logic_vector(1 to x'length) is x;
	variable ret_var: std_logic;
  begin
        ret_var := '0';	
	for I in 1 to x'length loop
		ret_var := ret_var or lx(I);
	end loop;
	return(ret_var);
  end OrReduce;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function OrReduce(x: unsigned) return std_logic is
	alias lx: unsigned(1 to x'length) is x;
	variable ret_var: std_logic;
  begin
        ret_var := '0';	
	for I in 1 to x'length loop
		ret_var := ret_var or lx(I);
	end loop;
	return(ret_var);
  end OrReduce;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function AndReduce(x: BooleanArray) return boolean is
    alias lx  : BooleanArray(1 to x'length) is x;
    variable ret_var  : Boolean;
  begin
    if(lx'length = 1) then
      ret_var := lx(1);
    else
      ret_var:= AndReduce(lx(1 to x'length/2)) and AndReduce(lx((x'length/2)+1 to x'length));
    end if;
    return(ret_var);
  end AndReduce;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function AndReduce(x: std_logic_vector) return std_logic is
  begin
    return(To_Std_Logic(AndReduce(To_BooleanArray(x))));
  end AndReduce;

  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  function XorReduce(x: std_logic_vector) return std_logic is
    alias lx  : std_logic_vector(1 to x'length) is x;
    variable ret_var  : std_logic;
  begin
    if(lx'length = 1) then
      ret_var := lx(1);
    else
      ret_var:= XorReduce(lx(1 to x'length/2)) xor XorReduce(lx((x'length/2)+1 to x'length));
    end if;
    return(ret_var);
  end XorReduce;

  -----------------------------------------------------------------------------
  -- sel is one-hot coded, build a balanced mux to
  -- pick row indicated by sel from din
  -----------------------------------------------------------------------------
  -- a utility function.
  function MuxOneHotBase (
    constant din  : StdLogicArray2D;
    constant sel  : std_logic_vector;
    constant h, l : integer)
    return std_logic_vector is
    variable ret_val : std_logic_vector(din'length(2)-1 downto 0);
    variable mid_point  : integer;
  begin
    ret_val := (others => '0');
    if(h > l) then
      mid_point := l + ((h-l)/2);
      ret_val := MuxOneHotBase(din,sel,h,mid_point+1) or
                 MuxOneHotBase(din,sel,mid_point,l);
    else
      if(sel(l) = '1') then 
      	ret_val := Extract(din,l);
      end if;
    end if;
    return(ret_val);
  end MuxOneHotBase;


  function MuxOneHot (
      constant din : StdLogicArray2D;     -- input data
      constant sel : std_logic_vector)    -- select vector (one hot)
      return std_logic_vector is
      variable ret_var : std_logic_vector(din'length(2)-1 downto 0);
      variable dinv : StdLogicArray2D(din'length(1)-1 downto 0, din'length(2)-1 downto 0);
      alias selv : std_logic_vector(sel'length-1 downto 0) is sel;
    begin
      dinv := din;
      assert sel'length = din'length(1) report "mismatched select and data dimensions" severity failure;
      ret_var := MuxOneHotBase(dinv,selv,dinv'high(1),dinv'low(1));
      return(ret_var);
    end MuxOneHot;

  function MuxOneHot(x: std_logic_vector; sel: BooleanArray) return std_logic_vector is
	variable ret_var : std_logic_vector(1 to ((x'length)/(sel'length)));
	variable mid_point : integer;
	alias lsel : BooleanArray(1 to sel'length) is sel;
	alias lx : std_logic_vector(1 to x'length) is x;
	constant word_size: integer := x'length/sel'length;
  begin
	assert( word_size*sel'length = x'length)
		report "word size not an integer" severity failure;

        if(sel'length = 1) then
		if(lsel(1)) then
            		ret_var := x;
		else
			ret_var := (others => '0');
		end if;
	else
		mid_point := sel'length/2;
		ret_var :=  MuxOneHot(lx(1 to (mid_point*word_size)), lsel(1 to mid_point)) or
                           MuxOneHot(lx((mid_point*word_size)+1 to x'length), lsel(mid_point+1 to sel'length));
	end if;
	return(ret_var);
  end MuxOneHot;
      
  function Swap_Bytes(x: std_logic_vector) return std_logic_vector is
     alias lx: std_logic_vector(1 to x'length) is x;
     variable ret_var: std_logic_vector(1 to x'length);
     variable J: integer;
     constant num_bytes: integer := (x'length/8);
  begin
     assert((x'length/8)*8 = x'length) report "Swap_Bytes argument length must be a multiple of 8" severity error;
     for I in 0 to num_bytes-1 loop
	J := (num_bytes-1) - I;
	ret_var((I*8)+1 to (I+1)*8) := lx((J*8)+1 to (J+1)*8);
     end loop;  
     return(ret_var);
  end Swap_Bytes;

  -- to be called only if x'length > 1
  function GenericEncode (x: std_logic_vector)
	return std_logic_vector is
      alias lx: std_logic_vector(x'length-1 downto 0) is x;
      variable ret_var: std_logic_vector(Ceil_Log2(x'length)-1 downto 0);
      variable TMP: unsigned(Ceil_Log2(x'length)-1 downto 0);
  begin
      ret_var := (others => '0');
      for I in 1 to x'length loop
	TMP := to_unsigned(I-1, Ceil_Log2(x'length));
        for J in 0 to Ceil_Log2(x'length)-1 loop
           if(TMP(J) = '1') then
             ret_var(J) := ret_var(J) or lx(I-1);
           end if;
        end loop;
      end loop;
      return(ret_var);
  end GenericEncode;

  function GenericDecode(x: std_logic_vector) return std_logic_vector is
     alias lx: std_logic_vector(x'length-1 downto 0) is x;
     variable ret_var: std_logic_vector((2**x'length)-1 downto 0);
     variable I : integer range 0 to (2**x'length)-1;
  begin
     ret_var := (others => '0');
     I := to_integer(to_unsigned(lx));
     ret_var(I) := '1';
     return(ret_var);
  end GenericDecode;
      
end package body Subprograms;

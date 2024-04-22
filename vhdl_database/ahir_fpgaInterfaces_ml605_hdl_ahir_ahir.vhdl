library ieee;
use ieee.std_logic_1164.all;

package Types is

  type ApInt is array(integer range <>) of std_logic;
  type ApIntArray is array(integer range <>, integer range <>) of std_logic;
 
  type ApFloat is array(integer range <>) of std_logic;
  type ApFloatArray is array(integer range <>, integer range <>) of std_logic;
  
  type BooleanArray is array(integer range <>) of boolean;
  type IntegerArray is array(integer range <>) of integer;
  type NaturalArray is array(integer range <>) of natural;

  type StdLogicArray2D is array (integer range <>,integer range <>) of std_logic;
  type IStdLogicVector is array (integer range <>) of std_logic; -- note: integer range

  constant global_debug_flag: boolean := false;

  constant slv_zero: std_logic_vector(0 downto 0) := "0";
  constant sl_zero: std_logic := '0';
  constant slv_one: std_logic_vector(0 downto 0) := "1";
  constant sl_one: std_logic := '1';

  constant loop_pipeline_buffering: integer := 4;
end package Types;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;

package Utilities is

  function Digit_To_Char(val: integer) return character;
  function Convert_To_String(val : integer) return STRING; -- convert val to string.
  function Convert_SLV_To_String(val : std_logic_vector) return STRING; -- convert val to string.
  function Convert_SLV_To_Hex_String(val : std_logic_vector) return STRING; -- convert val to string.  
  function To_Hex_Char (constant val: std_logic_vector)    return character;
  
  function Ceil (constant x, y : integer)   return integer;

  function Ceil_Log2( constant x : integer)  return integer;

  function Max (constant x : NaturalArray)    return natural;
  function Sum (constant x : IntegerArray) return integer;

  function Maximum(x,y: integer)   return integer;
  function Minimum(x,y: integer)   return integer;  
  
  function All_Entries_Same ( x : NaturalArray) return boolean;
  function Is_At_Most_One_Hot(x: BooleanArray) return Boolean;


  function Reverse(x: unsigned) return unsigned;
  procedure TruncateOrPad(signal rhs: in std_logic_vector; signal lhs : out std_logic_vector);
  
end Utilities;


package body Utilities is

  function Digit_To_Char(val: integer) return character is
	variable ret_val : character;
  begin
	case val is
		when 0 => ret_val := '0';
		when 1 => ret_val := '1';
		when 2 => ret_val := '2';
		when 3 => ret_val := '3';
		when 4 => ret_val := '4';
		when 5 => ret_val := '5';
		when 6 => ret_val := '6';
		when 7 => ret_val := '7';
		when 8 => ret_val := '8';
		when 9 => ret_val := '9';
		when others => ret_val := 'X';
	end case;
	return(ret_val);
  end Digit_To_Char;

    -- Thanks to: D. Calvet calvet@hep.saclay.cea.fr
    -- modified to support negative values
  function Convert_To_String(val : integer) return STRING is
	variable result : STRING(12 downto 1) := (others => '0'); -- smallest natural, longest string
	variable pos    : NATURAL := 1;
	variable tmp : integer;
	variable digit  : NATURAL;
	variable is_negative : boolean;
  begin
	tmp := val;
	if val < 0 then
	  tmp := -val;
	end if;
	is_negative := val < 0;
	
	loop
		digit := abs(tmp MOD 10);
	    	tmp := tmp / 10;
	    	result(pos) := Digit_To_Char(digit);
	    	pos := pos + 1;
	    	exit when ((tmp = 0) or (pos = (result'high-1)));
	end loop;
	
	if is_negative then
	  result(pos) := '-';
	  pos := pos + 1;
	end if;
	
	return result((pos-1) downto 1);
  end Convert_To_String;
  
  function Convert_SLV_To_String(val : std_logic_vector) return STRING is
	alias lval: std_logic_vector(1 to val'length) is val;
        variable ret_var: string( 1 to lval'length);
   begin
        for I in lval'range loop
                if(lval(I) = '1') then
			ret_var(I) := '1';
		elsif (lval(I) = '0') then
			ret_var(I) := '0';
		else
			ret_var(I) := 'X';
		end if;
        end loop;
        return(ret_var);
   end Convert_SLV_To_String;
    

  function To_Hex_Char (constant val: std_logic_vector)   return character  is
    alias lval: std_logic_vector(1 to val'length) is val;
    variable tvar : std_logic_vector(1 to 4);
    variable ret_val : character;
  begin
    if(lval'length >= 4) then
      tvar := lval(1 to 4);
    else
      tvar := (others => '0');
      tvar(1 to lval'length) := lval;
    end if;

    case tvar is
      when "0000" => ret_val := '0';
      when "0001" => ret_val := '1';
      when "0010" => ret_val := '2';                     
      when "0011" => ret_val := '3';
      when "0100" => ret_val := '4';
      when "0101" => ret_val := '5';
      when "0110" => ret_val := '6';                     
      when "0111" => ret_val := '7';
      when "1000" => ret_val := '8';
      when "1001" => ret_val := '9';
      when "1010" => ret_val := 'a';                     
      when "1011" => ret_val := 'b';
      when "1100" => ret_val := 'c';
      when "1101" => ret_val := 'd';
      when "1110" => ret_val := 'e';                     
      when "1111" => ret_val := 'f';                                                               
      when others => ret_val := 'f';
    end case;

    return(ret_val);
  end To_Hex_Char;
        
  function Convert_SLV_To_Hex_String(val : std_logic_vector) return STRING is
    alias lval: std_logic_vector(val'length downto 1) is val;
    variable ret_var: string( 1 to Ceil(lval'length,4));
    variable hstr  : std_logic_vector(4 downto 1);
    variable I : integer;
  begin

    I := 0;

    while I < (lval'length/4) loop
      hstr := lval(4*(I+1) downto (4*I)+1);
      ret_var(ret_var'length - I) := To_Hex_Char(hstr);
      I := (I + 1);
    end loop;  -- I

    hstr := (others => '0');
    if(ret_var'length > (lval'length/4)) then
      hstr((lval'length-((lval'length/4)*4)) downto 1) := lval(lval'length downto (4*(lval'length/4))+1);
      ret_var(1) := To_Hex_Char(hstr);
    end if;

    return(ret_var);
  end Convert_SLV_To_Hex_String;
  
  function Ceil (
    constant x, y : integer)
    return integer is
    variable ret_var : integer;
  begin
    ret_var := x/y;
    if((ret_var*y) < x) then
      ret_var := ret_var + 1;
    end if;
    return(ret_var);
  end Ceil;

  function Ceil_Log2
    ( constant x : integer)
    return integer is
    variable ret_var : integer;
  begin
    ret_var := 0;
    if(x > 1) then
      while((2**ret_var) < x) loop
        ret_var := ret_var + 1;
      end loop;
    end if;
    return(ret_var);
  end Ceil_Log2;

  function Max
    (constant x : NaturalArray)
    return natural is
    variable t, max_var : natural;
  begin
    max_var := 0;
    for I in x'low(1) to x'high(1) loop
      t := x(I);
      if( t > max_var) then
        max_var := t;
      end if;
    end loop;  -- I
    return(max_var);
  end function;

  function Sum(constant x : IntegerArray)
    return integer is
    variable ret_var : integer;
  begin
    ret_var := 0;
    for I in x'low(1) to x'high(1) loop
      ret_var := x(I) + ret_var;
    end loop;
    return(ret_var);
  end function;

  function Maximum(x,y: integer)   return integer is
    begin
      if(x > y) then
        return x;
      else
        return y;
      end if;
    end function Maximum;
    
  function Minimum(x,y: integer)   return integer is
    begin
      if(x > y) then
        return y;
      else
        return x;
      end if;
    end function Minimum;
    

  function All_Entries_Same ( x : NaturalArray) return boolean is
    variable ret_var : boolean;
    variable t : natural;
    alias lx : NaturalArray(x'length - 1 downto 0) is x;
  begin
    ret_var := true;
    if(lx'length > 1) then
      t := lx(lx'high);
      for I in lx'high-1 downto lx'low loop
        if(t /= lx(I)) then
          ret_var := false;
          exit;
        end if;
      end loop;  -- I
    end if;
    return(ret_var);
  end All_Entries_Same;

  function Is_At_Most_One_Hot(x: BooleanArray) return Boolean is
    variable ret_var : boolean;
    alias lx : BooleanArray(1 to x'length) is x;
    variable count : integer;
  begin
    count := 0;
    for I  in lx'range loop
      if(lx(I)) then
        count := count + 1;
      end if;
    end loop;  -- I
    if(count > 1) then
      ret_var := false;
    else
      ret_var := true;
    end if;
    return(ret_var);
  end Is_At_Most_One_Hot;


  
  function Reverse(x: unsigned) return unsigned is
	alias lx: unsigned(1 to x'length) is x;
	variable ret_var : unsigned(x'length downto 1);
  begin
	for  I in 1 to x'length loop
		ret_var(I) := lx(I);
	end loop;
	return(ret_var);
  end function Reverse;

  procedure TruncateOrPad(signal rhs: in std_logic_vector; signal lhs : out std_logic_vector) is
	alias arhs : std_logic_vector(rhs'length downto 1) is rhs;
	alias alhs : std_logic_vector(lhs'length downto 1) is lhs;
        constant L : integer := Minimum(rhs'length, lhs'length);
  begin
	alhs(L downto 1) <= arhs(L downto 1);
  end procedure TruncateOrPad;

end Utilities;
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
  function Float_To_SLV( x : float) return std_logic_vector;  
  
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
  function Float_To_SLV (x: float) return std_logic_vector is
    alias lx: float(1 to x'length) is x;
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
  begin
    return(To_SLV(PriorityEncode(To_BooleanArray(x))));
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

end package body Subprograms;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;                  
use aHiR_ieee_proposed.float_pkg.all;


package BaseComponents is

  -----------------------------------------------------------------------------
  -- control path components
  -----------------------------------------------------------------------------
  
  component place
    generic (
      capacity : integer := 1;
      marking : integer := 0;
      name : string);

    port (
      preds : in  BooleanArray;
      succs : in  BooleanArray;
      token : out boolean;
      clk   : in  std_logic;
      reset : in  std_logic); 
  end component;

  component place_with_bypass
    generic (
      capacity : integer := 1;
      marking : integer := 0;
      name : string );

    port (
      preds : in  BooleanArray;
      succs : in  BooleanArray;
      token : out boolean;
      clk   : in  std_logic;
      reset : in  std_logic); 
  end component;

  component transition
    port (
      preds      : in BooleanArray;
      symbol_in  : in boolean;
      symbol_out : out boolean); 
  end component;

  component out_transition
      port (preds      : in   BooleanArray;
              symbol_out : out  boolean);
  end component;

  component level_to_pulse 
    generic (forward_delay: integer; backward_delay: integer);
    port (clk   : in  std_logic;
          reset : in  std_logic;
          lreq: in std_logic;
          lack: out std_logic;
          preq: out boolean;
          pack: in boolean);
  end component;
  
  component control_delay_element 
    generic (delay_value: integer := 0);
    port (
      req   : in Boolean;
      ack   : out Boolean;
      clk   : in  std_logic;
      reset : in  std_logic);
  end component;

  component pipeline_interlock 
    port (trigger: in boolean;
          enable : in boolean;
          symbol_out : out  boolean;
          clk: in std_logic;
          reset: in std_logic);
  end component;

  component join is
     generic(place_capacity : integer := 1;
		bypass: boolean := true;
      		name : string );
     port (preds      : in   BooleanArray;
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
  end component;

  component join2 
    generic (bypass : boolean := true; name: string);
    port ( pred0, pred1      : in   Boolean;
           symbol_out : out  boolean;
           clk: in std_logic;
           reset: in std_logic);
  end component;

  component join3 
    generic (bypass : boolean := true; name: string);
    port ( pred0, pred1, pred2      : in   Boolean;
           symbol_out : out  boolean;
           clk: in std_logic;
           reset: in std_logic);
  end component;

  component join_with_input is
     generic(place_capacity : integer := 1;
		bypass: boolean := false;
      		name : string );
     port (preds      : in   BooleanArray;
    	symbol_in  : in   boolean;
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
  end component;
  
  component  generic_join 
   generic(name: string; place_capacities: IntegerArray; place_markings: IntegerArray; place_delays: IntegerArray);
   port ( preds      : in   BooleanArray;
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
  end component;

  component auto_run 
    generic (use_delay : boolean);
    port (clk   : in  std_logic;
    	reset : in  std_logic;
	start_req: out std_logic;
        start_ack: in std_logic;
        fin_req: out std_logic;
        fin_ack: in std_logic);
  end component;

  component loop_terminator 
      generic (max_iterations_in_flight : integer := 4);
      port(loop_body_exit: in boolean;
       loop_continue: in boolean;
       loop_terminate: in boolean;
       loop_back: out boolean;
       loop_exit: out boolean;
       clk: in std_logic;
       reset: in std_logic);
  end component;
  

  component marked_join is
     generic(place_capacity : integer := 1;
		bypass: boolean := true;
      		name : string := "anon";
		marked_predecessor_bypass: BooleanArray);
     port (preds      : in   BooleanArray;
           marked_preds      : in   BooleanArray;
           symbol_out : out  boolean;
           clk: in std_logic;
           reset: in std_logic);
  end component;

  component marked_join_with_input is
     generic(place_capacity : integer := 1;
		bypass: boolean := false;
      		name : string := "anon");
     port (preds      : in   BooleanArray;
           marked_preds      : in   BooleanArray;
           symbol_in : in boolean;
           symbol_out : out  boolean;
           clk: in std_logic;
           reset: in std_logic);
  end component;

  component phi_sequencer
    generic (place_capacity: integer; nreqs : integer; nenables : integer; name : string := "anonPhiSequencer");
    port (
      selects : in BooleanArray(0 to nreqs-1); -- one out of nreqs..
      reqs : out BooleanArray(0 to nreqs-1); -- one out of nreqs
      ack  : in Boolean;
      enables: in BooleanArray(0 to nenables-1);   -- all need to arrive to reenable
      done : out Boolean;
      clk, reset: in std_logic);
  end component;

  component transition_merge 
      port (preds      : in   BooleanArray;
          symbol_out : out  boolean);
  end component;
  
  
  component access_regulator_base 
    generic (name : string; num_slots: integer := 1);
    port (
      -- the req-ack pair being regulated.
      req   : in Boolean;
      ack   : out Boolean;
      -- the regulated versions of req/ack
      regulated_req : out Boolean;
      regulated_ack : in Boolean;
      -- transitions on the next two will
      -- open up a slot.
      release_req   : in Boolean;
      release_ack   : in Boolean;
      clk   : in  std_logic;
      reset : in  std_logic);
  end component;

  component access_regulator 
    generic (name: string; num_reqs : integer := 1; num_slots: integer := 1);
    port (
      -- the req-ack pair being regulated.
      req   : in BooleanArray(num_reqs-1 downto 0);
      ack   : out BooleanArray(num_reqs-1 downto 0);
      -- the regulated versions of req/ack
      regulated_req : out BooleanArray(num_reqs-1 downto 0);
      regulated_ack : in BooleanArray(num_reqs-1 downto 0);
      -- transitions on the next two will
      -- open up a slot.
      release_req   : in BooleanArray(num_reqs-1 downto 0);
      release_ack   : in BooleanArray(num_reqs-1 downto 0);
      clk   : in  std_logic;
      reset : in  std_logic);
   end component;

  -----------------------------------------------------------------------------
  -- miscellaneous
  -----------------------------------------------------------------------------

  component RigidRepeater
    generic(data_width: integer := 32);
    port(clk: in std_logic;
         reset: in std_logic;
         data_in: in std_logic_vector(data_width-1 downto 0);
         req_in: in std_logic;
         ack_out: out std_logic;
         data_out: out std_logic_vector(data_width-1 downto 0);
         req_out : out std_logic;
         ack_in: in std_logic);
  end component RigidRepeater;
  
  component BypassRegister 
  generic(data_width: integer; enable_bypass: boolean); 
  port (
    clk, reset : in  std_logic;
    enable     : in  std_logic;
    data_in     : in  std_logic_vector(data_width-1 downto 0);
    data_out    : out std_logic_vector(data_width-1 downto 0));
  end component BypassRegister;


  -----------------------------------------------------------------------------
  -- operator base components
  -----------------------------------------------------------------------------
  component GenericCombinationalOperator 
  generic
    (
      operator_id   : string;          -- operator id
      input1_is_int : Boolean := true; -- false means float
      input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      iwidth_1      : integer;    -- width of input1
      input2_is_int : Boolean := true; -- false means float
      input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      iwidth_2      : integer;    -- width of input2
      num_inputs    : integer := 2;    -- can be 1 or 2.
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      owidth        : integer;          -- width of output.
      constant_operand : std_logic_vector; -- constant operand.. (it is always the second operand)
      constant_width: integer;
      use_constant  : boolean := false
      );
  port (
    data_in       : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
    result      : out std_logic_vector(owidth-1 downto 0)
    );
  end component GenericCombinationalOperator;

  component UnsharedOperatorBase 
    generic
      (
        operator_id   : string;          -- operator id
        input1_is_int : Boolean := true; -- false means float
        input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
        input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
        iwidth_1      : integer;    -- width of input1
        input2_is_int : Boolean := true; -- false means float
        input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
        input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
        iwidth_2      : integer;    -- width of input2
        num_inputs    : integer := 2;    -- can be 1 or 2.
        output_is_int : Boolean := true;  -- false means that the output is a float
        output_characteristic_width : integer := 0;
        output_mantissa_width       : integer := 0;
        owidth        : integer;          -- width of output.
        constant_operand : std_logic_vector; -- constant operand.. (it is always the second operand)
        constant_width: integer;
        use_constant  : boolean := false  -- if true, the second operand is
                                          -- assumed to be the generic
        );
    port (
      -- req -> ack follow pulse protocol
      reqL:  in Boolean;
      ackL : out Boolean;
      reqR : in Boolean;
      ackR:  out Boolean;
      -- operands.
      dataL      : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
      dataR      : out std_logic_vector(owidth-1 downto 0);
      clk, reset : in  std_logic);
  end component UnsharedOperatorBase;

  component SplitOperatorBase
    generic
      (
        operator_id   : string;          -- operator id
        input1_is_int : Boolean := true; -- false means float
        input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
        input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
        iwidth_1      : integer;    -- width of input1
        input2_is_int : Boolean := true; -- false means float
        input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
        input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
        iwidth_2      : integer;    -- width of input2
        num_inputs    : integer := 2;    -- can be 1 or 2.
        output_is_int : Boolean := true;  -- false means that the output is a float
        output_characteristic_width : integer := 0;
        output_mantissa_width       : integer := 0;
        owidth        : integer;          -- width of output.
        constant_operand : std_logic_vector; -- constant operand.. (it is always the second operand)
        constant_width: integer;
        twidth        : integer;          -- tag width
        use_constant  : boolean := false  -- if true, the second operand is
                                           -- provided by the generic.
        );
    port (
      -- req/ack follow level protocol
      reqR: out std_logic;
      ackR: in std_logic;
      reqL: in std_logic;
      ackL : out  std_logic;
      -- tagL is passed out to tagR
      tagL       : in  std_logic_vector(twidth-1 downto 0);
      -- input array consists of m sets of 1 or 2 possibly concatenated
      -- operands.
      dataL      : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
      dataR      : out std_logic_vector(owidth-1 downto 0);
      -- tagR is received from tagL, concurrent
      -- with dataR
      tagR       : out std_logic_vector(twidth-1 downto 0);
      clk, reset : in  std_logic);
  end component SplitOperatorBase;


  component SplitOperatorShared
    generic
      (
        name : string;
        operator_id   : string;          -- operator id
        input1_is_int : Boolean := true; -- false means float
        input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
        input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
        iwidth_1      : integer;    -- width of input1
        input2_is_int : Boolean := true; -- false means float
        input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
        input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
        iwidth_2      : integer;    -- width of input2
        num_inputs    : integer := 2;    -- can be 1 or 2.
        output_is_int : Boolean := true;  -- false means that the output is a float
        output_characteristic_width : integer := 0;
        output_mantissa_width       : integer := 0;
        owidth        : integer;          -- width of output.
        constant_operand : std_logic_vector; -- constant operand.. (it is always the second operand)
        constant_width: integer;
        use_constant  : boolean := false;
        no_arbitration: boolean := false;
        min_clock_period: boolean := false;
        num_reqs : integer;  -- how many requesters?
	use_input_buffering: boolean;
        detailed_buffering_per_input: IntegerArray;
        detailed_buffering_per_output: IntegerArray
        );

    port (
      -- req/ack follow level protocol
      reqL                     : in BooleanArray(num_reqs-1 downto 0);
      ackR                     : out BooleanArray(num_reqs-1 downto 0);
      ackL                     : out BooleanArray(num_reqs-1 downto 0);
      reqR                     : in  BooleanArray(num_reqs-1 downto 0);
      -- input data consists of concatenated pairs of ips
      dataL                    : in std_logic_vector(((iwidth_1 + iwidth_2)*num_reqs)-1 downto 0);
      -- output data consists of concatenated pairs of ops.
      dataR                    : out std_logic_vector((owidth*num_reqs)-1 downto 0);
      -- with dataR
      clk, reset              : in std_logic);
  end component SplitOperatorShared;


  component SplitOperatorSharedTB 
    generic
      ( g_num_req: integer := 2;
        operator_id: string := "ApIntSle";
        verbose_mode: boolean := false;
        input_data_width: integer := 8;
        output_data_width: integer := 1;
        num_ips : integer := 2;
        tb_id : string := "anonymous"
        );
  end component SplitOperatorSharedTB;

  -----------------------------------------------------------------------------
  -- register operator
  -----------------------------------------------------------------------------
  component RegisterBase 
      generic(in_data_width: integer; out_data_width : integer);
      port(din: in std_logic_vector(in_data_width-1 downto 0);
           dout: out std_logic_vector(out_data_width-1 downto 0);
           req: in boolean;
           ack: out boolean;
           clk,reset: in std_logic);
  end component RegisterBase;

  -----------------------------------------------------------------------------
  -- queue, fifo, lifo
  -----------------------------------------------------------------------------
  
  component QueueBase 
    generic(name : string := "anon"; queue_depth: integer := 2; data_width: integer := 32);
    port(clk: in std_logic;
         reset: in std_logic;
         data_in: in std_logic_vector(data_width-1 downto 0);
         push_req: in std_logic;
         push_ack: out std_logic;
         data_out: out std_logic_vector(data_width-1 downto 0);
         pop_ack : out std_logic;
         pop_req: in std_logic);
  end component QueueBase;

  component SynchFifo 
    generic(name: string := "anon"; queue_depth: integer := 3; data_width: integer := 72);
    port(clk: in std_logic;
         reset: in std_logic;
         data_in: in std_logic_vector(data_width-1 downto 0);
         push_req: in std_logic;
         push_ack : out std_logic;
         nearly_full: out std_logic;
         data_out: out std_logic_vector(data_width-1 downto 0);
         pop_ack : out std_logic;
         pop_req: in std_logic);
  end component SynchFifo;

  component SynchLifo 
    generic(name : string := "anon"; queue_depth: integer := 3; data_width: integer := 72);
    port(clk: in std_logic;
         reset: in std_logic;
         data_in: in std_logic_vector(data_width-1 downto 0);
         push_req: in std_logic;
         push_ack : out std_logic;
         nearly_full: out std_logic;
         data_out: out std_logic_vector(data_width-1 downto 0);
         pop_ack : out std_logic;
         pop_req: in std_logic);
  end component SynchLifo;
  
  component SynchToAsynchReadInterface 
    generic (
      data_width : integer);
    port (
      clk : in std_logic;
      reset  : in std_logic;
      synch_req : in std_logic;
      synch_ack : out std_logic;
      asynch_req : out std_logic;
      asynch_ack: in std_logic;
      synch_data: in std_logic_vector(data_width-1 downto 0);
      asynch_data : out std_logic_vector(data_width-1 downto 0));
    
  end component SynchToAsynchReadInterface;


  -----------------------------------------------------------------------------
  -- pipe
  -----------------------------------------------------------------------------
  component PipeBase 
    
    generic (name : string;
	     num_reads: integer;
             num_writes: integer;
             data_width: integer;
             lifo_mode: boolean := false;
             depth: integer := 1);
    port (
      read_req       : in  std_logic_vector(num_reads-1 downto 0);
      read_ack       : out std_logic_vector(num_reads-1 downto 0);
      read_data      : out std_logic_vector((num_reads*data_width)-1 downto 0);
      write_req       : in  std_logic_vector(num_writes-1 downto 0);
      write_ack       : out std_logic_vector(num_writes-1 downto 0);
      write_data      : in std_logic_vector((num_writes*data_width)-1 downto 0);
      clk, reset : in  std_logic);
    
  end component PipeBase;


  -----------------------------------------------------------------------------
  -- phi,branch,select
  -----------------------------------------------------------------------------

  component PhiBase 
    generic (
      num_reqs   : integer;
      data_width : integer);
    port (
      req                 : in  BooleanArray(num_reqs-1 downto 0);
      ack                 : out Boolean;
      idata               : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
      odata               : out std_logic_vector(data_width-1 downto 0);
      clk, reset          : in std_logic);
  end component PhiBase;

  
  component PhiPipelined is
    generic (
      name       : string;
      num_reqs   : integer;
      buffering  : integer;
      data_width : integer);
    port (
      sample_req                 : in  BooleanArray(num_reqs-1 downto 0);
      sample_ack                 : out Boolean;
      update_req                 : in Boolean;
      update_ack                 : out Boolean;
      idata                      : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
      odata                      : out std_logic_vector(data_width-1 downto 0);
      clk, reset                 : in std_logic);
  end component;


  component BranchBase
    generic (
      condition_width : integer);
    port (condition: in std_logic_vector(condition_width-1 downto 0);
          clk,reset: in std_logic;
          req: in Boolean;
          ack0: out Boolean;
          ack1: out Boolean);
  end component;

  component SelectBase 
    generic(data_width: integer; flow_through: boolean := false);
    port(x,y: in std_logic_vector(data_width-1 downto 0);
         sel: in std_logic_vector(0 downto 0);
         req: in boolean;
         z: out std_logic_vector(data_width-1 downto 0);
         ack: out boolean;
         clk,reset: in std_logic);
  end component SelectBase;

  component Slicebase 
    generic(in_data_width : integer; high_index: integer; low_index : integer; flow_through : boolean := false);
    port(din: in std_logic_vector(in_data_width-1 downto 0);
         dout: out std_logic_vector(high_index-low_index downto 0);
         req: in boolean;
         ack: out boolean;
         clk,reset: in std_logic);
  end component Slicebase;

  component SliceSplitProtocol is
    generic(name: string; 
	in_data_width : integer; 
	high_index: integer; 
	low_index : integer; 
	buffering : integer;
	flow_through: boolean := false
	);
    port(din: in std_logic_vector(in_data_width-1 downto 0);
       dout: out std_logic_vector(high_index-low_index downto 0);
       sample_req: in boolean;
       sample_ack: out boolean;
       update_req: in boolean;
       update_ack: out boolean;
       clk,reset: in std_logic);
  end component;

  -----------------------------------------------------------------------------
  -- mux/demux
  -----------------------------------------------------------------------------
  
  component InputMuxBase 
    generic ( iwidth: integer;
              owidth: integer;
              twidth: integer;
              nreqs: integer;
              no_arbitration: Boolean;
              registered_output: Boolean);
    port (
      -- req/ack follow pulse protocol
      reqL                 : in  BooleanArray(nreqs-1 downto 0);
      ackL                 : out BooleanArray(nreqs-1 downto 0);
      dataL                : in  std_logic_vector(iwidth-1 downto 0);
      -- output side req/ack level protocol
      reqR                 : out std_logic;
      ackR                 : in  std_logic;
      dataR                : out std_logic_vector(owidth-1 downto 0);
      -- tag specifies the requester index 
      tagR                : out std_logic_vector(twidth-1 downto 0);
      clk, reset          : in std_logic);
  end component InputMuxBase;

  component InputMuxBaseNoData 
    generic ( twidth: integer;
              nreqs: integer;
              no_arbitration: Boolean);
    port (
      -- req/ack follow pulse protocol
      reqL                 : in  BooleanArray(nreqs-1 downto 0);
      ackL                 : out BooleanArray(nreqs-1 downto 0);
      -- output side req/ack level protocol
      reqR                 : out std_logic;
      ackR                 : in  std_logic;
      -- tag specifies the requester index 
      tagR                : out std_logic_vector(twidth-1 downto 0);
      clk, reset          : in std_logic);
  end component InputMuxBaseNoData;



  component OutputDeMuxBaseNoData
    generic(name : string;
	    twidth: integer;
            nreqs: integer;
	    detailed_buffering_per_output: IntegerArray);
    port (
      -- req/ack follow level protocol
      reqL                 : in  std_logic;
      ackL                 : out std_logic;
      -- tag identifies index to which demux
      -- should happen
      tagL                 : in std_logic_vector(twidth-1 downto 0);
      -- reqR/ackR follow pulse protocol
      -- and are of length n
      reqR                : in BooleanArray(nreqs-1 downto 0);
      ackR                : out  BooleanArray(nreqs-1 downto 0);
      clk, reset          : in std_logic);
  end component OutputDeMuxBaseNoData;

  component OutputDeMuxBase
    generic(iwidth: integer;
            owidth: integer;
            twidth: integer;
            nreqs: integer;
            no_arbitration: Boolean;
            pipeline_flag : Boolean := true);
    port (
      -- req/ack follow level protocol
      reqL                 : in  std_logic;
      ackL                 : out std_logic;
      dataL                : in  std_logic_vector(iwidth-1 downto 0);
      -- tag identifies index to which demux
      -- should happen
      tagL                 : in std_logic_vector(twidth-1 downto 0);
      -- reqR/ackR follow pulse protocol
      -- and are of length n
      reqR                : in BooleanArray(nreqs-1 downto 0);
      ackR                : out  BooleanArray(nreqs-1 downto 0);
      -- dataR is array(n,m) 
      dataR               : out std_logic_vector(owidth-1 downto 0);
      clk, reset          : in std_logic);
  end component OutputDeMuxBase;
  

  component OutputDeMuxBaseWithBuffering
    generic(name : string;
            iwidth: integer;
            owidth: integer;
            twidth: integer;
            nreqs : integer;
            detailed_buffering_per_output: IntegerArray);
    port (
      -- req/ack follow level protocol
      reqL                 : in  std_logic;
      ackL                 : out std_logic;
      dataL                : in  std_logic_vector(iwidth-1 downto 0);
      -- tag identifies index to which demux
      -- should happen
      tagL                 : in std_logic_vector(twidth-1 downto 0);
      -- reqR/ackR follow pulse protocol
      -- and are of length n
      reqR                : in BooleanArray(nreqs-1 downto 0);
      ackR                : out  BooleanArray(nreqs-1 downto 0);
      -- dataR is array(n,m) 
      dataR               : out std_logic_vector(owidth-1 downto 0);
      clk, reset          : in std_logic);
  end component OutputDeMuxBaseWithBuffering;
  

  
  -----------------------------------------------------------------------------
  -- call arbiters
  -- there are four forms for the four possibilities of the
  -- called function (in-args+out-args, in-args, out-args, no args)
  -----------------------------------------------------------------------------
  component CallArbiter
    generic(num_reqs: integer;
            call_data_width: integer;
            return_data_width: integer;
            tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
      -- call port connected to the called module
      call_mreq   : out std_logic;
      call_mack   : in  std_logic;
      call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
      call_mtag   : out std_logic_vector(tag_length-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks : out std_logic_vector(num_reqs-1 downto 0);
      return_data : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
      -- return from function
      -- function to assert mreq arbiter to return mack
      -- ( NOTE: It has to be this way, the arbiter should
      -- accept the return value if it has room)
      return_mreq : in std_logic;
      return_mack : out std_logic;
      return_mdata : in  std_logic_vector(return_data_width-1 downto 0);
      return_mtag : in  std_logic_vector(tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiter;

  component CallArbiterNoInargs
    generic(num_reqs: integer;
            return_data_width: integer;
            tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      -- call port connected to the called module
      call_mreq   : out std_logic;
      call_mack   : in  std_logic;
      call_mtag   : out std_logic_vector(tag_length-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks : out std_logic_vector(num_reqs-1 downto 0);
      return_data : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
      -- return from function
      -- function to assert mreq arbiter to return mack
      -- ( NOTE: It has to be this way, the arbiter should
      -- accept the return value if it has room)
      return_mreq : in std_logic;
      return_mack : out std_logic;
      return_mdata : in  std_logic_vector(return_data_width-1 downto 0);
      return_mtag : in  std_logic_vector(tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterNoInargs;

  component CallArbiterNoOutargs
    generic(num_reqs: integer;
            call_data_width: integer;
            tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
      -- call port connected to the called module
      call_mreq   : out std_logic;
      call_mack   : in  std_logic;
      call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
      call_mtag   : out std_logic_vector(tag_length-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks : out std_logic_vector(num_reqs-1 downto 0);
      -- return from function
      -- function to assert mreq arbiter to return mack
      -- ( NOTE: It has to be this way, the arbiter should
      -- accept the return value if it has room)
      return_mreq : in std_logic;
      return_mack : out std_logic;
      return_mtag : in  std_logic_vector(tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterNoOutargs;



  component CallArbiterNoInargsNoOutargs
    generic(num_reqs: integer;
            tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      -- call port connected to the called module
      call_mreq   : out std_logic;
      call_mack   : in  std_logic;
      call_mtag   : out std_logic_vector(tag_length-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks : out std_logic_vector(num_reqs-1 downto 0);
      -- return from function
      -- function to assert mreq arbiter to return mack
      -- ( NOTE: It has to be this way, the arbiter should
      -- accept the return value if it has room)
      return_mreq : in std_logic;
      return_mack : out std_logic;
      return_mtag : in  std_logic_vector(tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterNoInargsNoOutargs;


  component CallArbiterUnitary
    generic(num_reqs: integer;
            call_data_width: integer;
            return_data_width: integer;
            caller_tag_length: integer;
            callee_tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
      call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks   : out std_logic_vector(num_reqs-1 downto 0);
      return_data   : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
      return_tag    : out  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- ports connected to the called module
      call_start   : out std_logic;
      call_fin   : in  std_logic;
      call_in_args  : out std_logic_vector(call_data_width-1 downto 0);
      call_in_tag   : out std_logic_vector(callee_tag_length-1 downto 0);
      -- from the called module
      call_out_args : in  std_logic_vector(return_data_width-1 downto 0);
      call_out_tag : in  std_logic_vector(callee_tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterUnitary;


  component CallArbiterUnitaryNoInargs
    generic(num_reqs: integer;
            return_data_width: integer;
            caller_tag_length: integer;
            callee_tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks   : out std_logic_vector(num_reqs-1 downto 0);
      return_data   : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
      return_tag    : out  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- ports connected to the called module
      call_start   : out std_logic;
      call_fin   : in  std_logic;
      call_in_tag   : out std_logic_vector(callee_tag_length-1 downto 0);
      -- from the called module
      call_out_args : in  std_logic_vector(return_data_width-1 downto 0);
      call_out_tag : in  std_logic_vector(callee_tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterUnitaryNoInargs;

  component CallArbiterUnitaryNoOutargs
    generic(num_reqs: integer;
            call_data_width: integer;
            caller_tag_length: integer;
            callee_tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
      call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks   : out std_logic_vector(num_reqs-1 downto 0);
      return_tag    : out  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- ports connected to the called module
      call_start   : out std_logic;
      call_fin   : in  std_logic;
      call_in_args  : out std_logic_vector(call_data_width-1 downto 0);
      call_in_tag   : out std_logic_vector(callee_tag_length-1 downto 0);
      -- from the called module
      call_out_tag : in  std_logic_vector(callee_tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterUnitaryNoOutargs;


  component CallArbiterUnitaryNoInargsNoOutargs
    generic(num_reqs: integer;
            caller_tag_length: integer;
            callee_tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks   : out std_logic_vector(num_reqs-1 downto 0);
      return_tag    : out  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- ports connected to the called module
      call_start   : out std_logic;
      call_fin   : in  std_logic;
      call_in_tag   : out std_logic_vector(callee_tag_length-1 downto 0);
      -- from the called module
      call_out_tag : in  std_logic_vector(callee_tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterUnitaryNoInargsNoOutargs;

  component CallMediator
    port (
      call_req: in std_logic;
      call_ack: out std_logic;
      enable_call_data: out std_logic;
      return_req: in std_logic;
      return_ack: out std_logic;
      enable_return_data: out std_logic;
      start: out std_logic;
      fin: in std_logic;
      clk: in std_logic;
      reset: in std_logic);
  end component CallMediator;

  -----------------------------------------------------------------------------
  --   NobodyLeftBehind..
  --   this is a small utility which ensures that there is no starvation
  --   in the system.. needs to be used as a filter between reqs and priority
  --   encoding.  currently used in split-call arbiters.
  -----------------------------------------------------------------------------
  component  NobodyLeftBehind 
     generic ( num_reqs : integer := 1);
     port (
       clk,reset : in std_logic;
       reqIn : in std_logic_vector(num_reqs-1 downto 0);
       ackOut: out std_logic_vector(num_reqs-1 downto 0);
       reqOut : out std_logic_vector(num_reqs-1 downto 0);
       ackIn : in std_logic_vector(num_reqs-1 downto 0));
  end component;

  -----------------------------------------------------------------------------
  -- split call arbiters..
  --   Modules will now have a split request-complete handshake
  --   (just like operators)
  -----------------------------------------------------------------------------
  component SplitCallArbiter
    generic(num_reqs: integer;
	  call_data_width: integer;
	  return_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
      call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- call port connected to the called module
      call_mreq   : out std_logic;
      call_mack   : in  std_logic;
      call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
      call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks : out std_logic_vector(num_reqs-1 downto 0);
      return_data : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
      return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- return from function
      return_mreq : out std_logic;
      return_mack : in std_logic;
      return_mdata : in  std_logic_vector(return_data_width-1 downto 0);
      return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component SplitCallArbiter;

  component SplitCallArbiterNoInargs
  generic(num_reqs: integer;
	  return_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    return_data : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
    return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- return from function
    return_mreq : out std_logic;
    return_mack : in std_logic;
    return_mdata : in  std_logic_vector(return_data_width-1 downto 0);
    return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
  end component SplitCallArbiterNoInargs;

  component SplitCallArbiterNoOutargs
    generic(num_reqs: integer;
	  call_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
    call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- return from function
    return_mreq : out std_logic;
    return_mack : in std_logic;
    return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
  end component SplitCallArbiterNoOutargs;



  component SplitCallArbiterNoInargsNoOutargs
    generic(num_reqs: integer;
            caller_tag_length: integer;
            callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- return from function
    return_mreq : out std_logic;
    return_mack : in std_logic;
    return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
  end component SplitCallArbiterNoInargsNoOutargs;


  -----------------------------------------------------------------------------
  -- IO ports
  -----------------------------------------------------------------------------
  component InputPort
    generic (num_reqs: integer;
             data_width: integer;
             no_arbitration: boolean);
    port (
      -- pulse interface with the data-path
      req        : in  BooleanArray(num_reqs-1 downto 0);
      ack        : out BooleanArray(num_reqs-1 downto 0);
      data       : out std_logic_vector((num_reqs*data_width)-1 downto 0);
      -- ready/ready interface with outside world
      oreq       : out std_logic;
      oack       : in  std_logic;
      odata      : in  std_logic_vector(data_width-1 downto 0);
      clk, reset : in  std_logic);
  end component;

  component InputPortNoData
    generic (num_reqs: integer;
             no_arbitration: boolean);
    port (
      -- pulse interface with the data-path
      req        : in  BooleanArray(num_reqs-1 downto 0);
      ack        : out BooleanArray(num_reqs-1 downto 0);
      -- ready/ready interface with outside world
      oreq       : out std_logic;
      oack       : in  std_logic;
      clk, reset : in  std_logic);
  end component;


  component InputPortLevel
    generic (num_reqs: integer; 
             data_width: integer;  
             no_arbitration: boolean);
    port (
      -- ready/ready interface with the requesters
      req       : in  std_logic_vector(num_reqs-1 downto 0);
      ack       : out std_logic_vector(num_reqs-1 downto 0);
      data      : out std_logic_vector((num_reqs*data_width)-1 downto 0);
      -- ready/ready interface with outside world
      oreq       : out std_logic;
      oack       : in  std_logic;
      odata      : in  std_logic_vector(data_width-1 downto 0);
      clk, reset : in  std_logic);
  end component InputPortLevel;


  component InputPortLevelNoData 
    generic (num_reqs: integer; 
             no_arbitration: boolean);
    port (
      -- ready/ready interface with the requesters
      req       : in  std_logic_vector(num_reqs-1 downto 0);
      ack       : out std_logic_vector(num_reqs-1 downto 0);
      -- ready/ready interface with outside world
      oreq       : out std_logic;
      oack       : in  std_logic;
      clk, reset : in  std_logic);
  end component;


  component OutputPort
    generic(num_reqs: integer;
            data_width: integer;
            no_arbitration: boolean);
    port (
      req        : in  BooleanArray(num_reqs-1 downto 0);
      ack        : out BooleanArray(num_reqs-1 downto 0);
      data       : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
      oreq       : out std_logic;
      oack       : in  std_logic;
      odata      : out std_logic_vector(data_width-1 downto 0);
      clk, reset : in  std_logic);
  end component;


  component OutputPortNoData
    generic(num_reqs: integer;
            no_arbitration: boolean);
    port (
      req        : in  BooleanArray(num_reqs-1 downto 0);
      ack        : out BooleanArray(num_reqs-1 downto 0);
      oreq       : out std_logic;
      oack       : in  std_logic;
      clk, reset : in  std_logic);
  end component;
  
  component OutputPortLevel
    generic(num_reqs: integer;
            data_width: integer;
            no_arbitration: boolean);
    port (
      req       : in  std_logic_vector(num_reqs-1 downto 0);
      ack       : out std_logic_vector(num_reqs-1 downto 0);
      data      : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
      oreq       : out std_logic;
      oack       : in  std_logic;
      odata      : out std_logic_vector(data_width-1 downto 0);
      clk, reset : in  std_logic);
  end component;

  component OutputPortLevelNoData 
    generic(num_reqs: integer;
            no_arbitration: boolean);
    port (
      req       : in  std_logic_vector(num_reqs-1 downto 0);
      ack       : out std_logic_vector(num_reqs-1 downto 0);
      oreq       : out std_logic;
      oack       : in  std_logic;
      clk, reset : in  std_logic);
  end component;

  -----------------------------------------------------------------------------
  -- load/store
  -----------------------------------------------------------------------------
  component LoadReqShared
    generic
      (
	addr_width: integer;
      	num_reqs : integer; -- how many requesters?
	tag_length: integer;
	no_arbitration: Boolean;
	time_stamp_width: integer;
        min_clock_period: Boolean
        );
    port (
      -- req/ack follow pulse protocol
      reqL                     : in BooleanArray(num_reqs-1 downto 0);
      ackL                     : out BooleanArray(num_reqs-1 downto 0);
      -- concatenated address corresponding to access
      dataL                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
      -- address to memory
      maddr                   : out std_logic_vector(addr_width-1 downto 0);
      mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);
      mreq                    : out std_logic;
      mack                    : in std_logic;
      -- clock, reset (active high)
      clk, reset              : in std_logic);
  end component LoadReqShared;

  component StoreReqShared
    generic
      (
	addr_width: integer;
	data_width : integer;
	time_stamp_width: integer;
      	num_reqs : integer; -- how many requesters?
	tag_length: integer;
        min_clock_period : boolean;
	no_arbitration: Boolean
        );
    port (
      -- req/ack follow pulse protocol
      reqL                     : in BooleanArray(num_reqs-1 downto 0);
      ackL                     : out BooleanArray(num_reqs-1 downto 0);
      -- address corresponding to access
      addr                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
      data                    : in std_logic_vector((data_width*num_reqs)-1 downto 0);
      -- address to memory
      maddr                   : out std_logic_vector(addr_width-1 downto 0);
      mdata                   : out std_logic_vector(data_width-1 downto 0);
      mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);
      mreq                    : out std_logic;
      mack                    : in std_logic;
      -- clock, reset (active high)
      clk, reset              : in std_logic);
  end component StoreReqShared;


  component LoadCompleteShared
    generic
      (
        name : string;
        data_width: integer;
        tag_length:  integer;
        num_reqs : integer;
        no_arbitration: boolean;
        detailed_buffering_per_output : IntegerArray
        );
    port (
      -- req/ack follow level protocol
      reqR                     : in BooleanArray(num_reqs-1 downto 0);
      ackR                     : out BooleanArray(num_reqs-1 downto 0);
      dataR                    : out std_logic_vector((data_width*num_reqs)-1 downto 0);
      -- output data consists of concatenated pairs of ops.
      mdata                    : in std_logic_vector(data_width-1 downto 0);
      mreq                     : out std_logic;
      mack                     : in  std_logic;
      mtag                     : in std_logic_vector(tag_length-1 downto 0);
      -- with dataR
      clk, reset              : in std_logic);
  end component LoadCompleteShared;

  component StoreCompleteShared
    generic (name: string; 
	     num_reqs: integer;
             tag_length: integer;
	     detailed_buffering_per_output: IntegerArray);
    port (
      -- in requester array, pulse protocol
      -- more than one requester can be active
      -- at any time
      reqR : in BooleanArray(num_reqs-1 downto 0);
      -- out ack array, pulse protocol
      -- more than one ack can be sent back
      -- at any time.
      --
      -- Note: req -> ack delay can be 0
      ackR : out BooleanArray(num_reqs-1 downto 0);
      -- mreq goes out to memory as 
      -- a response to mack.
      mreq : out std_logic;
      mack : in  std_logic;
      -- mtag to distinguish the 
      -- requesters.
      mtag : in std_logic_vector(tag_length-1 downto 0);
      -- rising edge of clock is used
      clk : in std_logic;
      -- synchronous reset, active high
      reset : in std_logic);
  end component StoreCompleteShared;


  -----------------------------------------------------------------------------
  -- protocol translation, priority encoding
  -----------------------------------------------------------------------------
  component Pulse_To_Level_Translate_Entity 
    port( rL : in boolean;
          rR : out std_logic;
          aL : out boolean;
          aR : in std_logic;
          clk : in std_logic;
          reset : in std_logic);
  end component;

  component Request_Priority_Encode_Entity
    generic (num_reqs : integer := 1);
    port (
      clk,reset : in std_logic;
      reqR : in std_logic_vector;
      ackR: out std_logic_vector;
      forward_enable: out std_logic_vector;
      req_s : out std_logic;
      ack_s : in std_logic);
  end component;


  -----------------------------------------------------------------------------
  -- BinaryEncoder: introduced because Xilinx ISE 13.1 barfs on To_Unsigned
  -----------------------------------------------------------------------------
  component BinaryEncoder
    generic (iwidth: integer := 3; owidth: integer := 3);
    port(din: in std_logic_vector(iwidth-1 downto 0);
         dout: out std_logic_vector(owidth-1 downto 0));
  end component;


  -----------------------------------------------------------------------------
  -- floating point operators (pipelined)
  -----------------------------------------------------------------------------
  component GenericFloatingPointAdderSubtractor
    generic (tag_width : integer;
             exponent_width: integer;
             fraction_width : integer;
             round_style : round_type := float_round_style;  -- rounding option
             addguard       : NATURAL := float_guard_bits;  -- number of guard bits
             check_error : BOOLEAN    := float_check_error;  -- check for errors
             denormalize : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP           
             use_as_subtractor: BOOLEAN
      );
    port(
      INA, INB: in std_logic_vector((exponent_width+fraction_width) downto 0);
      OUTADD: out std_logic_vector((exponent_width+fraction_width) downto 0);
      clk,reset: in std_logic;
      tag_in: in std_logic_vector(tag_width-1 downto 0);
      tag_out: out std_logic_vector(tag_width-1 downto 0);
      env_rdy, accept_rdy: in std_logic;
      addi_rdy, addo_rdy: out std_logic);
  end component;

  component GenericFloatingPointMultiplier
    generic (tag_width : integer;
             exponent_width: integer;
             fraction_width : integer;
             round_style : round_type := float_round_style;  -- rounding option
             addguard       : NATURAL := float_guard_bits;  -- number of guard bits
             check_error : BOOLEAN    := float_check_error;  -- check for errors
             denormalize : BOOLEAN    := float_denormalize  -- Use IEEE extended FP           
             );
    port(
      INA, INB: in std_logic_vector((exponent_width+fraction_width) downto 0);
      OUTMUL: out std_logic_vector((exponent_width+fraction_width) downto 0);
      clk,reset: in std_logic;
      tag_in: in std_logic_vector(tag_width-1 downto 0);
      tag_out: out std_logic_vector(tag_width-1 downto 0);
      env_rdy, accept_rdy: in std_logic;
      muli_rdy, mulo_rdy: out std_logic);
  end component;
  
  component SinglePrecisionMultiplier 
    generic (tag_width : integer);
    port(
      INA, INB: in std_logic_vector(31 downto 0);
      OUTM: out std_logic_vector(31 downto 0);
      clk,reset: in std_logic;
      tag_in: in std_logic_vector(tag_width-1 downto 0);
      tag_out: out std_logic_vector(tag_width-1 downto 0);
      NaN, oflow, uflow: out std_logic := '0';
      env_rdy, accept_rdy: in std_logic;
      muli_rdy, mulo_rdy: out std_logic);
  end component;

  component DoublePrecisionMultiplier 
    generic (tag_width : integer);
    port(
      INA, INB: in std_logic_vector(63 downto 0);   
      OUTM: out std_logic_vector(63 downto 0);
      clk,reset: in std_logic;
      tag_in: in std_logic_vector(tag_width-1 downto 0);
      tag_out: out std_logic_vector(tag_width-1 downto 0);
      NaN, oflow, uflow: out std_logic := '0';
      env_rdy, accept_rdy: in std_logic;
      muli_rdy, mulo_rdy: out std_logic);
  end component;

  component PipelinedFPOperator 
    generic (
      name : string;
      operator_id : string;
      exponent_width : integer := 8;
      fraction_width : integer := 23;
      no_arbitration: boolean := true;
      num_reqs : integer := 3; -- how many requesters?
      use_input_buffering: boolean;
      detailed_buffering_per_input : IntegerArray;
      detailed_buffering_per_output : IntegerArray
      );
    port (
      -- req/ack follow level protocol
      reqL                     : in BooleanArray(num_reqs-1 downto 0);
      ackR                     : out BooleanArray(num_reqs-1 downto 0);
      ackL                     : out BooleanArray(num_reqs-1 downto 0);
      reqR                     : in  BooleanArray(num_reqs-1 downto 0);
      -- input data consists of concatenated pairs of ips
      dataL                    : in std_logic_vector((2*(exponent_width+fraction_width+1)*num_reqs)-1 downto 0);
      -- output data consists of concatenated pairs of ops.
      dataR                    : out std_logic_vector(((exponent_width+fraction_width+1)*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset              : in std_logic);
  end component;

  component GenericFloatingPointNormalizer is
    generic (tag_width : integer := 8;
             exponent_width: integer := 11;
             fraction_width : integer := 52;
             round_style : round_type := float_round_style;  -- rounding option
             nguard       : NATURAL := float_guard_bits;  -- number of guard bits
             denormalize : BOOLEAN    := float_denormalize  -- Use IEEE extended FP           
             );
    port(
      fract  :in  unsigned(fraction_width+nguard+1 downto 0);
      expon  :in  signed(exponent_width+1 downto 0);
      sign   :in  std_ulogic;
      sticky :in  std_ulogic;
      tag_in :in  std_logic_vector(tag_width-1 downto 0);
      tag_out:out std_logic_vector(tag_width-1 downto 0);
      in_rdy :in  std_ulogic;
      out_rdy:out std_ulogic;
      stall  :in  std_ulogic;
      clk    :in  std_ulogic;
      reset  :in  std_ulogic;
      normalized_result :out UNRESOLVED_float (exponent_width downto -fraction_width)  -- result
     );
  end component;


  -----------------------------------------------------------------------------
  -- pipelined integer components..
  -----------------------------------------------------------------------------
  component UnsignedMultiplier 
    
    generic (
      tag_width     : integer;
      operand_width : integer;
      chunk_width   : integer := 8);

    port (
      L, R       : in  unsigned(operand_width-1 downto 0);
      RESULT     : out unsigned((2*operand_width)-1 downto 0);
      clk, reset : in  std_logic;
      in_rdy     : in  std_logic;
      out_rdy    : out std_logic;
      stall      : in std_logic;
      tag_in     : in std_logic_vector(tag_width-1 downto 0);
      tag_out    : out std_logic_vector(tag_width-1 downto 0));
  end component;

  component UnsignedShifter 
  
  generic (
    shift_right_flag   : boolean;
    tag_width     : integer;
    operand_width : integer;
    shift_amount_width: integer);

  port (
    L       : in  unsigned(operand_width-1 downto 0);
    R       : in  unsigned(shift_amount_width-1 downto 0);
    RESULT     : out unsigned(operand_width-1 downto 0);
    clk, reset : in  std_logic;
    in_rdy     : in  std_logic;
    out_rdy    : out std_logic;
    stall      : in std_logic;
    tag_in     : in std_logic_vector(tag_width-1 downto 0);
    tag_out    : out std_logic_vector(tag_width-1 downto 0));
   end component;

  component UnsignedAdderSubtractor 
  
  generic (
    tag_width          : integer;
    operand_width      : integer;
    chunk_width        : integer
	);

  port (
    L            : in  unsigned(operand_width-1 downto 0);
    R            : in  unsigned(operand_width-1 downto 0);
    RESULT       : out unsigned(operand_width-1 downto 0);
    subtract_op  : in std_logic;
    clk, reset   : in  std_logic;
    in_rdy       : in  std_logic;
    out_rdy      : out std_logic;
    stall        : in std_logic;
    tag_in       : in std_logic_vector(tag_width-1 downto 0);
    tag_out      : out std_logic_vector(tag_width-1 downto 0));
  end component;



  component GuardInterface is
	generic (nreqs: integer; delay_flag: boolean);
	port (reqL: in BooleanArray(nreqs-1 downto 0);
	      ackL: out BooleanArray(nreqs-1 downto 0); 
	      reqR: out BooleanArray(nreqs-1 downto 0);
	      ackR: in BooleanArray(nreqs-1 downto 0); 
	      guards: in std_logic_vector(nreqs-1 downto 0); 
	      clk: in std_logic; reset: in std_logic);
  end component;

  component SplitGuardInterfaceBase is
	generic (buffering:integer);
	port (sr_in: in Boolean;
	      sa_out: out Boolean;
	      sr_out: out Boolean;
	      sa_in: in Boolean;
	      cr_in: in Boolean;
	      ca_out: out Boolean;
	      cr_out: out Boolean;
	      ca_in: in Boolean;
	      guard_interface: in std_logic;
	      clk: in std_logic;
	      reset: in std_logic);
  end component;

  component SplitGuardInterface is
	generic (nreqs: integer; buffering: IntegerArray; use_guards: BooleanArray);
	port (sr_in: in BooleanArray(nreqs-1 downto 0);
	      sa_out: out BooleanArray(nreqs-1 downto 0); 
	      sr_out: out BooleanArray(nreqs-1 downto 0);
	      sa_in: in BooleanArray(nreqs-1 downto 0); 
	      cr_in: in BooleanArray(nreqs-1 downto 0);
	      ca_out: out BooleanArray(nreqs-1 downto 0); 
	      cr_out: out BooleanArray(nreqs-1 downto 0);
	      ca_in: in BooleanArray(nreqs-1 downto 0); 
	      guards: in std_logic_vector(nreqs-1 downto 0);
	      clk: in std_logic;
	      reset: in std_logic);
  end component;

  
  -----------------------------------------------------------------------------
  -- temporary stuff.
  -----------------------------------------------------------------------------
  component tmpSplitCallArbiter
    generic(num_reqs: integer;
	  call_data_width: integer;
	  return_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
      call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- call port connected to the called module
      call_mreq   : out std_logic;
      call_mack   : in  std_logic;
      call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
      call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks : out std_logic_vector(num_reqs-1 downto 0);
      return_data : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
      return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- return from function
      return_mreq : out std_logic;
      return_mack : in std_logic;
      return_mdata : in  std_logic_vector(return_data_width-1 downto 0);
      return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component tmpSplitCallArbiter;

  component tmpSplitCallArbiterNoOutargs
    generic(num_reqs: integer;
	  call_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
    call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- return from function
    return_mreq : out std_logic;
    return_mack : in std_logic;
    return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
  end component tmpSplitCallArbiterNoOutargs;

  ----------------------------------------------------------------------------------------
  -- components with per-input buffering
  ----------------------------------------------------------------------------------------

  component UnsharedOperatorWithBuffering 
    generic
    (
      name   : string;
      operator_id   : string;          -- operator id
      input1_is_int : Boolean := true; -- false means float
      input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      iwidth_1      : integer;    -- width of input1
      input2_is_int : Boolean := true; -- false means float
      input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      iwidth_2      : integer;    -- width of input2
      num_inputs    : integer := 2;    -- can be 1 or 2.
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      owidth        : integer;          -- width of output.
      constant_operand : std_logic_vector; -- constant operand.. (it is always the second operand)
      constant_width : integer;
      buffering      : integer;
      use_constant  : boolean := false;
      flow_through : boolean := false
      );
    port (
      -- req -> ack follow pulse protocol
      reqL:  in Boolean;
      ackL : out Boolean;
      reqR : in Boolean;
      ackR:  out Boolean;
      -- operands.
      dataL      : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
      dataR      : out std_logic_vector(owidth-1 downto 0);
      clk, reset : in  std_logic);
  end component;

  component BinaryLogicalOperator 
  generic
    (
      name  : string;
      operator_id         : string;            -- operator id
      input_width         : integer;           -- input width
      output_width        : integer;           -- the width of the output.
      input_1_buffer_depth: integer;           -- buffering at input 1.
      input_2_buffer_depth: integer;           -- buffering at input 2.
      output_buffer_depth : integer;           -- buffering at output.
	-- both should never be constants.
      input_1_is_constant : boolean := false;
      input_2_is_constant : boolean := false;
      flow_through : boolean := false
      );
  port (
    -- input operands.
    sample_req : in BooleanArray(1 downto 0);  -- sample reqs, one per input.
    sample_ack : out BooleanArray(1 downto 0); -- sample acks, one per output.
    data_in      : in  std_logic_vector((2*input_width)-1 downto 0);
    -- result.
    update_req : in Boolean;  -- req for output update.
    update_ack : out Boolean; -- ack for output update.
    data_out      : out std_logic_vector(output_width-1 downto 0);
    -- clock, reset.
    clk, reset : in  std_logic);
  end component;


  component BinarySharedOperator is
    generic
    (
      name : string;
      operator_id   : string := "ApIntAdd";          -- operator id
      input_1_is_int : Boolean := true; -- false means float
      input_1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_1_width      : integer := 4;    -- width of input1
      input_1_is_constant : BooleanArray;   -- constant case needs to be handled a bit differently..
      input_2_is_int : Boolean := true; -- false means float
      input_2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input_2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      input_2_width      : integer := 0;    -- width of input2
      input_2_is_constant : BooleanArray;  -- constant case needs to be handled a bit differently..
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer := 4;          -- width of output.
      num_reqs : integer := 3; -- how many requesters?
      input_buffering: integer := 2;
      detailed_buffering_per_output : IntegerArray
    );
  port (
    -- input side.
    sample_req_1                     : in BooleanArray(num_reqs-1 downto 0);
    sample_req_2                     : in BooleanArray(num_reqs-1 downto 0);
    sample_ack_1                     : out BooleanArray(num_reqs-1 downto 0);
    sample_ack_2                     : out BooleanArray(num_reqs-1 downto 0);
    -- output side.
    update_ack                       : out BooleanArray(num_reqs-1 downto 0);
    update_req                       : in  BooleanArray(num_reqs-1 downto 0);
    -- input data consists of concatenated pairs of ips
    data_in_1                    : in std_logic_vector((input_1_width*num_reqs)-1 downto 0);
    data_in_2                    : in std_logic_vector((input_2_width*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    data_out                    : out std_logic_vector((output_width*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset              : in std_logic);
  end component;


  component BinaryUnsharedOperator is
  generic
    (
      name          : string;          -- instance name.
      operator_id   : string;          -- operator id
      input_1_is_int : Boolean := true; -- false means float
      input_1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_1_width        : integer;    -- width of input1
      input_1_is_constant  : boolean;
      input_2_is_int : Boolean := true; -- false means float
      input_2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input_2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      input_2_width        : integer;    -- width of input1
      input_2_is_constant  : boolean;
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer;          -- width of output.
      output_buffering : integer := 2
      );
  port (
    -- req -> ack follow pulse protocol
    sample_req:  in BooleanArray(1 downto 0);
    sample_ack:  out BooleanArray(1 downto 0);
    update_req:  in Boolean;
    update_ack:  out Boolean;
    -- operands.
    dataL      : in  std_logic_vector(input_1_width + input_2_width - 1 downto 0);
    dataR      : out std_logic_vector(output_width-1 downto 0);
    clk, reset : in  std_logic);
  end component;


  component LoadReqSharedWithInputBuffers is
    generic
    (
	name : string;
	addr_width: integer := 8;
      	num_reqs : integer := 1; -- how many requesters?
	tag_length: integer := 1;
	no_arbitration: Boolean := false;
        min_clock_period: Boolean := true;
        input_buffering: IntegerArray;
	time_stamp_width: integer := 0
    );
    port (
    -- req/ack follow pulse protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    -- concatenated address corresponding to access
    dataL                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
    -- address to memory
    maddr                   : out std_logic_vector((addr_width)-1 downto 0);
    mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);

    mreq                    : out std_logic;
    mack                    : in std_logic;
    -- clock, reset (active high)
    clk, reset              : in std_logic);
  end component;

  component SelectSplitProtocol is
    generic(name: string; 
	  data_width: integer; 
	  buffering: integer; 
	  flow_through: boolean := false);
    port(x,y: in std_logic_vector(data_width-1 downto 0);
       sel: in std_logic_vector(0 downto 0);
       z : out std_logic_vector(data_width-1 downto 0);
       sample_req: in boolean;
       sample_ack: out boolean;
       update_req: in boolean;
       update_ack: out boolean;
       clk,reset: in std_logic);
  end component;

  component StoreReqSharedWithInputBuffers
    generic
    (
	name : string;
	addr_width: integer;
	data_width : integer;
	time_stamp_width : integer;
      	num_reqs : integer; -- how many requesters?
	tag_length: integer;
	no_arbitration: Boolean := false;
        min_clock_period: Boolean := true;
        input_buffering: IntegerArray
    );
    port (
    -- req/ack follow pulse protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    -- address corresponding to access
    addr                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
    data                    : in std_logic_vector((data_width*num_reqs)-1 downto 0);
    -- address to memory
    maddr                   : out std_logic_vector(addr_width-1 downto 0);
    mdata                   : out std_logic_vector(data_width-1 downto 0);
    mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);
    mreq                    : out std_logic;
    mack                    : in std_logic;
    -- clock, reset (active high)
    clk, reset              : in std_logic);
  end component;

  component UnarySharedOperator is
    generic
    (
      name : string;
      operator_id   : string := "ApIntNot";          -- operator id
      input_is_int : Boolean := true; -- false means float
      input_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_width      : integer := 4;    -- width of input1
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer := 4;          -- width of output.
      num_reqs : integer := 3; -- how many requesters?
      detailed_buffering_per_output : IntegerArray
    );
  port (
    -- input side.
    sample_req                     : in BooleanArray(num_reqs-1 downto 0);
    sample_ack                     : out BooleanArray(num_reqs-1 downto 0);
    -- output side.
    update_ack                     : out BooleanArray(num_reqs-1 downto 0);
    update_req                     : in  BooleanArray(num_reqs-1 downto 0);
    -- input data consists of concatenated pairs of ips
    data_in                     : in std_logic_vector((input_width*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    data_out                    : out std_logic_vector((output_width*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset                  : in std_logic);
  end component;

  component UnaryUnsharedOperator 
    generic
    (
      name          : string;          -- instance name.
      operator_id   : string;          -- operator id
      input_is_int : Boolean := true; -- false means float
      input_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_width        : integer;    -- width of input1
      input_is_constant  : boolean; 
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer;          -- width of output.
      output_buffering : integer := 2
      );
    port (
    -- req -> ack follow pulse protocol
    sample_req:  in Boolean;
    sample_ack:  out Boolean;
    update_req:  in Boolean;
    update_ack:  out Boolean;
    -- operands.
    dataL      : in  std_logic_vector(input_width - 1 downto 0);
    dataR      : out std_logic_vector(output_width-1 downto 0);
    clk, reset : in  std_logic);
  end component;

  -------------------------------------------------------------------------------------
  -- full-rate versions of I/O ports
  -------------------------------------------------------------------------------------
  component InputPortFullRate 
    generic(name : string;
	   num_reqs: integer;
	   data_width: integer;
           output_buffering: IntegerArray;
	   no_arbitration: boolean := false);
    port (
    -- pulse interface with the data-path
    sample_req        : in  BooleanArray(num_reqs-1 downto 0);
    sample_ack        : out BooleanArray(num_reqs-1 downto 0);
    update_req        : in  BooleanArray(num_reqs-1 downto 0);
    update_ack        : out BooleanArray(num_reqs-1 downto 0);
    data       : out std_logic_vector((num_reqs*data_width)-1 downto 0);
    -- ready/ready interface with outside world
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : in  std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
  end component;

  component OutputPortFullRate 
    generic(name : string;
	  num_reqs: integer;
	  data_width: integer;
	  no_arbitration: boolean := false;
	  input_buffering : IntegerArray);
    port (
    sample_req        : in  BooleanArray(num_reqs-1 downto 0);
    sample_ack        : out BooleanArray(num_reqs-1 downto 0);
    update_req        : in  BooleanArray(num_reqs-1 downto 0);
    update_ack        : out BooleanArray(num_reqs-1 downto 0);
    data       : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : out std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
  end component;

  ---------------------------------------------------------------------------------
  -- some useful miscellaneous stuff
  ---------------------------------------------------------------------------------
  component InputMuxWithBuffering 
    generic (name: string;
	   iwidth: integer := 10;
	   owidth: integer := 10;
	   twidth: integer := 3;
	   nreqs: integer := 1;
	   buffering: IntegerArray;
	   no_arbitration: Boolean := false;
	   registered_output: Boolean := true);
    port (
    -- req/ack follow pulse protocol
    reqL                 : in  BooleanArray(nreqs-1 downto 0);
    ackL                 : out BooleanArray(nreqs-1 downto 0);
    dataL                : in  std_logic_vector(iwidth-1 downto 0);
    -- output side req/ack level protocol
    reqR                 : out std_logic;
    ackR                 : in  std_logic;
    dataR                : out std_logic_vector(owidth-1 downto 0);
    -- tag specifies the requester index 
    tagR                : out std_logic_vector(twidth-1 downto 0);
    clk, reset          : in std_logic);
  end component InputMuxWithBuffering;

  component InterlockBuffer 
    generic (name: string; buffer_size: integer := 2; 
		in_data_width : integer := 32;
		out_data_width : integer := 32;
		flow_through: boolean := false);
    port ( write_req: in boolean;
        write_ack: out boolean;
        write_data: in std_logic_vector(in_data_width-1 downto 0);
        read_req: in boolean;
        read_ack: out boolean;
        read_data: out std_logic_vector(out_data_width-1 downto 0);
        clk : in std_logic;
        reset: in std_logic);
  end component InterlockBuffer;

  component ReceiveBuffer  is
    generic (name: string; buffer_size: integer := 2; data_width : integer := 32; kill_counter_range: integer := 65535);
    port ( write_req: in boolean;
         write_ack: out boolean;
         write_data: in std_logic_vector(data_width-1 downto 0);
         read_req: in std_logic;
         read_ack: out std_logic;
	 kill      : in std_logic;
         read_data: out std_logic_vector(data_width-1 downto 0);
         clk : in std_logic;
         reset: in std_logic);
  end component;

  component PulseToLevel 
   port( rL : in boolean;
        rR : out std_logic;
        aL : out boolean;
        aR : in std_logic;
        clk : in std_logic;
        reset : in std_logic);
  end component;

  component PulseToLevelHalfInterlockBuffer 
    generic (name : string; data_width: integer; buffer_size : integer);
    port( sample_req : in boolean;
        sample_ack : out boolean;
        has_room : out std_logic;
        write_enable : in  std_logic;
        write_data : in std_logic_vector(data_width-1 downto 0);
        update_req : in boolean;
        update_ack : out boolean;
        read_data : out std_logic_vector(data_width-1 downto 0);
        clk : in std_logic;
        reset : in std_logic);
  end component;

  component PulseLevelPulseInterlockBuffer 
  generic (name : string; data_width: integer; buffer_size : integer);
  port( write_req : in boolean;
        write_ack : out boolean;
        write_data : in std_logic_vector(data_width-1 downto 0);
        update_req : in boolean;
        update_ack : out boolean;
        has_data    : out std_logic;
        read_enable : in std_logic;
        read_data : out std_logic_vector(data_width-1 downto 0);
        clk : in std_logic;
        reset : in std_logic);
  end component;


  component LevelMux 
    generic(num_reqs: integer;
	  data_width: integer;
	  no_arbitration: boolean := true);
    port (
    write_req       : in  std_logic_vector(num_reqs-1 downto 0);
    write_ack       : out std_logic_vector(num_reqs-1 downto 0);
    write_data      : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    read_req        : in  std_logic;
    read_ack        : out std_logic;
    read_data       : out std_logic_vector(data_width-1 downto 0);
    clk, reset      : in  std_logic);
  end component;

  component CounterBase generic(data_width : integer);
	port(clk, reset: in std_logic; count_out: out std_logic_vector(data_width-1 downto 0));
  end component;

  component UnloadBuffer 
    generic (name: string; buffer_size: integer := 2; data_width : integer := 32);
    port (write_req: in std_logic;
          write_ack: out std_logic;
          write_data: in std_logic_vector(data_width-1 downto 0);
          unload_req: in boolean;
          unload_ack: out boolean;
          read_data: out std_logic_vector(data_width-1 downto 0);
          clk : in std_logic;
          reset: in std_logic);
  end component UnloadBuffer;

  -----------------------------------------------------------------------------------------
  --  System Ports
  -----------------------------------------------------------------------------------------
  component SystemInPort 
   generic (name : string;
	    num_reads: integer;
	    in_data_width: integer;
            out_data_width : integer); 
   port (read_req : in std_logic_vector(0 downto 0);
         read_ack : out std_logic_vector(0 downto 0);
         read_data: out std_logic_vector(out_data_width-1 downto 0);
         in_data  : in std_logic_vector(in_data_width-1 downto 0);
	 clk : in std_logic;
	 reset : in std_logic);
  end component;

  component SystemOutPort 
   generic (name : string;
	    num_writes: integer;
	    in_data_width: integer;
            out_data_width : integer); 
   port (write_req : in std_logic_vector(0 downto 0);
         write_ack : out std_logic_vector(0 downto 0);
         write_data: in std_logic_vector(in_data_width-1 downto 0);
         out_data  : out std_logic_vector(out_data_width-1 downto 0);
	 clk : in std_logic;
	 reset : in std_logic);
  end component;
 
end BaseComponents;
-- all component declarations necessary for the
-- vhdl generator
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;

package Components is
end Components;
library ieee;	
use ieee.std_logic_1164.all;	
use ieee.numeric_std.all;	
	
library ahir;	
use ahir.Types.all;	
use ahir.Subprograms.all;	
use ahir.Utilities.all;
	
library aHiR_ieee_proposed;	
use aHiR_ieee_proposed.math_utility_pkg.all;	
use aHiR_ieee_proposed.fixed_pkg.all;	
use aHiR_ieee_proposed.float_pkg.all;	

package FloatOperatorPackage is

  -----------------------------------------------------------------------------
  -- use the float type directly
  -----------------------------------------------------------------------------
  procedure ApFloatResize_proc(l: in float;
                               constant exponent_width : in integer;
                               constant fraction_width : in integer;                               
                               result : out std_logic_vector);
  procedure ApFloatAdd_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatSub_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatMul_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOeq_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOne_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOgt_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOge_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOlt_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOle_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatOrd_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUno_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUeq_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUne_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUgt_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUge_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUlt_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatUle_proc(l: in float; r : in float; result : out std_logic_vector);
  procedure ApFloatToApIntSigned_proc(l: in float; result : out std_logic_vector);
  procedure ApFloatToApIntUnsigned_proc(l: in float; result : out std_logic_vector);
  procedure ApIntToApFloatSigned_proc(l: in std_logic_vector;
                                      constant exponent_width : in integer;
                                      constant fraction_width : in integer;
                                      result : out std_logic_vector);
  procedure ApIntToApFloatUnsigned_proc(l: in std_logic_vector;
                                      constant exponent_width : in integer;
                                      constant fraction_width : in integer;                                        
                                      result : out std_logic_vector);

  -- TODO
  -- procedures ApFloatToApIntSigned_Proc, ApFloatToApIntUnsigned_Proc,
  --            ApIntSignedToApFloat_Proc, ApIntUnsignedToApFloat_Proc
  procedure TwoInputFloatArithOperation(constant id    : in string;
		  			x, y : in std_logic_vector;
		  			constant exponent_width : in integer;
		  			constant fraction_width : in integer;
					result : out std_logic_vector);
  procedure TwoInputFloatCompareOperation(constant id    : in string;
                                   	x, y : in std_logic_vector;
                                   	constant exponent_width : in integer;
                                   	constant fraction_width : in integer;
                                   	result : out std_logic_vector);
  procedure SingleInputFloatOperation(constant id : in string;
                                      x : in std_logic_vector;
                                      constant exponent_width : in integer;
                                      constant fraction_width : in integer;
				      constant owidth	      : in integer;                                     
                                      result : out std_logic_vector);
  

end package FloatOperatorPackage;

package body FloatOperatorPackage is

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatResize_proc (l : in float;
                                constant exponent_width : in integer;
                                constant fraction_width : in integer;
                                result : out std_logic_vector) is					
  begin
     result := To_SLV(RESIZE(l,exponent_width, fraction_width ));
  end ApFloatResize_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatAdd_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApFloatAdd_proc" severity error;
     result := To_SLV(l+r);  
  end ApFloatAdd_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatSub_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApFloatSub_proc" severity error;
     result := To_SLV(l-r);  
  end ApFloatSub_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatMul_proc (l : in float; r : in float; result : out std_logic_vector) is
    variable float_result  : float(l'left downto l'right);
  begin
    assert (l'length = r'length)
      report "input operand length mismatch in ApFloatMul_proc" severity error;
    assert (l'length = result'length)						     
      report "input and output operand length mismatch in ApFloatMul_proc" severity error;
    float_result := l*r;  
    result := To_SLV(float_result);  
  end ApFloatMul_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOeq_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(l=r);  
  end ApFloatOeq_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOne_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(l /= r);  
  end ApFloatOne_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOgt_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(l > r);  
  end ApFloatOgt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOge_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(l >= r);  
  end ApFloatOge_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOlt_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(l < r);  
  end ApFloatOlt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOle_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(l <= r); 
  end ApFloatOle_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatOrd_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(not(Unordered (x => l,y => r))); 
  end ApFloatOrd_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUno_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(Unordered (x => l,y => r)); 
  end ApFloatUno_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUeq_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(eq(l => l, r => r, check_error => false) or Unordered (x => l,y => r)); 
  end ApFloatUeq_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUne_proc (l : in float; r : in float; result : out std_logic_vector) is					
  begin
     result :=  To_SLV(ne(l => l, r => r, check_error => false) or Unordered (x => l,y => r));
  end ApFloatUne_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUgt_proc (l : in float; r : in float; result : out std_logic_vector) is					
	variable cr: boolean;
  begin
     cr :=  gt(l => l, r => r, check_error => false) or Unordered (x => l,y => r);
     result :=  To_SLV(cr);
  end ApFloatUgt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUge_proc (l : in float; r : in float; result : out std_logic_vector) is					
	variable cr: boolean;
  begin
     cr :=  ge(l => l, r => r, check_error => false) or Unordered (x => l,y => r);  
     result(result'low) :=  to_std_logic(cr);
  end ApFloatUge_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUlt_proc (l : in float; r : in float; result : out std_logic_vector) is					
	variable cr: boolean;
  begin
     cr :=  lt(l => l, r => r, check_error => false) or Unordered (x => l,y => r); 
     result(result'low) := to_std_logic(cr);
  end ApFloatUlt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatUle_proc (l : in float; r : in float; result : out std_logic_vector) is					
	variable cr: boolean;
  begin
     cr :=  le(l => l, r => r, check_error => false) or Unordered (x => l,y => r);  
     result(result'low) := to_std_logic(cr);
  end ApFloatUle_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatToApIntSigned_proc (l : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(to_signed(l,result'length));
  end ApFloatToApIntSigned_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApFloatToApIntUnsigned_proc (l : in float; result : out std_logic_vector) is					
  begin
     result := To_SLV(to_unsigned(l,result'length));
  end ApFloatToApIntUnsigned_proc; 				

 ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntToApFloatSigned_proc (l : in std_logic_vector;
                                       constant exponent_width : in integer;
                                       constant fraction_width : in integer;
                                       result : out std_logic_vector) is
  begin
   result := To_SLV(to_float(to_signed(l),exponent_width,fraction_width,round_zero));
  end ApIntToApFloatSigned_proc;
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntToApFloatUnsigned_proc (l : in std_logic_vector;
                                         constant exponent_width : in integer;
                                         constant fraction_width : in integer;                                         
                                         result : out std_logic_vector) is
  begin
   result := To_SLV(to_float(to_unsigned(l),exponent_width, fraction_width,round_zero));
  end ApIntToApFloatUnsigned_proc;
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------	
  procedure TwoInputFloatArithOperation(constant id : in string;
                                   x, y : in std_logic_vector;
                                   constant exponent_width : in integer;
                                   constant fraction_width : in integer;
                                   result : out std_logic_vector) is	
    variable result_var : std_logic_vector(exponent_width+fraction_width downto 0);	
    variable temp_int: integer;
  begin
    result_var:= (others => '0');
    if id = "ApFloatAdd" then					
      ApFloatAdd_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatSub" then					
      ApFloatSub_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatMul" then					
      ApFloatMul_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    else	
      assert false report "Unsupported arithmetic float operator-id " & id severity failure;	
    end if;	
    result := result_var;	
  end TwoInputFloatArithOperation;			

  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------	
  procedure TwoInputFloatCompareOperation(constant id : in string;
                                   x, y : in std_logic_vector;
                                   constant exponent_width : in integer;
                                   constant fraction_width : in integer;
                                   result : out std_logic_vector) is	
    variable result_var : std_logic_vector(0 downto 0);
    variable temp_int: integer;
  begin

    assert(result'length = 1) report "comparison result must be a 1-bit integer" severity error;

    result_var:= (others => '0');
    if id = "ApFloatOeq" then					
      ApFloatOeq_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatOne" then					
      ApFloatOne_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatOgt" then					
      ApFloatOgt_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatOge" then					
      ApFloatOge_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatOlt" then					
      ApFloatOlt_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatOle" then					
      ApFloatOle_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatOrd" then					
      ApFloatOrd_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUno" then					
      ApFloatUno_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUeq" then					
      ApFloatUeq_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUne" then					
      ApFloatUne_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUgt" then					
      ApFloatUgt_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUge" then					
      ApFloatUge_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUlt" then					
      ApFloatUlt_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatUle" then					
      ApFloatUle_proc(To_Float(x,exponent_width,fraction_width), To_Float(y,exponent_width,fraction_width), result_var);
    else	
      assert false report "Unsupported float comparison operator-id " & id severity failure;	
    end if;	
    result(result'low) := result_var(0);	
  end TwoInputFloatCompareOperation;			

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------	
  procedure SingleInputFloatOperation(constant id : in string;
                                      x : in std_logic_vector;
                                      constant exponent_width : in integer;
                                      constant fraction_width : in integer;
				      constant owidth 	      : in integer;                                     
                                      result : out std_logic_vector) is	
    variable result_var : std_logic_vector(owidth-1 downto 0);	
  begin
    result_var:= (others => '0');
    if id = "ApFloatToApIntSigned" then					
      ApFloatToApIntSigned_proc(To_Float(x,exponent_width,fraction_width), result_var);
    elsif id = "ApFloatToApIntUnsigned" then					
      ApFloatToApIntUnsigned_proc(To_Float(x,exponent_width,fraction_width), result_var);
    elsif id = "ApIntToApFloatSigned" then					
      ApIntToApFloatSigned_proc(x, exponent_width, fraction_width, result_var);
    elsif id = "ApIntToApFloatUnsigned" then					
      ApIntToApFloatUnsigned_proc(x, exponent_width, fraction_width, result_var);
    else	
      assert false report "Unsupported operator-id " & id severity failure;	
    end if;	
    result := result_var;	
  end SingleInputFloatOperation;	
	
  
	
end package body FloatOperatorPackage;	
library ieee;	
use ieee.std_logic_1164.all;	
use ieee.numeric_std.all;	
	
library ahir;	
use ahir.Types.all;	
use ahir.Subprograms.all;	
use ahir.Utilities.all;
	
package OperatorPackage is

  procedure ApIntNot_proc(l: in std_logic_vector; result : out std_logic_vector);
  procedure ApIntToApIntSigned_proc(l: in std_logic_vector; result : out std_logic_vector);
  procedure ApIntToApIntUnsigned_proc(l: in std_logic_vector; result : out std_logic_vector);
  procedure ApIntAdd_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntSub_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntAnd_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntOr_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntXor_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntMul_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntSHL_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntLSHR_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntASHR_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntEq_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntNe_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntUgt_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntUge_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntUlt_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntUle_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntSgt_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntSge_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntSlt_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);
  procedure ApIntSle_proc(l: in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector);

  -- TODO
  -- procedures ApFloatToApIntSigned_Proc, ApFloatToApIntUnsigned_Proc,
  --            ApIntSignedToApFloat_Proc, ApIntUnsignedToApFloat_Proc

  procedure TwoInputOperation(constant id    : in string; x, y : in std_logic_vector; result : out std_logic_vector);
  procedure SingleInputOperation(constant id : in string; x : in std_logic_vector; result : out std_logic_vector);

end package OperatorPackage;

package body OperatorPackage is

  -----------------------------------------------------------------------------
  procedure ApIntNot_proc (l : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = result'length)						     
      report "Length Mismatch inApIntNot_proc" severity error;
    result := To_SLV(not to_signed(l));
  end ApIntNot_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntToApIntSigned_proc (l : in std_logic_vector; result : out std_logic_vector) is					
  begin
     result := To_SLV(RESIZE(to_signed(l), result'length));
  end ApIntToApIntSigned_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntToApIntUnsigned_proc (l : in std_logic_vector; result : out std_logic_vector) is					
  begin
    result := To_SLV(RESIZE(to_unsigned(l), result'length));
  end ApIntToApIntUnsigned_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntAdd_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntAdd_proc" severity error;
    result := To_SLV(to_signed(l)  + to_signed(r));
  end ApIntAdd_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSub_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntSub_proc" severity error;
    result := To_SLV(to_signed(l)  - to_signed(r));
  end ApIntSub_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntAnd_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntAnd_proc" severity error;
    result := l and r;
  end ApIntAnd_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntOr_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntOr_proc" severity error;
    result := l or r;
  end ApIntOr_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntXor_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntXor_proc" severity error;
    result := l xor r;
  end ApIntXor_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntMul_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    assert (l'length = r'length) and (l'length = result'length)						     
      report "Length Mismatch inApIntMul_proc" severity error;
     result := To_SLV(resize((to_unsigned(l)  * to_unsigned(r)),result'length));
  end ApIntMul_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSHL_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    result := To_SLV(to_unsigned(l) sll to_integer(to_unsigned(Ceil_Log2(l'length)+1, r)));
  end ApIntSHL_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntLSHR_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
     result := To_SLV(to_unsigned(l)  srl to_integer(to_unsigned(Ceil_Log2(l'length)+1, r)));
  end ApIntLSHR_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntASHR_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
     result := To_SLV(shift_right(to_signed(l), to_integer(to_unsigned(Ceil_Log2(l'length)+1,r)))); 
  end ApIntASHR_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntEq_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if l = r then
      result(result'low) := '1';
    else
      result(result'low) := '0';
    end if;
  end ApIntEq_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntNe_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if l = r then
      result(result'low) := '0';
    else
      result(result'low) := '1';
    end if;
  end ApIntNe_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntUgt_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_unsigned(l)  > to_unsigned(r) then
      result(result'low) := '1';
    else
      result(result'low) := '0';
    end if;
  end ApIntUgt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntUge_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin

    if to_unsigned(l)  >= to_unsigned(r) then
      result(result'low) := '1';      
    else
      result(result'low) := '0';
    end if;    

  end ApIntUge_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntUlt_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_unsigned(l)  < to_unsigned(r) then
      result(result'low) := '1';            
    else
      result(result'low) := '0';      
    end if;        

  end ApIntUlt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntUle_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_unsigned(l)  <= to_unsigned(r) then
      result(result'low) := '1';            
    else
      result(result'low) := '0';            
    end if;        
  end ApIntUle_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSgt_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_signed(l)  > to_signed(r) then
      result(result'low) := '1';            
    else
      result(result'low) := '0';                  
    end if;        
  end ApIntSgt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSge_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_signed(l)  >= to_signed(r) then
      result(result'low) := '1';            
    else
      result(result'low) := '0';                  
    end if;        

  end ApIntSge_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSlt_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_signed(l) < to_signed(r) then
      result(result'low) := '1';                        
    else
      result(result'low) := '0';                              
    end if;        

  end ApIntSlt_proc; 				
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure ApIntSle_proc (l : in std_logic_vector; r : in std_logic_vector; result : out std_logic_vector) is					
  begin
    if to_signed(l) <= to_signed(r) then
      result(result'low) := '1';                              
    else
      result(result'low) := '0';                              
    end if;        
    
  end ApIntSle_proc;
  ---------------------------------------------------------------------
  -----------------------------------------------------------------------------
  procedure TwoInputOperation(constant id : in string; x, y : in std_logic_vector; result : out std_logic_vector) is	
    variable result_var : std_logic_vector(result'high downto result'low);	
    variable temp_int: integer;
  begin
    if id = "ApConcat" then
      result_var := x & y;
    elsif id = "ApBitsel" then
      temp_int := To_Integer(To_Unsigned(Ceil_Log2(x'length)+1,y));
      result_var(result_var'low) := x(temp_int);
    elsif id = "ApIntAdd" then					
      ApIntAdd_proc(x,y, result_var);
    elsif id = "ApIntSub" then					
      ApIntSub_proc(x, y, result_var);
    elsif id = "ApIntAnd" then					
      ApIntAnd_proc(x, y, result_var);
    elsif id = "ApIntOr" then					
      ApIntOr_proc(x, y, result_var);
    elsif id = "ApIntXor" then					
      ApIntXor_proc(x, y, result_var);
    elsif id = "ApIntMul" then					
      ApIntMul_proc(x, y, result_var);
    elsif id = "ApIntSHL" then					
      ApIntSHL_proc(x, y, result_var);
    elsif id = "ApIntLSHR" then					
      ApIntLSHR_proc(x, y, result_var);
    elsif id = "ApIntASHR" then					
      ApIntASHR_proc(x, y, result_var);
    elsif id = "ApIntEq" then					
      ApIntEq_proc(x, y, result_var);
    elsif id = "ApIntNe" then					
      ApIntNe_proc(x, y, result_var);
    elsif id = "ApIntUgt" then					
      ApIntUgt_proc(x, y, result_var);
    elsif id = "ApIntUge" then					
      ApIntUge_proc(x, y, result_var);
    elsif id = "ApIntUlt" then					
      ApIntUlt_proc(x, y, result_var);
    elsif id = "ApIntUle" then					
      ApIntUle_proc(x, y, result_var);
    elsif id = "ApIntSgt" then					
      ApIntSgt_proc(x, y, result_var);
    elsif id = "ApIntSge" then					
      ApIntSge_proc(x, y, result_var);
    elsif id = "ApIntSlt" then					
      ApIntSlt_proc(x, y, result_var);
    elsif id = "ApIntSle" then					
      ApIntSle_proc(x, y, result_var);
    else	
      assert false report "Unsupported operator-id " & id severity failure;	
    end if;	
    result := result_var;	
  end TwoInputOperation;			
  -----------------------------------------------------------------------------
	
  -----------------------------------------------------------------------------	
  procedure SingleInputOperation(constant id : in string; x : in std_logic_vector; result : out std_logic_vector) is	
    variable result_var : std_logic_vector(result'high downto result'low);	
  begin
    if id = "ApIntNot" then					
      ApIntNot_proc(x, result_var);
    elsif id = "ApIntToApIntSigned" then					
      ApIntToApIntSigned_proc(x, result_var);
    elsif id = "ApIntToApIntUnsigned" then					
      ApIntToApIntUnsigned_proc(x, result_var);
    else	
      assert false report "Unsupported operator-id " & id severity failure;	
    end if;	
    result := result_var;	
  end SingleInputOperation;	
	
end package body OperatorPackage;	
library ieee;
use ieee.std_logic_1164.all;

package mem_component_pack is
component mem_demux 
  generic ( g_data_width: natural;
            g_id_width : natural;
            g_number_of_outputs: natural;
	    g_delay_count: natural);
  port(data_in: in std_logic_vector(g_data_width-1 downto 0);  -- data & id & time-stamp
       sel_in : in std_logic_vector(g_id_width-1 downto 0);
       req_in: in std_logic;
       ack_out : out std_logic;
       data_out: out std_logic_vector((g_number_of_outputs*g_data_width)-1 downto 0 );
       req_out: out std_logic_vector(g_number_of_outputs-1 downto 0);
       ack_in : in std_logic_vector(g_number_of_outputs-1 downto 0);
       clk: in std_logic;
       reset: in std_logic);
end component;

component mem_repeater 
    generic(g_data_width: natural);
    port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(g_data_width-1 downto 0);
       req_in: in std_logic;
       ack_out : out std_logic;
       data_out: out std_logic_vector(g_data_width-1 downto 0);
       req_out : out std_logic;
       ack_in: in std_logic);
end component mem_repeater;

component mem_shift_repeater
    generic(g_data_width: natural; g_number_of_stages: natural);
    port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(g_data_width-1 downto 0);
       req_in: in std_logic;
       ack_out : out std_logic;
       data_out: out std_logic_vector(g_data_width-1 downto 0);
       req_out : out std_logic;
       ack_in: in std_logic);
end component mem_shift_repeater;


component memory_bank 
   generic (
     g_addr_width: natural;
     g_data_width: natural;
     g_write_tag_width : natural;
     g_read_tag_width : natural;
     g_time_stamp_width: natural;
     g_base_bank_addr_width: natural;
     g_base_bank_data_width: natural
	);
   port (
     clk : in std_logic;
     reset: in std_logic;
     write_data     : in  std_logic_vector(g_data_width-1 downto 0);
     write_addr     : in std_logic_vector(g_addr_width-1 downto 0);
     write_tag      : in std_logic_vector(g_write_tag_width-1 downto 0);
     write_tag_out  : out std_logic_vector(g_write_tag_width-1 downto 0);
     write_enable   : in std_logic;
     write_ack   : out std_logic;
     write_result_accept : in std_logic;
     write_result_ready : out std_logic;
     read_data     : out  std_logic_vector(g_data_width-1 downto 0);
     read_addr     : in std_logic_vector(g_addr_width-1 downto 0);
     read_tag      : in std_logic_vector(g_read_tag_width-1 downto 0);
     read_tag_out  : out std_logic_vector(g_read_tag_width-1 downto 0);
     read_enable   : in std_logic;
     read_ack      : out std_logic;
     read_result_accept: in std_logic;
     read_result_ready: out std_logic
     );
end component memory_bank;

component memory_bank_base 
   generic ( g_addr_width: natural; 
	g_data_width : natural;
        g_base_bank_addr_width: natural;
        g_base_bank_data_width: natural);
   port (data_in : in std_logic_vector(g_data_width-1 downto 0);
         data_out: out std_logic_vector(g_data_width-1 downto 0);
         addr_in: in std_logic_vector(g_addr_width-1 downto 0);
         enable: in std_logic;
         write_bar : in std_logic;
         clk: in std_logic;
         reset : in std_logic
	);
end component memory_bank_base;

component base_bank 
   generic ( g_addr_width: natural; g_data_width : natural);
   port (datain : in std_logic_vector(g_data_width-1 downto 0);
         dataout: out std_logic_vector(g_data_width-1 downto 0);
         addrin: in std_logic_vector(g_addr_width-1 downto 0);
         enable: in std_logic;
         writebar : in std_logic;
         clk: in std_logic;
         reset : in std_logic);
end component base_bank;


component merge_box_with_repeater 
  generic (g_data_width: natural;
           g_number_of_inputs: natural;
           g_number_of_outputs: natural;
           g_time_stamp_width : natural;   -- width of timestamp
           g_tag_width : natural;  -- width of tag
           g_pipeline_flag: integer     -- if 0, dont add pipe-line stage
           );            

  port(data_left: in  std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
       req_in : in std_logic_vector(g_number_of_inputs-1 downto 0);
       ack_out : out std_logic_vector(g_number_of_inputs-1 downto 0);
       data_right: out std_logic_vector((g_data_width*g_number_of_outputs)-1 downto 0);
       req_out : out std_logic_vector(g_number_of_outputs-1 downto 0);
       ack_in : in std_logic_vector(g_number_of_outputs-1 downto 0);
       clock: in std_logic;
       reset: in std_logic);

end component merge_box_with_repeater;


component merge_tree 
  generic (
    g_number_of_inputs: natural;          
    g_data_width: natural;          -- total width of data
                                          -- (= actual-data & timestamp)
    g_time_stamp_width : natural;   -- width of timestamp
    g_tag_width : natural;          -- width of tag
    g_mux_degree :natural;         -- max-indegree of each pipeline-stage
    g_num_stages : natural;
    g_port_id_width: natural
    );       

  port (
    merge_data_in : in std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
    merge_req_in  : in std_logic_vector(g_number_of_inputs-1 downto 0);
    merge_ack_out : out std_logic_vector(g_number_of_inputs-1 downto 0);
    merge_data_out: out std_logic_vector(g_data_width-1 downto 0);
    merge_req_out : out std_logic;
    merge_ack_in  : in std_logic;
    clock: in std_logic;
    reset: in std_logic);
  
end component merge_tree;

component demerge_tree 
  
  generic (
    g_demux_degree: natural;
    g_number_of_outputs: natural;
    g_data_width: natural;              -- total width of data
                                        -- (= data & tag & port-id & timestamp)
    g_id_width: natural;
    g_stage_id: natural
    );       

  port (
    demerge_data_out : out std_logic_vector((g_data_width*g_number_of_outputs)-1 downto 0);
    demerge_ready_out  : out std_logic_vector(g_number_of_outputs-1 downto 0);
    demerge_accept_in   : in std_logic_vector(g_number_of_outputs-1 downto 0);
    demerge_data_in: in std_logic_vector(g_data_width-1 downto 0);
    demerge_ack_out : out std_logic;
    demerge_req_in  : in std_logic;
    demerge_sel_in: in std_logic_vector(g_id_width-1 downto 0);
    clock: in std_logic;
    reset: in std_logic);
  
end component demerge_tree;

component demerge_tree_wrap
  
  generic (
    g_demux_degree: natural;
    g_number_of_outputs: natural;
    g_data_width: natural;              -- total width of data
                                        -- (= data & tag & port-id & timestamp)
    g_id_width: natural;
    g_stage_id: natural
    );       

  port (
    demerge_data_out : out std_logic_vector((g_data_width*g_number_of_outputs)-1 downto 0);
    demerge_ready_out  : out std_logic_vector(g_number_of_outputs-1 downto 0);
    demerge_accept_in   : in std_logic_vector(g_number_of_outputs-1 downto 0);
    demerge_data_in: in std_logic_vector(g_data_width-1 downto 0);
    demerge_ack_out : out std_logic;
    demerge_req_in  : in std_logic;
    demerge_sel_in: in std_logic_vector(g_id_width-1 downto 0);
    clock: in std_logic;
    reset: in std_logic);
  
end component demerge_tree_wrap;

component combinational_merge 
  generic (
    g_data_width       : natural;
    g_number_of_inputs: natural;
    g_time_stamp_width : natural);
  port(
    in_data: in std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
    in_tstamp: in std_logic_vector((g_number_of_inputs*g_time_stamp_width)-1 downto 0);
    out_data: out std_logic_vector(g_data_width-1 downto 0);
    out_tstamp: out std_logic_vector(g_time_stamp_width-1 downto 0);
    in_req: in std_logic_vector(g_number_of_inputs-1 downto 0);
    in_ack: out std_logic_vector(g_number_of_inputs-1 downto 0);
    out_req: out std_logic;
    out_ack: in std_logic);
end component combinational_merge;

component combinational_merge_with_repeater
  generic (
    g_data_width       : natural;
    g_number_of_inputs: natural;
    g_time_stamp_width : natural);
  port(
    clk : in std_logic;
    reset : in std_logic;
    in_data: in std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
    in_tstamp: in std_logic_vector((g_number_of_inputs*g_time_stamp_width)-1 downto 0);
    out_data: out std_logic_vector(g_data_width-1 downto 0);
    out_tstamp: out std_logic_vector(g_time_stamp_width-1 downto 0);
    in_req: in std_logic_vector(g_number_of_inputs-1 downto 0);
    in_ack: out std_logic_vector(g_number_of_inputs-1 downto 0);
    out_req: out std_logic;
    out_ack: in std_logic);
end component combinational_merge_with_repeater;


component memory_subsystem_core
  generic (
    num_loads       : natural;
    num_stores      : natural;
    addr_width      : natural;
    data_width      : natural;
    tag_width       : natural;
    time_stamp_width    : natural;
    number_of_banks : natural;
    mux_degree      : natural;
    demux_degree    : natural;
    base_bank_addr_width: natural;
    base_bank_data_width: natural);
  port (
    lr_addr_in  : in  std_logic_vector((num_loads*addr_width)-1 downto 0);
    lr_req_in   : in  std_logic_vector(num_loads-1 downto 0);
    lr_ack_out  : out std_logic_vector(num_loads-1 downto 0);
    lr_tag_in   : in  std_logic_vector((num_loads*tag_width)-1 downto 0);
    lr_time_stamp_in   : in  std_logic_vector((num_loads*time_stamp_width)-1 downto 0);
    lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);
    lc_req_in   : in  std_logic_vector(num_loads-1 downto 0);
    lc_ack_out  : out std_logic_vector(num_loads-1 downto 0);
    lc_tag_out  : out std_logic_vector((num_loads*tag_width)-1 downto 0);
    sr_addr_in  : in  std_logic_vector((num_stores*addr_width)-1 downto 0);
    sr_data_in  : in  std_logic_vector((num_stores*data_width)-1 downto 0);
    sr_req_in   : in  std_logic_vector(num_stores-1 downto 0);
    sr_ack_out  : out std_logic_vector(num_stores-1 downto 0);
    sr_tag_in   : in  std_logic_vector((num_stores*tag_width)-1 downto 0);
    sr_time_stamp_in   : in  std_logic_vector((num_stores*time_stamp_width)-1 downto 0);
    sc_req_in   : in  std_logic_vector(num_stores-1 downto 0);
    sc_ack_out  : out std_logic_vector(num_stores-1 downto 0);
    sc_tag_out  : out std_logic_vector((num_stores*tag_width)-1 downto 0);
    clock       : in  std_logic;
    reset       : in  std_logic);
end component;

component CombinationalMux is
  generic (
    g_data_width       : integer := 32;
    g_number_of_inputs: integer := 2);
  port(
    in_data: in std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
    out_data: out std_logic_vector(g_data_width-1 downto 0);
    in_req: in std_logic_vector(g_number_of_inputs-1 downto 0);
    in_ack: out std_logic_vector(g_number_of_inputs-1 downto 0);
    out_req: out std_logic;
    out_ack: in std_logic);
end component CombinationalMux;

component PipelinedMux is
  generic (
    g_number_of_inputs: natural;          
    g_data_width: natural;          -- total width of data
                                        -- (= actual-data & tag & port_id)
    g_mux_degree :natural;         -- max-indegree of each pipeline-stage
    g_port_id_width: natural
    );       

  port (
    merge_data_in : in std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
    merge_req_in  : in std_logic_vector(g_number_of_inputs-1 downto 0);
    merge_ack_out : out std_logic_vector(g_number_of_inputs-1 downto 0);
    merge_data_out: out std_logic_vector(g_data_width-1 downto 0);
    merge_req_out : out std_logic;
    merge_ack_in  : in std_logic;
    clock: in std_logic;
    reset: in std_logic);
  
end component PipelinedMux;

component PipelinedMuxStage is 
  generic (g_data_width: integer := 10;
           g_number_of_inputs: integer := 8;
           g_number_of_outputs: integer := 1;
           g_tag_width : integer := 3  -- width of tag
           );            

  port(data_left: in  std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
       req_in : in std_logic_vector(g_number_of_inputs-1 downto 0);
       ack_out : out std_logic_vector(g_number_of_inputs-1 downto 0);
       data_right: out std_logic_vector((g_data_width*g_number_of_outputs)-1 downto 0);
       req_out : out std_logic_vector(g_number_of_outputs-1 downto 0);
       ack_in : in std_logic_vector(g_number_of_outputs-1 downto 0);
       clock: in std_logic;
       reset: in std_logic);

end component PipelinedMuxStage;

component PipelinedDemux is
  generic ( g_data_width: natural := 10;
            g_destination_id_width : natural := 3;
            g_number_of_outputs: natural := 8);
  port(data_in: in std_logic_vector(g_data_width-1 downto 0);  -- data & destination-id 
       sel_in : in std_logic_vector(g_destination_id_width-1 downto 0);
       req_in: in std_logic;
       ack_out : out std_logic;
       data_out: out std_logic_vector((g_number_of_outputs*g_data_width)-1 downto 0 );
       req_out: out std_logic_vector(g_number_of_outputs-1 downto 0);
       ack_in : in std_logic_vector(g_number_of_outputs-1 downto 0);
       clk: in std_logic;
       reset: in std_logic);
end component;

end package mem_component_pack;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
                         
package mem_function_pack is
  function Ceil_Log ( x: natural; base: natural) return natural;
  function Ceil_Log2 ( x: natural) return natural;
  function Ceiling (constant x, y : integer) return integer;
  function IsGreaterThan(x, y: std_logic_vector) return boolean;
  function IncrementSLV(constant x : std_logic_vector) return std_logic_vector;
  function Bank_Match(BANK: natural;
                      log2_number_of_banks: natural;
                      addr_in: std_logic_vector)   return boolean;
  function To_Integer(x: std_logic_vector) return natural;
  function Minimum(x: integer; y: integer) return integer;
  function Maximum(x: integer; y: integer) return integer;
  function Natural_To_SLV (constant val, size : natural) return std_logic_vector;

  function Convert_To_String(val : natural) return STRING; -- convert val to string.
  function Convert_To_String(val : std_logic_vector) return STRING; -- convert signed to string.

end mem_function_pack;

package body mem_function_pack is
  function Ceil_Log ( x: natural; base: natural ) return natural is
    variable ret_var : integer := 0;
    variable tvar : natural;
  begin
    ret_var := 0;
    if(x > 0) then
      tvar := x;
      while(tvar > 1)loop
        tvar := tvar/base;
        ret_var := ret_var + 1;
      end loop;
      if(base**ret_var < x) then ret_var := ret_var + 1; end if;
    end if;
    return(ret_var);
  end function Ceil_Log;

  function Ceil_Log2 ( x: natural) return natural is
  begin
    return(Ceil_Log(x,2));
  end function Ceil_Log2;
    
  -- purpose: ceiling of x/y
  function Ceiling (
    constant x, y : integer)
    return integer is
    variable ratio : integer;
  begin  -- Ceiling
    ratio := x/y;
    if(y*ratio < x) then
      ratio := ratio + 1;
    end if;
    return ratio;
  end Ceiling;

    -- return true if x > y false otherwise
  function IsGreaterThan(x, y: std_logic_vector) return boolean is
    alias lx : std_logic_vector(1 to x'length) is x;
    alias ly : std_logic_vector(1 to x'length) is y;
    variable ret_val, still_equal : boolean;
  begin
    assert lx'length = ly'length report "mismatched lengths in IsGreaterThan" severity error;
    assert lx'length > 2 report "time-stamp length must be > 2 in IsGreaterThan" severity error;

    ret_val := false;
    
    if((lx(1 to 2) = "00" and ly(1 to 2) = "11") or
       (lx(1 to 2) = "01" and ly(1 to 2) = "00") or
       (lx(1 to 2) = "10" and ly(1 to 2) = "01") or
       (lx(1 to 2) = "11" and ly(1 to 2) = "10")) then
      ret_val := true;
    elsif(lx(1 to 2) = ly(1 to 2)) then
      still_equal := true;
      for I in 3 to lx'length loop
        if(still_equal and (lx(I) = '1') and (ly(I) = '0')) then
          ret_val := true;
          still_equal := false;
        elsif(still_equal and (lx(I) = '0' and ly(I) = '1')) then
          still_equal := false;
        end if;
      end loop;  -- I
    end if;
    return(ret_val);
  end function IsGreaterThan;

  function IncrementSLV(constant x : std_logic_vector) return std_logic_vector
  is
    alias lx : std_logic_vector(1 to x'length) is x;
    variable ret_var : std_logic_vector(1 to x'length);
    variable carry_bit, sum_bit : std_logic;
  begin
    carry_bit := '1';
    for I in x'length downto 1 loop
      sum_bit    := carry_bit xor lx(I);
      carry_bit  := carry_bit and lx(I);
      ret_var(I) := sum_bit;
    end loop;
    return(ret_var);
  end function  IncrementSLV;

  function Bank_Match(BANK: natural;
                      log2_number_of_banks: natural;
                      addr_in: std_logic_vector)
    return boolean is
    alias la : std_logic_vector(1 to addr_in'length) is addr_in;
    variable v : unsigned(1 to log2_number_of_banks);
    variable ret_val : boolean;
  begin
    assert addr_in'length > log2_number_of_banks report "inadequate address length in Bank_Match" severity error;
    ret_val := true;
    if(log2_number_of_banks > 0) then
      for I  in 1 to log2_number_of_banks loop
        v(I) := la((addr_in'length - log2_number_of_banks) + I);
      end loop;  -- I
      if(To_Integer(v) = BANK) then
        ret_val := true;
      else
        ret_val := false;
      end if;
    end if;
    return(ret_val);
  end Bank_Match;

  function To_Integer(x: std_logic_vector) return natural is
	alias lx: std_logic_vector(1 to x'length) is x;
	variable ret_var,two_power: natural;
  begin
        two_power := 1; 
        ret_var := 0;
	for I in x'length downto 1 loop
		if(lx(I) = '1') then
			ret_var := ret_var  + two_power;
		end if;
		two_power := 2*two_power;
	end loop;
	return(ret_var);
  end To_Integer;
  
  function Minimum(x: integer; y: integer) return integer is
       variable ret_var: integer;
    begin
       if(x < y) then ret_var := x; else ret_var := y; end if;
       return(ret_var);
  end Minimum; 

  function Maximum(x: integer; y: integer) return integer is
       variable ret_var: integer;
    begin
       if(x > y) then ret_var := x; else ret_var := y; end if;
       return(ret_var);
  end Maximum; 

  function Natural_To_SLV (constant val, size : natural) return std_logic_vector is
    variable ret_var  : std_logic_vector(size-1 downto 0);
    variable uret_var : unsigned(size-1 downto 0);
    variable scale_val : natural;
  begin
    scale_val := val mod (2**size);
    uret_var := TO_UNSIGNED(scale_val,size);
    for I in 0 to size-1 loop
      ret_var(I) := uret_var(I);
    end loop;  -- I
    return(ret_var);
  end Natural_To_SLV;

  function Convert_To_String(val : NATURAL) return STRING is
	variable result : STRING(10 downto 1) := (others => '0'); -- smallest natural, longest string
	variable pos    : NATURAL := 1;
	variable tmp, digit  : NATURAL;
  begin
    -- synopsys translate_off
	tmp := val;
	loop
		digit := abs(tmp MOD 10);
	    	tmp := tmp / 10;
	    	result(pos) := character'val(character'pos('0') + digit);
	    	pos := pos + 1;
	    	exit when tmp = 0;
	end loop;
    -- synopsys translate_on
	return result((pos-1) downto 1);
  end Convert_To_String;

  function Convert_To_String(val : std_logic_vector) return STRING is
        alias lval: std_logic_vector(1 to val'length) is val;
	variable result : STRING(1 to val'length) := (others => '0'); -- smallest natural, longest string
  begin
        for I in 1 to val'length loop
          if(lval(I) = '0') then result(I) := '0'; else result(I) := '1'; end if;
	end loop;
	return result;
  end Convert_To_String;

end mem_function_pack;

library ieee;
use ieee.std_logic_1164.all;

package memory_subsystem_package is

  component memory_subsystem
    generic (
      num_loads       : natural;
      num_stores      : natural;
      addr_width      : natural;
      data_width      : natural;
      tag_width       : natural;
      number_of_banks : natural; -- must be a power of 2!
      mux_degree      : natural;
      demux_degree    : natural;
      base_bank_addr_width: natural;
      base_bank_data_width: natural);
    port (
      lr_addr_in  : in  std_logic_vector((num_loads*addr_width)-1 downto 0);
      lr_req_in   : in  std_logic_vector(num_loads-1 downto 0);
      lr_ack_out  : out std_logic_vector(num_loads-1 downto 0);
      lr_tag_in   : in  std_logic_vector((num_loads*tag_width)-1 downto 0);
      lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);
      lc_req_in   : in  std_logic_vector(num_loads-1 downto 0);
      lc_ack_out  : out std_logic_vector(num_loads-1 downto 0);
      lc_tag_out  : out std_logic_vector((num_loads*tag_width)-1 downto 0);
      sr_addr_in  : in  std_logic_vector((num_stores*addr_width)-1 downto 0);
      sr_data_in  : in  std_logic_vector((num_stores*data_width)-1 downto 0);
      sr_req_in   : in  std_logic_vector(num_stores-1 downto 0);
      sr_ack_out  : out std_logic_vector(num_stores-1 downto 0);
      sr_tag_in   : in  std_logic_vector((num_stores*tag_width)-1 downto 0);
      sc_req_in   : in  std_logic_vector(num_stores-1 downto 0);
      sc_ack_out  : out std_logic_vector(num_stores-1 downto 0);
      sc_tag_out  : out std_logic_vector((num_stores*tag_width)-1 downto 0);
      clock       : in  std_logic;
      reset       : in  std_logic);
  end component;


  component register_bank 
    generic(num_loads             : natural := 5;
            num_stores            : natural := 10;
            addr_width            : natural := 9;
            data_width            : natural := 5;
            tag_width             : natural := 7;
            num_registers         : natural := 1);
    port(
      ------------------------------------------------------------------------------
      -- load request ports
      ------------------------------------------------------------------------------
      lr_addr_in : in std_logic_vector((num_loads*addr_width)-1 downto 0);

      -- req/ack pair:
      -- when both are asserted, time-stamp is set on load request.
      lr_req_in  : in  std_logic_vector(num_loads-1 downto 0);
      lr_ack_out : out std_logic_vector(num_loads-1 downto 0);

      -- tag for request, will be returned on completion.
      lr_tag_in : in std_logic_vector((num_loads*tag_width)-1 downto 0);

      ---------------------------------------------------------------------------
      -- load complete ports
      ---------------------------------------------------------------------------
      lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);

      -- req/ack pair:
      -- when both are asserted, user should latch data_out.
      lc_req_in  : in  std_logic_vector(num_loads-1 downto 0);
      lc_ack_out : out std_logic_vector(num_loads-1 downto 0);

      -- tag of completed request.
      lc_tag_out : out std_logic_vector((num_loads*tag_width)-1 downto 0);

      ------------------------------------------------------------------------------
      -- store request ports
      ------------------------------------------------------------------------------
      sr_addr_in : in std_logic_vector((num_stores*addr_width)-1 downto 0);
      sr_data_in : in std_logic_vector((num_stores*data_width)-1 downto 0);

      -- req/ack pair:
      -- when both are asserted, time-stamp is set on store request.
      sr_req_in  : in  std_logic_vector(num_stores-1 downto 0);
      sr_ack_out : out std_logic_vector(num_stores-1 downto 0);

      -- tag for request, will be returned on completion.
      sr_tag_in : in std_logic_vector((num_stores*tag_width)-1 downto 0);

      ---------------------------------------------------------------------------
      -- store complete ports
      ---------------------------------------------------------------------------
      -- req/ack pair:
      -- when both are asserted, user assumes that store is done.
      sc_req_in  : in  std_logic_vector(num_stores-1 downto 0);
      sc_ack_out : out std_logic_vector(num_stores-1 downto 0);

      -- tag of completed request.
      sc_tag_out : out std_logic_vector((num_stores*tag_width)-1 downto 0);

      ------------------------------------------------------------------------------
      -- clock, reset
      ------------------------------------------------------------------------------
      clock : in std_logic;  -- only rising edge is used to trigger activity.
      reset : in std_logic               -- active high.
      );
  end component register_bank;

  component  dummy_read_only_memory_subsystem 
  generic(num_loads             : natural := 5;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7);
  port(
    ------------------------------------------------------------------------------
    -- load request ports
    ------------------------------------------------------------------------------
    lr_addr_in : in std_logic_vector((num_loads*addr_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on load request.
    lr_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lr_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag for request, will be returned on completion.
    lr_tag_in : in std_logic_vector((num_loads*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- load complete ports
    ---------------------------------------------------------------------------
    lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, user should latch data_out.
    lc_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lc_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag of completed request.
    lc_tag_out : out std_logic_vector((num_loads*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- clock, reset
    ------------------------------------------------------------------------------
    clock : in std_logic;  -- only rising edge is used to trigger activity.
    reset : in std_logic               -- active high.
    );
   end component dummy_read_only_memory_subsystem;

   component dummy_write_only_memory_subsystem is
  	generic( num_stores            : natural := 10;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7);
  	port(
    ------------------------------------------------------------------------------
    -- store request ports
    ------------------------------------------------------------------------------
    sr_addr_in : in std_logic_vector((num_stores*addr_width)-1 downto 0);
    sr_data_in : in std_logic_vector((num_stores*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on store request.
    sr_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sr_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag for request, will be returned on completion.
    sr_tag_in : in std_logic_vector((num_stores*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- store complete ports
    ---------------------------------------------------------------------------
    -- req/ack pair:
    -- when both are asserted, user assumes that store is done.
    sc_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sc_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag of completed request.
    sc_tag_out : out std_logic_vector((num_stores*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- clock, reset
    ------------------------------------------------------------------------------
    clock : in std_logic;  -- only rising edge is used to trigger activity.
    reset : in std_logic               -- active high.
    );
    end component dummy_write_only_memory_subsystem;

component ordered_memory_subsystem is
  generic(num_loads             : natural := 5;
          num_stores            : natural := 10;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7;
          time_stamp_width      : natural := 0;
          number_of_banks       : natural := 1;
          mux_degree            : natural := 10;
          demux_degree          : natural := 10;
	  base_bank_addr_width  : natural := 8;
	  base_bank_data_width  : natural := 8);
  port(
    ------------------------------------------------------------------------------
    -- load request ports
    ------------------------------------------------------------------------------
    lr_addr_in : in std_logic_vector((num_loads*addr_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on load request.
    lr_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lr_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag + timestamp: tag will be returned on completion..
    lr_tag_in : in std_logic_vector((num_loads*(tag_width+time_stamp_width))-1 downto 0);

    ---------------------------------------------------------------------------
    -- load complete ports
    ---------------------------------------------------------------------------
    lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, user should latch data_out.
    lc_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lc_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag of completed request.
    lc_tag_out : out std_logic_vector((num_loads*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- store request ports
    ------------------------------------------------------------------------------
    sr_addr_in : in std_logic_vector((num_stores*addr_width)-1 downto 0);
    sr_data_in : in std_logic_vector((num_stores*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on store request.
    sr_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sr_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag for request, will be returned on completion.
    sr_tag_in : in std_logic_vector((num_stores*(tag_width+time_stamp_width))-1 downto 0);

    ---------------------------------------------------------------------------
    -- store complete ports
    ---------------------------------------------------------------------------
    -- req/ack pair:
    -- when both are asserted, user assumes that store is done.
    sc_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sc_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag of completed request.
    sc_tag_out : out std_logic_vector((num_stores*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- clock, reset
    ------------------------------------------------------------------------------
    clock : in std_logic;  -- only rising edge is used to trigger activity.
    reset : in std_logic               -- active high.
    );
end component ordered_memory_subsystem;

component UnorderedMemorySubsystem is
  generic(num_loads             : natural := 5;
          num_stores            : natural := 10;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7;
          -- number_of_banks       : natural := 1; (will always be 1 in this memory)
          mux_degree            : natural := 10;
          demux_degree          : natural := 10;
	  base_bank_addr_width  : natural := 8;
	  base_bank_data_width  : natural := 8);
  port(
    ------------------------------------------------------------------------------
    -- load request ports
    ------------------------------------------------------------------------------
    lr_addr_in : in std_logic_vector((num_loads*addr_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on load request.
    lr_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lr_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag for request, will be returned on completion.
    lr_tag_in : in std_logic_vector((num_loads*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- load complete ports
    ---------------------------------------------------------------------------
    lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, user should latch data_out.
    lc_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lc_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag of completed request.
    lc_tag_out : out std_logic_vector((num_loads*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- store request ports
    ------------------------------------------------------------------------------
    sr_addr_in : in std_logic_vector((num_stores*addr_width)-1 downto 0);
    sr_data_in : in std_logic_vector((num_stores*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on store request.
    sr_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sr_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag for request, will be returned on completion.
    sr_tag_in : in std_logic_vector((num_stores*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- store complete ports
    ---------------------------------------------------------------------------
    -- req/ack pair:
    -- when both are asserted, user assumes that store is done.
    sc_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sc_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag of completed request.
    sc_tag_out : out std_logic_vector((num_stores*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- clock, reset
    ------------------------------------------------------------------------------
    clock : in std_logic;  -- only rising edge is used to trigger activity.
    reset : in std_logic               -- active high.
    );
end component UnorderedMemorySubsystem;


end memory_subsystem_package;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;

package merge_functions is
  type NaturalArray is array (natural range <>) of natural;

  function Total_Intermediate_Width(constant x,y: natural) return natural;
  function Stage_Width (
    constant stage_id     : natural;
    constant mux_degree : natural;
    constant stage0_width : natural)
    return natural;
  function Left_Index (
    constant stage_id     : natural;
    constant mux_degree : natural;
    constant stage0_width : natural)
    return natural;
  function Right_Index (
    constant stage_id     : natural;
    constant mux_degree : natural;
    constant stage0_width : natural)
    return natural;
  
  --constant c_group_left_id : NaturalArray(0 to c_demux_degree-1) := Calculate_Group_Left_Ids(g_number_of_outputs,c_demux_degree);
  function Calculate_Group_Left_Ids (
    constant xwid : natural;
    constant x : natural;
    constant y : natural)
    return NaturalArray;
  
  --constant c_group_right_id : NaturalArray(0 to c_demux_degree-1) := Calculate_Group_Left_Ids(g_number_of_outputs,c_demux_degree);
  function Calculate_Group_Right_Ids (
    constant xwid : natural;
    constant x : natural;
    constant y : natural)
    return NaturalArray;
  
  --constant c_group_sizes : NaturalArray(0 to c_demux_degree-1) := Calculate_Group_Sizes(g_number_of_outputs,c_demux_degree);
  function Calculate_Group_Sizes (
    constant xwid : natural;
    constant x : natural;
    constant y : natural)
    return NaturalArray;

  function Nonzero_Count (
    constant x : NaturalArray)
    return natural;

  procedure Select_Best_Index(time_stamp_vector : in std_logic_vector;
                              data_vector: in std_logic_vector;
			      valid_vector      : in std_logic_vector;
			      best_time_stamp   : out std_logic_vector;
                              best_data : out std_logic_vector;
                              sel_vector: out std_logic_vector;
                              valid_flag: out std_logic);
end merge_functions;

package body merge_functions is

  function Total_Intermediate_Width(constant x,y: natural)
    return natural is
    variable ret_val,tval : natural;
  begin
    ret_val := x;
    tval := x;
    
    while tval > 1 loop
      tval := Ceiling(tval,y);
      ret_val := ret_val + tval;
    end loop;  -- I

    -- for the output.
    ret_val := ret_val + 1;
    return(ret_val);
  end function Total_Intermediate_Width;

  function Stage_Width (
    constant stage_id     : natural;
    constant mux_degree : natural;
    constant stage0_width : natural)
    return natural is
    variable ret_var,tval : natural;
  begin  -- Stage_Width
    ret_var := stage0_width;
    tval := mux_degree;
    if(stage_id > 0) then
      for I  in 1 to stage_id loop
        ret_var := Ceiling(ret_var,tval);
      end loop;  -- I
    end if;
    return(ret_var);
  end Stage_Width;
  
  -- index in intermediate array from which input to stage_id begins
  function Left_Index (
    constant stage_id     : natural;
    constant mux_degree : natural;
    constant stage0_width : natural)
    return natural is
    variable ret_var,offset,tval : natural;
  begin  
    if(stage_id = 0) then
      ret_var := 0;
    else
      ret_var := Right_Index(stage_id-1,mux_degree,stage0_width) + 1;
    end if;
    return(ret_var);
  end Left_Index;

  function Right_Index (
    constant stage_id     : natural;
    constant mux_degree : natural;
    constant stage0_width : natural)
    return natural is
    variable ret_var: natural;
  begin  
    ret_var := Left_Index(stage_id,mux_degree,stage0_width)  +
               Stage_Width(stage_id,mux_degree,stage0_width) - 1;
    return(ret_var);
  end Right_Index;

  function Calculate_Group_Left_Ids (
    constant xwid : natural;
    constant x : natural;
    constant y : natural)
    return NaturalArray is
    variable ret_var  : NaturalArray(0 to y-1);

    constant ysize : natural := Ceil_Log2(y);
    constant xsize : natural := Maximum(xwid,ysize);    

    variable index : natural;
    variable xbin: std_logic_vector(xsize-1 downto 0);
    variable ybin : std_logic_vector(ysize-1 downto 0);
  begin
--    assert false report "left-id called " & Convert_To_String(xwid) & " " &
--		Convert_To_String(x) & " " & Convert_To_String(y) severity note;
    ret_var := (others => x);
    if(xsize >= ysize) then
      for I in x-1 downto 0 loop
        xbin := Natural_To_SLV(I,xsize);
        ybin := xbin(xsize-1 downto xsize-ysize);
        index := To_Integer(ybin);
        if(ret_var(index) = x) then
          ret_var(index) := I;
        end if;
      end loop;  -- I
    end if;
--    for I in 0 to y-1 loop
--      assert false report "group-left-id " & Convert_To_String(ret_var(I)) severity note;
--    end loop;
    return(ret_var);
  end Calculate_Group_Left_Ids;
  

  function Calculate_Group_Right_Ids (
    constant xwid : natural;
    constant x : natural;
    constant y : natural)
    return NaturalArray is
    variable ret_var  : NaturalArray(0 to y-1);

    constant ysize : natural := Ceil_Log2(y);
    constant xsize : natural := Maximum(xwid,ysize);    

    variable index : natural;
    variable xbin: std_logic_vector(xsize-1 downto 0);
    variable ybin : std_logic_vector(ysize-1 downto 0);
  begin
--    assert false report "right-id called " & Convert_To_String(xwid) & " " &
--		Convert_To_String(x) & " " & Convert_To_String(y) severity note;
    ret_var := (others => x);
    if(xsize >= ysize) then
      for I in 0 to x-1 loop
        xbin := Natural_To_SLV(I,xsize);
        ybin := xbin(xsize-1 downto xsize-ysize);
        index := To_Integer(ybin);
        if(ret_var(index) = x) then
          ret_var(index) := I;
        end if;
      end loop;  -- I
    end if;
--    for I in 0 to y-1 loop
--      assert false report "group-right-id " & Convert_To_String(ret_var(I)) severity note;
--    end loop;
    return(ret_var);
  end Calculate_Group_Right_Ids;


  function Calculate_Group_Sizes (
    constant xwid : natural;
    constant x : natural;
    constant y : natural)
    return NaturalArray is
    variable ret_var  : NaturalArray(0 to y-1);

    constant ysize : natural := Ceil_Log2(y);
    constant xsize : natural := Maximum(xwid,ysize);

    variable index : natural;
    variable xbin: std_logic_vector(xsize-1 downto 0);
    variable ybin : std_logic_vector(ysize-1 downto 0);
  begin
--    assert false report "group-sizes called " & Convert_To_String(xwid) & " " &
--		Convert_To_String(x) & " " & Convert_To_String(y) severity note;
    ret_var := (others => 0);
    if(xsize >= ysize) then 
      for I in x-1 downto 0 loop
        xbin := Natural_To_SLV(I,xsize);
        ybin := xbin(xsize-1 downto xsize-ysize);
        index := To_Integer(ybin);
        ret_var(index) := ret_var(index) + 1;
      end loop;  -- I
    end if;
--    for I in 0 to y-1 loop
--      assert false report "group-size " & Convert_To_String(ret_var(I)) severity note;
--    end loop;
    return(ret_var);
  end Calculate_Group_Sizes;

  function Nonzero_Count (
    constant x : NaturalArray)
    return natural is
    variable ret_var : natural;
    alias lx : NaturalArray(1 to x'length) is x;
  begin
    ret_var := 0;
    for I in 1 to x'length loop
      if(lx(I) > 0) then
        ret_var := ret_var + 1;
      end if;
    end loop;  -- I
--    assert false report "non-zero-count " & Convert_To_String(ret_var) severity note;
    return(ret_var);
  end Nonzero_Count;
    
  procedure Select_Best_Index(time_stamp_vector : in std_logic_vector;
                              data_vector: in std_logic_vector;
			      valid_vector      : in std_logic_vector;
			      best_time_stamp   : out std_logic_vector;
                              best_data : out std_logic_vector;
                              sel_vector: out std_logic_vector;
                              valid_flag: out std_logic)
  is
	constant mid_point: integer := valid_vector'length / 2;
        constant time_stamp_width : integer := best_time_stamp'length;
        constant data_width : integer := best_data'length;
        
        alias ltv: std_logic_vector(1 to time_stamp_vector'length) is time_stamp_vector;
        alias ld: std_logic_vector(1 to data_vector'length) is data_vector;
	alias lv: std_logic_vector(1 to valid_vector'length) is valid_vector;

	variable uindex, hindex: integer;
	variable ubest, hbest: std_logic_vector(1 to time_stamp_width);
        variable ud, hd: std_logic_vector(1 to data_width);
        variable sv : std_logic_vector(1 to lv'length) ;
        variable uvalid,hvalid : std_logic;
  begin
        sv := (others => '0');
        valid_flag := '0';
	best_time_stamp := ltv(1 to time_stamp_width);
        best_data := ld(1 to data_width);

	if(valid_vector'length = 1) then
		if(lv(1) = '1') then
                        sv(1) := '1';
                        valid_flag := '1';
		end if;	
	elsif(valid_vector'length = 2) then
		if(lv(1) = '1' and lv(2) = '1') then
			if(IsGreaterThan(ltv(1 to time_stamp_width),ltv(time_stamp_width+1 to (2*time_stamp_width)))) then
				best_time_stamp := ltv(time_stamp_width+1 to 2*time_stamp_width);
                                best_data := ld(data_width+1 to 2*data_width);
                                sv(2) := '1';
			else
                                sv(1) := '1';
			end if;
                        valid_flag := '1';
		elsif(lv(1) = '1') then
                        sv(1) := '1';
                        valid_flag := '1';
		elsif(lv(2) = '1') then
			best_time_stamp := ltv(time_stamp_width+1 to 2*time_stamp_width);
                        best_data := ld(data_width+1 to 2*data_width);
                        sv(2) := '1';
                        valid_flag := '1';
		end if;
	else
		Select_Best_Index(ltv(1 to mid_point*time_stamp_width),
                                  ld(1 to mid_point*data_width),
                                  lv(1 to mid_point),
                                  ubest,
                                  ud,
                                  sv(1 to mid_point),
                                  uvalid);
                
		Select_Best_Index(ltv((mid_point*time_stamp_width)+1 to ltv'length),
                                  ld((mid_point*data_width)+1 to ld'length),
                                  lv(mid_point+1 to lv'length),
                                  hbest,
                                  hd,
                                  sv(mid_point+1 to sv'length),
                                  hvalid);
                
		if(uvalid = '1' and hvalid = '1') then
			if(IsGreaterThan(hbest,ubest)) then
				best_time_stamp := ubest;
                                best_data := ud;
                                sv(mid_point + 1 to sv'length) := (others => '0');
			else
				best_time_stamp := hbest;
                                best_data := hd;
                                sv(1 to mid_point) := (others => '0');
			end if;
                        valid_flag := '1';
		elsif (hvalid = '1' ) then
			best_time_stamp := hbest;
                        best_data := hd;
                        sv(1 to mid_point) := (others => '0');
                        valid_flag := '1';
		elsif(uvalid = '1') then
			best_time_stamp := ubest;
                        best_data := ud;
                        sv(mid_point + 1 to sv'length) := (others => '0');
                        valid_flag := '1';
		end if;
	end if;
        sel_vector := sv;
  end Select_Best_Index;
end merge_functions;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;                  
use aHiR_ieee_proposed.float_pkg.all;


package functionLibraryComponents is

component fpadd32 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(31 downto 0);
      R : in  std_logic_vector(31 downto 0);
      ret_val_x_x : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end component fpadd32;

component fpmul32 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(31 downto 0);
      R : in  std_logic_vector(31 downto 0);
      ret_val_x_x : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end component fpmul32;

component fpsub32 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(31 downto 0);
      R : in  std_logic_vector(31 downto 0);
      ret_val_x_x : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end component fpsub32;

component fpu32 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(31 downto 0);
      R : in  std_logic_vector(31 downto 0);
      OP_ID : in std_logic_vector(7 downto 0);
      ret_val_x_x : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end component fpu32;


component fpadd64 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(63 downto 0);
      R : in  std_logic_vector(63 downto 0);
      ret_val_x_x : out  std_logic_vector(63 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end component fpadd64;


component fpsub64 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(63 downto 0);
      R : in  std_logic_vector(63 downto 0);
      ret_val_x_x : out  std_logic_vector(63 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end component fpsub64;

component fpmul64 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(63 downto 0);
      R : in  std_logic_vector(63 downto 0);
      ret_val_x_x : out  std_logic_vector(63 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end component fpmul64;


component fpu64 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(63 downto 0);
      R : in  std_logic_vector(63 downto 0);
      OP_ID : in std_logic_vector(7 downto 0);
      ret_val_x_x : out  std_logic_vector(63 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end component fpu64;

component getClockTime is -- 
    generic (tag_length : integer);
    port ( -- 
      clock_time : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end component getClockTime;

component countDownTimer is -- 
    generic (tag_length : integer);
    port ( -- 
      time_count : in  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end component countDownTimer;

end package;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;


-- a dummy ROM  which is never initialized.
-- any load to it returns 0.
entity dummy_read_only_memory_subsystem is
  generic(num_loads             : natural := 5;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7);
  port(
    ------------------------------------------------------------------------------
    -- load request ports
    ------------------------------------------------------------------------------
    lr_addr_in : in std_logic_vector((num_loads*addr_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on load request.
    lr_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lr_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag for request, will be returned on completion.
    lr_tag_in : in std_logic_vector((num_loads*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- load complete ports
    ---------------------------------------------------------------------------
    lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, user should latch data_out.
    lc_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lc_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag of completed request.
    lc_tag_out : out std_logic_vector((num_loads*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- clock, reset
    ------------------------------------------------------------------------------
    clock : in std_logic;  -- only rising edge is used to trigger activity.
    reset : in std_logic               -- active high.
    );
end entity dummy_read_only_memory_subsystem;


architecture Default of dummy_read_only_memory_subsystem is
begin

     gen: for I in 0 to num_loads-1 generate
	lr_ack_out(I) <= lr_req_in(I);

	fsm: block
		signal busy : std_logic;
	begin
		lc_ack_out(I) <= busy;

		process(clock)
		begin
			if(clock'event and clock = '1') then
				if(reset = '1') then 
				elsif (lr_req_in(I) = '1') then
					busy <= '1';
					lc_tag_out <= lr_tag_in;
				elsif (lc_req_in(I) = '1') then
					busy <= '0';
				end if;
			end if;
		end process;
	end block;
     end generate gen;

end Default;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

-- a dummy write-only memory (perfectly useless,
-- but plug-in for corner cases).
entity dummy_write_only_memory_subsystem is
  generic( num_stores            : natural := 10;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7);
  port(
    ------------------------------------------------------------------------------
    -- store request ports
    ------------------------------------------------------------------------------
    sr_addr_in : in std_logic_vector((num_stores*addr_width)-1 downto 0);
    sr_data_in : in std_logic_vector((num_stores*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on store request.
    sr_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sr_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag for request, will be returned on completion.
    sr_tag_in : in std_logic_vector((num_stores*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- store complete ports
    ---------------------------------------------------------------------------
    -- req/ack pair:
    -- when both are asserted, user assumes that store is done.
    sc_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sc_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag of completed request.
    sc_tag_out : out std_logic_vector((num_stores*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- clock, reset
    ------------------------------------------------------------------------------
    clock : in std_logic;  -- only rising edge is used to trigger activity.
    reset : in std_logic               -- active high.
    );
end entity dummy_write_only_memory_subsystem;


-- architecture: synchronous R/W.
--               on destination conflict, writer with lowest index wins.
architecture Default of dummy_write_only_memory_subsystem is
begin


     gen: for I in 0 to num_stores-1 generate
	sr_ack_out(I) <= sr_req_in(I);

	fsm: block
		signal busy : std_logic;
	begin
		sc_ack_out(I) <= busy;

		process(clock)
		begin
			if(clock'event and clock = '1') then
				if(reset = '1') then 
				elsif (sr_req_in(I) = '1') then
					busy <= '1';
					sc_tag_out <= sr_tag_in;
				elsif (sc_req_in(I) = '1') then
					busy <= '0';
				end if;
			end if;
		end process;
	end block;
     end generate gen;

end Default;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.memory_subsystem_package.all;
use ahir.mem_function_pack.all;
use ahir.mem_component_pack.all;

entity memory_bank_base is
   generic ( g_addr_width: natural; 
	g_data_width : natural;
        g_base_bank_addr_width: natural;
        g_base_bank_data_width: natural);
   port (data_in : in std_logic_vector(g_data_width-1 downto 0);
         data_out: out std_logic_vector(g_data_width-1 downto 0);
         addr_in: in std_logic_vector(g_addr_width-1 downto 0);
         enable: in std_logic;
         write_bar : in std_logic;
         clk: in std_logic;
         reset : in std_logic);
end entity memory_bank_base;


architecture structural of memory_bank_base is
  constant bank_array_width : natural := Ceiling(g_data_width,g_base_bank_data_width);
  constant bank_array_height : natural := 2**(Maximum(0,g_addr_width-g_base_bank_addr_width));

  type BankArrayDataArray is array (0 to bank_array_height-1, 0 to bank_array_width -1) of std_logic_vector(g_base_bank_data_width-1 downto 0);
  signal data_in_array, data_out_array : BankArrayDataArray;
  

  type BankArrayControlArray is array (0 to bank_array_height-1, 0 to bank_array_width -1) of std_logic;
  signal enable_array,enable_array_reg: BankArrayControlArray;
  
  signal padded_data_in,padded_data_out : std_logic_vector(bank_array_width*g_base_bank_data_width -1 downto 0);
  signal base_addr_in : std_logic_vector(g_base_bank_addr_width -1 downto 0);
  
  signal write_bar_reg: std_logic;
begin  -- structural

   -- register write_bar_reg because memory read will finish after one clock.
    process(clk,reset)
    begin
        if(clk'event and clk = '1') then
		if(reset = '1') then
			write_bar_reg <= '0';
		else
			write_bar_reg <= write_bar;
		end if;
	end if;
    end process;

process(addr_in)
        constant l_index: natural := Minimum(g_addr_width-1, g_base_bank_addr_width-1);
    begin
        base_addr_in <= (others => '0');
        base_addr_in(l_index downto 0) <= addr_in(l_index downto 0);
    end process;
    
process(data_in)
    begin
        padded_data_in <= (others => '0');
        padded_data_in(g_data_width-1 downto 0) <= data_in;
    end process;
    
  data_out <= padded_data_out(g_data_width-1 downto 0);

  -- pack/unpack
  ColGen: for COL in 0 to bank_array_width-1 generate
    
    RowGen: for ROW in 0 to bank_array_height-1 generate
      process(addr_in, enable)
      begin
        enable_array(ROW,COL) <= '0';
        if(bank_array_height > 1) then
          if(enable = '1') then
            if(ROW = To_Integer(addr_in(g_addr_width - 1 downto g_base_bank_addr_width))) then
              enable_array(ROW,COL) <= '1';
            end if;
          end if;
        else
          enable_array(ROW,COL) <= enable;
        end if;
      end process;

      process(clk,reset)
      begin
	if(clk'event and clk = '1') then
		if(reset = '1') then
			enable_array_reg(ROW,COL) <= '0';
		else
			enable_array_reg(ROW,COL) <= enable_array(ROW,COL);
		end if;
	end if;
      end process;

      process(padded_data_in)
      begin
        data_in_array(ROW,COL) <= padded_data_in((COL+1)*g_base_bank_data_width - 1 downto COL*g_base_bank_data_width);
      end process;

      baseMem : base_bank generic map (
        g_addr_width => g_base_bank_addr_width,
        g_data_width => g_base_bank_data_width)
        port map (
          datain => data_in_array(ROW, COL),
          addrin => base_addr_in,
          enable => enable_array(ROW,COL),
          writebar => write_bar,
          dataout => data_out_array(ROW,COL),
          clk => clk,
          reset => reset);
      
    end generate RowGen;
    
    process(data_out_array,enable_array, write_bar)
    begin
      padded_data_out((COL+1)*g_base_bank_data_width -1 downto (COL*g_base_bank_data_width)) <= (others => '0');
      for ROW in 0 to bank_array_height-1 loop
	-- use delayed version of enable and write_bar to pass read data
        if(enable_array_reg(ROW,COL) = '1' and write_bar_reg = '1') then
          padded_data_out((COL+1)*g_base_bank_data_width -1 downto (COL*g_base_bank_data_width)) <= data_out_array(ROW,COL);
        end if;
      end loop;  -- ROW
    end process;
    
  end generate ColGen;

end structural;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.mem_component_pack.all;

entity memory_bank is
   generic (
     g_addr_width: natural;
     g_data_width: natural;
     g_write_tag_width : natural;
     g_read_tag_width : natural;
     g_time_stamp_width: natural;
     g_base_bank_addr_width: natural;
     g_base_bank_data_width: natural
	);
   port (
     clk : in std_logic;
     reset: in std_logic;
     write_data     : in  std_logic_vector(g_data_width-1 downto 0);
     write_addr     : in std_logic_vector(g_addr_width-1 downto 0);
     write_tag      : in std_logic_vector(g_write_tag_width-1 downto 0);
     write_tag_out  : out std_logic_vector(g_write_tag_width-1 downto 0);
     write_enable   : in std_logic;
     write_ack   : out std_logic;
     write_result_accept : in std_logic;
     write_result_ready : out std_logic;
     read_data     : out std_logic_vector(g_data_width-1 downto 0);
     read_addr     : in std_logic_vector(g_addr_width-1 downto 0);
     read_tag      : in std_logic_vector(g_read_tag_width-1 downto 0);
     read_tag_out  : out std_logic_vector(g_read_tag_width-1 downto 0);
     read_enable   : in std_logic;
     read_ack      : out std_logic;
     read_result_accept: in std_logic;
     read_result_ready: out std_logic
     );
end entity memory_bank;


architecture SimModel of memory_bank is

  signal write_done, read_done, write_has_priority: std_logic;
  signal write_address_sig, read_address_sig : natural range 0 to (2**g_addr_width)-1;
  signal state_sig: std_logic;
  signal enable_base,enable_sig, write_enable_base, read_enable_base: std_logic;

  signal addr_base : std_logic_vector(g_addr_width-1 downto 0);
  signal block_write_ack, block_read_ack: std_logic;
  
  
begin  -- behave

  Tstampgen: if g_time_stamp_width > 0 generate 
  
  tstamp_block: Block
  	signal read_time_stamp, write_time_stamp: std_logic_vector(g_time_stamp_width-1 downto 0);
  begin 
  	read_time_stamp <= read_tag(g_time_stamp_width-1 downto 0);
  	write_time_stamp <= write_tag(g_time_stamp_width-1 downto 0);

  	process(read_time_stamp,write_time_stamp, read_enable, write_enable)
  	begin
      	if(write_enable = '1' and read_enable = '1') then
		if(IsGreaterThan(write_time_stamp,read_time_stamp)) then
        		write_has_priority <=   '0';
		else
			write_has_priority <= '1';
		end if;
      	elsif(write_enable = '1') then
		write_has_priority <= '1';
      	elsif(read_enable = '1') then
		write_has_priority <= '0';
      	else
		write_has_priority <= '1';
      	end if;
  	end process;
   end block;
   end generate Tstampgen;

   NoTstampGen: if g_time_stamp_width <= 0 generate
        write_has_priority <= write_enable;
   end generate NoTstampGen;


  -- basically, the enable/ack pair and the ready/accept pair
  -- have to be coordinated: in one complete cycle, the
  -- following sequence must be followed
  --  enable -> ready -> accept -> ack.
  process(reset,write_enable,write_has_priority,read_enable,clk)
  begin
    if clk'event and clk = '1' then
      if(reset = '1') then
        write_done <= '0';
        read_done <= '0';
      else
        if(write_enable = '1' and (write_has_priority = '1' or read_enable = '0')) then
          write_done <= '1';
        else
          write_done <= '0';
        end if; 
        if(read_enable = '1' and (write_has_priority = '0' or write_enable = '0')) then
          read_done <= '1';
        else
          read_done <= '0';
        end if;
      end if;
    end if;
  end process;

  -- ack when done 
  block_write_ack <= '1' when (write_done = '1' and write_result_accept = '0') else '0';
  write_ack <= '1' when (write_enable = '1' and (read_enable = '0' or write_has_priority = '1') and  block_write_ack = '0') else '0';
  write_result_ready <= write_done;
  
  -- ack to read only when result is also enabled
  block_read_ack <= '1' when (read_done = '1' and read_result_accept = '0') else '0';
  read_ack <= '1' when (read_enable = '1' and (write_enable = '0' or write_has_priority = '0') and  block_read_ack = '0') else '0';
  read_result_ready <= read_done;  


  process(write_enable, write_has_priority, block_write_ack)
  begin  -- process
      if(write_enable = '1' and write_has_priority = '1' and block_write_ack = '0') then
	write_enable_base <= '1';
      else
	write_enable_base <= '0';
      end if;
  end process;

  
  process(read_enable,  write_has_priority, block_read_ack)
  begin
    if(read_enable = '1' and write_has_priority = '0' and block_read_ack = '0') then
	read_enable_base <= '1';
    else
	read_enable_base <= '0';
    end if;
  end process;

  addr_base <= write_addr when write_enable_base = '1' else read_addr when read_enable_base = '1' else (others => '0');
  enable_sig <= write_enable_base or read_enable_base;
  
  memBase: memory_bank_base generic map(g_addr_width => g_addr_width,
                                        g_data_width => g_data_width,
					g_base_bank_addr_width => g_base_bank_addr_width,
					g_base_bank_data_width => g_base_bank_data_width)
    port map(data_in => write_data,
             addr_in => addr_base,
             data_out => read_data,
             enable => enable_sig,
             write_bar => read_enable_base,
             clk => clk,
             reset => reset);
 

  -- tag-out is updated in parallel with the
  -- memory access in memory_bank_base.
  process(clk)
  begin
	if(clk'event and clk = '1') then
		if(enable_sig = '1') then
			if(read_enable_base = '1') then
				read_tag_out <= read_tag;
			else
				write_tag_out <= write_tag;
			end if;
		end if;
	end if;
  end process;
  
end SimModel;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- effectively a two entry queue.
-- used to break combinational paths
-- at the cost of a single cycle delay from input
-- to output.
entity mem_repeater is
    generic(g_data_width: integer := 32);
    port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(g_data_width-1 downto 0);
       req_in: in std_logic;
       ack_out : out std_logic;
       data_out: out std_logic_vector(g_data_width-1 downto 0);
       req_out : out std_logic;
       ack_in: in std_logic);
end entity mem_repeater;

architecture behave of mem_repeater is

  signal stage0, stage1: std_logic_vector(g_data_width-1 downto 0);
  signal top_pointer, bottom_pointer : std_logic;
  
  signal queue_size : unsigned(1 downto 0);

  signal queue_full_sig, queue_empty_sig: std_logic;
  signal incr_q_size, decr_q_size : std_logic;
  
begin  -- SimModel

  queue_full_sig <= '1' when queue_size = 2 else '0';
  queue_empty_sig <= '1' when queue_size = 0 else '0';

  -- size manipulation
  process(clk)
  begin
    if(clk'event and clk = '1') then
      if(reset = '1') then
        queue_size <= (others => '0');
        top_pointer <= '0';
        bottom_pointer <= '0';
      else

        if(incr_q_size = '1' and (decr_q_size = '0')) then
          queue_size <= queue_size + 1;
        elsif((incr_q_size = '0') and decr_q_size = '1') then
          queue_size <= queue_size - 1;
        end if;

        -- increment mod 2
        if(incr_q_size = '1') then
          top_pointer <= not top_pointer;
        end if;

        -- increment mod 2
        if(decr_q_size = '1') then
          bottom_pointer <= not bottom_pointer;
        end if;
      end if;
    end if;
  end process;

  ack_out <= not queue_full_sig;
  incr_q_size <= req_in and (not queue_full_sig);
  
  -- write
  process(clk)
  begin
    if(clk'event and clk = '1') then
      if incr_q_size = '1' then
        if(top_pointer = '1') then
          stage1 <= data_in;
        else
          stage0 <= data_in;
        end if;
      end if;
    end if;
  end process;

  decr_q_size <= (not queue_empty_sig) and  ack_in;
  req_out     <= (not queue_empty_sig);
  
  data_out <= stage1 when bottom_pointer = '1' else stage0;

end behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.mem_component_pack.all;

entity mem_shift_repeater is
    generic(g_data_width: integer := 32; g_number_of_stages: natural := 16);
    port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(g_data_width-1 downto 0);
       req_in: in std_logic;
       ack_out : out std_logic;
       data_out: out std_logic_vector(g_data_width-1 downto 0);
       req_out : out std_logic;
       ack_in: in std_logic);
end entity mem_shift_repeater;

architecture behave of mem_shift_repeater is

  type DataArray is array (natural range <>) of std_logic_vector(g_data_width-1 downto 0);
  signal idata : DataArray(0 to g_number_of_stages);
  signal ireq,iack : std_logic_vector(0 to g_number_of_stages);

begin  -- SimModel

  idata(0) <= data_in;
  ireq(0)  <= req_in;
  ack_out <= iack(0);

  data_out <= idata(g_number_of_stages);
  req_out <= ireq(g_number_of_stages);
  iack(g_number_of_stages) <= ack_in;

  ifGen: if g_number_of_stages > 0 generate

    RepGen: for I in 0 to g_number_of_stages-1 generate
      rptr : mem_repeater generic map (
        g_data_width => g_data_width)
        port map (
          clk      => clk,
          reset    => reset,
          data_in  => idata(I),
          req_in   => ireq(I),
          ack_out  => iack(I),
          data_out => idata(I+1),
          req_out  => ireq(I+1),
          ack_in   => iack(I+1));
    end generate RepGen;
  end generate ifGen; 

end behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity base_bank is
   generic ( g_addr_width: natural := 10; g_data_width : natural := 16);
   port (datain : in std_logic_vector(g_data_width-1 downto 0);
         dataout: out std_logic_vector(g_data_width-1 downto 0);
         addrin: in std_logic_vector(g_addr_width-1 downto 0);
         enable: in std_logic;
         writebar : in std_logic;
         clk: in std_logic;
         reset : in std_logic);
end entity base_bank;


architecture XilinxBramInfer of base_bank is
  type MemArray is array (natural range <>) of std_logic_vector(g_data_width-1 downto 0);
  signal mem_array : MemArray((2**g_addr_width)-1 downto 0) := (others => (others => '0'));
  signal addr_reg : std_logic_vector(g_addr_width-1 downto 0);
  signal rd_enable_reg : std_logic;
begin  -- XilinxBramInfer

  -- read/write process
  process(clk,addrin,enable,writebar)
  begin

    -- synch read-write memory
    if(clk'event and clk ='1') then

     	-- register the address
	-- and use it in a separate assignment
	-- for the delayed read.
      addr_reg <= addrin;

	-- generate a registered read enable
      if(reset = '1') then
	rd_enable_reg <= '0';
      else
	rd_enable_reg <= enable and writebar;
      end if;

      if(enable = '1' and writebar = '0') then
        mem_array(To_Integer(unsigned(addrin))) <= datain;
      end if;
    end if;
  end process;
      	
	-- use the registered read enable with the registered address to 
	-- describe the read
  dataout <= mem_array(To_Integer(unsigned(addr_reg))) when (rd_enable_reg = '1') else (others => '0');

end XilinxBramInfer;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;

entity combinational_merge is
  generic (
    g_data_width       : natural;
    g_number_of_inputs: natural;
    g_time_stamp_width : natural);
  port(
    in_data: in std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
    in_tstamp: in std_logic_vector((g_number_of_inputs*g_time_stamp_width)-1 downto 0);
    out_data: out std_logic_vector(g_data_width-1 downto 0);
    out_tstamp: out std_logic_vector(g_time_stamp_width-1 downto 0);
    in_req: in std_logic_vector(g_number_of_inputs-1 downto 0);
    in_ack: out std_logic_vector(g_number_of_inputs-1 downto 0);
    out_req: out std_logic;
    out_ack: in std_logic);
end combinational_merge;

architecture combinational_merge of combinational_merge is

  signal sel_vector : std_logic_vector(g_number_of_inputs-1 downto 0);
  
begin  -- combinational_merge

  process(in_tstamp,in_data,in_req)
    variable best_tstamp_var : std_logic_vector(1 to g_time_stamp_width);
    variable best_data : std_logic_vector(1 to g_data_width);
    variable sel_var : std_logic_vector(g_number_of_inputs-1 downto 0);
    variable vflag : std_logic;
  begin
    Select_Best_Index(in_tstamp,in_data, in_req,best_tstamp_var,best_data,sel_var,vflag);
    if(vflag = '1') then
      out_tstamp <= best_tstamp_var;
      out_data <= best_data;
      sel_vector <= sel_var;
      out_req <= '1';
    else
      out_tstamp <= (others => '0');
      out_data <= (others => '0');
      sel_vector <= (others => '0');
      out_req <= '0';
    end if;
  end process;
  
  AckGen: for I in 0 to g_number_of_inputs-1 generate
    in_ack(I) <= '1' when (sel_vector(I) = '1'  and out_ack = '1' and in_req(I) = '1') else '0';
  end generate AckGen;
  
end combinational_merge;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

entity combinational_merge_with_repeater is
  generic (
    g_data_width       : natural;
    g_number_of_inputs: natural;
    g_time_stamp_width : natural);
  port(
    clk : in std_logic;
    reset : in std_logic;
    in_data: in std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
    in_tstamp: in std_logic_vector((g_number_of_inputs*g_time_stamp_width)-1 downto 0);
    out_data: out std_logic_vector(g_data_width-1 downto 0);
    out_tstamp: out std_logic_vector(g_time_stamp_width-1 downto 0);
    in_req: in std_logic_vector(g_number_of_inputs-1 downto 0);
    in_ack: out std_logic_vector(g_number_of_inputs-1 downto 0);
    out_req: out std_logic;
    out_ack: in std_logic);
end combinational_merge_with_repeater;

architecture Struct of combinational_merge_with_repeater is

  signal sel_vector : std_logic_vector(g_number_of_inputs-1 downto 0);

  signal rep_data_in : std_logic_vector(g_data_width-1 downto 0);
  signal rep_req_in, rep_ack_out: std_logic;
  
begin  

   cmerge: combinational_merge 
		generic map (g_data_width => g_data_width,
			 g_number_of_inputs => g_number_of_inputs,
			 g_time_stamp_width => g_time_stamp_width)
		port map(in_data => in_data,
			 in_tstamp => in_tstamp,
			 out_data => rep_data_in,
			 out_tstamp => open,
			 in_req => in_req,
			 in_ack => in_ack,
			 out_req => rep_req_in,
			 out_ack => rep_ack_out);

    rptr:  mem_repeater generic map (g_data_width => g_data_width)
		port map(clk => clk, reset => reset,
			 data_in => rep_data_in,
			 req_in => rep_req_in,
			 ack_out => rep_ack_out,
			 data_out => out_data,
			 req_out => out_req,
			 ack_in => out_ack);	
  
end Struct;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

entity demerge_tree is
  generic (
    g_demux_degree: natural := 10;
    g_number_of_outputs: natural := 5;
    g_data_width: natural := 8;
    g_id_width: natural := 3;
    g_stage_id: natural := 0
    );       

  port (
    demerge_data_out : out std_logic_vector((g_data_width*g_number_of_outputs)-1 downto 0);
    demerge_ready_out  : out std_logic_vector(g_number_of_outputs-1 downto 0);
    demerge_accept_in   : in std_logic_vector(g_number_of_outputs-1 downto 0);
    demerge_data_in: in std_logic_vector(g_data_width-1 downto 0);
    demerge_ack_out : out std_logic;
    demerge_req_in  : in std_logic;
    demerge_sel_in: in std_logic_vector(g_id_width-1 downto 0);
    clock: in std_logic;
    reset: in std_logic);
end demerge_tree;

-- a much simpler architecture, which is likely to be equally
-- effective.
architecture Simple of demerge_tree is
  constant inserted_delay  : integer := Maximum(1,Ceil_Log2(g_number_of_outputs/g_demux_degree));
begin  -- Simple

  demux : mem_demux generic map (
    g_data_width        => g_data_width,
    g_id_width          => g_id_width,
    g_number_of_outputs => g_number_of_outputs,
    g_delay_count => inserted_delay)
    port map (
      data_in  => demerge_data_in,
      sel_in   => demerge_sel_in,
      req_in   => demerge_req_in,
      ack_out  => demerge_ack_out,
      data_out => demerge_data_out,
      req_out  => demerge_ready_out,
      ack_in   => demerge_accept_in,
      clk      => clock,
      reset    => reset);
end Simple;




library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

entity demerge_tree_wrap is
  generic (
    g_demux_degree: natural;
    g_number_of_outputs: natural;
    g_data_width: natural;
    g_id_width: natural;
    g_stage_id: natural
    );       

  port (
    demerge_data_out : out std_logic_vector((g_data_width*g_number_of_outputs)-1 downto 0);
    demerge_ready_out  : out std_logic_vector(g_number_of_outputs-1 downto 0);
    demerge_accept_in   : in std_logic_vector(g_number_of_outputs-1 downto 0);
    demerge_data_in: in std_logic_vector(g_data_width-1 downto 0);
    demerge_ack_out : out std_logic;
    demerge_req_in  : in std_logic;
    demerge_sel_in: in std_logic_vector(g_id_width-1 downto 0);
    clock: in std_logic;
    reset: in std_logic);
  
end demerge_tree_wrap;



architecture wrapper of demerge_tree_wrap is
begin
      
      demTree: component demerge_tree
        generic map (
          g_data_width => g_data_width,
          g_id_width   => g_id_width,
          g_number_of_outputs => g_number_of_outputs,
          g_stage_id => g_stage_id,
          g_demux_degree => g_demux_degree)
        port map (
          demerge_data_out => demerge_data_out,
          demerge_ready_out => demerge_ready_out,
          demerge_accept_in => demerge_accept_in,
          demerge_data_in   => demerge_data_in,
          demerge_req_in  => demerge_req_in,
          demerge_ack_out => demerge_ack_out,
          demerge_sel_in  => demerge_sel_in,
          clock => clock,
          reset => reset);
end wrapper;




library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

entity mem_demux is
  generic ( g_data_width: natural := 10;
            g_id_width : natural := 3;
            g_number_of_outputs: natural := 8;
	    g_delay_count: natural := 1);
  port(data_in: in std_logic_vector(g_data_width-1 downto 0);  -- data & id & time-stamp
       sel_in : in std_logic_vector(g_id_width-1 downto 0);
       req_in: in std_logic;
       ack_out : out std_logic;
       data_out: out std_logic_vector((g_number_of_outputs*g_data_width)-1 downto 0 );
       req_out: out std_logic_vector(g_number_of_outputs-1 downto 0);
       ack_in : in std_logic_vector(g_number_of_outputs-1 downto 0);
       clk: in std_logic;
       reset: in std_logic);
end entity;

architecture behave of mem_demux is
  type SigArrayType is array (natural range <>) of std_logic_vector(g_data_width-1 downto 0);

  signal data_out_sig,repeater_out_sig : SigArrayType(g_number_of_outputs-1 downto 0);
  signal req_out_sig, ack_in_sig : std_logic_vector(g_number_of_outputs-1 downto 0);

begin  -- behave


  process(ack_in_sig)
    variable ack_out_var : std_logic;
  begin
    ack_out_var := '0';
    for I in 0 to g_number_of_outputs-1 loop
      ack_out_var := ack_out_var or ack_in_sig(I);
    end loop;  -- I
    ack_out <= ack_out_var;
  end process;
    
  gen: for I in 0 to g_number_of_outputs-1 generate

    data_out_sig(I) <= data_in;
    
    process(data_in, sel_in, req_in)
      variable port_index : natural;
    begin
      port_index := To_Integer(sel_in);
      req_out_sig(I) <= '0';
      if(req_in = '1' and port_index = I) then
        req_out_sig(I) <= req_in;
      end if;
    end process;
      
    Repeater : mem_shift_repeater generic map(g_data_width => g_data_width, g_number_of_stages => g_delay_count)
    port map (
      clk      => clk,
      reset    => reset,
      data_in  => data_out_sig(I),
      req_in   => req_out_sig(I),
      ack_out  => ack_in_sig(I),
      data_out => repeater_out_sig(I),
      req_out  => req_out(I),
      ack_in   => ack_in(I));

    data_out((I+1)*g_data_width -1 downto I*g_data_width) <= repeater_out_sig(I);
  end generate gen;

end behave;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

-- memory subsystem guarantees that accesses to the same location
-- will take place in the order of the time-stamp assigned to each
-- access (tie breaks will be random). Time-stamp is set at the
-- point of acceptance of an access request.

entity memory_subsystem_core is
  generic(num_loads             : natural := 5;
          num_stores            : natural := 10;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7;
          time_stamp_width      : natural := 11;
          number_of_banks       : natural := 1;
          mux_degree            : natural := 10;
          demux_degree          : natural := 10;
	  base_bank_addr_width  : natural := 8;
	  base_bank_data_width  : natural := 8);
  port(
    ------------------------------------------------------------------------------
    -- load request ports
    ------------------------------------------------------------------------------
    lr_addr_in : in std_logic_vector((num_loads*addr_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on load request.
    lr_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lr_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag for request, will be returned on completion.
    lr_tag_in : in std_logic_vector((num_loads*tag_width)-1 downto 0);

    -- time-stamp for request: will be used for all ordering inside
    -- the subsystem
    lr_time_stamp_in   : in  std_logic_vector((num_loads*time_stamp_width)-1 downto 0);
    
    ---------------------------------------------------------------------------
    -- load complete ports
    ---------------------------------------------------------------------------
    lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, user should latch data_out.
    lc_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lc_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag of completed request.
    lc_tag_out : out std_logic_vector((num_loads*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- store request ports
    ------------------------------------------------------------------------------
    sr_addr_in : in std_logic_vector((num_stores*addr_width)-1 downto 0);
    sr_data_in : in std_logic_vector((num_stores*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on store request.
    sr_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sr_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag for request, will be returned on completion.
    sr_tag_in : in std_logic_vector((num_stores*tag_width)-1 downto 0);

    -- time-stamp for request: will be used for all ordering inside
    -- the subsystem
    sr_time_stamp_in   : in  std_logic_vector((num_stores*time_stamp_width)-1 downto 0);
    
    ---------------------------------------------------------------------------
    -- store complete ports
    ---------------------------------------------------------------------------
    -- req/ack pair:
    -- when both are asserted, user assumes that store is done.
    sc_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sc_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag of completed request.
    sc_tag_out : out std_logic_vector((num_stores*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- clock, reset
    ------------------------------------------------------------------------------
    clock : in std_logic;  -- only rising edge is used to trigger activity.
    reset : in std_logic               -- active high.
    );
end entity memory_subsystem_core;


architecture pipelined of memory_subsystem_core is

  -----------------------------------------------------------------------------
  -- configuration constants.  These should be determined by the
  -- implementation itself based on the input generics.  For the moment
  -- these are hardwired.
  -----------------------------------------------------------------------------
  constant c_mux_degree : natural :=  mux_degree;
  constant c_demux_degree : natural := demux_degree;
  constant log2_number_of_banks : natural := Ceil_Log2(number_of_banks);  --  
  constant bank_addr_width : natural := addr_width - log2_number_of_banks;
  constant c_load_merge_stages : natural := Maximum(1, Ceil_Log(num_loads,c_mux_degree));
  constant c_store_merge_stages : natural := Maximum(1,Ceil_Log(num_stores,c_mux_degree));
  constant c_number_of_merge_stages : natural := Maximum(c_load_merge_stages,c_store_merge_stages);
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- useful constants
  constant c_number_of_inputs : natural := num_loads + num_stores;
  constant c_log2_number_of_inputs : natural := Ceil_Log2(num_loads + num_stores);
  -----------------------------------------------------------------------------

  type LoadDataArray is array (natural range <>) of std_logic_vector(data_width-1 downto 0);
  type LoadDataTagArray is array (natural range <>) of std_logic_vector(data_width+tag_width-1 downto 0);
  signal load_port_data : LoadDataTagArray(0 to num_loads-1);
  
  -----------------------------------------------------------------------------
  -- Todo: create an array of port id tags to keep track of the
  --       input port
  -----------------------------------------------------------------------------
  constant c_load_port_id_width : natural := Maximum(1,Ceil_Log2(num_loads));
  constant c_store_port_id_width : natural := Maximum(1,Ceil_Log2(num_stores));

  type LoadPortIdArray is array (natural range <>) of std_logic_vector(c_load_port_id_width-1 downto 0);
  type StorePortIdArray is array (natural range <>) of std_logic_vector(c_store_port_id_width-1 downto 0);
  
  type TimeStampArray is array (natural range<>) of std_logic_vector(time_stamp_width-1 downto 0);
  function StorePortIdGen (
    constant x : natural;
    constant width : natural
    )
    return StorePortIdArray
  is
    variable ret_var : StorePortIdArray(0 to x-1);
    variable curr_value : std_logic_vector(width-1 downto 0);
  begin
    curr_value := (others => '0');
    ret_var := (others => (others => '0'));
    for I  in 0 to x-1 loop
      ret_var(I) := curr_value;
      curr_value := IncrementSLV(curr_value);
    end loop;  -- I
    return(ret_var);
  end function StorePortIdGen;

  function LoadPortIdGen (
    constant x : natural;
    constant width : natural
    )
    return LoadPortIdArray
  is
    variable ret_var : LoadPortIdArray(0 to x-1);
    variable curr_value : std_logic_vector(width-1 downto 0);
  begin
    curr_value := (others => '0');
    ret_var := (others => (others => '0'));
    for I  in 0 to x-1 loop
      ret_var(I) := curr_value;
      curr_value := IncrementSLV(curr_value);
    end loop;  -- I
    return(ret_var);
  end function LoadPortIdGen;


  constant c_load_port_id_array : LoadPortIdArray := LoadPortIdGen(num_loads, c_load_port_id_width);
  signal s_load_port_id_array : LoadPortIdArray(0 to num_loads-1) := c_load_port_id_array;


  constant c_store_port_id_array : StorePortIdArray := StorePortIdGen(num_stores, c_store_port_id_width);
  signal s_store_port_id_array : StorePortIdArray(0 to num_stores-1) := c_store_port_id_array;
  
  constant c_load_merge_data_width : natural := (bank_addr_width) + tag_width + c_load_port_id_width + time_stamp_width;
  constant c_load_demerge_data_width : natural := data_width + tag_width + c_load_port_id_width + time_stamp_width;
  
  constant c_store_merge_data_width : natural := (bank_addr_width) + data_width + tag_width + c_store_port_id_width + time_stamp_width;
  constant c_store_demerge_data_width : natural := tag_width + c_store_port_id_width + time_stamp_width;
  

  signal load_time_stamp : TimeStampArray(num_loads-1 downto 0);
  signal store_complete_time_stamp,store_time_stamp : TimeStampArray(num_stores-1 downto 0);

  type LoadMergeArray is array(0 to number_of_banks-1) of std_logic_vector(num_loads*c_load_merge_data_width-1 downto 0);
  type StoreMergeArray is array(0 to number_of_banks-1) of std_logic_vector(num_stores*c_store_merge_data_width-1 downto 0);
  type LoadControlArray is array(0 to number_of_banks-1) of std_logic_vector(num_loads-1 downto 0);
  
  type LoadDemergeArray is array(0 to number_of_banks-1) of std_logic_vector(num_loads*c_load_demerge_data_width-1 downto 0);
  type StoreDemergeArray is array(0 to number_of_banks-1) of std_logic_vector(num_stores*c_store_demerge_data_width-1 downto 0);
  type StoreControlArray is array(0 to number_of_banks-1) of std_logic_vector(num_stores-1 downto 0);
  
  signal load_merge_data_in : LoadMergeArray;
  signal load_merge_data_out : std_logic_vector((number_of_banks*c_load_merge_data_width)-1 downto 0);

  -- port side load merge control
  signal load_merge_from_port_req, load_merge_to_port_ack : LoadControlArray;

  -- bank side load merge control
  signal load_merge_to_bank_req, load_merge_from_bank_ack : std_logic_vector(number_of_banks-1 downto 0);
  
  signal load_demerge_data_in : std_logic_vector((number_of_banks*c_load_demerge_data_width)-1 downto 0);
  signal load_demerge_data_out : LoadDemergeArray;

  -- port side load demerge control
  signal load_demerge_to_port_req, load_demerge_from_port_ack :LoadControlArray;

  -- bank side load demerge control
  signal load_demerge_from_bank_req, load_demerge_to_bank_ack : std_logic_vector(number_of_banks-1 downto 0);
    
  signal store_merge_data_in : StoreMergeArray;
  signal store_merge_data_out : std_logic_vector((number_of_banks*c_store_merge_data_width)-1 downto 0);

  -- port side store merge control
  signal store_merge_from_port_req, store_merge_to_port_ack : StoreControlArray;
  
  -- bank side store merge control
  signal store_merge_to_bank_req, store_merge_from_bank_ack : std_logic_vector(number_of_banks-1 downto 0);
  signal store_demerge_data_in : std_logic_vector((number_of_banks*c_store_demerge_data_width)-1 downto 0);
  signal store_demerge_data_out : StoreDemergeArray;

  -- port side store demerge control
  signal store_demerge_to_port_req, store_demerge_from_port_ack : StoreControlArray;

  -- bank side store demerge control
  signal store_demerge_from_bank_req, store_demerge_to_bank_ack : std_logic_vector(number_of_banks-1 downto 0);

  signal load_req_state : std_logic_vector(num_loads-1 downto 0);
  signal store_req_state : std_logic_vector(num_stores-1 downto 0);

  type BankDataArray is array(natural range <>) of std_logic_vector(number_of_banks*(data_width+tag_width)-1 downto 0);
  type BankTagArray is array(natural range <>) of std_logic_vector(number_of_banks*tag_width-1 downto 0);
  type BankStorePortIdArray is array(natural range <>) of std_logic_vector(number_of_banks*c_store_port_id_width-1 downto 0);
  type BankTimestampArray is array(natural range <>) of std_logic_vector(number_of_banks*time_stamp_width-1 downto 0);
  type BankControlArray is array(natural range <>) of std_logic_vector(number_of_banks-1 downto 0);

  signal load_data_from_banks : BankDataArray(0 to num_loads-1);
  signal load_tstamp_from_banks : BankTimestampArray(0 to num_loads-1);
  signal load_data_req_from_banks, load_data_ack_to_banks : BankControlArray(0 to num_loads-1);
  signal store_tstamp_from_banks : BankTimestampArray(0 to num_stores-1);
  signal store_port_id_from_banks : BankStorePortIdArray(0 to num_stores-1);
  signal store_tag_from_banks : BankTagArray(0 to num_stores-1);
  signal store_data_req_from_banks, store_data_ack_to_banks : BankControlArray(0 to num_stores-1);

  type BankMemDataArray is array (natural range <>) of std_logic_vector(data_width-1 downto 0);
  type BankMemTagArray is array (natural range <>) of std_logic_vector(tag_width-1 downto 0);
  type BankMemLoadTagArray is array (natural range <>) of std_logic_vector((tag_width+c_load_port_id_width+time_stamp_width)-1 downto 0);
  type BankMemStoreTagArray is array (natural range <>) of std_logic_vector((tag_width+c_store_port_id_width+time_stamp_width)-1 downto 0);
  type BankMemStorePortIdArray is array(natural range <>) of std_logic_vector(c_store_port_id_width-1 downto 0);
  type BankMemAddressArray is array (natural range <>) of std_logic_vector(bank_addr_width-1 downto 0);
  signal bank_mem_read_addr, bank_mem_write_addr: BankMemAddressArray(0 to number_of_banks-1);
  signal bank_mem_read_data, bank_mem_write_data : BankMemDataArray(0 to number_of_banks-1);
  signal bank_mem_read_tag : BankMemLoadTagArray(0 to number_of_banks-1);
  signal bank_mem_read_tag_out: BankMemLoadTagArray(0 to number_of_banks-1);
  signal bank_mem_write_tag : BankMemStoreTagArray(0 to number_of_banks-1);
  signal bank_mem_write_tag_out : BankMemStoreTagArray(0 to number_of_banks-1);
  signal bank_mem_store_port_id_out: BankMemStorePortIdArray(0 to number_of_banks-1);
  signal bank_mem_store_tag_out: BankMemTagArray(0 to number_of_banks-1);
  signal bank_mem_write_enable, bank_mem_write_ack, bank_mem_read_enable, bank_mem_read_ack : std_logic_vector(0 to number_of_banks-1);
  signal bank_mem_write_result_ready, bank_mem_write_result_accept, bank_mem_read_result_ready, bank_mem_read_result_accept : std_logic_vector(0 to number_of_banks-1);
  

begin

  -----------------------------------------------------------------------------
  -- load merge logic
  -----------------------------------------------------------------------------
  LoadMergeGen: for I in 0 to num_loads-1 generate

    load_time_stamp(I) <= lr_time_stamp_in((I+1)*time_stamp_width -1 downto I*time_stamp_width);

    ---------------------------------------------------------------------------
    -- lr_ack
    ---------------------------------------------------------------------------
    process(load_merge_to_port_ack)
      variable sig_var : std_logic;
    begin
      sig_var := '0';
      for BANK in 0 to number_of_banks-1 loop
        sig_var := sig_var or load_merge_to_port_ack(BANK)(I);
      end loop;  -- BANK
      lr_ack_out(I) <= sig_var;
    end process;


    ---------------------------------------------------------------------------
    -- address & tag & port-id & time-stamp
    BankGen: for BANK in 0 to number_of_banks-1 generate

      -------------------------------------------------------------------------
      -- distribution of data to banks
      -------------------------------------------------------------------------
      
      -- data-in to merge tree for BANK. (from Ith port)
      load_merge_data_in(BANK)((I+1)*c_load_merge_data_width - 1 downto I*c_load_merge_data_width)
        <= lr_addr_in((I+1)*addr_width-1 downto (I*addr_width) + log2_number_of_banks) &
        lr_tag_in((I+1)*tag_width-1 downto I*tag_width) & c_load_port_id_array(I) & load_time_stamp(I);

      -- handshake between ports and load-merge
      load_merge_from_port_req(BANK)(I) <=
        lr_req_in(I) when Bank_Match(BANK,log2_number_of_banks,lr_addr_in((I+1)*addr_width-1 downto I*addr_width)) else '0';
      -- ack through lr_ack process.

      -------------------------------------------------------------------------
      -- reverse data from banks
      -------------------------------------------------------------------------
      
      -- data & tag &  port-id & time-stamp
      load_data_from_banks(I)((BANK+1)*(tag_width+data_width)-1 downto BANK*(tag_width+data_width)) 
        <= 
        load_demerge_data_out(BANK)((I+1)*(c_load_demerge_data_width)-1 downto ((I+1)*(c_load_demerge_data_width)-data_width)-tag_width);

      load_tstamp_from_banks(I)((BANK+1)*(time_stamp_width)-1 downto BANK*time_stamp_width)
        <=
        load_demerge_data_out(BANK)((I*c_load_demerge_data_width)+(time_stamp_width-1) downto 
                                    ((I*c_load_demerge_data_width)));

      -------------------------------------------------------------------------
      -- port-side handshake
      --  Ports   -> req    Merge  -> req   Bank
      --          <- ack           <- ack
      -------------------------------------------------------------------------
      load_data_req_from_banks(I)(BANK) <= load_demerge_to_port_req(BANK)(I);
      load_demerge_from_port_ack(BANK)(I) <=  load_data_ack_to_banks(I)(BANK);

    end generate BankGen;


    ---------------------------------------------------------------------------
    -- merge for load-complete
    ---------------------------------------------------------------------------
    mergeComplete : combinational_merge_with_repeater generic map (
      g_data_width       => data_width + tag_width,
      g_number_of_inputs => number_of_banks,
      g_time_stamp_width => time_stamp_width)
      port map (clk => clock, reset => reset,
		in_data => load_data_from_banks(I),
                in_tstamp => load_tstamp_from_banks(I),
                out_data => load_port_data(I),
                out_tstamp => open,
                in_req => load_data_req_from_banks(I),
                in_ack => load_data_ack_to_banks(I),
                out_req => lc_ack_out(I),
                out_ack => lc_req_in(I));

    lc_data_out((I+1)*data_width-1 downto I*data_width) <= load_port_data(I)(data_width+tag_width-1 downto tag_width);
    lc_tag_out((I+1)*tag_width -1 downto I*tag_width) <= load_port_data(I)(tag_width-1 downto 0);
    
  end generate LoadMergeGen;

  -----------------------------------------------------------------------------
  -- store merge
  -----------------------------------------------------------------------------
  StoreMergeGen: for I in 0 to num_stores-1 generate
    
    store_time_stamp(I) <= sr_time_stamp_in((I+1)*time_stamp_width -1 downto I*time_stamp_width);

    ---------------------------------------------------------------------------
    -- sr_ack
    ---------------------------------------------------------------------------
    process(store_merge_to_port_ack)
      variable sig_var : std_logic;
    begin
      sig_var := '0';
      for BANK in 0 to number_of_banks-1 loop
        sig_var := sig_var or store_merge_to_port_ack(BANK)(I);
      end loop;  -- BANK
      sr_ack_out(I) <= sig_var;
    end process;


    BankGen: for BANK in 0 to number_of_banks-1 generate
      
      -------------------------------------------------------------------------
      -- distribution of data to banks
      -------------------------------------------------------------------------
      -- address & data & tag & port_id & time_stamp
      
      store_merge_data_in(BANK)((I+1)*c_store_merge_data_width - 1 downto I*c_store_merge_data_width)
        <= sr_addr_in((I+1)*addr_width-1 downto I*addr_width + log2_number_of_banks) &
        sr_data_in((I+1)*data_width-1 downto I*data_width) & 
        sr_tag_in((I+1)*tag_width-1 downto I*tag_width) &  c_store_port_id_array(I) & store_time_stamp(I);

      store_merge_from_port_req(BANK)(I) <=
        sr_req_in(I) when Bank_Match(BANK,log2_number_of_banks,sr_addr_in((I+1)*addr_width-1 downto I*addr_width)) else '0';

      -------------------------------------------------------------------------
      -- reverse data from banks (tag only).
      -------------------------------------------------------------------------
      -- tag & port-id & time-stamp
      store_tag_from_banks(I)((BANK+1)*(tag_width)-1 downto BANK*(tag_width)) 
        <= 
        store_demerge_data_out(BANK)((I+1)*(c_store_demerge_data_width)-1 downto ((I+1)*(c_store_demerge_data_width)-tag_width));

      store_tstamp_from_banks(I)((BANK+1)*(time_stamp_width)-1 downto BANK*time_stamp_width)
        <=
        store_demerge_data_out(BANK)(I*c_store_demerge_data_width+(time_stamp_width-1) downto
                                    (I*c_store_demerge_data_width));

      store_port_id_from_banks(I)((BANK+1)*c_store_port_id_width -1 downto BANK*c_store_port_id_width)
	<=
        store_demerge_data_out(BANK)((I+1)*(c_store_demerge_data_width)-(tag_width+1) downto ((I+1)*(c_store_demerge_data_width)-(c_store_port_id_width + tag_width)));
	
      -- port side handshake
      store_data_req_from_banks(I)(BANK) <= store_demerge_to_port_req(BANK)(I);
      store_demerge_from_port_ack(BANK)(I) <=  store_data_ack_to_banks(I)(BANK);

    end generate BankGen;


    ---------------------------------------------------------------------------
    -- merge for store-complete
    ---------------------------------------------------------------------------
    mergeComplete : combinational_merge_with_repeater generic map (
      g_data_width       => tag_width,
      g_number_of_inputs => number_of_banks,
      g_time_stamp_width => time_stamp_width)
      port map (clk => clock,
		reset => reset,
		in_data => store_tag_from_banks(I),
                in_tstamp => store_tstamp_from_banks(I),
                out_data => sc_tag_out((I+1)*tag_width-1 downto I*tag_width),
                out_tstamp => store_complete_time_stamp(I),
                in_req => store_data_req_from_banks(I),
                in_ack => store_data_ack_to_banks(I),
                out_req => sc_ack_out(I),
                out_ack => sc_req_in(I));

  end generate StoreMergeGen;


  -----------------------------------------------------------------------------
  -- now the banks
  -----------------------------------------------------------------------------
  BankGen: for BANK in 0 to number_of_banks-1 generate

    ---------------------------------------------------------------------------
    -- todo: instantiate merge trees for load and store
    ---------------------------------------------------------------------------
    loadMerge : merge_tree
      generic map(g_mux_degree => c_mux_degree,
                  g_number_of_inputs => num_loads,
                  g_data_width => c_load_merge_data_width,
                  g_time_stamp_width => time_stamp_width,
                  g_num_stages => c_number_of_merge_stages,
                  g_port_id_width => c_load_port_id_width,
                  g_tag_width => tag_width)
      port map (merge_data_in  => load_merge_data_in(BANK),
                merge_req_in   => load_merge_from_port_req(BANK),
                merge_ack_out  => load_merge_to_port_ack(BANK),
                merge_data_out => load_merge_data_out((BANK+1)*c_load_merge_data_width-1 downto BANK*c_load_merge_data_width),
                merge_req_out  => load_merge_to_bank_req(BANK),
                merge_ack_in   => load_merge_from_bank_ack(BANK),
                clock => clock,
                reset => reset);

    ---------------------------------------------------------------------------
    -- store merge (from ports to bank)
    ---------------------------------------------------------------------------
    storeMerge : merge_tree
      generic map(g_mux_degree => c_mux_degree,
                  g_number_of_inputs => num_stores,
                  g_data_width => c_store_merge_data_width,
                  g_num_stages => c_number_of_merge_stages,
                  g_time_stamp_width => time_stamp_width,
                  g_port_id_width => c_store_port_id_width,
                  g_tag_width => tag_width)
      port map (merge_data_in => store_merge_data_in(BANK),
                merge_req_in => store_merge_from_port_req(BANK),
                merge_ack_out => store_merge_to_port_ack(BANK),
                merge_data_out => store_merge_data_out((BANK+1)*c_store_merge_data_width-1 downto BANK*c_store_merge_data_width),
                merge_req_out => store_merge_to_bank_req(BANK),
                merge_ack_in => store_merge_from_bank_ack(BANK),
                clock => clock,
                reset => reset);
    
    
    ---------------------------------------------------------------------------
    -- connections to memory bank
    ---------------------------------------------------------------------------

    -- write side
    bank_mem_write_addr(BANK) <= store_merge_data_out((BANK+1)*c_store_merge_data_width-1 downto
                                                      (BANK+1)*c_store_merge_data_width - bank_addr_width);
    bank_mem_write_data(BANK) <= store_merge_data_out((BANK+1)*c_store_merge_data_width-(bank_addr_width+1)
                                                      downto
                                                      (BANK+1)*c_store_merge_data_width -
                                                      (bank_addr_width + data_width));
    bank_mem_write_tag(BANK) <=
      store_merge_data_out(
        (BANK+1)*c_store_merge_data_width-(bank_addr_width+data_width+1) downto
        (BANK*c_store_merge_data_width));

    -- write handshake (push all the way)
    bank_mem_write_enable(BANK) <=  store_merge_to_bank_req(BANK);
    store_merge_from_bank_ack(BANK) <= bank_mem_write_ack(BANK);

    -- read side
    bank_mem_read_addr(BANK) <= load_merge_data_out((BANK+1)*c_load_merge_data_width-1 downto
                                                      (BANK+1)*c_load_merge_data_width - bank_addr_width);
    bank_mem_read_tag(BANK) <=
      load_merge_data_out(
        (BANK+1)*c_load_merge_data_width-(bank_addr_width+1) downto
        (BANK*c_load_merge_data_width));

    -- read handshake (push all the way)
    bank_mem_read_enable(BANK) <=  load_merge_to_bank_req(BANK);
    load_merge_from_bank_ack(BANK) <= bank_mem_read_ack(BANK);

                                                    
    memBank : memory_bank generic map (
      g_data_width       => data_width,
      g_read_tag_width        => tag_width+c_load_port_id_width+time_stamp_width,
      g_write_tag_width        => tag_width+c_store_port_id_width+time_stamp_width,
      g_addr_width    => bank_addr_width,
      g_time_stamp_width => time_stamp_width,
      g_base_bank_addr_width => base_bank_addr_width,
      g_base_bank_data_width => base_bank_data_width)
      port map (
        clk => clock,
        reset => reset,
        write_data => bank_mem_write_data(BANK),
        write_addr => bank_mem_write_addr(BANK),
        write_enable => bank_mem_write_enable(BANK),
        write_tag => bank_mem_write_tag(BANK),
        write_tag_out => bank_mem_write_tag_out(BANK),
        write_ack => bank_mem_write_ack(BANK),
        write_result_ready => bank_mem_write_result_ready(BANK),
        write_result_accept => bank_mem_write_result_accept(BANK),
        read_data => bank_mem_read_data(BANK),
        read_addr => bank_mem_read_addr(BANK),
        read_enable => bank_mem_read_enable(BANK),
        read_ack => bank_mem_read_ack(BANK),
        read_result_ready => bank_mem_read_result_ready(BANK),
        read_result_accept => bank_mem_read_result_accept(BANK),
        read_tag => bank_mem_read_tag(BANK),
        read_tag_out => bank_mem_read_tag_out(BANK));

    bank_mem_store_port_id_out(BANK) <= bank_mem_write_tag_out(BANK)(c_store_port_id_width + time_stamp_width-1 downto 
				time_stamp_width);
    bank_mem_store_tag_out(BANK) <=  bank_mem_write_tag_out(BANK)(c_store_port_id_width + time_stamp_width + tag_width-1 downto time_stamp_width + c_store_port_id_width); 

    ---------------------------------------------------------------------------
    -- connections to store demerge tree
    ---------------------------------------------------------------------------
    store_demerge_data_in((BANK+1)*c_store_demerge_data_width -1 downto (BANK*c_store_demerge_data_width))
      <= bank_mem_write_tag_out(BANK);

    bank_mem_write_result_accept(BANK) <= store_demerge_to_bank_ack(BANK);
    store_demerge_from_bank_req(BANK) <= bank_mem_write_result_ready(BANK);

    ---------------------------------------------------------------------------
    -- store demerge tree
    ---------------------------------------------------------------------------
    
    storeDemerge: demerge_tree
      generic map (g_demux_degree => c_demux_degree,
                   g_number_of_outputs => num_stores,
                   g_data_width => c_store_demerge_data_width,
                   g_id_width => c_store_port_id_width,
                   g_stage_id => 0)
      port map (demerge_data_out => store_demerge_data_out(BANK),
                demerge_ack_out => store_demerge_to_bank_ack(BANK),
                demerge_req_in => store_demerge_from_bank_req(BANK),
                demerge_data_in => store_demerge_data_in((BANK+1)*c_store_demerge_data_width-1 downto BANK*c_store_demerge_data_width),
                demerge_ready_out => store_demerge_to_port_req(BANK),
                demerge_accept_in =>  store_demerge_from_port_ack(BANK),
                demerge_sel_in => bank_mem_write_tag_out(BANK)(time_stamp_width+c_store_port_id_width-1 downto time_stamp_width),
                clock => clock,
                reset => reset);

    ---------------------------------------------------------------------------
    -- data/control connections to load demerge tree
    ---------------------------------------------------------------------------
    load_demerge_data_in((BANK+1)*c_load_demerge_data_width -1 downto (BANK*c_load_demerge_data_width))
      <= bank_mem_read_data(BANK) & bank_mem_read_tag_out(BANK);
    
    bank_mem_read_result_accept(BANK) <= load_demerge_to_bank_ack(BANK);
    load_demerge_from_bank_req(BANK) <= bank_mem_read_result_ready(BANK);
    
    ---------------------------------------------------------------------------
    -- load demerge tree
    ---------------------------------------------------------------------------
    loadDemerge: demerge_tree
      generic map (g_demux_degree => c_demux_degree,
                   g_number_of_outputs => num_loads,
                   g_data_width => c_load_demerge_data_width,
                   g_id_width => c_load_port_id_width,
                   g_stage_id => 0)
      port map (demerge_data_out => load_demerge_data_out(BANK),
                demerge_ack_out => load_demerge_to_bank_ack(BANK),
                demerge_req_in => load_demerge_from_bank_req(BANK),
                demerge_data_in => load_demerge_data_in((BANK+1)*c_load_demerge_data_width-1 downto BANK*c_load_demerge_data_width),
                demerge_ready_out => load_demerge_to_port_req(BANK),
                demerge_accept_in =>  load_demerge_from_port_ack(BANK),
                demerge_sel_in => bank_mem_read_tag_out(BANK)(time_stamp_width+c_load_port_id_width-1 downto time_stamp_width),
                clock => clock,
                reset => reset);

  end generate BankGen;
end pipelined;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

-- memory subsystem guarantees that accesses to the same location
-- will take place in the order of the time-stamp assigned to each
-- access (tie breaks will be random). Time-stamp is set at the
-- point of acceptance of an access request.

entity memory_subsystem is
  generic(num_loads             : natural := 5;
          num_stores            : natural := 10;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7;
          number_of_banks       : natural := 1;
          mux_degree            : natural := 10;
          demux_degree          : natural := 10;
	  base_bank_addr_width  : natural := 8;
	  base_bank_data_width  : natural := 8);
  port(
    ------------------------------------------------------------------------------
    -- load request ports
    ------------------------------------------------------------------------------
    lr_addr_in : in std_logic_vector((num_loads*addr_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on load request.
    lr_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lr_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag for request, will be returned on completion.
    lr_tag_in : in std_logic_vector((num_loads*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- load complete ports
    ---------------------------------------------------------------------------
    lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, user should latch data_out.
    lc_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lc_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag of completed request.
    lc_tag_out : out std_logic_vector((num_loads*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- store request ports
    ------------------------------------------------------------------------------
    sr_addr_in : in std_logic_vector((num_stores*addr_width)-1 downto 0);
    sr_data_in : in std_logic_vector((num_stores*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on store request.
    sr_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sr_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag for request, will be returned on completion.
    sr_tag_in : in std_logic_vector((num_stores*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- store complete ports
    ---------------------------------------------------------------------------
    -- req/ack pair:
    -- when both are asserted, user assumes that store is done.
    sc_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sc_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag of completed request.
    sc_tag_out : out std_logic_vector((num_stores*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- clock, reset
    ------------------------------------------------------------------------------
    clock : in std_logic;  -- only rising edge is used to trigger activity.
    reset : in std_logic               -- active high.
    );
end entity memory_subsystem;


architecture bufwrap of memory_subsystem is

  constant time_stamp_width : natural := 2 + Ceil_Log2(num_loads + num_stores);   --  two msb bits for identification
  
  signal lr_addr_in_core :std_logic_vector((num_loads*addr_width)-1 downto 0);
  signal lr_req_in_core  :std_logic_vector(num_loads-1 downto 0);
  signal lr_ack_out_core :std_logic_vector(num_loads-1 downto 0);
  signal lr_tag_in_core :std_logic_vector((num_loads*tag_width)-1 downto 0);
  signal lr_time_stamp_in_core :std_logic_vector((num_loads*time_stamp_width)-1 downto 0);  

  signal sr_addr_in_core :std_logic_vector((num_stores*addr_width)-1 downto 0);
  signal sr_data_in_core :std_logic_vector((num_stores*data_width)-1 downto 0);
  signal sr_req_in_core  : std_logic_vector(num_stores-1 downto 0);
  signal sr_ack_out_core : std_logic_vector(num_stores-1 downto 0);
  signal sr_tag_in_core :std_logic_vector((num_stores*tag_width)-1 downto 0);
  signal sr_time_stamp_in_core :std_logic_vector((num_stores*time_stamp_width)-1 downto 0);
  

  type LoadRepeaterData is array (natural range <> ) of std_logic_vector(time_stamp_width+addr_width+tag_width - 1 downto 0);
  type StoreRepeaterData is array (natural range <> ) of std_logic_vector(time_stamp_width+data_width+addr_width+tag_width - 1 downto 0);
  signal load_repeater_data_in, load_repeater_data_out: LoadRepeaterData(0 to num_loads-1);
  signal store_repeater_data_in, store_repeater_data_out: StoreRepeaterData(0 to num_stores-1);

  signal raw_time_stamp: std_logic_vector(time_stamp_width-1 downto 0);

begin

  -----------------------------------------------------------------------------
  -- time-stamp generation
  -----------------------------------------------------------------------------

  process(clock,reset)
  begin

    if clock'event and clock = '1' then
      if(reset = '1') then
        raw_time_stamp <= (others => '0');
      else
        raw_time_stamp <= IncrementSLV(raw_time_stamp);
      end if;
    end if;
  end process;

  -- instantiate repeaters for each load and store input
  LoadRepGen: for LOAD in 0 to num_loads-1 generate

    load_repeater_data_in(LOAD) <= raw_time_stamp &
                                   lr_addr_in((LOAD+1)*addr_width-1 downto LOAD*addr_width) &
                                   lr_tag_in((LOAD+1)*tag_width - 1 downto LOAD*tag_width);

    lr_time_stamp_in_core((LOAD+1)*time_stamp_width -1 downto LOAD*time_stamp_width) <=
      load_repeater_data_out(LOAD)(time_stamp_width+addr_width+tag_width-1 downto addr_width+tag_width);
    
    lr_addr_in_core((LOAD+1)*addr_width -1 downto LOAD*addr_width) <=
      load_repeater_data_out(LOAD)(addr_width+tag_width-1 downto tag_width);
    lr_tag_in_core((LOAD+1)*tag_width-1 downto LOAD*tag_width) <= load_repeater_data_out(LOAD)(tag_width-1 downto 0);
    
    Rptr : mem_shift_repeater generic map (
      g_data_width => time_stamp_width+ addr_width + tag_width,
	g_number_of_stages => 0)
      port map (
        clk      => clock,
        reset    => reset,
        data_in  => load_repeater_data_in(LOAD),
        req_in   => lr_req_in(LOAD),
        ack_out  => lr_ack_out(LOAD),
        data_out => load_repeater_data_out(LOAD),
        req_out  => lr_req_in_core(LOAD),
        ack_in   => lr_ack_out_core(LOAD));
    
  end generate LoadRepGen;


  StoreRepGen: for STORE in 0 to num_stores-1 generate
    store_repeater_data_in(STORE) <= raw_time_stamp &
                                     sr_data_in((STORE+1)*data_width-1 downto STORE*data_width) &
                                     sr_addr_in((STORE+1)*addr_width-1 downto STORE*addr_width) &
                                     sr_tag_in((STORE+1)*tag_width - 1 downto STORE*tag_width);

    sr_time_stamp_in_core((STORE+1)*time_stamp_width -1 downto STORE*time_stamp_width) <=
      store_repeater_data_out(STORE)(time_stamp_width+data_width+addr_width+tag_width-1 downto data_width+addr_width+tag_width);
    sr_data_in_core((STORE+1)*data_width -1 downto STORE*data_width) <=
          store_repeater_data_out(STORE)(data_width+addr_width+tag_width-1 downto addr_width+tag_width);
    sr_addr_in_core((STORE+1)*addr_width -1 downto STORE*addr_width) <=
      store_repeater_data_out(STORE)(addr_width+tag_width-1 downto tag_width);
    sr_tag_in_core((STORE+1)*tag_width-1 downto STORE*tag_width) <= store_repeater_data_out(STORE)(tag_width-1 downto 0);
    
    Rptr : mem_shift_repeater generic map (
      g_data_width => time_stamp_width+data_width + addr_width + tag_width,
      g_number_of_stages => 0)
      port map (
        clk      => clock,
        reset    => reset,
        data_in  => store_repeater_data_in(STORE),
        req_in   => sr_req_in(STORE),
        ack_out  => sr_ack_out(STORE),
        data_out => store_repeater_data_out(STORE),
        req_out  => sr_req_in_core(STORE),
        ack_in   => sr_ack_out_core(STORE));
    
  end generate StoreRepGen;

  core: memory_subsystem_core
    generic map (
      num_loads            => num_loads,
      num_stores           => num_stores,
      addr_width           => addr_width,
      data_width           => data_width,
      tag_width            => tag_width,
      time_stamp_width     => time_stamp_width,
      number_of_banks      => number_of_banks,
      mux_degree           => mux_degree,
      demux_degree         => demux_degree,
      base_bank_addr_width => base_bank_addr_width,
      base_bank_data_width => base_bank_data_width)
    port map (
      lr_addr_in  => lr_addr_in_core,
      lr_req_in   => lr_req_in_core,
      lr_ack_out  => lr_ack_out_core,
      lr_tag_in   => lr_tag_in_core,
      lr_time_stamp_in => lr_time_stamp_in_core,
      lc_data_out => lc_data_out,
      lc_req_in   => lc_req_in,
      lc_ack_out  => lc_ack_out,
      lc_tag_out  => lc_tag_out,
      sr_addr_in  => sr_addr_in_core,
      sr_data_in  => sr_data_in_core,
      sr_req_in   => sr_req_in_core,
      sr_ack_out  => sr_ack_out_core,
      sr_tag_in   => sr_tag_in_core,
      sr_time_stamp_in => sr_time_stamp_in_core,      
      sc_ack_out  => sc_ack_out,
      sc_req_in   => sc_req_in,
      sc_tag_out  => sc_tag_out,
      clock       => clock,
      reset       => reset);    
end bufwrap;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;
-- TODO: some bug here.

entity merge_box_with_repeater is 
  generic (g_data_width: natural := 10;
           g_number_of_inputs: natural := 8;
           g_number_of_outputs: natural := 1;
           g_time_stamp_width : natural := 3;   -- width of timestamp
           g_tag_width : natural := 3;  -- width of tag
           g_pipeline_flag: integer := 1     -- if 0, dont add pipe-line stage
           );            

  port(data_left: in  std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
       req_in : in std_logic_vector(g_number_of_inputs-1 downto 0);
       ack_out : out std_logic_vector(g_number_of_inputs-1 downto 0);
       data_right: out std_logic_vector((g_data_width*g_number_of_outputs)-1 downto 0);
       req_out : out std_logic_vector(g_number_of_outputs-1 downto 0);
       ack_in : in std_logic_vector(g_number_of_outputs-1 downto 0);
       clock: in std_logic;
       reset: in std_logic);

end merge_box_with_repeater;

architecture behave of merge_box_with_repeater is

  constant c_actual_data_width  : natural := g_data_width - g_time_stamp_width;
  constant c_num_inputs_per_tree : natural := Ceiling(g_number_of_inputs,g_number_of_outputs);
  constant c_residual_num_inputs_per_tree : natural := (g_number_of_inputs - ((g_number_of_outputs-1)*c_num_inputs_per_tree));
  
  signal in_data : std_logic_vector((c_actual_data_width*g_number_of_inputs)-1 downto 0);
  signal in_tstamp : std_logic_vector((g_time_stamp_width*g_number_of_inputs)-1 downto 0);
  signal in_req,in_ack : std_logic_vector(g_number_of_inputs-1 downto 0);
  signal out_req,out_ack : std_logic_vector(g_number_of_outputs-1 downto 0);
  signal out_data : std_logic_vector((g_number_of_outputs*c_actual_data_width)-1 downto 0);
  signal out_tstamp : std_logic_vector((g_number_of_outputs*g_time_stamp_width)-1 downto 0);
  
  signal repeater_in, repeater_out : std_logic_vector((g_number_of_outputs*g_data_width)-1 downto 0);
  signal repeater_in_req,repeater_in_ack,repeater_out_req,repeater_out_ack : std_logic_vector(g_number_of_outputs-1 downto 0);

  function RepeaterShiftDelay (constant x : integer)
    return integer is
    variable ret_var :integer;
  begin
    ret_var := 0;
    if(x > 0) then
      ret_var := 1;
    end if;
    return(ret_var);
  end RepeaterShiftDelay;
  constant shift_delay : integer := RepeaterShiftDelay(g_pipeline_flag);
  
begin  -- behave

  assert g_number_of_inputs > 0 and g_number_of_outputs > 0 report "at least one i/p and o/p needed in merge-box with repeater" severity error;
  
  -- unpack input-side signals.
  genIn: for I in 0 to g_number_of_inputs-1 generate
    in_data((c_actual_data_width*(I+1))-1 downto (c_actual_data_width*I)) <=
      data_left((g_data_width*(I+1) -1) downto ((g_data_width*(I+1))-c_actual_data_width));
    in_tstamp((g_time_stamp_width*(I+1))-1 downto (g_time_stamp_width*I)) <=
      data_left(((g_data_width*(I+1) - c_actual_data_width) - 1) downto (g_data_width*I));
    in_req(I) <= req_in(I);
    ack_out(I) <= in_ack(I);
  end generate genIn;

  -- unpack output side signals.
  genOut: for I in 0 to g_number_of_outputs-1 generate
    repeater_in((g_data_width)*(I+1)-1 downto ((g_data_width)*I))
      <= out_data((c_actual_data_width*(I+1))-1 downto (c_actual_data_width*I)) &
           out_tstamp((g_time_stamp_width*(I+1))-1 downto (g_time_stamp_width*I));

    repeater_in_req(I) <= out_req(I);
    out_ack(I) <= repeater_in_ack(I);
    
    data_right((g_data_width*(I+1))-1 downto (g_data_width*I)) <=
          repeater_out((g_data_width)*(I+1)-1 downto ((g_data_width)*I));
    req_out(I) <= repeater_out_req(I);
    repeater_out_ack(I) <= ack_in(I);
  end generate genOut;

  -- now instantiate the comb.merge block followed by the
  -- repeater.
  ifgen: if g_number_of_outputs > 1 generate
    
    genLogic: for J in 0 to g_number_of_outputs-2 generate

      cmerge: combinational_merge
        generic map(g_data_width        => c_actual_data_width,
                    g_number_of_inputs  => c_num_inputs_per_tree,
                    g_time_stamp_width  => g_time_stamp_width)
        port map(in_data    => in_data    (((J+1)*c_num_inputs_per_tree*c_actual_data_width)-1
                                           downto
                                           (J*c_num_inputs_per_tree*c_actual_data_width)),
                 in_tstamp  => in_tstamp  (((J+1)*c_num_inputs_per_tree*g_time_stamp_width)-1
                                           downto
                                           (J*c_num_inputs_per_tree*g_time_stamp_width)),
                 out_data   => out_data   ((J+1)*(c_actual_data_width)-1 downto (J*c_actual_data_width)),
                 out_tstamp => out_tstamp ((J+1)*(g_time_stamp_width)-1 downto (J*g_time_stamp_width)),
                 in_req     => in_req     (((J+1)*c_num_inputs_per_tree)-1 downto (J*c_num_inputs_per_tree)),
                 in_ack     => in_ack     (((J+1)*c_num_inputs_per_tree)-1 downto (J*c_num_inputs_per_tree)),
                 out_req    => out_req    (J),
                 out_ack    => out_ack    (J));

      Rptr: mem_shift_repeater generic map(g_data_width => g_data_width, g_number_of_stages => shift_delay)
        port map(clk      => clock,
                 reset    => reset,
                 data_in  => repeater_in      ((J+1)*(g_data_width) -1 downto (J*(g_data_width))),
                 req_in   => repeater_in_req  (J),
                 ack_out  => repeater_in_ack  (J),
                 data_out => repeater_out     ((J+1)*(g_data_width) -1 downto (J*(g_data_width))),
                 req_out  => repeater_out_req (J),
                 ack_in   => repeater_out_ack (J));
      
    end generate genLogic;
  end generate ifgen;


  -- residual block
  cmerge: combinational_merge
    generic map(g_data_width        => c_actual_data_width,
                g_number_of_inputs  => c_residual_num_inputs_per_tree,
                g_time_stamp_width  => g_time_stamp_width)
    port map(in_data    => in_data    ((g_number_of_inputs*c_actual_data_width-1) downto
                                       ((g_number_of_inputs*c_actual_data_width) -
                                        (c_residual_num_inputs_per_tree*c_actual_data_width))),
             in_tstamp  => in_tstamp  ((g_number_of_inputs*g_time_stamp_width-1) downto
                                       ((g_number_of_inputs*g_time_stamp_width) -
                                        (c_residual_num_inputs_per_tree*g_time_stamp_width))),
             out_data   => out_data   ((g_number_of_outputs)*(c_actual_data_width)-1 downto
                                       ((g_number_of_outputs-1)*c_actual_data_width)),
             out_tstamp => out_tstamp ((g_number_of_outputs)*(g_time_stamp_width)-1 downto
                                       ((g_number_of_outputs-1)*g_time_stamp_width)),
             in_req     => in_req     (g_number_of_inputs-1 downto
                                       (g_number_of_inputs - c_residual_num_inputs_per_tree)),
             in_ack     => in_ack     (g_number_of_inputs-1 downto
                                       (g_number_of_inputs - c_residual_num_inputs_per_tree)),
             out_req    => out_req    (g_number_of_outputs-1),
             out_ack    => out_ack    (g_number_of_outputs-1));

  -- residual repeater
  Rptr: mem_shift_repeater generic map(g_data_width => g_data_width, g_number_of_stages => shift_delay)
    port map(clk      => clock,
             reset    => reset,
             data_in  => repeater_in      ((g_number_of_outputs)*(g_data_width) -1 downto ((g_number_of_outputs-1)*(g_data_width))),
             req_in   => repeater_in_req  (g_number_of_outputs-1),
             ack_out  => repeater_in_ack  (g_number_of_outputs-1),
             data_out => repeater_out     ((g_number_of_outputs)*(g_data_width) -1 downto ((g_number_of_outputs-1)*(g_data_width))),
             req_out  => repeater_out_req (g_number_of_outputs-1),
             ack_in   => repeater_out_ack (g_number_of_outputs-1));

end behave;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

entity merge_tree is
  generic (
    g_number_of_inputs: natural;          
    g_data_width: natural;          -- total width of data
                                        -- (= actual-data & timestamp)
    g_time_stamp_width : natural ;   -- width of timestamp
    g_tag_width : natural;          -- width of tag
    g_mux_degree :natural;         -- max-indegree of each pipeline-stage
    g_num_stages: natural ;
    g_port_id_width: natural
    );       

  port (
    merge_data_in : in std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
    merge_req_in  : in std_logic_vector(g_number_of_inputs-1 downto 0);
    merge_ack_out : out std_logic_vector(g_number_of_inputs-1 downto 0);
    merge_data_out: out std_logic_vector(g_data_width-1 downto 0);
    merge_req_out : out std_logic;
    merge_ack_in  : in std_logic;
    clock: in std_logic;
    reset: in std_logic);
  
end merge_tree;


architecture pipelined of merge_tree is
  constant c_number_of_stages : integer := Maximum(1,Ceil_Log(g_number_of_inputs, g_mux_degree));
  constant c_residual_num_stages : integer := Maximum(0,g_num_stages - c_number_of_stages);
  constant c_total_intermediate_width : natural := Total_Intermediate_Width(g_number_of_inputs,g_mux_degree);

  -- intermediate signals used to cross levels.
  signal intermediate_vector : std_logic_vector(0 to ((g_data_width)*c_total_intermediate_width)-1);  
  signal intermediate_req_vector : std_logic_vector(0 to (c_total_intermediate_width)-1);
  signal intermediate_ack_vector : std_logic_vector(0 to (c_total_intermediate_width)-1);

begin  -- behave
  assert g_num_stages >= c_number_of_stages report "requested number of stages should be >= number of stages implied by mux-degree" severity error;
  assert Stage_Width(c_number_of_stages,g_mux_degree, g_number_of_inputs) = 1 report "last stage should have one input!" severity error;
  
  intermediate_vector(
    Left_Index(0,g_mux_degree,g_number_of_inputs)*g_data_width to
    ((Right_Index(0,g_mux_degree,g_number_of_inputs)+1)*g_data_width)-1)
    <= merge_data_in;

  intermediate_req_vector(
    Left_Index(0,g_mux_degree,g_number_of_inputs) to
    Right_Index(0,g_mux_degree,g_number_of_inputs))
    <= merge_req_in;

  merge_ack_out <=
    intermediate_ack_vector(
      Left_Index(0,g_mux_degree,g_number_of_inputs) to
      Right_Index(0,g_mux_degree,g_number_of_inputs));

  PipelineGen:  for LEVEL  in 0 to c_number_of_stages-1  generate

    -- mbox with repeater has multiple outputs, with tree driving
    -- each output and repeater present at each output.
    mBoxPipeStage : merge_box_with_repeater generic map (
      g_data_width => g_data_width,
      g_number_of_inputs => Stage_Width(LEVEL,g_mux_degree,g_number_of_inputs),
      g_number_of_outputs => Stage_Width(LEVEL+1,g_mux_degree,g_number_of_inputs),
      g_time_stamp_width => g_time_stamp_width,
      g_tag_width => g_tag_width,
      g_pipeline_flag => c_number_of_stages-1 )
      port map ( data_left =>
                 intermediate_vector(
                   Left_Index(LEVEL,g_mux_degree,g_number_of_inputs)*g_data_width to
                   ((Right_Index(LEVEL,g_mux_degree,g_number_of_inputs)+1)*g_data_width)-1),
                 req_in =>
                 intermediate_req_vector(
                   Left_Index(LEVEL,g_mux_degree,g_number_of_inputs) to
                   Right_Index(LEVEL,g_mux_degree,g_number_of_inputs)),
                 ack_out =>
                   intermediate_ack_vector(
                     Left_Index(LEVEL,g_mux_degree,g_number_of_inputs) to
                     Right_Index(LEVEL,g_mux_degree,g_number_of_inputs)),
                 data_right =>
                 intermediate_vector(
                   Left_Index(LEVEL+1,g_mux_degree,g_number_of_inputs)*g_data_width to
                   ((Right_Index(LEVEL+1,g_mux_degree,g_number_of_inputs)+1)*g_data_width)-1),
                 req_out =>
                 intermediate_req_vector(
                   Left_Index(LEVEL+1,g_mux_degree,g_number_of_inputs) to
                   Right_Index(LEVEL+1,g_mux_degree,g_number_of_inputs)),
                 ack_in =>
                   intermediate_ack_vector(
                     Left_Index(LEVEL+1,g_mux_degree,g_number_of_inputs) to
                     Right_Index(LEVEL+1,g_mux_degree,g_number_of_inputs)),
                 clock => clock,
                 reset => reset);
                   
  end generate;  -- PipelineGen

  -- to the right (pad the required number of shifts)
  finalRptr : mem_shift_repeater generic map (
    g_data_width => g_data_width,
    g_number_of_stages => c_residual_num_stages)
    port map (
      clk     => clock,
      reset   => reset,
      data_in => intermediate_vector(
        Left_Index(c_number_of_stages,g_mux_degree,g_number_of_inputs)*g_data_width to
        ((Right_Index(c_number_of_stages,g_mux_degree,g_number_of_inputs)+1)*g_data_width)-1),
      req_in => intermediate_req_vector(Left_Index(c_number_of_stages,g_mux_degree, g_number_of_inputs)),
      ack_out =>   intermediate_ack_vector(Left_Index(c_number_of_stages,g_mux_degree, g_number_of_inputs)),
      data_out => merge_data_out,
      req_out => merge_req_out,
      ack_in => merge_ack_in);
end pipelined;

-- architecture combinational of merge_tree is
--   constant actual_data_width : natural := g_data_width - (g_time_stamp_width);
--   signal data_sig : std_logic_vector(g_number_of_inputs*actual_data_width-1 downto 0);

--   signal out_data_sig : std_logic_vector(actual_data_width-1 downto 0);
--   signal out_tstamp_sig : std_logic_vector(g_time_stamp_width-1 downto 0);
--   signal tstamp_sig : std_logic_vector(g_number_of_inputs*g_time_stamp_width -1  downto 0);
  
-- begin  -- combinational
--   assert g_data_width > g_time_stamp_width report "data width smaller than time-stamp in merge?" severity error;
--   packGen: for P in 0 to g_number_of_inputs-1 generate
--     data_sig((P+1)*actual_data_width-1 downto P*actual_data_width) <=
--       merge_data_in((P+1)*g_data_width-1 downto (P+1)*g_data_width - (actual_data_width));
--     tstamp_sig((P+1)*g_time_stamp_width-1 downto P*g_time_stamp_width) <=
--       merge_data_in((P*g_data_width)+g_time_stamp_width-1 downto P*g_data_width);
--   end generate packGen;

--   cMerge : combinational_merge generic map (
--     g_data_width       => actual_data_width,
--     g_number_of_inputs => g_number_of_inputs,
--     g_time_stamp_width => g_time_stamp_width)
--     port map (
--       in_data    => data_sig,
--       out_data   => out_data_sig,
--       in_tstamp  => tstamp_sig,
--       out_tstamp => out_tstamp_sig,
--       in_req     => merge_req_in,
--       in_ack     => merge_ack_out,
--       out_req    => merge_req_out,
--       out_ack    => merge_ack_in);

--   merge_data_out <= out_data_sig & out_tstamp_sig;
-- end combinational;
  
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

-- memory subsystem guarantees that accesses to the same location
-- will take place in the order of the time-stamp assigned to each
-- access (tie breaks will be random). Time-stamp is set at the
-- point of acceptance of an access request.

entity ordered_memory_subsystem is
  generic(num_loads             : natural := 5;
          num_stores            : natural := 10;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7;
          time_stamp_width      : natural := 0;
          number_of_banks       : natural := 1;
          mux_degree            : natural := 10;
          demux_degree          : natural := 10;
	  base_bank_addr_width  : natural := 8;
	  base_bank_data_width  : natural := 8);
  port(
    ------------------------------------------------------------------------------
    -- load request ports
    ------------------------------------------------------------------------------
    lr_addr_in : in std_logic_vector((num_loads*addr_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on load request.
    lr_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lr_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag + timestamp: tag will be returned on completion..
    lr_tag_in: in std_logic_vector((num_loads*(tag_width+time_stamp_width))-1 downto 0);

    ---------------------------------------------------------------------------
    -- load complete ports
    ---------------------------------------------------------------------------
    lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, user should latch data_out.
    lc_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lc_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag of completed request.
    lc_tag_out : out std_logic_vector((num_loads*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- store request ports
    ------------------------------------------------------------------------------
    sr_addr_in : in std_logic_vector((num_stores*addr_width)-1 downto 0);
    sr_data_in : in std_logic_vector((num_stores*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on store request.
    sr_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sr_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag for request, will be returned on completion.
    sr_tag_in : in std_logic_vector((num_stores*(tag_width+time_stamp_width))-1 downto 0);

    ---------------------------------------------------------------------------
    -- store complete ports
    ---------------------------------------------------------------------------
    -- req/ack pair:
    -- when both are asserted, user assumes that store is done.
    sc_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sc_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag of completed request.
    sc_tag_out : out std_logic_vector((num_stores*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- clock, reset
    ------------------------------------------------------------------------------
    clock : in std_logic;  -- only rising edge is used to trigger activity.
    reset : in std_logic               -- active high.
    );
end entity ordered_memory_subsystem;


architecture bufwrap of ordered_memory_subsystem is

  
  signal lr_addr_in_core :std_logic_vector((num_loads*addr_width)-1 downto 0);
  signal lr_req_in_core  :std_logic_vector(num_loads-1 downto 0);
  signal lr_ack_out_core :std_logic_vector(num_loads-1 downto 0);
  signal lr_tag_in_core :std_logic_vector((num_loads*tag_width)-1 downto 0);
  signal lr_time_stamp_in_core :std_logic_vector((num_loads*time_stamp_width)-1 downto 0);  

  signal sr_addr_in_core :std_logic_vector((num_stores*addr_width)-1 downto 0);
  signal sr_data_in_core :std_logic_vector((num_stores*data_width)-1 downto 0);
  signal sr_req_in_core  : std_logic_vector(num_stores-1 downto 0);
  signal sr_ack_out_core : std_logic_vector(num_stores-1 downto 0);
  signal sr_tag_in_core :std_logic_vector((num_stores*tag_width)-1 downto 0);
  signal sr_time_stamp_in_core :std_logic_vector((num_stores*time_stamp_width)-1 downto 0);
  

  type LoadRepeaterData is array (natural range <> ) of std_logic_vector(time_stamp_width+addr_width+tag_width - 1 downto 0);
  type StoreRepeaterData is array (natural range <> ) of std_logic_vector(time_stamp_width+data_width+addr_width+tag_width - 1 downto 0);
  signal load_repeater_data_in, load_repeater_data_out: LoadRepeaterData(0 to num_loads-1);
  signal store_repeater_data_in, store_repeater_data_out: StoreRepeaterData(0 to num_stores-1);

  signal raw_time_stamp: std_logic_vector(time_stamp_width-1 downto 0);

begin

  -- instantiate repeaters for each load and store input
  LoadRepGen: for LOAD in 0 to num_loads-1 generate


    load_repeater_data_in(LOAD) <= lr_addr_in((LOAD+1)*addr_width-1 downto LOAD*addr_width) &
                                   lr_tag_in((LOAD+1)*(tag_width+time_stamp_width) - 1 downto 
					LOAD*(tag_width+time_stamp_width));

    lr_time_stamp_in_core((LOAD+1)*time_stamp_width -1 downto LOAD*time_stamp_width) <=
      load_repeater_data_out(LOAD)(time_stamp_width-1 downto 0);
    
    lr_addr_in_core((LOAD+1)*addr_width -1 downto LOAD*addr_width) <=
      load_repeater_data_out(LOAD)(addr_width+tag_width+time_stamp_width-1 downto tag_width+time_stamp_width);
    lr_tag_in_core((LOAD+1)*tag_width-1 downto LOAD*tag_width) <= load_repeater_data_out(LOAD)(tag_width+time_stamp_width-1 downto time_stamp_width);
    
    Rptr : mem_shift_repeater generic map (
      g_data_width => time_stamp_width+ addr_width + tag_width,
	g_number_of_stages => 1)
      port map (
        clk      => clock,
        reset    => reset,
        data_in  => load_repeater_data_in(LOAD),
        req_in   => lr_req_in(LOAD),
        ack_out  => lr_ack_out(LOAD),
        data_out => load_repeater_data_out(LOAD),
        req_out  => lr_req_in_core(LOAD),
        ack_in   => lr_ack_out_core(LOAD));
    
  end generate LoadRepGen;


  StoreRepGen: for STORE in 0 to num_stores-1 generate
    store_repeater_data_in(STORE) <= sr_data_in((STORE+1)*data_width-1 downto STORE*data_width) &
                                     sr_addr_in((STORE+1)*addr_width-1 downto STORE*addr_width) &
                                     sr_tag_in((STORE+1)*(tag_width+time_stamp_width) - 1 downto 
						STORE*(tag_width+time_stamp_width));

    sr_time_stamp_in_core((STORE+1)*time_stamp_width -1 downto STORE*time_stamp_width) <=
      store_repeater_data_out(STORE)(time_stamp_width-1 downto 0);
    sr_data_in_core((STORE+1)*data_width -1 downto STORE*data_width) <=
          store_repeater_data_out(STORE)(data_width+addr_width+tag_width+time_stamp_width-1 downto addr_width+tag_width+time_stamp_width);
    sr_addr_in_core((STORE+1)*addr_width -1 downto STORE*addr_width) <=
      store_repeater_data_out(STORE)(addr_width+tag_width+time_stamp_width-1 downto tag_width+time_stamp_width);
    sr_tag_in_core((STORE+1)*tag_width-1 downto STORE*tag_width) <= store_repeater_data_out(STORE)(tag_width+time_stamp_width-1 downto time_stamp_width);
    
    Rptr : mem_shift_repeater generic map (
      g_data_width => time_stamp_width+data_width + addr_width + tag_width,
      g_number_of_stages => 1)
      port map (
        clk      => clock,
        reset    => reset,
        data_in  => store_repeater_data_in(STORE),
        req_in   => sr_req_in(STORE),
        ack_out  => sr_ack_out(STORE),
        data_out => store_repeater_data_out(STORE),
        req_out  => sr_req_in_core(STORE),
        ack_in   => sr_ack_out_core(STORE));
    
  end generate StoreRepGen;

  core: memory_subsystem_core
    generic map (
      num_loads            => num_loads,
      num_stores           => num_stores,
      addr_width           => addr_width,
      data_width           => data_width,
      tag_width            => tag_width,
      time_stamp_width     => time_stamp_width,
      number_of_banks      => number_of_banks,
      mux_degree           => mux_degree,
      demux_degree         => demux_degree,
      base_bank_addr_width => base_bank_addr_width,
      base_bank_data_width => base_bank_data_width)
    port map (
      lr_addr_in  => lr_addr_in_core,
      lr_req_in   => lr_req_in_core,
      lr_ack_out  => lr_ack_out_core,
      lr_tag_in   => lr_tag_in_core,
      lr_time_stamp_in => lr_time_stamp_in_core,
      lc_data_out => lc_data_out,
      lc_req_in   => lc_req_in,
      lc_ack_out  => lc_ack_out,
      lc_tag_out  => lc_tag_out,
      sr_addr_in  => sr_addr_in_core,
      sr_data_in  => sr_data_in_core,
      sr_req_in   => sr_req_in_core,
      sr_ack_out  => sr_ack_out_core,
      sr_tag_in   => sr_tag_in_core,
      sr_time_stamp_in => sr_time_stamp_in_core,      
      sc_ack_out  => sc_ack_out,
      sc_req_in   => sc_req_in,
      sc_tag_out  => sc_tag_out,
      clock       => clock,
      reset       => reset);    
end bufwrap;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.types.all;
use ahir.utilities.all;
use ahir.subprograms.all;

entity CombinationalMux is
  generic (
    g_data_width       : integer := 32;
    g_number_of_inputs: integer := 2);
  port(
    in_data: in std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
    out_data: out std_logic_vector(g_data_width-1 downto 0);
    in_req: in std_logic_vector(g_number_of_inputs-1 downto 0);
    in_ack: out std_logic_vector(g_number_of_inputs-1 downto 0);
    out_req: out std_logic;
    out_ack: in std_logic);
end CombinationalMux;

architecture combinational_merge of CombinationalMux is

  signal sel_vector : std_logic_vector(g_number_of_inputs-1 downto 0);
  
begin  -- combinational_merge

  sel_vector <= PriorityEncode(in_req);
  out_req <= OrReduce(in_req);
  in_ack <= sel_vector when out_ack = '1' else (others => '0');



  process(sel_vector,in_data)
  begin
    out_data <= (others => '0');
    for I in 0 to g_number_of_inputs-1 loop
	if(sel_vector(I) = '1') then
	 	out_data <= in_data((g_data_width*(I+1))-1 downto (g_data_width*I));
		exit;
	end if;
    end loop;
  end process;
	   
  
  AckGen: for I in 0 to g_number_of_inputs-1 generate
    in_ack(I) <= '1' when (sel_vector(I) = '1'  and out_ack = '1' and in_req(I) = '1') else '0';
  end generate AckGen;
  
end combinational_merge;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;
use ahir.Utilities.all;

entity PipelinedDemux is
  generic ( g_data_width: natural := 10;
            g_destination_id_width : natural := 3;
            g_number_of_outputs: natural := 8);
  port(data_in: in std_logic_vector(g_data_width-1 downto 0);  -- data & destination-id 
       sel_in : in std_logic_vector(g_destination_id_width-1 downto 0);
       req_in: in std_logic;
       ack_out : out std_logic;
       data_out: out std_logic_vector((g_number_of_outputs*g_data_width)-1 downto 0 );
       req_out: out std_logic_vector(g_number_of_outputs-1 downto 0);
       ack_in : in std_logic_vector(g_number_of_outputs-1 downto 0);
       clk: in std_logic;
       reset: in std_logic);
end entity;

architecture behave of PipelinedDemux is
  type SigArrayType is array (natural range <>) of std_logic_vector(g_data_width-1 downto 0);

  signal data_out_sig,repeater_out_sig : SigArrayType(g_number_of_outputs-1 downto 0);
  signal req_out_sig, ack_in_sig : std_logic_vector(g_number_of_outputs-1 downto 0);
  signal conditioned_ack_in_sig: std_logic_vector(g_number_of_outputs-1 downto 0);

begin  -- behave

  
  conditioned_ack_in_sig <= ack_in_sig and req_out_sig;
  ack_out <= OrReduce(conditioned_ack_in_sig);
    
  gen: for I in 0 to g_number_of_outputs-1 generate

    data_out_sig(I) <= data_in;
    
    process(data_in, sel_in, req_in)
      variable port_index : natural;
    begin
      port_index := To_Integer(sel_in);
      req_out_sig(I) <= '0';
      if(req_in = '1' and port_index = I) then
        req_out_sig(I) <= req_in;
      end if;
    end process;
      
    Repeater : QueueBase generic map(queue_depth => 2, data_width => g_data_width)
    port map (
      clk      => clk,
      reset    => reset,
      data_in  => data_out_sig(I),
      push_req  => req_out_sig(I),
      push_ack  => ack_in_sig(I),
      data_out => repeater_out_sig(I),
      pop_ack  => req_out(I),
      pop_Req   => ack_in(I));

    data_out((I+1)*g_data_width -1 downto I*g_data_width) <= repeater_out_sig(I);
  end generate gen;

end behave;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;
use ahir.BaseComponents.all;

entity PipelinedMuxStage is 
  generic (g_data_width: integer := 10;
           g_number_of_inputs: integer := 8;
           g_number_of_outputs: integer := 1;
           g_tag_width : integer := 3  -- width of tag
           );            

  port(data_left: in  std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
       req_in : in std_logic_vector(g_number_of_inputs-1 downto 0);
       ack_out : out std_logic_vector(g_number_of_inputs-1 downto 0);
       data_right: out std_logic_vector((g_data_width*g_number_of_outputs)-1 downto 0);
       req_out : out std_logic_vector(g_number_of_outputs-1 downto 0);
       ack_in : in std_logic_vector(g_number_of_outputs-1 downto 0);
       clock: in std_logic;
       reset: in std_logic);

end PipelinedMuxStage;

architecture behave of PipelinedMuxStage is

  constant c_num_inputs_per_tree : integer := Ceiling(g_number_of_inputs,g_number_of_outputs);
  constant c_residual_num_inputs_per_tree : integer := (g_number_of_inputs - ((g_number_of_outputs-1)*c_num_inputs_per_tree));
  
  signal in_data : std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
  signal in_req,in_ack : std_logic_vector(g_number_of_inputs-1 downto 0);
  signal out_req,out_ack : std_logic_vector(g_number_of_outputs-1 downto 0);
  signal out_data : std_logic_vector((g_number_of_outputs*g_data_width)-1 downto 0);
  
  signal repeater_in, repeater_out : std_logic_vector((g_number_of_outputs*g_data_width)-1 downto 0);
  signal repeater_in_req,repeater_in_ack,repeater_out_req,repeater_out_ack : std_logic_vector(g_number_of_outputs-1 downto 0);

  
begin  -- behave

  assert g_number_of_inputs > 0 and g_number_of_outputs > 0 report "at least one i/p and o/p needed in merge-box with repeater" severity error;
  
  -- unpack input-side signals.
  genIn: for I in 0 to g_number_of_inputs-1 generate
    in_data((g_data_width*(I+1))-1 downto (g_data_width*I)) <=
      data_left((g_data_width*(I+1) -1) downto (g_data_width*I));
    in_req(I) <= req_in(I);
    ack_out(I) <= in_ack(I);
  end generate genIn;

  -- unpack output side signals.
  genOut: for I in 0 to g_number_of_outputs-1 generate
    repeater_in((g_data_width)*(I+1)-1 downto ((g_data_width)*I))
      <= out_data((g_data_width*(I+1))-1 downto (g_data_width*I));
    repeater_in_req(I) <= out_req(I);
    out_ack(I) <= repeater_in_ack(I);
    
    data_right((g_data_width*(I+1))-1 downto (g_data_width*I)) <=
          repeater_out((g_data_width)*(I+1)-1 downto ((g_data_width)*I));
    req_out(I) <= repeater_out_req(I);
    repeater_out_ack(I) <= ack_in(I);
  end generate genOut;

  -- now instantiate the comb.merge block followed by the
  -- repeater.
  ifgen: if g_number_of_outputs > 1 generate
    
    genLogic: for J in 0 to g_number_of_outputs-2 generate

      cmerge: CombinationalMux
        generic map(g_data_width        => g_data_width,
                    g_number_of_inputs  => c_num_inputs_per_tree)
        port map(in_data    => in_data    (((J+1)*c_num_inputs_per_tree*g_data_width)-1
                                           downto
                                           (J*c_num_inputs_per_tree*g_data_width)),
                 out_data   => out_data   ((J+1)*(g_data_width)-1 downto (J*g_data_width)),
                 in_req     => in_req     (((J+1)*c_num_inputs_per_tree)-1 downto (J*c_num_inputs_per_tree)),
                 in_ack     => in_ack     (((J+1)*c_num_inputs_per_tree)-1 downto (J*c_num_inputs_per_tree)),
                 out_req    => out_req    (J),
                 out_ack    => out_ack    (J));

      Rptr: QueueBase generic map(queue_depth => 2, data_width => g_data_width)
        port map(clk      => clock,
                 reset    => reset,
                 data_in  => repeater_in      ((J+1)*(g_data_width) -1 downto (J*(g_data_width))),
                 push_req   => repeater_in_req  (J),
                 push_ack  => repeater_in_ack  (J),
                 data_out => repeater_out     ((J+1)*(g_data_width) -1 downto (J*(g_data_width))),
                 pop_ack  => repeater_out_req (J),
                 pop_req   => repeater_out_ack (J));
      
    end generate genLogic;
  end generate ifgen;


  -- residual block
  cmerge: CombinationalMux
    generic map(g_data_width        => g_data_width,
                g_number_of_inputs  => c_residual_num_inputs_per_tree)
    port map(in_data    => in_data    ((g_number_of_inputs*g_data_width-1) downto
                                       ((g_number_of_inputs*g_data_width) -
                                        (c_residual_num_inputs_per_tree*g_data_width))),
             out_data   => out_data   ((g_number_of_outputs)*(g_data_width)-1 downto
                                       ((g_number_of_outputs-1)*g_data_width)),
             in_req     => in_req     (g_number_of_inputs-1 downto
                                       (g_number_of_inputs - c_residual_num_inputs_per_tree)),
             in_ack     => in_ack     (g_number_of_inputs-1 downto
                                       (g_number_of_inputs - c_residual_num_inputs_per_tree)),
             out_req    => out_req    (g_number_of_outputs-1),
             out_ack    => out_ack    (g_number_of_outputs-1));

  -- residual repeater
  Rptr: QueueBase generic map(queue_depth => 2, data_width => g_data_width)
    port map(clk      => clock,
             reset    => reset,
             data_in  => repeater_in      ((g_number_of_outputs)*(g_data_width) -1 downto ((g_number_of_outputs-1)*(g_data_width))),
             push_req   => repeater_in_req  (g_number_of_outputs-1),
             push_ack  => repeater_in_ack  (g_number_of_outputs-1),
             data_out => repeater_out     ((g_number_of_outputs)*(g_data_width) -1 downto ((g_number_of_outputs-1)*(g_data_width))),
             pop_ack  => repeater_out_req (g_number_of_outputs-1),
             pop_req   => repeater_out_ack (g_number_of_outputs-1));

end behave;
library ieee;
use ieee.std_logic_1164.all;


library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

entity PipelinedMux is
  generic (
    g_number_of_inputs: natural;          
    g_data_width: natural;          -- total width of data
                                        -- (= actual-data & tag & port_id)
    g_mux_degree :natural;         -- max-indegree of each pipeline-stage
    g_port_id_width: natural
    );       

  port (
    merge_data_in : in std_logic_vector((g_data_width*g_number_of_inputs)-1 downto 0);
    merge_req_in  : in std_logic_vector(g_number_of_inputs-1 downto 0);
    merge_ack_out : out std_logic_vector(g_number_of_inputs-1 downto 0);
    merge_data_out: out std_logic_vector(g_data_width-1 downto 0);
    merge_req_out : out std_logic;
    merge_ack_in  : in std_logic;
    clock: in std_logic;
    reset: in std_logic);
  
end PipelinedMux;


architecture pipelined of PipelinedMux is
  constant c_number_of_stages : integer := Maximum(1,Ceil_Log(g_number_of_inputs, g_mux_degree));
  constant c_total_intermediate_width : natural := Total_Intermediate_Width(g_number_of_inputs,g_mux_degree);

  -- intermediate signals used to cross levels.
  signal intermediate_vector : std_logic_vector(0 to ((g_data_width)*c_total_intermediate_width)-1);  
  signal intermediate_req_vector : std_logic_vector(0 to (c_total_intermediate_width)-1);
  signal intermediate_ack_vector : std_logic_vector(0 to (c_total_intermediate_width)-1);

begin  -- behave

  assert Stage_Width(c_number_of_stages,g_mux_degree, g_number_of_inputs) = 1 report "last stage should have one input!" severity error;
  
  intermediate_vector(
    Left_Index(0,g_mux_degree,g_number_of_inputs)*g_data_width to
    ((Right_Index(0,g_mux_degree,g_number_of_inputs)+1)*g_data_width)-1)
    <= merge_data_in;

  intermediate_req_vector(
    Left_Index(0,g_mux_degree,g_number_of_inputs) to
    Right_Index(0,g_mux_degree,g_number_of_inputs))
    <= merge_req_in;

  merge_ack_out <=
    intermediate_ack_vector(
      Left_Index(0,g_mux_degree,g_number_of_inputs) to
      Right_Index(0,g_mux_degree,g_number_of_inputs));

  PipelineGen:  for LEVEL  in 0 to c_number_of_stages-1  generate

    -- Each stage has multiple inputs and multiple outputs..
    mBoxPipeStage : PipelinedMuxStage generic map (
      g_data_width => g_data_width,
      g_number_of_inputs => Stage_Width(LEVEL,g_mux_degree,g_number_of_inputs),
      g_number_of_outputs => Stage_Width(LEVEL+1,g_mux_degree,g_number_of_inputs))
      port map ( data_left =>
                 intermediate_vector(
                   Left_Index(LEVEL,g_mux_degree,g_number_of_inputs)*g_data_width to
                   ((Right_Index(LEVEL,g_mux_degree,g_number_of_inputs)+1)*g_data_width)-1),
                 req_in =>
                 intermediate_req_vector(
                   Left_Index(LEVEL,g_mux_degree,g_number_of_inputs) to
                   Right_Index(LEVEL,g_mux_degree,g_number_of_inputs)),
                 ack_out =>
                   intermediate_ack_vector(
                     Left_Index(LEVEL,g_mux_degree,g_number_of_inputs) to
                     Right_Index(LEVEL,g_mux_degree,g_number_of_inputs)),
                 data_right =>
                 intermediate_vector(
                   Left_Index(LEVEL+1,g_mux_degree,g_number_of_inputs)*g_data_width to
                   ((Right_Index(LEVEL+1,g_mux_degree,g_number_of_inputs)+1)*g_data_width)-1),
                 req_out =>
                 intermediate_req_vector(
                   Left_Index(LEVEL+1,g_mux_degree,g_number_of_inputs) to
                   Right_Index(LEVEL+1,g_mux_degree,g_number_of_inputs)),
                 ack_in =>
                   intermediate_ack_vector(
                     Left_Index(LEVEL+1,g_mux_degree,g_number_of_inputs) to
                     Right_Index(LEVEL+1,g_mux_degree,g_number_of_inputs)),
                 clock => clock,
                 reset => reset);
                   
  end generate;  -- PipelineGen

  -- to the right (pad the required number of shifts)
  merge_data_out <= intermediate_vector(
        Left_Index(c_number_of_stages,g_mux_degree,g_number_of_inputs)*g_data_width to
        ((Right_Index(c_number_of_stages,g_mux_degree,g_number_of_inputs)+1)*g_data_width)-1);
  merge_req_out <= 
	intermediate_req_vector(Left_Index(c_number_of_stages,g_mux_degree, g_number_of_inputs));
  intermediate_ack_vector(Left_Index(c_number_of_stages,g_mux_degree, g_number_of_inputs)) 
	<= merge_ack_in;


end pipelined;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

-------------------------------------------------------------------------------
-- a simplified version of the memory subsystem to be used
-- when the number of storage locations is small..
--
-- this is equivalent to a num_loads read-port, num_stores write_port
-- register bank.
-------------------------------------------------------------------------------

entity register_bank is
  generic(num_loads             : natural := 5;
          num_stores            : natural := 10;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7;
          num_registers         : natural := 1);
  port(
    ------------------------------------------------------------------------------
    -- load request ports
    ------------------------------------------------------------------------------
    lr_addr_in : in std_logic_vector((num_loads*addr_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on load request.
    lr_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lr_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag for request, will be returned on completion.
    lr_tag_in : in std_logic_vector((num_loads*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- load complete ports
    ---------------------------------------------------------------------------
    lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, user should latch data_out.
    lc_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lc_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag of completed request.
    lc_tag_out : out std_logic_vector((num_loads*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- store request ports
    ------------------------------------------------------------------------------
    sr_addr_in : in std_logic_vector((num_stores*addr_width)-1 downto 0);
    sr_data_in : in std_logic_vector((num_stores*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on store request.
    sr_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sr_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag for request, will be returned on completion.
    sr_tag_in : in std_logic_vector((num_stores*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- store complete ports
    ---------------------------------------------------------------------------
    -- req/ack pair:
    -- when both are asserted, user assumes that store is done.
    sc_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sc_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag of completed request.
    sc_tag_out : out std_logic_vector((num_stores*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- clock, reset
    ------------------------------------------------------------------------------
    clock : in std_logic;  -- only rising edge is used to trigger activity.
    reset : in std_logic               -- active high.
    );
end entity register_bank;


-- architecture: synchronous R/W.
--               on destination conflict, writer with lowest index wins.
architecture Default of register_bank is
  type DataArray is array (natural range <>) of std_logic_vector(data_width-1 downto 0);
  type AddrArray is array (natural range <>) of std_logic_vector(addr_width-1 downto 0);

  signal register_array : DataArray(num_registers-1 downto 0) := (others => (others => '0'));

  signal lr_ack_flag: std_logic_vector(num_loads-1 downto 0);
  signal sr_ack_flag : std_logic_vector(num_stores-1 downto 0);
  
  signal lc_ack_flag : std_logic_vector(num_loads-1 downto 0);
  signal sc_ack_flag : std_logic_vector(num_stores-1 downto 0);

  signal lc_data_out_sig : std_logic_vector((num_loads*data_width)-1 downto 0);
  signal sc_tag_out_sig : std_logic_vector((num_stores*tag_width)-1 downto 0);
  signal lc_tag_out_sig : std_logic_vector((num_loads*tag_width)-1 downto 0);

  constant zero_addr : std_logic_vector(addr_width-1 downto 0) := (others => '0');
                                                                 
    
begin

  assert(2**addr_width >= num_registers) report "not enough address bits" severity failure;


  -- the read process. fully parallel reads.
  ReadGen: for R in 0 to num_loads-1 generate

    process(clock,lr_req_in,lc_ack_flag,reset,lr_addr_in)
      variable ack_var : std_logic;
      variable index : integer;
                                 
    begin
      ack_var := '0';
      index := 0;
      
      if(lr_req_in(R) = '1') then
        index := To_Integer(lr_addr_in(((R+1)*addr_width)-1 downto R*addr_width));
      end if;
      
      if(lr_req_in(R) = '1' and lc_ack_flag(R) = '0') then
        ack_var := '1';
      end if;
      
      lr_ack_out(R) <= ack_var;
      
      if(clock'event and clock = '1') then
        if(ack_var = '1') then
          assert (index < num_registers) report "index overflow." severity error;
          assert (index >= 0) report "index underflow" severity error;
          
          lc_data_out_sig(((R+1)*data_width)-1 downto R*data_width) <= register_array(index);
          lc_tag_out_sig(((R+1)*tag_width)-1 downto R*tag_width) <=
            lr_tag_in(((R+1)*tag_width)-1 downto R*tag_width);
          
        end if;
        
        if(reset = '1') then
          lc_ack_flag(R) <= '0';
        else
          if(ack_var = '1') then
            lc_ack_flag(R) <= '1';
          elsif lc_ack_flag(R) = '1' and lc_req_in(R) = '1' then
            lc_ack_flag(R) <= '0';
          end if;
        end if;
      end if;
    end process;
    
  end generate ReadGen;
  
  -- the write process
  -- for each register. loop across those who want to write in
  -- and find the lowest index which wins.
  process(clock,
	  reset,
          sr_req_in,
          sr_addr_in,
          sr_data_in,
          sr_tag_in,
          sc_req_in,
          sc_ack_flag,
	  sc_tag_out_sig,
          register_array)
    
    variable sc_ack_set, sc_ack_clear: std_logic_vector(num_stores-1 downto 0);
    variable sr_pending : std_logic_vector(num_registers-1 downto 0);
    
    variable sc_tag_out_var : std_logic_vector((num_stores*tag_width)-1 downto 0);
    variable register_array_var : DataArray(num_registers-1 downto 0);
    
  begin


    sc_ack_set := (others => '0');
    sc_ack_clear := (others => '0');
    sr_pending := (others => '0');

    sc_tag_out_var := sc_tag_out_sig;

    register_array_var := register_array;
    
    
    if(reset = '1') then
      sc_ack_clear := (others => '1');
    end if;
      
    -- for each register.
    for REG  in 0 to num_registers-1 loop
      
      -- writes: for each reg, lowest index succeeds.
      for W in 0 to num_stores-1 loop
        
        -- if W is a store request to this register
        -- and no j
        if(sr_pending(REG) = '0' and
           sr_req_in(W) = '1' and
           sc_ack_flag(W) = '0' and 
           (sr_addr_in(((W+1)*addr_width)-1 downto W*addr_width) = Natural_To_SLV(REG,addr_width)))
        then
          sr_pending(REG) := '1';
          sc_ack_set(W) := '1';
          register_array_var(REG) := sr_data_in(((W+1)*data_width)-1 downto W*data_width);
          sc_tag_out_var(((W+1)*tag_width)-1 downto W*tag_width) :=
            sr_tag_in(((W+1)*tag_width)-1 downto W*tag_width);
          
          exit;
        end if;
      end loop;  -- W
    end loop;  -- REG
    
    -- output latches and registers
    if(clock'event and clock = '1') then
      register_array <= register_array_var;
      sc_tag_out_sig <= sc_tag_out_var;
    end if;
  
    -- lc/sc ack clears.
    if(clock'event and clock = '1') then                
      for W in 0 to num_stores-1 loop
        
        -- if ack and req are both asserted, clear
        -- it unless asked to set it.
        if(sc_ack_flag(W) = '1' and sc_req_in(W) = '1') then
          sc_ack_clear(W) := '1';
        end if;
        
        -- set dominant!
        if(sc_ack_set(W) = '1') then
          sc_ack_flag(W) <= '1';
        elsif (sc_ack_clear(W) = '1') then
          sc_ack_flag(W) <= '0';
        end if;
      end loop;
    end if;      

    sr_ack_out <= sc_ack_set;
  end process;

  sc_ack_out <= sc_ack_flag;
  lc_ack_out <= lc_ack_flag;
  lc_data_out <= lc_data_out_sig;
  lc_tag_out <= lc_tag_out_sig;
  sc_tag_out <= sc_tag_out_sig;
  
end Default;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;

-- memory subsystem guarantees that accesses to the same location
-- will take place in the order of the time-stamp assigned to each
-- access (tie breaks will be random). Time-stamp is set at the
-- point of acceptance of an access request.

entity UnorderedMemorySubsystem is
  generic(num_loads             : natural := 5;
          num_stores            : natural := 10;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7;
          -- number_of_banks       : natural := 1; (will always be 1 in this memory)
          mux_degree            : natural := 10;
          demux_degree          : natural := 10;
	  base_bank_addr_width  : natural := 8;
	  base_bank_data_width  : natural := 8);
  port(
    ------------------------------------------------------------------------------
    -- load request ports
    ------------------------------------------------------------------------------
    lr_addr_in : in std_logic_vector((num_loads*addr_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on load request.
    lr_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lr_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag for request, will be returned on completion.
    lr_tag_in : in std_logic_vector((num_loads*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- load complete ports
    ---------------------------------------------------------------------------
    lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, user should latch data_out.
    lc_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lc_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag of completed request.
    lc_tag_out : out std_logic_vector((num_loads*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- store request ports
    ------------------------------------------------------------------------------
    sr_addr_in : in std_logic_vector((num_stores*addr_width)-1 downto 0);
    sr_data_in : in std_logic_vector((num_stores*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on store request.
    sr_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sr_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag for request, will be returned on completion.
    sr_tag_in : in std_logic_vector((num_stores*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- store complete ports
    ---------------------------------------------------------------------------
    -- req/ack pair:
    -- when both are asserted, user assumes that store is done.
    sc_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sc_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag of completed request.
    sc_tag_out : out std_logic_vector((num_stores*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- clock, reset
    ------------------------------------------------------------------------------
    clock : in std_logic;  -- only rising edge is used to trigger activity.
    reset : in std_logic               -- active high.
    );
end entity UnorderedMemorySubsystem;


architecture struct of UnorderedMemorySubsystem is

  
  constant c_load_port_id_width : natural := Maximum(1,Ceil_Log2(num_loads));
  constant c_store_port_id_width : natural := Maximum(1,Ceil_Log2(num_stores));

  type LoadPortIdArray is array (natural range <>) of std_logic_vector(c_load_port_id_width-1 downto 0);
  type StorePortIdArray is array (natural range <>) of std_logic_vector(c_store_port_id_width-1 downto 0);
  
  function StorePortIdGen (
    constant x : natural;
    constant width : natural
    )
    return StorePortIdArray
  is
    variable ret_var : StorePortIdArray(0 to x-1);
    variable curr_value : std_logic_vector(width-1 downto 0);
  begin
    curr_value := (others => '0');
    ret_var := (others => (others => '0'));
    for I  in 0 to x-1 loop
      ret_var(I) := curr_value;
      curr_value := IncrementSLV(curr_value);
    end loop;  -- I
    return(ret_var);
  end function StorePortIdGen;

  function LoadPortIdGen (
    constant x : natural;
    constant width : natural
    )
    return LoadPortIdArray
  is
    variable ret_var : LoadPortIdArray(0 to x-1);
    variable curr_value : std_logic_vector(width-1 downto 0);
  begin
    curr_value := (others => '0');
    ret_var := (others => (others => '0'));
    for I  in 0 to x-1 loop
      ret_var(I) := curr_value;
      curr_value := IncrementSLV(curr_value);
    end loop;  -- I
    return(ret_var);
  end function LoadPortIdGen;

  constant c_load_port_id_array : LoadPortIdArray(0 to num_loads-1) := LoadPortIdGen(num_loads, c_load_port_id_width);
  signal s_load_port_id_array: LoadPortIdArray(0 to num_loads-1);
  constant c_store_port_id_array : StorePortIdArray(0 to num_stores-1) := StorePortIdGen(num_stores, c_store_port_id_width);
  signal s_store_port_id_array: StorePortIdArray(0 to num_stores-1) ;

  constant rd_mux_data_width: integer :=  (addr_width + tag_width + c_load_port_id_width );
  constant wr_mux_data_width: integer :=  (addr_width + data_width + tag_width + c_store_port_id_width);

  signal rd_mux_data_in : std_logic_vector((num_loads*rd_mux_data_width)-1 downto 0);
  signal rd_mux_data_out : std_logic_vector(rd_mux_data_width-1 downto 0);
  signal rd_mux_out_req : std_logic;
  signal rd_mux_out_ack : std_logic;

  signal wr_mux_data_in : std_logic_vector((num_stores*wr_mux_data_width)-1 downto 0);
  signal wr_mux_data_out : std_logic_vector(wr_mux_data_width-1 downto 0);
  signal wr_mux_out_req : std_logic;
  signal wr_mux_out_ack : std_logic;

  signal rd_demux_sel_in  : std_logic_vector(c_load_port_id_width-1 downto 0);
  signal rd_demux_data_in : std_logic_vector(data_width+tag_width-1 downto 0);
  signal rd_demux_data_out : std_logic_vector((num_loads*(data_width+tag_width))-1 downto 0);
  signal rd_demux_in_req, rd_demux_in_ack : std_logic;
  signal rd_demux_out_req, rd_demux_out_ack : std_logic_vector(num_loads-1 downto 0);

  signal wr_demux_sel_in : std_logic_vector(c_store_port_id_width-1 downto 0);
  signal wr_demux_data_in : std_logic_vector(tag_width-1 downto 0);
  signal wr_demux_data_out : std_logic_vector((num_stores*tag_width)-1 downto 0);
  signal wr_demux_in_req, wr_demux_in_ack : std_logic;
  signal wr_demux_out_req, wr_demux_out_ack : std_logic_vector(num_stores-1 downto 0);

  signal mem_bank_write_data     : std_logic_vector(data_width-1 downto 0);
  signal mem_bank_write_addr     : std_logic_vector(addr_width-1 downto 0);
  signal mem_bank_write_tag, mem_bank_write_tag_out : 
	std_logic_vector(tag_width+c_store_port_id_width-1 downto 0);
  signal mem_bank_write_enable   : std_logic;
  signal mem_bank_write_ack   : std_logic;
  signal mem_bank_write_result_accept : std_logic;
  signal mem_bank_write_result_ready : std_logic;
  signal mem_bank_read_data     : std_logic_vector(data_width-1 downto 0);
  signal mem_bank_read_addr     : std_logic_vector(addr_width-1 downto 0);
  signal mem_bank_read_tag,mem_bank_read_tag_out  : std_logic_vector((c_load_port_id_width+tag_width)-1 downto 0);
  signal mem_bank_read_enable   : std_logic;
  signal mem_bank_read_ack      : std_logic;
  signal mem_bank_read_result_accept: std_logic;
  signal mem_bank_read_result_ready: std_logic;

begin

   s_load_port_id_array <= c_load_port_id_array;
   s_store_port_id_array <= c_store_port_id_array;

   -- read mux data aggregation
   process(lr_addr_in, lr_tag_in)
   begin
	for I in 0 to num_loads-1 loop
		rd_mux_data_in((rd_mux_data_width*(I+1))-1 downto rd_mux_data_width*I)
			<= lr_addr_in((addr_width*(I+1))-1 downto addr_width*I) &
				lr_tag_in((tag_width*(I+1))-1 downto tag_width*I) &
				   c_load_port_id_array(I); 
	end loop;
   end process;

  
   -- read mux data aggregation
   process(sr_addr_in,sr_data_in, sr_tag_in)
   begin
	for I in 0 to num_stores-1 loop
		wr_mux_data_in((wr_mux_data_width*(I+1))-1 downto wr_mux_data_width*I)
			<= sr_addr_in((addr_width*(I+1))-1 downto addr_width*I) & 
			     sr_data_in((data_width*(I+1))-1 downto data_width*I) & 
				sr_tag_in((tag_width*(I+1))-1 downto tag_width*I) &
				 c_store_port_id_array(I); 
	end loop;
   end process;
 
   -- Readmux instantiation.
   rmux: PipelinedMux generic map(g_number_of_inputs => num_loads,
				g_data_width => rd_mux_data_width,
			        g_mux_degree => mux_degree,
				g_port_id_width => c_load_port_id_width)
		port map(merge_data_in => rd_mux_data_in,
			  merge_req_in => lr_req_in,
			  merge_ack_out => lr_ack_out,
			  merge_data_out => rd_mux_data_out,
			  merge_req_out => rd_mux_out_req,
			  merge_ack_in => rd_mux_out_ack,
		          clock => clock,
			  reset => reset);	

    -- connect rmux to memory bank
    mem_bank_read_addr <= rd_mux_data_out(rd_mux_data_width-1 downto (rd_mux_data_width-addr_width));
    mem_bank_read_tag <= rd_mux_data_out((rd_mux_data_width-addr_width)-1 downto 0); -- tag & port-id
    mem_bank_read_enable <= rd_mux_out_req;
    rd_mux_out_ack <= mem_bank_read_ack;
    
				
   -- Writemux instantiation.
   wmux: PipelinedMux generic map(g_number_of_inputs => num_stores,
				g_data_width => wr_mux_data_width,
			        g_mux_degree => mux_degree,
				g_port_id_width => c_store_port_id_width)
		port map(merge_data_in => wr_mux_data_in,
			  merge_req_in => sr_req_in,
			  merge_ack_out => sr_ack_out,
			  merge_data_out => wr_mux_data_out,
			  merge_req_out => wr_mux_out_req,
			  merge_ack_in => wr_mux_out_ack,
		          clock => clock,
			  reset => reset);	

    -- connect to memory bank.
    mem_bank_write_addr <= wr_mux_data_out(wr_mux_data_width-1 downto (wr_mux_data_width-addr_width));
    mem_bank_write_data <= wr_mux_data_out((wr_mux_data_width-addr_width)-1 downto 
	((wr_mux_data_width-addr_width)-data_width));
    mem_bank_write_tag <= wr_mux_data_out((wr_mux_data_width-(data_width+addr_width))-1 downto 0);
    mem_bank_write_enable <= wr_mux_out_req;
    wr_mux_out_ack <= mem_bank_write_ack;


    -- the memory bank..
    mbank: memory_bank generic map(g_addr_width => addr_width,
				   g_data_width => data_width,
				   g_write_tag_width => (tag_width + c_store_port_id_width),
				   g_read_tag_width => (tag_width + c_load_port_id_width),
				   g_time_stamp_width => 0,  -- no time-stamp.
				   g_base_bank_addr_width => base_bank_addr_width,
			           g_base_bank_data_width => base_bank_data_width)
		port map(clk => clock,
			 reset => reset,
			 write_data => mem_bank_write_data,
			 write_addr => mem_bank_write_addr,
			 write_tag => mem_bank_write_tag,
			 write_tag_out => mem_bank_write_tag_out,
			 write_enable => mem_bank_write_enable,
			 write_ack => mem_bank_write_ack,
			 write_result_ready => mem_bank_write_result_ready,
			 write_result_accept => mem_bank_write_result_accept,
			 read_data => mem_bank_read_data,
			 read_addr => mem_bank_read_addr,
			 read_tag => mem_bank_read_tag,
			 read_tag_out => mem_bank_read_tag_out,
			 read_enable => mem_bank_read_enable,
			 read_ack => mem_bank_read_ack,
			 read_result_ready => mem_bank_read_result_ready,
			 read_result_accept => mem_bank_read_result_accept);
			

    -- memory bank to read-demux
    rd_demux_sel_in  <= mem_bank_read_tag_out(c_load_port_id_width-1 downto 0);
    rd_demux_data_in <= mem_bank_read_data & mem_bank_read_tag_out((tag_width+c_load_port_id_width)-1 downto c_load_port_id_width);
    rd_demux_in_req <= mem_bank_read_result_ready;
    mem_bank_read_result_accept <= rd_demux_in_ack;
 
    rd_demux: PipelinedDemux generic map (g_data_width => data_width+tag_width,
				       g_destination_id_width => c_load_port_id_width,
				       g_number_of_outputs => num_loads)
		port map(data_in => rd_demux_data_in,
			 sel_in => rd_demux_sel_in,
			 req_in => rd_demux_in_req,
			 ack_out => rd_demux_in_ack,
			 data_out => rd_demux_data_out,
			 req_out => rd_demux_out_req,
			 ack_in => rd_demux_out_ack,
			 clk => clock,
			 reset => reset);

    process(rd_demux_data_out)
    begin
       for I in 0 to num_loads-1 loop
	 lc_data_out(((I+1)*data_width)-1 downto I*data_width) 
		<= rd_demux_data_out(((I+1)*(data_width+tag_width))-1 downto (I*(data_width+tag_width))+tag_width);
	 lc_tag_out(((I+1)*tag_width)-1 downto I*tag_width) 
		<= rd_demux_data_out((I*(data_width+tag_width))+tag_width-1 downto (I*(data_width+tag_width)));
       end loop;
    end process;

    rd_demux_out_ack <= lc_req_in;
    lc_ack_out <= rd_demux_out_req;
					 
    -- memory bank to write-demux
    wr_demux_sel_in <= mem_bank_write_tag_out(c_store_port_id_width-1 downto 0);
    wr_demux_data_in <= mem_bank_write_tag_out(tag_width+c_store_port_id_width-1 downto c_store_port_id_width);
    wr_demux_in_req <= mem_bank_write_result_ready;
    mem_bank_write_result_accept <= wr_demux_in_ack;
    
    wr_demux: PipelinedDemux generic map (g_data_width => tag_width,
				       g_destination_id_width => c_store_port_id_width,
				       g_number_of_outputs => num_stores)
		port map(data_in => wr_demux_data_in,
			 sel_in => wr_demux_sel_in,
			 req_in => wr_demux_in_req,
			 ack_out => wr_demux_in_ack,
			 data_out => wr_demux_data_out,
			 req_out => wr_demux_out_req,
			 ack_in => wr_demux_out_ack,
			 clk => clock,
			 reset => reset);

    sc_tag_out <= wr_demux_data_out;
    wr_demux_out_ack <= sc_req_in;
    sc_ack_out <= wr_demux_out_req;

end struct;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;
entity access_regulator_base is
  generic (name : string;  num_slots: integer := 1);
  port (
    -- the req-ack pair being regulated.
    req   : in Boolean;
    ack   : out Boolean;
    -- the regulated versions of req/ack
    regulated_req : out Boolean;
    regulated_ack : in Boolean;
    -- transitions on the next two will
    -- open up a slot.
    release_req   : in Boolean;
    release_ack   : in Boolean;
    clk   : in  std_logic;
    reset : in  std_logic);

end access_regulator_base;

architecture default_arch of access_regulator_base is
  
   signal req_place_preds, req_place_succs : BooleanArray(0 downto 0);
   signal req_place_token : Boolean;

   signal release_req_place_preds, release_ack_place_preds: BooleanArray(0 downto 0);
   signal release_req_place_succs, release_ack_place_succs: BooleanArray(0 downto 0);
   signal release_req_place_token, release_ack_place_token: boolean;
   
   signal regulated_req_join_preds: BooleanArray(2 downto 0);
   signal regulated_req_token: Boolean; 
  
   signal regulated_req_join: boolean;
begin  -- default_arch

   req_place_preds(0) <= req;
   reqPlace: place_with_bypass 
	generic map(capacity => 1, marking => 0, name => name & ":req_place:")
	port map(preds => req_place_preds, 
			succs => req_place_succs, 
			token => req_place_token,
				clk => clk, reset => reset);


   -- the next two places manage the slots
   -- note that the capacity must be num_slots+1, because
   -- the release request may arrive earlier than the 
   -- unregulated request.
   release_req_place_preds(0) <= release_req;
   releaseReqPlace: place 
	generic map(capacity => num_slots+1, marking => num_slots, name => name & ":release_req_place:")
	port map(preds => release_req_place_preds, 
			succs => release_req_place_succs, 
			token => release_req_place_token,
			clk => clk, reset => reset);

   release_ack_place_preds(0) <= release_ack;

   -- note that the capacity can be num_slots, because
   -- the release ack-request should never arrive earlier than the 
   -- unregulated request.
   -- Check: capacity must be num_slots+1 because req->ack
   --        turnaround from operator can be 0-delay?
   --
   -- The token is returned to the place by release-ack.  
   --  
   releaseAckPlace: place 
	generic map(capacity => num_slots, marking => num_slots, name => name & ":release_ack_place:")
	port map(preds => release_ack_place_preds, 
			succs => release_ack_place_succs, 
			token => release_ack_place_token,
				clk => clk, reset => reset);
   

   -- the join fires when all places have tokens. 
   regulated_req_join <= release_ack_place_token and release_req_place_token and req_place_token;
   release_ack_place_succs(0) <= regulated_req_join;
   release_req_place_succs(0) <= regulated_req_join;
   req_place_succs(0) <= regulated_req_join;


   -- the req that goes out.
   -- the req goes out only if a token is present in the req-place, the release-req-place
   -- and the release-ack place.
   regulated_req <= regulated_req_join;

   -- ack from RHS is forwarded to the left.
   ack <= regulated_ack;
   
end default_arch;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;

entity access_regulator is
  generic (name: string; num_reqs : integer := 1; num_slots: integer := 1);
  port (
    -- the req-ack pair being regulated.
    req   : in BooleanArray(num_reqs-1 downto 0);
    ack   : out BooleanArray(num_reqs-1 downto 0);
    -- the regulated versions of req/ack
    regulated_req : out BooleanArray(num_reqs-1 downto 0);
    regulated_ack : in BooleanArray(num_reqs-1 downto 0);
    -- transitions on the next two will
    -- open up a slot.
    release_req   : in BooleanArray(num_reqs-1 downto 0);
    release_ack   : in BooleanArray(num_reqs-1 downto 0);
    clk   : in  std_logic;
    reset : in  std_logic);

end access_regulator;

architecture default_arch of access_regulator is
begin  -- default_arch
   gen: for I in 0 to num_reqs-1 generate
	aR: access_regulator_base generic map(name => name & "(" & Convert_To_String(I) & ")", num_slots => num_slots)
		port map(req => req(I),
			 ack => ack(I),
			 regulated_req => regulated_req(I),
			 regulated_ack => regulated_ack(I),
			 release_req => release_req(I),
			 release_ack => release_ack(I),
			 clk => clk, 
			 reset => reset);
   end generate gen;
end default_arch;
library ieee;
use ieee.std_logic_1164.all;

-- on reset, trigger an AHIR module, and keep
-- retriggering it..
entity auto_run is
  generic (
    use_delay : boolean := true);
  port (clk   : in  std_logic;
    	reset : in  std_logic;
	start_req: out std_logic;
        start_ack: in std_logic;
        fin_req: out std_logic;
        fin_ack: in std_logic);
end auto_run;

architecture default_arch of auto_run is

begin  

  start_req <= '1';
  fin_req <= '1';

end default_arch;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
entity control_delay_element is
  generic (delay_value: integer := 0);
  port (
    req   : in Boolean;
    ack   : out Boolean;
    clk   : in  std_logic;
    reset : in  std_logic);

end control_delay_element;

architecture default_arch of control_delay_element is

  signal delay_count : integer range 0 to delay_value;
  
begin  -- default_arch

  ZeroDelay: if delay_value <= 0 generate
    ack <= req;
  end generate ZeroDelay;

  UnitDelay: if delay_value = 1 generate

	process(clk)
        begin
		if(clk'event and clk = '1') then 
			if(reset = '1') then
				ack <= false;
			else	
				ack <= req;
			end if;
		end if;
	end process;

  end generate UnitDelay;


  DelayGTOne: if delay_value > 1 generate

   ShiftReg: block
	signal sr_state: BooleanArray(0 to delay_value-1);
   begin
 	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				sr_state <= (others => false);
			else
				sr_state(0) <= req;
				for I in 1 to delay_value-1 loop
					sr_state(I) <= sr_state(I-1);
				end loop;
			end if;
		end if;
	end process;
	ack <= sr_state(delay_value-1);
   end block;
  end generate DelayGTOne;

end default_arch;
library ieee;
use ieee.std_logic_1164.all;
library ahir;

use ahir.Types.all;
use ahir.subprograms.all;
use ahir.BaseComponents.all;
use ahir.utilities.all;

entity generic_join is
  generic(name: string; place_capacities: IntegerArray; place_markings: IntegerArray; place_delays: IntegerArray);
  port ( preds      : in   BooleanArray;
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
end generic_join;

architecture default_arch of generic_join is
  signal symbol_out_sig : BooleanArray(0 downto 0);
  signal place_sigs: BooleanArray(1 to preds'length);
  constant pmarkings : IntegerArray(1 to preds'length) := place_markings;
  constant pcapacities: IntegerArray(1 to preds'length) := place_capacities;
  constant pdelays: IntegerArray(1 to preds'length) := place_delays;
  alias ppreds : BooleanArray(1 to preds'length) is preds;
begin  -- default_arch

  assert ((preds'length = place_capacities'length) and (place_capacities'length = place_delays'length)
		and (place_delays'length = place_markings'length) )
	report "Mismatch in lengths of marking/capacity arrays." severity failure;
  
  placegen: for I in 1 to pmarkings'length generate
    placeBlock: block
	signal place_pred: BooleanArray(0 downto 0);
    begin
      dly: control_delay_element generic map(delay_value => pdelays(I))
                   port map(req => ppreds(I), ack => place_pred(0), clk => clk, reset => reset);
      pI: place_with_bypass
        generic map(capacity => pcapacities(I),
                    marking => pmarkings(I),
                    name => name & ":(bypass):" & Convert_To_String(I) )
		port map(place_pred,symbol_out_sig,place_sigs(I),clk,reset);
    end block;
  end generate placegen;

  -- The transition is enabled only when all preds are true.
  symbol_out_sig(0) <= AndReduce(place_sigs);
  symbol_out <= symbol_out_sig(0);

end default_arch;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.subprograms.all;
use ahir.BaseComponents.all;

entity join2 is
  generic(bypass : boolean := true; name : string);
  port ( pred0, pred1      : in   Boolean;
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
end join2;

architecture default_arch of join2 is
  signal preds: BooleanArray(1 downto 0);
begin  -- default_arch

  preds <= pred0 & pred1;
  baseJoin : join
    generic map(bypass => bypass, name => name & ":base")
    port map (preds => preds,
              symbol_out => symbol_out,
              clk => clk,
              reset => reset);

end default_arch;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.subprograms.all;
use ahir.BaseComponents.all;

entity join3 is
  generic(bypass : boolean := true; name: string);
  port ( pred0, pred1, pred2      : in   Boolean;
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
end join3;

architecture default_arch of join3 is
  signal preds: BooleanArray(2 downto 0);
begin  -- default_arch

  preds <= pred0 & pred1 & pred2;
  baseJoin : join
    generic map(bypass => bypass, name => name & ":base")
    port map (preds => preds,
              symbol_out => symbol_out,
              clk => clk,
              reset => reset);

end default_arch;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.subprograms.all;
use ahir.BaseComponents.all;
use ahir.utilities.all;

entity join is
  generic (place_capacity : integer := 1;bypass: boolean := true; name : string );
  port ( preds      : in   BooleanArray;
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
end join;

architecture default_arch of join is
  signal symbol_out_sig : BooleanArray(0 downto 0);
  signal place_sigs: BooleanArray(preds'range);
  constant H: integer := preds'high;
  constant L: integer := preds'low;

begin  -- default_arch
  
  placegen: for I in H downto L generate
    placeBlock: block
	signal place_pred: BooleanArray(0 downto 0);
    begin
	place_pred(0) <= preds(I);

      bypassgen: if bypass generate
	pI: place_with_bypass
		generic map(capacity => place_capacity, 
				marking => 0,
				name => name & ":" & Convert_To_String(I) )
		port map(place_pred,symbol_out_sig,place_sigs(I),clk,reset);
      end generate bypassgen;

      nobypassgen: if (not bypass) generate
	pI: place
		generic map(capacity => place_capacity, 
				marking => 0,
				name => name & ":" & Convert_To_String(I) )
		port map(place_pred,symbol_out_sig,place_sigs(I),clk,reset);
      end generate nobypassgen;

    end block;
  end generate placegen;
  -- The transition is enabled only when all preds are true.
  
  symbol_out_sig(0) <= AndReduce(place_sigs);
  symbol_out <= symbol_out_sig(0);

end default_arch;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.subprograms.all;
use ahir.BaseComponents.all;
use ahir.utilities.all;

entity join_with_input is
  generic (place_capacity : integer := 1; bypass : boolean := true; name : string := "anon");
  port ( preds      : in   BooleanArray;
    	symbol_in  : in   boolean;
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
end join_with_input;

architecture default_arch of join_with_input is
  signal symbol_out_sig : BooleanArray(0 downto 0);
  signal place_sigs: BooleanArray(preds'range);
  signal inp_place_sig: Boolean;
  constant H: integer := preds'high;
  constant L: integer := preds'low;
begin  -- default_arch
  
  Byp: if bypass generate 
    placegen: for I in H downto L generate
      placeBlock: block
	  signal place_pred: BooleanArray(0 downto 0);
      begin
	  place_pred(0) <= preds(I);
	  pI: place_with_bypass generic map(capacity => place_capacity, marking => 0,
				   name => name & ":" & Convert_To_String(I) )
		  port map(place_pred,symbol_out_sig,place_sigs(I),clk,reset);
      end block;
    end generate placegen;
    
    inplaceBlock: block
	  signal place_pred: BooleanArray(0 downto 0);
    begin
	  place_pred(0) <= symbol_in;
	  pI: place_with_bypass generic map(capacity => place_capacity, marking => 0,
				   name => name & ":inputplace")
		  port map(place_pred,symbol_out_sig,inp_place_sig,clk,reset);
    end block;
  end generate Byp;

  NoByp: if (not bypass) generate 
    placegen: for I in H downto L generate
      placeBlock: block
	  signal place_pred: BooleanArray(0 downto 0);
      begin
	  place_pred(0) <= preds(I);
	  pI: place generic map(capacity => place_capacity, marking => 0,
				   name => name & ":" & Convert_To_String(I) )
		  port map(place_pred,symbol_out_sig,place_sigs(I),clk,reset);
      end block;
    end generate placegen;
    
    inplaceBlock: block
	  signal place_pred: BooleanArray(0 downto 0);
    begin
	  -- note: input transitions are always bypassed, because they
	  --       always come with a delay (no need to incur an additional delay for them).
	  place_pred(0) <= symbol_in;
	  pI: place_with_bypass generic map(capacity => place_capacity, marking => 0,
				   name => name & ":inputplace")
		  port map(place_pred,symbol_out_sig,inp_place_sig,clk,reset);
    end block;
  end generate NoByp;


  -- The transition is enabled only when all preds are true.
  symbol_out_sig(0) <= inp_place_sig and AndReduce(place_sigs);
  symbol_out <= symbol_out_sig(0);
end default_arch;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.BaseComponents.all;


-- on reset, trigger an AHIR module, and keep
-- retriggering it..
-- TODO: add a single cycle delay in lreq -> preq
-- path and also in the pack -> lack path in order
-- to control the clock period...
entity level_to_pulse is
  generic (forward_delay: integer; backward_delay: integer);
  port (clk   : in  std_logic;
    	reset : in  std_logic;
        lreq: in std_logic;
        lack: out std_logic;
        preq: out boolean;
        pack: in boolean);
end level_to_pulse;

architecture default_arch of level_to_pulse is
  type L2PState is (idle,waiting);
  signal l2p_state : L2PState;
  signal pack_sig, preq_sig: boolean;
begin

  process(clk,reset,lreq, pack_sig, l2p_state)
    variable nstate : L2PState;
    variable lack_v : std_logic;
    variable preq_v : boolean;
    
  begin
    lack_v := '0';
    preq_v := false;
    nstate := l2p_state;
    if(l2p_state = idle) then
      if(lreq ='1') then
        preq_v := true;
        if(pack_sig) then
          lack_v := '1';
        else
          nstate := waiting;
        end if;
      end if;
    else
      if(pack_sig) then
        lack_v := '1';
        nstate := idle;
      end if;
    end if;

    lack     <= lack_v;
    preq_sig <= preq_v;
    
    if(reset = '1') then
      nstate := idle;
    end if;

    if(clk'event and clk = '1') then
      l2p_state <= nstate;
    end if;
    
  end process;

  fDelay: control_delay_element generic map(delay_value => forward_delay)
	port map(req => preq_sig, ack => preq, clk => clk, reset => reset);

  bDelay: control_delay_element generic map(delay_value => backward_delay)
	port map(req => pack, ack => pack_sig, clk => clk, reset => reset);

  
end default_arch;
-- loop-terminator element for use in pipelined loops.
-- written by Madhav P. Desai, December 2012.
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.subprograms.all;
use ahir.BaseComponents.all;


entity loop_terminator is
  
  generic (max_iterations_in_flight : integer := 4);
  port(loop_body_exit: in boolean;
       loop_continue: in boolean;
       loop_terminate: in boolean;
       loop_back: out boolean;
       loop_exit: out boolean;
       clk: in std_logic;
       reset: in std_logic);

end loop_terminator;

--
-- Let M = max iterations in flight.
--
-- initialize the counter (at reset) to M-1.
--
-- Anytime you see loop-body-exit, increment the
-- counter
--
-- if lc has arrived, and if the counter is > 0,
-- then emit loop-back, and decrement the counter.
--
-- if lt has arrived, wait until the counter reaches M
-- and then emit loop-exit, resetting the counter to M-1.
--
architecture Behave of loop_terminator is

  type FSMState is (idle, pending_continue, pending_exit);

  signal fsm_state : FSMState;
  signal available_iterations : integer range 0 to max_iterations_in_flight;

  signal lc_place_preds, lc_place_succs : BooleanArray(0 downto 0);
  signal clear_lc_place, lc_place_token : boolean;

  signal lt_place_preds, lt_place_succs : BooleanArray(0 downto 0);
  signal clear_lt_place, lt_place_token: boolean;

  signal lbe_place_preds, lbe_place_succs : BooleanArray(0 downto 0);
  signal clear_lbe_place, lbe_place_token: boolean;  
  
begin  -- Behave

  -- places to remember loop-continue, loop-terminate, loop-body-exit

  -- critical place: make it a bypass place in order to
  -- speed up loop turnaround times.  The clock period
  -- will not be an issue since the branch ack is 
  -- registered.
  lc_place : place_with_bypass generic map (
    capacity => 1,
    marking  => 0,
    name => "loop_terminator:lc_place")
    port map (
      preds => lc_place_preds,
      succs => lc_place_succs,
      token => lc_place_token,
      clk   => clk,
      reset => reset);
  lc_place_preds(0) <= loop_continue;
  lc_place_succs(0) <= clear_lc_place;

  lt_place : place generic map (
    capacity => 1,
    marking  => 0,
    name => "loop_terminator:lt_place")
    port map (
      preds => lt_place_preds,
      succs => lt_place_succs,
      token => lt_place_token,
      clk   => clk,
      reset => reset);
  lt_place_preds(0) <= loop_terminate;
  lt_place_succs(0) <= clear_lt_place;


  lbe_place : place generic map (
    capacity => 1,
    marking  => 0,
    name => "loop_terminator:lbe_place")
    port map (
      preds => lbe_place_preds,
      succs => lbe_place_succs,
      token => lbe_place_token,
      clk   => clk,
      reset => reset);
  lbe_place_preds(0) <= loop_body_exit;
  lbe_place_succs(0) <= clear_lbe_place;
  
  -- state machine:
  --   inputs
  --   lc_place_token, lt_place_token, lbe_place_token, available_iterations.
  --   outputs
  --   clear_lc_place, clear_lt_place, clear_lbe_place, loop_back,
  --   loop_exit, available_iterations.
  --   
  process(clk, reset,lc_place_token,lt_place_token,lbe_place_token,available_iterations)
    variable next_available_iterations : integer range 0 to max_iterations_in_flight;
    variable incr,decr,rst : boolean;
  begin
    -- all outputs are deasserted by default.
    loop_back <= false;
    loop_exit <= false;
    clear_lc_place <= false;
    clear_lt_place <= false;
    clear_lbe_place <= false;
    
    -- incr, decr, rst are used to manage count.
    incr := false;
    decr := false;
    if(reset = '1') then
      rst := true;
    else
      rst := false;
    end if;

    -- lbe always increments counter.
    if(lbe_place_token) then
      incr := true;
      clear_lbe_place <= true;
    end if;

    -- loop-continue? emit loop-back if count > 0..
    -- and decrement count, clear lc place.      
    if(lc_place_token and (available_iterations > 0)) then
      decr := true;
      loop_back <= true;
      clear_lc_place <= true;
    end if;

    -- loop-terminate? check if count = M, and emit loop_exit, reset counter.
    if(lt_place_token and (available_iterations = max_iterations_in_flight)) then
      rst := true;
      loop_exit <= true;
      clear_lt_place <= true;          
    end if;


    if(clk'event and clk = '1') then

      -- manage count.
      if(rst) then
        available_iterations <= max_iterations_in_flight - 1;
      elsif (incr and (not decr)) then
        available_iterations <= available_iterations + 1;
      elsif (decr and (not incr)) then
        available_iterations <= available_iterations - 1;
      end if;
      
    end if;
  end process;
  
end Behave;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.subprograms.all;
use ahir.BaseComponents.all;
use ahir.utilities.all;

entity marked_join is
  generic(place_capacity : integer := 1; bypass : boolean := true; name : string := "anon"; marked_predecessor_bypass: BooleanArray);
  port ( preds      : in   BooleanArray;
         marked_preds : in BooleanArray;
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
end marked_join;

architecture default_arch of marked_join is
  signal symbol_out_sig : BooleanArray(0 downto 0);
  signal place_sigs: BooleanArray(preds'range);
  signal mplace_sigs: BooleanArray(marked_preds'range);  
  constant H: integer := preds'high;
  constant L: integer := preds'low;

  constant MH: integer := marked_preds'high;
  constant ML: integer := marked_preds'low;  

  constant mbypass: BooleanArray(MH downto ML) := marked_predecessor_bypass;

begin  -- default_arch
  
  placegen: for I in H downto L generate
    placeBlock: block
	signal place_pred: BooleanArray(0 downto 0);
    begin
	place_pred(0) <= preds(I);
      bypassgen: if (bypass) generate
	pI: place_with_bypass
		generic map(capacity => place_capacity, 
				marking => 0,
				name => name & ":(bypass):" & Convert_To_String(I) )
		port map(place_pred,symbol_out_sig,place_sigs(I),clk,reset);
      end generate bypassgen;

      nobypassgen: if (not bypass) generate
	pI: place
		generic map(capacity => place_capacity, 
				marking => 0,
				name => name & ":(no-bypass):" & Convert_To_String(I) )
		port map(place_pred,symbol_out_sig,place_sigs(I),clk,reset);
      end generate nobypassgen;
    end block;
  end generate placegen;

  -- the marked places
  mplacegen: for I in MH downto ML generate
    mplaceBlock: block
	signal place_pred: BooleanArray(0 downto 0);
    begin
	place_pred(0) <= marked_preds(I);
	bypassGen: if mbypass(I)  generate
	   mpI: place_with_bypass generic map(capacity => place_capacity, marking => 1, 
				 name => name & ":marked(bypass):" & Convert_To_String(I) )
		port map(place_pred,symbol_out_sig,mplace_sigs(I),clk,reset);
	end generate bypassGen;
	NobypassGen: if (not mbypass(I))  generate
	  mpI: place generic map(capacity => place_capacity, marking => 1, 
				 name => name & ":marked(no-bypass):" & Convert_To_String(I) )
		port map(place_pred,symbol_out_sig,mplace_sigs(I),clk,reset);
	end generate NobypassGen;

    end block;
  end generate mplacegen;
  
  -- The transition is enabled only when all preds are true.
  symbol_out_sig(0) <= AndReduce(place_sigs) and AndReduce(mplace_sigs);
  symbol_out <= symbol_out_sig(0);

end default_arch;
library ahir;
use ahir.Types.all;
use ahir.subprograms.all;

entity out_transition is
  
  port (preds      : in   BooleanArray;
        symbol_out : out  boolean);

end out_transition;

architecture default_arch of out_transition is
begin  -- default_arch

  -- The transition is enabled only when all preds are true.
  symbol_out <= AndReduce(preds);

end default_arch;
-- phi-sequencer..
-- written by Madhav P. Desai, December 2012.
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.subprograms.all;
use ahir.BaseComponents.all;
use ahir.Utilities.all;


entity phi_sequencer  is
  generic (place_capacity : integer; nreqs : integer; nenables : integer; name : string := "anonPhiSequencer");
  port (
  selects : in BooleanArray(0 to nreqs-1); -- one out of nreqs..
  reqs : out BooleanArray(0 to nreqs-1); -- one out of nreqs.
  ack  : in Boolean;
  enables  : in BooleanArray(0 to nenables-1);  -- all must have a token.
  done : out Boolean;
  clk, reset: in std_logic);
end phi_sequencer;


--
-- on reset, wait for a transition on any of the in_places.
-- the corresponding req is asserted..  A token in the
-- enable places is needed to allow firing of the reqs.
--
architecture Behave of phi_sequencer is
  signal select_token, select_clear : BooleanArray(0 to nreqs-1);
  signal enable_token, enable_clear : BooleanArray(0 to nenables-1);

  signal enabled, ack_token, ack_clear, req_being_fired: Boolean;
begin  -- Behave

  -- instantiate unmarked places for the in_places.
  InPlaces: for I in 0 to nreqs-1 generate
    placeBlock: block
	signal place_pred, place_succ: BooleanArray(0 downto 0);
    begin
	place_pred(0) <= selects(I);
	place_succ(0) <= select_clear(I);

        -- a bypass place: in order to speed up loop turnaround times.
	pI: place_with_bypass generic map(capacity => place_capacity, marking => 0,
		   name => name & ":select:" & Convert_To_String(I))
		port map(place_pred,place_succ,select_token(I),clk,reset);
    end block;
  end generate InPlaces;

  -- place for enables: places are unmarked.. initial state
  -- should be consistently generated by the instantiator.
  EnablePlaces: for J in 0 to nenables-1 generate
    rnb_block: block
      signal place_pred, place_succ: BooleanArray(0 downto 0);    
    begin
      place_pred(0) <= enables(J);
      place_succ(0) <= enable_clear(J);
      pRnb: place_with_bypass generic map(capacity => place_capacity, marking => 0,
		  name => name & ":enable:" & Convert_To_String(J))
        port map(place_pred,place_succ,enable_token(J),clk,reset);    
    end block;
  end generate EnablePlaces;  
    
 
  -- sequencer is enabled by this sig.
  enabled <= AndReduce(enable_token) and ack_token;

  -- a marker to indicate that a req is being fired.
  req_being_fired <= OrReduce(select_token) and enabled;

  -- outgoing reqs can fire only when the sequencer is enabled.
  reqs <= select_token when enabled else (others => false);

  -- clear the selects and reenables when the req is being fired.
  select_clear <= select_token when req_being_fired else (others => false);
  enable_clear <= (others => true) when req_being_fired else (others => false);

  -- ack should be received to reenable the sequencer.
  -- this place is initially marked (it is internal
  -- to the sequencer).
  ack_block: block
      signal place_pred: BooleanArray(0 downto 0);    
      signal place_succ: BooleanArray(0 downto 0);    
  begin
      place_pred(0) <= ack;
      place_succ(0) <= ack_clear;
      pack: place generic map(capacity => place_capacity, marking => 1,
	  	 name => name & ":ack")
        port map(place_pred,place_succ,ack_token,clk,reset);    
  end block;

  -- clear the ack place when req is fired.
  ack_clear <= req_being_fired;

  -- outgoing exit.. is the incoming ack..
  done <= ack;

end Behave;
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.subprograms.all;
use ahir.BaseComponents.all;

entity pipeline_interlock is
  port (trigger: in boolean;
        enable : in boolean;
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
end pipeline_interlock;

architecture default_arch of pipeline_interlock is
  signal symbol_out_sig : BooleanArray(0 downto 0);
  signal enable_place_pred : BooleanArray(0 downto 0);
  signal enable_place : Boolean;
  signal trigger_place_pred : BooleanArray(0 downto 0);
  signal trigger_place : Boolean;
  

begin  -- default_arch
  

  trigger_place_pred(0) <= trigger;
  pTrig: place generic map(name => "pipeline-interlock-trigger", capacity => 1, marking => 0)
    port map(trigger_place_pred, symbol_out_sig,trigger_place,clk,reset);

  enable_place_pred(0) <= enable;
  pEnable: place generic map(name => "pipeline-interlock-enable", capacity => 1, marking => 1)
    port map(enable_place_pred, symbol_out_sig,enable_place,clk,reset);
  
  symbol_out_sig(0) <= enable_place and trigger_place;
  symbol_out <= symbol_out_sig(0);

end default_arch;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity place is

  generic (
    capacity: integer := 1;
    marking : integer := 0;
    name   : string
    );
  port (
    preds : in  BooleanArray;
    succs : in  BooleanArray;
    token : out boolean;
    clk   : in  std_logic;
    reset : in  std_logic);

end place;

architecture default_arch of place is

  signal incoming_token : boolean;      -- true if a pred fires
  signal backward_reset : boolean;      -- true if a succ fires
  signal token_sig      : boolean;  -- asynchronously computed value of the token
  signal token_latch    : integer range 0 to capacity;
  
  constant debug_flag : boolean := false;
begin  -- default_arch

  assert capacity > 0 report "in place " & name & ": place must have capacity > 1." severity error;
  assert marking <= capacity report "in place " & name & ": initial marking must be less than place capacity." severity error;

  -- At most one of the preds can send a pulse.
  -- We detect it with an OR over all inputs
  incoming_token <= OrReduce(preds);

  -- At most one of the succs can send a pulse.
  -- We detect it with an OR over all inputs
  backward_reset <= OrReduce(succs);

  latch_token : process (clk, reset)

  begin

    if clk'event and clk = '1' then  -- rising clock edge
      if reset = '1' then            -- asynchronous reset (active high)
        token_latch <= marking;
      elsif (backward_reset and (not incoming_token)) then
       if(debug_flag) then
           assert token_latch > 0 report "in place " & name &  ": number of tokens cannot become negative!" severity error;
         assert false report "in place " & name & ": token count decremented from " & Convert_To_String(token_latch) 
	severity note;
       end if;
        token_latch <= token_latch - 1;
      elsif (incoming_token and (not backward_reset)) then
	if(debug_flag) then
          assert token_latch < capacity report "in place " & name & " number of tokens "
			 & Convert_To_String(token_latch+1) & " cannot exceed capacity " 
			 & Convert_To_String(capacity) severity error;
          assert false report "in place " & name & " token count incremented from " & Convert_To_String(token_latch) 
		 severity note;
	end if;
        token_latch <= token_latch + 1;
      end if;
    end if;
  end process latch_token;

  token <= true when (token_latch > 0) else false;


end default_arch;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity place_with_bypass is

  generic (
    capacity: integer := 1;
    marking : integer := 0;
    name   : string
    );
  port (
    preds : in  BooleanArray;
    succs : in  BooleanArray;
    token : out boolean;
    clk   : in  std_logic;
    reset : in  std_logic);

end place_with_bypass;

architecture default_arch of place_with_bypass is

  signal incoming_token : boolean;      -- true if a pred fires
  signal backward_reset : boolean;      -- true if a succ fires
  signal token_latch    : integer range 0 to capacity;
  signal non_zero       : boolean;

  constant debug_flag : boolean := false;
  
begin  -- default_arch

  assert capacity > 0 report "in place " & name & ": place must have capacity > 1." severity error;
  assert marking <= capacity report "in place " & name & ": initial marking must be less than place capacity." severity error;

  -- At most one of the preds can send a pulse.
  -- We detect it with an OR over all inputs
  incoming_token <= OrReduce(preds);

  -- At most one of the succs can send a pulse.
  -- We detect it with an OR over all inputs
  backward_reset <= OrReduce(succs);


  non_zero <= (token_latch > 0);

  latch_token : process (clk, reset,incoming_token, backward_reset, token_latch, non_zero)
	variable incr, decr: boolean;
  begin
    

 

    incr := incoming_token and (not backward_reset);
    decr := backward_reset and (not incoming_token);
    

    if clk'event and clk = '1' then  -- rising clock edge

      if reset = '1' then            -- asynchronous reset (active high)
        token_latch <= marking;
      elsif decr then
       if((token_latch = capacity) and incr) then
         assert false report "in place-with-bypass: " & name & " number of tokens "
			 & Convert_To_String(token_latch+1) & " cannot exceed capacity " 
			 & Convert_To_String(capacity) severity error;
       end if;
       if((not non_zero) and decr) then
         assert false report "in place-with-bypass: " & name &  ": number of tokens cannot become negative!" severity error;
       end if;

        if(debug_flag) then
           assert false report "in place " & name & ": token count decremented from " & Convert_To_String(token_latch) 
		 severity note;
	end if;
        token_latch <= token_latch - 1;

      elsif incr then

	if(debug_flag) then
           assert false report "in place " & name & " token count incremented from " & Convert_To_String(token_latch) 
		  severity note;
	end if;

        token_latch <= token_latch + 1;
      end if;


    end if;
  end process latch_token;

  token <= incoming_token or non_zero;

end default_arch;
library ahir;
use ahir.Types.all;
use ahir.subprograms.all;

-- a short-hand model to implement a merge
-- from transitions to transitions.entity
entity transition_merge is
  port (
    preds      : in   BooleanArray;
    symbol_out : out  boolean);
end transition_merge;

architecture default_arch of transition_merge is
begin  -- default_arch

  -- The transition fires when any of its preds is true.
  symbol_out <= OrReduce(preds);

end default_arch;
library ahir;
use ahir.Types.all;
use ahir.subprograms.all;

entity transition is
  port (
    preds      : in   BooleanArray;
    symbol_in  : in   boolean;
    symbol_out : out  boolean);
end transition;

architecture default_arch of transition is
begin  -- default_arch

  -- The transition is enabled only when all preds are true.
  symbol_out <= symbol_in and AndReduce(preds);

end default_arch;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity BinaryEncoder is
  generic (iwidth: integer := 3; owidth: integer := 3);
  port(din: in std_logic_vector(iwidth-1 downto 0);
       dout: out std_logic_vector(owidth-1 downto 0));
end BinaryEncoder;


architecture LowLevel of BinaryEncoder is
  signal ival : integer range 0 to iwidth-1;
  constant awidth : integer := Minimum(Maximum(Ceil_Log2(iwidth),1),owidth);
begin  -- LowLevel

  process(din)
    variable ivar : integer range 0 to iwidth-1;
  begin
    ivar := 0;
    for I in 0 to iwidth-1 loop
      if(din(I) = '1') then
        ivar := I;
        exit;
      end if;
    end loop;
    ival <= ivar;
  end process;

  process(ival)
    variable doutvar : std_logic_vector(owidth-1 downto 0);
  begin
    doutvar := (others => '0');
    doutvar(awidth-1 downto 0) := To_SLV(To_Unsigned(ival,awidth));
    dout <= doutvar;
  end process;
    

end LowLevel;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Utilities.all;
use ahir.SubPrograms.all;

entity BranchBase is
  generic (condition_width: integer := 1);
  port (condition: in std_logic_vector(condition_width-1 downto 0);
        clk,reset: in std_logic;
        req: in Boolean;
        ack0: out Boolean;
        ack1: out Boolean);
end entity;


architecture Behave of BranchBase is
begin

  process(clk)
    variable c_reduce : std_logic;
  begin
    if(clk'event and clk = '1') then
      if(reset = '1') then
        ack0 <= false;
        ack1 <= false;
      elsif req then
        c_reduce := OrReduce(condition);
        if(c_reduce = '1') then
          ack1 <= true;
          ack0 <= false;
        else
          ack0 <= true;
          ack1 <= false;
        end if;
      else
        ack0 <= false;
        ack1 <= false;
      end if;
    end if;
  end process;
end Behave;

library ieee;
use ieee.std_logic_1164.all;

entity BypassRegister is
  generic(data_width: integer; enable_bypass: boolean := false); 
  port (
    clk, reset : in  std_logic;
    enable     : in  std_logic;
    data_in     : in  std_logic_vector(data_width-1 downto 0);
    data_out    : out std_logic_vector(data_width-1 downto 0));
end BypassRegister;

architecture behave of BypassRegister is
  constant datazero : std_logic_vector(data_width-1 downto 0) := (others => '0');
  signal data_reg: std_logic_vector(data_width-1 downto 0);
begin  -- behave

  process (clk, reset)
  begin  -- process
    if clk'event and clk = '1' then     -- rising clock edge
      if reset = '1' then
	data_reg <= datazero;
      elsif enable = '1' then
        data_reg <= data_in;
      end if;
    end if;
  end process;

  Bypass: if enable_bypass generate
    data_out <= data_in when enable = '1' else data_reg;    
  end generate Bypass;

  NoBypass: if not enable_bypass generate
    data_out <= data_reg;
  end generate NoBypass;

end behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.FloatOperatorPackage.all;


library ahir_ieee_proposed;
use ahir_ieee_proposed.float_pkg.all;

entity GenericCombinationalOperator is
  generic
    (
      operator_id   : string := "ApIntAdd";          -- operator id
      input1_is_int : Boolean := true; -- false means float
      input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      iwidth_1      : integer := 4;    -- width of input1
      input2_is_int : Boolean := true; -- false means float
      input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      iwidth_2      : integer := 0;    -- width of input2
      num_inputs    : integer := 1;    -- can be 1 or 2.
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      owidth        : integer := 4;          -- width of output.
      constant_operand : std_logic_vector := "0001"; -- constant operand.. (it is always the second operand)
      constant_width: integer := 4;
      use_constant  : boolean := true
      );
  port (
    data_in       : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
    result      : out std_logic_vector(owidth-1 downto 0)
    );
end GenericCombinationalOperator;


architecture Vanilla of GenericCombinationalOperator is
  constant iwidth : integer := iwidth_1 + iwidth_2;
begin  -- Behave

  assert((num_inputs = 1) or (num_inputs = 2)) report "either 1 or 2 inputs" severity failure;

  TwoOperand : if num_inputs = 2 generate
    -- int x int -> int
    TwoOpIntIntInt: if input1_is_int and input2_is_int and output_is_int generate
      process(data_in)
        variable   result_var : std_logic_vector(owidth-1 downto 0);
        variable op1: std_logic_vector(iwidth_1-1 downto 0);
        variable op2: std_logic_vector(iwidth_2-1 downto 0);
      begin
        op1 := data_in(iwidth-1 downto iwidth_2);
        op2 := data_in(iwidth_2-1 downto 0);
        result_var := (others => '0');
        TwoInputOperation(operator_id, op1, op2,result_var);
        result <= result_var;
      end process;
    end generate TwoOpIntIntInt;

    -- float x float -> float
    TwoOpFloatFloatFloat: if (not input1_is_int) and (not input2_is_int) and (not output_is_int) generate
      assert(iwidth_1 = iwidth_2) report "floatXfloat -> float operation: inputs must be of the same width." severity error;
      assert(input1_characteristic_width = input2_characteristic_width) report "floatXfloat -> float operation: input exponent sizes must be the same."
        severity error;
      
      process(data_in)
        variable op1: std_logic_vector(iwidth_1-1 downto 0);
        variable op2: std_logic_vector(iwidth_2-1 downto 0);
        variable   result_var: std_logic_vector(owidth-1 downto 0);
      begin
        op1 := data_in(iwidth-1 downto iwidth_2);
        op2 := data_in(iwidth_2-1 downto 0);
        result_var := (others => '0');
        TwoInputFloatArithOperation(operator_id, op1,op2,input1_characteristic_width, input1_mantissa_width, result_var);
        result <= result_var;
      end process;
    end generate TwoOpFloatFloatFloat;

    -- float x float -> int
    TwoOpFloatFloatInt: if ((not input1_is_int) and (not input2_is_int) and output_is_int) generate
      assert(iwidth_1 = iwidth_2) report "floatXfloat -> int operation: inputs must be of the same width." severity error;
      assert(input1_characteristic_width = input2_characteristic_width) report "floatXfloat -> int operation: input exponent sizes must be the same."
        severity error;
      
      process(data_in)
        variable op1: std_logic_vector(iwidth_1-1 downto 0);
        variable op2: std_logic_vector(iwidth_2-1 downto 0);
        variable   result_var: std_logic_vector(owidth-1 downto 0);        
      begin
        result_var := (others => '0');

	op1 := data_in(iwidth-1 downto iwidth_2);
	op2 := data_in(iwidth_2-1 downto 0);

        TwoInputFloatCompareOperation(operator_id, op1,op2, input1_characteristic_width, input1_mantissa_width, result_var);
        result <= result_var;
      end process;
    end generate TwoOpFloatFloatInt;

    -- float x int -> * and int x float -> * are not permitted.
    assert(input1_is_int = input2_is_int) report "both operands of two input operators should be either ints or floats"
      severity failure;

    -- int x int -> float is not permitted.
    assert((not input1_is_int) or output_is_int) report "if the inputs to a two-input operation are ints, the output cannot be a float!" severity failure;

  end generate TwoOperand;


  SingleOperandNoConstant : if num_inputs = 1 and not use_constant generate

    SingleOperandNoConstantIntInt: if input1_is_int and output_is_int generate
      process(data_in)
        variable   result_var    : std_logic_vector(owidth-1 downto 0);
      begin
        result_var := (others => '0');
        SingleInputOperation(operator_id, data_in, result_var);
        result <= result_var;
      end process;
    end generate SingleOperandNoConstantIntInt;
    
    SingleOperandNoConstantFloatFloat: if (not input1_is_int) and (not output_is_int) generate

      -- the resize operation is to be treated specially, since
      -- there are two different conversions..
      ResizeFloat: if (operator_id = "ApFloatResize") generate

        Trivial: if ((output_mantissa_width = input1_mantissa_width) and
			(output_characteristic_width = input1_characteristic_width)) generate
		result <= data_in;
	end generate Trivial;

        NonTrivial: if ((output_mantissa_width /= input1_mantissa_width) or
			(output_characteristic_width /= input1_characteristic_width)) generate
          process(data_in)
            variable op1: std_logic_vector(iwidth_1-1 downto 0);
            variable   result_var: std_logic_vector(owidth-1 downto 0);                
          begin
            op1 := data_in;
            result_var := (others => '0');
            ApFloatResize_proc(To_Float(op1, input1_characteristic_width, input1_mantissa_width),
                               output_characteristic_width,
                               output_mantissa_width,
                               result_var);
            result <= result_var;
          end process;        
	end generate NonTrivial;
      end generate ResizeFloat;

      NotResizeFloat: if (operator_id /= "ApFloatResize") generate
        
        process(data_in)
          variable op1: std_logic_vector(iwidth_1-1 downto 0);
          variable   result_var: std_logic_vector(owidth-1 downto 0);                
        begin
          op1 := data_in;
          result_var := (others => '0');
          SingleInputFloatOperation(operator_id, op1, input1_characteristic_width, input1_mantissa_width, owidth, result_var);
          result <= result_var;
        end process;
      end generate NotResizeFloat;
      
    end generate SingleOperandNoConstantFloatFloat;

    SingleOperandNoConstantFloatInt: if (not input1_is_int) and output_is_int generate
      process(data_in)
        variable op1: std_logic_vector(iwidth_1-1 downto 0);
        variable   result_var: std_logic_vector(owidth-1 downto 0);                
      begin
        op1 := data_in;
        result_var := (others => '0');
        SingleInputFloatOperation(operator_id, op1, input1_characteristic_width, input1_mantissa_width, owidth, result_var);
        result <= result_var;
      end process;
    end generate SingleOperandNoConstantFloatInt;

    SingleOperandNoConstantIntFloat: if (input1_is_int) and (not output_is_int) generate
      process(data_in)
        variable   result_var: std_logic_vector(owidth-1 downto 0);                
      begin
        result_var := (others => '0');
        SingleInputFloatOperation(operator_id, data_in, output_characteristic_width, output_mantissa_width, owidth, result_var);
        result <= result_var;
      end process;
    end generate SingleOperandNoConstantIntFloat;
  end generate SingleOperandNoConstant;

  SingleOperandWithConstant : if num_inputs = 1 and use_constant generate

    SingleOperandWithConstantIntInt: if input1_is_int and output_is_int generate
      SigBlock: block
        signal op2_sig : std_logic_vector(constant_width-1 downto 0);
      begin  -- block SigBlock
        -- TODO: changes here.
        op2_sig <= constant_operand;

        process(data_in,op2_sig)
          variable   result_var    : std_logic_vector(owidth-1 downto 0);
        begin
          result_var := (others => '0');
          TwoInputOperation(operator_id,
                            data_in,
                            op2_sig,
                            result_var); 
          result <= result_var;
        end process;
      end block SigBlock;
    end generate SingleOperandWithConstantIntInt;

    SingleOperandWithConstantFloatInt: if (not input1_is_int) and output_is_int generate

      SigBlock: block
      	signal op2_sig: std_logic_vector(constant_width-1 downto 0);
      begin
      op2_sig <= constant_operand;
      process(data_in, op2_sig)
        variable   result_var: std_logic_vector(owidth-1 downto 0);                        
      begin
        result_var := (others => '0');
       	TwoInputFloatCompareOperation(operator_id, data_in, op2_sig,input1_characteristic_width, input1_mantissa_width, result_var);
        result <= result_var;
      end process;
      end block SigBlock;
    end generate SingleOperandWithConstantFloatInt;

    SingleOperandWithConstantFloatFloat: if (not input1_is_int) and (not output_is_int) generate
      SigBlock: block
      	signal op2_sig: std_logic_vector(constant_width-1 downto 0);
      begin
      op2_sig <= constant_operand;
      process(data_in, op2_sig)
        variable   result_var: std_logic_vector(owidth-1 downto 0);                        
      begin
        result_var := (others => '0');
       	TwoInputFloatArithOperation(operator_id, data_in, op2_sig, input1_characteristic_width, input1_mantissa_width, result_var);
        result <= result_var;
      end process;
    end block SigBlock;
    end generate SingleOperandWithConstantFloatFloat;
  end generate SingleOperandWithConstant;
  
end Vanilla;



-- if guards(I) is true, let the handshake proceed, else
-- shunt it.  This interface is inserted in between the
-- req/ack signals from/to the CP and the operators in the
-- datapath.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity GuardInterface is
	generic (nreqs: integer; delay_flag:boolean);
	port (reqL: in BooleanArray(nreqs-1 downto 0);
	      ackL: out BooleanArray(nreqs-1 downto 0); 
	      reqR: out BooleanArray(nreqs-1 downto 0);
	      ackR: in BooleanArray(nreqs-1 downto 0); 
	      guards: in std_logic_vector(nreqs-1 downto 0);
	      clk: in std_logic;
	      reset: in std_logic);
end entity;


architecture Behave of GuardInterface is
	signal ackL_un_guarded: BooleanArray(nreqs-1 downto 0);
begin

	process(reqL,ackR,guards,ackL_un_guarded)
	begin
		for I in 0 to nreqs-1 loop
			if(guards(I) = '1') then
				reqR(I) <= reqL(I);
				ackL(I) <= ackR(I);
			else
				reqR(I) <= false;
				ackL(I) <= ackL_un_guarded(I);
			end if;
		end loop;
	end process;

	nodelay: if not delay_flag generate
		ackL_un_guarded <= reqL;
	end generate nodelay;

	yesdelay: if delay_flag generate
		process(clk)
		begin
			if(clk'event and clk = '1') then 
				if(reset = '1') then
					ackL_un_guarded <= (others => false);
				else
					ackL_un_guarded <= reqL;
				end if;
			end if;
		end process;
	end generate yesdelay;

end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity InputMuxBaseNoData is
  generic ( twidth: integer;
	   nreqs: integer;
	   no_arbitration: Boolean := false);
  port (
    -- req/ack follow pulse protocol
    reqL                 : in  BooleanArray(nreqs-1 downto 0);
    ackL                 : out BooleanArray(nreqs-1 downto 0);
    -- output side req/ack level protocol
    reqR                 : out std_logic;
    ackR                 : in  std_logic;
    -- tag specifies the requester index 
    tagR                : out std_logic_vector(twidth-1 downto 0);
    clk, reset          : in std_logic);
end InputMuxBaseNoData;


architecture Behave of InputMuxBaseNoData is

  signal reqP,ackP,ssig : std_logic_vector(nreqs-1 downto 0);
  signal fEN: std_logic_vector(nreqs-1 downto 0);  

  constant tag0 : std_logic_vector(twidth-1 downto 0) := (others => '0');

  -- one-cycle delay between req and ack => in order to break long
  -- combinational (false) paths.
  constant suppress_immediate_ack : BooleanArray(reqL'length-1 downto 0) := (others => true);
begin  -- Behave


  -----------------------------------------------------------------------------
  -- pulse to level translate
  -----------------------------------------------------------------------------
  P2L: for I in nreqs-1 downto 0 generate
      P2LBlk: block
      begin  -- block P2L          
        p2Linst: Pulse_To_Level_Translate_Entity
          port map (rL => reqL(I), rR => reqP(I), aL => ackL(I), aR => ackP(I),
                                 clk => clk, reset => reset);
      end block P2LBlk;

  end generate P2L;
  


  -----------------------------------------------------------------------------
  -- priority encoding or pass through
  -----------------------------------------------------------------------------
  NoArbitration: if no_arbitration generate
    fEN <= reqP;
    reqR <= OrReduce(fEN);
    ackP <= fEN when ackR = '1' else (others => '0');
  end generate NoArbitration;

  Arbitration: if not no_arbitration generate
    rpeInst: Request_Priority_Encode_Entity
      generic map (num_reqs => reqP'length)
      port map( clk => clk,
                reset => reset,
                reqR => reqP,
                ackR => ackP,
                forward_enable => fEN,
                req_s => reqR,
                ack_s => ackR);
    
  end generate Arbitration;

  -----------------------------------------------------------------------------
  -- tag generation
  -----------------------------------------------------------------------------
  taggen : BinaryEncoder generic map (
    iwidth => nreqs,
    owidth => twidth)
    port map (
      din  => fEN,
      dout => tagR);

end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity InputMuxBase is
  generic ( iwidth: integer := 10;
	   owidth: integer := 10;
	   twidth: integer := 3;
	   nreqs: integer := 1;
	   no_arbitration: Boolean := false;
	   registered_output: Boolean := true);
  port (
    -- req/ack follow pulse protocol
    reqL                 : in  BooleanArray(nreqs-1 downto 0);
    ackL                 : out BooleanArray(nreqs-1 downto 0);
    dataL                : in  std_logic_vector(iwidth-1 downto 0);
    -- output side req/ack level protocol
    reqR                 : out std_logic;
    ackR                 : in  std_logic;
    dataR                : out std_logic_vector(owidth-1 downto 0);
    -- tag specifies the requester index 
    tagR                : out std_logic_vector(twidth-1 downto 0);
    clk, reset          : in std_logic);
end InputMuxBase;


architecture Behave of InputMuxBase is

  signal reqP,ackP,fEN : std_logic_vector(nreqs-1 downto 0);

  type WordArray is array (natural range <>) of std_logic_vector(owidth-1 downto 0);
  signal dataP : WordArray(nreqs-1 downto 0);

  constant tag0 : std_logic_vector(twidth-1 downto 0) := (others => '0');

  -- one-cycle delay between req and ack => in order to break long
  -- combinational (false) paths.
  constant suppress_immediate_ack : BooleanArray(reqL'length-1 downto 0) := (others => true);

  -- intermediate signals.
  signal reqR_sig                : std_logic;
  signal ackR_sig                : std_logic;
  signal dataR_sig               : std_logic_vector(owidth-1 downto 0);
  signal tagR_sig                : std_logic_vector(twidth-1 downto 0);
  signal fair_reqP, fair_ackP    : std_logic_vector(nreqs-1 downto 0);

begin  -- Behave


  assert(iwidth = owidth*nreqs) report "mismatched i/o widths in InputMuxBase" severity error;

  -----------------------------------------------------------------------------
  -- "fairify" the level-reqs.
  -----------------------------------------------------------------------------
  fairify: NobodyLeftBehind generic map (num_reqs => nreqs)
		port map (clk => clk, reset => reset, reqIn => reqP, ackOut => ackP,
					reqOut => fair_reqP, ackIn => fair_ackP);


  -----------------------------------------------------------------------------
  -- output queue if registered_output is set.
  -----------------------------------------------------------------------------
  OutputRepeater: if registered_output generate

    -- purpose: output queue
    OqBlock: block
      signal oq_data_in : std_logic_vector((twidth + owidth)-1 downto 0);
      signal oq_data_out : std_logic_vector((twidth + owidth)-1 downto 0);
    begin  -- block OqBlock

      oq_data_in <= dataR_sig & tagR_sig;
      dataR <= oq_data_out((twidth+owidth)-1 downto twidth);
      tagR <= oq_data_out(twidth-1 downto 0);

        
      oqueue : QueueBase generic map (
        queue_depth => 2,
        data_width  => twidth + owidth)
        port map (
          clk      => clk,
          reset    => reset,
          data_in  => oq_data_in,
          push_req => reqR_sig,
          push_ack => ackR_sig,
          data_out => oq_data_out,
          pop_ack  => reqR,
          pop_req  => ackR);
      
    end block OqBlock;
  end generate OutputRepeater;

  NoOutputRepeater: if not registered_output generate
    
    dataR <= dataR_sig;
    reqR <= reqR_sig;
    ackR_sig <= ackR;
    tagR <= tagR_sig;
    
  end generate NoOutputRepeater;
  
  -----------------------------------------------------------------------------
  -- pulse to level translate
  -----------------------------------------------------------------------------
  P2L: for I in nreqs-1 downto 0 generate
    p2Linstance: Pulse_To_Level_Translate_Entity
      port map(rL => reqL(I), rR => reqP(I), aL => ackL(I), aR => ackP(I),
               clk => clk, reset => reset);     

    process(dataL)
      variable regv : std_logic_vector(owidth-1 downto 0);
    begin
      Extract(dataL,I,regv);
      dataP(I) <= regv;
    end process;
    
  end generate P2L;

  -----------------------------------------------------------------------------
  -- priority encoding or pass through
  -----------------------------------------------------------------------------
  NoArbitration: if no_arbitration generate
    fEN <= fair_reqP;
    reqR_sig <= OrReduce(fEN);
    fair_ackP <= fEN when ackR_sig = '1' else (others => '0');
  end generate NoArbitration;

  Arbitration: if not no_arbitration generate
    fEN <= PriorityEncode(fair_reqP);
    reqR_sig <= OrReduce(fEN);
    fair_ackP <= fEN when ackR_sig = '1' else (others => '0');
  end generate Arbitration;

  -----------------------------------------------------------------------------
  -- final multiplexor
  -----------------------------------------------------------------------------
  process(fEN,dataP)
  begin
    dataR_sig <= (others => '0');
    for J in 0 to nreqs-1 loop
      if(fEN(J) = '1') then
        dataR_sig <= dataP(J);
        exit;
      end if;
    end loop;
  end process;    

  -----------------------------------------------------------------------------
  -- tag generation
  -----------------------------------------------------------------------------
  taggen : BinaryEncoder generic map (
    iwidth => nreqs,
    owidth => twidth)
    port map (
      din  => fEN,
      dout => tagR_sig);

end Behave;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity InputPortLevelNoData is
  
  generic (num_reqs: integer; 
	no_arbitration: boolean := false);
  port (
    -- ready/ready interface with the requesters
    req       : in  std_logic_vector(num_reqs-1 downto 0);
    ack       : out std_logic_vector(num_reqs-1 downto 0);
    -- ready/ready interface with outside world
    oreq       : out std_logic;
    oack       : in  std_logic;
    clk, reset : in  std_logic);
  
end InputPortLevelNoData;

architecture default_arch of InputPortLevelNoData is

  signal req_active, ack_sig  : std_logic_vector(num_reqs-1 downto 0); 
  
begin  -- default_arch

  oreq <= OrReduce(req_active);

  NoArb: if no_arbitration generate
    req_active <= req;
  end generate NoArb;

  Arb: if not no_arbitration generate
    req_active <= PriorityEncode(req);
  end generate Arb;

  gen: for I in num_reqs-1 downto 0 generate

    ack_sig(I) <= req_active(I) and oack; 
    
    ack(I) <= ack_sig(I);
    
  end generate gen;

end default_arch;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity InputPortLevel is
  
  generic (num_reqs: integer := 5; 
	data_width: integer := 8;  
	no_arbitration: boolean := false);
  port (
    -- ready/ready interface with the requesters
    req       : in  std_logic_vector(num_reqs-1 downto 0);
    ack       : out std_logic_vector(num_reqs-1 downto 0);
    data      : out std_logic_vector((num_reqs*data_width)-1 downto 0);
    -- ready/ready interface with outside world
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : in  std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
  
end InputPortLevel;

architecture default_arch of InputPortLevel is

  
  type IPWArray is array(integer range <>) of std_logic_vector(data_width-1 downto 0);
  signal data_final, data_reg : IPWArray(num_reqs-1 downto 0);
  signal req_active, ack_sig  : std_logic_vector(num_reqs-1 downto 0); 
  
  
begin  -- default_arch

  oreq <= OrReduce(req_active);

  NoArb: if no_arbitration generate
    req_active <= req;
  end generate NoArb;

  Arb: if not no_arbitration generate
    req_active <= PriorityEncode(req);
  end generate Arb;

  process(data_final)
    variable ldata: std_logic_vector((num_reqs*data_width)-1 downto 0);
  begin
    for J in num_reqs-1 downto 0 loop
      Insert(ldata,J,data_final(J));
    end loop;
    data <= ldata;
  end process;

  gen: for I in num_reqs-1 downto 0 generate

    ack_sig(I) <= req_active(I) and oack; 
    
    ack(I) <= ack_sig(I);
    
    data_final(I) <= odata;
    
  end generate gen;

end default_arch;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Components.all;
use ahir.BaseComponents.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity InputPortNoData is
  generic (num_reqs: integer;
	   no_arbitration: boolean := false);
  port (
    -- pulse interface with the data-path
    req        : in  BooleanArray(num_reqs-1 downto 0);
    ack        : out BooleanArray(num_reqs-1 downto 0);
    -- ready/ready interface with outside world
    oreq       : out std_logic;
    oack       : in  std_logic;
    clk, reset : in  std_logic);
end entity;


architecture Base of InputPortNoData is

  signal reqR, ackR : std_logic_vector(num_reqs-1 downto 0);
  signal fEN: std_logic_vector(num_reqs-1 downto 0);

begin

  -----------------------------------------------------------------------------
  -- protocol conversion
  -----------------------------------------------------------------------------
  ProTx : for I in 0 to num_reqs-1 generate
    P2L : block
    begin  -- block P2L
      p2LInst: Pulse_To_Level_Translate_Entity
        port map (rL            => req(I),
                  rR            => reqR(I),
                  aL            => ack(I),
                  aR            => ackR(I),
                  clk           => clk,
                  reset         => reset);
    end block P2L;
  end generate ProTx;

  demux : InputPortLevelNoData generic map (
    num_reqs       => num_reqs,
    no_arbitration => no_arbitration)
    port map (
      req => reqR,
      ack => ackR,
      oreq => oreq,
      oack => oack,
      clk => clk,
      reset => reset);

end Base;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Components.all;
use ahir.BaseComponents.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity InputPort is
  generic (num_reqs: integer := 5;
	   data_width: integer := 8;
	   no_arbitration: boolean := false);
  port (
    -- pulse interface with the data-path
    req        : in  BooleanArray(num_reqs-1 downto 0);
    ack        : out BooleanArray(num_reqs-1 downto 0);
    data       : out std_logic_vector((num_reqs*data_width)-1 downto 0);
    -- ready/ready interface with outside world
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : in  std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
end entity;


architecture Base of InputPort is

  signal reqR, ackR : std_logic_vector(num_reqs-1 downto 0);
  signal fEN: std_logic_vector(num_reqs-1 downto 0);

  type   IPWArray is array(integer range <>) of std_logic_vector(data_width-1 downto 0);
  signal data_reg, data_final: IPWArray(num_reqs-1 downto 0);
  signal demux_data : std_logic_vector((num_reqs*data_width)-1 downto 0);
  
begin

  -----------------------------------------------------------------------------
  -- protocol conversion
  -----------------------------------------------------------------------------
  ProTx : for I in 0 to num_reqs-1 generate

    P2L : block
    begin  -- block P2L
      p2LInst: Pulse_To_Level_Translate_Entity
        port map (rL            => req(I),
                  rR            => reqR(I),
                  aL            => ack(I),
                  aR            => ackR(I),
                  clk           => clk,
                  reset         => reset);

    end block P2L;
    
  end generate ProTx;

  demux : InputPortLevel generic map (
    num_reqs       => num_reqs,
    data_width     => data_width,
    no_arbitration => no_arbitration)
    port map (
      req => reqR,
      ack => ackR,
      data => demux_data,
      oreq => oreq,
      odata => odata,
      oack => oack,
      clk => clk,
      reset => reset);

  -----------------------------------------------------------------------------
  -- data handling
  -----------------------------------------------------------------------------
  process(data_final)
    variable ldata: std_logic_vector((num_reqs*data_width)-1 downto 0);
  begin
    for J in num_reqs-1 downto 0 loop
      Insert(ldata,J,data_final(J));
    end loop;
    data <= ldata;
  end process;

  gen : for I in num_reqs-1 downto 0 generate

    process(clk)
      variable target: std_logic_vector(data_width-1 downto 0);
    begin
      if(clk'event and clk = '1') then
        if (ackR(I) = '1') then
          Extract(demux_data,I,target);
          data_reg(I) <= target;
        end if;
      end if;
    end process;

    data_final(I) <= data_reg(I);
    
  end generate gen;

end Base;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity LoadCompleteShared is
    generic
    (
      name : string;
      data_width: integer := 8;
      tag_length:  integer := 1;
      num_reqs : integer := 1;
      no_arbitration: boolean := false;
      detailed_buffering_per_output: IntegerArray
    );
  port (
    -- req/ack follow level protocol
    reqR                     : in BooleanArray(num_reqs-1 downto 0);
    ackR                     : out BooleanArray(num_reqs-1 downto 0);
    dataR                    : out std_logic_vector((data_width*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    mdata                    : in std_logic_vector(data_width-1 downto 0);
    mreq                     : out  std_logic;
    mack                     : in std_logic;
    mtag                     : in std_logic_vector(tag_length-1 downto 0);
    -- with dataR
    clk, reset              : in std_logic);
end LoadCompleteShared;

architecture Vanilla of LoadCompleteShared is

begin  -- Behave


  odemux: OutputDeMuxBaseWithBuffering
    generic map (
      name => name & " odemux ",
      iwidth => data_width,
      owidth =>  data_width*num_reqs,
      twidth =>  tag_length,
      nreqs  => num_reqs,
      detailed_buffering_per_output => detailed_buffering_per_output )  
    port map (
      reqL   => mack,                   -- cross-over (mack from mem-subsystem)
      ackL   => mreq,                   -- cross-over 
      dataL =>  mdata,
      tagL  =>  mtag,
      reqR  => reqR,
      ackR  => ackR,
      dataR => dataR,
      clk   => clk,
      reset => reset);
  
  
end Vanilla;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity LoadReqShared is
  generic
    (
	addr_width: integer := 8;
      	num_reqs : integer := 1; -- how many requesters?
	tag_length: integer := 1;
	no_arbitration: Boolean := false;
        min_clock_period: Boolean := true;
	time_stamp_width: integer := 0
    );
  port (
    -- req/ack follow pulse protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    -- concatenated address corresponding to access
    dataL                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
    -- address to memory
    maddr                   : out std_logic_vector((addr_width)-1 downto 0);
    mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);

    mreq                    : out std_logic;
    mack                    : in std_logic;
    -- clock, reset (active high)
    clk, reset              : in std_logic);
end LoadReqShared;

architecture Vanilla of LoadReqShared is

  constant iwidth: integer := addr_width*num_reqs;
  constant owidth: integer := addr_width;

  constant debug_flag : boolean := false;
-- constant registered_output : boolean := min_clock_period and (time_stamp_width = 0);

  -- must register..  ack implies that address has been sampled.
  constant registered_output : boolean := true; 

  signal imux_tag_out: std_logic_vector(tag_length-1 downto 0);
  
begin  -- Behave
  assert(tag_length >= Ceil_Log2(num_reqs)) report "insufficient tag width" severity error;

  TstampGen: if time_stamp_width > 0 generate

    Tstamp: block
	signal time_stamp: std_logic_vector(time_stamp_width-1 downto 0);
    begin 
    	mtag <= imux_tag_out & time_stamp; 


	-- ripple counter.
	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				time_stamp <= (others => '0');
			else
				for I in 1 to time_stamp_width-1 loop
					time_stamp(I) <= time_stamp(I) xor AndReduce(time_stamp(I-1 downto 0));
				end loop;
				time_stamp(0) <= not time_stamp(0);
			end if;
		end if;
	end process;
    end block;
    
  end generate TstampGen;

  NoTstampGen: if time_stamp_width < 1 generate
	mtag <= imux_tag_out;
  end generate NoTstampGen;

  -- xilinx xst does not like this assertion...
  -- DbgAssert: if debug_flag generate
    -- assert( (not ((reset = '0') and (clk'event and clk = '1') and no_arbitration)) or Is_At_Most_One_Hot(reqL))
      -- report "in no-arbitration case, at most one request should be hot on clock edge (in SplitOperatorShared)" severity error;    
  -- end generate DbgAssert;

  
  imux: InputMuxBase
    generic map(iwidth => iwidth,
                owidth => owidth, 
                twidth => tag_length,
                nreqs => num_reqs,
                no_arbitration => no_arbitration,
                registered_output => registered_output)
    port map(
      reqL       => reqL,
      ackL       => ackL,
      dataL      => dataL,
      reqR       => mreq,
      ackR       => mack,
      dataR      => maddr,
      tagR       => imux_tag_out,
      clk        => clk,
      reset      => reset);
  
end Vanilla;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;


-- make sure that there is no starvation..
--
-- latch the incoming requests (reqIn) and present them
-- to the downstream user (reqOut).  As ackIn is received,
-- clear reqOut.  The latching of reqIn to reqOut is done
-- only if reqOut is cleared.  There is a bypass path
-- from reqIn to reqOut if reqIn_register is 0..  This
-- prevents a useless latency.
entity NobodyLeftBehind is
  generic ( num_reqs : integer := 1);
  port (
    clk,reset : in std_logic;
    reqIn : in std_logic_vector(num_reqs-1 downto 0);
    ackOut: out std_logic_vector(num_reqs-1 downto 0);
    reqOut : out std_logic_vector(num_reqs-1 downto 0);
    ackIn : in std_logic_vector(num_reqs-1 downto 0));
end entity;


architecture Fair of NobodyLeftBehind is
  signal reqIn_register: std_logic_vector(num_reqs-1 downto 0);
  signal reqIn_reg_is_non_zero: std_logic;
begin  -- Behave


   -- if there is only one requester, there is really no point.
   Trivial: if num_reqs = 1 generate
     reqOut <= reqIn;
     ackOut <= ackIn;
   end generate Trivial;

   Nontrivial: if num_reqs > 1 generate

     reqIn_reg_is_non_zero <= OrReduce(reqIn_register);
     reqOut <= reqIn_register when reqIn_reg_is_non_zero = '1' else reqIn;
     
     process(clk)
	  variable next_reqIn_register : std_logic_vector(num_reqs-1 downto 0);
     begin
	  next_reqIn_register := reqIn_register;
  
          if(reqIn_reg_is_non_zero = '0') then
              -- if reqIn_register is 0, then reqIn will be 
	      -- immediately forwarded to reqOut..  An ackIn
              -- may immediately appear.. in which case reqIn_register
              -- will stay 0.
	      next_reqIn_register := reqIn and (not ackIn); -- reqIn and (reqIn xor ackIn);
          else
              -- reqOut must come from reqIn_register.. the next
              -- state will be determined by reqIn_register and ackIn
	      next_reqIn_register := reqIn_register and (not ackIn); -- reqIn_register and (reqIn_register xor ackIn);
          end if;
  
          if(clk'event and clk = '1') then
		  if(reset = '1') then
			  reqIn_register <= (others => '0');
		  else
			  reqIn_register <= next_reqIn_register;
		  end if;
	  end if;
	  
     end process;

     ackOut <= ackIn;
   
   end generate NonTrivial;

end Fair;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity OutputDeMuxBaseNoData is
  generic(name : string;
          twidth: integer;
	  nreqs: integer;
	  detailed_buffering_per_output: IntegerArray);
  port (
    -- req/ack follow level protocol
    reqL                 : in  std_logic;
    ackL                 : out std_logic;
    -- tag identifies index to which demux
    -- should happen
    tagL                 : in std_logic_vector(twidth-1 downto 0);
    -- reqR/ackR follow pulse protocol
    -- and are of length n
    reqR                : in BooleanArray(nreqs-1 downto 0);
    ackR                : out  BooleanArray(nreqs-1 downto 0);
    clk, reset          : in std_logic);
end OutputDeMuxBaseNoData;

architecture Behave of OutputDeMuxBaseNoData is
  signal ackL_sig : std_logic_vector(nreqs-1 downto 0);

begin  -- Behave

  assert detailed_buffering_per_output'length = reqR'length report "Mismatch." severity failure;

  -----------------------------------------------------------------------------
  -- parallel generate across all requesters
  -----------------------------------------------------------------------------
  PGen: for I in reqR'range generate
    RegFSM: block
      subtype int7 is integer range 0 to detailed_buffering_per_output(I);
      signal valid: std_logic;
      signal lhs_clear : std_logic;
      signal rhs_state : std_logic;
      signal lhs_state : int7;
    begin  -- block Reg
      
      ---------------------------------------------------------------------------
      -- valid true if this I is mentioned in tag
      ---------------------------------------------------------------------------
      valid <= '1' when (reqL = '1') and (I = To_Integer(To_Unsigned(tagL))) else '0';

      ---------------------------------------------------------------------------
      -- lhs-state machine.. just a 3 bit counter which counts up everytime
      -- there is a valid input to this index, and down when the req appears 
      -- at the receiver end.
      ---------------------------------------------------------------------------
      process(clk,lhs_state, lhs_clear,reset,valid)
        variable nstate : int7;
        variable aL_var : std_logic;
      begin
        nstate := lhs_state;
        aL_var := '0';
        
        if(lhs_state < int7'high) then
            if(valid = '1') then
              nstate := lhs_state + 1;
              aL_var := '1';
            end if;
        end if;

        if(lhs_state > 0) then
            if(lhs_clear = '1') then
              nstate := lhs_state-1;
            end if;
	end if;


        ackL_sig(I) <= aL_var;
        
        if(clk'event and clk = '1') then
           if(reset = '1') then
              nstate := 0;
	   else
              lhs_state <= nstate;
           end if;        
        end if;

      end process;

      -------------------------------------------------------------------------
      -- rhs state machine
      -------------------------------------------------------------------------
     process(clk,rhs_state,reset,reqR(I),lhs_state)
       variable nstate : std_logic;
       variable aR_var : boolean;
       variable lhs_clear_var : std_logic;
     begin
        nstate := rhs_state;
        aR_var := false;
        lhs_clear_var := '0';
        
        case rhs_state is
          when '0' =>
            if(reqR(I)) then
              if(lhs_state > 0) then
                aR_var := true;
                lhs_clear_var := '1';
              else
                nstate := '1';
              end if;
            end if;
          when '1' =>
            if(lhs_state > 0) then
              lhs_clear_var := '1';
              aR_var := true;
              nstate := '0';
            end if;
          when others => null;
        end case;

        if(reset = '1') then
          nstate := '0';
        end if;        

        lhs_clear <= lhs_clear_var;
        
        if(clk'event and clk = '1') then
          rhs_state <= nstate;
	  if(reset = '1') then 
		ackR(I) <= false;
	  else
          	ackR(I) <= aR_var;
	  end if;
        end if;
     end process;
    end block RegFSM;
    
  end generate PGen;

  -----------------------------------------------------------------------------
  -- ackL
  -----------------------------------------------------------------------------
  ackL <= OrReduce(ackL_sig);

end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

-------------------------------------------------------------------------------
-- a single level requester on the left, and nreq requesters on the right.
--
-- reqR -> ackR has unit delay if pipeline_flag is true.
-- reqL -> ackL has at least a unit delay.
-------------------------------------------------------------------------------
entity OutputDeMuxBase is
  generic(iwidth: integer := 4;
	  owidth: integer := 12;
	  twidth: integer := 2;
	  nreqs: integer := 3;
	  no_arbitration: Boolean := false;
          pipeline_flag: Boolean := true);
  port (
    -- req/ack follow level protocol
    reqL                 : in  std_logic;
    ackL                 : out std_logic;
    dataL                : in  std_logic_vector(iwidth-1 downto 0);
    -- tag identifies index to which demux
    -- should happen
    tagL                 : in std_logic_vector(twidth-1 downto 0);
    -- reqR/ackR follow pulse protocol
    -- and are of length n
    reqR                : in BooleanArray(nreqs-1 downto 0);
    ackR                : out  BooleanArray(nreqs-1 downto 0);
    -- dataR is array(n,m) 
    dataR               : out std_logic_vector(owidth-1 downto 0);
    clk, reset          : in std_logic);
end OutputDeMuxBase;

architecture Behave of OutputDeMuxBase is

  type WordArray is array (natural range <>) of std_logic_vector(iwidth-1 downto 0);
  signal dfinal, dfinal_reg: WordArray(nreqs-1 downto 0);

  signal ackL_sig : std_logic_vector(nreqs-1 downto 0);
  signal ackR_sig : BooleanArray(nreqs-1 downto 0);
  
begin  -- Behave

  assert(owidth = iwidth*nreqs) report "word-length mismatch in output demux" severity failure;

  
  -----------------------------------------------------------------------------
  -- parallel generate across all requesters
  -----------------------------------------------------------------------------
  PGen: for I in reqR'range generate
    RegFSM: block
      signal valid: std_logic;
      signal lhs_clear : std_logic;
      signal rhs_state, lhs_state : std_logic;
    begin  -- block Reg
      
      ---------------------------------------------------------------------------
      -- valid true if this I is mentioned in tag
      ---------------------------------------------------------------------------
      valid <= '1' when (reqL = '1') and (I = To_Integer(To_Unsigned(tagL))) else '0';

      ---------------------------------------------------------------------------
      -- lhs-state machine.
      ---------------------------------------------------------------------------
      process(clk,lhs_state, lhs_clear,reset,valid)
        variable nstate : std_logic;
        variable latch_flag : boolean;
        variable aL_var : std_logic;
      begin
        nstate := lhs_state;
        latch_flag := false;
        aL_var := '0';
        
        case lhs_state is
          when '0' =>
            if(valid = '1') then
              nstate := '1';
              latch_flag := true;
              aL_var := '1';
            end if;
          when '1' =>
            if(lhs_clear = '1') then
              nstate := '0';
            end if;

	    -- to track down some mixup issues!
	    assert (valid = '0') report "In Outputdemux: stalled request " & Convert_To_String(I)
			severity warning;

          when others => null;
        end case;

        if(reset = '1') then
          nstate := '0';
        end if;        

        ackL_sig(I) <= aL_var;
        
        if(clk'event and clk = '1') then
          lhs_state <= nstate;
          if(latch_flag) then
            dfinal(I) <= dataL;
          end if;          
        end if;
      end process;

      -------------------------------------------------------------------------
      -- rhs state machine
      -------------------------------------------------------------------------
     process(clk,rhs_state,reset,reqR(I),lhs_state)
       variable nstate : std_logic;
       variable aR_var : boolean;
       variable lhs_clear_var : std_logic;
     begin
        nstate := rhs_state;
        aR_var := false;
        lhs_clear_var := '0';
        
        case rhs_state is
          when '0' =>
            if(reqR(I)) then
              if(lhs_state = '1') then
                aR_var := true;
                lhs_clear_var := '1';
              else
                nstate := '1';
              end if;
            end if;
          when '1' =>
            if(lhs_state = '1') then
              lhs_clear_var := '1';
              aR_var := true;
              nstate := '0';
            end if;
          when others => null;
        end case;

        if(reset = '1') then
          nstate := '0';
        end if;        

        ackR_sig(I) <= aR_var;
        lhs_clear <= lhs_clear_var;
        
        if(clk'event and clk = '1') then
          rhs_state <= nstate;
        end if;
     end process;
    end block RegFSM;
    
  end generate PGen;

  -----------------------------------------------------------------------------
  -- ackL
  -----------------------------------------------------------------------------
  ackL <= OrReduce(ackL_sig);

  -----------------------------------------------------------------------------
  -- non-pipelined case, ackR_sig goes straight to ackR, dfinal goes to dataR
  -----------------------------------------------------------------------------
  Nonpipelined: if (not pipeline_flag) generate

    ackR <= ackR_sig;

    process(dfinal)
      variable dataRv : std_logic_vector(dataR'high downto dataR'low);
    begin
      for I in dfinal'range loop
        Insert(dataRv,I,dfinal(I));
      end loop;
      dataR <= dataRv;
    end process;
    
  end generate Nonpipelined;  

  -----------------------------------------------------------------------------
  -- pipelined case, ackR_sig delayed to ackR, dfinal delayed to dataR
  -----------------------------------------------------------------------------
  Pipelined: if pipeline_flag generate

    process(clk,reset)
    begin
      if(clk'event and clk = '1') then
        if(reset = '1') then
          ackR <= (others => false);
        else
          ackR <= ackR_sig;
        end if;
      end if;
    end process;

    Freggen: for I in 0 to nreqs-1 generate
      process(clk)
      begin
        if(clk'event and clk = '1') then
          if(ackR_sig(I)) then
            dfinal_reg(I) <= dfinal(I);
          end if;
        end if;
      end process;
    end generate Freggen;

    process(dfinal_reg)
      variable dataRv : std_logic_vector(dataR'high downto dataR'low);
    begin
      for I in dfinal_reg'range loop
        Insert(dataRv,I,dfinal_reg(I));
      end loop;
      dataR <= dataRv;
    end process;
  end generate Pipelined;

end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-------------------------------------------------------------------------------
-- a single level requester on the left, and nreq requesters on the right.
--
-- reqR -> ackR can be zero delay.
-- reqL -> ackL has at least a unit delay
--
-- This demux provides buffering for each output.
-- (potentially useful in loop-pipelining).
-------------------------------------------------------------------------------
entity OutputDeMuxBaseWithBuffering is
  generic(name: string;
          iwidth: integer := 4;
	  owidth: integer := 12;
	  twidth: integer := 2;
	  nreqs: integer := 3;
	  detailed_buffering_per_output: IntegerArray);
  port (
    -- req/ack follow level protocol
    reqL                 : in  std_logic;
    ackL                 : out std_logic;
    dataL                : in  std_logic_vector(iwidth-1 downto 0);
    -- tag identifies index to which demux
    -- should happen
    tagL                 : in std_logic_vector(twidth-1 downto 0);
    -- reqR/ackR follow pulse protocol
    -- and are of length n
    reqR                : in BooleanArray(nreqs-1 downto 0);
    ackR                : out  BooleanArray(nreqs-1 downto 0);
    -- dataR is array(n,m) 
    dataR               : out std_logic_vector(owidth-1 downto 0);
    clk, reset          : in std_logic);
end OutputDeMuxBaseWithBuffering;

architecture Behave of OutputDeMuxBaseWithBuffering is
  signal ackL_array : std_logic_vector(nreqs-1 downto 0);
  --alias buffer_sizes: IntegerArray(detailed_buffering_per_output'length-1 downto 0) is detailed_buffering_per_output;

begin  -- Behave
  assert(owidth = iwidth*nreqs) report "word-length mismatch in output demux" severity failure;

  bufGen: for I in 0 to nreqs-1 generate

    -- purpose: instantiate a buffer
    BufBlock: block
      signal write_req,write_ack : std_logic;
      signal unload_req,unload_ack : boolean;
      signal buf_data_in, buf_data_out : std_logic_vector(iwidth-1 downto 0);
      signal valid : std_logic;
    begin  -- block BufBlock

       ub : UnloadBuffer generic map (
         name => name & " buffer " & Convert_To_String(I),
         buffer_size => detailed_buffering_per_output(I),
         data_width  => iwidth)
         port map (
           write_req  => write_req,
           write_ack  => write_ack,
           write_data => buf_data_in,
           unload_req => unload_req,
           unload_ack => unload_ack,
           read_data  => buf_data_out,
           clk        => clk,
           reset      => reset);

      
      ---------------------------------------------------------------------------
      -- valid true if this I is mentioned in tag
      ---------------------------------------------------------------------------
      valid <= '1' when (reqL = '1') and (I = To_Integer(To_Unsigned(tagL))) else '0';
      write_req <= valid;
      ackL_array(I) <= write_ack when (valid = '1') else '0';

      -------------------------------------------------------------------------
      -- dataL goes to each buffer.
      -------------------------------------------------------------------------
      buf_data_in <= dataL;


      -------------------------------------------------------------------------
      -- unload side is straightforward
      -------------------------------------------------------------------------
      unload_req <= reqR(I);
      ackR(I) <= unload_ack;
      dataR(((I+1)*iwidth)-1 downto I*iwidth) <= buf_data_out;
      
    end block BufBlock;
  end generate bufGen;

  -- ack is OrReduced from the Demux combinations.
  ackL <= OrReduce(ackL_array);
end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity OutputPortLevelNoData is
  generic(num_reqs: integer;
	no_arbitration: boolean := false);
  port (
    req       : in  std_logic_vector(num_reqs-1 downto 0);
    ack       : out std_logic_vector(num_reqs-1 downto 0);
    oreq       : out std_logic;
    oack       : in  std_logic;
    clk, reset : in  std_logic);
end entity;

architecture Base of OutputPortLevelNoData is
  signal req_active, ack_sig , fair_reqs, fair_acks : std_logic_vector(num_reqs-1 downto 0);
begin
  
  fairify: NobodyLeftBehind generic map(num_reqs => num_reqs)
		port map(clk => clk, reset => reset,
				reqIn => req,
				ackOut => ack,
				reqOut => fair_reqs,
				ackIn => fair_acks);
  
  oreq <= OrReduce(req_active);

  NoArb: if no_arbitration generate
     req_active <= fair_reqs;
  end generate NoArb;

  Arb: if not no_arbitration generate
     req_active <= PriorityEncode(fair_reqs);
  end generate Arb;

  gen: for I in num_reqs-1 downto 0 generate
       ack_sig(I) <= req_active(I) and oack; 
       fair_acks(I) <= ack_sig(I);
  end generate gen;

end Base;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity OutputPortLevel is
  generic(num_reqs: integer;
	data_width: integer;
	no_arbitration: boolean := true);
  port (
    req       : in  std_logic_vector(num_reqs-1 downto 0);
    ack       : out std_logic_vector(num_reqs-1 downto 0);
    data      : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : out std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
end entity;

architecture Base of OutputPortLevel is
  
  type OPWArray is array(integer range <>) of std_logic_vector(odata'range);
  signal data_array : OPWArray(num_reqs-1 downto 0);
  signal req_active, ack_sig , fair_reqs, fair_acks : std_logic_vector(num_reqs-1 downto 0);
  
begin

  fairify: NobodyLeftBehind generic map(num_reqs => num_reqs)
		port map(clk => clk, reset => reset,
				reqIn => req,
				ackOut => ack,
				reqOut => fair_reqs,
				ackIn => fair_acks);
  
  oreq <= OrReduce(req_active);

  NoArb: if no_arbitration generate
     req_active <= fair_reqs;
  end generate NoArb;

  Arb: if not no_arbitration generate
     req_active <= PriorityEncode(fair_reqs);
  end generate Arb;

  process (data_array)
    variable var_odata : std_logic_vector(data_width-1 downto 0) := (others => '0');
  begin  -- process
    var_odata := (others => '0');
    for I in 0 to num_reqs-1 loop
      var_odata := data_array(I) or var_odata;
    end loop;  -- I
    odata <= var_odata;
  end process;

  gen: for I in num_reqs-1 downto 0 generate

       ack_sig(I) <= req_active(I) and oack; 
       fair_acks(I) <= ack_sig(I);

       process(data,req_active(I))
         variable target: std_logic_vector(data_width-1 downto 0);
       begin
          if(req_active(I) = '1') then
		Extract(data,I,target);
	  else
		target := (others => '0');
	  end if;	
       	  data_array(I) <= target;
       end process;
         
  end generate gen;

end Base;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity OutputPortNoData is
  generic(num_reqs: integer;
	  no_arbitration: boolean := false);
  port (
    req        : in  BooleanArray(num_reqs-1 downto 0);
    ack        : out BooleanArray(num_reqs-1 downto 0);
    oreq       : out std_logic;
    oack       : in  std_logic;
    clk, reset : in  std_logic);
end entity;

architecture Base of OutputPortNoData is

  signal reqR, ackR : std_logic_vector(num_reqs-1 downto 0);
  signal fEN: std_logic_vector(num_reqs-1 downto 0);

  
begin

  -----------------------------------------------------------------------------
  -- protocol conversion
  -----------------------------------------------------------------------------
  ProTx : for I in 0 to num_reqs-1 generate

    P2L : block
    begin  -- block P2L
      p2LInst: Pulse_To_Level_Translate_Entity
        port map (rL            => req(I),
                  rR            => reqR(I),
                  aL            => ack(I),
                  aR            => ackR(I),
                  clk           => clk,
                  reset         => reset);

    end block P2L;
    
  end generate ProTx;

  mux : OutputPortLevelNoData generic map (
    num_reqs       => num_reqs,
    no_arbitration => no_arbitration)
    port map (
      req   => reqR,
      ack   => ackR,
      oreq  => oreq,
      oack  => oack,
      clk   => clk,
      reset => reset);
    

             
end Base;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity OutputPort is
  generic(num_reqs: integer;
	  data_width: integer;
	  no_arbitration: boolean := false);
  port (
    req        : in  BooleanArray(num_reqs-1 downto 0);
    ack        : out BooleanArray(num_reqs-1 downto 0);
    data       : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : out std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
end entity;

architecture Base of OutputPort is

  signal reqR, ackR : std_logic_vector(num_reqs-1 downto 0);
  signal fEN: std_logic_vector(num_reqs-1 downto 0);

  type   OPWArray is array(integer range <>) of std_logic_vector(data_width-1 downto 0);
  signal data_array : OPWArray(num_reqs-1 downto 0);

  
begin

  -----------------------------------------------------------------------------
  -- protocol conversion
  -----------------------------------------------------------------------------
  ProTx : for I in 0 to num_reqs-1 generate

    P2L : block
    begin  -- block P2L
      p2LInst: Pulse_To_Level_Translate_Entity
        port map(rL            => req(I),
                 rR            => reqR(I),
                 aL            => ack(I),
                 aR            => ackR(I),
                 clk           => clk,
                 reset         => reset);

    end block P2L;
    
  end generate ProTx;

  mux : OutputPortLevel generic map (
    num_reqs       => num_reqs,
    data_width     => data_width,
    no_arbitration => no_arbitration)
    port map (
      req   => reqR,
      ack   => ackR,
      data  => data,
      oreq  => oreq,
      oack  => oack,
      odata => odata,
      clk   => clk,
      reset => reset);
    

end Base;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity PhiBase is
  generic (
    num_reqs   : integer;
    data_width : integer);
  port (
    req                 : in  BooleanArray(num_reqs-1 downto 0);
    ack                 : out Boolean;
    idata               : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    odata               : out std_logic_vector(data_width-1 downto 0);
    clk, reset          : in std_logic);
end PhiBase;


architecture Behave of PhiBase is

begin  -- Behave

  assert(idata'length = (odata'length * req'length)) report "data size mismatch" severity failure;

  process(clk)
	variable mux_data : std_logic_vector(odata'length-1 downto 0);
  begin
     if(clk'event and clk = '1') then
	if(reset = '1') then
          ack <= false;
          odata <= (others => '0');
	else
          if(OrReduce(req)) then
            odata <= MuxOneHot(idata,req);
            ack <= true;
          else
            ack <= false;
          end if;
	end if;
     end if;
  end process;

end Behave;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity PipeBase is
  generic (name : string;
	   num_reads: integer;
           num_writes: integer;
           data_width: integer;
           lifo_mode: boolean := false;
           depth: integer := 1);
  port (
    read_req       : in  std_logic_vector(num_reads-1 downto 0);
    read_ack       : out std_logic_vector(num_reads-1 downto 0);
    read_data      : out std_logic_vector((num_reads*data_width)-1 downto 0);
    write_req       : in  std_logic_vector(num_writes-1 downto 0);
    write_ack       : out std_logic_vector(num_writes-1 downto 0);
    write_data      : in std_logic_vector((num_writes*data_width)-1 downto 0);
    clk, reset : in  std_logic);
  
end PipeBase;

architecture default_arch of PipeBase is

  signal pipe_data, pipe_data_repeated : std_logic_vector(data_width-1 downto 0);
  signal pipe_req, pipe_ack, pipe_req_repeated, pipe_ack_repeated: std_logic;
  
  
begin  -- default_arch


  manyWriters: if (num_writes > 1) generate
    wmux : OutputPortLevel generic map (
      num_reqs       => num_writes,
      data_width     => data_width,
      no_arbitration => false)
      port map (
        req   => write_req,
        ack   => write_ack,
        data  => write_data,
        oreq  => pipe_req,                -- no cross-over, drives req
        oack  => pipe_ack,                -- no cross-over, receives ack
        odata => pipe_data,
        clk   => clk,
        reset => reset);
  end generate manyWriters;

  singleWriter: if (num_writes = 1) generate
    pipe_req <= write_req(0);
    write_ack(0) <= pipe_ack;
    pipe_data <= write_data;
  end generate singleWriter;

  Shallow: if (depth < 3) and (not lifo_mode) generate

    queue : QueueBase generic map (	
      name => name & ":Queue:",	
      queue_depth => depth,
      data_width       => data_width)
      port map (
        push_req   => pipe_req,
        push_ack => pipe_ack,
        data_in  => pipe_data,
        pop_req  => pipe_req_repeated,
        pop_ack  => pipe_ack_repeated,
        data_out => pipe_data_repeated,
        clk      => clk,
        reset    => reset);
    
  end generate Shallow;

  DeepFifo: if (depth > 2) and (not lifo_mode) generate
    
    queue : SynchFifo generic map (
      name => name & ":Queue:", 
      queue_depth => depth,
      data_width       => data_width)
      port map (
        push_req   => pipe_req,
        push_ack => pipe_ack,
        data_in  => pipe_data,
        pop_req  => pipe_req_repeated,
        pop_ack  => pipe_ack_repeated,
        data_out => pipe_data_repeated,
        nearly_full => open,
        clk      => clk,
        reset    => reset);
    
  end generate DeepFifo;

  Lifo: if lifo_mode generate
    stack : SynchLifo generic map (
      name => name & ":LIFO:",
      queue_depth => depth,
      data_width       => data_width)
      port map (
        push_req   => pipe_req,
        push_ack => pipe_ack,
        data_in  => pipe_data,
        pop_req  => pipe_req_repeated,
        pop_ack  => pipe_ack_repeated,
        data_out => pipe_data_repeated,
        nearly_full => open,
        clk      => clk,
        reset    => reset);
  end generate Lifo;
  

  manyReaders: if (num_reads > 1) generate
    rmux : InputPortLevel generic map (
      num_reqs       => num_reads,
      data_width     => data_width,
      no_arbitration => false)
      port map (
        req => read_req,
        ack => read_ack,
        data => read_data,
        oreq => pipe_req_repeated,       
        oack => pipe_ack_repeated,       
        odata => pipe_data_repeated,
        clk => clk,
        reset => reset);
  end generate manyReaders;

  singleReader: if (num_reads = 1) generate
    read_ack(0) <= pipe_ack_repeated;
    pipe_req_repeated <= read_req(0);
    read_data <= pipe_data_repeated;
  end generate singleReader;
  
end default_arch;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

--
-- in pull_mode, rL/aL accepts data which is sent by rR/aR.
-- rL -> rR is 0 delay, but aR -> aL MUST have a delay.
--
entity Pulse_To_Level_Translate_Entity is
  port( rL : in boolean;
        rR : out std_logic;
        aL : out boolean;
        aR : in std_logic;
        clk : in std_logic;
        reset : in std_logic);
end entity;

architecture Behave of Pulse_To_Level_Translate_Entity is
  type PullModeState is (Idle,Ack,Waiting);
  signal pull_mode_state : PullModeState;
  constant moore_flag : boolean := false;
begin  -- Behave

  process(clk)
    variable nstate : PullModeState;
  begin
    nstate := pull_mode_state;

      case pull_mode_state is
        when Idle =>
          if(rL) then
            if((not moore_flag) and (aR = '1')) then
              nstate := Ack;
            else
              nstate := Waiting;
            end if;
          end if;
        when Ack =>
          nstate := Idle;
        when Waiting =>
          if(aR = '1') then
            nstate := Ack;
          end if;
        when others => null;
      end case;


    if(clk'event and clk = '1') then
	if reset = '1' then
		pull_mode_state <= Idle;
	else
      		pull_mode_state <= nstate;
	end if;
    end if;
  end process;


  rR <= '1' when ((not moore_flag) and (pull_mode_state = Idle) and rL) or (pull_mode_state = Waiting) else '0';
  aL <= true when (pull_mode_state = Ack) else false;
      
end Behave;
-- copyright: Madhav Desai
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity QueueBase is
  generic(name : string := "anon"; queue_depth: integer := 1; data_width: integer := 32);
  port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity QueueBase;

architecture behave of QueueBase is

  type QueueArray is array(natural range <>) of std_logic_vector(data_width-1 downto 0);

  signal queue_array : QueueArray(queue_depth-1 downto 0);
  signal read_pointer, write_pointer : integer range 0 to queue_depth-1;
  signal queue_size : integer range 0 to queue_depth;

  function Incr(x: integer; M: integer) return integer is
  begin
    if(x < M) then
      return(x + 1);
    else
      return(0);
    end if;
  end Incr;

begin  -- SimModel

 assert (queue_size < queue_depth) report "Queue " & name & " is full." severity note;
 --
 -- 0-depth queue is just a set of wires.
 --
 triv: if queue_depth = 0 generate
	push_ack <= pop_req;
	pop_ack  <= push_req;
	data_out <= data_in;
 end generate triv;


 nontriv: if queue_depth > 0 generate 
  push_ack <= '1' when (queue_size < queue_depth) else '0';
  pop_ack  <= '1' when (queue_size > 0) else '0';

  -- bottom pointer gives the data in FIFO mode..
  data_out <= queue_array(read_pointer);
  
  -- single process
  process(clk)
    variable qsize : integer range 0 to queue_depth;
    variable push,pop : boolean;
    variable next_read_ptr,next_write_ptr : integer range 0 to queue_depth-1;
  begin
    qsize := queue_size;
    push  := false;
    pop   := false;
    next_read_ptr := read_pointer;
    next_write_ptr := write_pointer;
    
    if(reset = '1') then
      qsize := 0;
      next_read_ptr := 0;
      next_write_ptr := 0;
    else
      if((qsize < queue_depth) and push_req = '1') then
        push := true;
      end if;

      if((qsize > 0) and pop_req = '1') then
        pop := true;
      end if;


      if(push) then
        next_write_ptr := Incr(next_write_ptr,queue_depth-1);
      end if;

      if(pop) then
        next_read_ptr := Incr(next_read_ptr,queue_depth-1);
      end if;


      if(pop and (not push)) then
        qsize := qsize - 1;
      elsif(push and (not pop)) then
        qsize := qsize + 1;
      end if;
      
    end if;

    if(clk'event and clk = '1') then
      
      if(push) then
        queue_array(write_pointer) <= data_in;
      end if;
      
      queue_size <= qsize;
      read_pointer <= next_read_ptr;
      write_pointer <= next_write_ptr;
    end if;
    
  end process;
 end generate nontriv;


end behave;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.Utilities.all;
use ahir.Subprograms.all;

-- a simple register
entity RegisterBase is
  generic(in_data_width: integer; out_data_width: integer);
  port(din: in std_logic_vector(in_data_width-1 downto 0);
       dout: out std_logic_vector(out_data_width-1 downto 0);
       req: in boolean;
       ack: out boolean;
       clk,reset: in std_logic);
end RegisterBase;


architecture arch of RegisterBase is
  constant min_data_width : integer := Minimum(in_data_width,out_data_width);
  signal out_reg : std_logic_vector(min_data_width-1 downto 0);
begin
  process(din,req,reset,clk)
    begin
      if(clk'event and clk = '1') then
        if(reset = '1') then
          ack <= false;
          out_reg <= (others => '0');
        elsif req then
          ack <= true;
          out_reg <= din(min_data_width-1 downto 0);
        else
          ack <= false;
        end if;
      end if;
  end process;

  process(out_reg)
  begin
	dout <= (others => '0');
	dout(min_data_width-1 downto 0) <= out_reg;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity Request_Priority_Encode_Entity is
  generic (
    num_reqs : integer := 1;
    pull_mode : boolean := false);
  port (
    clk,reset : in std_logic;
    reqR : in std_logic_vector(num_reqs-1 downto 0);
    forward_enable: out std_logic_vector(num_reqs-1 downto 0);
    ackR: out std_logic_vector(num_reqs-1 downto 0);
    req_s : out std_logic;
    ack_s : in std_logic);
end entity;

architecture Behave of Request_Priority_Encode_Entity is

  signal req_fsm_state : std_logic;
  signal reqR_priority_encoded : std_logic_vector(num_reqs-1 downto 0);
  signal reqR_fresh: std_logic_vector(num_reqs-1 downto 0);
  signal there_is_a_fresh_request  : std_logic;
  
  type RPEState is (idle,busy);
  signal rpe_state : RPEState;
begin  -- Behave

  reqR_fresh <= reqR and (not reqR_priority_encoded);
  there_is_a_fresh_request <= OrReduce(reqR_fresh);
  forward_enable <= reqR_priority_encoded;

  process(clk, rpe_state, there_is_a_fresh_request,ack_s)
	variable nstate: RPEState;
	variable latch_var : std_logic;
  begin
	nstate :=  rpe_state;
	latch_var := '0';
	req_s <= '0';
	if(rpe_state = idle) then
		if(there_is_a_fresh_request = '1') then
			latch_var := '1';
			nstate := busy;
		end if;
	elsif(rpe_state = busy) then
		req_s <= '1';
		if(ack_s = '1') then
			latch_var := '1';
			if(there_is_a_fresh_request = '1') then
				nstate := busy;
			else
				nstate := idle;
			end if;
		end if;
	end if;	

	if(clk'event and clk = '1') then
		if(reset = '1') then
			rpe_state <= idle;
			reqR_priority_encoded <= (others => '0');
		else
			if(latch_var = '1') then
				reqR_priority_encoded <= 
					PriorityEncode(reqR_fresh);
			end if;
			rpe_state <= nstate;
		end if;
	end if;

  end process;
  
  process(ack_s,reqR_priority_encoded)
  begin
    for I in reqR'range loop
      ackR(I) <= reqR_priority_encoded(I) and ack_s;
    end loop;  -- I
  end process;

  
end Behave;

architecture Fair of Request_Priority_Encode_Entity is
  signal reqR_register, reqR_priority_encoded : std_logic_vector(num_reqs-1 downto 0);
  signal reqR_reg_is_non_zero: std_logic;
begin  -- Behave

   SingleRequester: if num_reqs = 1 generate
	req_s <= reqR(0);
	ackR(0) <= ack_s;
	forward_enable <= reqR;
   end generate SingleRequester;

 
   MultipleRequesters: if num_reqs > 1 generate
   reqR_reg_is_non_zero <= OrReduce(reqR_register);
   req_s <= reqR_reg_is_non_zero;
   forward_enable <= reqR_priority_encoded;

   -- logic: in each cycle, reqR_register is updated
   --    1. if reqR_register is 0, then it is updated by reqR.
   --    2. if reqR_register is not-zero, then a forward request
   --         is enabled by a priority encode.  When this request
   --         is acked, the correspond reqR_register bit is set to 0.
   --

   process(clk)
	variable next_reqR_register : std_logic_vector(num_reqs-1 downto 0);
   begin
	next_reqR_register := reqR_register;

        if(reqR_reg_is_non_zero = '0') then
	    next_reqR_register := reqR;
        elsif(ack_s = '1') then
	    next_reqR_register := reqR_register xor reqR_priority_encoded;

	    -- if next_reqR_register turns out to be 0, and if
	    -- there are waiting requests (other than the one that
	    -- was just acknowledge), then in principle, we could
	    -- fast track (reqR xor reqR_priority_encoded) into
            -- reqR_register...
	     if(OrReduce(next_reqR_register) = '0') then
            	 next_reqR_register := (reqR xor reqR_priority_encoded);
	     end if;
        end if;

        if(clk'event and clk = '1') then
		if(reset = '1') then
  			reqR_priority_encoded <= (others => '0');
			reqR_register <= (others => '0');
		else
			reqR_register <= next_reqR_register;
			reqR_priority_encoded <= PriorityEncode(next_reqR_register);
		end if;
	end if;
	
   end process;

  process(ack_s,reqR_priority_encoded)
  begin
    for I in reqR'range loop
      ackR(I) <= reqR_priority_encoded(I) and ack_s;
    end loop;  -- I
  end process;

  end generate MultipleRequesters;
end Fair;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- forwards req_in to req_out (with one cycle delay)
-- and waits until ack_in appears before forwarding ack_out (one cycle delay).
entity RigidRepeater is
    generic(data_width: integer := 32);
    port(clk: in std_logic;
         reset: in std_logic;
         data_in: in std_logic_vector(data_width-1 downto 0);
         req_in: in std_logic;
         ack_out: out std_logic;
         data_out: out std_logic_vector(data_width-1 downto 0);
         req_out : out std_logic;
         ack_in: in std_logic);
end entity RigidRepeater;

architecture behave of RigidRepeater is

	type RR_State is (idle, busy, done);
	signal state_sig: RR_State;

begin  -- SimModel
  process(clk,state_sig,req_in,ack_in)
    variable nstate: RR_State;
    variable latch_v : boolean;
    variable req_out_v, ack_out_v : std_logic;
  begin
    nstate := state_sig;
    latch_v := false;
    req_out_v := '0';
    ack_out_v := '0';
    
    case state_sig is
      when idle =>
        -- req_in?
        if(req_in = '1') then
          nstate := busy;
          -- latch the data
          latch_v := true;
        end if;
      when busy =>
        -- pass to req_out
        req_out_v := '1';
        if(ack_in = '1') then
          -- ack_in?
          nstate := done;
        end if;
      when done =>
        -- spend one cycle here.. ack_out
        ack_out_v := '1';
        nstate := idle;
    end case;

    req_out <= req_out_v;
    ack_out <= ack_out_v;

    if(clk'event and clk = '1') then
      if(reset = '1') then
        state_sig <= idle;
      else
        state_sig <= nstate;
      end if;
      
      if(latch_v) then
        data_out <= data_in;
      end if;
    end if;
    
  end process;

end behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-- like PhiBase, but multiple writers can
-- be simultaneously active.  Use simple priority
-- to decide the winner.
entity ScalarRegister is

  generic (
    num_reqs   : integer;
    data_width : integer);
  port (
    req                 : in  BooleanArray(num_reqs-1 downto 0);
    ack                 : out Boolean;
    idata               : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    odata               : out std_logic_vector(data_width-1 downto 0);
    clk, reset          : in std_logic);

end ScalarRegister;


architecture Behave of ScalarRegister is
  signal req_PE: BooleanArray(num_reqs-1 downto 0);
begin  -- Behave

  req_PE <= PriorityEncode(req);
  pInst: PhiBase generic map(num_reqs => num_reqs, data_width => data_width)
		port map(req => req_PE, ack => ack, idata => idata, odata => odata,
				clk => clk, reset => reset);
end Behave;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;

entity SelectBase is
  generic(data_width: integer; flow_through: boolean := false);
  port(x,y: in std_logic_vector(data_width-1 downto 0);
       sel: in std_logic_vector(0 downto 0);
       req: in boolean;
       z: out std_logic_vector(data_width-1 downto 0);
       ack: out boolean;
       clk,reset: in std_logic);
end SelectBase;


architecture arch of SelectBase is 
begin

  noFlowThrough: if (not flow_through) generate

    process(x,y,sel,req,reset,clk)
    begin
      
      if(clk'event and clk = '1') then
        if(reset = '1') then
          ack <= false;
          z <= (others => '0');
        elsif(sel(sel'right) = '1' and req = true) then
          ack <= req;
          z <= x;
        elsif(sel(sel'right) = '0' and req = true) then
          ack <= req;
          z <= y; 
        else 
          ack <= false;
        end if;
      end if;
    end process;
  end generate noFlowThrough;

  flowThrough: if flow_through generate
	ack <= req;
	z <= x when sel(sel'right) = '1' else y;
  end generate flowThrough;

end arch;

library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.Utilities.all;
use ahir.Subprograms.all;

-- a simple slicing element.
entity Slicebase is
  generic(in_data_width : integer; high_index: integer; low_index : integer; flow_through : boolean := false);
  port(din: in std_logic_vector(in_data_width-1 downto 0);
       dout: out std_logic_vector(high_index-low_index downto 0);
       req: in boolean;
       ack: out boolean;
       clk,reset: in std_logic);
end Slicebase;


architecture arch of Slicebase is

begin

  assert ((high_index < in_data_width) and (low_index >= 0) and (high_index >= low_index))
    report "inconsistent slice parameters" severity failure;
  
  flowThrough: if flow_through generate
    ack <= req;
    dout <= din(high_index downto low_index);
  end generate flowThrough;

  noFlowThrough: if not flow_through generate
    process(clk)
      variable ack_var  : boolean;
    begin
      if(clk'event and clk = '1') then
        if(reset = '1') then
          ack <= false;
        else
          ack <= req;
        end if;
      end if;
    end process;

    process(clk)
    begin
      if(clk'event and clk = '1') then
        if(req) then
          dout <= din(high_index downto low_index);
        end if;
      end if;
    end process;
  end generate noFlowThrough;
  
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity SplitCallArbiterNoInArgsNoOutArgs is
  generic(num_reqs: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- return from function
    return_mreq : out std_logic;
    return_mack : in std_logic;
    return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
end SplitCallArbiterNoInArgsNoOutArgs;


architecture Struct of SplitCallArbiterNoInArgsNoOutArgs is
   signal pe_call_reqs: std_logic_vector(num_reqs-1 downto 0);
   signal return_acks_sig: std_logic_vector(num_reqs-1 downto 0);

   type TagwordArray is array (natural range <>) of std_logic_vector(caller_tag_length-1 downto 0);
   signal return_tag_sig : TagwordArray(num_reqs-1 downto 0);

   type CallStateType is (idle, busy);
   signal call_state: CallStateType;

   signal latch_call_data : std_logic;
   signal callee_mtag_prereg,callee_mtag_reg  : std_logic_vector(callee_tag_length-1 downto 0);
   signal caller_mtag_reg : std_logic_vector(caller_tag_length-1 downto 0);

   signal fair_call_reqs, fair_call_acks: std_logic_vector(num_reqs-1 downto 0);
   signal return_mreq_sig : std_logic_vector(num_reqs-1 downto 0); 

begin
  -----------------------------------------------------------------------------
  -- "fairify" the call-reqs.
  -----------------------------------------------------------------------------
  fairify: NobodyLeftBehind generic map (num_reqs => num_reqs)
		port map (clk => clk, reset => reset, reqIn => call_reqs, ackOut => call_acks,
					reqOut => fair_call_reqs, ackIn => fair_call_acks);

  -----------------------------------------------------------------------------
  -- priority encode incoming
  -----------------------------------------------------------------------------
   pe_call_reqs <= PriorityEncode(call_reqs);

   ----------------------------------------------------------------------------
   -- process to handle call_reqs  --> call_mreq muxing
   ----------------------------------------------------------------------------
   process(clk,pe_call_reqs,call_state)
        variable nstate: CallStateType;
        variable there_is_a_call : std_logic;
   begin
	nstate := call_state;
        there_is_a_call := OrReduce(pe_call_reqs);
	latch_call_data <= '0';
	call_mreq <= '0';

	if(call_state = idle) then
		if(there_is_a_call = '1') then
			latch_call_data <=  '1';
			nstate := busy;
		end if;
	elsif (call_state = busy) then
		call_mreq <= '1';
		if(call_mack = '1') then
			nstate := idle;
		end if;
	end if;
	
	if(clk'event and clk = '1') then
		if(reset = '1') then
			call_state <= idle;
		else
			call_state <= nstate;
		end if;
	end if;
   end process;


   -- combinational process.. generate call_acks, and also
   -- mux to input of call data register.
   process(pe_call_reqs,latch_call_data)
   begin
	fair_call_acks <= (others => '0');
       	for I in num_reqs-1 downto 0 loop
       		if(pe_call_reqs(I) = '1') then
			if(latch_call_data = '1') then
				fair_call_acks(I) <= '1';
			end if;
       		end if;
	end loop;
   end process;

   -- call data register.
   process(clk)
   begin
     if(clk'event and clk = '1') then
     	if(latch_call_data = '1') then
		callee_mtag_reg <= callee_mtag_prereg;
        end if;  -- I
     end if;
   end process;
 
   -- tag generation.
   tagGen : BinaryEncoder generic map (iwidth => num_reqs,
                                       owidth => callee_tag_length)
     port map (din => pe_call_reqs, dout => callee_mtag_prereg);

   -- on a successful call, register the tag from the caller
   -- side..
   process(clk)
   begin
       if(clk'event and clk = '1') then
	for T in 0 to num_reqs-1 loop
         if(pe_call_reqs(T) = '1' and latch_call_data = '1') then
           caller_mtag_reg <= call_tag(((T+1)*caller_tag_length)-1 downto T*caller_tag_length);
	   exit;
         end if;
        end loop;
       end if;
   end process;     

   -- call-mtag
   call_mtag <= callee_mtag_reg & caller_mtag_reg;

   ----------------------------------------------------------------------------
   -- reverse path
   ----------------------------------------------------------------------------
   process(return_tag_sig)
     variable lreturn_tag : std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
   begin
     for J in return_tag_sig'high(1) downto return_tag_sig'low(1) loop
       Insert(lreturn_tag,J,return_tag_sig(J));
     end loop;  -- J
     return_tag <= lreturn_tag;
   end process;

   return_mreq <= OrReduce(return_mreq_sig);

   -- the acks in both directions
   return_acks <= return_acks_sig;
   
   -- incoming data written into appropriate register.
   RetGen: for I in return_reqs'high downto return_reqs'low generate

     fsm: block
       signal ack_reg,  valid_flag : std_logic;
       signal tag_reg : std_logic_vector(caller_tag_length-1 downto 0);
       signal return_state : CallStateType;
     begin  -- block fsm

       -- valid = '1' implies this index is incoming
       valid_flag <= '1' when return_mack = '1' and (I = To_Integer(To_Unsigned(return_mtag(callee_tag_length+caller_tag_length-1 downto caller_tag_length)))) else '0';

       --------------------------------------------------------------------------
       -- ack FSM
       --------------------------------------------------------------------------
       process(clk,return_state,return_reqs(I),valid_flag,reset)
	variable nstate: CallStateType;
	variable latch_var: std_logic;
       begin

	 nstate := return_state;
	 latch_var := '0';
	 return_acks_sig(I) <= '0';

	 if(return_state = Idle) then
		if(valid_flag = '1') then
			latch_var := '1';
			nstate := Busy;
		end if;		
	 else 
		return_acks_sig(I) <= '1';
		if((valid_flag = '1') and (return_reqs(I) = '1')) then
			latch_var := '1';
		elsif (return_reqs(I) = '1') then
			nstate := Idle;
		end if;
	 end if;

	 return_mreq_sig(I) <= latch_var;

         if clk'event and clk= '1' then
           if(reset = '1') then
             return_state <= Idle;
	   else
	     return_state <= nstate;
	     if (latch_var = '1') then
               tag_reg  <= return_mtag(caller_tag_length-1 downto 0);
	     end if;
           end if;
         end if;
       end process;

       -- pass info out of the generate
       return_tag_sig(I) <= tag_reg;
       
     end block fsm;
   end generate RetGen;
end Struct;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity SplitCallArbiterNoInargs is
  generic(num_reqs: integer;
	  return_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    return_data : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
    return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- return from function
    return_mreq : out std_logic;
    return_mack : in std_logic;
    return_mdata : in  std_logic_vector(return_data_width-1 downto 0);
    return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
end SplitCallArbiterNoInargs;


architecture Struct of SplitCallArbiterNoInargs is
   signal pe_call_reqs: std_logic_vector(num_reqs-1 downto 0);
   signal return_acks_sig: std_logic_vector(num_reqs-1 downto 0);

   type TwordArray is array (natural range <>) of std_logic_vector(return_mdata'length-1 downto 0);
   signal return_data_sig : TwordArray(num_reqs-1 downto 0);

   type TagwordArray is array (natural range <>) of std_logic_vector(caller_tag_length-1 downto 0);
   signal return_tag_sig : TagwordArray(num_reqs-1 downto 0);

   type CallStateType is (idle, busy);
   signal call_state: CallStateType;

   signal latch_call_data : std_logic;
   signal callee_mtag_prereg, callee_mtag_reg  : std_logic_vector(callee_tag_length-1 downto 0);
   signal caller_mtag_reg :  std_logic_vector(caller_tag_length-1 downto 0);

   signal fair_call_reqs, fair_call_acks: std_logic_vector(num_reqs-1 downto 0);
   signal return_mreq_sig : std_logic_vector(num_reqs-1 downto 0); 
begin
  -----------------------------------------------------------------------------
  -- "fairify" the call-reqs.
  -----------------------------------------------------------------------------
  fairify: NobodyLeftBehind generic map (num_reqs => num_reqs)
		port map (clk => clk, reset => reset, reqIn => call_reqs, ackOut => call_acks,
					reqOut => fair_call_reqs, ackIn => fair_call_acks);

  -----------------------------------------------------------------------------
  -- priority encode incoming
  -----------------------------------------------------------------------------
   pe_call_reqs <= PriorityEncode(fair_call_reqs);

   ----------------------------------------------------------------------------
   -- process to handle call_reqs  --> call_mreq muxing
   ----------------------------------------------------------------------------
   process(clk,pe_call_reqs,call_state)
        variable nstate: CallStateType;
        variable there_is_a_call : std_logic;
   begin
	nstate := call_state;
        there_is_a_call := OrReduce(pe_call_reqs);
	latch_call_data <= '0';
	call_mreq <= '0';

	if(call_state = idle) then
		if(there_is_a_call = '1') then
			latch_call_data <=  '1';
			nstate := busy;
		end if;
	elsif (call_state = busy) then
		call_mreq <= '1';
		if(call_mack = '1') then
			nstate := idle;
		end if;
	end if;
	
	if(clk'event and clk = '1') then
		if(reset = '1') then
			call_state <= idle;
		else
			call_state <= nstate;
		end if;
	end if;
   end process;


   -- combinational process.. generate fair_call_acks, and also
   -- mux to input of call data register.
   process(pe_call_reqs,latch_call_data)
   begin
	fair_call_acks <= (others => '0');
       	for I in num_reqs-1 downto 0 loop
       		if(pe_call_reqs(I) = '1') then
			if(latch_call_data = '1') then
				fair_call_acks(I) <= '1';
			end if;
       		end if;
	end loop;
   end process;

   -- call data register.
   process(clk)
   begin
     if(clk'event and clk = '1') then
     	if(latch_call_data = '1') then
		callee_mtag_reg <= callee_mtag_prereg;
        end if;  -- I
     end if;
   end process;
 
   -- tag generation.
   tagGen : BinaryEncoder generic map (iwidth => num_reqs,
                                       owidth => callee_tag_length)
     port map (din => pe_call_reqs, dout => callee_mtag_prereg);

   -- on a successful call, register the tag from the caller
   -- side..
   process(clk)
   begin
       if(clk'event and clk = '1') then
	for T in 0 to num_reqs-1 loop
         if(pe_call_reqs(T) = '1' and latch_call_data = '1') then
           caller_mtag_reg <= call_tag(((T+1)*caller_tag_length)-1 downto T*caller_tag_length);
	   exit;
         end if;
        end loop;
       end if;
   end process;     

   -- call-mtag is concatenation of callee and caller tags.
   call_mtag <= callee_mtag_reg & caller_mtag_reg;


   ----------------------------------------------------------------------------
   -- reverse path
   ----------------------------------------------------------------------------
   -- pack registers into return data array
   process(return_data_sig)
     variable lreturn_data : std_logic_vector((num_reqs*return_data_width)-1 downto 0);
   begin
     for J in return_data_sig'high(1) downto return_data_sig'low(1) loop
       Insert(lreturn_data,J,return_data_sig(J));
     end loop;  -- J
     return_data <= lreturn_data;
   end process;

   process(return_tag_sig)
     variable lreturn_tag : std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
   begin
     for J in return_tag_sig'high(1) downto return_tag_sig'low(1) loop
       Insert(lreturn_tag,J,return_tag_sig(J));
     end loop;  -- J
     return_tag <= lreturn_tag;
   end process;

   return_mreq <= OrReduce(return_mreq_sig);

   -- the acks in both directions
   return_acks <= return_acks_sig;
   
   -- incoming data written into appropriate register.
   RetGen: for I in return_reqs'high downto return_reqs'low generate

     fsm: block
       signal ack_reg, valid_flag : std_logic;
       signal data_reg : std_logic_vector(return_mdata'length-1 downto 0);
       signal tag_reg : std_logic_vector(caller_tag_length-1 downto 0);
       signal return_state : CallStateType;
     begin  -- block fsm

       -- valid = '1' implies this index is incoming
       valid_flag <= '1' when return_mack = '1' and (I = To_Integer(To_Unsigned(return_mtag(callee_tag_length+caller_tag_length-1 downto caller_tag_length)))) else '0';

       --------------------------------------------------------------------------
       -- ack FSM
       --------------------------------------------------------------------------
       process(clk,return_state,return_reqs(I),valid_flag,reset)
	variable nstate: CallStateType;
	variable latch_var: std_logic;
       begin

	 nstate := return_state;
	 latch_var := '0';
	 return_acks_sig(I) <= '0';

	 if(return_state = Idle) then
		if(valid_flag = '1') then
			latch_var := '1';
			nstate := Busy;
		end if;		
	 else 
		return_acks_sig(I) <= '1';
		if((valid_flag = '1') and (return_reqs(I) = '1')) then
			latch_var := '1';
		elsif (return_reqs(I) = '1') then
			nstate := Idle;
		end if;
	 end if;

	 return_mreq_sig(I) <= latch_var;

         if clk'event and clk= '1' then
           if(reset = '1') then
             return_state <= Idle;
	   else
 	     return_state <= nstate;
	     if (latch_var = '1') then
             	data_reg <= return_mdata;
             	tag_reg  <= return_mtag(caller_tag_length-1 downto 0);
	     end if;
           end if;
	  
	      
         end if;
       end process;

       -- pass info out of the generate
       return_data_sig(I) <= data_reg;
       return_tag_sig(I)  <= tag_reg;
       
     end block fsm;
     
   end generate RetGen;
end Struct;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity SplitCallArbiterNoOutArgs is
  generic(num_reqs: integer;
	  call_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
    call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- return from function
    return_mreq : out std_logic;
    return_mack : in std_logic;
    return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
end SplitCallArbiterNoOutArgs;


architecture Struct of SplitCallArbiterNoOutArgs is
   signal pe_call_reqs: std_logic_vector(num_reqs-1 downto 0);
   signal return_acks_sig: std_logic_vector(num_reqs-1 downto 0);


   type TagwordArray is array (natural range <>) of std_logic_vector(caller_tag_length-1 downto 0);
   signal return_tag_sig : TagwordArray(num_reqs-1 downto 0);

   type CallStateType is (idle, busy);
   signal call_state: CallStateType;


   signal latch_call_data : std_logic;
   signal call_mdata_prereg  : std_logic_vector(call_data_width-1 downto 0);
   signal callee_mtag_prereg, callee_mtag_reg  : std_logic_vector(callee_tag_length-1 downto 0);
   signal caller_mtag_reg : std_logic_vector(caller_tag_length-1 downto 0);
   
   signal fair_call_reqs, fair_call_acks: std_logic_vector(num_reqs-1 downto 0);
   signal return_mreq_sig : std_logic_vector(num_reqs-1 downto 0); 
begin

  -----------------------------------------------------------------------------
  -- "fairify" the call-reqs.
  -----------------------------------------------------------------------------
  fairify: NobodyLeftBehind generic map (num_reqs => num_reqs)
		port map (clk => clk, reset => reset, reqIn => call_reqs, ackOut => call_acks,
					reqOut => fair_call_reqs, ackIn => fair_call_acks);

  -----------------------------------------------------------------------------
  -- priority encode incoming
  -----------------------------------------------------------------------------
   pe_call_reqs <= PriorityEncode(fair_call_reqs);

   ----------------------------------------------------------------------------
   -- process to handle call_reqs  --> call_mreq muxing
   ----------------------------------------------------------------------------
   process(clk,pe_call_reqs,call_state)
        variable nstate: CallStateType;
        variable there_is_a_call : std_logic;
   begin
	nstate := call_state;
        there_is_a_call := OrReduce(pe_call_reqs);
	latch_call_data <= '0';
	call_mreq <= '0';

	if(call_state = idle) then
		if(there_is_a_call = '1') then
			latch_call_data <=  '1';
			nstate := busy;
		end if;
	elsif (call_state = busy) then
		call_mreq <= '1';
		if(call_mack = '1') then
			nstate := idle;
		end if;
	end if;
	
	if(clk'event and clk = '1') then
		if(reset = '1') then
			call_state <= idle;
		else
			call_state <= nstate;
		end if;
	end if;
   end process;



   -- combinational process.. generate call_acks, and also
   -- mux to input of call data register.
   process(pe_call_reqs,latch_call_data, call_data)
	variable out_data : std_logic_vector(call_data_width-1 downto 0);
   begin
	fair_call_acks <= (others => '0');
        out_data := (others => '0');
       	for I in num_reqs-1 downto 0 loop
       		if(pe_call_reqs(I) = '1') then
       			Extract(call_data,I,out_data);
			if(latch_call_data = '1') then
				fair_call_acks(I) <= '1';
			end if;
       		end if;
	end loop;
	call_mdata_prereg <= out_data;
   end process;

   -- call data register.
   process(clk)
   begin
     if(clk'event and clk = '1') then
     	if(latch_call_data = '1') then
		call_mdata <= call_mdata_prereg;
		callee_mtag_reg <= callee_mtag_prereg;
        end if;  -- I
     end if;
   end process;
 
   -- tag generation.
   tagGen : BinaryEncoder generic map (iwidth => num_reqs,
                                       owidth => callee_tag_length)
     port map (din => pe_call_reqs, dout => callee_mtag_prereg);

   -- on a successful call, register the tag from the caller
   -- side..
   process(clk)
   begin
       if(clk'event and clk = '1') then
	for T in 0 to num_reqs-1 loop
         if(pe_call_reqs(T) = '1' and latch_call_data = '1') then
           caller_mtag_reg <= call_tag(((T+1)*caller_tag_length)-1 downto T*caller_tag_length);
         end if;
        end loop;
       end if;
   end process;     

   -- call tag.
   call_mtag <= callee_mtag_reg & caller_mtag_reg;

   ----------------------------------------------------------------------------
   -- reverse path
   ----------------------------------------------------------------------------
   process(return_tag_sig)
     variable lreturn_tag : std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
   begin
     for J in return_tag_sig'high(1) downto return_tag_sig'low(1) loop
       Insert(lreturn_tag,J,return_tag_sig(J));
     end loop;  -- J
     return_tag <= lreturn_tag;
   end process;

   -- always ready to accept return data..
   -- (assumption... that call and return requests from the 
   --  the left will alternate).
   return_mreq <= OrReduce(return_mreq_sig);

   -- the acks in both directions
   return_acks <= return_acks_sig;
   
   -- incoming data written into appropriate register.
   RetGen: for I in return_reqs'high downto return_reqs'low generate

     fsm: block
       signal ack_reg, valid_flag : std_logic;
       signal tag_reg  : std_logic_vector(caller_tag_length-1 downto 0);
       signal return_state : CallStateType;
     begin  -- block fsm

       -- valid = '1' implies this index is incoming
       valid_flag <= '1' when return_mack = '1' and (I = To_Integer(To_Unsigned(return_mtag(callee_tag_length+caller_tag_length-1 downto caller_tag_length)))) else '0';

       --------------------------------------------------------------------------
       -- ack FSM
       --------------------------------------------------------------------------
       process(clk,return_state,return_reqs(I),valid_flag,reset)
	variable nstate: CallStateType;
	variable latch_var: std_logic;
       begin

	 nstate := return_state;
	 latch_var := '0';
	 return_acks_sig(I) <= '0';

	 if(return_state = Idle) then
		if(valid_flag = '1') then
			latch_var := '1';
			nstate := Busy;
		end if;		
	 else 
	 	return_acks_sig(I) <= '1';
		if((valid_flag = '1') and (return_reqs(I) = '1')) then
			latch_var := '1';
		elsif (return_reqs(I) = '1') then
			nstate := Idle;
		end if;
	 end if;

	 return_mreq_sig(I) <= latch_var;

         if clk'event and clk= '1' then
           if(reset = '1') then
             return_state <= Idle;
	   else 
	     return_state <= nstate;
	     if (latch_var = '1') then
             	tag_reg  <= return_mtag(caller_tag_length-1 downto 0);
	     end if;
           end if;
         end if;
       end process;

       -- pass info out of the generate
       return_tag_sig(I) <= tag_reg;
     end block fsm;

   end generate RetGen;

end Struct;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity SplitCallArbiter is
  generic(num_reqs: integer;
	  call_data_width: integer;
	  return_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
    call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    return_data : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
    return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- return from function
    return_mreq : out std_logic;
    return_mack : in std_logic;
    return_mdata : in  std_logic_vector(return_data_width-1 downto 0);
    return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
end SplitCallArbiter;


architecture Struct of SplitCallArbiter is
   signal pe_call_reqs, pe_call_reqs_reg: std_logic_vector(num_reqs-1 downto 0);
   signal return_acks_sig: std_logic_vector(num_reqs-1 downto 0);

   type TwordArray is array (natural range <>) of std_logic_vector(return_mdata'length-1 downto 0);
   signal return_data_sig : TwordArray(num_reqs-1 downto 0);

   type TagwordArray is array (natural range <>) of std_logic_vector(caller_tag_length-1 downto 0);
   signal return_tag_sig : TagwordArray(num_reqs-1 downto 0);

   type CallStateType is (idle, busy);
   signal call_state: CallStateType;


   signal latch_call_data : std_logic;
   signal call_mdata_prereg  : std_logic_vector(call_data_width-1 downto 0);
   signal callee_mtag_prereg, callee_mtag_reg  : std_logic_vector(callee_tag_length-1 downto 0);
   signal caller_mtag_reg  : std_logic_vector(caller_tag_length-1 downto 0);

   signal fair_call_reqs, fair_call_acks: std_logic_vector(num_reqs-1 downto 0);
   signal return_mreq_sig : std_logic_vector(num_reqs-1 downto 0); 

begin
  -----------------------------------------------------------------------------
  -- "fairify" the call-reqs.
  -----------------------------------------------------------------------------
  fairify: NobodyLeftBehind generic map (num_reqs => num_reqs)
		port map (clk => clk, reset => reset, reqIn => call_reqs, ackOut => call_acks,
					reqOut => fair_call_reqs, ackIn => fair_call_acks);

  -----------------------------------------------------------------------------
  -- priority encode incoming
  -----------------------------------------------------------------------------
   pe_call_reqs <= PriorityEncode(fair_call_reqs);

   ----------------------------------------------------------------------------
   -- process to handle call_reqs  --> call_mreq muxing
   ----------------------------------------------------------------------------
   process(clk,pe_call_reqs,call_state,reset)
        variable nstate: CallStateType;
        variable there_is_a_call : std_logic;
   begin
	nstate := call_state;
        there_is_a_call := OrReduce(pe_call_reqs);
	latch_call_data <= '0';
	call_mreq <= '0';

	if(call_state = idle) then
		if(there_is_a_call = '1') then
			latch_call_data <=  '1';
			nstate := busy;
		end if;
	elsif (call_state = busy) then
		call_mreq <= '1';
		if(call_mack = '1') then
			if(there_is_a_call = '1') then
				latch_call_data <=  '1';
                        else
				nstate := idle;
			end if;
		end if;
	end if;
	
	if(clk'event and clk = '1') then
		if(reset = '1') then
			call_state <= idle;
			pe_call_reqs_reg <= (others => '0');
		else
			call_state <= nstate;
		end if;
	end if;
   end process;



   -- combinational process.. generate fair_call_acks, and also
   -- mux to input of call data register.
   process(pe_call_reqs,latch_call_data,call_data)
	variable out_data : std_logic_vector(call_data_width-1 downto 0);
   begin
	fair_call_acks <= (others => '0');
	out_data := (others => '0');
       	for I in num_reqs-1 downto 0 loop
       		if(pe_call_reqs(I) = '1') then
       			Extract(call_data,I,out_data);
			if(latch_call_data = '1') then
				fair_call_acks(I) <= '1';
			end if;
       		end if;
	end loop;
	call_mdata_prereg <= out_data;
   end process;

   -- call data register.
   process(clk)
   begin
     if(clk'event and clk = '1') then
     	if(latch_call_data = '1') then
		call_mdata <= call_mdata_prereg;
		callee_mtag_reg <= callee_mtag_prereg;
        end if;  -- I
     end if;
   end process;
 

   -- tag generation.
   tagGen : BinaryEncoder generic map (iwidth => num_reqs,
                                       owidth => callee_tag_length)
     port map (din => pe_call_reqs, dout => callee_mtag_prereg);

   -- on a successful call, register the tag from the caller
   -- side..
   process(clk)
	variable tvar : std_logic_vector(caller_tag_length-1 downto 0);
   begin
       if(clk'event and clk = '1') then
	for T in 0 to num_reqs-1 loop
         if(pe_call_reqs(T) = '1' and latch_call_data = '1') then
           tvar := call_tag(((T+1)*caller_tag_length)-1 downto T*caller_tag_length);
         end if;
        end loop;
	caller_mtag_reg <= tvar;
       end if;
   end process;     

   -- call tag.
   call_mtag <= callee_mtag_reg & caller_mtag_reg;


   ----------------------------------------------------------------------------
   -- reverse path
   ----------------------------------------------------------------------------
   -- pack registers into return data array
   process(return_data_sig)
     variable lreturn_data : std_logic_vector((num_reqs*return_data_width)-1 downto 0);
   begin
     for J in return_data_sig'high(1) downto return_data_sig'low(1) loop
       Insert(lreturn_data,J,return_data_sig(J));
     end loop;  -- J
     return_data <= lreturn_data;
   end process;
 
   -- 2D to 1D packing.
   process(return_tag_sig)
     variable lreturn_tag : std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
   begin
     for J in return_tag_sig'high(1) downto return_tag_sig'low(1) loop
       Insert(lreturn_tag,J,return_tag_sig(J));
     end loop;  -- J
     return_tag <= lreturn_tag;
   end process;

   -- always ready to accept return data!
   -- Sorry, this is broken..  What if successive returns
   -- arrive from a pipelined module aimed at the same destination?
   -- Back-pressure is needed!
   return_mreq <= OrReduce(return_mreq_sig);

   -- return to caller.
   return_acks <= return_acks_sig;
   
   -- incoming data written into appropriate register.
   RetGen: for I in num_reqs-1 downto 0 generate

     fsm: block
       signal ack_reg, valid_flag : std_logic;
       signal data_reg : std_logic_vector(return_mdata'length-1 downto 0);
       signal tag_reg  : std_logic_vector(caller_tag_length-1 downto 0);
       signal return_state : CallStateType;
     begin  -- block fsm

       -- valid = '1' implies this index is incoming
       valid_flag <= '1' when return_mack = '1' and (I = To_Integer(To_Unsigned(return_mtag(caller_tag_length+callee_tag_length-1 downto caller_tag_length)))) else '0';

       --------------------------------------------------------------------------
       -- ack FSM
       --------------------------------------------------------------------------
       process(clk,return_state,return_reqs(I),valid_flag,reset)
	variable nstate: CallStateType;
	variable latch_var: std_logic;
       begin

	 nstate := return_state;
	 latch_var := '0';
	 return_acks_sig(I) <= '0';

	 if(return_state = Idle) then
		if(valid_flag = '1') then
			latch_var := '1';
			nstate := Busy;
		end if;		
	 else 
		return_acks_sig(I) <= '1';
		if((valid_flag = '1') and (return_reqs(I) = '1')) then
			latch_var := '1';
		elsif (return_reqs(I) = '1') then
			nstate := Idle;
		end if;
	 end if;

	 return_mreq_sig(I) <= latch_var;

         if clk'event and clk= '1' then
           if(reset = '1') then
             return_state <= Idle;
	   else
	     return_state <= nstate;
	     if(latch_var = '1') then
             	data_reg <= return_mdata;
             	tag_reg  <= return_mtag(caller_tag_length-1 downto 0);
	     end if;
           end if;
         end if;
       end process;

       -- pass info out of the generate
       return_data_sig(I) <= data_reg;
       return_tag_sig(I)  <= tag_reg;

     end block fsm;
     
   end generate RetGen;

end Struct;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.FloatOperatorPackage.all;
use ahir.BaseComponents.all;

entity SplitOperatorBase is
  generic
    (
      operator_id   : string := "ApIntAdd";          -- operator id
      input1_is_int : Boolean := true; -- false means float
      input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      iwidth_1      : integer := 4;    -- width of input1
      input2_is_int : Boolean := true; -- false means float
      input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      iwidth_2      : integer := 0;    -- width of input2
      num_inputs    : integer := 1;    -- can be 1 or 2.
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      owidth        : integer := 4;          -- width of output.
      constant_operand : std_logic_vector := "0001"; -- constant operand.. (it is always the second operand)
      constant_width: integer := 4;
      twidth        : integer := 1;          -- tag width
      use_constant  : boolean := true
      );
  port (
    -- req/ack follow level protocol
    reqR: out std_logic;
    ackR: in std_logic;
    reqL: in std_logic;
    ackL : out  std_logic;
    -- tagL is passed out to tagR
    tagL       : in  std_logic_vector(twidth-1 downto 0);
    -- input array consists of m sets of 1 or 2 possibly concatenated
    -- operands.
    dataL      : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
    dataR      : out std_logic_vector(owidth-1 downto 0);
    -- tagR is received from tagL, concurrent
    -- with dataR
    tagR       : out std_logic_vector(twidth-1 downto 0);
    clk, reset : in  std_logic);
end SplitOperatorBase;


architecture Vanilla of SplitOperatorBase is
  signal   result    : std_logic_vector(owidth-1 downto 0);
  signal   state_sig : std_logic;
  constant tag0      : std_logic_vector(tagR'length-1 downto 0) := (others => '0');
  constant iwidth : integer := iwidth_1  + iwidth_2;

begin  -- Behave

  assert((num_inputs = 1) or (num_inputs = 2)) report "either 1 or 2 inputs" severity failure;

  reqR <= reqL;
  ackL <= ackR;
  tagR <= tagL;
  
  comb_block: GenericCombinationalOperator
    generic map (
      operator_id                 => operator_id,
      input1_is_int               => input1_is_int,
      input1_characteristic_width => input1_characteristic_width,
      input1_mantissa_width       => input1_mantissa_width,
      iwidth_1                    => iwidth_1,
      input2_is_int               => input2_is_int,
      input2_characteristic_width => input2_characteristic_width,
      input2_mantissa_width       => input2_mantissa_width,
      iwidth_2                    => iwidth_2,
      num_inputs                  => num_inputs,
      output_is_int               => output_is_int,
      output_characteristic_width => output_characteristic_width,
      output_mantissa_width       => output_mantissa_width,
      owidth                      => owidth,
      constant_operand            => constant_operand,
      constant_width		  => constant_width,
      use_constant                => use_constant)
    port map (
      data_in => dataL,
      result  => dataR);


end Vanilla;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity SplitOperatorShared is
    generic
    (
      name : string;
      operator_id   : string := "ApIntAdd";          -- operator id
      input1_is_int : Boolean := true; -- false means float
      input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      iwidth_1      : integer := 4;    -- width of input1
      input2_is_int : Boolean := true; -- false means float
      input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      iwidth_2      : integer := 0;    -- width of input2
      num_inputs    : integer := 1;    -- can be 1 or 2.
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      owidth        : integer := 4;          -- width of output.
      constant_operand : std_logic_vector := "0001"; -- constant operand.. (it is always the second operand)
      constant_width: integer := 4;
      use_constant  : boolean := true;
      no_arbitration: boolean := false;
      min_clock_period: boolean := true;
      num_reqs : integer := 3; -- how many requesters?
      detailed_buffering_per_output : IntegerArray := (0 => 0);
      detailed_buffering_per_input : IntegerArray  := (0 => 0);
      use_input_buffering: boolean := false
    );
  port (
    -- req/ack follow level protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackR                     : out BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    reqR                     : in  BooleanArray(num_reqs-1 downto 0);
    -- input data consists of concatenated pairs of ips
    dataL                    : in std_logic_vector(((iwidth_1 + iwidth_2)*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    dataR                    : out std_logic_vector((owidth*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset              : in std_logic);
end SplitOperatorShared;

architecture Vanilla of SplitOperatorShared is

  constant num_operands : integer := num_inputs;
  constant iwidth : integer := iwidth_1 + iwidth_2;
  
  constant ignore_tag  : boolean := no_arbitration or (reqL'length = 1);

  signal idata : std_logic_vector(iwidth-1 downto 0);
  signal odata: std_logic_vector(owidth-1 downto 0);

  constant tag_length: integer := Maximum(1,Ceil_Log2(reqL'length));
  signal itag,otag : std_logic_vector(tag_length-1 downto 0);
  signal ireq,iack, oreq, oack: std_logic;

  constant debug_flag : boolean := false;
  
begin  -- Behave
  assert ackL'length = reqL'length report "mismatched req/ack vectors" severity error;
  

  -- DebugGen: if debug_flag generate 
    -- assert( (not ((reset = '0') and (clk'event and clk = '1') and no_arbitration)) or Is_At_Most_One_Hot(reqL))
    -- report "in no-arbitration case, at most one request should be hot on clock edge (in SplitOperatorShared)" severity error;
  -- end generate DebugGen;
  
  NoInputBuffering: if not use_input_buffering generate 
    imux: InputMuxBase
      generic map(iwidth => iwidth*num_reqs,
                owidth => iwidth, 
                twidth => tag_length,
                nreqs => num_reqs,
                no_arbitration => no_arbitration,
                registered_output => true)
      port map(
        reqL       => reqL,
        ackL       => ackL,
        reqR       => ireq,
        ackR       => iack,
        dataL      => dataL,
        dataR      => idata,
        tagR       => itag,
        clk        => clk,
        reset      => reset);
  end generate NoInputBuffering;

  YesInputBuffering: if use_input_buffering generate
    imuxWithInputBuf: InputMuxWithBuffering
      generic map(name => name & " imux " , 
		iwidth => iwidth*num_reqs,
                owidth => iwidth, 
                twidth => tag_length,
                nreqs => num_reqs,
		buffering => detailed_buffering_per_input,
                no_arbitration => no_arbitration,
                registered_output => true)
      port map(
        reqL       => reqL,
        ackL       => ackL,
        reqR       => ireq,
        ackR       => iack,
        dataL      => dataL,
        dataR      => idata,
        tagR       => itag,
        clk        => clk,
        reset      => reset);
  end generate YesInputBuffering;

  op: SplitOperatorBase
    generic map (
      operator_id   => operator_id,
      input1_is_int => input1_is_int,
      input1_characteristic_width => input1_characteristic_width,
      input1_mantissa_width => input1_mantissa_width,
      iwidth_1  => iwidth_1,
      input2_is_int => input2_is_int,
      input2_characteristic_width => input2_characteristic_width,
      input2_mantissa_width  => input2_mantissa_width,
      iwidth_2  => iwidth_2,
      num_inputs  => num_inputs,
      output_is_int => output_is_int,
      output_characteristic_width => output_characteristic_width,
      output_mantissa_width  => output_mantissa_width,
      owidth    => owidth,
      constant_operand => constant_operand,
      constant_width => constant_width,
      twidth     => tag_length,
      use_constant => use_constant
      )
    port map (
      reqL => ireq,
      ackL => iack,
      reqR => oreq,
      ackR => oack,
      dataL => idata,
      dataR => odata,
      tagR => otag,
      tagL => itag,
      clk => clk,
      reset => reset);


  odemux: OutputDeMuxBaseWithBuffering
    generic map (
        name => name & " odemux ",
  	iwidth => owidth,
  	owidth =>  owidth*num_reqs,
	twidth =>  tag_length,
	nreqs  => num_reqs,
        detailed_buffering_per_output => detailed_buffering_per_output )  
    port map (
      reqL   => oreq,
      ackL   => oack,
      dataL => odata,
      tagL  => otag,
      reqR  => reqR,
      ackR  => ackR,
      dataR => dataR,
      clk   => clk,
      reset => reset);
  
end Vanilla;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity StoreCompleteShared is
  generic (name : string; num_reqs: integer := 3;
	   tag_length: integer :=  3;
	    detailed_buffering_per_output: IntegerArray);
  port (
    -- in requester array, pulse protocol
    -- more than one requester can be active
    -- at any time
    reqR : in BooleanArray(num_reqs-1 downto 0);
    -- out ack array, pulse protocol
    -- more than one ack can be sent back
    -- at any time.
    --
    -- Note: req -> ack delay can be 0
    ackR : out BooleanArray(num_reqs-1 downto 0);
    -- mreq goes out to memory as 
    -- a response to mack.
    mreq : out std_logic;
    mack : in  std_logic;
    -- mtag to distinguish the 
    -- requesters.
    mtag : in std_logic_vector(tag_length-1 downto 0);
    -- rising edge of clock is used
    clk : in std_logic;
    -- synchronous reset, active high
    reset : in std_logic);
end StoreCompleteShared;

architecture Behave of StoreCompleteShared is
begin  -- Behave


  odemux: OutputDemuxBaseNoData
    generic map (
      name => name & " odemux in StoreComplete",
      twidth =>  tag_length,
      nreqs  => num_reqs,
      detailed_buffering_per_output => detailed_buffering_per_output)
    port map (
      reqL   => mack,                   -- cross-over (mack from mem-subsystem)
      ackL   => mreq,                   -- cross-over 
      tagL  =>  mtag,
      reqR  => reqR,
      ackR  => ackR,
      clk   => clk,
      reset => reset);

end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity StoreReqShared is
    generic
    (
	addr_width: integer;
	data_width : integer;
	time_stamp_width : integer;
      	num_reqs : integer; -- how many requesters?
	tag_length: integer;
	no_arbitration: Boolean := false;
        min_clock_period: Boolean := true        
    );
  port (
    -- req/ack follow pulse protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    -- address corresponding to access
    addr                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
    data                    : in std_logic_vector((data_width*num_reqs)-1 downto 0);
    -- address to memory
    maddr                   : out std_logic_vector(addr_width-1 downto 0);
    mdata                   : out std_logic_vector(data_width-1 downto 0);
    mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);
    mreq                    : out std_logic;
    mack                    : in std_logic;
    -- clock, reset (active high)
    clk, reset              : in std_logic);
end StoreReqShared;

architecture Vanilla of StoreReqShared is

  constant iwidth: integer := addr_width*num_reqs;
  constant owidth: integer := addr_width;

  signal idata: std_logic_vector(((addr_width+data_width)*num_reqs)-1 downto 0);
  signal odata: std_logic_vector((addr_width+data_width)-1 downto 0);

  constant debug_flag : boolean := false;
--  constant registered_output: boolean := min_clock_period and (time_stamp_width = 0);

  -- must register..  ack implies that address has been sampled.
  constant registered_output: boolean := true;

  
  signal imux_tag_out: std_logic_vector(tag_length-1 downto 0);
begin  -- Behave

  TstampGen: if time_stamp_width > 0 generate

    Tstamp: block
	signal time_stamp: std_logic_vector(time_stamp_width-1 downto 0);
    begin 
  	mtag <= imux_tag_out & time_stamp;

	-- ripple counter.
	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				time_stamp <= (others => '0');
			else
				for I in 1 to time_stamp_width-1 loop
					time_stamp(I) <= time_stamp(I) xor AndReduce(time_stamp(I-1 downto 0));
				end loop;
				time_stamp(0) <= not time_stamp(0);
			end if;
		end if;
	end process;
    end block;
    
  end generate TstampGen;

  NoTstampGen: if time_stamp_width < 1 generate
	mtag <= imux_tag_out;
  end generate NoTstampGen;

  process(addr,data)
  begin
     for I in num_reqs-1 downto 0 loop
	idata(((I+1)*(addr_width+data_width))-1 downto (I*(addr_width+data_width))) <= 
		addr(((I+1)*addr_width)-1 downto I*addr_width) & 
		data(((I+1)*data_width)-1 downto I*data_width);
     end loop;
  end process;

  maddr <= odata(addr_width+data_width-1 downto data_width);
  mdata <= odata(data_width-1 downto 0);

  assert(tag_length >= Ceil_Log2(num_reqs)) report "insufficient tag width" severity error;

  -- debugCase: if debug_flag generate
    -- assert( (not ((reset = '0') and (clk'event and clk = '1') and no_arbitration)) or Is_At_Most_One_Hot(reqL))
      -- report "in no-arbitration case, at most one request should be hot on clock edge (in SplitOperatorShared)" severity error;
  -- end generate debugCase;
  
  imux: InputMuxBase
  	generic map(iwidth => (addr_width+data_width)*num_reqs ,
                    owidth => addr_width+data_width, 
                    twidth => tag_length,
                    nreqs => num_reqs,
                    registered_output => registered_output,
                    no_arbitration => no_arbitration)
    port map(
      reqL       => reqL,
      ackL       => ackL,
      reqR       => mreq,
      ackR       => mack,
      dataL      => idata,
      dataR      => odata,
      tagR       => imux_tag_out,
      clk        => clk,
      reset      => reset);
  
end Vanilla;

-- copyright: Madhav Desai
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;

entity SynchFifo is
  generic(name: string := "anon"; queue_depth: integer := 3; data_width: integer := 72);
  port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack : out std_logic;
       nearly_full: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity SynchFifo;

architecture behave of SynchFifo is

  type QueueArray is array(natural range <>) of std_logic_vector(data_width-1 downto 0);

  signal queue_array : QueueArray(queue_depth-1 downto 0);
  signal read_pointer, write_pointer : integer range 0 to queue_depth-1;
  signal queue_size : integer range 0 to queue_depth;

  signal pop_ack_int, pop_req_int: std_logic;
  signal data_out_int : std_logic_vector(data_width-1 downto 0);

  function Incr(x: integer; M: integer) return integer is
  begin
    if(x < M) then
      return(x + 1);
    else
      return(0);
    end if;
  end Incr;


  signal pull_reg_state: std_logic;
begin  -- SimModel

  assert(queue_depth > 2) report "Synch FIFO depth must be greater than 2" severity failure;
  assert (queue_size < queue_depth) report "Queue " & name & " is full." severity note;

  
  -- single process
  process(clk,reset,queue_size,push_req,pop_req_int,read_pointer, write_pointer)
    variable qsize : integer range 0 to queue_depth;
    variable push_ack_v, pop_ack_v, nearly_full_v: std_logic;
    variable push,pop : boolean;
    variable next_read_ptr,next_write_ptr : integer range 0 to queue_depth-1;
  begin
    qsize := queue_size;
    push  := false;
    pop   := false;
    next_read_ptr := read_pointer;
    next_write_ptr := write_pointer;
    
    if(queue_size < queue_depth) then
      push_ack_v := '1';
    else
      push_ack_v := '0';
    end if;

    if(queue_size < queue_depth-1) then
      nearly_full_v := '0';
    else
      nearly_full_v := '1';
    end if;

    if(queue_size > 0) then
      pop_ack_v := '1';
    else
      pop_ack_v := '0';
    end if;


    
    if(push_ack_v = '1' and push_req = '1') then
      push := true;
    end if;

    if(pop_ack_v = '1' and pop_req_int = '1') then
      pop := true;
    end if;

    if(push) then
      next_write_ptr := Incr(next_write_ptr,queue_depth-1);
    end if;

    if(pop) then
      next_read_ptr := Incr(next_read_ptr,queue_depth-1);
    end if;


    if(pop and (not push)) then
      qsize := qsize - 1;
    elsif(push and (not pop)) then
      qsize := qsize + 1;
    end if;
    

    push_ack <= push_ack_v;

    nearly_full <= nearly_full_v;
    
    if(clk'event and clk = '1') then
      
      if(reset = '1') then
        pop_ack_int  <=  '0';        
	queue_size <= 0;
        read_pointer <= 0;
        write_pointer <= 0;
      else
        pop_ack_int  <=  pop_ack_v and pop_req_int;        
        queue_size <= qsize;
        read_pointer <= next_read_ptr;
        write_pointer <= next_write_ptr;
      end if;

      if(push) then
        queue_array(write_pointer) <= data_in;
      end if;
      
      if(pop) then
        data_out_int <= queue_array(read_pointer);
      end if;
      
    end if;
    
  end process;


  opReg: SynchToAsynchReadInterface 
		generic map(data_width => data_width)
		port map(clk => clk, reset => reset,
			 synch_req => pop_ack_int,
			 synch_ack => pop_req_int,
			 asynch_req => pop_ack,
			 asynch_ack => pop_req,
			 synch_data => data_out_int,
			 asynch_data => data_out);
end behave;


-- written by Madhav Desai
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;

entity SynchLifo is
  generic(name : string := "anon"; queue_depth: integer := 3; data_width: integer := 72);
  port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack : out std_logic;
       nearly_full: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity SynchLifo;

architecture behave of SynchLifo is

  type QueueArray is array(natural range <>) of std_logic_vector(data_width-1 downto 0);

  signal queue_array : QueueArray(queue_depth-1 downto 0);
  signal tos_pointer, write_pointer : integer range 0 to queue_depth-1;
  signal queue_size : integer range 0 to queue_depth;

  signal bypass_reg, mem_out_reg : std_logic_vector(data_width-1 downto 0);

  function Incr(x: integer; M: integer) return integer is
  begin
    if(x < M) then
      return(x + 1);
    else
      return(0);
    end if;
  end Incr;

  signal nearly_empty_sig, empty_sig, full_sig : std_logic;
  signal select_bypass : std_logic;
  signal pop_req_int: std_logic;
begin  -- SimModel
  assert (queue_size < queue_depth) report "LIFO " & name & " is full." severity note;

  full_sig  <= '1' when (queue_size = queue_depth) else '0';
  empty_sig <= '1' when (queue_size = 0) else '0';
  nearly_empty_sig <= '1' when (queue_size = 1) else '0';
  nearly_full <= '1' when (queue_size = (queue_depth-1)) else '0';


  -- single process
  process(clk,reset,
          empty_sig,
          full_sig,
          queue_size,
          push_req,
          pop_req,
          tos_pointer,
          write_pointer)
    variable qsize : integer range 0 to queue_depth;
    variable push,pop,bypass : boolean;
    variable next_tos_ptr, next_write_ptr : integer range 0 to queue_depth-1;
  begin
    qsize := queue_size;
    push  := false;
    pop   := false;
    next_tos_ptr := tos_pointer;
    next_write_ptr := write_pointer;
    
    if((queue_size < queue_depth) and push_req = '1') then
      push := true;
    end if;

    if((queue_size > 0) and pop_req_int = '1') then
      pop := true;
    end if;

    bypass := push and pop;
    
    if push and (not pop) then
      -- increment write pointer and tos-pointer.
      next_write_ptr := Incr(write_pointer,queue_depth-1);
      if(queue_size > 0) then
        next_tos_ptr := Incr(tos_pointer,queue_depth-1);
      else
        next_tos_ptr := 0;
      end if;
      qsize := queue_size + 1;      
    elsif pop and (not push) then
      if(write_pointer > 0) then
      	next_write_ptr := write_pointer-1;
      else
	-- if write-ptr is 0, it must have wrapped around
        -- in the increment function.
	next_write_ptr := queue_depth - 1;
      end if;

      if(tos_pointer > 0) then
        next_tos_ptr := tos_pointer - 1;
      else
        next_tos_ptr := 0;
      end if;
      qsize := queue_size - 1;            
    end if;
    
    if(clk'event and clk = '1') then
      
      if(reset = '1') then
	queue_size <= 0;
        tos_pointer <= 0;
        write_pointer <= 0;
        select_bypass <= '0';
      else
        queue_size <= qsize;
        tos_pointer <= next_tos_ptr;
        write_pointer <= next_write_ptr;
      end if;

      if(bypass) then
        select_bypass <= '1';
        bypass_reg <= data_in;
      elsif push then
        queue_array(write_pointer) <= data_in;
        select_bypass <= '1';
        bypass_reg <= data_in;
      elsif pop then
        select_bypass <= '0';        
	if(tos_pointer > 0) then
        	mem_out_reg <= queue_array(tos_pointer-1);        
	end if;
      end if;
    end if;  
  end process;

  push_ack <= not full_sig;
  pop_ack  <= not empty_sig;
  pop_req_int <= pop_req;
  data_out <= bypass_reg when select_bypass = '1' else mem_out_reg;
  
end behave;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;


entity SynchToAsynchReadInterface is
  generic (
    data_width : integer);
  port (
    clk : in std_logic;
    reset  : in std_logic;
    synch_req : in std_logic;
    synch_ack : out std_logic;
    asynch_req : out std_logic;
    asynch_ack: in std_logic;
    synch_data: in std_logic_vector(data_width-1 downto 0);
    asynch_data : out std_logic_vector(data_width-1 downto 0));
end SynchToAsynchReadInterface;


architecture Behave of SynchToAsynchReadInterface is

  type InMatchingFSMState is (idle,waiting);
  signal in_fsm_state : InMatchingFSMState;
  
begin

  process(clk,reset, in_fsm_state, synch_req, asynch_ack)
    variable next_state: InMatchingFSMState;
    variable synch_ack_var, asynch_req_var: std_logic;
    
  begin
    next_state := in_fsm_state;

    synch_ack_var := '0';
    asynch_req_var := '0';
    
    case in_fsm_state is
      when idle =>
        synch_ack_var := '1';          -- this is the only state where we req..
        
        if(synch_req = '1') then
          asynch_req_var := '1';

          -- synch-ack is withdrawn immediately
          -- unless asynch acks.
          synch_ack_var := '0';          
          if(asynch_ack = '1')  then
            -- if asynch-ack, continue ack to synch
            synch_ack_var := '1';
          else
            -- neither acked
            next_state := waiting;
          end if;
	end if;
      when waiting =>
        -- keep requesting to the asynch-pipe
        asynch_req_var := '1';
        if(asynch_ack = '1')  then
          -- asynch ack, continue synch-ack.
            synch_ack_var := '1';
            next_state := idle;
        else
          -- neither acked
          next_state := waiting;
        end if;
      when others => null;
    end case;

    if(reset = '1') then
      next_state := idle;
    end if;
    
    synch_ack <= synch_ack_var;
    asynch_req <= asynch_req_var;

    if(clk'event and clk = '1') then
      in_fsm_state <= next_state;
    end if;
  end process;

  -- data is simply forwarded..
  asynch_data <= synch_data;
  
end Behave;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity UnloadBuffer is
  generic (name: string; buffer_size: integer := 2; data_width : integer := 32);
  port ( write_req: in std_logic;
        write_ack: out std_logic;
        write_data: in std_logic_vector(data_width-1 downto 0);
        unload_req: in boolean;
        unload_ack: out boolean;
        read_data: out std_logic_vector(data_width-1 downto 0);
        clk : in std_logic;
        reset: in std_logic);
end UnloadBuffer;

architecture default_arch of UnloadBuffer is

  signal pop_req, pop_ack, push_req, push_ack: std_logic_vector(0 downto 0);
  signal pipe_data_out:  std_logic_vector(data_width-1 downto 0);

  signal output_register : std_logic_vector(data_width-1 downto 0);

  signal unload_req_reg, unload_req_token, unload_req_clear  : boolean;
  signal unload_ack_sig : boolean;

  type UnloadFsmState is (idle, waiting);
  signal fsm_state : UnloadFsmState;

  signal load_reg: boolean;
  
begin  -- default_arch

  -- the input pipe.
  bufPipe : PipeBase generic map (
    name =>  name & " fifo ",
    num_reads  => 1,
    num_writes => 1,
    data_width => data_width,
    lifo_mode  => false,
    depth      => buffer_size)
    port map (
      read_req   => pop_req,
      read_ack   => pop_ack,
      read_data  => pipe_data_out,
      write_req  => push_req,
      write_ack  => push_ack,
      write_data => write_data,
      clk        => clk,
      reset      => reset);
  push_req(0) <= write_req;
  write_ack <= push_ack(0);


  -- FSM
  process(clk,unload_req, pop_ack)
     variable nstate: UnloadFsmState;
     variable ackv: boolean;
     variable preq : std_logic;
  begin
     nstate :=  fsm_state;
     preq := '0';
     ackv := false;
  
     case fsm_state is
         when idle => 
               if(unload_req and (pop_ack(0) = '1')) then
		    preq := '1';   
		    ackv := true;
               elsif (unload_req) then
                    nstate := waiting;
               end if;
	 when waiting =>
		preq := '1';
	        if(pop_ack(0) = '1') then
		    nstate := idle;
		    ackv := true;
		end if;
     end case;
 
     pop_req(0) <= preq;
     load_reg <= ackv;

     if(clk'event and clk = '1') then
	if(reset = '1') then
		fsm_state <= idle;
	else
		fsm_state <= nstate;
	end if;

	if(ackv) then
           output_register <= pipe_data_out;
        end if;

	unload_ack <= ackv;
     end if;
  end process;

  -- no bypass!
  read_data <= output_register;

end default_arch;
-- The unshared operator uses a split protocol.
--    reqL/ackL  for sampling the inputs
--    reqR/ackR  for updating the outputs.
-- The two pairs should be used independently,
-- that is, there should be NO DEPENDENCY between
-- ackL and reqR!
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
use ahir.FloatOperatorPackage.all;

entity UnsharedOperatorBase is
  generic
    (
      operator_id   : string;          -- operator id
      input1_is_int : Boolean := true; -- false means float
      input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      iwidth_1      : integer;    -- width of input1
      input2_is_int : Boolean := true; -- false means float
      input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      iwidth_2      : integer;    -- width of input2
      num_inputs    : integer := 2;    -- can be 1 or 2.
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      owidth        : integer;          -- width of output.
      constant_operand : std_logic_vector; -- constant operand.. (it is always the second operand)
      constant_width : integer;
      use_constant  : boolean := false
      );
  port (
    -- req -> ack follow pulse protocol
    reqL:  in Boolean;
    ackL : out Boolean;
    reqR : in Boolean;
    ackR:  out Boolean;
    -- operands.
    dataL      : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
    dataR      : out std_logic_vector(owidth-1 downto 0);
    clk, reset : in  std_logic);
end UnsharedOperatorBase;


architecture Vanilla of UnsharedOperatorBase is
  signal   result: std_logic_vector(owidth-1 downto 0);
  constant iwidth : integer := iwidth_1  + iwidth_2;
  
  -- joined req, and joint ack.
  signal fReq,fAck: boolean;
 

begin  -- Behave


  assert((num_inputs = 1) or (num_inputs = 2)) report "either 1 or 2 inputs" severity failure;

  -----------------------------------------------------------------------------
  -- join the two reqs..
  -----------------------------------------------------------------------------
  rJ: join2 generic map (name => operator_id & ":join2:", bypass => true)
		port map(pred0 => reqL, pred1 => reqR, symbol_out => fReq, clk => clk, reset => reset);

  
  dE: control_delay_element generic map(delay_value  => 1)
		port map(req => fReq, ack => fAck, clk => clk, reset => reset);
  
  -- same ack to both.
  ackL <= fAck;
  ackR <= fAck;

  -----------------------------------------------------------------------------
  -- combinational block..
  -----------------------------------------------------------------------------
  comb_block: GenericCombinationalOperator
    generic map (
      operator_id                 => operator_id,
      input1_is_int               => input1_is_int,
      input1_characteristic_width => input1_characteristic_width,
      input1_mantissa_width       => input1_mantissa_width,
      iwidth_1                    => iwidth_1,
      input2_is_int               => input2_is_int,
      input2_characteristic_width => input2_characteristic_width,
      input2_mantissa_width       => input2_mantissa_width,
      iwidth_2                    => iwidth_2,
      num_inputs                  => num_inputs,
      output_is_int               => output_is_int,
      output_characteristic_width => output_characteristic_width,
      output_mantissa_width       => output_mantissa_width,
      owidth                      => owidth,
      constant_operand            => constant_operand,
      constant_width              => constant_width,
      use_constant                => use_constant)
    port map (data_in => dataL, result  => result);


  -----------------------------------------------------------------------------
  -- sample the output
  -----------------------------------------------------------------------------
  process(clk,reset)
  begin
    if(clk'event and clk = '1') then
      if(fReq) then
        dataR <= result;
      end if;
    end if;
  end process;
    
end Vanilla;

-------------------------------------------------------------------------------
-- Authors: Abhishek R. Kamath & Prashant Singhal
-- An IEEE-754 compliant Double-Precision pipelined multiplier
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity DoublePrecisionMultiplier is
  generic (tag_width : integer);
  port(
    INA, INB: in std_logic_vector(63 downto 0);   
    OUTM: out std_logic_vector(63 downto 0);
    clk,reset: in std_logic;
    tag_in: in std_logic_vector(tag_width-1 downto 0);
    tag_out: out std_logic_vector(tag_width-1 downto 0);
    NaN, oflow, uflow: out std_logic := '0';
    env_rdy, accept_rdy: in std_logic;
    muli_rdy, mulo_rdy: out std_logic);
end entity;

architecture rtl of DoublePrecisionMultiplier is

  type parpro is array (0 to 52) of std_logic_vector(52 downto 0);

  signal rdy1,rdy2,rdy3,rdy4,rdy5,rdy6,rdy7,rdy8,rdy9,rdy10,rdy11,rdy12: std_logic := '0';
  signal flag3,flag4,flag5,flag6,flag7,flag8,flag9,flag10,flag11: std_logic_vector(1 downto 0);
  signal fman11: std_logic_vector(51 downto 0);
  signal tag1,tag2,tag3,tag4,tag5,tag6,tag7,tag8,tag9,tag10,tag11: std_logic_vector(tag_width-1 downto 0);
  signal pipeline_stall: std_logic := '0';

  signal aman_1,aman_2,bman_1,bman_2: std_logic_vector(52 downto 0);
  signal anan1,bnan1,azero1,bzero1,ainf1,binf1,osgn1: std_logic := '0'; 
  signal aexp_s1,bexp_s1: std_logic_vector(10 downto 0);

  signal nocalc2,nocalc3,nocalc4,nocalc5,nocalc6,nocalc7,nocalc8,nocalc9,nocalc10,nocalc11: std_logic;-- := '0';
  signal output_s2,output_s23,output_s24,output_s25,output_s26,output_s27,output_s28,output_s29,output_s210,output_s211: std_logic_vector(2 downto 0);
  signal int_exp: std_logic_vector(11 downto 0);

  signal fexp3,fexp4,fexp5,fexp6,fexp7,fexp8,fexp9,fexp10,fexp11: std_logic_vector(10 downto 0);-- := X"00";

  signal pp: parpro;
  signal tr_400,tr_401,tr_402,tr_403,tr_404,tr_405,tr_406,tr_407,tr_408,tr_409,tr_410,tr_411,tr_412: std_logic_vector(105 downto 0);
  signal tr_413,tr_414,tr_415,tr_416,tr_417,tr_418,tr_419,tr_420,tr_421,tr_422,tr_423,tr_424,tr_425,tr_426: std_logic_vector(105 downto 0);

  signal tr501,tr502,tr503,tr504,tr505,tr506,tr507,tr508,tr509,tr510,tr511,tr512,tr513,tr514: std_logic_vector(105 downto 0);
  signal tr61,tr62,tr63,tr64,tr65,tr66,tr67: std_logic_vector(105 downto 0);
  signal tr71,tr72,tr73,tr74,tr71_int1,tr72_int1,tr71_int2: std_logic_vector(105 downto 0);


  signal tr401,tr402,tr403,tr404,tr405,tr406,tr407,tr408,tr409,tr410,tr411,tr412: std_logic_vector(105 downto 0);-- := X"000000000000";
  signal tr413,tr414,tr415,tr416,tr417,tr418,tr419,tr420,tr421,tr422,tr423,tr424: std_logic_vector(105 downto 0);-- := X"000000000000";
  signal tr425,tr426,tr427,tr428,tr429,tr430,tr431,tr432,tr433,tr434,tr435,tr436: std_logic_vector(105 downto 0);-- := X"000000000000";
  signal tr437,tr438,tr439,tr440,tr441,tr442,tr443,tr444,tr445,tr446,tr447,tr448: std_logic_vector(105 downto 0);-- := X"000000000000";
  signal tr449,tr450,tr451,tr452,tr453: std_logic_vector(105 downto 0);-- := X"000000000000";

begin

  stage_1: process(clk,reset)

    variable asgn,bsgn,osgn: std_logic := '0';
    variable aexp,bexp: std_logic_vector(10 downto 0);-- := "000" & X"00";
    variable aman,bman: std_logic_vector(52 downto 0);-- := "000000000000000000000000";
    variable anan,bnan,azero,bzero,ainf,binf: std_logic;-- := '0';

  begin
    if reset = '1' then
      rdy1 <= '0';
    else
      if clk'event and clk='1'then
        if env_rdy = '1' and pipeline_stall = '0' then
          --asgn1 <= INA(63);
          --bsgn1 <= INB(63);
          --aexp1 <= INA(62 downto 52);
          --bexp1 <= INB(62 downto 52);
          --aman1 <= '1' & INA(51 downto 0);
          --bman1 <= '1' & INB(51 downto 0);
          --rdy1 <= '1';
          

          --asgn := INA(63);
          --bsgn := INB(63);
          --osgn := INA(63) xor INB(63);

          
          aexp := INA(62 downto 52);
          bexp := INB(62 downto 52);
          aman := '1' & INA(51 downto 0);
          bman := '1' & INB(51 downto 0);
          
          
          
          if(aexp="111" & X"FF") then
            if(unsigned(aman)=0) then
              ainf := '1';
              anan := '0';
              azero := '0';
            else
              anan := '1';
              azero := '0';
              ainf := '0';
            end if;
          elsif(aexp="000"&X"00") then
            if unsigned(aman)=0 then
              azero := '1';
              ainf := '0';
              anan := '0';
            end if;
          else
            ainf := '0';
            anan := '0';
            azero := '0';
          end if;
          
          if(bexp="111"& X"FF") then
            if(unsigned(bman)=0) then
              binf := '1';
              bnan := '0';
              bzero := '0';
            else
              bnan := '1';
              bzero := '0';
              binf := '0';
            end if;
          elsif(bexp="000" & X"00") then
            if unsigned(bman)=0 then
              bzero := '1';
              binf := '0';
              bnan := '0';
            end if;
          else
            binf := '0';
            bnan := '0';
            bzero := '0';
          end if;

          osgn1 <= INA(63) xor INB(63);
          
          ainf1 <= ainf;
          binf1 <= binf;
          anan1 <= anan;
          bnan1 <= bnan;
          azero1 <= azero;
          bzero1 <= bzero;
          
          aexp_s1 <= aexp;
          bexp_s1 <= bexp;
          aman_1 <= aman;
          bman_1 <= bman;


          rdy1 <= '1';
          tag1 <= tag_in;
          
        elsif pipeline_stall = '1' then
        elsif env_rdy = '0' then
          rdy1 <= '0';
        end if;
      end if;
    end if;
  end process stage_1;





  stage_2: process(clk,reset)
  begin
    if reset = '1' then
      rdy2 <= '0';
    else
      if clk'event and clk='1'then
        if rdy1 = '1' and pipeline_stall = '0' then
          if (anan1 = '1' or bnan1 = '1') then
            output_s2 <= osgn1 & "10";
            nocalc2 <= '1';
          elsif (azero1 = '1' and binf1 = '1') or (ainf1 = '1' and bzero1 = '1') then
            output_s2 <= osgn1 & "10";
            nocalc2 <= '1';
          elsif azero1 = '1' or bzero1 = '1' then
            output_s2 <= osgn1 & "00";
            nocalc2 <= '1';
          elsif ainf1 = '1' or binf1 = '1' then
            output_s2 <= osgn1 & "11";
            nocalc2 <= '1';
          else
            int_exp <= std_logic_vector(unsigned('0' & aexp_s1) + unsigned('0' & bexp_s1));
            output_s2 <= osgn1 & "01";
            nocalc2 <= '0';
          end if;
          --aexp_s3 <= aexp_s2;
          --bexp_s3 <= bexp_s2;
          aman_2 <= aman_1;
          bman_2 <= bman_1;
          rdy2 <= '1';
          tag2 <= tag1;
          
          
        elsif pipeline_stall = '1' then
        elsif rdy1 = '0' then
          rdy2 <= '0';
        end if;
      end if;
    end if;
  end process stage_2;




  stage_3: process(clk,reset)

    variable exp3: unsigned(11 downto 0);

  begin
    if reset = '1' then
      rdy3 <= '0';
    else
      if clk'event and clk='1'then
        if rdy2 = '1' and pipeline_stall = '0' then
          if nocalc2 = '1' then
            nocalc3 <= '1';
            output_s23 <= output_s2;
            flag3 <= "00";
          elsif nocalc2 = '0' then
            exp3 := unsigned(int_exp);
            if(exp3 > 3069) then
              output_s23 <= output_s2(2) & "11";
              nocalc3 <= '1';
              flag3 <= "10";
            elsif(exp3 < 1023) then
              output_s23 <= output_s2(2) & "00";
              nocalc3 <= '1';
              flag3 <= "01";
            else
              exp3 := exp3 - 1023;
              output_s23 <= output_s2(2) & "01";
              nocalc3 <= '0';
              flag3 <= "00";
            end if;	
          end if;
          --aman_3 <= aman_2;
          --bman_3 <= bman_2;
          fexp3 <= std_logic_vector(exp3(10 downto 0));
          rdy3 <= '1';
          tag3 <= tag2;

          for i in 0 to 52 loop
            for j in 0 to 52 loop
              pp(i)(j) <= aman_2(j) and bman_2(i);
            end loop;
          end loop;

        elsif pipeline_stall = '1' then
        elsif rdy2 = '0' then
          rdy3 <= '0';
        end if;
      end if;
    end if;
  end process stage_3;





  stage_4: process(clk,reset)
  begin
    if reset = '1' then
      rdy4 <= '0';
    else
      if clk'event and clk='1'then
        if rdy3 = '1' and pipeline_stall = '0' then
          if nocalc3 = '1' then
            nocalc4 <= '1';
          elsif nocalc3 = '0' then
            
            tr401 <= X"0000000000000" & '0' & pp(0);
            tr402 <= X"0000000000000" & pp(1) & '0';
            tr403 <= X"000000000000" & "000" & pp(2) & "00";
            tr404 <= X"000000000000" & "00" & pp(3) & "000";	

            tr405 <= X"000000000000" & '0' & pp(4) & X"0";
            tr406 <= X"000000000000" & pp(5) & X"0" & '0';
            tr407 <= X"00000000000" & "000" & pp(6) & X"0" & "00";
            tr408 <= X"00000000000" & "00" & pp(7) & X"0" & "000";

            tr409 <= X"00000000000" & '0' & pp(8) & X"00";
            tr410 <= X"00000000000" & pp(9) & X"00" & '0';
            tr411 <= X"0000000000" & "000" & pp(10) & X"00" & "00";
            tr412 <= X"0000000000" & "00" & pp(11) & X"00" & "000";

            tr413 <= X"0000000000" & '0' & pp(12) & X"000";
            tr414 <= X"0000000000" & pp(13) & X"000" & '0';
            tr415 <= X"000000000" & "000" & pp(14) & X"000" & "00";
            tr416 <= X"000000000" & "00" & pp(15) & X"000" & "000";

            tr417 <= X"000000000" & '0' & pp(16) & X"0000";
            tr418 <= X"000000000" & pp(17) & X"0000" & '0';
            tr419 <= X"00000000" & "000" & pp(18) & X"0000" & "00";
            tr420 <= X"00000000" & "00" & pp(19) & X"0000" & "000";

            tr421 <= X"00000000" & '0' & pp(20) & X"00000";
            tr422 <= X"00000000" & pp(21) & X"00000" & '0';
            tr423 <= X"0000000" & "000" & pp(22) & X"00000" & "00";
            tr424 <= X"0000000" & "00" & pp(23) & X"00000" & "000";

            tr425 <= X"0000000" & '0' & pp(24) & X"000000";
            tr426 <= X"0000000" & pp(25) & X"000000" & '0';
            tr427 <= X"000000" & "000" & pp(26) & X"000000" & "00";
            tr428 <= X"000000" & "00" & pp(27) & X"000000" & "000";

            tr429 <= X"000000" & '0' & pp(28) & X"0000000";
            tr430 <= X"000000" & pp(29) & X"0000000" & '0';
            tr431 <= X"00000" & "000" & pp(30) & X"0000000" & "00";
            tr432 <= X"00000" & "00" & pp(31) & X"0000000" & "000";

            tr433 <= X"00000" & '0' & pp(32) & X"00000000";
            tr434 <= X"00000" & pp(33) & X"00000000" & '0';
            tr435 <= X"0000" & "000" & pp(34) & X"00000000" & "00";
            tr436 <= X"0000" & "00" & pp(35) & X"00000000" & "000";

            tr437 <= X"0000" & '0' & pp(36) & X"000000000";
            tr438 <= X"0000" & pp(37) & X"000000000" & '0';
            tr439 <= X"000" & "000" & pp(38) & X"000000000" & "00";
            tr440 <= X"000" & "00" & pp(39) & X"000000000" & "000";

            tr441 <= X"000" & '0' & pp(40) & X"0000000000";
            tr442 <= X"000" & pp(41) & X"0000000000" & '0';
            tr443 <= X"00" & "000" & pp(42) & X"0000000000" & "00";
            tr444 <= X"00" & "00" & pp(43) & X"0000000000" & "000";

            tr445 <= X"00" & '0' & pp(44) & X"00000000000";
            tr446 <= X"00" & pp(45) & X"00000000000" & '0';
            tr447 <= X"0" & "000" & pp(46) & X"00000000000" & "00";
            tr448 <= X"0" & "00" & pp(47) & X"00000000000" & "000";

            tr449 <= X"0" & '0' & pp(48) & X"000000000000";
            tr450 <= X"0" & pp(49) & X"000000000000" & '0';
            tr451 <= "000" & pp(50) & X"000000000000" & "00";
            tr452 <= "00" & pp(51) & X"000000000000" & "000";

            tr453 <= '0' & pp(52) & X"0000000000000";

            nocalc4 <= '0';
            
          end if;

          
          output_s24 <= output_s23;
          fexp4 <= fexp3;
          flag4 <= flag3;
          rdy4 <= '1';
          tag4 <= tag3;
          
        elsif pipeline_stall = '1' then
        elsif rdy3 = '0' then
          rdy4 <= '0';
        end if;
      end if;
    end if;
  end process stage_4;


  stage_5: process(clk,reset)
  begin
    if reset = '1' then
      rdy5 <= '0';
    else
      if clk'event and clk='1'then
        if rdy4 = '1' and pipeline_stall = '0' then
          if nocalc4 = '1' then
            nocalc5 <= '1';
          elsif nocalc4 = '0' then
            
            tr_400 <= std_logic_vector(unsigned(tr401) + unsigned(tr402));
            tr_401 <= std_logic_vector(unsigned(tr403) + unsigned(tr404));
            tr_402 <= std_logic_vector(unsigned(tr405) + unsigned(tr406));
            tr_403 <= std_logic_vector(unsigned(tr407) + unsigned(tr408));
            tr_404 <= std_logic_vector(unsigned(tr409) + unsigned(tr410));
            tr_405 <= std_logic_vector(unsigned(tr411) + unsigned(tr412));
            tr_406 <= std_logic_vector(unsigned(tr413) + unsigned(tr414));
            tr_407 <= std_logic_vector(unsigned(tr415) + unsigned(tr416));
            tr_408 <= std_logic_vector(unsigned(tr417) + unsigned(tr418));
            tr_409 <= std_logic_vector(unsigned(tr419) + unsigned(tr420));
            tr_410 <= std_logic_vector(unsigned(tr421) + unsigned(tr422));
            tr_411 <= std_logic_vector(unsigned(tr423) + unsigned(tr424));

            tr_412 <= std_logic_vector(unsigned(tr425) + unsigned(tr426));
            tr_413 <= std_logic_vector(unsigned(tr427) + unsigned(tr428));
            tr_414 <= std_logic_vector(unsigned(tr429) + unsigned(tr430));
            tr_415 <= std_logic_vector(unsigned(tr431) + unsigned(tr432));
            tr_416 <= std_logic_vector(unsigned(tr433) + unsigned(tr434));
            tr_417 <= std_logic_vector(unsigned(tr435) + unsigned(tr436));
            tr_418 <= std_logic_vector(unsigned(tr437) + unsigned(tr438));
            tr_419 <= std_logic_vector(unsigned(tr439) + unsigned(tr440));
            tr_420 <= std_logic_vector(unsigned(tr441) + unsigned(tr442));
            tr_421 <= std_logic_vector(unsigned(tr443) + unsigned(tr444));
            tr_422 <= std_logic_vector(unsigned(tr445) + unsigned(tr446));
            tr_423 <= std_logic_vector(unsigned(tr447) + unsigned(tr448));

            tr_424 <= std_logic_vector(unsigned(tr449) + unsigned(tr450));
            tr_425 <= std_logic_vector(unsigned(tr451) + unsigned(tr452));
            tr_426 <= tr453;

            nocalc5 <= '0';
            
          end if;

          
          output_s25 <= output_s24;
          fexp5 <= fexp4;
          flag5 <= flag4;
          rdy5 <= '1';
          tag5 <= tag4;
          
        elsif pipeline_stall = '1' then
        elsif rdy4 = '0' then
          rdy5 <= '0';
        end if;
      end if;
    end if;
  end process stage_5;



  stage_6: process(clk,reset)
  begin
    if reset = '1' then
      rdy6 <= '0';
    else
      if clk'event and clk='1'then
        if rdy5 = '1' and pipeline_stall = '0' then
          if nocalc5 = '1' then
            nocalc6 <= '1';
          else
            tr501 <= std_logic_vector(unsigned(tr_400) + unsigned(tr_401));
            tr502 <= std_logic_vector(unsigned(tr_402) + unsigned(tr_403));
            tr503 <= std_logic_vector(unsigned(tr_404) + unsigned(tr_405));
            tr504 <= std_logic_vector(unsigned(tr_406) + unsigned(tr_407));
            tr505 <= std_logic_vector(unsigned(tr_408) + unsigned(tr_409));
            tr506 <= std_logic_vector(unsigned(tr_410) + unsigned(tr_411));

            tr507 <= std_logic_vector(unsigned(tr_412) + unsigned(tr_413));
            tr508 <= std_logic_vector(unsigned(tr_414) + unsigned(tr_415));
            tr509 <= std_logic_vector(unsigned(tr_416) + unsigned(tr_417));
            tr510 <= std_logic_vector(unsigned(tr_418) + unsigned(tr_419));
            tr511 <= std_logic_vector(unsigned(tr_420) + unsigned(tr_421));
            tr512 <= std_logic_vector(unsigned(tr_422) + unsigned(tr_423));

            tr513 <= std_logic_vector(unsigned(tr_424) + unsigned(tr_425));
            tr514 <= tr_426;
            
            nocalc6 <= '0';
          end if;

          output_s26 <= output_s25;
          fexp6 <= fexp5;
          flag6 <= flag5;
          rdy6 <= '1';
          tag6 <= tag5;
          
        elsif pipeline_stall = '1' then
        elsif rdy5 = '0' then
          rdy6 <= '0';
        end if;
      end if;
    end if;
  end process stage_6;



  stage_7: process(clk,reset)
  begin
    if reset = '1' then
      rdy7 <= '0';
    else
      if clk'event and clk='1'then
        if rdy6 = '1' and pipeline_stall = '0' then
          if nocalc6 = '1' then
            nocalc7 <= '1';
          else
            tr61 <= std_logic_vector(unsigned(tr501) + unsigned(tr502));
            tr62 <= std_logic_vector(unsigned(tr503) + unsigned(tr504));
            tr63 <= std_logic_vector(unsigned(tr505) + unsigned(tr506));

            tr64 <= std_logic_vector(unsigned(tr507) + unsigned(tr508));
            tr65 <= std_logic_vector(unsigned(tr509) + unsigned(tr510));
            tr66 <= std_logic_vector(unsigned(tr511) + unsigned(tr512));

            tr67 <= std_logic_vector(unsigned(tr513) + unsigned(tr514));
            
            
            nocalc7 <= '0';
          end if;

          output_s27 <= output_s26;
          fexp7 <= fexp6;
          flag7 <= flag6;
          rdy7 <= '1';
          tag7 <= tag6;
          
        elsif pipeline_stall = '1' then
        elsif rdy6 = '0' then
          rdy7 <= '0';
        end if;
      end if;
    end if;
  end process stage_7;

  stage_8: process(clk,reset)
  begin
    if reset = '1' then
      rdy8 <= '0';
    else
      if clk'event and clk='1'then
        if rdy7 = '1' and pipeline_stall = '0' then
          if nocalc7 = '1' then
            nocalc8 <= '1';
          else
            tr71 <= std_logic_vector(unsigned(tr61) + unsigned(tr62));
            tr72 <= std_logic_vector(unsigned(tr63) + unsigned(tr64));
            tr73 <= std_logic_vector(unsigned(tr65) + unsigned(tr66));
            tr74 <= tr67;
            
            nocalc8 <= '0';
          end if;
          
          output_s28 <= output_s27;
          fexp8 <= fexp7;
          flag8 <= flag7;
          rdy8 <= '1';
          tag8 <= tag7;
          
        elsif pipeline_stall = '1' then
        elsif rdy7 = '0' then
          rdy8 <= '0';
        end if;
      end if;
    end if;
  end process stage_8;

  stage_9: process(clk,reset)
  begin
    if reset = '1' then
      rdy9 <= '0';
    else
      if clk'event and clk='1'then
        if rdy8 = '1' and pipeline_stall = '0' then
          if nocalc8 = '1' then
            nocalc9 <= '1';
          else
            tr71_int1 <= std_logic_vector(unsigned(tr71) + unsigned(tr72));
            tr72_int1 <= std_logic_vector(unsigned(tr73) + unsigned(tr74));
            nocalc9 <= '0';
          end if;
          
          output_s29 <= output_s28;
          fexp9 <= fexp8;
          flag9 <= flag8;
          rdy9 <= '1';
          tag9 <= tag8;
          
        elsif pipeline_stall = '1' then
        elsif rdy8 = '0' then
          rdy9 <= '0';
        end if;
      end if;
    end if;
  end process stage_9;


  stage_10: process(clk,reset)
  begin
    if reset = '1' then
      rdy10 <= '0';
    else
      if clk'event and clk='1'then
        if rdy9 = '1' and pipeline_stall = '0' then
          if nocalc9 = '1' then
            nocalc10 <= '1';
          else
            tr71_int2 <= std_logic_vector(unsigned(tr71_int1) + unsigned(tr72_int1));
            nocalc10 <= '0';
          end if;
          
          output_s210 <= output_s29;
          fexp10 <= fexp9;
          flag10 <= flag9;
          rdy10 <= '1';
          tag10 <= tag9;
          
        elsif pipeline_stall = '1' then
        elsif rdy9 = '0' then
          rdy10 <= '0';
        end if;
      end if;
    end if;
  end process stage_10;



  stage_11: process(clk,reset)
    variable man8: std_logic_vector(53 downto 0);
    variable exp8: unsigned(10 downto 0);
  begin
    if reset = '1' then
      rdy11 <= '0';
    else
      if clk'event and clk='1'then
        if rdy10 = '1' and pipeline_stall = '0' then
          if nocalc10 = '1' then
            nocalc11 <= '1';
            output_s211 <= output_s210;
            flag11 <= flag10;
          elsif nocalc10 = '0' then
            man8 := tr71_int2(105 downto 52);
            exp8 := unsigned(fexp10);
            if man8(53) = '1' then
              if	exp8 = 2046 then
                output_s211 <= output_s210(2) & "11";
                nocalc11 <= '1';
                flag11 <= "10";
              else
                exp8 := exp8 + 1;
                nocalc11 <= '0';
                fman11 <= man8(52 downto 1);
                output_s211 <= output_s210;
                flag11 <= flag10;
              end if;
            elsif exp8 = 0 then
              output_s211 <= output_s210(2) & "00";
              nocalc11 <= '1';
              flag11 <= "01";
            else
              fman11 <= man8(51 downto 0);
              output_s211 <= output_s210;
              nocalc11 <= '0';
              flag11 <= flag10;
            end if;
          end if;		
          rdy11 <= '1';
          tag11 <= tag10;
          fexp11 <= std_logic_vector(exp8);
        elsif pipeline_stall = '1' then
        elsif rdy10 = '0' then
          rdy11 <= '0';
        end if;
      end if;
    end if;
  end process stage_11;


  stage_12: process(clk,reset)
    variable temp: std_logic_vector(2 downto 0);
  begin
    if reset = '1' then
      rdy12 <= '0';
    else
      if clk'event and clk='1'then
        if rdy11 = '1' and pipeline_stall = '0' then
          rdy12 <= '1';
          temp := output_s211;
          if nocalc11 = '1' then
            case(temp(1 downto 0)) is
              when("00") => OUTM <= temp(2) & "000" & X"000000000000000"; NaN <= '0'; oflow <= '0'; uflow <= flag10(0);
            when("10") => OUTM <= temp(2) & "111" & X"FF" & "1000" & X"000000000000"; NaN <= '1'; oflow <= '0'; uflow <= '0';
            when("11") => OUTM <= temp(2) & "111" & X"FF" & X"0000000000000"; NaN <= '0'; oflow <= flag10(1); uflow <= '0';
            when others => null; 
          end case;
          else
            OUTM <= temp(2) & fexp11 & fman11; NaN <= '0'; oflow <='0'; uflow <= '0';
          end if;
          tag_out <= tag11;
        else
          rdy12 <= '0';
        end if;
      end if;
    end if;
  end process stage_12;

  pipeline_stall <= (rdy12 and (not accept_rdy));
  muli_rdy <= not (rdy12 and (not accept_rdy));  
  mulo_rdy <= rdy12;


end rtl;
-------------------------------------------------------------------------------
-- An IEEE-754 compliant arbitrary-precision pipelined adder/subtractor
-- which is basically, a 3-stage pipelined version of the add function
-- described in the ieee_proposed VHDL library float_pkg_c.vhd
-- originally written by David Bishop (dbishop@vhdl.org)
-- modified by Madhav Desai.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir_ieee_proposed;
use ahir_ieee_proposed.float_pkg.all;
use ahir_ieee_proposed.math_utility_pkg.all;

library ahir;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;


entity GenericFloatingPointAdderSubtractor is
  generic (tag_width : integer := 8;
           exponent_width: integer := 8;
           fraction_width : integer := 23;
           round_style : round_type := float_round_style;  -- rounding option
           addguard       : NATURAL := float_guard_bits;  -- number of guard bits
           check_error : BOOLEAN    := float_check_error;  -- check for errors
           denormalize : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP           
	   use_as_subtractor: BOOLEAN := false
           );
  port(
    INA, INB: in std_logic_vector((exponent_width+fraction_width) downto 0);
    OUTADD: out std_logic_vector((exponent_width+fraction_width) downto 0);
    clk,reset: in std_logic;
    tag_in: in std_logic_vector(tag_width-1 downto 0);
    tag_out: out std_logic_vector(tag_width-1 downto 0);
    env_rdy, accept_rdy: in std_logic;
    addi_rdy, addo_rdy: out std_logic);
end entity;


-- architecture trivial of GenericFloatingPointAdderSubtractor is
	-- 
	-- signal stage_full, stall: std_logic;
  	-- signal lp, rp   : UNRESOLVED_float(exponent_width downto -fraction_width);  -- floating point input
-- begin
  -- -- construct l,r (user registers)
  -- lp <= to_float(INA, exponent_width, fraction_width);
 -- 
  -- AsAdder: if (not use_as_subtractor) generate
  	-- rp <= to_float(INB, exponent_width, fraction_width);
  -- end generate AsAdder;
-- 
  -- AsSubtractor: if (use_as_subtractor) generate
        -- process(INB)
           -- variable btmp: UNRESOLVED_float(exponent_width downto -fraction_width);
        -- begin
	   -- btmp := to_float(INB, exponent_width, fraction_width);
  	   -- rp <= - btmp;
	-- end process;
  -- end generate AsSubtractor;
-- 
  -- stall <= stage_full and (not accept_rdy);
  -- addi_rdy <= not stall;
  -- addo_rdy <= stage_full;
-- 
  -- process(clk)
  -- begin
	-- if(clk'event and clk = '1') then
		-- if(reset = '1') then
			-- stage_full <= '0';
		-- elsif stall = '0' then
			-- stage_full <= env_rdy;
		-- end if;
-- 
		-- if(stall = '0') then
			-- OUTADD <= to_slv(lp + rp);
		-- end if;
	-- end if;
  -- end process;
-- 
-- 
-- end trivial;


-- this is the pipelined version. works, and when synthesized
-- by xst 10.1 is ok.  synthesis produces incorrect circuit with
-- xst 9.2i.
architecture rtl of GenericFloatingPointAdderSubtractor is
  signal  l, r, l_1, r_1, lp, rp   : UNRESOLVED_float(exponent_width downto -fraction_width);  -- floating point input
  
  signal pipeline_stall : std_logic;
  signal stage_full : std_logic_vector(0 to 7);
  signal tag0, tag1, tag2, tag3, tag4, tag5, tag6, tag7: std_logic_vector(tag_width-1 downto 0);

  signal fpresult_1         : UNRESOLVED_float (exponent_width downto -fraction_width);
  signal fractl_1, fractr_1   : UNSIGNED (fraction_width+1+addguard downto 0);  -- fractions
  signal exponr_1, exponl_1 : SIGNED (exponent_width-1 downto 0);  -- result exponent
  signal sign_1             : STD_ULOGIC;   -- sign of the output
  signal exceptional_result_1 : std_ulogic; 
  signal shift_too_low_1, shift_too_high_1, shift_eq_zero_1, shift_lt_zero_1, shift_gt_zero_1: boolean;
  signal shiftx_1           : SIGNED (exponent_width downto 0);  -- shift fractions

  signal use_shifter_2  : std_ulogic;
  signal shifter_in_2, shifter_out   : UNSIGNED (fraction_width+1+addguard downto 0);  -- fractions
  signal shift_amount_2 : SIGNED (exponent_width downto 0);  -- shift fractions
  
  signal fpresult_2         : UNRESOLVED_float (exponent_width downto -fraction_width);
  signal rexpon_2           : SIGNED (exponent_width downto 0);  -- result exponent
  signal fractc_2, fracts_2 : UNSIGNED (fraction_width+1+addguard downto 0);  -- constant and shifted variables
  signal leftright_2 : boolean;
  signal sticky_2_vector: std_logic_vector(0 to 4);
  signal sticky_2: std_logic;
  signal exceptional_result_2 : std_ulogic; 
  signal sign_l_2, sign_r_2: std_ulogic;




  signal shifter_tag_in, shifter_tag_out: 
		std_logic_vector(tag_width + fpresult_2'length + fractc_2'length + fracts_2'length
				+ rexpon_2'length + 7 - 1 downto 0);
  signal shifter_full: std_logic;

  signal fpresult_4         : UNRESOLVED_float (exponent_width downto -fraction_width);
  signal addL_4             : UNSIGNED (fraction_width+1+addguard downto 0);
  signal addR_4             : UNSIGNED (fraction_width+1+addguard downto 0);
  signal subtract_4         : std_logic;
  signal rexpon_4           : SIGNED (exponent_width downto 0);  -- result exponent
  signal sign_4             : STD_ULOGIC;   -- sign of the output
  signal sticky_4           : STD_ULOGIC;   -- Holds precision for rounding
  signal exceptional_result_4 : std_ulogic; 

  signal ufract_5           : UNSIGNED (fraction_width+1+addguard downto 0);
  signal fpresult_5         : UNRESOLVED_float (exponent_width downto -fraction_width);
  signal adder_tag_in, adder_tag_out :
		std_logic_vector(tag_width + fpresult_4'length + rexpon_4'length + 3 - 1 downto 0);

  signal normalizer_tag_in, normalizer_tag_out: std_logic_vector(tag_width + fpresult_4'length downto 0);

  signal fpresult_6         : UNRESOLVED_float (exponent_width downto -fraction_width);

  signal fpresult_7         : std_logic_vector((exponent_width+fraction_width) downto 0);
  
  type FracMaskArray is array (natural range <> ) of unsigned(fractl_1'length-1 downto 0);
  function BuildFracMasks(width: natural) return FracMaskArray is
	variable ret_var: FracMaskArray(width-1 downto 0);
  begin
	for I in 0 to width-1 loop
		ret_var(I) := (others => '0');
		for J in 0 to I loop
			ret_var(I)(J) := '1';
		end loop;
	end loop;
	return(ret_var);
  end function BuildFracMasks;

  constant frac_masks: FracMaskArray(fractl_1'high downto fractl_1'low) := BuildFracMasks(fractl_1'length);
  constant SH: integer := frac_masks'high;
  constant SL: integer := frac_masks'low;
  function SelectFracMask(constant masks: FracMaskArray; shiftx: integer) 
	return unsigned is
	variable ret_mask: unsigned(SH downto SL);
  begin
	ret_mask := (others => '1');
	if(shiftx <= SH) then
		ret_mask := masks(shiftx);
	elsif (shiftx < 0) then
		ret_mask := (others => '0');
	end if;
	return(ret_mask);
  end function SelectFracMask;
begin

  pipeline_stall <= stage_full(7) and (not accept_rdy);
  addi_rdy <= not pipeline_stall;
  addo_rdy <= stage_full(7);
  tag_out <= tag7;

  -- construct l,r (user registers)
  lp <= to_float(INA, exponent_width, fraction_width);
 
  AsAdder: if (not use_as_subtractor) generate
  	rp <= to_float(INB, exponent_width, fraction_width);
  end generate AsAdder;

  AsSubtractor: if (use_as_subtractor) generate
        process(INB)
           variable btmp: UNRESOLVED_float(exponent_width downto -fraction_width);
        begin
	   btmp := to_float(INB, exponent_width, fraction_width);
  	   rp <= - btmp;
	end process;
  end generate AsSubtractor;

  -- return slv.
  OUTADD <= fpresult_7;

  -----------------------------------------------------------------------------
  -- Stage 0: register inputs.
  -----------------------------------------------------------------------------
  process(clk)
    variable active_v : std_logic;
  begin
    active_v := env_rdy and not (pipeline_stall or reset);
    if(clk'event and clk = '1') then

      if(reset = '1') then
      	stage_full(0) <= '0';
      elsif (pipeline_stall = '0') then
        stage_full(0) <= env_rdy;
      end if;

      if(active_v = '1') then
        tag0 <= tag_in;
        l <= lp;
        r <= rp;
      end if;
    end if;
  end process;
  
  -----------------------------------------------------------------------------
  -- Stage 1: detect NaN, deNorm, align exponents.
  -----------------------------------------------------------------------------
  process(clk)
    variable active_v : std_logic;
    variable lfptype, rfptype : valid_fpstate;
    variable fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable fractl, fractr   : UNSIGNED (fraction_width+1+addguard downto 0);  -- fractions
    variable fractc, fracts   : UNSIGNED (fraction_width+1+addguard downto 0);  -- constant and shifted variables
    variable urfract, ulfract : UNSIGNED (fraction_width downto 0);
    variable ufract           : UNSIGNED (fraction_width+1+addguard downto 0);
    variable exponl, exponr   : SIGNED (exponent_width-1 downto 0);  -- exponents
    variable rexpon           : SIGNED (exponent_width downto 0);  -- result exponent
    variable shiftx           : SIGNED (exponent_width downto 0);  -- shift fractions
    variable sign             : STD_ULOGIC;   -- sign of the output
    variable leftright        : BOOLEAN;      -- left or right used
    variable lresize, rresize : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable exceptional_result: std_ulogic;

    variable shift_too_low : boolean;
    variable shift_lt_zero : boolean;
    variable shift_eq_zero : boolean;
    variable shift_too_high : boolean;
    variable shift_gt_zero : boolean;

    variable sticky           : std_logic_vector(0 to 4);   -- Holds precision for rounding
  begin

    exceptional_result := '0';
    sticky := (others => '0');
    leftright := false;
    fracts := (others => '0');
    fractc := (others => '0');
    rexpon := (others => '0');
    fpresult := (others => '0');
   
    fractr := (others => '0');
    fractl := (others => '0');

    shift_too_low := false;
    shift_lt_zero := false;
    shift_eq_zero := false;
    shift_too_high := false;
    shift_gt_zero := false;
  
    exponl := (others => '0');
    exponr := (others => '0');

    shiftx := (others => '0');

    ---------------------------------------------------------------------------
    -- will need to set appropriate flags here!
    ---------------------------------------------------------------------------
    if (fraction_width = 0 or l'length < 7 or r'length < 7) then
      lfptype := isx;
    else
      lfptype := classfp (l, check_error);
      rfptype := classfp (r, check_error);
    end if;
    if (lfptype = isx or rfptype = isx) then
      fpresult := (others => 'X');
      exceptional_result := '1';
    elsif (lfptype = nan or lfptype = quiet_nan or
           rfptype = nan or rfptype = quiet_nan)
      -- Return quiet NAN, IEEE754-1985-7.1,1
      or (lfptype = pos_inf and rfptype = neg_inf)
      or (lfptype = neg_inf and rfptype = pos_inf) then
      -- Return quiet NAN, IEEE754-1985-7.1,2
      exceptional_result := '1';
      fpresult := qnanfp (fraction_width => fraction_width,
                          exponent_width => exponent_width);
    elsif (lfptype = pos_inf or rfptype = pos_inf) then   -- x + inf = inf
      exceptional_result := '1';
      fpresult := pos_inffp (fraction_width => fraction_width,
                             exponent_width => exponent_width);
    elsif (lfptype = neg_inf or rfptype = neg_inf) then   -- x - inf = -inf
      exceptional_result := '1';
      fpresult := neg_inffp (fraction_width => fraction_width,
                             exponent_width => exponent_width);
    elsif (lfptype = neg_zero and rfptype = neg_zero) then   -- -0 + -0 = -0
      exceptional_result := '1';
      fpresult := neg_zerofp (fraction_width => fraction_width,
                             exponent_width => exponent_width);
    else 
      lresize := resize (arg            => to_x01(l),
                           exponent_width => exponent_width,
                           fraction_width => fraction_width,
                           denormalize_in => denormalize,
                           denormalize    => denormalize);
      lfptype := classfp (lresize, false);    -- errors already checked
      rresize := resize (arg            => to_x01(r),
                           exponent_width => exponent_width,
                           fraction_width => fraction_width,
                           denormalize_in => denormalize,
                           denormalize    => denormalize);
      rfptype := classfp (rresize, false);    -- errors already checked
      break_number (
          arg         => lresize,
          fptyp       => lfptype,
          denormalize => denormalize,
          fract       => ulfract,
          expon       => exponl);
      fractl := (others => '0');
      fractl (fraction_width+addguard downto addguard) := ulfract;
      break_number (
        arg         => rresize,
        fptyp       => rfptype,
        denormalize => denormalize,
        fract       => urfract,
        expon       => exponr);
      fractr := (others => '0');
      fractr (fraction_width+addguard downto addguard) := urfract;
  
      shiftx := (exponl(exponent_width-1) & exponl) - exponr;
  
      shift_too_low := (shiftx < -fractl'high);
      shift_lt_zero := (shiftx < 0);
      shift_eq_zero := (shiftx = 0);
      shift_too_high := (shiftx > fractl'high);
      shift_gt_zero := (shiftx > 0);
    end if;

    active_v := stage_full(0) and not (pipeline_stall or reset);
    if(clk'event and clk = '1') then

      if(reset = '1') then
	stage_full(1) <= '0';
      elsif (pipeline_stall = '0') then
	stage_full(1) <= stage_full(0);
      end if;

      if(active_v = '1') then
        tag1 <= tag0;
        fpresult_1 <= fpresult;
        fractr_1 <= fractr;
        fractl_1 <= fractl;
        exponr_1 <= exponr;
 	exponl_1 <= exponl;
        exceptional_result_1 <= exceptional_result;
        l_1 <= l;
        r_1 <= r;

	shift_too_low_1 <= shift_too_low;
	shift_lt_zero_1 <= shift_lt_zero;
	shift_eq_zero_1 <= shift_eq_zero;
	shift_too_high_1 <= shift_too_high;
	shift_gt_zero_1 <= shift_gt_zero;

        shiftx_1 <= shiftx;
      end if;        
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Stage 2: detect NaN, deNorm, align exponents.
  -----------------------------------------------------------------------------
  process(clk)
    variable active_v : std_logic;
    variable lfptype, rfptype : valid_fpstate;
    variable fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable fractl, fractr   : UNSIGNED (fraction_width+1+addguard downto 0);  -- fractions
    variable fractc, fracts   : UNSIGNED (fraction_width+1+addguard downto 0);  -- constant and shifted variables
    variable urfract, ulfract : UNSIGNED (fraction_width downto 0);
    variable ufract           : UNSIGNED (fraction_width+1+addguard downto 0);
    variable exponl, exponr   : SIGNED (exponent_width-1 downto 0);  -- exponents
    variable rexpon           : SIGNED (exponent_width downto 0);  -- result exponent
    variable shiftx           : SIGNED (exponent_width downto 0);  -- shift fractions
    variable leftright        : BOOLEAN;      -- left or right used
    variable lresize, rresize : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable exceptional_result: std_ulogic;

    -- to get stuff to the shifter.
    variable use_shifter  : std_ulogic;
    variable shifter_in   : UNSIGNED (fraction_width+1+addguard downto 0);  -- fractions
    variable shift_amount : SIGNED (exponent_width downto 0);  -- shift fractions

    variable shift_too_low : boolean;
    variable shift_lt_zero : boolean;
    variable shift_eq_zero : boolean;
    variable shift_too_high : boolean;
    variable shift_gt_zero : boolean;

    variable sticky           : std_logic_vector(0 to 4);   -- Holds precision for rounding
  begin
    fpresult := fpresult_1;

    fractr   := fractr_1;
    fractl   := fractl_1;

    rexpon   := (others => '0');


    exceptional_result := exceptional_result_1;

    shift_too_low := shift_too_low_1;
    shift_lt_zero := shift_lt_zero_1;
    shift_eq_zero := shift_eq_zero_1;
    shift_too_high := shift_too_high_1;
    shift_gt_zero := shift_gt_zero_1;
     
    shiftx := shiftx_1;

    exponr   := exponr_1;
    exponl   := exponl_1;
    fractc := (others => '0');
    fracts := (others => '0');
    leftright := false;
    sticky := (others => '0');
    use_shifter := '0';

    shifter_in := (others  => '0');
    shift_amount :=  (others => '0');

    if shift_too_low then
        rexpon    := exponr(exponent_width-1) & exponr;
        fractc    := fractr;
        fracts    := (others => '0');   -- add zero
        leftright := false;
        sticky(0)    := or_reduce (fractl);
    elsif shift_lt_zero then
        shiftx    := - shiftx;

        shift_amount := shiftx;
        use_shifter := '1';
        shifter_in := fractl;

        -- fracts    := shift_right (fractl, to_integer(shiftx));
        fractc    := fractr;
        rexpon    := exponr(exponent_width-1) & exponr;
        leftright := false;
        --sticky(1)    := smallfract (fractl, to_integer(shiftx));
        sticky(1)    := OrReduce(fractl and SelectFracMask(frac_masks,to_integer(shiftx)));
    elsif shift_eq_zero then
        rexpon := exponl(exponent_width-1) & exponl;
        sticky(2) := '0';
        if fractr > fractl then
          fractc    := fractr;
          fracts    := fractl;
          leftright := false;
        else
          fractc    := fractl;
          fracts    := fractr;
          leftright := true;
        end if;
    elsif shift_too_high then
        rexpon    := exponl(exponent_width-1) & exponl;
        fracts    := (others => '0');   -- add zero
        fractc    := fractl;
        leftright := true;
        sticky(3)    := or_reduce (fractr);
    elsif shift_gt_zero then

        shift_amount := shiftx;
        use_shifter := '1';
        shifter_in := fractr;

        -- fracts    := shift_right (fractr, to_integer(shiftx));
        fractc    := fractl;
        rexpon    := exponl(exponent_width-1) & exponl;
        leftright := true;
        -- sticky(4) := smallfract (fractr, to_integer(shiftx));
        sticky(1)    := OrReduce(fractr and SelectFracMask(frac_masks,to_integer(shiftx)));
    end if;
    
    active_v := stage_full(1) and not (pipeline_stall or reset);

    if(clk'event and clk = '1') then

      if(reset = '1') then
	stage_full(2) <= '0';
      elsif (pipeline_stall = '0') then
	stage_full(2) <= stage_full(1);
      end if;

      if(active_v = '1') then
        tag2 <= tag1;

        fpresult_2 <= fpresult;
        fractc_2 <= fractc;
        fracts_2 <= fracts;
        rexpon_2 <= rexpon;
        leftright_2 <= leftright;
        sticky_2_vector <= sticky;
        exceptional_result_2 <= exceptional_result;
	use_shifter_2 <= use_shifter;
        sign_l_2 <= l_1(l'high);
        sign_r_2 <= r_1(r'high);


	shift_amount_2 <= shift_amount;
	shifter_in_2 <= shifter_in;

        
      end if;        
    end if;
  end process;

  sticky_2 <= OrReduce(sticky_2_vector);

  -----------------------------------------------------------------------------
  -- stage 3: shifter.
  -----------------------------------------------------------------------------
  process(tag2, fpresult_2, fractc_2, fracts_2,rexpon_2, leftright_2,
		exceptional_result_2, use_shifter_2, sign_l_2, sign_r_2, sticky_2)
  begin
        -- concatenate the tag as well!
  	shifter_tag_in(shifter_tag_in'high downto 7) <= 
		tag2 & 
		std_logic_vector(fpresult_2) & std_logic_vector(fractc_2) &
			std_logic_vector(fracts_2) & std_logic_vector(rexpon_2);
	shifter_tag_in(6) <= '0'; -- unused.
	if(leftright_2) then
		shifter_tag_in(5) <= '1';
	else
		shifter_tag_in(5) <= '0';
	end if;
	shifter_tag_in(4) <= sticky_2;
	shifter_tag_in(3) <= exceptional_result_2;
	shifter_tag_in(2) <= sign_l_2;
	shifter_tag_in(1) <= sign_r_2;
	shifter_tag_in(0) <= use_shifter_2;
 end process;

  shifter: UnsignedShifter generic map(shift_right_flag => true,
					tag_width => shifter_tag_in'length,
					operand_width => shifter_in_2'length,
					shift_amount_width => shift_amount_2'length)
		port map( L => shifter_in_2, R => unsigned(shift_amount_2),
				RESULT => shifter_out,
				clk => clk, reset => reset,
				in_rdy => stage_full(2),
				out_rdy => stage_full(3),
				stall => pipeline_stall,
				tag_in => shifter_tag_in,
				tag_out => shifter_tag_out);


  -----------------------------------------------------------------------------
  -- Stage 4: prepare date for mantissa adder
  -----------------------------------------------------------------------------
  process(clk)
    variable active_v : std_logic;
    variable lfptype, rfptype : valid_fpstate;
    variable fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable fractl, fractr   : UNSIGNED (fraction_width+1+addguard downto 0);  -- fractions
    variable fractc, fracts   : UNSIGNED (fraction_width+1+addguard downto 0);  -- constant and shifted variables
    variable urfract, ulfract : UNSIGNED (fraction_width downto 0);
    variable rexpon           : SIGNED (exponent_width downto 0);  -- result exponent
    variable shiftx           : SIGNED (exponent_width downto 0);  -- shift fractions
    variable sign,sign_l,sign_r          : STD_ULOGIC;   -- sign of the output
    variable leftright        : BOOLEAN;      -- left or right used
    variable sticky           : STD_ULOGIC;   -- Holds precision for rounding
    variable exceptional_result           : STD_ULOGIC;   -- set if exceptional.. Nan/-Zero/Inf
    variable tagv: std_logic_vector(tag_width-1 downto 0);
    variable use_shifter: std_logic;

    variable addL, addR : UNSIGNED (fraction_width+1+addguard downto 0); 
    variable subtract_v : std_logic;
    
  begin

    subtract_v := '0';
    addL := (others => '0');
    addR := (others => '0');

    tagv := shifter_tag_out(shifter_tag_out'high downto (shifter_tag_out'high - (tag_width-1)));
    fpresult := to_float(shifter_tag_out(shifter_tag_out'high - tag_width downto 
					(shifter_tag_out'high-(tag_width + fpresult'length - 1))),
					exponent_width, fraction_width);

    fractc := unsigned(shifter_tag_out((shifter_tag_out'high- (tag_width + fpresult'length)) downto 
					(shifter_tag_out'high-
						(tag_width + fpresult'length+fractc'length - 1))));
    fracts :=  unsigned(shifter_tag_out((shifter_tag_out'high-
					(tag_width + fpresult'length+fractc'length)) downto 
					(shifter_tag_out'high-
						(tag_width + fpresult'length+(2*fractc'length) - 1))));
    rexpon :=   signed(shifter_tag_out((shifter_tag_out'high-
					(tag_width + fpresult'length+(2*fractc'length))) downto 
					(shifter_tag_out'high-
					(tag_width + fpresult'length+(2*fractc'length)+rexpon'length-1))));

    sign := '0';

    if(shifter_tag_out(5)= '1') then
	leftright := true;
    else
	leftright := false;
    end if;
    sticky := shifter_tag_out(4);
    exceptional_result := shifter_tag_out(3);
    sign_l := shifter_tag_out(2);
    sign_r := shifter_tag_out(1);
    use_shifter := shifter_tag_out(0);

    if(use_shifter = '1') then
       fracts := shifter_out;
    end if;

      -- add
    fracts (0) := fracts (0) or sticky;     -- Or the sticky bit into the LSB

    -- inputs to the adder
    addL := fractc;
    addR := fracts;
    if sign_l = sign_r then
      -- ufract := fractc + fracts;
      sign   := sign_l;
    else                              -- signs are different
      subtract_v := '1';
      -- ufract := fractc - fracts;      -- always positive result
      if leftright then               -- Figure out which sign to use
        sign := sign_l;
      else
        sign := sign_r;
      end if;
    end if;
   

    active_v := stage_full(3) and not (pipeline_stall or reset);
    if(clk'event and clk = '1') then

      if(reset = '1') then
	stage_full(4) <= '0';
      elsif (pipeline_stall = '0') then
	stage_full(4) <= stage_full(3);
      end if;

      if(active_v = '1') then
        tag4 <= tagv;
        fpresult_4 <= fpresult;
        rexpon_4 <= rexpon;
        sign_4 <= sign;
        sticky_4 <= sticky;
        exceptional_result_4 <= exceptional_result;
        addL_4 <= addL;
	addR_4 <= addR;
	subtract_4 <= subtract_v;
      end if;      
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Stage 5: mantissa adder.
  -----------------------------------------------------------------------------
  process(tag4, fpresult_4, rexpon_4, sign_4, sticky_4, exceptional_result_4)
  begin
	adder_tag_in(adder_tag_in'high downto 3)
		<= tag4 & std_logic_vector(fpresult_4) & std_logic_vector(rexpon_4);
	adder_tag_in(2) <= sign_4;
	adder_tag_in(1) <= sticky_4;
	adder_tag_in(0) <= exceptional_result_4;
  end process;

  adder: UnsignedAdderSubtractor
		generic map(tag_width => adder_tag_in'length,
				operand_width => addL_4'length,
				chunk_width => 8)
		port map( L => addL_4, R => addR_4, RESULT => ufract_5,
				subtract_op => subtract_4,
				clk => clk, reset => reset,
				in_rdy => stage_full(4),
				out_rdy => stage_full(5),
				stall => pipeline_stall,
				tag_in => adder_tag_in,
				tag_out => adder_tag_out);
				

  -----------------------------------------------------------------------------
  -- Stage 6: normalize.
  -----------------------------------------------------------------------------
  normalizer: block
    signal tagv: std_logic_vector(tag_width-1 downto 0);
    signal fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    signal rexpon           : SIGNED (exponent_width downto 0);  -- result exponent
    signal rexpon_padded    : SIGNED (exponent_width+1 downto 0);  -- result exponent
    signal sign             : STD_ULOGIC;   -- sign of the output
    signal sticky           : STD_ULOGIC;   -- Holds precision for rounding
    signal exceptional_result           : STD_ULOGIC;   -- set if exceptional.. Nan/-Zero/Inf
    signal ufract           : UNSIGNED (fraction_width+1+addguard downto 0);
  begin
    tagv <= adder_tag_out(adder_tag_out'high downto (adder_tag_out'high - (tagv'length-1)));
    fpresult <= to_float(adder_tag_out((adder_tag_out'high - tagv'length) downto 
				(adder_tag_out'high - (tagv'length+fpresult'length-1))),
			exponent_width, fraction_width);
    rexpon <= signed(adder_tag_out((adder_tag_out'high - (tagv'length+fpresult'length)) downto 
				(adder_tag_out'high - (tagv'length+fpresult'length+rexpon'length-1))));
    rexpon_padded <= resize(rexpon,exponent_width+2);
    ufract <= ufract_5;

    -- zero fraction => sign = '0'
    sign <= '0' when or_reduce(ufract) = '0' else adder_tag_out(2);

    sticky <= adder_tag_out(1);
    exceptional_result <= adder_tag_out(0);

    
    normalizer_tag_in(normalizer_tag_in'high downto 1) <= tagv & std_logic_vector(fpresult);
    normalizer_tag_in(0) <= exceptional_result;

    normalizer: GenericFloatingPointNormalizer
		generic map (tag_width => normalizer_tag_in'length,
				exponent_width => exponent_width,
				fraction_width => fraction_width,
				round_style => float_round_style,
				nguard => addguard,
				denormalize => denormalize)
		port map(fract => ufract,
			 expon => rexpon_padded,
			 sign => sign,
			 sticky => sticky,
			 in_rdy  => stage_full(5),
			 out_rdy => stage_full(6),
			 stall => pipeline_stall,
			 clk => clk,
			 reset => reset,
			 tag_in => normalizer_tag_in,
			 tag_out => normalizer_tag_out,
			 normalized_result => fpresult_6);
  end block;

  -----------------------------------------------------------------------------
  -- Stage 7: multiplexor.
  -----------------------------------------------------------------------------
  process(clk)
    variable active_v : std_logic;
    variable fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable fpresult_normalized         : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable exceptional_result           : STD_ULOGIC;   -- set if exceptional.. Nan/-Zero/Inf
    variable tagv: std_logic_vector(tag_width-1 downto 0);
  begin

    tagv := normalizer_tag_out(normalizer_tag_out'high downto (normalizer_tag_out'high - (tagv'length-1)));
    fpresult := to_float(normalizer_tag_out((normalizer_tag_out'high - tagv'length) downto 
				(normalizer_tag_out'high - (tagv'length+fpresult'length-1))),
			exponent_width, fraction_width);
    exceptional_result := normalizer_tag_out(0);

    active_v := stage_full(6) and not (pipeline_stall or reset);
    if(clk'event and clk = '1') then

      if(reset = '1') then
	stage_full(7) <= '0';
      elsif (pipeline_stall = '0') then
	stage_full(7) <= stage_full(6);
      end if;

      if(active_v = '1') then
        tag7 <= tagv;
    	if(exceptional_result = '1') then 
        	fpresult_7 <= to_slv(fpresult);
	else
        	fpresult_7 <= to_slv(fpresult_6);
	end if;
      end if;
    end if;
  end process;
  
end rtl;


-------------------------------------------------------------------------------
-- An IEEE-754 compliant arbitrary-precision pipelined multiplier
-- which is basically, a pipelined version of the multiply function
-- described in the ahir_ieee_proposed VHDL library float_pkg_c.vhd
-- originally written by David Bishop (dbishop@vhdl.org)
-- modified by Madhav Desai.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir_ieee_proposed;
use ahir_ieee_proposed.float_pkg.all;
use ahir_ieee_proposed.math_utility_pkg.all;

library ahir;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;


entity GenericFloatingPointMultiplier is
  generic (tag_width : integer := 8;
           exponent_width: integer := 11;
           fraction_width : integer := 52;
           round_style : round_type := float_round_style;  -- rounding option
           addguard       : NATURAL := float_guard_bits;  -- number of guard bits
           check_error : BOOLEAN    := float_check_error;  -- check for errors
           denormalize : BOOLEAN    := float_denormalize  -- Use IEEE extended FP           
           );
  port(
    INA, INB: in std_logic_vector((exponent_width+fraction_width) downto 0);
    OUTMUL: out std_logic_vector((exponent_width+fraction_width) downto 0);
    clk,reset: in std_logic;
    tag_in: in std_logic_vector(tag_width-1 downto 0);
    tag_out: out std_logic_vector(tag_width-1 downto 0);
    env_rdy, accept_rdy: in std_logic;
    muli_rdy, mulo_rdy: out std_logic);
end entity;

-- works, also when synthesized by xst 10.1.  xst 9.2is seems
-- to produce incorrect circuits.
architecture rtl of GenericFloatingPointMultiplier is

  constant operand_width : integer := exponent_width+fraction_width+1;

  signal lp, rp             : UNRESOLVED_float(exponent_width downto -fraction_width);  -- floating point input  
  signal pipeline_stall : std_logic;
  signal stage_full : std_logic_vector(0 to 4);


  constant multguard        : NATURAL := addguard;           -- guard bits


  -- stage 0 outputs.
  signal tag0: std_logic_vector(tag_width-1 downto 0);
  signal  l, r             : UNRESOLVED_float(exponent_width downto -fraction_width);  -- floating point input  

  -- stage 1 outputs
  signal lfptype_1, rfptype_1 : valid_fpstate;
  signal fpresult_1         : UNRESOLVED_float (exponent_width downto -fraction_width);
  signal fractl_1, fractr_1   : UNSIGNED (fraction_width downto 0);  -- fractions
  signal rfract_1           : UNSIGNED ((2*(fraction_width))+1 downto 0);  -- result fraction
  signal sfract_1           : UNSIGNED (fraction_width+1+multguard downto 0);  -- result fraction
  signal shifty_1           : INTEGER;      -- denormal shift
  signal exponl_1, exponr_1   : SIGNED (exponent_width-1 downto 0);  -- exponents
  signal rexpon_1           : SIGNED (exponent_width+1 downto 0);  -- result exponent
  signal fp_sign_1          : STD_ULOGIC;   -- sign of result
  signal lresize_1, rresize_1 : UNRESOLVED_float (exponent_width downto -fraction_width);
  signal sticky_1           : STD_ULOGIC;   -- Holds precision for rounding
  signal exceptional_result_1  : std_logic;
  
  signal tag1: std_logic_vector(tag_width-1 downto 0);
  signal tag1_extended : std_logic_vector(tag_width+operand_width+(exponent_width+2)+1+1-1 downto 0);  

  -- stage 2 outputs (note stage 2 itelf is a pipelined array multiplier)
  signal rfract_2           : UNSIGNED ((2*(fraction_width))+1 downto 0);  -- result fraction  
  signal tag2_extended : std_logic_vector(tag_width+operand_width+(exponent_width+2)+1+1-1 downto 0);

  -- normalizer
  signal normalizer_tag_in, normalizer_tag_out: std_logic_vector(tag_width+fpresult_1'length downto 0);
  signal fpresult_3         : UNRESOLVED_float (exponent_width downto -fraction_width);

  -- stage 4 outputs.
  signal tag4: std_logic_vector(tag_width-1 downto 0);  
  signal fpresult_4         : std_logic_vector((exponent_width+fraction_width) downto 0);
  
begin

  pipeline_stall <= stage_full(4) and (not accept_rdy);
  muli_rdy <= not pipeline_stall;
  mulo_rdy <= stage_full(4);
  tag_out <= tag4;

  -- construct l,r.
  lp <= to_float(INA, exponent_width, fraction_width);
  rp <= to_float(INB, exponent_width, fraction_width);

  -- return slv.
  OUTMUL <= fpresult_4;

  -----------------------------------------------------------------------------
  -- Stage 0: register inputs.
  -----------------------------------------------------------------------------
  process(clk)
    variable active_v : std_logic;
  begin
    active_v := env_rdy and not (pipeline_stall or reset);
    if(clk'event and clk = '1') then

      if(reset = '1') then
      	stage_full(0) <= '0';
      elsif (pipeline_stall = '0') then
        stage_full(0) <= env_rdy;
      end if;

      if(active_v = '1') then
        tag0 <= tag_in;
        l <= lp;
        r <= rp;
      end if;
    end if;
  end process;

  
  -----------------------------------------------------------------------------
  -- Stage 1: detect NaN, deNorm, align exponents.
  -----------------------------------------------------------------------------
  process(clk)
    variable active_v : std_logic;
    variable exceptional_result: std_ulogic;
    variable lfptype, rfptype : valid_fpstate;
    variable fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable fractl, fractr   : UNSIGNED (fraction_width downto 0);  -- fractions
    variable rfract           : UNSIGNED ((2*(fraction_width))+1 downto 0);  -- result fraction
    variable sfract           : UNSIGNED (fraction_width+1+multguard downto 0);  -- result fraction
    variable shifty           : INTEGER;      -- denormal shift
    variable exponl, exponr   : SIGNED (exponent_width-1 downto 0);  -- exponents
    variable rexpon           : SIGNED (exponent_width+1 downto 0);  -- result exponent
    variable fp_sign          : STD_ULOGIC;   -- sign of result
    variable lresize, rresize : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable sticky           : STD_ULOGIC;   -- Holds precision for rounding
  begin
    exceptional_result := '0';    
    fp_sign := '0';
    rexpon := (others => '0');
    exponl := (others => '0');
    exponr := (others => '0');
    shifty := 0;
    fractl := (others => '0');
    fractr := (others => '0');
    lfptype := isx;
    rfptype := isx;
    fpresult := (others => '0');
     
    if (fraction_width = 0 or l'length < 7 or r'length < 7) then
      lfptype := isx;
      exceptional_result := '1';
    else
      lfptype := classfp (l, check_error);
      rfptype := classfp (r, check_error);
    end if;
    if (lfptype = isx or rfptype = isx) then
      fpresult := (others => 'X');
      exceptional_result := '1';      
    elsif ((lfptype = nan or lfptype = quiet_nan or
            rfptype = nan or rfptype = quiet_nan)) then
      -- Return quiet NAN, IEEE754-1985-7.1,1
      exceptional_result := '1';      
      fpresult := qnanfp (fraction_width => fraction_width,
                          exponent_width => exponent_width);
    elsif (((lfptype = pos_inf or lfptype = neg_inf) and
            (rfptype = pos_zero or rfptype = neg_zero)) or
           ((rfptype = pos_inf or rfptype = neg_inf) and
            (lfptype = pos_zero or lfptype = neg_zero))) then    -- 0 * inf
      -- Return quiet NAN, IEEE754-1985-7.1,3
      exceptional_result := '1';      
      fpresult := qnanfp (fraction_width => fraction_width,
                          exponent_width => exponent_width);
    elsif (lfptype = pos_inf or rfptype = pos_inf
           or lfptype = neg_inf or rfptype = neg_inf) then  -- x * inf = inf
      exceptional_result := '1';      
      fpresult := pos_inffp (fraction_width => fraction_width,
                             exponent_width => exponent_width);
      -- figure out the sign
      fp_sign := l(l'high) xor r(r'high);     -- figure out the sign
      fpresult (exponent_width) := fp_sign;
    else
      fp_sign := l(l'high) xor r(r'high);     -- figure out the sign
     
      -- mpd: this resize seems unnecessary..
      --lresize := resize (arg            => to_x01(l),
                         --exponent_width => exponent_width,
                         --fraction_width => fraction_width,
                         --denormalize_in => denormalize,
                         --denormalize    => denormalize);
      lresize := to_X01(l);

      lfptype := classfp (lresize, false);    -- errors already checked
      
      -- mpd: this resize is not necessary?
      -- rresize := resize (arg            => to_x01(r),
                         -- exponent_width => exponent_width,
                         -- fraction_width => fraction_width,
                         -- denormalize_in => denormalize,
                         -- denormalize    => denormalize);
      rresize := to_X01(r);
      rfptype := classfp (rresize, false);    -- errors already checked

      break_number (
        arg         => lresize,
        fptyp       => lfptype,
        denormalize => denormalize,
        fract       => fractl,
        expon       => exponl);
      break_number (
        arg         => rresize,
        fptyp       => rfptype,
        denormalize => denormalize,
        fract       => fractr,
        expon       => exponr);

      -- TODO: this shifter slows things down. perhaps its better to break
      --       and add a new stage at this point.
      if (rfptype = pos_denormal or rfptype = neg_denormal) then
        shifty := fraction_width - find_leftmost(fractr, '1');
        fractr := shift_left (fractr, shifty);
      elsif (lfptype = pos_denormal or lfptype = neg_denormal) then
        shifty := fraction_width - find_leftmost(fractl, '1');
        fractl := shift_left (fractl, shifty);
      else
        shifty := 0;
        -- Note that a denormal number * a denormal number is always zero.
      end if;
      -- multiply
      -- add the exponents
      rexpon := resize (exponl, rexpon'length) + exponr - shifty + 1;
    end if;

    active_v := stage_full(0) and not (pipeline_stall or reset);
    if(clk'event and clk = '1') then

      if(reset = '1') then
	stage_full(1) <= '0';
      elsif (pipeline_stall = '0') then
	stage_full(1) <= stage_full(0);
      end if;

      if(active_v = '1') then
        tag1 <= tag0;
        
        fpresult_1 <= fpresult;
        fractl_1 <= fractl;
        fractr_1 <= fractr;
        rexpon_1 <= rexpon;
        fp_sign_1 <= fp_sign;
        exceptional_result_1 <= exceptional_result;
      end if;      
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Stage 2: instantiate array multiplier
  -----------------------------------------------------------------------------
  process(tag1, fpresult_1, rexpon_1, fp_sign_1, exceptional_result_1)
    variable tex : std_logic_vector(tag_width+operand_width+(exponent_width+2)+1 downto 0);
    variable fp_slv : std_logic_vector(operand_width-1 downto 0);
    variable pad_bits : std_logic_vector(1 downto 0);
  begin

    fp_slv(operand_width-1) := fpresult_1(exponent_width);
    fp_slv(operand_width-2 downto fraction_width) := to_slv(fpresult_1(exponent_width-1 downto 0));
    fp_slv(fraction_width-1 downto 0) := to_slv(fpresult_1(-1 downto -fraction_width));

    pad_bits(1) := fp_sign_1;
    pad_bits(0) := exceptional_result_1;
    
    tex := tag1 & fp_slv & to_slv(rexpon_1) & pad_bits;
    
    tag1_extended <= tex;
  end process;
  
  amul : UnsignedMultiplier
    generic map (tag_width => tag_width+operand_width+(exponent_width+2)+2,
                 operand_width => fraction_width+1,
		 chunk_width => 8)
    port map (
      L       => fractl_1,
      R       => fractR_1,
      RESULT  => rfract_2,
      clk     => clk,
      reset   => reset,
      in_rdy  => stage_full(1),
      out_rdy => stage_full(2),
      stall   => pipeline_stall,
      tag_in  => tag1_extended,
      tag_out => tag2_extended);
    


  -----------------------------------------------------------------------------
  -- Stage 3: normalize... 
  -----------------------------------------------------------------------------
  Normalizer: block
    signal rfract           : UNSIGNED ((2*(fraction_width))+1 downto 0);  -- result fraction
    signal sfract           : UNSIGNED (fraction_width+1+multguard downto 0);  -- result fraction
    signal rexpon           : SIGNED (exponent_width+1 downto 0);  -- result exponent
    signal fp_sign          : STD_ULOGIC;   -- sign of result
    signal sticky           : STD_ULOGIC;   -- Holds precision for rounding
    signal raw_tag          : std_logic_vector(tag_width-1 downto 0);
    signal fpresult         : UNRESOLVED_float (exponent_width downto -fraction_width);
    signal exceptional_result: std_logic;
  begin
    raw_tag <= tag2_extended((tag_width+operand_width+exponent_width+3) downto (operand_width+exponent_width+4));
    fpresult <= to_float(tag2_extended(operand_width+exponent_width+3 downto exponent_width+4), exponent_width, fraction_width);
    rexpon <= to_signed(tag2_extended(exponent_width+3 downto 2));
    fp_sign <= tag2_extended(1);
    exceptional_result <= tag2_extended(0);
    
    rfract <= rfract_2;
    sfract <= rfract (rfract'high downto
                      rfract'high - (fraction_width+1+multguard));
    sticky <= or_reduce (rfract (rfract'high-(fraction_width+1+multguard)
                                 downto 0));

    normalizer_tag_in(normalizer_tag_in'high downto 1) <= 
		raw_tag & std_logic_vector(fpresult);
    normalizer_tag_in(0) <= exceptional_result;
   	
    normalizer: GenericFloatingPointNormalizer
		generic map (tag_width => normalizer_tag_in'length,
				exponent_width => exponent_width,
				fraction_width => fraction_width,
				round_style => float_round_style,
				nguard => multguard,
				denormalize => denormalize)
		port map(fract => sfract,
			 expon => rexpon,
			 sign => fp_sign,
			 sticky => sticky,
			 in_rdy  => stage_full(2),
			 out_rdy => stage_full(3),
			 stall => pipeline_stall,
			 clk => clk,
			 reset => reset,
			 tag_in => normalizer_tag_in,
			 tag_out => normalizer_tag_out,
			 normalized_result => fpresult_3);
  end block;

  -----------------------------------------------------------------------------
  -- Stage 4: final multiplexor... 
  -----------------------------------------------------------------------------
  process(clk)
    variable active_v : std_logic;
    variable exceptional_result: std_ulogic;
    variable fpresult, fpresult_normalized   : UNRESOLVED_float (exponent_width downto -fraction_width);
    variable raw_tag          : std_logic_vector(tag_width-1 downto 0);
    
  begin

    raw_tag := normalizer_tag_out(tag_width+operand_width downto operand_width+1);
    fpresult := to_float(normalizer_tag_out(operand_width downto 1), exponent_width, fraction_width);
    exceptional_result := normalizer_tag_out(0);
    
   fpresult_normalized := fpresult_3;

    active_v := stage_full(3) and not (pipeline_stall or reset);
    if(clk'event and clk = '1') then

      if(reset = '1') then
	stage_full(4) <= '0';
      elsif (pipeline_stall = '0') then
	stage_full(4) <= stage_full(3);
      end if;

      if(active_v = '1') then
        tag4 <= raw_tag;

        if(exceptional_result = '1') then
          fpresult_4 <= to_slv(fpresult);
	else
          fpresult_4 <= to_slv(fpresult_normalized);
        end if;
        
      end if;      
    end if;
  end process;
  
end rtl;
-------------------------------------------------------------------------------
-- An IEEE-754 compliant arbitrary-precision normalizer
-- originally written by David Bishop (dbishop@vhdl.org)
-- modified by Madhav Desai.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;

library ahir;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;


entity GenericFloatingPointNormalizer is
  generic (tag_width : integer := 8;
           exponent_width: integer := 11;
           fraction_width : integer := 52;
           round_style : round_type := float_round_style;  -- rounding option
           nguard       : NATURAL := float_guard_bits;  -- number of guard bits
           denormalize : BOOLEAN    := float_denormalize  -- Use IEEE extended FP           
           );
  port(
    fract  :in  unsigned(fraction_width+nguard+1 downto 0);
    expon  :in  signed(exponent_width+1 downto 0);
    sign   :in  std_ulogic;
    sticky :in  std_ulogic;
    tag_in :in  std_logic_vector(tag_width-1 downto 0);
    tag_out:out std_logic_vector(tag_width-1 downto 0);
    in_rdy :in  std_ulogic;
    out_rdy:out std_ulogic;
    stall  :in  std_ulogic;
    clk    :in  std_ulogic;
    reset  :in  std_ulogic;
    normalized_result :out UNRESOLVED_float (exponent_width downto -fraction_width)  -- result
   );
end entity;


architecture Simple of GenericFloatingPointNormalizer is

begin

	process(clk)
    	   variable result : UNRESOLVED_float (exponent_width downto -fraction_width);
	begin
		if(clk'event and clk = '1') then
			if(stall = '0') then

				result := 
					normalize(fract,expon,sign,sticky,
					   	exponent_width, fraction_width,
						round_style, denormalize, 
						nguard);
				normalized_result <= result;

				tag_out <= tag_in;
			end if;
			
			if(reset = '1') then
				out_rdy <= '0';
			else
				if(stall = '0') then
					out_rdy <= in_rdy;
				end if;
			end if;

			
		end if;
	end process;
end Simple;


-- this is the real stuff.
architecture rtl of GenericFloatingPointNormalizer is
    constant num_stages: integer := 6;
    constant operand_width: integer := fract'length;

    signal stage_full: std_logic_vector(0 to num_stages);

    type TagArray is array (natural range <>) of std_logic_vector(tag_width-1 downto 0);
    signal stage_tags: TagArray(0 to num_stages);

    signal expon_1  : signed(exponent_width+1 downto 0);
    signal fract_1,fract_2,fract_3  :  unsigned(fraction_width+nguard+1 downto 0);
    signal round_1, zerores_1, infres_1 : BOOLEAN;
    signal round_2, zerores_2, infres_2 : BOOLEAN;

    signal shiftr_1,shiftr_2,shiftr_3     : INTEGER range -(2**(expon'length+1)) to (2**(expon'length+1));      -- shift amount

    signal exp_1,exp_2,exp_3        : SIGNED (exponent_width+1 downto 0);  -- exponent

    signal sticky_1,sticky_2, sticky_3    : STD_ULOGIC;   -- versions of sticky
    signal sign_1,sign_2, sign_3    : STD_ULOGIC;   -- versions of sign

    signal result_1,result_2,result_3, result_6: 
		UNRESOLVED_float (exponent_width downto -fraction_width);  -- result
    signal exceptional_result_flag_3: std_ulogic;

    signal shift_in, shift_out : unsigned(fraction_width+nguard+1 downto 0);
    signal shift_tag_in, shift_tag_out : 
		std_logic_vector(tag_width+expon'length+normalized_result'length+4-1 downto 0);
    signal shift_amount: unsigned(Ceil_Log2(fract'length)-1 downto 0);

begin

  stage_full(0) <= in_rdy;
  out_rdy <= stage_full(num_stages);

  stage_tags(0) <= tag_in;
  tag_out <= stage_tags(num_stages);

  normalized_result <= result_6;

  -- stage 1: find leftmost 1.
  process(clk)
    variable sfract     : UNSIGNED (fract'high downto 0);  -- shifted fraction
    variable rfract     : UNSIGNED (fraction_width-1 downto 0);   -- fraction
    variable exp        : SIGNED (exponent_width+1 downto 0);  -- exponent
    variable rexp       : SIGNED (exponent_width+1 downto 0);  -- result exponent
    variable rexpon     : UNSIGNED (exponent_width-1 downto 0);   -- exponent
    variable result     : UNRESOLVED_float (exponent_width downto -fraction_width);  -- result
    variable shiftr     : INTEGER range -(2**(expon'length+1)) to (2**(expon'length+1));      -- shift amount
    variable stickyx    : STD_ULOGIC;   -- version of sticky
    constant expon_base : SIGNED (exponent_width-1 downto 0) :=
      gen_expon_base(exponent_width);   -- exponent offset
    variable round, zerores, infres : BOOLEAN;
  begin  -- function normalize
    zerores := false;
    infres  := false;
    round   := false;
    shiftr  := find_leftmost (to_01(fract), '1')     -- Find the first "1"
               - fraction_width - nguard;  -- subtract the length we want
    exp := resize (expon, exp'length) + shiftr;
    if(clk'event and clk = '1') then
	if(stall = '0') then
		zerores_1 <= zerores;
		infres_1  <= infres;
		round_1   <= round;
		shiftr_1  <= shiftr;
		exp_1 <= exp;
		fract_1 <= fract;
		sticky_1 <= sticky;
		sign_1 <= sign;
		expon_1 <= expon;
	end if;
	if(reset = '1') then
		stage_full(1) <= '0';
	elsif (stall = '0') then
		stage_full(1) <= stage_full(0);
		stage_tags(1) <= stage_tags(0);
	end if;
    end if;
  end process;

  
  -- stage 2: a bit light!
  process(clk)
    variable sfract     : UNSIGNED (fract'high downto 0);  -- shifted fraction
    variable rfract     : UNSIGNED (fraction_width-1 downto 0);   -- fraction
    variable exp        : SIGNED (exponent_width+1 downto 0);  -- exponent
    variable rexp       : SIGNED (exponent_width+1 downto 0);  -- result exponent
    variable rexpon     : UNSIGNED (exponent_width-1 downto 0);   -- exponent
    variable result     : UNRESOLVED_float (exponent_width downto -fraction_width);  -- result
    variable shiftr     : INTEGER range -(2**(expon'length+1)) to (2**(expon'length+1));      -- shift amount
    variable stickyx    : STD_ULOGIC;   -- version of sticky
    constant expon_base : SIGNED (exponent_width-1 downto 0) :=
      gen_expon_base(exponent_width);   -- exponent offset
    variable round, zerores, infres : BOOLEAN;
  begin  -- function normalize
    zerores := zerores_1;
    infres  := infres_1;
    round   := round_1;
    shiftr  := shiftr_1;
    exp     := exp_1;

    if (or_reduce (fract_1) = '0') then   -- Zero
      zerores := true;
    elsif ((exp <= -resize(expon_base, exp'length)-1) and denormalize)
      or ((exp < -resize(expon_base, exp'length)-1) and not denormalize) then
      if (exp >= -resize(expon_base, exp'length)-fraction_width-1)
        and denormalize then
        exp    := -resize(expon_base, exp'length)-1;
        shiftr := -to_integer (expon_1 + expon_base);  -- new shift
      else                              -- return zero
        zerores := true;
      end if;
    elsif (exp > expon_base-1) then     -- infinity
      infres := true;
    end if;
    if(clk'event and clk = '1') then
	if(stall = '0') then
		zerores_2 <= zerores;
		infres_2 <= infres;
		round_2 <= round;
		shiftr_2 <= shiftr;
		exp_2 <= exp;
		fract_2 <= fract_1;
                sticky_2 <= sticky_1;
		sign_2 <= sign_1;
	end if;
	if(reset = '1') then
		stage_full(2) <= '0';
	elsif (stall = '0') then
		stage_full(2) <= stage_full(1);
		stage_tags(2) <= stage_tags(1);
	end if;
    end if;
  end process;

  -- stage 3: exceptional cases
  process(clk)
    variable sfract     : UNSIGNED (fract'high downto 0);  -- shifted fraction
    variable rfract     : UNSIGNED (fraction_width-1 downto 0);   -- fraction
    variable exp        : SIGNED (exponent_width+1 downto 0);  -- exponent
    variable rexp       : SIGNED (exponent_width+1 downto 0);  -- result exponent
    variable rexpon     : UNSIGNED (exponent_width-1 downto 0);   -- exponent
    variable result     : UNRESOLVED_float (exponent_width downto -fraction_width);  -- result
    variable shiftr     : INTEGER range -(2**(expon'length+1)) to (2**(expon'length+1));      -- shift amount
    variable stickyx    : STD_ULOGIC;   -- version of sticky
    constant expon_base : SIGNED (exponent_width-1 downto 0) :=
      gen_expon_base(exponent_width);   -- exponent offset
    variable round, zerores, infres : BOOLEAN;
    variable exceptional_result_flag: std_ulogic;
  begin  -- function normalize
    zerores := zerores_2;
    infres  := infres_2;
    round   := round_2;
    shiftr  := shiftr_2;
    exp     := exp_2;
    exceptional_result_flag := '0';
    result := (others => '0');

    if zerores then
      exceptional_result_flag := '1';
      result := zerofp (fraction_width => fraction_width,
                        exponent_width => exponent_width);
    elsif infres then
      exceptional_result_flag := '1';
      result := pos_inffp (fraction_width => fraction_width,
                           exponent_width => exponent_width);
    end if;
  
    if(clk'event and clk = '1') then
	if(stall ='0') then
		fract_3 <= fract_2;	
		sticky_3 <= sticky_2;
		shiftr_3 <= shiftr;
		exp_3 <= exp;
		exceptional_result_flag_3 <= exceptional_result_flag;
		result_3 <= result;
		sign_3 <= sign_2;
	end if;
	if(reset = '1') then
		stage_full(3) <= '0';
	elsif (stall = '0') then
		stage_full(3) <= stage_full(2);
		stage_tags(3) <= stage_tags(2);
	end if;
    end if;
  end process;

  
  -- stage 4:  prepare data for shifter.
  process(clk)
        variable reverse_flag, stickyx: std_ulogic;
        variable shiftu: unsigned(Ceil_Log2(fract'length)-1 downto 0);
        variable tmp: natural;
  begin 
    
    reverse_flag := '0';
    --- break 3 -----
    if(clk'event and clk = '1') then
	if(stall = '0') then
		if(shiftr_3 <= 0) then
			reverse_flag := '1';
                        tmp := - shiftr_3;
			shift_in <= reverse(fract_3);
	 		shiftu := to_unsigned(tmp,shiftu'length);
			stickyx := sticky_3;
		else
			shift_in <= fract_3;
			tmp := shiftr_3;
	 		shiftu := to_unsigned(tmp, shiftu'length);
			stickyx := sticky_3 or smallfract(fract_3, shiftr_3-1);
		end if;
   
		shift_amount <= shiftu;

		shift_tag_in(shift_tag_in'high downto 4) <= std_logic_vector(stage_tags(3)) & 
			std_logic_vector(exp_3) & std_logic_vector(result_3);
		shift_tag_in(3) <=  sign_3;
		shift_tag_in(2) <=  exceptional_result_flag_3;
		shift_tag_in(1) <=  reverse_flag;
		shift_tag_in(0) <=  stickyx;
	end if;
	if(reset = '1') then
		stage_full(4) <= '0';
	elsif (stall = '0') then
		stage_full(4) <= stage_full(3);
		stage_tags(4) <= stage_tags(3);
	end if;
    end if;
  end process;
  
  -- stage 5: shifter:  sfract := fract srl shiftr;   
  us: UnsignedShifter generic map(shift_right_flag => true,
					tag_width => shift_tag_in'length,
					operand_width => shift_in'length,
					shift_amount_width => shift_amount'length)
		port map(L => shift_in, R => shift_amount, RESULT => shift_out,
				clk => clk, reset => reset,
				in_rdy => stage_full(4),
				out_rdy => stage_full(5),
				stall => stall,
				tag_in => shift_tag_in,
				tag_out => shift_tag_out);


  -- stage 6: round.
  process(clk)
    variable sfract     : UNSIGNED (fract'high downto 0);  -- shifted fraction
    variable rfract     : UNSIGNED (fraction_width-1 downto 0);   -- fraction
    variable exp        : SIGNED (exponent_width+1 downto 0);  -- exponent
    variable rexp       : SIGNED (exponent_width+1 downto 0);  -- result exponent
    variable rexpon     : UNSIGNED (exponent_width-1 downto 0);   -- exponent
    variable result_exceptional   : UNRESOLVED_float (exponent_width downto -fraction_width);  -- result
    variable result     : UNRESOLVED_float (exponent_width downto -fraction_width);  -- result
    variable shiftr     : INTEGER range -(2**(expon'length+1)) to (2**(expon'length+1));      -- shift amount
    variable stickyx    : STD_ULOGIC;   -- version of sticky
    constant expon_base : SIGNED (exponent_width-1 downto 0) :=
      gen_expon_base(exponent_width);   -- exponent offset
    variable round, zerores, infres : BOOLEAN;
    variable exceptional_result_flag, reverse_flag: std_ulogic;
    variable shiftu : unsigned(Ceil_Log2(fract'length)-1 downto 0);
    variable signx: std_ulogic;
  begin  -- function normalize
    exp   := signed(shift_tag_out((shift_tag_out'high - tag_width) downto 
		(shift_tag_out'high - (tag_width+exp'length-1))));	
    result_exceptional := to_float(shift_tag_out((shift_tag_out'high - 
					(tag_width + exp'length)) downto 
				(shift_tag_out'high - (tag_width+exp'length+result'length-1))),
				exponent_width, fraction_width);	
    signx := shift_tag_out(3);
    exceptional_result_flag := shift_tag_out(2);
    reverse_flag := shift_tag_out(1);
    stickyx := shift_tag_out(0);
    result := (others => '0');
    rfract := (others => '0');

    if reverse_flag = '0' then
        sfract := shift_out;
    else
    	sfract := reverse(shift_out);
    end if;

    if nguard > 0 then
      round := check_round (
        fract_in    => sfract (nguard),
        sign        => signx,
        remainder   => sfract(nguard-1 downto 0),
        sticky      => stickyx,
        round_style => round_style);
    end if;
    if round then
      fp_round(fract_in  => sfract (fraction_width-1+nguard downto nguard),
               expon_in  => exp(rexp'range),
               fract_out => rfract,
               expon_out => rexp);
    else
      rfract := sfract (fraction_width-1+nguard downto nguard);
      rexp   := exp(rexp'range);
    end if;
      --- break 5 ----
      -- result
    rexpon := UNSIGNED (rexp(exponent_width-1 downto 0));
    rexpon (exponent_width-1)          := not rexpon(exponent_width-1);
    result (rexpon'range)              := UNRESOLVED_float(rexpon);
    result (-1 downto -fraction_width) := UNRESOLVED_float(rfract);

    result (exponent_width) := signx;    -- sign BIT

    if(clk'event and clk = '1') then
	if(stall = '0') then
		if(exceptional_result_flag = '0') then
			result_6 <= result;
		else
			result_6 <= result_exceptional;
		end if;
	end if;
	if(reset = '1') then
		stage_full(6) <= '0';
	elsif (stall = '0') then
		stage_full(6) <= stage_full(5);
		stage_tags(6) <= shift_tag_out(shift_tag_out'high downto 
					(shift_tag_out'high - (tag_width-1)));
	end if;
    end if;
  end process;

end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;

entity PipelinedFPOperator is
  generic (
      name : string;
      operator_id : string;
      exponent_width : integer := 8;
      fraction_width : integer := 23;
      no_arbitration: boolean := true;
      num_reqs : integer := 3; -- how many requesters?
      use_input_buffering: boolean := true;
      detailed_buffering_per_input: IntegerArray;
      detailed_buffering_per_output: IntegerArray
    );
  port (
    -- req/ack follow level protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackR                     : out BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    reqR                     : in  BooleanArray(num_reqs-1 downto 0);
    -- input data consists of concatenated pairs of ips
    dataL                    : in std_logic_vector((2*(exponent_width+fraction_width+1)*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    dataR                    : out std_logic_vector(((exponent_width+fraction_width+1)*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset              : in std_logic);
end PipelinedFPOperator;

architecture Vanilla of PipelinedFPOperator is

  constant num_operands : integer := 2;
  constant operand_width : integer := exponent_width+fraction_width+1;
  constant iwidth : integer := 2*operand_width;
  constant owidth : integer := operand_width;
  
  constant tag_length: integer := Maximum(1,Ceil_Log2(reqL'length));
  signal itag,otag : std_logic_vector(tag_length-1 downto 0);
  signal ireq,iack, oreq, oack: std_logic;

  constant debug_flag : boolean := false;

  signal idata: std_logic_vector(iwidth-1 downto 0);
  signal odata: std_logic_vector(owidth-1 downto 0);

  signal NaN, overflow, underflow : std_logic;
  constant use_as_subtractor : boolean := (operator_id = "ApFloatSub");


  -----------------------------------------------------------------------------
  -- for the moment..
  constant use_generic_multiplier : boolean := true;
  -----------------------------------------------------------------------------
  
begin  -- Behave
  assert ackL'length = reqL'length report "mismatched req/ack vectors" severity error;
  assert ((operand_width = 32) or (operand_width = 64)) report "32/64 bit operand-support only!" severity error;
  assert ((operator_id = "ApFloatMul") or (operator_id = "ApFloatAdd") or (operator_id = "ApFloatSub"))
    report "operator_id must be either add or mul or sub" severity error;  

  -- DebugGen: if debug_flag generate 
    -- assert( (not ((reset = '0') and (clk'event and clk = '1') and no_arbitration)) or Is_At_Most_One_Hot(reqL))
    -- report "in no-arbitration case, at most one request should be hot on clock edge (in SplitOperatorShared)" severity error;
  -- end generate DebugGen;
  NoInBuffers : if not use_input_buffering generate 
    imux: InputMuxBase
      generic map(iwidth => iwidth*num_reqs,
                  owidth => iwidth, 
                  twidth => tag_length,
                  nreqs => num_reqs,
                  no_arbitration => no_arbitration,
                  registered_output => false)
      port map(
          reqL       => reqL,
        ackL       => ackL,
        reqR       => ireq,
        ackR       => iack,
        dataL      => dataL,
        dataR      => idata,
        tagR       => itag,
        clk        => clk,
        reset      => reset);
   end generate NoInBuffers;

  InBuffers: if use_input_buffering generate
    imuxWithInputBuf: InputMuxWithBuffering
      generic map(name => name & " imux " , 
		iwidth => iwidth*num_reqs,
                owidth => iwidth, 
                twidth => tag_length,
                nreqs => num_reqs,
		buffering => detailed_buffering_per_input,
                no_arbitration => no_arbitration,
                registered_output => false)
      port map(
        reqL       => reqL,
        ackL       => ackL,
        reqR       => ireq,
        ackR       => iack,
        dataL      => dataL,
        dataR      => idata,
        tagR       => itag,
        clk        => clk,
        reset      => reset);
  end generate InBuffers;

  IEEE754xMul:  if operator_id = "ApFloatMul" generate
    useGeneric: if use_generic_multiplier generate
    op: GenericFloatingPointMultiplier
      generic map( tag_width     => tag_length,
                   exponent_width => exponent_width,
                   fraction_width => fraction_width,
                   round_style => round_nearest,
                   addguard => 3,
                   check_error => true,
                   denormalize => true)
      port map (
        env_rdy => ireq,
        muli_rdy => iack,
        accept_rdy => oack,
        mulo_rdy => oreq,
        INA => idata((2*operand_width)-1 downto operand_width),
        INB => idata(operand_width-1 downto 0),
        OUTMUL => odata,
        tag_in => itag,
        tag_out => otag,
        clk => clk,
        reset => reset);
    end generate useGeneric;
    
    SinglePrecision: if operand_width = 32 and (not use_generic_multiplier) generate 
    	op: SinglePrecisionMultiplier
          generic map( tag_width     => tag_length)
          port map (
            env_rdy => ireq,
            muli_rdy => iack,
            accept_rdy => oack,
            mulo_rdy => oreq,
            INA => idata(63 downto 32),
            INB => idata(31 downto 0),
            OUTM => odata,
            tag_in => itag,
            tag_out => otag,
            NaN => NaN,
            oflow => overflow,
            uflow => underflow,
            clk => clk,
            reset => reset);
	end generate SinglePrecision;


    DoublePrecision: if operand_width = 64 and (not use_generic_multiplier) generate 
    	op: DoublePrecisionMultiplier
          generic map ( tag_width     => tag_length)
          port map (
            env_rdy => ireq,
            muli_rdy => iack,
            accept_rdy => oack,
            mulo_rdy => oreq,
            INA => idata(127 downto 64),
            INB => idata(63 downto 0),
            OUTM => odata,
            tag_in => itag,
            tag_out => otag,
            NaN => NaN,
            oflow => overflow,
            uflow => underflow,
            clk => clk,
            reset => reset);
    end generate DoublePrecision;
  end generate IEEE754xMul;

  IEEE754xAdd:  if ((operator_id = "ApFloatAdd") or (operator_id = "ApFloatSub")) generate
    op: GenericFloatingPointAdderSubtractor
      generic map( tag_width     => tag_length,
                   exponent_width => exponent_width,
                   fraction_width => fraction_width,
                   round_style => round_nearest,
                   addguard => 3,
                   check_error => true,
                   denormalize => true,
                   use_as_subtractor => use_as_subtractor)
      port map (
        env_rdy => ireq,
        addi_rdy => iack,
        accept_rdy => oack,
        addo_rdy => oreq,
        INA => idata((2*operand_width)-1 downto operand_width),
        INB => idata(operand_width-1 downto 0),
        OUTADD => odata,
        tag_in => itag,
        tag_out => otag,
        clk => clk,
        reset => reset);
  end generate IEEE754xAdd;


  odemux: OutputDeMuxBaseWithBuffering
    generic map (
        name => name & " odemux ",
  	iwidth => owidth,
  	owidth =>  owidth*num_reqs,
	twidth =>  tag_length,
	nreqs  => num_reqs,
	detailed_buffering_per_output => detailed_buffering_per_output)
    port map (
      reqL   => oreq,
      ackL   => oack,
      dataL => odata,
      tagL  => otag,
      reqR  => reqR,
      ackR  => ackR,
      dataR => dataR,
      clk   => clk,
      reset => reset);
  
end Vanilla;

-------------------------------------------------------------------------------
-- Authors: Abhishek R. Kamath & Prashant Singhal
-- An IEEE-754 compliant Single-Precision pipelined multiplier
--
--   rounding-scheme implemented is round-to-zero.
--   overflow/underflow exceptions are detected.
--
--   TODO: implement round-to-nearest since this
--         is preferred to reduce errors.
-- 
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity SinglePrecisionMultiplier is
  generic (tag_width : integer);
  port(
    INA, INB: in std_logic_vector(31 downto 0);
    OUTM: out std_logic_vector(31 downto 0);
    clk,reset: in std_logic;
    tag_in: in std_logic_vector(tag_width-1 downto 0);
    tag_out: out std_logic_vector(tag_width-1 downto 0);
    NaN, oflow, uflow: out std_logic := '0';
    env_rdy, accept_rdy: in std_logic;
    muli_rdy, mulo_rdy: out std_logic);
end entity;

architecture rtl of SinglePrecisionMultiplier is

  type parpro is array (0 to 23) of std_logic_vector(23 downto 0);


  signal rdy1,rdy2,rdy3,rdy4,rdy5,rdy6,rdy7,rdy8,rdy9,rdy10, rdy11: std_logic := '0';
  signal flag3,flag4,flag5,flag6,flag7,flag8,flag9,flag10: std_logic_vector(1 downto 0);
  signal fman10: std_logic_vector(22 downto 0);
  signal tag1,tag2,tag3,tag4,tag5,tag6,tag7,tag8,tag9,tag10: std_logic_vector(tag_width-1 downto 0);
  signal pipeline_stall: std_logic := '0';

  signal aman_1,aman_2,bman_1,bman_2: std_logic_vector(23 downto 0);
  signal anan1,bnan1,azero1,bzero1,ainf1,binf1,osgn1: std_logic := '0'; 
  signal aexp_s1,bexp_s1: std_logic_vector(7 downto 0);

  signal nocalc2,nocalc3,nocalc4,nocalc5,nocalc6,nocalc7,nocalc8,nocalc9,nocalc10: std_logic;-- := '0';
  signal output_s2,output_s23,output_s24,output_s25,output_s26,output_s27,output_s28,output_s29,output_s210: std_logic_vector(2 downto 0);
  signal int_exp: std_logic_vector(8 downto 0);

  signal fexp3,fexp4,fexp5,fexp6,fexp7,fexp8,fexp9,fexp10: std_logic_vector(7 downto 0);-- := X"00";

  signal pp: parpro;
  signal tr_400,tr_401,tr_402,tr_403,tr_404,tr_405,tr_406,tr_407,tr_408,tr_409,tr_410,tr_411: std_logic_vector(47 downto 0);

  signal tr51,tr52,tr53,tr54,tr55,tr56,tr61,tr62,tr63,tr7,tr_temp,tr9: std_logic_vector(47 downto 0);

  signal tr401,tr402,tr403,tr404,tr405,tr406,tr407,tr408,tr409,tr410,tr411,tr412: std_logic_vector(47 downto 0);-- := X"000000000000";
  signal tr413,tr414,tr415,tr416,tr417,tr418,tr419,tr420,tr421,tr422,tr423,tr424: std_logic_vector(47 downto 0);-- := X"000000000000";

begin

  stage_1: process(clk,reset)

    variable asgn,bsgn,osgn: std_logic := '0';
    variable aexp,bexp: std_logic_vector(7 downto 0);-- := X"00";
    variable aman,bman: std_logic_vector(23 downto 0);-- := "000000000000000000000000";
    variable anan,bnan,azero,bzero,ainf,binf: std_logic;-- := '0';

  begin
    if reset = '1' then
      rdy1 <= '0';
    else
      if clk'event and clk='1'then
	if env_rdy = '1' and pipeline_stall = '0' then

          aexp := INA(30 downto 23);
          bexp := INB(30 downto 23);
          aman := '1' & INA(22 downto 0);
          bman := '1' & INB(22 downto 0);

          if(aexp=X"FF") then
            if(unsigned(aman)=0) then
              ainf := '1';
              anan := '0';
              azero := '0';
            else
              anan := '1';
              azero := '0';
              ainf := '0';
            end if;
          elsif(aexp=X"00") then
            if unsigned(aman)=0 then
              azero := '1';
              ainf := '0';
              anan := '0';
            end if;
          else
            ainf := '0';
            anan := '0';
            azero := '0';
          end if;

          if(bexp=X"FF") then
            if(unsigned(bman)=0) then
              binf := '1';
              bnan := '0';
              bzero := '0';
            else
              bnan := '1';
              bzero := '0';
              binf := '0';
            end if;
          elsif(bexp=X"00") then
            if unsigned(bman)=0 then
              bzero := '1';
              binf := '0';
              bnan := '0';
            end if;
          else
            binf := '0';
            bnan := '0';
            bzero := '0';
          end if;

          osgn1 <= INA(31) xor INB(31);

          ainf1 <= ainf;
          binf1 <= binf;
          anan1 <= anan;
          bnan1 <= bnan;
          azero1 <= azero;
          bzero1 <= bzero;

          aexp_s1 <= aexp;
          bexp_s1 <= bexp;
          aman_1 <= aman;
          bman_1 <= bman;


          rdy1 <= '1';
          tag1 <= tag_in;

        elsif pipeline_stall = '1' then
        elsif env_rdy = '0' then
          rdy1 <= '0';
        end if;
      end if;
    end if;
  end process stage_1;





  stage_2: process(clk,reset)
  begin
    if reset = '1' then
      rdy2 <= '0';
    else
      if clk'event and clk='1'then
	if rdy1 = '1' and pipeline_stall = '0' then
          if (anan1 = '1' or bnan1 = '1') then
            output_s2 <= osgn1 & "10";
            nocalc2 <= '1';
          elsif (azero1 = '1' and binf1 = '1') or (ainf1 = '1' and bzero1 = '1') then
            output_s2 <= osgn1 & "10";
            nocalc2 <= '1';
          elsif azero1 = '1' or bzero1 = '1' then
            output_s2 <= osgn1 & "00";
            nocalc2 <= '1';
          elsif ainf1 = '1' or binf1 = '1' then
            output_s2 <= osgn1 & "11";
            nocalc2 <= '1';
          else
            int_exp <= std_logic_vector(unsigned('0' & aexp_s1) + unsigned('0' & bexp_s1));
            output_s2 <= osgn1 & "01";
            nocalc2 <= '0';
          end if;
          aman_2 <= aman_1;
          bman_2 <= bman_1;
          rdy2 <= '1';
          tag2 <= tag1;


	elsif pipeline_stall = '1' then
	elsif rdy1 = '0' then
          rdy2 <= '0';
	end if;
      end if;
    end if;
  end process stage_2;




  stage_3: process(clk,reset)

    variable exp3: unsigned(8 downto 0);

  begin
    if reset = '1' then
      rdy3 <= '0';
    else
      if clk'event and clk='1'then
	if rdy2 = '1' and pipeline_stall = '0' then
          if nocalc2 = '1' then
            nocalc3 <= '1';
            output_s23 <= output_s2;
            flag3 <= "00";
          elsif nocalc2 = '0' then
            exp3 := unsigned(int_exp);
            if(exp3 > 381) then
              output_s23 <= output_s2(2) & "11";
              nocalc3 <= '1';
              flag3 <= "10";
            elsif(exp3 < 127) then
              output_s23 <= output_s2(2) & "00";
              nocalc3 <= '1';
              flag3 <= "01";
            else
              exp3 := exp3 - 127;
              output_s23 <= output_s2(2) & "01";
              nocalc3 <= '0';
              flag3 <= "00";
            end if;	
          end if;
          fexp3 <= std_logic_vector(exp3(7 downto 0));
          rdy3 <= '1';
          tag3 <= tag2;

          for i in 0 to 23 loop
            for j in 0 to 23 loop
              pp(i)(j) <= aman_2(j) and bman_2(i);
            end loop;
          end loop;

	elsif pipeline_stall = '1' then
	elsif rdy2 = '0' then
          rdy3 <= '0';
	end if;
      end if;
    end if;
  end process stage_3;





  stage_4: process(clk,reset)
  begin
    if reset = '1' then
      rdy4 <= '0';
    else
      if clk'event and clk='1'then
	if rdy3 = '1' and pipeline_stall = '0' then
          if nocalc3 = '1' then
            nocalc4 <= '1';
          elsif nocalc3 = '0' then

            tr401 <= X"000000" & pp(0);
            tr402 <= X"00000" & "000" & pp(1) & '0';
            tr403 <= X"00000" & "00" & pp(2) & "00";
            tr404 <= X"00000" & '0' & pp(3) & "000";	

            tr405 <= X"00000" & pp(4) & X"0";
            tr406 <= X"0000" & "000" & pp(5) & X"0" & '0';
            tr407 <= X"0000" & "00" & pp(6) & X"0" & "00";
            tr408 <= X"0000" & '0' & pp(7) & X"0" & "000";

            tr409 <= X"0000" & pp(8) & X"00";
            tr410 <= X"000" & "000" & pp(9) & X"00" & '0';
            tr411 <= X"000" & "00" & pp(10) & X"00" & "00";
            tr412 <= X"000" & '0' & pp(11) & X"00" & "000";

            tr413 <= X"000" & pp(12) & X"000";
            tr414 <= X"00" & "000" & pp(13) & X"000" & '0';
            tr415 <= X"00" & "00" & pp(14) & X"000" & "00";
            tr416 <= X"00" & '0' & pp(15) & X"000" & "000";

            tr417 <= X"00" & pp(16) & X"0000";
            tr418 <= X"0" & "000" & pp(17) & X"0000" & '0';
            tr419 <= X"0" & "00" & pp(18) & X"0000" & "00";
            tr420 <= X"0" & '0' & pp(19) & X"0000" & "000";

            tr421 <= X"0" & pp(20) & X"00000";
            tr422 <= "000" & pp(21) & X"00000" & '0';
            tr423 <= "00" & pp(22) & X"00000" & "00";
            tr424 <= '0' & pp(23) & X"00000" & "000";

            nocalc4 <= '0';

          end if;


          output_s24 <= output_s23;
          fexp4 <= fexp3;
          flag4 <= flag3;
          rdy4 <= '1';
          tag4 <= tag3;

	elsif pipeline_stall = '1' then
	elsif rdy3 = '0' then
          rdy4 <= '0';
	end if;
      end if;
    end if;
  end process stage_4;


  stage_5: process(clk,reset)
  begin
    if reset = '1' then
      rdy5 <= '0';
    else
      if clk'event and clk='1'then
	if rdy4 = '1' and pipeline_stall = '0' then
          if nocalc4 = '1' then
            nocalc5 <= '1';
          elsif nocalc4 = '0' then

            tr_400 <= std_logic_vector(unsigned(tr401) + unsigned(tr402));
            tr_401 <= std_logic_vector(unsigned(tr403) + unsigned(tr404));
            tr_402 <= std_logic_vector(unsigned(tr405) + unsigned(tr406));
            tr_403 <= std_logic_vector(unsigned(tr407) + unsigned(tr408));
            tr_404 <= std_logic_vector(unsigned(tr409) + unsigned(tr410));
            tr_405 <= std_logic_vector(unsigned(tr411) + unsigned(tr412));
            tr_406 <= std_logic_vector(unsigned(tr413) + unsigned(tr414));
            tr_407 <= std_logic_vector(unsigned(tr415) + unsigned(tr416));
            tr_408 <= std_logic_vector(unsigned(tr417) + unsigned(tr418));
            tr_409 <= std_logic_vector(unsigned(tr419) + unsigned(tr420));
            tr_410 <= std_logic_vector(unsigned(tr421) + unsigned(tr422));
            tr_411 <= std_logic_vector(unsigned(tr423) + unsigned(tr424));

            nocalc5 <= '0';

          end if;


          output_s25 <= output_s24;
          fexp5 <= fexp4;
          flag5 <= flag4;
          rdy5 <= '1';
          tag5 <= tag4;

	elsif pipeline_stall = '1' then
	elsif rdy4 = '0' then
          rdy5 <= '0';
	end if;
      end if;
    end if;
  end process stage_5;



  stage_6: process(clk,reset)
  begin
    if reset = '1' then
      rdy6 <= '0';
    else
      if clk'event and clk='1'then
	if rdy5 = '1' and pipeline_stall = '0' then
          if nocalc5 = '1' then
            nocalc6 <= '1';
          else
            tr51 <= std_logic_vector(unsigned(tr_400) + unsigned(tr_401));
            tr52 <= std_logic_vector(unsigned(tr_402) + unsigned(tr_403));
            tr53 <= std_logic_vector(unsigned(tr_404) + unsigned(tr_405));
            tr54 <= std_logic_vector(unsigned(tr_406) + unsigned(tr_407));
            tr55 <= std_logic_vector(unsigned(tr_408) + unsigned(tr_409));
            tr56 <= std_logic_vector(unsigned(tr_410) + unsigned(tr_411));
            nocalc6 <= '0';
          end if;

          output_s26 <= output_s25;
          fexp6 <= fexp5;
          flag6 <= flag5;
          rdy6 <= '1';
          tag6 <= tag5;

	elsif pipeline_stall = '1' then
	elsif rdy5 = '0' then
          rdy6 <= '0';
	end if;
      end if;
    end if;
  end process stage_6;



  stage_7: process(clk,reset)
  begin
    if reset = '1' then
      rdy7 <= '0';
    else
      if clk'event and clk='1'then
	if rdy6 = '1' and pipeline_stall = '0' then
          if nocalc6 = '1' then
            nocalc7 <= '1';
          else
            tr61 <= std_logic_vector(unsigned(tr51) + unsigned(tr52));
            tr62 <= std_logic_vector(unsigned(tr53) + unsigned(tr54));
            tr63 <= std_logic_vector(unsigned(tr55) + unsigned(tr56));
            nocalc7 <= '0';
          end if;

          output_s27 <= output_s26;
          fexp7 <= fexp6;
          flag7 <= flag6;
          rdy7 <= '1';
          tag7 <= tag6;

	elsif pipeline_stall = '1' then
	elsif rdy6 = '0' then
          rdy7 <= '0';
	end if;
      end if;
    end if;
  end process stage_7;

  stage_8: process(clk,reset)
  begin
    if reset = '1' then
      rdy8 <= '0';
    else
      if clk'event and clk='1'then
	if rdy7 = '1' and pipeline_stall = '0' then
          if nocalc7 = '1' then
            nocalc8 <= '1';
          else
            tr7 <= std_logic_vector(unsigned(tr61) + unsigned(tr62));
            nocalc8 <= '0';
          end if;

          output_s28<= output_s27;
          fexp8 <= fexp7;
          flag8 <= flag7;
          rdy8 <= '1';
          tag8 <= tag7;
          tr_temp <= tr63;

	elsif pipeline_stall = '1' then
	elsif rdy7 = '0' then
          rdy8 <= '0';
	end if;
      end if;
    end if;
  end process stage_8;

  stage_9: process(clk,reset)
  begin
    if reset = '1' then
      rdy9 <= '0';
    else
      if clk'event and clk='1'then
	if rdy8 = '1' and pipeline_stall = '0' then
          if nocalc8 = '1' then
            nocalc9 <= '1';
          else
            tr9 <= std_logic_vector(unsigned(tr7) + unsigned(tr_temp));
            nocalc9 <= '0';
          end if;

          output_s29 <= output_s28;
          fexp9 <= fexp8;
          flag9 <= flag8;
          rdy9 <= '1';
          tag9 <= tag8;

	elsif pipeline_stall = '1' then
	elsif rdy8 = '0' then
          rdy9 <= '0';
	end if;
      end if;
    end if;
  end process stage_9;


  stage_10: process(clk,reset)
    variable man8: std_logic_vector(24 downto 0);
    variable exp8: unsigned(7 downto 0);
  begin
    if reset = '1' then
      rdy10 <= '0';
    else
      if clk'event and clk='1'then
	if rdy9 = '1' and pipeline_stall = '0' then
          if nocalc9 = '1' then
            nocalc10 <= '1';
            output_s210 <= output_s29;
            flag10 <= flag9;
          elsif nocalc9 = '0' then
            man8 := tr9(47 downto 23);
            exp8 := unsigned(fexp9);
            if man8(24) = '1' then
              if	exp8 = 254 then
                output_s210 <= output_s29(2) & "11";
                nocalc10 <= '1';
                flag10 <= "10";
              else
                exp8 := exp8 + 1;
                nocalc10 <= '0';
                fman10 <= man8(23 downto 1);
                output_s210 <= output_s29;
                flag10 <= flag9;
              end if;
            elsif exp8 = 0 then
              output_s210 <= output_s29(2) & "00";
              nocalc10 <= '1';
              flag10 <= "01";
            else
              fman10 <= man8(22 downto 0);
              output_s210 <= output_s29;
              nocalc10 <= '0';
              flag10 <= flag9;
            end if;
          end if;		
          rdy10 <= '1';
          tag10 <= tag9;
          fexp10 <= std_logic_vector(exp8);
        elsif pipeline_stall = '1' then
        elsif rdy9 = '0' then
          rdy10 <= '0';
        end if;
      end if;
    end if;
  end process stage_10;


  stage_11: process(clk,reset)
    variable temp: std_logic_vector(2 downto 0);
  begin
    if reset = '1' then
      rdy11 <= '0';
    else
      if clk'event and clk='1'then
	if rdy10 = '1' and pipeline_stall = '0' then
          rdy11 <= '1';
          temp := output_s210;
          if nocalc10 = '1' then
            case(temp(1 downto 0)) is
              when("00") => OUTM <= temp(2) & "000" & X"0000000"; NaN <= '0'; oflow <= '0'; uflow <= flag10(0);
            when("10") => OUTM <= temp(2) & X"FF" & "10000000000000000000000"; NaN <= '1'; oflow <= '0'; uflow <= '0';
            when("11") => OUTM <= temp(2) & X"FF" & "000" & X"00000"; NaN <= '0'; oflow <= flag10(1); uflow <= '0';
            when others => null; 
          end case;
          else
            OUTM <= temp(2) & fexp10 & fman10; NaN <= '0'; oflow <='0'; uflow <= '0';
          end if;
          tag_out <= tag10;
        else
          rdy11 <= '0';
        end if;
      end if;
    end if;
  end process stage_11;

  pipeline_stall <= (rdy11 and (not accept_rdy));
  muli_rdy <= not (rdy11 and (not accept_rdy));
  mulo_rdy <= rdy11;

end rtl;
-------------------------------------------------------------------------------
-- a basic unsigned adder..  if addition is specified, just
-- adds using a simple carry lookahead scheme.  if subtraction
-- is specified, takes the twos complement of the second operand
-- and adds the two numbers.  No overflow/negative checks
-- are performed.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Utilities.all;

entity AddSubCell  is
	generic ( operand_width: integer);
	port (A,B: in unsigned(operand_width-1 downto 0);
		Sum: out unsigned(operand_width-1 downto 0);
		BP,BG: out std_logic;
		stall: in std_logic;
		clk, reset: in std_logic);
end entity AddSubCell;

architecture Behave of AddSubCell is
begin
	process(clk)
		variable sumv: unsigned(operand_width-1 downto 0);
		variable prop, gen: std_logic;
	begin
		prop := '1';
		gen  := '0';

		sumv := A+B;

		for I in 0 to operand_width-1 loop
			prop := (prop and (A(I) or B(I)));
			gen  := (A(I) and B(I)) or (gen and (A(I) or B(I)));
		end loop;


		if(clk'event and clk = '1') then
		   if(stall = '0') then
			Sum <= sumv;
			BP <= prop;
			BG <= gen;
		   end if;
		end if;
	end process;
end Behave;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Utilities.all;
entity UnsignedAdderSubtractor is
  
  generic (
    tag_width          : integer;
    operand_width      : integer;
    chunk_width        : integer
	);

  port (
    L            : in  unsigned(operand_width-1 downto 0);
    R            : in  unsigned(operand_width-1 downto 0);
    RESULT       : out unsigned(operand_width-1 downto 0);
    subtract_op  : in std_logic;
    clk, reset   : in  std_logic;
    in_rdy       : in  std_logic;
    out_rdy      : out std_logic;
    stall        : in std_logic;
    tag_in       : in std_logic_vector(tag_width-1 downto 0);
    tag_out      : out std_logic_vector(tag_width-1 downto 0));
end entity;


architecture Pipelined of UnsignedAdderSubtractor is
 
  constant num_chunks: integer := Ceil(operand_width, chunk_width);
  constant padded_operand_width: integer := num_chunks  * chunk_width;
  signal Lpadded, Rpadded, Resultpadded : unsigned(padded_operand_width-1 downto 0);

  constant pipe_depth : integer := 3;
  signal stage_active : std_logic_vector(0 to pipe_depth);


  type CWORD is array (natural range <>) of unsigned(chunk_width-1 downto 0);
  type TWORD is array (natural range <>) of std_logic_vector(tag_width-1 downto 0);  
  signal stage_tags: TWORD(0 to pipe_depth);


  signal addsubcell_Sum, addsubcell_Sum_Delayed, 
			addsubcell_A, addsubcell_B, final_sums: CWord(0 to num_chunks-1);
  signal addsubcell_BP, addsubcell_BG : std_logic_vector(0 to num_chunks-1);
  signal addsubcell_Cin: std_logic_vector(0 to num_chunks);

  signal block_carries: std_logic_vector(0 to num_chunks);
  signal subtract_op_1, subtract_op_2: std_logic;


  component AddSubCell  is
	generic ( operand_width: integer);
	port (A,B: in unsigned(operand_width-1 downto 0);
		Sum: out unsigned(operand_width-1 downto 0);
		BP,BG: out std_logic;
		stall: in std_logic;
		clk, reset: in std_logic);
  end component AddSubCell;
  
begin  -- Pipelined

  -- note: if subtract_op = '1', then complement R (see below) and add 1.
  addsubcell_Cin <= (0 => '1', others => '0') when subtract_op = '1' else (others => '0');

  stage_active(0) <= in_rdy;
  out_rdy <= stage_active(pipe_depth);
  stage_tags(0) <= tag_in;
  tag_out <= stage_tags(3);

  RESULT <= Resultpadded(operand_width-1 downto 0);


  -- pad. also if subtract_op = '1' then complement R and add 1 (addsubcell_Cin).
  process(L,R,subtract_op)
	variable ltmp, rtmp: unsigned(padded_operand_width-1 downto 0);
  begin
	ltmp := (others => '0'); ltmp(operand_width-1 downto 0) := L;
	rtmp := (others => '0'); rtmp(operand_width-1 downto 0) := R;
	Lpadded <= ltmp;

	if(subtract_op = '0') then
		Rpadded <= rtmp;
	else
		Rpadded <= not rtmp;
	end if;
  end process;

  Stage1:  for I in  0 to num_chunks-1 generate

	addsubCell_A(I) <= Lpadded(((I+1)*chunk_width)-1 downto (I*chunk_width));
	addsubCell_B(I) <= Rpadded(((I+1)*chunk_width)-1 downto (I*chunk_width));

	asCell: AddSubCell generic map(operand_width => chunk_width)
		port  map( A => addsubcell_A(I),
			   B => addsubcell_B(I),	
			   Sum => addsubcell_Sum(I),
			   BP => addsubcell_BP(I),
			   BG => addsubcell_BG(I),
			   stall => stall,
			   clk => clk,
			   reset => reset);
  end generate Stage1;

  process(clk)
  begin
	if(clk'event and clk = '1') then
		if(stall = '0') then
			stage_tags(1) <= stage_tags(0);
			subtract_op_1 <= subtract_op;
		end if;
		if(reset = '1') then
			stage_active(1) <= '0';
		elsif stall = '0' then
			stage_active(1) <= stage_active(0);
		end if;
	end if;
  end process;

  -- stage two: calculate the block carries.
  process(clk)	
	variable cin: std_logic_vector(0 to num_chunks);
  begin
	cin := addsubcell_Cin;
	for I in 1 to num_chunks loop
		cin(I) := (cin(I-1) and addsubcell_BP(I-1))  or addsubcell_BG(I-1);
	end loop;

	if(clk'event and clk = '1') then
		if(stall = '0') then
			block_carries <= cin;
			stage_tags(2) <= stage_tags(1);
			addsubcell_Sum_Delayed <= addsubcell_Sum;
			subtract_op_2 <= subtract_op_1;
		end if;	
		if(reset = '1') then
			stage_active(2) <= '0';
		elsif stall = '0' then
			stage_active(2) <= stage_active(1);
		end if;
	end if;
  end process;


  -- stage three: final sums
  process(clk)
	variable correction, tmp: unsigned(chunk_width-1 downto 0);
	variable is_negative: boolean;
  begin
	if(clk'event and clk = '1') then
		if(stall = '0') then
			final_sums(0) <= addsubcell_Sum_Delayed(0);
			for I in 0 to num_chunks-1 loop
				correction := (others => '0');
				if(block_carries(I) = '1') then
					correction(0) := '1';
				end if;
				final_sums(I) <= addsubcell_Sum_Delayed(I) + correction;
			end loop;

			stage_tags(3) <= stage_tags(2);
			if(reset = '1') then
				stage_active(3) <= '0';
			elsif stall = '0' then
				stage_active(3) <= stage_active(2);
			end if;
		end if;
	end if;
  end process;


  -- collect final-sums into RESULT
  process(final_sums)
  begin
	for I in 0 to num_chunks-1 loop
		ResultPadded(((I+1)*chunk_width)-1 downto (I*chunk_width)) <= final_sums(I);
	end loop;
  end process;



end Pipelined;
-------------------------------------------------------------------------------
-- a basic unsigned multiplier.
--
-- for the moment, this just does a multiply and adds delay stages at
-- the end; presumably, the synthesis tool will retime things
-- appropriately..
--
-- TODO: pipeline this explicitly!
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DelayCell is
   generic (operand_width: integer; delay: natural);
   port (Din: in unsigned(operand_width-1 downto 0);
	 Dout: out unsigned(operand_width-1 downto 0);
	 clk: in std_logic;
	 stall: in std_logic);
end entity DelayCell;

architecture Behave of DelayCell is
	type DArray is array (natural range <>) of unsigned(operand_width-1 downto 0);
	signal data_array: DArray(0 to delay);
begin

	data_array(0) <= Din;
	NonZeroDelay: if delay > 0 generate
	   SRgen: for I in 1 to delay generate
		process(clk)
		begin
			if(clk'event and clk = '1') then
				if(stall = '0') then
					data_array(I) <= data_array(I-1);
				end if;
			end if;
			
		end process;
	    end generate SRgen;
	end generate NonZeroDelay;
	
	Dout <= data_array(delay);
end Behave;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SumCell is
 	generic (operand_width: integer; ignore_diag: boolean; ignore_right: boolean);
	port (SU,SDiagIn: in unsigned(operand_width-1 downto 0);
              SR: in unsigned(1 downto 0);
	      SDiagOut: out unsigned(operand_width-1 downto 0);
	      SL: out unsigned(1 downto 0);
	      stall: in std_logic;
	      clk: in std_logic);
end entity SumCell;

architecture Behave of SumCell is
begin

	process(clk)
		variable x, y, z, sum: unsigned(operand_width+1 downto 0);
		variable t: unsigned(1 downto 0);
	begin

		if(clk'event and clk = '1') then
			if(stall = '0') then
				x := "00" & SU;
				y := (1 => SR(1), 0 => SR(0), others => '0');
				z := "00" & SDiagIn;
		
				if(not (ignore_diag  or ignore_right)) then
					sum := x + y + z;
				elsif (ignore_diag and ignore_right) then
					sum := x;
				elsif (ignore_diag and (not ignore_right)) then
					sum := (x + y);
				else
					sum := (x + z);
				end if;
	
				t := sum(operand_width+1 downto operand_width);

				SDiagOut <= sum(operand_width-1 downto 0);
				SL <= t;
			end if;
		end if;
	end process;
end Behave;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MultiplierCell is
  generic (operand_width: integer);
  port (MT, MR, ST, DiagIn: in unsigned(operand_width-1 downto 0);
        ML, MD, SD, DiagOut: out unsigned(operand_width-1 downto 0);
        stall: in std_logic;
	clk: in std_logic);
end entity MultiplierCell;

architecture Simple of MultiplierCell is
	constant zero_const : unsigned(operand_width-2 downto 0) := (others => '0');
begin

	-- sent through without any delay.
	ML <= MR;

	process(clk)
		variable tmp,wext: unsigned((2*operand_width)-1 downto 0);
		variable u, v, w: unsigned(operand_width downto 0);
	begin
		if(clk'event and clk = '1') then
			if(stall = '0') then
				tmp := MT*MR;
		
				-- pad one bit to incoming summands.
				u :=  "0" & DiagIn;
                                v :=  "0" & ST;
		
				-- this is a operand_width+1 size addition
				w := (u + v);

				-- pad to 2*operand_width
				wext := zero_const & w;
		
				-- a full 2*operand_width addition.
				tmp := tmp + wext;

				-- send down the vertical operand
				-- with a cycle delay.
				MD <= MT;

				-- top half of result goes down to 
				-- next row (to be summed)
				SD <= tmp((2*operand_width)-1 downto operand_width);

				-- bottom half of the result goes out
				-- on the diagonal..
				DiagOut <= tmp(operand_width-1 downto 0);
			end if;
		end if;
	end process;
end Simple;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Utilities.all;

entity UnsignedMultiplier is
  
  generic (
    tag_width     : integer;
    operand_width : integer;
    chunk_width   : integer := 8);

  port (
    L, R       : in  unsigned(operand_width-1 downto 0);
    RESULT     : out unsigned((2*operand_width)-1 downto 0);
    clk, reset : in  std_logic;
    in_rdy     : in  std_logic;
    out_rdy    : out std_logic;
    stall      : in std_logic;
    tag_in     : in std_logic_vector(tag_width-1 downto 0);
    tag_out    : out std_logic_vector(tag_width-1 downto 0));
end entity;

architecture Pipelined of UnsignedMultiplier is

  constant pipe_depth : integer := operand_width/16;

  type RWORD is array (natural range <>) of unsigned((2*operand_width)-1 downto 0);
  type TWORD is array (natural range <>) of std_logic_vector(tag_width-1 downto 0);  


  signal intermediate_results : RWORD(0 to pipe_depth);
  signal intermediate_tags : TWORD(0 to pipe_depth);  
  signal stage_active : std_logic_vector(0 to pipe_depth);
  
begin  -- Pipelined

  -- for now, just multiply..
  intermediate_results(0) <= L*R;


  -- I/O
  intermediate_tags(0) <= tag_in;
  stage_active(0) <= in_rdy;
  out_rdy <= stage_active(pipe_depth);
  tag_out <= intermediate_tags(pipe_depth);
  RESULT <= intermediate_results(pipe_depth);
  
  -- for now, just add stages after the multiply
  -- the synthesis tool should retime.  Later
  -- we'll get around to doing the array multiplier
  -- right.
  Pipeline: for STAGE in 1 to pipe_depth generate

    process(clk)
    begin
      if(clk'event and clk = '1') then
        if(reset = '1') then
          stage_active(STAGE) <= '0';
        elsif(stall = '0') then
          stage_active(STAGE) <= stage_active(STAGE-1);
        end if;

        if(stall = '0') then
          intermediate_results(STAGE) <= intermediate_results(STAGE-1);
          intermediate_tags(STAGE) <= intermediate_tags(STAGE-1);
        end if;
        
      end if;
    end process;
    
  end generate Pipeline;
end Pipelined;


 
architecture ArrayMul of UnsignedMultiplier is

	constant NumChunks : integer := Ceil(operand_width, chunk_width);

	constant padded_operand_width: integer  := NumChunks*chunk_width;
	signal Lpadded, Rpadded: unsigned(padded_operand_width-1 downto 0);
	signal RESULTpadded: unsigned((2*padded_operand_width)-1 downto 0);

	type TwoDTagArray is array (natural range <>) of std_logic_vector(tag_width-1 downto 0);
	signal tag_array: TwoDTagArray(0 to 2*NumChunks);

	type TwoDChunkArray is array (natural range <>, natural range <>) of unsigned(chunk_width-1 downto 0);
	signal MT, ML, ST, DiagIn, SD, MR, MD, DiagOut: TwoDChunkArray(0 to NumChunks-1, 0 to NumChunks-1);



	signal rdy_array: std_logic_vector(0 to 2*NumChunks);

        -- the multiplier cells are arranged in a NumChunk X NumChunk array.
        -- Cell (I,J) receives R(I) (MT),  L(J) (MR) and a partial sum from above (ST).
	-- Cell (I,J) receives an incoming diagonal sum from Cell (I-1,J+1) and
        -- passes on its sum to the diagonal block Cell (I+1,J-1).
	--
	component DelayCell 
   		generic (operand_width: integer; delay: natural);
   		port (Din: in unsigned(operand_width-1 downto 0);
	 		Dout: out unsigned(operand_width-1 downto 0);
	 		clk: in std_logic;
	 		stall: in std_logic);
	end component DelayCell;

	component MultiplierCell is
  		generic (operand_width: integer);
  		port (MT, MR, ST, DiagIn: in unsigned(operand_width-1 downto 0);
        		ML, MD, SD, DiagOut: out unsigned(operand_width-1 downto 0);
        		stall: in std_logic;
			clk: in std_logic);
	end component MultiplierCell;

	component SumCell is
 		generic (operand_width: integer; ignore_diag: boolean; ignore_right: boolean);
		port (SU,SDiagIn: in unsigned(operand_width-1 downto 0);
              		SR: in unsigned(1 downto 0);
	      		SDiagOut: out unsigned(operand_width-1 downto 0);
	      		SL: out unsigned(1 downto 0);
	      		stall: in std_logic;
	      		clk: in std_logic);
	end component SumCell;

	type OneDChunkArray is array (natural range <>) of unsigned(chunk_width-1 downto 0);
	signal SU,SDiagIn,SDiagOut: OneDChunkArray(0 to NumChunks-1);

	type OneD2BitArray is array (natural range <>) of unsigned(1 downto 0);
        signal SR,SL: OneD2BitArray(0 to NumChunks-1);

	signal result_array : OneDChunkArray(0 to (2*NumChunks)-1);
begin

	process(L)
		variable lpad : unsigned(padded_operand_width-1 downto 0);
	begin
		lpad := (others => '0');
		lpad(operand_width-1 downto 0) := L;
		Lpadded <= lpad;
	end process;

	process(R)
		variable rpad : unsigned(padded_operand_width-1 downto 0);
	begin
		rpad := (others => '0');
		rpad(operand_width-1 downto 0) := R;
		Rpadded <= rpad;
	end process;

	RESULT <= RESULTpadded((2*operand_width)-1 downto 0);

	tag_array(0) <= tag_in;
	rdy_array(0) <= in_rdy;
	
	Tags: for ROW in 1 to (2*NumChunks) generate
		process(clk)
		begin
			if(clk'event and clk = '1') then
				if(reset = '1') then
					rdy_array(ROW) <= '0';
					tag_array(ROW) <= (others => '0');
				elsif(stall = '0') then
					tag_array(ROW) <= tag_array(ROW-1);
					rdy_array(ROW) <= rdy_array(ROW-1);
				end if;
			end if;
		end process;
	end generate Tags;
	tag_out <= tag_array(2*NumChunks);
	out_rdy <= rdy_array(2*NumChunks);

	Rows: for ROW in 0 to NumChunks-1 generate
		Cols: for COL in 0 to NumChunks-1 generate

			-- incoming  L values get into MT(0,-).
			ROWBC: if ROW = 0 generate
                                MT(ROW,COL) <= Lpadded(((COL+1)*chunk_width)-1 downto (COL*chunk_width));

				-- incoming signals to top row are 0.
				DiagIn(ROW,COL) <= (others => '0');
				ST(ROW,COL) <= (others => '0');

			end generate ROWBC;

		        COLBC: if COL=NumChunks-1 and ROW>0 generate
				-- left border column has incoming diagonals 0
				DiagIn(ROW,COL) <= (others => '0');
			end generate COLBC;

			-- from the right, R values enter with each row 
			-- getting an appropriate delay.
			COLBC2: if COL = 0 generate
				delInst: DelayCell generic map(operand_width => chunk_width,
								delay => ROW)
					port map(Din => Rpadded(((ROW+1)*chunk_width)-1 downto (ROW*chunk_width)),
						 Dout => MR(ROW,COL),
						 clk => clk,
						 stall => stall);
			end generate COLBC2;

			-- passing from right to left.
			Cols1: if COL > 0 generate
				MR(ROW,COL) <= ML(ROW,COL-1);
			end generate Cols1;

			ConnectArray: if ROW>0 generate

				-- from top to bottom
				MT(ROW,COL) <= MD(ROW-1,COL);
				ST(ROW,COL) <= SD(ROW-1,COL);
				
				-- diagonally.
				Cols2: if COL < NumChunks-1 generate
					DiagIn(ROW,COL) <= DiagOut(ROW-1,COL+1);
				end generate Cols2;
			end generate ConnectArray;

			mulCell: MultiplierCell generic map(operand_width => chunk_width)
				port map(MT => MT(ROW,COL),
					 ML => ML(ROW,COL),
					 ST => ST(ROW,COL),
					 DiagIn => DiagIn(ROW,COL),
					 SD => SD(ROW,COL),
					 MR => MR(ROW,COL),
					 MD => MD(ROW,COL),
					 stall => stall,
					 DiagOut => DiagOut(ROW,COL),
					 clk => clk);
		end generate Cols;
	end generate Rows;


	--  instantiate an array of sum cells to take
	--  care of the SD correction.
	sumArray: for Cols in 0 to NumChunks-1 generate
	
		scell: SumCell generic map (operand_width => chunk_width,
						ignore_diag => (Cols = NumChunks-1),
						ignore_right => (Cols = 0))
			port map(SU => SU(Cols),
				 SDiagIn => SDiagIn(Cols),
				 SR => SR(Cols),
				 SDiagOut => SDiagOut(Cols),
				 SL => SL(Cols),
				 stall => stall,
				 clk => clk);

		BR: if(Cols = 0) generate
			-- 0s from the right at the right boundary
			SR(Cols) <= (others => '0');
		end generate BR;
				
		BL: if(Cols = NumChunks-1) generate
			-- 0s from the diagonal at the left boundary.
			SDiagIn(Cols) <= (others => '0');
		end generate BL;

		--   inputs to the cells are delayed to match the sum
		--   propagation.

		--  sum coming down..
		dSU: DelayCell generic map(operand_width => chunk_width, delay => Cols)
			port map(Din => SD(NumChunks-1,Cols),
				 Dout => SU(Cols),
				 clk => clk,
				 stall => stall);
		
		Cntr1: if(Cols > 0) generate
			SR(Cols) <= SL(Cols-1);
		end generate Cntr1;
		
		Cntr2: if (Cols < NumChunks-1) generate
			-- diagonal coming in..  the leftmost cell has no incoming diagonal.
			dSDiagIn: DelayCell generic map(operand_width => chunk_width, delay => Cols)
				port map(Din => DiagOut(NumChunks-1,Cols+1),
				 Dout => SDiagIn(Cols),
				 clk => clk,
				 stall => stall);
		end generate Cntr2;
		
	end generate sumArray;


	--       instantiate delay elements to match delays
        --       inserted due to sum-cell array.


	-- the right column and N-1 delays inserted.
	RightColumn:  for Rows in 0 to NumChunks-1 generate
		dRc: DelayCell generic map(operand_width => chunk_width, delay => NumChunks-1)
			port map(Din => DiagOut(Rows,0),
				 Dout => result_array(Rows),
				 stall => stall,
				 clk => clk);
	end generate RightColumn;

	-- the bottom row as N-C delays inserted as C goes from 0 to N-2
	BottomRow: for Cols in 0 to NumChunks-2 generate
		dBr: DelayCell generic map(operand_width => chunk_width, delay => NumChunks-(Cols+1))
			port map(Din => SDiagOut(Cols),
				 Dout => result_array(Cols+NumChunks),
				 stall => stall,
				 clk => clk);
		
	end generate BottomRow;

	-- leftmost element has no delays inserted.
	result_array((2*NumChunks)-1) <= SDiagOut(NumChunks-1);


	-- result: pack the diagonals into the result vector.
	process(result_array)
	begin
		for I in 0 to (2*NumChunks)-1 loop
			RESULTpadded(((I+1)*chunk_width)-1 downto (I*chunk_width))
				<= result_array(I);
		end loop;
	end process;

end ArrayMul;
-------------------------------------------------------------------------------
-- a basic unsigned shifter.
--
-- for the moment, this just does a shift and adds delay stages at
-- the end; presumably, the synthesis tool will retime things
-- appropriately..
--
-- TODO: pipeline this explicitly!
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Utilities.all;


entity UnsignedShifter is
  
  generic (
    shift_right_flag   : boolean;
    tag_width          : integer;
    operand_width      : integer;
    shift_amount_width : integer);

  port (
    L       : in  unsigned(operand_width-1 downto 0);
    R       : in  unsigned(shift_amount_width-1 downto 0);
    RESULT     : out unsigned(operand_width-1 downto 0);
    clk, reset : in  std_logic;
    in_rdy     : in  std_logic;
    out_rdy    : out std_logic;
    stall      : in std_logic;
    tag_in     : in std_logic_vector(tag_width-1 downto 0);
    tag_out    : out std_logic_vector(tag_width-1 downto 0));
end entity;


architecture Pipelined of UnsignedShifter is

  constant phases_per_stage: integer := 4;
  constant num_sig_bits: integer := Maximum(1,Minimum(shift_amount_width, Ceil_Log2(operand_width)));
  constant pipe_depth : integer := Ceil(num_sig_bits,phases_per_stage);

  type RWORD is array (natural range <>) of unsigned(operand_width-1 downto 0);
  type TWORD is array (natural range <>) of std_logic_vector(tag_width-1 downto 0);  
  type SWORD is array (natural range <>) of unsigned(num_sig_bits-1 downto 0);  


  signal intermediate_results : RWORD(0 to pipe_depth);
  signal intermediate_tags : TWORD(0 to pipe_depth);  
  signal intermediate_shift_amount : SWORD(0 to pipe_depth);  
  signal stage_active : std_logic_vector(0 to pipe_depth);

  
  constant debug_flag: boolean := true;
begin  -- Pipelined

  Debug: if debug_flag  generate
	
	DebugBlock: block
		signal pipe_depth_sig, num_sig_bits_sig, tmp_sig, tmp_sig_2: integer;
	begin
		pipe_depth_sig <= pipe_depth;
		num_sig_bits_sig <= num_sig_bits;
		tmp_sig <= Ceil(num_sig_bits,phases_per_stage);
		tmp_sig_2 <= (num_sig_bits/phases_per_stage);
	end block;

  end generate debug;

   
  TrivOp: if operand_width = 1 generate
	intermediate_results(0) <= (others => '0') when R(0) = '1' else L;
  end generate TrivOp;
  

  NonTrivOp: if operand_width > 1 generate



        genStages: for STAGE in 1 to pipe_depth generate
  		process(clk)
			variable shifted_L: unsigned(operand_width-1 downto 0);
			variable shift_amount: unsigned(num_sig_bits-1 downto 0);
  		begin
			shifted_L := intermediate_results(STAGE-1);
			shift_amount := intermediate_shift_amount(STAGE-1);

			for I in ((STAGE-1)*phases_per_stage) to 
					Minimum(num_sig_bits-1,(STAGE*phases_per_stage)-1) loop  
				if(shift_amount(I) = '1') then
					if(shift_right_flag) then
						shifted_L :=  shift_right(shifted_L, 2**I);
					else
						shifted_L :=  shift_left(shifted_L, 2**I);
					end if;
				end if;
			end loop;

			if(clk'event and clk='1') then

                                if(reset = '1') then
					stage_active(STAGE) <=  '0';
				elsif stall = '0' then
					stage_active(STAGE) <= stage_active(STAGE-1);
				end if;

				if(stall = '0') then
  					intermediate_results(STAGE) <= shifted_L;
  					intermediate_tags(STAGE) <= intermediate_tags(STAGE-1);
					intermediate_shift_amount(STAGE) <= 
							intermediate_shift_amount(STAGE-1);
				end if;
			end if;
  		end process;
	end generate genStages;

  end generate NonTrivOp;


  -- I/O
  intermediate_results(0) <=  L;
  intermediate_tags(0) <= tag_in;
  intermediate_shift_amount(0) <= R(num_sig_bits-1 downto 0);
  stage_active(0) <= in_rdy;
  out_rdy <= stage_active(pipe_depth);
  tag_out <= intermediate_tags(pipe_depth);
  RESULT <= intermediate_results(pipe_depth);
  
end Pipelined;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
use ahir.FloatOperatorPackage.all;

--
-- output = input_1 op input_2.
--
-- input_1 uses the higher bits of data_in, and the (1) index of sample-req/ack.
--
-- note: if output is determined without needing an input, then that
--       input is killed..
entity BinaryLogicalOperator is
  generic
    (
      name  : string;
      operator_id         : string;            -- operator id
      input_width         : integer;           -- input width
      output_width        : integer;           -- the width of the output.
      input_1_buffer_depth: integer;           -- buffering at input 1.
      input_2_buffer_depth: integer;           -- buffering at input 2.
      output_buffer_depth : integer;           -- buffering at output.
	-- both should never be constants.
      input_1_is_constant : boolean := false;
      input_2_is_constant : boolean := false;
      flow_through: boolean := false
      );
  port (
    -- input operands.
    sample_req : in BooleanArray(1 downto 0);  -- sample reqs, one per input.
    sample_ack : out BooleanArray(1 downto 0); -- sample acks, one per output.
    data_in      : in  std_logic_vector((2*input_width)-1 downto 0);
    -- result.
    update_req : in Boolean;  -- req for output update.
    update_ack : out Boolean; -- ack for output update.
    data_out      : out std_logic_vector(output_width-1 downto 0);
    -- clock, reset.
    clk, reset : in  std_logic);
end BinaryLogicalOperator;


architecture Vanilla of BinaryLogicalOperator is
	constant cZero: std_logic_vector(input_width-1 downto 0) := (others => '0');
	constant cOne: std_logic_vector(input_width-1 downto 0) := (others => '1');

	signal in_data_1: std_logic_vector(input_width-1 downto 0);
	signal in_data_1_valid, in_data_1_accept, in_data_1_kill, in_data_1_zero, in_data_1_one: std_logic;

	signal in_data_2: std_logic_vector(input_width-1 downto 0);
	signal in_data_2_valid, in_data_2_accept, in_data_2_kill, in_data_2_zero, in_data_2_one: std_logic;

	signal out_data: std_logic_vector(output_width-1 downto 0);
	signal out_data_valid, out_data_accept: std_logic;

begin  -- Vanilla
	andCase: if(operator_id = "ApIntAnd") generate
			out_data <= (in_data_1 and in_data_2);
	end generate andCase;

	nandCase: if(operator_id = "ApIntNand") generate
		out_data <= not (in_data_1 and in_data_2);
	end generate nandCase;

	orCase: if(operator_id = "ApIntOr") generate
		out_data <= (in_data_1 or in_data_2);
	end generate orCase;

	norCase: if(operator_id = "ApIntNor") generate
		out_data <= not (in_data_1 or in_data_2);
	end generate norCase;

	xorCase: if(operator_id = "ApIntXor") generate
		out_data <= (in_data_1 xor in_data_2);
	end generate xorCase;

	xnorCase: if(operator_id = "ApIntXnor") generate
		out_data <= not (in_data_1 xor in_data_2);
	end generate xnorCase;

    noFlowThrough:  if (not flow_through) generate
	in_data_1_zero <= '1' when (in_data_1 = cZero) else '0';
	in_data_1_one <= '1' when (in_data_1 = cOne) else '0';
	in_data_2_zero <= '1' when (in_data_2 = cZero) else '0';
	in_data_2_one <= '1' when (in_data_2 = cOne) else '0';

        -- receive buffers.
	i1NoConst: if (not input_1_is_constant) generate
		rx1: ReceiveBuffer generic map(name => name & " receiver-buffer-input-1 ",
						buffer_size => 	input_1_buffer_depth,
						data_width => input_width,
						kill_counter_range => 65535)
			port map(write_req => sample_req(1),
				 write_ack => sample_ack(1),
			         write_data => data_in((2*input_width)-1 downto input_width),
				 read_req => in_data_1_accept,
				 read_ack => in_data_1_valid,
				 read_data => in_data_1,
				 kill => in_data_1_kill,
				 clk => clk, reset => reset);	
        end generate i1NoConst;

	i1Const: if (input_1_is_constant) generate
		in_data_1 <=  data_in((2*input_width)-1 downto input_width);
		in_data_1_valid <= '1';
		in_data_1_kill <= '0';
		sample_ack(1) <= sample_req(1);
        end generate i1Const;

	i2NoConst: if (not input_2_is_constant) generate
		rx2: ReceiveBuffer generic map(name => name & " receiver-buffer-input-2 ",
						buffer_size => 	input_2_buffer_depth,
						data_width => input_width,
						kill_counter_range => 65535)
			port map(write_req => sample_req(0),
				 write_ack => sample_ack(0),
			         write_data => data_in(input_width-1 downto 0),
				 read_req => in_data_2_accept,
				 read_ack => in_data_2_valid,
				 read_data => in_data_2,
				 kill => in_data_2_kill,
				 clk => clk, reset => reset);	
        end generate i2NoConst;

	i2Const: if (input_2_is_constant) generate
		in_data_2 <=  data_in(input_width-1 downto 0);
		in_data_2_valid <= '1';
		in_data_2_kill <= '0';
		sample_ack(0) <= sample_req(0);
        end generate i2Const;


	in_data_1_accept <=  in_data_1_valid and out_data_valid and out_data_accept;
        in_data_1_kill   <= (not in_data_1_valid) and out_data_valid and out_data_accept;

	in_data_2_accept <=  in_data_2_valid and out_data_valid and out_data_accept;
        in_data_2_kill   <= (not in_data_2_valid) and out_data_valid and out_data_accept;
        
	-- the operator itself. operator-id can be ApIntAnd, ApIntOr, ApIntXor, ApIntNor, 
        -- ApIntNand, ApIntXnor.
	andGen: if ((operator_id = "ApIntAnd") or (operator_id = "ApIntNand")) generate

		-- out-valid = i1valid.i2valid  + i1valid.(i1=0) + i2valid.(i2=0)
		out_data_valid <= (in_data_1_valid and in_data_2_valid) 
					or (in_data_1_valid and in_data_1_zero) or
						(in_data_2_valid and in_data_2_zero);

        end generate andGen;

	orGen: if ((operator_id = "ApIntOr") or (operator_id = "ApIntNor")) generate

		-- out-valid = i1valid.i2valid  + i1valid.(i1=1) + i2valid.(i2=1)
		out_data_valid <= (in_data_1_valid and in_data_2_valid) 
					or (in_data_1_valid and in_data_1_one) or
						(in_data_2_valid and in_data_2_one);


        end generate orGen;

	xorGen: if ((operator_id = "ApIntXor") or (operator_id = "ApIntXnor")) generate

		out_data_valid <= in_data_1_valid and in_data_2_valid;


        end generate xorGen;

       
	
	-- unload buffer on the output side. 
        ub: UnloadBuffer generic map (name => name & " output-buffer ",
					buffer_size => output_buffer_depth,
					data_width => output_width)
		port map(write_req => out_data_valid,
			 write_ack => out_data_accept,
			 write_data => out_data,
			 unload_req => update_req,
			 unload_ack => update_ack,
			 read_data => data_out,
			 clk => clk, reset => reset); 
  end generate noFlowThrough;

  flowThrough: if (flow_through) generate

	-- operator is just like a combinational operator.
	-- All other sequencing must be handled correctly by 
	-- the control-path.

	update_ack   <= update_req;
	sample_ack <= sample_req;	
		
	in_data_1 <=  data_in((2*input_width)-1 downto input_width);
	in_data_2 <=  data_in(input_width-1 downto 0);

	data_out <= out_data;
	
  end generate flowThrough;

end Vanilla;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

--
-- output = input1 op input2
-- 
entity BinarySharedOperator is
    generic
    (
      name : string;
      operator_id   : string := "ApIntAdd";          -- operator id
      input_1_is_int : Boolean := true; -- false means float
      input_1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_1_width      : integer := 4;    -- width of input1
      input_1_is_constant : BooleanArray;   -- constant case needs to be handled a bit differently..
      input_2_is_int : Boolean := true; -- false means float
      input_2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input_2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      input_2_width      : integer := 0;    -- width of input2
      input_2_is_constant : BooleanArray;  -- constant case needs to be handled a bit differently..
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer := 4;          -- width of output.
      num_reqs : integer := 3; -- how many requesters?
      detailed_buffering_per_input: IntegerArray;
      detailed_buffering_per_output : IntegerArray
    );
  port (
    -- input side.
    sample_req_1                     : in BooleanArray(num_reqs-1 downto 0);
    sample_req_2                     : in BooleanArray(num_reqs-1 downto 0);
    sample_ack_1                     : out BooleanArray(num_reqs-1 downto 0);
    sample_ack_2                     : out BooleanArray(num_reqs-1 downto 0);
    -- output side.
    update_ack                       : out BooleanArray(num_reqs-1 downto 0);
    update_req                       : in  BooleanArray(num_reqs-1 downto 0);
    -- input data consists of concatenated pairs of ips
    data_in_1                    : in std_logic_vector((input_1_width*num_reqs)-1 downto 0);
    data_in_2                    : in std_logic_vector((input_2_width*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    data_out                    : out std_logic_vector((output_width*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset              : in std_logic);
end BinarySharedOperator;

architecture Vanilla of BinarySharedOperator is

  signal reqL, ackL: BooleanArray(num_reqs-1 downto 0);

  constant input_width : integer := input_1_width + input_2_width;

  signal dataL : std_logic_vector((num_reqs*input_width)-1 downto 0);

  constant tag_length: integer := Maximum(1,Ceil_Log2(num_reqs));
  signal itag,otag : std_logic_vector(tag_length-1 downto 0);
  signal ireq,iack, oreq, oack: std_logic;

  constant debug_flag : boolean := false;
  alias i1_const: BooleanArray(num_reqs-1 downto 0) is input_1_is_constant;
  alias i2_const: BooleanArray(num_reqs-1 downto 0) is input_2_is_constant;
  
begin  -- Behave

  -- generate reqL using a join of both input sample reqs.
  joinGen:   for I in 0 to num_reqs-1 generate

	assert not (i1_const(I) and i2_const(I)) 
		report " both inputs to binary operator cannot be constants " severity failure;

        notBothConst: if not (i1_const(I) or i2_const(I)) generate
	  sample_ack_1(I) <= ackL(I);
	  sample_ack_2(I) <= ackL(I);
  
	  j2:  join2 generic map(name => name & ":join2:", bypass => true )
		  port map (pred0 => sample_req_1(I),
			    pred1 => sample_req_2(I),
			    symbol_out => reqL(I),
			    clk => clk, reset => reset);
	end generate notBothConst;

	i1Const: if (i1_const(I) and not i2_const(I)) generate
		reqL(I) <= sample_req_2(I);
		sample_ack_2(I) <= ackL(I);
	end generate i1Const;

	i2Const: if (i2_const(I) and not i1_const(I)) generate
		reqL(I) <= sample_req_1(I);
		sample_ack_1(I) <= ackL(I);
	end generate i2Const;
  
	-- concatenate.
	dataL(((num_reqs+1)*input_width)-1 downto (num_reqs*input_width))
		<= data_in_1(((num_reqs+1)*input_1_width)-1 downto (num_reqs*input_1_width))
			& 
		     data_in_2(((num_reqs+1)*input_2_width)-1 downto (num_reqs*input_2_width));

  end generate joinGen;


  sor: SplitOperatorShared 
    	generic map
    		(
      			name => name & " split-operator-shared ",
      			operator_id   => operator_id,
      			input1_is_int => input_1_is_int,
      			input1_characteristic_width => input_1_characteristic_width,
      			input1_mantissa_width => input_1_mantissa_width,
      			iwidth_1 => input_1_width,
      			input2_is_int => input_2_is_int,
      			input2_characteristic_width => input_2_characteristic_width,
      			input2_mantissa_width => input_2_mantissa_width,
      			iwidth_2     => input_2_width,
      			num_inputs   => 2,
      			output_is_int => output_is_int,
      			output_characteristic_width => output_characteristic_width,
      			output_mantissa_width => output_mantissa_width,
      			owidth        => output_width,
      			constant_operand => (0 => '0'),
      			constant_width => 1,
      			use_constant  => false,
      			no_arbitration => false,
      			min_clock_period => true,
      			num_reqs => num_reqs,
			use_input_buffering => true,
			detailed_buffering_per_input => detailed_buffering_per_input,
      			detailed_buffering_per_output => detailed_buffering_per_output)
  		port map (
    				reqL => reqL,
    				ackR => update_ack,
    				ackL => ackL,
    				reqR => update_req,
    				dataL => dataL,
    				dataR => data_out,
    				clk => clk, reset => reset);
end Vanilla;
-- TODO: add bypass generic..
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
use ahir.FloatOperatorPackage.all;

--
--  result = input_1 op input_2
--
--  constant operand case is shifted 
--  to UnaryUnsharedOperator.
--
entity BinaryUnsharedOperator is
  generic
    (
      name          : string;          -- instance name.
      operator_id   : string;          -- operator id
      input_1_is_int : Boolean := true; -- false means float
      input_1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_1_width        : integer;    -- width of input1
      input_1_is_constant  : boolean;
      input_2_is_int : Boolean := true; -- false means float
      input_2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input_2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      input_2_width        : integer;    -- width of input1
      input_2_is_constant  : boolean;
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer;          -- width of output.
      output_buffering : integer := 2
      );
  port (
    -- req -> ack follow pulse protocol
    sample_req:  in BooleanArray(1 downto 0);
    sample_ack:  out BooleanArray(1 downto 0);
    update_req:  in Boolean;
    update_ack:  out Boolean;
    -- operands.
    dataL      : in  std_logic_vector(input_1_width + input_2_width - 1 downto 0);
    dataR      : out std_logic_vector(output_width-1 downto 0);
    clk, reset : in  std_logic);
end BinaryUnsharedOperator;


architecture Vanilla of BinaryUnsharedOperator is
  signal   result: std_logic_vector(output_width-1 downto 0);
  signal fReq, fAck: boolean;
  
  signal ub_write_req, ub_write_ack: boolean;

begin  -- Behave
  -----------------------------------------------------------------------------
  -- join the two sample reqs...
  -- (that is, the operation will fire when both appear)
  -----------------------------------------------------------------------------
  bothNonConst: if not (input_1_is_constant or input_2_is_constant) generate
    reqJoin: join2 generic map (name => name & ":reqJoin:", bypass => true)
		port map(pred0 => sample_req(0), 
			pred1 => sample_req(1),
			symbol_out => fReq, 
			clk => clk, reset => reset);
    sample_ack(0) <= fAck;
    sample_ack(1) <= fAck;

  end generate bothNonConst;

  Const1: if (input_1_is_constant and (not input_2_is_constant) ) generate
	fReq <= sample_req(1);
	sample_ack(1) <= fAck;
  end generate Const1;

  Const2: if (input_2_is_constant and (not input_1_is_constant) ) generate
	fReq <= sample_req(0);
	sample_ack(0) <= fAck;
  end generate Const2;

  -----------------------------------------------------------------------------
  -- combinational block.. this is ever-active!
  -----------------------------------------------------------------------------
  comb_block: GenericCombinationalOperator
      generic map (
        operator_id                 => operator_id,
        input1_is_int               => input_1_is_int,
        input1_characteristic_width => input_1_characteristic_width,
        input1_mantissa_width       => input_1_mantissa_width,
        iwidth_1                    => input_1_width,
        input2_is_int               => input_2_is_int,
        input2_characteristic_width => input_2_characteristic_width,
        input2_mantissa_width       => input_2_mantissa_width,
        iwidth_2                    => input_2_width,
        num_inputs                  => 2,
        output_is_int               => output_is_int,
        output_characteristic_width => output_characteristic_width,
        output_mantissa_width       => output_mantissa_width,
        owidth                      => output_width,
        constant_operand            => (0 => '0'),
        constant_width              => 1,
        use_constant                => false)
      port map (data_in => dataL, result  => result);
  
  
  
  notBothConst: if not (input_1_is_constant and input_2_is_constant) generate
    -----------------------------------------------------------------------------
    -- interlock buffer.
    -----------------------------------------------------------------------------
    ib: InterlockBuffer generic map (name => name & " interlock-buffer ",
					  buffer_size => output_buffering,
					  in_data_width => output_width,
					  out_data_width => output_width)
		  port map(write_req => fReq, write_ack => fAck,
				  write_data => result,
				  read_req => update_req,
				  read_ack => update_ack,
				  read_data => dataR,
				  clk => clk, reset => reset);
  end generate notBothConst;

  bothConst: if (input_1_is_constant and input_2_is_constant) generate
	fReq <= false;
	dataR <= result;
	update_ack <= update_req;
  end generate bothConst;

end Vanilla;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity CounterBase is 
	generic(data_width : integer);
	port(clk, reset: in std_logic; count_out: out std_logic_vector(data_width-1 downto 0));
end CounterBase;


architecture Behave of CounterBase is
	signal counter_sig: unsigned(data_width-1 downto 0);
begin
	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				counter_sig <= (others => '0');
			else
				counter_sig <= counter_sig + 1;
			end if;
		end if;
	end process;

	count_out <= std_logic_vector(counter_sig);
end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity InputMuxWithBuffering is
  generic (name: string;
	   iwidth: integer := 10;
	   owidth: integer := 10;
	   twidth: integer := 3;
	   nreqs: integer := 1;
	   buffering: IntegerArray;
	   no_arbitration: Boolean := false;
	   registered_output: Boolean := true);
  port (
    -- req/ack follow pulse protocol
    reqL                 : in  BooleanArray(nreqs-1 downto 0);
    ackL                 : out BooleanArray(nreqs-1 downto 0);
    dataL                : in  std_logic_vector(iwidth-1 downto 0);
    -- output side req/ack level protocol
    reqR                 : out std_logic;
    ackR                 : in  std_logic;
    dataR                : out std_logic_vector(owidth-1 downto 0);
    -- tag specifies the requester index 
    tagR                : out std_logic_vector(twidth-1 downto 0);
    clk, reset          : in std_logic);
end InputMuxWithBuffering;


architecture Behave of InputMuxWithBuffering is

  type WordArray is array (natural range <>) of std_logic_vector(owidth-1 downto 0);
  signal rx_data_in, rx_data_out : WordArray(nreqs-1 downto 0);

  signal reqFromRx, ackToRx: std_logic_vector(nreqs-1 downto 0);
  signal fairReqs, fairAcks: std_logic_vector(nreqs-1 downto 0);
  signal reqP, ackP: std_logic_vector(nreqs-1 downto 0);
  signal reqFair, ackFair: std_logic_vector(nreqs-1 downto 0);

  signal kill_zero: std_logic;
  signal reqR_sig, ackR_sig: std_logic;
  signal dataR_sig: std_logic_vector(owidth-1 downto 0);
  signal tagR_sig                : std_logic_vector(twidth-1 downto 0);
  signal oq_data_in : std_logic_vector((twidth + owidth)-1 downto 0);
  signal oq_data_out : std_logic_vector((twidth + owidth)-1 downto 0);

  --alias cbuffering: IntegerArray(nreqs-1 downto 0) is buffering;

begin  -- Behave

   kill_zero <= '0';


  assert(iwidth = owidth*nreqs) report "mismatched i/o widths in InputMuxBase" severity error;

  -----------------------------------------------------------------------------
  -- first stage: receive buffers.
  -----------------------------------------------------------------------------
  RxGen: for I in 0 to nreqs-1 generate 
     process(dataL)
        variable regv : std_logic_vector(owidth-1 downto 0);
     begin
        Extract(dataL,I,regv);
        rx_data_in(I) <= regv;
     end process;


     rxBuf: ReceiveBuffer generic map(name => name & " receive-buffer " & Convert_To_String(I),
					buffer_size =>  buffering(I),
					data_width => owidth,
					kill_counter_range => 1)
		port map (write_req => reqL(I),
			  write_ack => ackL(I),
			  write_data => rx_data_in(I),
			  -------------------------
			  -- note: cross-over.
			  read_req => ackToRx(I),
			  read_ack => reqFromRx(I),
			  -------------------------
			  kill =>  kill_zero,
			  read_data => rx_data_out(I),
			  clk => clk, reset => reset);
					
  end generate RxGen;

  -----------------------------------------------------------------------------
  -- second-stage "fairify" the level-reqs (to avoid starvation).
  -----------------------------------------------------------------------------
  fairify: NobodyLeftBehind generic map (num_reqs => nreqs)
		port map (clk => clk, reset => reset, reqIn => reqFromRx, ackOut => ackToRx,
					reqOut => reqFair, ackIn => ackFair);


  -----------------------------------------------------------------------------
  -- priority encoding or pass through
  -----------------------------------------------------------------------------
  NoArbitration: if no_arbitration generate
    reqP <= reqFair;
    reqR_sig <= OrReduce(reqP);
    ackFair <= reqP when ackR_sig = '1' else (others => '0');
  end generate NoArbitration;

  Arbitration: if not no_arbitration generate
    reqP <= PriorityEncode(reqFair);
    reqR_sig <= OrReduce(reqP);
    ackFair <= reqP when ackR_sig = '1' else (others => '0');
  end generate Arbitration;

  -----------------------------------------------------------------------------
  -- data multiplexor
  -----------------------------------------------------------------------------
  process(reqP,rx_data_out)
  begin
    dataR_sig <= (others => '0');
    for J in 0 to nreqs-1 loop
      if(reqP(J) = '1') then
        dataR_sig <= rx_data_out(J);
        exit;
      end if;
    end loop;
  end process;    

  -----------------------------------------------------------------------------
  -- tag generation
  -----------------------------------------------------------------------------
  taggen : BinaryEncoder generic map (
    iwidth => nreqs,
    owidth => twidth)
    port map (
      din  => reqP,
      dout => tagR_sig);

  -----------------------------------------------------------------------------
  -- output queue.. data and tag passed out of mux. 
  -- TODO: link the output queue to the input muxing to save
  --       one stage?
  -----------------------------------------------------------------------------
  ifReg: if registered_output generate
        
      oqueue : QueueBase generic map (
        queue_depth => 2,
        data_width  => twidth + owidth)
        port map (
          clk      => clk,
          reset    => reset,
          data_in  => oq_data_in,
          push_req => reqR_sig,
          push_ack => ackR_sig,
          data_out => oq_data_out,
          pop_ack  => reqR,
          pop_req  => ackR);
      
  end generate ifReg;

  ifNoReg: if (not registered_output) generate
     oq_data_out <= oq_data_in;
     reqR <= reqR_sig;
     ackR_sig <= ackR;
  end generate ifNoReg;

  oq_data_in <= dataR_sig & tagR_sig;
  dataR <= oq_data_out((twidth+owidth)-1 downto twidth);
  tagR  <= oq_data_out(twidth-1 downto 0);

end Behave;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Components.all;
use ahir.BaseComponents.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

--
-- a full-rate input port.  The assumption here
-- is that a data item is picked up from the
-- input port for every req pulse.  The production
-- of a new output data-item is indicated by an
-- ack pulse.
--
entity InputPortFullRate is
  generic (name : string;
	   num_reqs: integer;
	   data_width: integer;
	   output_buffering: IntegerArray;
	   no_arbitration: boolean := false);
  port (
    -- pulse interface with the data-path
    sample_req        : in  BooleanArray(num_reqs-1 downto 0);
    sample_ack        : out BooleanArray(num_reqs-1 downto 0);
    update_req        : in  BooleanArray(num_reqs-1 downto 0);
    update_ack        : out BooleanArray(num_reqs-1 downto 0);
    data              : out std_logic_vector((num_reqs*data_width)-1 downto 0);
    -- ready/ready interface with outside world
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : in  std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
end entity;


architecture Base of InputPortFullRate is

  --alias outBUFs: IntegerArray(num_reqs-1 downto 0) is output_buffering;
  signal has_room, write_enable : std_logic_vector(num_reqs-1 downto 0);

  type   IPWArray is array(integer range <>) of std_logic_vector(data_width-1 downto 0);
  signal write_data, read_data: IPWArray(num_reqs-1 downto 0);

  signal demux_data : std_logic_vector((num_reqs*data_width)-1 downto 0);

  signal ack_raw: BooleanArray(num_reqs-1 downto 0);
  
begin

  -----------------------------------------------------------------------------
  -- interlock buffer.
  -----------------------------------------------------------------------------
  ProTx : for I in 0 to num_reqs-1 generate

    p2LInst: PulseToLevelHalfInterlockBuffer
	generic map(name => name & " buffer " & Convert_To_String(I),
			data_width => data_width,
			buffer_size => output_buffering(I))
        port map (sample_req            => sample_req(I),
		  sample_ack            => sample_ack(I),
		  has_room              => has_room(I),
		  write_enable          => write_enable(I),
		  write_data            => write_data(I), 
		  update_req            => update_req(I),
		  update_ack            => update_ack(I),
		  read_data                  => read_data(I), 
	          clk => clk, reset => reset);
    
  end generate ProTx;

  demux : InputPortLevel generic map (
    num_reqs       => num_reqs,
    data_width     => data_width,
    no_arbitration => no_arbitration)
    port map (
      req => has_room,
      ack => write_enable,
      data => demux_data,
      oreq => oreq,
      odata => odata,
      oack => oack,
      clk => clk,
      reset => reset);

  -----------------------------------------------------------------------------
  -- data handling
  -----------------------------------------------------------------------------
  process(read_data)
    variable ldata: std_logic_vector((num_reqs*data_width)-1 downto 0);
  begin
    for J in num_reqs-1 downto 0 loop
      Insert(ldata,J,read_data(J));
    end loop;
    data <= ldata;
  end process;

  gen : for I in num_reqs-1 downto 0 generate
    process(demux_data)
      variable target: std_logic_vector(data_width-1 downto 0);
    begin
      Extract(demux_data,I,target);
      write_data(I) <= target;
    end process;
  end generate gen;

end Base;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity InterlockBuffer is
  generic (name: string; buffer_size: integer := 2; 
		in_data_width : integer := 32;
		out_data_width : integer := 32;
		flow_through: boolean := false);
  port (write_req: in boolean;
        write_ack: out boolean;
        write_data: in std_logic_vector(in_data_width-1 downto 0);
        read_req: in boolean;
        read_ack: out boolean;
        read_data: out std_logic_vector(out_data_width-1 downto 0);
        clk : in std_logic;
        reset: in std_logic);
end InterlockBuffer;

architecture default_arch of InterlockBuffer is

  constant data_width: integer := Minimum(in_data_width,out_data_width);

  signal buf_write_req, buf_write_ack: std_logic;
  signal buf_write_data, buf_read_data:  std_logic_vector(data_width-1 downto 0);

  type LoadFsmState is (l_idle, l_busy);
  signal l_fsm_state : LoadFsmState;
  
begin  -- default_arch

  -- interlock buffer must have buffer-size > 0
  assert buffer_size > 0 report " interlock buffer size must be > 0 " severity failure;
 
  flowThrough: if flow_through generate
		write_ack <= write_req;
		read_ack <= read_req;
		read_data <= write_data;
  end generate flowThrough;

  NoFlowThrough: if (not flow_through) generate

  bufEqOne: if buffer_size = 1 generate
	regBlock: block
  		signal req, ack: boolean;
	begin
		reg: RegisterBase 
			generic map (in_data_width => in_data_width,
					out_data_width => out_data_width)
			port map(din => write_data, dout => read_data, req => req,
					ack => ack, clk => clk, reset => reset);

		jReq: join2 generic map (bypass => true, name => name & ":join2")
				port map (pred0 => write_req,
						pred1 => read_req,
						symbol_out => req,
						clk => clk, reset => reset);

		write_ack <= ack;
		read_ack  <= ack;
	end block;
  end generate bufEqOne;

  bufGtOne: if buffer_size > 1 generate 
    inSmaller: if in_data_width <= out_data_width generate
	buf_write_data <= write_data;

	process(buf_read_data)
	begin
  		read_data <= (others => '0');
  		read_data(data_width-1 downto 0)  <= buf_read_data;
	end process;
     end generate inSmaller;

     outSmaller: if out_data_width < in_data_width generate
	buf_write_data <= write_data(data_width-1 downto 0);
  	read_data  <= buf_read_data;
     end generate outSmaller;

  -- write FSM to pipe.
  process(clk,reset, l_fsm_state, buf_write_ack, write_req)
	variable nstate : LoadFsmState;
  begin
	nstate := l_fsm_state;
	buf_write_req <= '0';
        write_ack <= false;
	if(l_fsm_state = l_idle) then
		if(write_req) then
			buf_write_req <= '1';
			if(buf_write_ack = '1') then
				write_ack <= true;
			else
				nstate := l_busy;
			end if;
		end if;
	else
		buf_write_req <= '1';
		if(buf_write_ack = '1') then
			nstate := l_idle;
			write_ack <= true;
		end if;
	end if;

	if(clk'event and clk = '1') then
		if(reset = '1') then
			l_fsm_state <= l_idle;
		else
			l_fsm_state <= nstate;
		end if;
	end if;
  end process;

  -- the unload buffer.
  buf : UnloadBuffer generic map (
    name =>  name & " buffer ",
    data_width => data_width,
    buffer_size => buffer_size)
    port map (
      write_req   => buf_write_req,
      write_ack   => buf_write_ack,
      write_data  => buf_write_data,
      unload_req  => read_req,
      unload_ack  => read_ack,
      read_data   => buf_read_data,
      clk         => clk,
      reset       => reset);

  end generate bufGtOne;
  end generate NoFlowThrough;

end default_arch;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;


-- a simple multiplexor with output
-- queue.
entity LevelMux is
  generic(num_reqs: integer;
	  data_width: integer;
	  no_arbitration: boolean := true);
  port (
    write_req       : in  std_logic_vector(num_reqs-1 downto 0);
    write_ack       : out std_logic_vector(num_reqs-1 downto 0);
    write_data      : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    read_req        : in  std_logic;
    read_ack        : out std_logic;
    read_data       : out std_logic_vector(data_width-1 downto 0);
    clk, reset      : in  std_logic);
end entity;

architecture Base of LevelMux is
  
  type OPWArray is array(integer range <>) of std_logic_vector(data_width-1 downto 0);
  signal data_array : OPWArray(num_reqs-1 downto 0);
  signal req_active, ack_sig , fair_reqs, fair_acks : std_logic_vector(num_reqs-1 downto 0);
  
  signal q_data_in,q_data_out  : std_logic_vector(data_width-1 downto 0);
  signal q_push_req, q_push_ack, q_pop_req, q_pop_ack: std_logic;
begin

  -- input arbitration.
  fairify: NobodyLeftBehind generic map(num_reqs => num_reqs)
		port map(clk => clk, reset => reset,
				reqIn => write_req,
				ackOut => write_ack,
				reqOut => fair_reqs,
				ackIn => fair_acks);
  
  NoArb: if no_arbitration generate
     req_active <= fair_reqs;
  end generate NoArb;

  Arb: if not no_arbitration generate
     req_active <= PriorityEncode(fair_reqs);
  end generate Arb;


  -- combinational multiplexor (AND-OR form).
  -- AND
  gen: for I in num_reqs-1 downto 0 generate

       ack_sig(I) <= req_active(I) and q_push_ack; 
       fair_acks(I) <= ack_sig(I);

       process(write_data,req_active(I))
         variable target: std_logic_vector(data_width-1 downto 0);
       begin
          if(req_active(I) = '1') then
		Extract(write_data,I,target);
	  else
		target := (others => '0');
	  end if;	
       	  data_array(I) <= target;
       end process;
  end generate gen;

  -- OR
  process (data_array)
    variable var_odata : std_logic_vector(data_width-1 downto 0) := (others => '0');
  begin  -- process
    var_odata := (others => '0');
    for I in 0 to num_reqs-1 loop
      var_odata := data_array(I) or var_odata;
    end loop;  -- I
    q_data_in <= var_odata;
  end process;


  -- output queue (2 stage).
  q_push_req <= OrReduce(req_active);
  q_pop_req  <= read_req;
  read_ack   <= q_pop_ack;
  read_data  <= q_data_out;
  oQ:  QueueBase generic map(queue_depth => 2, data_width => data_width)
	port map( clk => clk, reset => reset,
			data_in => q_data_in,
			push_req => q_push_req,
			push_ack => q_push_ack,
			data_out => q_data_out,
			pop_req => q_pop_req,
			pop_ack => q_pop_ack);
end Base;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;
use ahir.mem_component_pack.all;

--
-- at the input side, introduce a receive
-- buffer into which the input data is concatenated
-- with a tag and a time-stamp.
--
-- The receive buffers are muxed using a merge
-- tree that compares the time-stamps.
-- From the output of the merge-tree, the data
-- and tag are separated to produce maddr, mtag.
--
entity LoadReqSharedWithInputBuffers is
  generic
    (
	name : string;
	addr_width: integer := 8;
      	num_reqs : integer := 1; -- how many requesters?
	tag_length: integer := 1;
	no_arbitration: Boolean := false;
        min_clock_period: Boolean := true;
	input_buffering: IntegerArray;
	time_stamp_width: integer := 0
    );
  port (
    -- req/ack follow pulse protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    -- concatenated address corresponding to access
    dataL                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
    -- address to memory
    maddr                   : out std_logic_vector((addr_width)-1 downto 0);
    mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);

    mreq                    : out std_logic;
    mack                    : in std_logic;
    -- clock, reset (active high)
    clk, reset              : in std_logic);
end LoadReqSharedWithInputBuffers;

architecture Vanilla of LoadReqSharedWithInputBuffers is

  constant iwidth: integer := addr_width*num_reqs;
  constant owidth: integer := addr_width;

  constant debug_flag : boolean := false;

  -- must register..  ack implies that address has been sampled.
  constant registered_output : boolean := true; 

  type TagWordArray is array (natural range <>) of unsigned(tag_length-1 downto 0);
  signal rx_tag_in: TagWordArray(num_reqs-1 downto 0);

  constant rx_word_length: integer := addr_width + tag_length + time_stamp_width;
  type RxBufWordArray is array (natural range <>) of std_logic_vector(addr_width + tag_length + time_stamp_width-1 downto 0);

  signal rx_data_in, rx_data_out : RxBufWordArray(num_reqs-1 downto 0);
  signal kill_sig : std_logic;

  signal imux_data_in_accept,  imux_data_in_valid: std_logic_vector(num_reqs-1 downto 0);
  signal imux_data_in: std_logic_vector((rx_word_length*num_reqs)-1 downto 0);

  signal imux_data_out_accept,  imux_data_out_valid: std_logic;
  signal imux_data_out: std_logic_vector(rx_word_length-1 downto 0);
  
  --alias IBUFs: IntegerArray(num_reqs-1 downto 0) is input_buffering;
begin  -- Behave

  assert(tag_length >= Ceil_Log2(num_reqs)) report "insufficient tag width" severity error;
 
  kill_sig <= '0'; -- no killing!

  tagGen: for I in 0 to num_reqs-1 generate
	rx_tag_in(I) <= To_Unsigned(I,tag_length);	
  end generate tagGen;


  TstampGen: if time_stamp_width > 0 generate
	Tsb: block 
		signal time_stamp: std_logic_vector(time_stamp_width-1 downto 0);
	begin
		tsc: CounterBase generic map(data_width => time_stamp_width)
			port map(clk => clk, reset => reset, count_out => time_stamp);

		rxInDataGen: for I in 0 to num_reqs-1 generate
			rx_data_in(I) <= dataL(((I+1)*addr_width)-1 downto I*addr_width) & std_logic_vector(rx_tag_in(I)) & time_stamp;
		end generate rxInDataGen;
	end block Tsb;
  end generate TstampGen;

  NoTstampGen: if time_stamp_width < 1 generate
	rxInDataGen: for I in 0 to num_reqs-1 generate
		rx_data_in(I) <= dataL(((I+1)*addr_width)-1 downto I*addr_width) & std_logic_vector(rx_tag_in(I));
	end generate rxInDataGen;
  end generate NoTstampGen;

  -- receive buffers.
  RxGen: for I in 0 to num_reqs-1 generate
	rb: ReceiveBuffer generic map(name => name & " RxBuf " & Convert_To_String(I),
					buffer_size => input_buffering(I),
					data_width => rx_word_length,
					kill_counter_range => 655535)
		port map(write_req => reqL(I), 
			 write_ack => ackL(I), 
			 write_data => rx_data_in(I), 
			 read_req => imux_data_in_accept(I), 
			 read_ack => imux_data_in_valid(I), 
                         read_data => rx_data_out(I),
			 kill => kill_sig, 
			 clk => clk, 
			 reset => reset);

  end generate RxGen;

  -- 2D to 1D array conversion.
  process(rx_data_out)
  begin
	for I in 0 to num_reqs-1 loop
		imux_data_in(((I+1)*rx_word_length)-1 downto (I*rx_word_length))
			<= rx_data_out(I);
        end loop;
  end process;

  -- the multiplexor.
  NonTrivTstamp: if time_stamp_width > 0 generate
  	imux: merge_tree
    	   generic map(g_number_of_inputs => num_reqs,
		g_data_width => rx_word_length,
                g_time_stamp_width => time_stamp_width, 
                g_tag_width => tag_length,
		g_mux_degree => 4096, -- some large number.. allow big muxes.
		g_num_stages => 1,    -- with single stage delay 
		g_port_id_width => 0)
           port map(merge_data_in => imux_data_in,
	            merge_req_in  => imux_data_in_valid,
	            merge_ack_out => imux_data_in_accept,
	            merge_data_out => imux_data_out,
                    merge_req_out => imux_data_out_valid,
	            merge_ack_in  => imux_data_out_accept,
      	            clock        => clk,
      	            reset      => reset);
  end generate NonTrivTstamp;

  TrivTstamp: if time_stamp_width < 1 generate
	imux: LevelMux generic map (num_reqs => num_reqs, data_width => rx_word_length, no_arbitration => false)
		port map(write_req => imux_data_in_valid,
			 write_ack => imux_data_in_accept,
			 write_data => imux_data_in,
			 read_req => imux_data_out_accept,
		         read_ack => imux_data_out_valid,
			 read_data => imux_data_out,
			 clk => clk, reset => reset);
  end generate TrivTstamp;


  -- outgoing tag, address.
  mreq <= imux_data_out_valid;
  imux_data_out_accept <= mack;
  maddr <= imux_data_out(rx_word_length-1 downto (tag_length + time_stamp_width));
  mtag <= imux_data_out(tag_length+time_stamp_width-1 downto 0);
  

end Vanilla;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-- uses an aggressive pulse-to-level translation
-- that allows back-to-back transfers to an output
-- port.  The combinational paths are a bit longer
-- but cant have everything..
entity OutputPortFullRate is
  generic(name : string;
	  num_reqs: integer;
	  data_width: integer;
	  no_arbitration: boolean := false;
	  input_buffering: IntegerArray);
  port (
    sample_req        : in  BooleanArray(num_reqs-1 downto 0);
    sample_ack        : out BooleanArray(num_reqs-1 downto 0);
    update_req        : in  BooleanArray(num_reqs-1 downto 0);
    update_ack        : out BooleanArray(num_reqs-1 downto 0);
    data       : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : out std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
end entity;

architecture Base of OutputPortFullRate is

  signal reqR, ackR : std_logic_vector(num_reqs-1 downto 0);

  signal omux_data_in       : std_logic_vector((num_reqs*data_width)-1 downto 0);

  type   OPWArray is array(integer range <>) of std_logic_vector(data_width-1 downto 0);
  signal in_data_array, out_data_array : OPWArray(num_reqs-1 downto 0);
  
  constant input_buf_sizes: IntegerArray(num_reqs-1 downto 0) :=  input_buffering;

  signal zero_sig: std_logic;
begin

  zero_sig <= '0';

  -----------------------------------------------------------------------------
  -- protocol conversion
  -----------------------------------------------------------------------------
  BufGen : for I in 0 to num_reqs-1 generate
	
	in_data_array(I) <= data(((I+1)*data_width)-1 downto (I*data_width));

	rxB: PulseLevelPulseInterlockBuffer 
		generic map( name => name & " rxBuf " & Convert_To_String(I),
				buffer_size => input_buf_sizes(I),
				data_width => data_width)
		port map(write_req => sample_req(I),
		 write_ack => sample_ack(I),
		 write_data => in_data_array(I),
	         update_req => update_req(I),
		 update_ack => update_ack(I),
		 -- note: cross-over
		 read_enable =>  ackR(I),
		 has_data => reqR(I), 
	         read_data => out_data_array(I),	
		 clk => clk, reset => reset);

  end generate BufGen;

  process(out_data_array)
  begin
	for J in  0 to num_reqs-1 loop
		omux_data_in(((J+1)*data_width)-1 downto J*data_width) <= out_data_array(J);
	end loop;
  end process;


  mux : OutputPortLevel generic map (
    num_reqs       => num_reqs,
    data_width     => data_width,
    no_arbitration => no_arbitration)
    port map (
      req   => reqR,
      ack   => ackR,
      data  => omux_data_in,
      oreq  => oreq,
      oack  => oack,
      odata => odata,
      clk   => clk,
      reset => reset);
    

end Base;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

--
-- Assumptions: 
--  1.  at most one of the sample_req's is asserted at any time.
--  2.  between two successive sample-reqs, there must be a sample-ack.
--
entity PhiPipelined is
  generic (
    name       : string;
    num_reqs   : integer;
    buffering  : integer;
    data_width : integer);
  port (
    sample_req                 : in  BooleanArray(num_reqs-1 downto 0);
    sample_ack                 : out Boolean;
    update_req                 : in Boolean;
    update_ack                 : out Boolean;
    idata                      : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    odata                      : out std_logic_vector(data_width-1 downto 0);
    clk, reset                 : in std_logic);
end PhiPipelined;


-- a single interlock buffer which is written into by
-- one of num_reqs sources.
architecture Behave of PhiPipelined is

    signal ilb_write_data, mux_data_prereg, mux_data_reg: std_logic_vector(data_width-1 downto 0);
    signal ilb_write_req : boolean;

    signal sample_req_reg: BooleanArray(num_reqs-1 downto 0);
    signal clear_sample_reg: Boolean;
begin  -- Behave

  ilb: InterlockBuffer generic map(name => name & " ilb " ,
				buffer_size => buffering,
				in_data_width => data_width,
				out_data_width => data_width)
		port map(write_req => ilb_write_req,
			 write_ack => sample_ack,
			 write_data => ilb_write_data,
			 read_req => update_req,
			 read_ack => update_ack,
			 read_data => odata,
		         clk => clk,
		         reset => reset);		

  ilb_write_req <= OrReduce(sample_req);
  ilb_write_data <= mux_data_prereg when ilb_write_req  else mux_data_reg;

  -- mux with bypassed register.. to keep track of last word that was written
  -- in
  -- TODO: this is a bit expensive.. can we do better?
  process(clk,reset,sample_req,ilb_write_req,idata)
	variable mux_data : std_logic_vector(odata'length-1 downto 0);
  begin
     mux_data := MuxOneHot(idata,sample_req); 
     mux_data_prereg <= mux_data;
     if(clk'event and clk = '1') then
          mux_data_reg <= (others => '0');
     else
         if(ilb_write_req) then
            mux_data_reg <= mux_data;
	 end if;
     end if;
  end process;

end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-- 
--  An interlock with a write interface
--  triggered by a pulse protocol and completed
--  by a level-pulse protocol.  The read-interface
--  is partially regulated by a pulse protocol.
--
--  sample_req->sample_ack can be zero delay.
--  update_req->update_ack has unit delay.
--
entity PulseLevelPulseInterlockBuffer is
  generic (name : string; data_width: integer; buffer_size : integer);
  port( write_req : in boolean;
        write_ack : out boolean;
        write_data : in std_logic_vector(data_width-1 downto 0);
        update_req : in boolean;
        update_ack : out boolean;
        has_data    : out std_logic;
        read_enable : in std_logic;
        read_data : out std_logic_vector(data_width-1 downto 0);
        clk : in std_logic;
        reset : in std_logic);
end entity;

architecture Behave of PulseLevelPulseInterlockBuffer is
	signal zero_sig : std_logic;
	signal rx_has_data, rx_read_enable: std_logic;

	signal rx_read_data : std_logic_vector(data_width-1 downto 0);
	type UpdateFsmState is (idle, acking, waiting);
	signal update_fsm_state: UpdateFsmState;

begin  -- Behave

   zero_sig <= '0';


   read_data <= rx_read_data;

   Rxbuf: ReceiveBuffer generic map (name => name & " buffer ",
				data_width => data_width,
			 	buffer_size => buffer_size,
				kill_counter_range => 1)
		port map(write_req => write_req,
                         write_ack => write_ack,
			 write_data => write_data,
			 read_req => rx_read_enable,
			 read_ack => rx_has_data,
                         read_data => rx_read_data,
			 kill => zero_sig,
			 clk => clk, reset => reset);		


   process(clk,reset,update_fsm_state, update_req, rx_has_data, read_enable)
	variable nstate: UpdateFsmState;
	variable uackv : boolean;
   begin
	nstate := update_fsm_state;
	uackv := false;

	rx_read_enable <= '0';
	has_data <= '0';

        case update_fsm_state is
	   when idle | acking =>
		if(update_req) then
			 if (rx_has_data = '1') then  
				has_data <= '1';
				if (read_enable = '1') then
					rx_read_enable <= '1';
					nstate := acking;
				else
					nstate := waiting;
				end if;
			else
				nstate := waiting;
			end if;
		else
			nstate := idle;
		end if;
		if(update_fsm_state = acking) then
			uackv := true;
		end if;
	   when waiting => -- update-req has been seen, forward rx-has-data, wait until read_enable.
		has_data <= rx_has_data;
		if(read_enable = '1') then
			rx_read_enable <= '1';
			nstate := acking;
		end if;
	end case;
			
        update_ack <= uackv;

	if(clk'event and clk = '1') then
		if(reset = '1') then
			update_fsm_state <= idle;
		else
			update_fsm_state <= nstate;
		end if;
	end if;
   end process;

end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-- 
--  An interlock with a write interface
--  triggered by a pulse protocol and completed
--  by a level protocol.  The read-interface
--  is entirely regulated by a pulse protocol.
--
entity PulseToLevelHalfInterlockBuffer is
  generic (name : string; data_width: integer; buffer_size : integer);
  port( sample_req : in boolean;
        sample_ack : out boolean;
        has_room : out std_logic;
        write_enable : in  std_logic;
        write_data : in std_logic_vector(data_width-1 downto 0);
        update_req : in boolean;
        update_ack : out boolean;
        read_data : out std_logic_vector(data_width-1 downto 0);
        clk : in std_logic;
        reset : in std_logic);
end entity;

architecture Behave of PulseToLevelHalfInterlockBuffer is

  type SampleFsmState is (Idle, WaitForBuf, WaitForWrite);
  signal sample_fsm_state: SampleFsmState;

  signal buf_write, buf_has_room: std_logic;
begin  -- Behave

   buf: UnloadBuffer generic map (name => name & " buffer ",
				data_width => data_width,
			 	buffer_size => buffer_size)
		port map(write_req => buf_write,
                         write_ack => buf_has_room,
			 write_data => write_data,
			 unload_req => update_req,
			 unload_ack => update_ack,
                         read_data => read_data,
			 clk => clk, reset => reset);		


   -- Sample FSM.  sample_req/ack regulates sampling into buffer.
   process(clk,sample_fsm_state,reset,buf_has_room,write_enable,sample_req)
	variable nstate: SampleFsmState;
   begin
	nstate := sample_fsm_state;

	has_room <= '0';
	buf_write <= '0';
        sample_ack <= false;

	case sample_fsm_state is
		when Idle => 
			if(sample_req and (buf_has_room = '1')) then
				has_room <= '1';
				if (write_enable = '1') then
					buf_write <= '1';
					sample_ack <= true;
				else
					nstate := WaitForWrite;
				end if;
			elsif(sample_req and (buf_has_room = '0')) then
				nstate := WaitForBuf;
			end if;
		when WaitForBuf =>
			if(buf_has_room = '1') then
				has_room <= '1';
				if (write_enable = '1') then
					buf_write <= '1';
					sample_ack <= true;
					nstate := Idle;
				else
					nstate := WaitForWrite;
				end if;
			end if;
		when WaitForWrite =>
			has_room <= '1';
			if(write_enable = '1') then
				buf_write <= '1';
				sample_ack <= true;
				nstate := Idle;
			end if;
	end case;


	if(clk'event and clk = '1') then
		if(reset = '1') then
			sample_fsm_state <= Idle;
		else	
			sample_fsm_state <= nstate;
		end if;
	end if;
   end process;

end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

--
-- in pull_mode, rL/aL accepts data which is sent by rR/aR.
-- paths rL -> rR and aR -> aL  are 0-delay.
-- back-to-back transfers are permitted.
--
entity PulseToLevel is
  port( rL : in boolean;
        rR : out std_logic;
        aL : out boolean;
        aR : in std_logic;
        clk : in std_logic;
        reset : in std_logic);
end entity;

architecture Behave of PulseToLevel is
  type FsmState is (Idle,Waiting);
  signal fsm_state : FsmState;
begin  -- Behave

  process(clk, rL, aR, fsm_state, reset)
    variable nstate : FsmState;
  begin
    nstate := fsm_state;
    rR <= '0';
    aL <= false;

    case fsm_state is
        when Idle =>
          if(rL) then
		rR <= '1';
		if(aR = '1') then
			aL <= true;
		else
			nstate := Waiting;
		end if;
	  end if;
        when Waiting =>
	  rR <= '1';
          if(aR = '1') then
	    aL <= true;
            nstate := Idle;
          end if;
        when others => null;
    end case;

    if(clk'event and clk = '1') then
	if reset = '1' then
		fsm_state <= Idle;
	else
      		fsm_state <= nstate;
	end if;
    end if;
  end process;
end Behave;
-- TODO: add bypass path to the receive buffer.
--       this will reduce buffering requirements
--       by a factor of two (for full pipelining).
--
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity ReceiveBuffer  is
  generic (name: string; buffer_size: integer := 2; data_width : integer := 32; kill_counter_range: integer := 65535);
  port ( write_req: in boolean;
         write_ack: out boolean;
         write_data: in std_logic_vector(data_width-1 downto 0);
         read_req: in std_logic;
         read_ack: out std_logic;
	 kill      : in std_logic;
         read_data: out std_logic_vector(data_width-1 downto 0);
         clk : in std_logic;
         reset: in std_logic);
end ReceiveBuffer;

architecture default_arch of ReceiveBuffer is

  signal push_req, push_ack, pop_req, pop_ack: std_logic_vector(0 downto 0);
  signal pipe_data_in:  std_logic_vector(data_width-1 downto 0);


  signal kill_counter : integer range 0 to kill_counter_range;
  signal kill_counter_incr, kill_counter_decr: boolean;

  type RxBufFsmState is (idle, busy);
  signal fsm_state : RxBufFsmState;


  signal kill_active: boolean;

begin  -- default_arch

  -- the output pipe.
  bufPipe : PipeBase generic map (
    name =>  name & " fifo ",
    num_reads  => 1,
    num_writes => 1,
    data_width => data_width,
    lifo_mode  => false,
    depth      => buffer_size)
    port map (
      read_req   => pop_req,
      read_ack   => pop_ack,
      read_data  => read_data,
      write_req  => push_req,
      write_ack  => push_ack,
      write_data => write_data,
      clk        => clk,
      reset      => reset);
  read_ack <= pop_ack(0);
  pop_req(0) <= read_req;


  -- FSM
  process(clk,reset, write_req, push_ack,kill_active,kill)
	variable nstate : RxBufFsmState;
	variable pushreqv: std_logic;
	variable decr: boolean;
	variable wackv : boolean;
  begin
	decr := false; 
	wackv := false;
	pushreqv := '0'; 

	nstate := fsm_state;
	case fsm_state is
		when idle => 
			if(write_req and kill_active) then
				decr := true;
				wackv := true;	
			elsif(write_req and (not kill_active)) then
				pushreqv := '1';
				if(push_ack(0) = '1') then 
					wackv := true;
				else
					nstate := busy;	
				end if;
			end if;
		when busy => 
			if(kill_active) then
				decr := true;
				wackv := true;
				nstate := idle;
			else
				pushreqv := '1';
				if (push_ack(0) = '1') then
					nstate := idle;
					wackv := true;
				end if;
			end if;
	end case;

	push_req(0) <= pushreqv;
	write_ack <= wackv;
	kill_counter_decr <= decr;

	if(clk'event and clk = '1') then
		if(reset = '1') then
			fsm_state <= idle;
		else
			fsm_state <= nstate;
		end if;
	end if;
		
  end process;


  -- kill counter.
  kill_active <= (kill = '1') or (kill_counter > 0);
  kill_counter_incr <= (kill = '1');
  process(clk)
  begin
	if(clk'event and clk = '1') then
		if(reset = '1') then
			kill_counter <= 0;
		else
			if(kill_counter_decr and (not kill_counter_incr)) then
				kill_counter <= kill_counter - 1;
			elsif ((not kill_counter_decr) and kill_counter_incr) then
				kill_counter <= kill_counter + 1;
			end if;
		end if;
	end if;
  end process;

end default_arch;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;

entity SelectSplitProtocol is
  generic(name: string; 
	  data_width: integer; 
	  buffering: integer; 
	  flow_through: boolean := false);
  port(x,y: in std_logic_vector(data_width-1 downto 0);
       sel: in std_logic_vector(0 downto 0);
       z : out std_logic_vector(data_width-1 downto 0);
       sample_req: in boolean;
       sample_ack: out boolean;
       update_req: in boolean;
       update_ack: out boolean;
       clk,reset: in std_logic);
end SelectSplitProtocol;


architecture arch of SelectSplitProtocol is 
   signal ilb_data_in: std_logic_vector(data_width-1 downto 0);
begin
     ilb_data_in <=  x when (sel(0) = '1') else y;

     noFlowThrough: if (not flow_through) generate
    	ilb: InterlockBuffer 
		generic map(name => name & " ilb ",
				buffer_size => buffering,
				in_data_width => data_width,
				out_data_width => data_width)
		port map(write_req => sample_req,
			 write_ack => sample_ack,
			 write_data => ilb_data_in,
			 read_req  => update_req,
			 read_ack => update_ack,
			 read_data => z,
			 clk => clk, reset => reset);
     end generate noFlowThrough;

	-- like a combinational circuit..
	-- the control path must worry about all
	-- sequencing issues.
     flowThrough: if (flow_through) generate
	z <= ilb_data_in;
    	sample_ack <= sample_req;
    	update_ack <= update_req;

     end generate flowThrough;
end arch;

library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;

-- a simple slicing element.
entity SliceSplitProtocol is
  generic(name: string; 
	in_data_width : integer; 
	high_index: integer; 
	low_index : integer; 
	buffering : integer;
	flow_through: boolean := false
	);
  port(din: in std_logic_vector(in_data_width-1 downto 0);
       dout: out std_logic_vector(high_index-low_index downto 0);
       sample_req: in boolean;
       sample_ack: out boolean;
       update_req: in boolean;
       update_ack: out boolean;
       clk,reset: in std_logic);
end SliceSplitProtocol;


architecture arch of SliceSplitProtocol is
   signal ilb_data_in: std_logic_vector(high_index-low_index downto 0);
begin

  assert ((high_index < in_data_width) and (low_index >= 0) and (high_index >= low_index))
    report "inconsistent slice parameters" severity failure;
  
  noFlowThrough: if (not flow_through) generate

    ilb_data_in <= din(high_index downto low_index);
    ilb: InterlockBuffer 
		generic map(name => name & " ilb ",
				buffer_size => buffering,
				in_data_width => (high_index - low_index) + 1,
				out_data_width => (high_index - low_index) + 1)
		port map(write_req => sample_req,
			 write_ack => sample_ack,
			 write_data => ilb_data_in,
			 read_req  => update_req,
			 read_ack => update_ack,
			 read_data => dout,
			 clk => clk, reset => reset);

  end generate noFlowThrough;

  flowThrough: if flow_through generate
    dout <= din(high_index downto low_index);
    sample_ack <= sample_req;
    update_ack <= update_req;
  end generate flowThrough;
  
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;


-- a guard-interface to conform with the split protocol.
-- With this interface, the guard at the time of initiation
-- of the operation will be remembered (using a queue) 
-- and the remembered value will be used to generate the
-- completion protocol.
-- 
-- The benefit is that the guard-expression can be reevaluated
-- as soon as the operation starts (instead of waiting
-- for the operation to finish...).  This helps pipelining.
-- TODO: QueueBase can be replaced with a simpler shift-stage?
--       (maybe not.., because this slows down the guard=0 case).
entity SplitGuardInterfaceBase is
	generic (buffering:integer);
	port (sr_in: in Boolean;
	      sa_out: out Boolean;
	      sr_out: out Boolean;
	      sa_in: in Boolean;
	      cr_in: in Boolean;
	      ca_out: out Boolean;
	      cr_out: out Boolean;
	      ca_in: in Boolean;
	      guard_interface: in std_logic;
	      clk: in std_logic;
	      reset: in std_logic);
end entity;


architecture Behave of SplitGuardInterfaceBase is
  signal push, push_ack, pop, pop_ack: std_logic;
  signal qdata_in, qdata : std_logic_vector(0 downto 0);

  type LhsState is (l_Idle, l_Wait_On_Ack_In, l_Wait_On_Queue);
  signal lhs_state : LhsState;

  type RhsState is (r_Idle, r_Wait_On_Ack_In, r_Wait_On_Queue);
  signal rhs_state: RhsState;

  -- for debug purposes only
  signal s_counter, c_counter: integer;

  signal ca_out_d, ca_out_u: Boolean;
begin
	ca_out <= ca_out_d or ca_out_u;

	qdata_in(0) <= guard_interface;

	qI: QueueBase
		generic map(queue_depth => buffering, data_width => 1)
		port map(clk => clk, reset => reset,
				data_in => qdata_in,
				push_req => push,
				push_ack => push_ack,
				data_out => qdata,
				pop_req => pop,
				pop_ack => pop_ack);

	-- LHS state machine.
        -- 
	------------------------------------------------------------------------------------------
        --   Present-state  sr_in  push_ack guard_interface sa_in    Nstate  sr_out  sa_out  push
	------------------------------------------------------------------------------------------
        --     l_Idle        0        _          _            _      l_Idle
 	--     l_Idle        1        1          0            _      l_Idle            1      1
	--     l_Idle        1        1          1            0      W-ack-in  1              1
	--     l_Idle        1        1          1            1      l_Idle    1       1      1
	--     l_Idle        1        0          _            _      W-Queue   
	------------------------------------------------------------------------------------------
        --   Present-state  sr_in  push_ack guard_interface sa_in    Nstate  sr_out  sa_out  push
	------------------------------------------------------------------------------------------
	--     W-Queue       _        0          _            _      W-Queue
	--     W-Queue       _        1          1            1      l_Idle    1       1      1
	--     W-Queue       _        1          1            0      W-ack-in  1              1
	--     W-Queue       _        1          0            _      l_Idle            1      1
	------------------------------------------------------------------------------------------
        --   Present-state  sr_in  push_ack guard_interface sa_in    Nstate  sr_out  sa_out  push
	------------------------------------------------------------------------------------------
	--     W-Ack-In      _        _          _            0      W-ack-in
	--     W-Ack-In      _        _          _            1      l_Idle            1
	------------------------------------------------------------------------------------------
	process(clk, sr_in, push_ack, guard_interface, sa_in, lhs_state, reset)
		variable nstate : LhsState;
		variable next_s_counter: integer;
	begin
		nstate 	:= lhs_state;
		sr_out 	<= false;
		sa_out 	<= false;
		push	<= '0';
 		next_s_counter := s_counter;

		case lhs_state is
			when l_Idle => 
				if sr_in then
					if((push_ack = '1') and (guard_interface = '0')) then
						sa_out <= true;
						push   <= '1';
					elsif ((push_ack = '1') and (guard_interface = '1')) then
						if sa_in then
							sa_out 	<= true;
							sr_out 	<= true;
							next_s_counter := (next_s_counter + 1);
							push 	<= '1';
						else	
							nstate 	:= l_Wait_On_Ack_In;
							sr_out 	<= true;
							next_s_counter := (next_s_counter + 1);
							push 	<= '1';
						end if;
					elsif (push_ack = '0') then
						nstate := l_Wait_On_Queue;
					end if;
				end if;
			when l_Wait_On_Queue => 
				if(push_ack  = '1') then
					if((guard_interface = '1') and sa_in) then
						nstate := l_Idle;
						sa_out <= true;
						sr_out <= true;
						next_s_counter := (next_s_counter + 1);
						push <= '1';
					elsif ((guard_interface = '1') and (not sa_in)) then
						nstate := l_Wait_On_Ack_In;
						sr_out <= true;
						next_s_counter := (next_s_counter + 1);
						push   <= '1';
					elsif (guard_interface = '0') then
						nstate := l_Idle;
						sa_out <= true;
						push <= '1';
					end if;
				end if;
			when l_Wait_On_Ack_In => 
				if sa_in then
					nstate := l_Idle;
					sa_out <= true;
				end if;
		end case;

		if(clk'event and clk = '1') then
			if(reset = '1') then
				lhs_state <= l_Idle;
				s_counter <= 0;
			else
				lhs_state <= nstate;
				s_counter <= next_s_counter;
			end if;
		end if;
	end process;


	-- RHS State machine.
	------------------------------------------------------------------------------------------
        --   Present-state  cr_in  pop_ack      qdata        ca_in    Nstate  cr_out  ca_out  pop
	------------------------------------------------------------------------------------------
	--   r_Idle          0        _           _            _      r_Idle
	--   r_Idle          1        0           _            _      W-Queue
	--   r_Idle          1        1           1            _      W-Ack-In  1              1
	--   r_Idle          1        1           0            _      r_Idle           1d      1
	------------------------------------------------------------------------------------------
        --   Present-state  cr_in  pop_ack      qdata        ca_in    Nstate  cr_out  ca_out  pop
	------------------------------------------------------------------------------------------
	--   W-Queue         _        0           _            _      W-Queue
	--   W-Queue         _        1           1            _      W-Ack-In  1              1
	--   W-Queue         0        1           0            _      r_Idle           1       1
	--   W-Queue         1        1           0            _      W-Queue          1       1
	------------------------------------------------------------------------------------------
        --   Present-state  cr_in  pop_ack      qdata        ca_in    Nstate  cr_out  ca_out  pop
	------------------------------------------------------------------------------------------
	--   W-Ack-In        _        _           _            0      W-Ack-In  
	--   W-Ack-In        1        1           1            1      W-Ack-In  1       1      1
	--   W-Ack-In        1        1           0            1      r_Idle            1,1d   1
	--   W-Ack-In        1        0           _            1      W-Queue           1
	--   W-Ack-In        0        _           _            1      r_Idle            1  
	------------------------------------------------------------------------------------------
	process(clk,cr_in,pop_ack,qdata,ca_in,rhs_state,reset)
		variable nstate : RhsState;
		variable ca_out_u_var : Boolean;
		variable ca_out_d_var : Boolean;
		variable next_c_counter: integer;
	begin
		nstate := rhs_state;
		pop <= '0';
		cr_out <= false;
		ca_out_u_var := false;
		ca_out_d_var := false;
		next_c_counter := c_counter;

		case rhs_state is
			when r_Idle =>
				if cr_in then
					if(pop_ack = '0') then
						nstate := r_Wait_On_Queue;			
					else
						pop <= '1';
						if(qdata(0) = '1') then
							nstate := r_Wait_On_Ack_In;
							cr_out <= true;
							next_c_counter := (next_c_counter + 1);
						else
							ca_out_d_var := true;
							nstate := r_Idle;
						end if;
					end if;
				end if;
			when r_Wait_On_Queue =>
				if(pop_ack = '1') then
					pop <= '1';
					if(qdata(0) = '1') then
						nstate := r_Wait_On_Ack_In;
						cr_out <= true;
						next_c_counter := (next_c_counter + 1);
					else
						ca_out_u_var := true;
						if(cr_in) then
							nstate := r_Wait_On_Queue;
						else
							nstate := r_Idle;
						end if;
					end if;
				end if;
			when r_Wait_On_Ack_In =>
				if(ca_in) then 
					if(cr_in  and (pop_ack = '1') and (qdata(0) = '1')) then
						ca_out_u_var := true;
						pop <= '1';
						cr_out <= true;
						next_c_counter := (next_c_counter + 1);
					elsif(cr_in and (pop_ack = '1') and (qdata(0) = '0')) then
						nstate := r_Idle;
						ca_out_d_var := true;
						ca_out_u_var := true;
						pop <= '1';
					elsif(cr_in and (pop_ack = '0')) then
						nstate := r_Wait_On_Queue;
						ca_out_u_var := true;	
					elsif(not cr_in) then
						nstate := r_Idle;
						ca_out_u_var := true;
					end if;
				end if;
		end case;

		ca_out_u <= ca_out_u_var;

		if(clk'event and clk = '1') then
			if(reset = '1') then
				rhs_state <= r_Idle;
				ca_out_d <= false;
				c_counter <= 0;
			else
				ca_out_d <= ca_out_d_var;
				rhs_state <= nstate;
				c_counter <= next_c_counter;
			end if;
		end if;
	end process;

end Behave;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity SplitGuardInterface is
	generic (nreqs: integer; buffering:IntegerArray; use_guards: BooleanArray);
	port (sr_in: in BooleanArray(nreqs-1 downto 0);
	      sa_out: out BooleanArray(nreqs-1 downto 0); 
	      sr_out: out BooleanArray(nreqs-1 downto 0);
	      sa_in: in BooleanArray(nreqs-1 downto 0); 
	      cr_in: in BooleanArray(nreqs-1 downto 0);
	      ca_out: out BooleanArray(nreqs-1 downto 0); 
	      cr_out: out BooleanArray(nreqs-1 downto 0);
	      ca_in: in BooleanArray(nreqs-1 downto 0); 
	      guards: in std_logic_vector(nreqs-1 downto 0);
	      clk: in std_logic;
	      reset: in std_logic);
end entity;


architecture Behave of SplitGuardInterface is
	constant gFlags: BooleanArray(nreqs-1 downto 0) := use_guards;
	constant gBufs: IntegerArray(nreqs-1 downto 0) := buffering;
begin
	BaseGen: for I in nreqs-1 downto 0 generate

	     gCase: if gFlags(I) generate
		sgi: SplitGuardInterfaceBase
			generic map (buffering => gBufs(I))
			port map(sr_in => sr_in(I),
				 sr_out => sr_out(I),
				 sa_in => sa_in(I),
				 sa_out => sa_out(I),
				 cr_in => cr_in(I),
				 cr_out => cr_out(I),
				 ca_in => ca_in(I),
				 ca_out => ca_out(I),
				 guard_interface => guards(I),
				 clk => clk, reset => reset);
              end generate gCase;
	   
 	      noG: if not gFlags(I) generate
		 sr_out(I) <= sr_in(I);
		 sa_out(I) <= sa_in(I);
		 cr_out(I) <= cr_in(I);
		 ca_out(I) <= ca_in(I);
              end generate noG;
        end generate;

end Behave;
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-- brief description:
--  as the name indicates, a squash-shift-register
--  provides an implementation of a pipeline.
entity SquashShiftRegister is
  generic (name : string;
	   data_width: integer;
           depth: integer := 1);
  port (
    read_req       : in  std_logic;
    read_ack       : out std_logic;
    read_data      : out std_logic_vector(data_width-1 downto 0);
    write_req       : in  std_logic;
    write_ack       : out std_logic;
    write_data      : in std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
  
end SquashShiftRegister;

architecture default_arch of SquashShiftRegister is

  signal stage_full: std_logic_vector(0 to depth);

  type SSRArray is array (natural range <>) of std_logic_vector(data_width-1 downto 0);
  signal stage_data : SSRArray(0 to depth);
  
begin  -- default_arch

    -- shift-right if there is a bubble 
    -- anywhere in the shift-register,
    -- and if the write-signal is active.
    --
    -- stall stage I if I+1 is not ready to
    -- accept.
    -- etc.. etc..  TODO.

end default_arch;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;
use ahir.mem_component_pack.all;

entity StoreReqSharedWithInputBuffers is
    generic
    (
	name : string;
	addr_width: integer;
	data_width : integer;
	time_stamp_width : integer;
      	num_reqs : integer; -- how many requesters?
	tag_length: integer;
	no_arbitration: Boolean := false;
        min_clock_period: Boolean := true;
	input_buffering: IntegerArray
    );
  port (
    -- req/ack follow pulse protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    -- address corresponding to access
    addr                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
    data                    : in std_logic_vector((data_width*num_reqs)-1 downto 0);
    -- address to memory
    maddr                   : out std_logic_vector(addr_width-1 downto 0);
    mdata                   : out std_logic_vector(data_width-1 downto 0);
    mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);
    mreq                    : out std_logic;
    mack                    : in std_logic;
    -- clock, reset (active high)
    clk, reset              : in std_logic);
end StoreReqSharedWithInputBuffers;

architecture Vanilla of StoreReqSharedWithInputBuffers is

  constant iwidth: integer := addr_width*num_reqs;
  constant owidth: integer := addr_width;

  constant debug_flag : boolean := false;

  -- must register..  ack implies that address has been sampled.
  constant registered_output : boolean := true; 

  type TagWordArray is array (natural range <>) of unsigned(tag_length-1 downto 0);
  signal rx_tag_in: TagWordArray(num_reqs-1 downto 0);

  constant rx_word_length: integer := addr_width + data_width + tag_length + time_stamp_width;
  type RxBufWordArray is array (natural range <>) of std_logic_vector(rx_word_length-1 downto 0);

  signal rx_data_in, rx_data_out : RxBufWordArray(num_reqs-1 downto 0);
  signal kill_sig : std_logic;

  signal imux_data_in_accept,  imux_data_in_valid: std_logic_vector(num_reqs-1 downto 0);
  signal imux_data_in: std_logic_vector((rx_word_length*num_reqs)-1 downto 0);

  signal imux_data_out_accept,  imux_data_out_valid: std_logic;
  signal imux_data_out: std_logic_vector(rx_word_length-1 downto 0);
  
  -- alias IBUFs: IntegerArray(num_reqs-1 downto 0) is input_buffering;
begin  -- Behave
  assert(tag_length >= Ceil_Log2(num_reqs)) report "insufficient tag width" severity error;
 
  kill_sig <= '0'; -- no killing!

  tagGen: for I in 0 to num_reqs-1 generate
	rx_tag_in(I) <= To_Unsigned(I,tag_length);	
  end generate tagGen;


  TstampGen: if time_stamp_width > 0 generate
	Tsb: block 
		signal time_stamp: std_logic_vector(time_stamp_width-1 downto 0);
	begin
		tsc: CounterBase generic map(data_width => time_stamp_width)
			port map(clk => clk, reset => reset, count_out => time_stamp);

		rxInDataGen: for I in 0 to num_reqs-1 generate
			rx_data_in(I) <= addr(((I+1)*addr_width)-1 downto I*addr_width) &
					 data(((I+1)*data_width)-1 downto I*data_width)  &  std_logic_vector(rx_tag_in(I)) & time_stamp;
		end generate rxInDataGen;
	end block Tsb;
  end generate TstampGen;

  NoTstampGen: if time_stamp_width < 1 generate
	rxInDataGen: for I in 0 to num_reqs-1 generate
		rx_data_in(I) <= addr(((I+1)*addr_width)-1 downto I*addr_width)  &
					 data(((I+1)*data_width)-1 downto I*data_width) & std_logic_vector(rx_tag_in(I));
	end generate rxInDataGen;
  end generate NoTstampGen;

  -- receive buffers.
  RxGen: for I in 0 to num_reqs-1 generate
	rb: ReceiveBuffer generic map(name => name & " RxBuf " & Convert_To_String(I),
					buffer_size => input_buffering(I),
					data_width => rx_word_length,
					kill_counter_range => 655535)
		port map(write_req => reqL(I), 
			 write_ack => ackL(I), 
			 write_data => rx_data_in(I), 
			 read_req => imux_data_in_accept(I), 
			 read_ack => imux_data_in_valid(I), 
                         read_data => rx_data_out(I),
			 kill => kill_sig, 
			 clk => clk, 
			 reset => reset);

  end generate RxGen;

  -- data for input mux.
  process(rx_data_out)
  begin
	for I in 0 to num_reqs-1 loop
		imux_data_in(((I+1)*rx_word_length)-1 downto (I*rx_word_length))
			<= rx_data_out(I);
	end loop;
  end process;

  -- the multiplexor.
  NonTrivTstamp: if time_stamp_width > 0 generate
  	imux: merge_tree
    	   generic map(g_number_of_inputs => num_reqs,
		g_data_width => rx_word_length,
                g_time_stamp_width => time_stamp_width, 
                g_tag_width => tag_length,
		g_mux_degree => 4096, -- some large number.. allow big muxes.
		g_num_stages => 1,    -- with single stage delay 
		g_port_id_width => 0)
           port map(merge_data_in => imux_data_in,
	            merge_req_in  => imux_data_in_valid,
	            merge_ack_out => imux_data_in_accept,
	            merge_data_out => imux_data_out,
                    merge_req_out => imux_data_out_valid,
	            merge_ack_in  => imux_data_out_accept,
      	            clock        => clk,
      	            reset      => reset);
  end generate NonTrivTstamp;

  TrivTstamp: if time_stamp_width < 1 generate
	imux: LevelMux generic map (num_reqs => num_reqs, data_width => rx_word_length, no_arbitration => false)
		port map(write_req => imux_data_in_valid,
			 write_ack => imux_data_in_accept,
			 write_data => imux_data_in,
			 read_req => imux_data_out_accept,
		         read_ack => imux_data_out_valid,
			 read_data => imux_data_out,
			 clk => clk, reset => reset);
  end generate TrivTstamp;


  -- outgoing tag, address, data
  mreq <= imux_data_out_valid;
  imux_data_out_accept <= mack;
  maddr <= imux_data_out(rx_word_length-1 downto (data_width + tag_length + time_stamp_width));
  mdata <= imux_data_out((rx_word_length - addr_width)-1 downto (tag_length + time_stamp_width));
  mtag <= imux_data_out(tag_length+time_stamp_width-1 downto 0);

end Vanilla;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-- 
--  whatever appears at in_data is
--  read by whoever wishes to read it.
--
--
entity SystemInPort is
   generic (name : string;
	    num_reads: integer;
	    in_data_width: integer;
            out_data_width : integer); 
   port (read_req : in std_logic_vector(0 downto 0);
         read_ack : out std_logic_vector(0 downto 0);
         read_data: out std_logic_vector(out_data_width-1 downto 0);
         in_data  : in std_logic_vector(in_data_width-1 downto 0);
	 clk : in std_logic;
	 reset : in std_logic);
end entity;

architecture Mixed of SystemInPort is
    signal data_reg: std_logic_vector(in_data_width-1 downto 0);
begin
    read_ack <= (others => '1');

    process(clk)
    begin
	if(clk'event and clk = '1') then
		if(reset = '1') then
			data_reg <= (others => '0');
		else
			data_reg <= in_data;
		end if;
	end if;
    end process;

    TruncateOrPad(data_reg, read_data); 
end Mixed;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

--
-- Last successful write wins.
--
entity SystemOutPort is
   generic (name : string;
	    num_writes: integer;
	    in_data_width: integer;
            out_data_width : integer); 
   port (write_req : in std_logic_vector(0 downto 0);
         write_ack : out std_logic_vector(0 downto 0);
         write_data: in std_logic_vector(in_data_width-1 downto 0);
         out_data  : out std_logic_vector(out_data_width-1 downto 0);
	 clk : in std_logic;
	 reset : in std_logic);
end entity;

architecture Mixed of SystemOutPort is
    signal read_req, read_ack: std_logic_vector(0 downto 0);
    signal pipe_data_in, pipe_data_out: std_logic_vector(out_data_width-1 downto 0);
    
begin

    TruncateOrPad(write_data,pipe_data_in);
    read_req(0) <= '1';

    process(clk)
    begin
	if(clk'event and clk = '1') then
		if(read_ack(0) = '1') then
			out_data <= pipe_data_out;
		end if;
	end if;
    end process;

    opipe: PipeBase generic map(name => name & " opipe", num_reads => 1,
					num_writes => num_writes, data_width => out_data_width,
						lifo_mode => false, depth => 1)
		port map(read_req => read_req, read_ack => read_ack,
				read_data => pipe_data_out,
					write_req => write_req, write_ack => write_ack,
						write_data => pipe_data_in,
							clk => clk, reset => reset);

end Mixed;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

--
-- output = op input 
--
-- constant input is not permitted.
-- 
entity UnarySharedOperator is
    generic
    (
      name : string;
      operator_id   : string := "ApIntNot";          -- operator id
      input_is_int : Boolean := true; -- false means float
      input_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_width      : integer := 4;    -- width of input1
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer := 4;          -- width of output.
      num_reqs : integer := 3; -- how many requesters?
      detailed_buffering_per_output : IntegerArray
    );
  port (
    -- input side.
    sample_req                     : in BooleanArray(num_reqs-1 downto 0);
    sample_ack                     : out BooleanArray(num_reqs-1 downto 0);
    -- output side.
    update_ack                     : out BooleanArray(num_reqs-1 downto 0);
    update_req                     : in  BooleanArray(num_reqs-1 downto 0);
    -- input data consists of concatenated pairs of ips
    data_in                     : in std_logic_vector((input_width*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    data_out                    : out std_logic_vector((output_width*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset                  : in std_logic);
end UnarySharedOperator;

architecture Vanilla of UnarySharedOperator is

  signal reqL, ackL: BooleanArray(num_reqs-1 downto 0);


  signal dataL : std_logic_vector((num_reqs*input_width)-1 downto 0);

  constant tag_length: integer := Maximum(1,Ceil_Log2(num_reqs));

  constant debug_flag : boolean := false;

  constant inbuf: IntegerArray(0 downto 0) := (0 => 0);
  
begin  -- Behave

  reqL <= sample_req;
  sample_ack <= ackL;
  dataL <= data_in;

  sor: SplitOperatorShared 
    	generic map
    		(
      			name => name & " split-operator-shared ",
      			operator_id   => operator_id,
      			input1_is_int => input_is_int,
      			input1_characteristic_width => input_characteristic_width,
      			input1_mantissa_width => input_mantissa_width,
      			iwidth_1 => input_width,
      			input2_is_int => false,
      			input2_characteristic_width => 0,
      			input2_mantissa_width => 0,
      			iwidth_2     => 0,
      			num_inputs   => 1,
      			output_is_int => output_is_int,
      			output_characteristic_width => output_characteristic_width,
      			output_mantissa_width => output_mantissa_width,
      			owidth        => output_width,
      			constant_operand => (0 => '0'),
      			constant_width => 1,
      			use_constant  => false,
      			no_arbitration => false,
      			min_clock_period => true,
      			num_reqs => num_reqs,
			use_input_buffering => false,
			detailed_buffering_per_input => inbuf,
      			detailed_buffering_per_output => detailed_buffering_per_output)
  		port map (
    				reqL => reqL,
    				ackR => update_ack,
    				ackL => ackL,
    				reqR => update_req,
    				dataL => dataL,
    				dataR => data_out,
    				clk => clk, reset => reset);
end Vanilla;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.standard.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
use ahir.FloatOperatorPackage.all;

--
--  result = op input_1
--
entity UnaryUnsharedOperator is
  generic
    (
      name          : string;          -- instance name.
      operator_id   : string;          -- operator id
      input_is_int : Boolean := true; -- false means float
      input_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_width        : integer;    -- width of input1
      input_is_constant  : boolean; 
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer;          -- width of output.
      output_buffering : integer := 2
      );
  port (
    -- req -> ack follow pulse protocol
    sample_req:  in Boolean;
    sample_ack:  out Boolean;
    update_req:  in Boolean;
    update_ack:  out Boolean;
    -- operands.
    dataL      : in  std_logic_vector(input_width - 1 downto 0);
    dataR      : out std_logic_vector(output_width-1 downto 0);
    clk, reset : in  std_logic);
end UnaryUnsharedOperator;


architecture Vanilla of UnaryUnsharedOperator is
  signal  result: std_logic_vector(output_width-1 downto 0);
  signal ub_write_req, ub_write_ack: boolean;
begin  -- Behave
  -----------------------------------------------------------------------------
  -- combinational block.. this is ever-active!
  -----------------------------------------------------------------------------
  comb_block: GenericCombinationalOperator
    generic map (
      operator_id                 => operator_id,
      input1_is_int               => input_is_int,
      input1_characteristic_width => input_characteristic_width,
      input1_mantissa_width       => input_mantissa_width,
      iwidth_1                    => input_width,
      input2_is_int               => true,
      input2_characteristic_width => 0,
      input2_mantissa_width       => 0,
      iwidth_2                    => 0,
      num_inputs                  => 1,
      output_is_int               => output_is_int,
      output_characteristic_width => output_characteristic_width,
      output_mantissa_width       => output_mantissa_width,
      owidth                      => output_width,
      constant_operand            => (0 => '0'),
      constant_width              => 1,
      use_constant                => false)
    port map (data_in => dataL, result  => result);


  nonConst: if not input_is_constant generate
    -----------------------------------------------------------------------------
    -- interlock buffer.
    -----------------------------------------------------------------------------
    ib: InterlockBuffer generic map (name => name & " interlock-buffer ",
					  buffer_size => output_buffering,
					  in_data_width => output_width,
					  out_data_width => output_width)
		  port map(write_req => sample_req, write_ack => sample_ack,
				  write_data => result,
				  read_req => update_req,
				  read_ack => update_ack,
				  read_data => dataR,
				  clk => clk, reset => reset);
  end generate nonConst; 

  constCase: if input_is_constant generate
	dataR <= result;
	update_ack <= update_req;
  end generate constCase;

end Vanilla;

-- TODO: add bypass generic to create a flow-through
--       trivial operator (to save clock-cycles!)
--
-- The unshared operator uses a split protocol.
--    reqL/ackL  for sampling the inputs
--    reqR/ackR  for updating the outputs.
-- The two pairs should be used independently,
-- that is, there should be NO DEPENDENCY between
-- ackL and reqR!
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
use ahir.FloatOperatorPackage.all;

entity UnsharedOperatorWithBuffering is
  generic
    (
      name   : string;
      operator_id   : string;          -- operator id
      input1_is_int : Boolean := true; -- false means float
      input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      iwidth_1      : integer;    -- width of input1
      input2_is_int : Boolean := true; -- false means float
      input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      iwidth_2      : integer;    -- width of input2
      num_inputs    : integer := 2;    -- can be 1 or 2.
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      owidth        : integer;          -- width of output.
      constant_operand : std_logic_vector; -- constant operand.. (it is always the second operand)
      constant_width : integer;
      buffering      : integer;
      use_constant  : boolean := false;
      flow_through  : boolean := false
      );
  port (
    -- req -> ack follow pulse protocol
    reqL:  in Boolean;
    ackL : out Boolean;
    reqR : in Boolean;
    ackR:  out Boolean;
    -- operands.
    dataL      : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
    dataR      : out std_logic_vector(owidth-1 downto 0);
    clk, reset : in  std_logic);
end UnsharedOperatorWithBuffering;


architecture Vanilla of UnsharedOperatorWithBuffering is
  signal   result: std_logic_vector(owidth-1 downto 0);
  constant iwidth : integer := iwidth_1  + iwidth_2;
  
  -- joined req, and joint ack.
  signal fReq,fAck: boolean;
 

begin  -- Behave

  assert((num_inputs = 1) or (num_inputs = 2)) report "either 1 or 2 inputs" severity failure;
  -----------------------------------------------------------------------------
  -- combinational block..
  -----------------------------------------------------------------------------
  comb_block: GenericCombinationalOperator
    generic map (
      operator_id                 => operator_id,
      input1_is_int               => input1_is_int,
      input1_characteristic_width => input1_characteristic_width,
      input1_mantissa_width       => input1_mantissa_width,
      iwidth_1                    => iwidth_1,
      input2_is_int               => input2_is_int,
      input2_characteristic_width => input2_characteristic_width,
      input2_mantissa_width       => input2_mantissa_width,
      iwidth_2                    => iwidth_2,
      num_inputs                  => num_inputs,
      output_is_int               => output_is_int,
      output_characteristic_width => output_characteristic_width,
      output_mantissa_width       => output_mantissa_width,
      owidth                      => owidth,
      constant_operand            => constant_operand,
      constant_width              => constant_width,
      use_constant                => use_constant)
    port map (data_in => dataL, result  => result);


  noFlowThrough: if not flow_through generate
    -----------------------------------------------------------------------------
    -- output interlock buffer
    -----------------------------------------------------------------------------
    ilb: InterlockBuffer 
	  generic map(name => name & " ilb ",
			  buffer_size => buffering,
			  in_data_width => owidth,
			  out_data_width => owidth)
	  port map(write_req => reqL, write_ack => ackL, write_data => result,
			  read_req => reqR, read_ack => ackR, read_data => dataR,
				  clk => clk, reset => reset);
  end generate noFlowThrough;

  flowThrough: if flow_through generate
		-- in the flow-through case, the operator looks just like
		-- a combinational circuit.  
                -- NOTE that there is no bypass register for the data.
                -- Control sequencing must be handled entirely by the
		-- control-path which uses this operator.

		ackL <= reqL;
		ackR <= reqR;
		dataR <= result;

  end generate flowThrough;

end Vanilla;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.BaseComponents.all;


entity countDownTimer is -- 
    generic (tag_length : integer);
    port ( -- 
      time_count : in  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity countDownTimer;

architecture Behave of countDownTimer is
	type TimerState is (idle, busy, done);
	signal tstate : TimerState;
	signal count_sig : unsigned(31 downto 0);
	signal tag_reg: std_logic_vector(tag_length-1 downto 0);
begin

	process(clk,reset,tstate,count_sig,start_req,fin_req,tag_in)
		variable next_state: TimerState;
		variable latch_var, decr_count, latch_otag: boolean;
	begin
		next_state := tstate;

		start_ack <= '0';
		fin_ack <= '0';

		latch_var := false;
		decr_count := false;
		latch_otag := false;

		case tstate is 
			when idle =>
				start_ack <= '1';
				if(start_req = '1') then
					next_state := busy;
					latch_var  := true;
				end if;
			when busy =>
				decr_count := true;
				if(count_sig = 0) then
					next_state := done;
					latch_otag := true;
				end if;
			when done =>
				fin_ack <= '1';
				if(fin_req = '1') then
					next_state := idle;
				end if;
			when others =>
		end case;
		if(clk'event  and clk = '1') then
			if(reset = '1') then
				tstate <= idle;
			else
				tstate <= next_state;	
			end if;

			if(latch_var) then
				count_sig <= unsigned(time_count);
				tag_reg <= tag_in;
			elsif(decr_count) then
				count_sig <= count_sig - 1;
			end if;

			if(latch_otag) then
				tag_out <= tag_reg;	
			end if;
		end if;
	end process;

end Behave;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;


entity fpadd32 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(31 downto 0);
      R : in  std_logic_vector(31 downto 0);
      ret_val_x_x : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpadd32;

architecture Struct of fpadd32 is
begin

   adder: GenericFloatingPointAdderSubtractor
		generic map(tag_width => tag_length,
				exponent_width => 8,
				fraction_width => 23,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true,
				use_as_subtractor => false)
		port map(INA => L, INB => R,
				OUTADD => ret_val_x_x,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => tag_out,
				env_rdy => start_req, accept_rdy => fin_req,
				addi_rdy => start_ack, addo_rdy => fin_ack);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;


entity fpadd64 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(63 downto 0);
      R : in  std_logic_vector(63 downto 0);
      ret_val_x_x : out  std_logic_vector(63 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpadd64;

architecture Struct of fpadd64 is
begin

   adder: GenericFloatingPointAdderSubtractor
		generic map(tag_width => tag_length,
				exponent_width => 11,
				fraction_width => 52,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true,
				use_as_subtractor => false)
		port map(INA => L, INB => R,
				OUTADD => ret_val_x_x,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => tag_out,
				env_rdy => start_req, accept_rdy => fin_req,
				addi_rdy => start_ack, addo_rdy => fin_ack);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;


entity fpmul32 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(31 downto 0);
      R : in  std_logic_vector(31 downto 0);
      ret_val_x_x : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpmul32;

architecture Struct of fpmul32 is
begin

   mul: GenericFloatingPointMultiplier
		generic map(tag_width => tag_length,
				exponent_width => 8,
				fraction_width => 23,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true)
		port map(INA => L, INB => R,
				OUTMUL => ret_val_x_x,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => tag_out,
				env_rdy => start_req, accept_rdy => fin_req,
				muli_rdy => start_ack, mulo_rdy => fin_ack);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;


entity fpmul64 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(63 downto 0);
      R : in  std_logic_vector(63 downto 0);
      ret_val_x_x : out  std_logic_vector(63 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpmul64;

architecture Struct of fpmul64 is
begin

   mul: GenericFloatingPointMultiplier
		generic map(tag_width => tag_length,
				exponent_width => 11,
				fraction_width => 52,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true)
		port map(INA => L, INB => R,
				OUTMUL => ret_val_x_x,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => tag_out,
				env_rdy => start_req, accept_rdy => fin_req,
				muli_rdy => start_ack, mulo_rdy => fin_ack);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;


entity fpsub32 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(31 downto 0);
      R : in  std_logic_vector(31 downto 0);
      ret_val_x_x : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpsub32;

architecture Struct of fpsub32 is
begin

   mul: GenericFloatingPointAdderSubtractor
		generic map(tag_width => tag_length,
				exponent_width => 8,
				fraction_width => 23,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true,
				use_as_subtractor => true)
		port map(INA => L, INB => R,
				OUTADD => ret_val_x_x,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => tag_out,
				env_rdy => start_req, accept_rdy => fin_req,
				addi_rdy => start_ack, addo_rdy => fin_ack);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;


entity fpsub64 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(63 downto 0);
      R : in  std_logic_vector(63 downto 0);
      ret_val_x_x : out  std_logic_vector(63 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpsub64;

architecture Struct of fpsub64 is
begin

   mul: GenericFloatingPointAdderSubtractor
		generic map(tag_width => tag_length,
				exponent_width => 11,
				fraction_width => 52,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true,
				use_as_subtractor => true)
		port map(INA => L, INB => R,
				OUTADD => ret_val_x_x,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => tag_out,
				env_rdy => start_req, accept_rdy => fin_req,
				addi_rdy => start_ack, addo_rdy => fin_ack);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;


entity fpu32 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(31 downto 0);
      R : in  std_logic_vector(31 downto 0);
      OP_ID : in std_logic_vector(7 downto 0);
      ret_val_x_x : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpu32;

architecture Struct of fpu32 is
      signal OUTADD, OUTMUL, addsub_L, addsub_R : std_logic_vector(31 downto 0);
      signal req_to_omux, ack_from_omux: std_logic_vector(1 downto 0);

      signal data_to_omux: std_logic_vector((2*(32+tag_length))-1 downto 0);
      signal data_from_omux: std_logic_vector((32+tag_length)-1 downto 0);
      signal reqi_omux: std_logic_vector(1 downto 0);
      signal acki_omux: std_logic_vector(1 downto 0);
       
      signal mul_tag_out, addsub_tag_out: std_logic_vector(tag_length-1 downto 0);

      signal muli_req, addsubi_req: std_logic;
      signal muli_ack, addsubi_ack: std_logic;
      signal mulo_req, addsubo_req: std_logic;
      signal mulo_ack, addsubo_ack: std_logic;


      
begin

   muli_req <= start_req when (OP_ID = "00000010") else '0';
   addsubi_req <= start_req when ((OP_ID="00000001") or (OP_ID = "00000000")) else '0';
   start_ack <= muli_ack when (OP_ID = "00000010") else addsubi_ack when 
			((OP_ID="00000001") or (OP_ID = "00000000")) else '0';

   addsub_L <= L;
   process(R, OP_ID)
	variable X: std_logic_vector(31 downto 0);
   begin
	X(30 downto 0) := R(30 downto 0);
	if(OP_ID = "00000001") then
		X(31) := not R(31);
	else
		X(31) := R(31);
	end if;
	addsub_R <= X;
   end process;

   addsub: GenericFloatingPointAdderSubtractor
		generic map(tag_width => tag_length,
				exponent_width => 8,
				fraction_width => 23,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true,
				use_as_subtractor => false)
		port map(INA => addsub_L, INB => addsub_R,
				OUTADD => OUTADD,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => addsub_tag_out,
				env_rdy => addsubi_req, accept_rdy => addsubo_req,
				addi_rdy => addsubi_ack, addo_rdy => addsubo_ack);

   mul: GenericFloatingPointMultiplier
		generic map(tag_width => tag_length,
				exponent_width => 8,
				fraction_width => 23,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true)
		port map(INA => L, INB => R,
				OUTMUL => OUTMUL,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => mul_tag_out,
				env_rdy => muli_req, accept_rdy => mulo_req,
				muli_rdy => muli_ack, mulo_rdy => mulo_ack);

   data_to_omux <= OUTADD & addsub_tag_out & OUTMUL & mul_tag_out;
   reqi_omux(1) <= addsubo_ack;
   reqi_omux(0) <= mulo_ack;
   addsubo_req <= acki_omux(1);
   mulo_req <= acki_omux(0);


   omux:  OutputPortLevel generic map(num_reqs => 2,
					data_width => data_from_omux'length,
					no_arbitration => false)
			port map(req => reqi_omux,
				ack => acki_omux,
				data => data_to_omux,
				oreq => fin_ack,
				oack => fin_req,
				odata => data_from_omux,
				clk => clk,
				reset => reset);

   ret_val_x_x <= data_from_omux(31+tag_length downto tag_length);
   tag_out <= data_from_omux(tag_length-1 downto 0);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;


entity fpu64 is -- 
    generic (tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(63 downto 0);
      R : in  std_logic_vector(63 downto 0);
      OP_ID : in std_logic_vector(7 downto 0);
      ret_val_x_x : out  std_logic_vector(63 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpu64;

architecture Struct of fpu64 is
      signal OUTADD, OUTMUL, addsub_L, addsub_R : std_logic_vector(63 downto 0);
      signal req_to_omux, ack_from_omux: std_logic_vector(1 downto 0);

      signal data_to_omux: std_logic_vector((2*(64+tag_length))-1 downto 0);
      signal data_from_omux: std_logic_vector((64+tag_length)-1 downto 0);
      signal reqi_omux: std_logic_vector(1 downto 0);
      signal acki_omux: std_logic_vector(1 downto 0);
       
      signal mul_tag_out, addsub_tag_out: std_logic_vector(tag_length-1 downto 0);

      signal muli_req, addsubi_req: std_logic;
      signal muli_ack, addsubi_ack: std_logic;
      signal mulo_req, addsubo_req: std_logic;
      signal mulo_ack, addsubo_ack: std_logic;


      
begin

   muli_req <= start_req when (OP_ID = "00000010") else '0';
   addsubi_req <= start_req when ((OP_ID="00000001") or (OP_ID = "00000000")) else '0';
   start_ack <= muli_ack when (OP_ID = "00000010") else addsubi_ack when 
			((OP_ID="00000001") or (OP_ID = "00000000")) else '0';

   addsub_L <= L;
   process(R, OP_ID)
	variable X: std_logic_vector(63 downto 0);
   begin
	X := R;
	if(OP_ID = "00000001") then
		X(63) := not R(63);
	end if;
	addsub_R <= X;
   end process;

   addsub: GenericFloatingPointAdderSubtractor
		generic map(tag_width => tag_length,
				exponent_width => 11,
				fraction_width => 52,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true,
				use_as_subtractor => false)
		port map(INA => addsub_L, INB => addsub_R,
				OUTADD => OUTADD,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => addsub_tag_out,
				env_rdy => addsubi_req, accept_rdy => addsubo_req,
				addi_rdy => addsubi_ack, addo_rdy => addsubo_ack);

   mul: GenericFloatingPointMultiplier
		generic map(tag_width => tag_length,
				exponent_width => 11,
				fraction_width => 52,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true)
		port map(INA => L, INB => R,
				OUTMUL => OUTMUL,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => mul_tag_out,
				env_rdy => muli_req, accept_rdy => mulo_req,
				muli_rdy => muli_ack, mulo_rdy => mulo_ack);

   data_to_omux <= OUTADD & addsub_tag_out & OUTMUL & mul_tag_out;
   reqi_omux(1) <= addsubo_ack;
   reqi_omux(0) <= mulo_ack;
   addsubo_req <= acki_omux(1);
   mulo_req <= acki_omux(0);


   omux:  OutputPortLevel generic map(num_reqs => 2,
					data_width => data_from_omux'length,
					no_arbitration => false)
			port map(req => reqi_omux,
				ack => acki_omux,
				data => data_to_omux,
				oreq => fin_ack,
				oack => fin_req,
				odata => data_from_omux,
				clk => clk,
				reset => reset);

   ret_val_x_x <= data_from_omux(63+tag_length downto tag_length);
   tag_out <= data_from_omux(tag_length-1 downto 0);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.BaseComponents.all;


entity getClockTime is -- 
    generic (tag_length : integer);
    port ( -- 
      clock_time : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity getClockTime;

architecture Behave of getClockTime is

	type TimerState is (idle, done);
	signal tstate : TimerState;
	signal count_sig : unsigned(31 downto 0);

begin

	process(clk,reset,tstate,count_sig,start_req,fin_req,tag_in)
		variable next_state: TimerState;
		variable latch_var, decr_count, latch_otag: boolean;
	begin
		next_state := tstate;

		start_ack <= '0';
		fin_ack <= '0';

		latch_var := false;
		decr_count := false;

		case tstate is 
			when idle =>
				start_ack <= '1';
				if(start_req = '1') then
					next_state := done;
					latch_var  := true;
				end if;
			when done =>
				fin_ack <= '1';
				if(fin_req = '1') then
					next_state := idle;
				end if;
		end case;
		if(clk'event  and clk = '1') then
			if(reset = '1') then
				tstate <= idle;
				count_sig <= (others => '0');
			else
				tstate <= next_state;	
				count_sig <= count_sig + 1;
			end if;

			if(latch_var) then
				tag_out <= tag_in;
				clock_time <= std_logic_vector(count_sig);	
			end if;
		end if;
	end process;

end Behave;


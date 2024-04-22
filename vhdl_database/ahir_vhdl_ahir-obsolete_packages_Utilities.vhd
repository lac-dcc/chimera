library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;

package Utilities is

  function Convert_To_String(val : integer) return STRING; -- convert val to string.
  
  function To_SLV (x : unsigned) return std_logic_vector;

  function To_Unsigned ( x : std_logic_vector) return unsigned;
  
  function Ceil (constant x, y : integer)   return integer;

  function Ceil_Log2( constant x : integer)  return integer;

  function Max (constant x : NaturalArray)    return natural;

  function Maximum(x,y: integer)   return integer;
  function Minimum(x,y: integer)   return integer;  
  
  
  type P2LState is (I,B,W);  

  procedure Pulse_To_Level_Translate(
    suppr_imm_ack : in boolean;    
    signal rL : in boolean;
    signal rR : out std_logic;
    signal aL : out boolean;
    signal aR : in std_logic;
    signal en : out std_logic;
    signal state : inout P2LState;
    signal clk : in std_logic;
    signal reset : in std_logic);

  procedure RequestPriorityEncode (
    signal req_fsm_state : inout std_logic;
    signal clk,reset : in std_logic;
    signal reqR : in std_logic_vector;
    signal ackR: out std_logic_vector;
    signal reqF : inout std_logic_vector;
    signal req_s : out std_logic;
    signal ack_s : in std_logic;
    signal reqFreg : inout std_logic_vector);
  

  function All_Entries_Same ( x : NaturalArray) return boolean;


  
end Utilities;


package body Utilities is

    -- Thanks to: D. Calvet calvet@hep.saclay.cea.fr
    -- modified to support negative values
  function Convert_To_String(val : integer) return STRING is
	variable result : STRING(11 downto 1) := (others => '0'); -- smallest natural, longest string
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
	    	result(pos) := character'val(character'pos('0') + digit);
	    	pos := pos + 1;
	    	exit when tmp = 0;
	end loop;
	
	if is_negative then
	  result(pos) := '-';
	  pos := pos + 1;
	end if;
	
	return result((pos-1) downto 1);
  end Convert_To_String;
  
  function To_SLV (
    x : unsigned)
    return std_logic_vector is
    variable ret_var : std_logic_vector(1 to x'length);
    alias lx : unsigned(1 to x'length) is x;
  begin
    for I in 1 to x'length loop
      ret_var(I) := lx(I);
    end loop;  -- I
    return(ret_var);
  end To_SLV;
    

  function To_Unsigned (
    x : std_logic_vector)
    return unsigned is
    variable ret_var : unsigned(1 to x'length);
    alias lx : std_logic_vector(1 to x'length) is x;
  begin
    for I in 1 to x'length loop
      ret_var(I) := lx(I);
    end loop;  -- I
    return(ret_var);
  end To_Unsigned;
  
  function Ceil (
    constant x, y : integer)
    return integer is
    variable ret_var : integer;
  begin
    ret_var := x/y;
    if(ret_var*y < y) then
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
    if(x > 0) then
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
    

  procedure Pulse_To_Level_Translate(
    suppr_imm_ack : in boolean;
    signal rL : in boolean;
    signal rR : out std_logic;
    signal aL : out boolean;
    signal aR : in std_logic;
    signal en : out std_logic;
    signal state : inout P2LState;    
    signal clk : in std_logic;
    signal reset : in std_logic) is
    variable nstate : P2LState;
  begin
    nstate := state;
    
    rR <= '0';
    aL <= false;
    en <= '0';
    
    if(reset = '1') then
      nstate := I;
    else
      case state is
        when I =>
          if(rL) then
            rR <= '1';
            en <= '1';
            if(aR = '1') then
              if(suppr_imm_ack) then
                nstate := W;
              else
                aL <= true;
              end if;
            else
              nstate := B;
            end if;
          end if;
        when B =>
          rR <= '1';
          if(aR = '1') then
            aL <= true;
            nstate := I;
          end if;
        when W =>
          aL <= true;
          nstate := I;
        when others => null;
      end case;
    end if;

    if(clk'event and clk = '1') then
      state <= nstate;
    end if;
    
  end procedure;

  procedure RequestPriorityEncode (
    signal req_fsm_state : inout std_logic;
    signal clk,reset : in std_logic;
    signal reqR : in std_logic_vector;
    signal ackR: out std_logic_vector;
    signal reqF : inout std_logic_vector;
    signal req_s : out std_logic;
    signal ack_s : in std_logic;
    signal reqFreg : inout std_logic_vector)
  is
    variable next_state : std_logic;
    variable reqFregvar, ack_var, reqFvar, reqFrawvar : std_logic_vector(reqR'length-1 downto 0);
    variable req_s_var : std_logic;
    variable there_is_a_request : std_logic;
    
  begin
    
    next_state := req_fsm_state;
    
    reqFrawvar := PriorityEncode(reqR);
    there_is_a_request := OrReduce(reqR);

    reqFregvar := reqFreg;
    req_s_var := '0';

    reqFvar := (others => '0');
    ack_var := (others => '0');
    
    if(reset = '1') then
      next_state := '0';
      reqFregvar := (others => '0');
    else
      case req_fsm_state is
        when '0' =>
          if(there_is_a_request = '1') then
            reqFregvar := reqFrawvar;
            reqFvar := reqFrawvar;
            req_s_var := '1';

	    if(ack_s = '1') then
		ack_var := reqF;	
	    else
            	next_state := '1';
	    end if;  
	  else
	    reqFregvar := (others => '0');
	    reqFvar := (others => '0');
          end if;
        when '1' =>
          reqFvar := reqFreg;                           
          req_s_var := '1';
          if(ack_s = '1') then
            ack_var := reqF;
            reqFregvar := (others => '0');
            next_state := '0';
          end if;
        when others =>
          null;
      end case;
    end if;

    ackR <= ack_var;
    req_s <= req_s_var;
    reqF  <= reqFvar;
    
    if(clk'event and clk = '1') then
      req_fsm_state <= next_state;
      reqFreg <= reqFregvar;
    end if;

  end procedure;

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

  
end Utilities;

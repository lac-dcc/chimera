-- author: Madhav P. Desai
library ieee;
use ieee.std_logic_1164.all;

package Utility_Package is

  -----------------------------------------------------------------------------
  -- constants
  -----------------------------------------------------------------------------
  constant c_word_length : integer := 32;
  constant c_vhpi_max_string_length : integer := 1024;
  
  -----------------------------------------------------------------------------
  -- types
  -----------------------------------------------------------------------------
  subtype VhpiString is string(1 to c_vhpi_max_string_length);

  -----------------------------------------------------------------------------
  -- utility functions
  -----------------------------------------------------------------------------
  function Minimum(x,y: integer) return integer; -- returns minimum
  function Pack_String_To_Vhpi_String(x: string) return VhpiString; -- converts x to null terminated string
  function Pack_SLV_To_Vhpi_String(x: std_logic_vector) return VhpiString; -- converts slv x to null terminated string
  function Unpack_String(x: VhpiString; lgth: integer) return std_logic_vector; -- convert null term string to slv
  function To_Std_Logic(x: VhpiString) return std_logic; -- string to sl
  function To_String(x: std_logic) return VhpiString; -- string to sl
  function Convert_To_String(val : natural) return STRING; -- convert val to string.
  function Convert_SLV_To_String(val : std_logic_vector) return STRING; -- convert val to string.
  function To_Hex_Char (constant val: std_logic_vector)    return character;
  function Convert_SLV_To_Hex_String(val : std_logic_vector) return STRING; -- convert val to string.  

end package Utility_Package;

package body Utility_Package is

  -----------------------------------------------------------------------------
  -- utility functions
  -----------------------------------------------------------------------------
  function Minimum(x,y: integer) return integer is
  begin
    if( x < y) then return x; else return y; end if;
  end Minimum;

  function Ceiling(x,y: integer) return integer is
    variable ret_var : integer;
  begin
    assert x /= 0 report "divide by zero in ceiling function" severity failure;
    ret_var := x/y;
    if(ret_var*y < x) then ret_var := ret_var + 1; end if;
    return(ret_var);
  end Ceiling;

  function Pack_String_To_Vhpi_String(x:  string) return VhpiString is
     alias lx: string(1 to x'length) is x;
     variable strlen: integer;
     variable ret_var : VhpiString;
  begin
	strlen := Minimum(c_vhpi_max_string_length-1,x'length);
	for I in 1 to strlen loop
		ret_var(I) := lx(I);
	end loop;
	ret_var(strlen+1) := nul;
	return(ret_var); 
  end Pack_String_To_Vhpi_String;
  
  function Pack_SLV_To_Vhpi_String(x: std_logic_vector) return VhpiString is
    alias lx : std_logic_vector(1 to x'length) is x;
    variable strlen: integer;
    variable ret_var : VhpiString;
  begin
    strlen := Minimum(c_vhpi_max_string_length-1,x'length);
    for I in 1 to strlen loop
      if(lx(I) = '1') then 
        ret_var(I) := '1';
      else
        ret_var(I) := '0';
      end if;
    end loop;
    ret_var(strlen+1) := nul;
    return(ret_var); 
  end Pack_SLV_To_Vhpi_String;
  
  function Unpack_String(x: VhpiString; lgth: integer) return std_logic_vector is
    variable ret_var : std_logic_vector(1 to lgth);
    variable strlen: integer;
  begin
    strlen := Minimum(c_vhpi_max_string_length-1,lgth);
    for I in 1 to strlen loop
      if(x(I) = '1') then 
        ret_var(I) := '1';
      else
        ret_var(I) := '0';
      end if;
    end loop;
    return(ret_var);     
  end Unpack_String;

  function To_Std_Logic(x: VhpiString) return std_logic is
    variable s: std_logic_vector(0 downto 0);
  begin
    s := Unpack_String(x,1);
    return(s(0));
  end To_Std_Logic;

  function To_String(x: std_logic) return VhpiString is
    variable s: std_logic_vector(0 downto 0);
  begin
   s(0) := x;
   return(Pack_SLV_To_Vhpi_String(s));
  end To_String;

  -- Thanks to: D. Calvet calvet@hep.saclay.cea.fr
  function Convert_To_String(val : NATURAL) return STRING is
	variable result : STRING(10 downto 1) := (others => '0'); -- smallest natural, longest string
	variable pos    : NATURAL := 1;
	variable tmp, digit  : NATURAL;
  begin
	tmp := val;
	loop
		digit := abs(tmp MOD 10);
	    	tmp := tmp / 10;
	    	result(pos) := character'val(character'pos('0') + digit);
	    	pos := pos + 1;
	    	exit when tmp = 0;
	end loop;
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
    variable padded_lval : std_logic_vector((4*Ceiling(lval'length,4)) downto 1);
    variable ret_var: string(Ceiling(lval'length,4) downto 1);
    variable hstr  : std_logic_vector(4 downto 1);
    variable I : integer;
  begin
    padded_lval := (others => '0');
    padded_lval(val'length downto 1) := lval;

    I := 0;
    while (I < ret_var'length) loop
      hstr       := padded_lval(4*(I+1) downto (4*I)+1);
      I := (I + 1);
      ret_var(I) := To_Hex_Char(hstr);
    end loop;  -- I

    return(ret_var);
  end Convert_SLV_To_Hex_String;

end Utility_Package;

-- author: Madhav P. Desai
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Utility_Package.all;
package Modelsim_FLI_Foreign is

  -----------------------------------------------------------------------------
  -- foreign Modelsim FLI functions
  -----------------------------------------------------------------------------
  procedure  Modelsim_FLI_Initialize;
  attribute foreign of Modelsim_FLI_Initialize : procedure is "Modelsim_FLI_Initialize libModelsimFLI.so";

  procedure Modelsim_FLI_Close; -- close .
  attribute foreign of Modelsim_FLI_Close : procedure is "Modelsim_FLI_Close libModelsimFLI.so";

  procedure Modelsim_FLI_Listen;
  attribute foreign of Modelsim_FLI_Listen : procedure is "Modelsim_FLI_Listen libModelsimFLI.so";

  procedure Modelsim_FLI_Send; 
  attribute foreign of Modelsim_FLI_Send : procedure is "Modelsim_FLI_Send libModelsimFLI.so";

  procedure Modelsim_FLI_Set_Port_Value(port_name: in VhpiString; port_value: in VhpiString; port_width: in integer);
  attribute foreign of Modelsim_FLI_Set_Port_Value: procedure is "Modelsim_FLI_Set_Port_Value libModelsimFLI.so";
  
  procedure Modelsim_FLI_Get_Port_Value(port_name: in VhpiString; port_value : out VhpiString; port_width: in integer);
  attribute foreign of Modelsim_FLI_Get_Port_Value : procedure is "Modelsim_FLI_Get_Port_Value libModelsimFLI.so";

  procedure Modelsim_FLI_Log(message_string: in VhpiString);
  attribute foreign of Modelsim_FLI_Log : procedure is "Modelsim_FLI_Log libModelsimFLI.so";
  
end Modelsim_FLI_Foreign;

package body Modelsim_FLI_Foreign is
  
  procedure Modelsim_FLI_Initialize is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;
  
  procedure Modelsim_FLI_Close is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;
    
  procedure Modelsim_FLI_Listen is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;    

  procedure Modelsim_FLI_Send is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;
  
  procedure Modelsim_FLI_Set_Port_Value(port_name: in VhpiString; port_value: in VhpiString; port_width: in integer) is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;
  
  procedure Modelsim_FLI_Get_Port_Value(port_name: in VhpiString; port_value : out VhpiString; port_width : in integer) is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;
  
  procedure Modelsim_FLI_Log(message_string: in VhpiString) is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;

end Modelsim_FLI_Foreign;
  
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- VHPI is used to create a log-file.
library ModelsimLink;
use ModelsimLink.Utility_Package.all;
use ModelsimLink.Modelsim_FLI_Foreign.all;

package LogUtilities is

  procedure LogRecordPrint(gcount: in integer; pmesg: in string);

  procedure LogPipeWrite (
    signal clk : in std_logic;
    reset : in std_logic;
    clock_cycle: in integer;
    req : in boolean;
    ack : in  boolean;
    pipe_name: in string;
    write_data : in std_logic_vector;
    writer_name : in string);

  procedure LogPipeRead (
    signal clk : in std_logic;
    reset : in std_logic;
    clock_cycle: in integer;
    req : in boolean;
    ack : in  boolean;
    pipe_name: in string;    
    read_data : in std_logic_vector;
    reader_name : in string);

  procedure LogMemWrite (
    signal clk : in std_logic;
    reset : in std_logic;
    clock_cycle: in integer;
    sr_req : in  boolean;
    sr_ack : in  boolean;
    sc_req : in  boolean;
    sc_ack : in  boolean;
    operator_name: in string;
    mem_space_name : in string;
    write_data : in std_logic_vector;
    write_address : in std_logic_vector;    
    write_data_name : in string;
    write_address_name: in string);

  procedure LogMemRead (
    signal clk : in std_logic;
    reset : in std_logic;
    clock_cycle: in integer;
    lr_req : in  boolean;
    lr_ack : in  boolean;
    lc_req : in  boolean;
    lc_ack : in  boolean;
    operator_name: in string;
    mem_space_name : in string;    
    read_data : in std_logic_vector;
    read_address : in std_logic_vector;    
    read_data_name : in string;
    read_address_name: in string);

  procedure LogCPEvent (
    signal clk    : in std_logic;
    reset: in std_logic;
    clock_cycle: in integer;
    cp_sig : in boolean;
    cp_sig_name   : in string);

  procedure LogOperator(
	signal clk: in std_logic;
    	reset : in std_logic;
    	clock_cycle: in integer;
        req: in boolean;
        ack: in boolean;
	guard_sig: in std_logic;
	operator_id: in string;
	ignore_input: boolean;
	din: in std_logic_vector;
	ignore_output: boolean;
	dout: in std_logic_vector);

  procedure LogSplitOperator(
	signal clk: in std_logic;
    	reset : in std_logic;
    	clock_cycle: in integer;
        sr: in boolean;
        sa: in boolean;
        cr: in boolean;
        ca: in boolean;
	guard_sig: in std_logic;
	operator_id: in string;
	ignore_input: boolean;
	din: in std_logic_vector;
	ignore_output: boolean;
	dout: in std_logic_vector);
  

end LogUtilities;

package body LogUtilities is
  procedure LogRecordPrint(gcount: in integer; pmesg: in string) is
	variable log_string: VhpiString;
  begin
	log_string := Pack_String_To_Vhpi_String(Convert_To_String(gcount) & " " & pmesg);
        assert(false) report Convert_To_String(gcount) & " " & pmesg severity note;
	Modelsim_FLI_Log(log_string);
  end procedure;

  procedure LogPipeWrite (
    signal clk : in std_logic;
    reset : in std_logic;
    clock_cycle: in integer;
    req : in boolean;
    ack : in  boolean;
    pipe_name : in string;
    write_data : in std_logic_vector;
    writer_name : in string) is
	variable log_string : VhpiString;
  begin
    if(clk'event and clk = '1') then
      if(req) then
        assert false report "(started) PipeWrite " & pipe_name & " <= " & writer_name & " = " & Convert_SLV_To_Hex_String(write_data) severity note;
	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". Started PipeWrite " &  pipe_name & " from " & writer_name & " data=" & Convert_SLV_To_Hex_String(write_data));
	Modelsim_FLI_Log(log_string); 
      end if;      
      if(ack) then
        assert false report "(completed) PipeWrite " & pipe_name & " <= " & writer_name & " = " & Convert_SLV_To_Hex_String(write_data) severity note;
	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". Completed PipeWrite " &  pipe_name & " from " & writer_name & " data=" & Convert_SLV_To_Hex_String(write_data));
	Modelsim_FLI_Log(log_string); 
      end if;
    end if;
  end procedure;

  procedure LogPipeRead (
    signal clk : in std_logic;
    reset : in std_logic;
    clock_cycle: in integer;
    req : in boolean;
    ack : in  boolean;
    pipe_name : in string;
    read_data : in std_logic_vector;
    reader_name : in string) is
	variable log_string : VhpiString;
  begin
    if(clk'event and clk = '1') then
      if(req) then
        assert false report "(started) PipeRead " & pipe_name & " => " & reader_name & " = " & Convert_SLV_To_Hex_String(read_data)
          severity note;
	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". Started PipeRead " &  pipe_name & " from " & reader_name);
	Modelsim_FLI_Log(log_string);
      end if;
      if(ack) then
        assert false report "(completed) PipeRead " & pipe_name & " => " & reader_name & " = " & Convert_SLV_To_Hex_String(read_data)
          severity note;
	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". Completed PipeRead " &  pipe_name & " from " & reader_name & " data=" & Convert_SLV_To_Hex_String(read_data));
	Modelsim_FLI_Log(log_string);
      end if;      
    end if;    
  end procedure;

  procedure LogMemWrite (
    signal clk : in std_logic;
    reset : in std_logic;
    clock_cycle: in integer;
    sr_req : in  boolean;
    sr_ack : in  boolean;
    sc_req : in  boolean;
    sc_ack : in  boolean;
    operator_name: in string;
    mem_space_name : in string;
    write_data : in std_logic_vector;
    write_address : in std_logic_vector;    
    write_data_name : in string;
    write_address_name: in string) is
    variable address_in_progress: std_logic_vector(1 to write_address'length);
    variable data_in_progress: std_logic_vector(1 to write_data'length);
    variable start_log_count, completed_log_count : integer := 0;
    variable log_string : VhpiString;
  begin
    if(clk'event and clk = '1') then
      if(sr_ack) then
	address_in_progress := write_address;
	data_in_progress := write_data;
        assert false report operator_name & "(" & Convert_To_String(start_log_count) & ") "
	  & ": started MemWrite " 
	  & mem_space_name &
          "[" & write_address_name & " =" & Convert_SLV_To_Hex_String(write_address) & "] <= " &
          write_data_name & " = " & Convert_SLV_To_Hex_String(write_data) severity note;
	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". Started MemWrite " & operator_name & " mem-space " & mem_space_name & " write-address=" & Convert_SLV_To_Hex_String(write_address) & 
		" write_data=" & Convert_SLV_To_Hex_String(write_data));
	Modelsim_FLI_Log(log_string);
	start_log_count := start_log_count + 1;
      end if;

      if(sc_ack) then
        assert false report operator_name & " (" & Convert_To_String(completed_log_count) & ") "
	& ": completed MemWrite "  & mem_space_name severity note;
	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". Completed MemWrite " & operator_name & " mem-space " & mem_space_name);
	Modelsim_FLI_Log(log_string);
        completed_log_count := completed_log_count+1;
      end if;
    end if;        
  end procedure;

  procedure LogMemRead (
    signal clk : in std_logic;
    reset : in std_logic;
    clock_cycle: in integer;
    lr_req : in  boolean;
    lr_ack : in  boolean;
    lc_req : in  boolean;
    lc_ack : in  boolean;
    operator_name: in string;
    mem_space_name: in string;
    read_data : in std_logic_vector;
    read_address : in std_logic_vector;    
    read_data_name : in string;
    read_address_name: in string) is
    variable start_log_count, completed_log_count : integer := 0;
    variable log_string : VhpiString;
  begin
    if(clk'event and clk = '1') then
      if(lr_ack) then
        assert false report operator_name & "(" & Convert_To_String(start_log_count) & ") "
	  & ": started MemRead " 
	  & mem_space_name &
          " address: " & read_address_name & " =" & Convert_SLV_To_Hex_String(read_address) & "] " 
          severity note;
	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". Started MemRead " & operator_name & " mem-space " & mem_space_name &
		" read-address=" & Convert_SLV_To_Hex_String(read_address));
	Modelsim_FLI_Log(log_string);
	start_log_count := start_log_count + 1;
      end if;

      if(lc_ack) then
        assert false report operator_name & " (" & Convert_To_String(completed_log_count) & ") "
	& ": completed MemRead "  & mem_space_name & " data: " &  
          read_data_name & " = " & Convert_SLV_To_Hex_String(read_data) severity note;
	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". Completed MemRead " & operator_name & " mem-space " & mem_space_name &
		" read-data=" & Convert_SLV_To_Hex_String(read_data));
	Modelsim_FLI_Log(log_string);
        completed_log_count := completed_log_count+1;
      end if;
    end if;        
    
  end procedure;

  procedure LogOperator(
	signal clk: in std_logic;
    	reset : in std_logic;
    	clock_cycle: in integer;
        req: in boolean;
        ack: in boolean;
	guard_sig: in std_logic;
	operator_id: in string;
	ignore_input: boolean;
	din: in std_logic_vector;
	ignore_output: boolean;
	dout: in std_logic_vector) is
    variable log_string : VhpiString;
  begin
    if(clk'event and clk = '1') then
      if(guard_sig = '1') then
      	if(req) then
		if(ignore_input) then
        		assert false report operator_id & ": req asserted  " 
          		& " input-data=NONE "  severity note;
        		log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & 
					". req " & operator_id & " input-data=NONE");
		else
        		assert false report operator_id & ": req asserted  " 
          		& " input-data= " & Convert_SLV_To_Hex_String(din)   severity note;
        		log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & 
					". req " & operator_id & " input-data=" &
					Convert_SLV_To_Hex_String(din));
		end if;
	   Modelsim_FLI_Log(log_string);
        end if;

        if(ack) then

		if(ignore_output) then
          		assert false report operator_id & ": ack " & 
           			" output-data=NONE"  severity note;
        		log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & 
					". ack " & operator_id & " output-data=NONE");
		else
          		assert false report operator_id & ": ack " &
           			" output-data = " & Convert_SLV_To_Hex_String(dout)  severity note;
        		log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & 
					". ack " & operator_id & " output-data=" &
						Convert_SLV_To_Hex_String(dout));
		end if;
          	Modelsim_FLI_Log(log_string);
        end if;
      end if;
    end if;        
  end procedure;

  procedure LogSplitOperator(
	signal clk: in std_logic;
    	reset : in std_logic;
    	clock_cycle: in integer;
        sr: in boolean;
        sa: in boolean;
        cr: in boolean;
        ca: in boolean;
	guard_sig: in std_logic;
	operator_id: in string;
	ignore_input: boolean;
	din: in std_logic_vector;
	ignore_output: boolean;
	dout: in std_logic_vector) is
    variable log_string : VhpiString;
  begin
    if(clk'event and clk = '1') then
      if(guard_sig = '1') then
      	if(sr) then
        	assert false report operator_id & ": req0 " 
          & " input-data= " & Convert_SLV_To_Hex_String(din)   severity note;
        log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". req0 " & operator_id & " input-data=" &
			Convert_SLV_To_Hex_String(din));
	   Modelsim_FLI_Log(log_string);
        end if;

        if(sa) then
          assert false report operator_id & ": ack0 " & 
           " input-data = " & Convert_SLV_To_Hex_String(din)  severity note;
        log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". ack0 " & operator_id & " input-data=" &
			Convert_SLV_To_Hex_String(din));
          Modelsim_FLI_Log(log_string);
        end if;

      	if(cr) then
        	assert false report operator_id & ": req1 "  severity note;
        log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". req1 " & operator_id);
	   Modelsim_FLI_Log(log_string);
        end if;

        if(ca) then
          assert false report operator_id & ": ack1 " &
           " output-data = " & Convert_SLV_To_Hex_String(dout)  severity note;
        log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". ack1 " & operator_id & " output-data=" &
			Convert_SLV_To_Hex_String(dout));
          Modelsim_FLI_Log(log_string);
        end if;
      end if;
    end if;        
  end procedure;
  
  procedure LogCPEvent (
    signal clk    : in std_logic;
    reset : in std_logic;
    clock_cycle: in integer;
    cp_sig : in boolean;
    cp_sig_name   : in string) is
    variable log_string : VhpiString;
  begin
    if(clk'event and clk = '1') then
      if(cp_sig) then
        assert false report cp_sig_name  severity note;
        log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". " & cp_sig_name);
	Modelsim_FLI_Log(log_string);
      end if;
    end if;
  end procedure;
  
end LogUtilities;


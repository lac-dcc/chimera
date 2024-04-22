library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- VHPI is used to create a log-file.
library GhdlLink;
use GhdlLink.Utility_Package.all;
use GhdlLink.Vhpi_Foreign.all;

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
	guard_complement: in boolean;
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
	Vhpi_Log(log_string);
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
	Vhpi_Log(log_string); 
      end if;      
      if(ack) then
        assert false report "(completed) PipeWrite " & pipe_name & " <= " & writer_name & " = " & Convert_SLV_To_Hex_String(write_data) severity note;
	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". Completed PipeWrite " &  pipe_name & " from " & writer_name & " data=" & Convert_SLV_To_Hex_String(write_data));
	Vhpi_Log(log_string); 
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
	Vhpi_Log(log_string);
      end if;
      if(ack) then
        assert false report "(completed) PipeRead " & pipe_name & " => " & reader_name & " = " & Convert_SLV_To_Hex_String(read_data)
          severity note;
	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". Completed PipeRead " &  pipe_name & " from " & reader_name & " data=" & Convert_SLV_To_Hex_String(read_data));
	Vhpi_log(log_string);
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
	Vhpi_Log(log_string);
	start_log_count := start_log_count + 1;
      end if;

      if(sc_ack) then
        assert false report operator_name & " (" & Convert_To_String(completed_log_count) & ") "
	& ": completed MemWrite "  & mem_space_name severity note;
	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". Completed MemWrite " & operator_name & " mem-space " & mem_space_name);
	Vhpi_Log(log_string);
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
	Vhpi_Log(log_string);
	start_log_count := start_log_count + 1;
      end if;

      if(lc_ack) then
        assert false report operator_name & " (" & Convert_To_String(completed_log_count) & ") "
	& ": completed MemRead "  & mem_space_name & " data: " &  
          read_data_name & " = " & Convert_SLV_To_Hex_String(read_data) severity note;
	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". Completed MemRead " & operator_name & " mem-space " & mem_space_name &
		" read-data=" & Convert_SLV_To_Hex_String(read_data));
	Vhpi_Log(log_string);
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
	   Vhpi_Log(log_string);
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
          	Vhpi_Log(log_string);
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
	guard_complement: in boolean;
	operator_id: in string;
	ignore_input: boolean;
	din: in std_logic_vector;
	ignore_output: boolean;
	dout: in std_logic_vector) is
    variable log_string : VhpiString;
    variable tmp_string : string(1 to 4096);
    variable saved_guard : std_logic := '1';
  begin
    if(clk'event and clk = '1') then
      	if(sr) then
        	assert false report operator_id & ": req0 " 
          			& " input-data= " & Convert_SLV_To_Hex_String(din)   severity note;
		if(guard_complement or (guard_sig = '0')) then
        		log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". req0 " & operator_id & " input-data=" &
				Convert_SLV_To_Hex_String(din) & " skipped!");
		else
        		log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". req0 " & operator_id & " input-data=" &
				Convert_SLV_To_Hex_String(din));
		end if;
	   	Vhpi_Log(log_string);
		saved_guard := guard_sig;
	end if;

        if(sa) then
          	assert false report operator_id & ": ack0 " & 
           		" input-data = " & Convert_SLV_To_Hex_String(din)  severity note;
		if(guard_complement or (guard_sig = '0')) then
        		log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". ack0 " & operator_id & " input-data=" &
				Convert_SLV_To_Hex_String(din) & " skipped!");
		else
        		log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". ack0 " & operator_id & " input-data=" &
				Convert_SLV_To_Hex_String(din));
		end if;
          	Vhpi_Log(log_string);
        end if;

      	if(cr) then
        	assert false report operator_id & ": req1 "  severity note;
        		log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". req1 " & operator_id);
	   	Vhpi_Log(log_string);
	end if;

        if(ca) then
           assert false report operator_id & ": ack1 " &
                " output-data = " & Convert_SLV_To_Hex_String(dout)  severity note;
	   if(guard_complement or (saved_guard = '0')) then
           	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". ack1 " & operator_id & " output-data=" &
			Convert_SLV_To_Hex_String(dout) & " skipped!" );
	   else
           	log_string := Pack_String_To_Vhpi_String(Convert_To_String(clock_cycle) & ". ack1 " & operator_id & " output-data=" &
			Convert_SLV_To_Hex_String(dout));
	   end if;
           Vhpi_Log(log_string);
	   if(guard_complement) then
		saved_guard := '1';
	   else
	   	saved_guard := '0';
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
	Vhpi_Log(log_string);
      end if;
    end if;
  end procedure;
  
end LogUtilities;


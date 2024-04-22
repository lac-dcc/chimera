library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.compressor_pkg.all;

entity hash_table is
	generic(
		LOOK_UP_WIDTH		: integer:= 8; --length of valid input data, the first engine is 8, others are smaller
--		INSERT_WIDTH		: integer:= 11; --width of the data to be inserted
		MAX_DELAY_STAGE		: integer:= 4; --max stage of delays, should only influence simulation speed 
		HASH_TABLE_DEPTH	: integer:= 4096;
		HASH_TABLE_DEPTH_LOG: natural:= work.arithmetic_pkg.clog2(HASH_TABLE_DEPTH)
	);
	port(
		clk						: in std_logic;
		reset_n					: in std_logic;

	--some control signals
		clean					: in std_logic;	--start cleaning up the valid bit
		finish					: out std_logic; --whether all the data is processed by this module (after processing all the data, ready signal will still be low until cleaning up)
	
	--insert data input
		data_insert_in			: in std_logic_vector(LOOK_UP_WIDTH*8-1 downto 0);
		data_insert_valid_in	: in std_logic;	--valid signal for data_in
		insert_current_addr_in	: in unsigned (ADDRESS_WIDTH-1 downto 0);	-- the address of the first byte in each inserting   
	
	--look up data input
		data_lookup_in			: in std_logic_vector(LOOK_UP_WIDTH*8-1 downto 0);
		data_lookup_valid_in	: in std_logic;
		data_lookup_last_in		: in std_logic;	--whether it is the last line of the input data_in
		data_lookup_ram_addr_in	: in unsigned (HASH_TABLE_DEPTH_LOG-1 downto 0); --address of RAM to look up
		lookup_current_addr_in	: in unsigned (ADDRESS_WIDTH-1 downto 0); -- current address for look up
		
	--match output
		match_valid_out			: out std_logic; --set to high if found a match
		match_address_out		: out unsigned (ADDRESS_WIDTH-1 downto 0);
		match_length_out		: out unsigned (HASH_TABLE_HIS_WIDTH_LOG-1 downto 0) --match length-1 (if match_valid_out set to high, there should be at least one byte match)
	);

end entity;

architecture rtl of hash_table is
	attribute ram_style : string;
	constant LOOKUP_DELAY 			: integer := 1; --parameter to adjust the look up signal  
	
	--create an array in BRAM to store address and a valid bit
	type addr_table_t is array(HASH_TABLE_DEPTH-1 downto 0) of std_logic_vector(ADDRESS_WIDTH downto 0);
	signal addr_table : addr_table_t  := (others=>(others=>'0'));
	attribute ram_style of addr_table : signal is "block";
	
	--create an array in URAM to store history
	type hist_table_t is array(HASH_TABLE_DEPTH-1 downto 0) of std_logic_vector(LOOK_UP_WIDTH*8-1 downto 0);
	signal hist_table : hist_table_t  := (others=>(others=>'0'));
	attribute ram_style of hist_table : signal is "ultra";

	--signals for insert
	type ht_state_t is (HT_WORKING, HT_CLEANING);
	signal ht_state					: ht_state_t;
	signal insert_address			: unsigned(HASH_TABLE_DEPTH_LOG-1 downto 0); --the address of the URAM/BRAM to insert
	signal clean_address			: unsigned(HASH_TABLE_DEPTH_LOG-1 downto 0); --address to clean the RAMs
	signal write_valid				: std_logic; --whether write to RAM
	signal data_insert_d			: std_logic_vector(LOOK_UP_WIDTH*8-1 downto 0);
	signal insert_current_addr_d  	: unsigned(ADDRESS_WIDTH-1 downto 0);

	signal finish_r					: std_logic;
	signal finish_r_d				: std_logic;

	--signals for look up
	--0st
	type data_lookup_t is array(MAX_DELAY_STAGE-1 downto 0) of std_logic_vector(LOOK_UP_WIDTH*8-1 downto 0);
	type data_lookup_ram_addr_t is array(MAX_DELAY_STAGE-1 downto 0) of unsigned (HASH_TABLE_DEPTH_LOG-1 downto 0);
	type lookup_current_addr_t is array(MAX_DELAY_STAGE-1 downto 0) of unsigned (ADDRESS_WIDTH-1 downto 0);
	signal data_lookup_d			: data_lookup_t;
	signal data_lookup_valid_d		: std_logic_vector(MAX_DELAY_STAGE-1 downto 0);
	signal data_lookup_last_d		: std_logic_vector(MAX_DELAY_STAGE-1 downto 0);
	signal data_lookup_ram_addr_d	: data_lookup_ram_addr_t;
	signal lookup_current_addr_d	: lookup_current_addr_t;
	
	--1st stage
	signal match_addr				: unsigned(ADDRESS_WIDTH-1 downto 0); --address read from table
	signal match_data				: std_logic_vector(LOOK_UP_WIDTH*8-1 downto 0);	--data read from table
	signal match_data_valid			: std_logic; --whether the data in this entry is valid
	signal min_match_addr			: unsigned(ADDRESS_WIDTH-1 downto 0); --minimum address for match (to avoid too old match)
	
	--Count how many leading bytes are the same
	--LOOK_UP_WIDTH can be different for different modules, so should not be defined in the package
	function bytes_match_counter(
		input1	: in std_logic_vector(LOOK_UP_WIDTH*8 -1 downto 0);
		input2	: in std_logic_vector(LOOK_UP_WIDTH*8 -1 downto 0) )
		return unsigned is
		variable byte_match_check	     : std_logic_vector(LOOK_UP_WIDTH-1 downto 0);
		variable match_length_v		     : unsigned(HASH_TABLE_HIS_WIDTH_LOG downto 0);	--the length of match, should not be (HASH_TABLE_HIS_WIDTH_LOG-1 downto 0)
	begin
		---check the match of every byte
		for i in LOOK_UP_WIDTH-1 downto LOOK_UP_WIDTH-LOOK_UP_WIDTH loop
			if(input1(i*8+7 downto i*8) = input2(i*8+7 downto i*8))then
				byte_match_check(i) := '1';
			else
				byte_match_check(i) := '0';
			end if;
		end loop;
		
		--count the length of match
		match_length_v	:= to_unsigned(0, HASH_TABLE_HIS_WIDTH_LOG+1);
		for i in LOOK_UP_WIDTH-1 downto LOOK_UP_WIDTH-LOOK_UP_WIDTH loop
			if(byte_match_check(i) = '0')then
				exit;
			end if;
			match_length_v := match_length_v + 1;
		end loop;
		return match_length_v;
	end function bytes_match_counter;
		
	
	--some debug signals, should not be synthesised
	signal debug_insert_checked		: std_logic;
	
begin

	------------------------------------
	--Insert
	------------------------------------
	--1st stage
	--has a FSM to control the cleaning
	process(clk)begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				ht_state <= HT_WORKING;
				finish_r	 <= '0';
			else
				case ht_state is
					when HT_WORKING =>
						finish_r	<= '0';
						if(clean = '1')then
							ht_state		<= HT_CLEANING;
							clean_address	<= to_unsigned(0, HASH_TABLE_DEPTH_LOG);
							write_valid		<= '1';
						else
							write_valid		<= data_insert_valid_in;
						end if;
					when HT_CLEANING =>
						clean_address	<= clean_address + 1;
						if(clean_address = HASH_TABLE_DEPTH-1)then
							finish_r			<= '1';
							ht_state		<= HT_WORKING;
							write_valid		<= '0';
						else	
							write_valid		<= '1';
						end if;
				end case;
			end if;
		end if;
	end process;
	
	--calculate hash value for insertaion
	process(clk)
	variable hash_value : unsigned (32-1 downto 0);
	begin
	   hash_value  := work.compressor_pkg.hash_3_bytes(data_insert_in(LOOK_UP_WIDTH*8-1 downto LOOK_UP_WIDTH*8-1-23));
		if(rising_edge(clk))then
			insert_address			<= hash_value(32-1 downto 32-HASH_TABLE_DEPTH_LOG);
			data_insert_d			<= data_insert_in;
			insert_current_addr_d	<= insert_current_addr_in;
		end if;
	end process;
	
	--2nd stage
	process(clk)
		variable write_address			: unsigned(HASH_TABLE_DEPTH_LOG-1 downto 0);	-- the address to write to RAMs
		variable write_addr_table		: std_logic_vector(ADDRESS_WIDTH downto 0); --data write to address table
	begin
		if(rising_edge(clk))then
			--choose the write address and value of valid bit
			case ht_state is
				when HT_WORKING =>
					write_address	:= insert_address;
					write_addr_table(0)	:= '1';
				when HT_CLEANING =>
					write_address	:= clean_address;
					write_addr_table(0)	:= '0';
			end case;
			write_addr_table(ADDRESS_WIDTH downto 1)	:= std_logic_vector(insert_current_addr_d);
			
			if(write_valid = '1')then
				addr_table(to_integer(write_address))	<= write_addr_table;
				hist_table(to_integer(write_address))	<= data_insert_d;
			end if;
			
			finish_r_d			<= finish_r;
		end if ;
	end process;
	
	finish			<= finish_r_d;
	
	------------------------------------
	--look up
	------------------------------------
	--1st stage
	process(clk)
	begin --generate the delay of input signals
		if(rising_edge(clk))then
			data_lookup_d(0)			<= data_lookup_in;
			data_lookup_valid_d(0)		<= data_lookup_valid_in;
			data_lookup_last_d(0)		<= data_lookup_last_in;
			data_lookup_ram_addr_d(0)	<= data_lookup_ram_addr_in;
			lookup_current_addr_d(0)	<= lookup_current_addr_in;
			for i in 1 to MAX_DELAY_STAGE-1 loop
				data_lookup_d(i)			<= data_lookup_d(i-1);
				data_lookup_valid_d(i)		<= data_lookup_valid_d(i-1);
				data_lookup_last_d(i)		<= data_lookup_last_d(i-1);
				data_lookup_ram_addr_d(i)	<= data_lookup_ram_addr_d(i-1);
				lookup_current_addr_d(i)	<= lookup_current_addr_d(i-1);
			end loop;
		end if;
	end process;

	--read from tables
	process(clk)
		variable read_addr_table		: std_logic_vector(ADDRESS_WIDTH downto 0);  --data read from address table 
	begin
		if(rising_edge(clk))then
			read_addr_table		:= addr_table(to_integer(data_lookup_ram_addr_d(LOOKUP_DELAY)));
			match_addr			<= unsigned(read_addr_table(ADDRESS_WIDTH downto 1));
			match_data_valid	<= read_addr_table(0);
			match_data			<= hist_table(to_integer(data_lookup_ram_addr_d(LOOKUP_DELAY)));
		end if;
	end process;
	
	process(clk)begin
		if(rising_edge(clk))then
			if(lookup_current_addr_d(LOOKUP_DELAY)>MAX_OFFSET)then -- to avoid underflow
				min_match_addr		<= lookup_current_addr_d(LOOKUP_DELAY) - MAX_OFFSET;
			else
				min_match_addr		<= (others => '0');
			end if;
		end if;
	end process;
	
	--2nd stage
	process(clk)
		variable match_length_v		     : unsigned (HASH_TABLE_HIS_WIDTH_LOG downto 0); --the length of match, should not be (HASH_TABLE_HIS_WIDTH_LOG-1 downto 0)
	begin
		if(rising_edge(clk))then
			--calculate the length of match
			match_length_v		:= bytes_match_counter(match_data, data_lookup_d(LOOKUP_DELAY+1));
			
		--only if: the match is not too old, the input data is valid, the matched data from history is valid, the length of match is at least 3; then: the match is valid
			if(min_match_addr < match_addr and data_lookup_valid_d(LOOKUP_DELAY+1) = '1' and match_data_valid = '1' and match_length_v >= 3)then
				match_valid_out <= '1';
			else
				match_valid_out <= '0';
			end if;
			match_address_out	<= match_addr;
			match_length_out	<= work.compressor_pkg.resize_unsigned(match_length_v - 1, HASH_TABLE_HIS_WIDTH_LOG-1, 0);
		end if;
	end process;

	--the inserting must be 1 cycle later than the lookup, which means the write_valid signal
	--should be 1 cycle ahead of the data_lookup_valid_d, which means the same high on write_valid 
	--should be the same as data_lookup_valid_d(LOOKUP_DELAY)
	--otherwise the compression ratio will be influenced. add assert to check it.
	--change the stage0 if it failed
	process(clk)begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				debug_insert_checked	<= '0';
			elsif(debug_insert_checked = '0')then -- if not checked
				if(write_valid = '1')then
					debug_insert_checked	<= '1';
					assert data_lookup_valid_d(LOOKUP_DELAY) = '1' report "insert too late" severity failure;
				end if;
				
				if(data_lookup_valid_d(LOOKUP_DELAY) = '1') then
					assert write_valid = '1' report "insert too early" severity failure;
				end if;
			end if;
		end if;
	end process;
------------end checking---------------------------------
	
end architecture;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.compressor_pkg.all;

entity hash_match_engine is
	generic(
		
		MAX_DELAY_STAGE		: integer:= 8; --max stage of delays, should only influence simulation speed
		LOOK_UP_WIDTH		: integer:= 8; --length of valid input data, the first engine is 8, others are smaller
		BYTES_HASH			: integer:= 3; -- number of bytes used to calculate hash
		HASH_TABLE_DEPTH	: integer:= 4096;
		HASH_TABLE_DEPTH_LOG: integer:= work.arithmetic_pkg.clog2(HASH_TABLE_DEPTH)
		--CONTENT_WIDTH		: integer:= 8   --number of bytes buffered as history in hash table
	);
	port(
		clk						: in std_logic;
		reset_n					: in std_logic;

		--some control signals
		start					: in std_logic;		--a new job starts, a new should only start when the idle signal is high
		idle					: out std_logic;	--whether the engine is ready to receive new job (the hash table is cleaned up)
		finish					: out std_logic;	--whether all the data is processed by this module (after processing all the data, ready signal will still be low until cleaning up)
	
		--insert data input
		data_insert_in			: in std_logic_vector(INSERT_WIDTH*8-1 downto 0);
		data_insert_valid_in	: in std_logic;	--valid signal for data_in
	
		--look up data input
		data_lookup_in			: in std_logic_vector(LOOK_UP_WIDTH*8-1 downto 0);
		data_lookup_valid_in	: in std_logic_vector(LOOK_UP_WIDTH-1 downto 0);
		data_lookup_last_in		: in std_logic;	--whether it is the last line of the input data_in
		
		--data to history buffer, 4 cycles earlier than the data_out
		data_hist_out           : out std_logic_vector(INPUT_WIDTH*8-1 downto 0);
		data_hist_valid_out     : out std_logic;
		
		--raw data output	--the same as the data_in, but delayed for several cycles
		data_out				: out std_logic_vector(LOOK_UP_WIDTH*8-1 downto 0);  
		data_valid_out			: out std_logic_vector(INPUT_WIDTH-1 downto 0);
		data_last_out			: out std_logic; 
		
		-- lookup match output
		lookup_current_addr_out	: out unsigned (ADDRESS_WIDTH-1 downto 0);
		lookup_match_out		: out match_t
	);
end entity;

architecture rtl of hash_match_engine is
	attribute ram_style : string;

	--FSM to control the compression and cleaning up
	type hme_state_t is (HME_INITIAL, HME_COMPRESS, HME_CLEAN);
	signal hme_state				: hme_state_t;

	--signals for insert
	type insert_current_addr_each_t is array(INPUT_WIDTH-1 downto 0) of unsigned(ADDRESS_WIDTH-1 downto 0);
	signal data_insert_d			: std_logic_vector(INSERT_WIDTH*8-1 downto 0);
	signal data_insert_d2			: std_logic_vector(INSERT_WIDTH*8-1 downto 0);
	signal data_insert_valid_d		: std_logic;
	signal data_insert_valid_d2		: std_logic;
	signal insert_current_addr		: unsigned(ADDRESS_WIDTH-1 downto 0);	   -- the address of the first byte in each inserting
	signal insert_current_addr_each : insert_current_addr_each_t;
	signal hash_table_finish		: std_logic_vector(INPUT_WIDTH-1 downto 0);
	signal hash_table_clean			: std_logic;
	
	--signals for look up
	--1st stage
	signal data_lookup_d			: std_logic_vector(LOOK_UP_WIDTH*8-1 downto 0);
	signal data_lookup_valid_d		: std_logic_vector(LOOK_UP_WIDTH-1 downto 0);
	signal data_lookup_last_d		: std_logic;	
	signal lookup_current_addr		: unsigned(ADDRESS_WIDTH-1 downto 0); -- the address of the first byte in each lookup
	signal lookup_ram_address		: unsigned(HASH_TABLE_DEPTH_LOG-1 downto 0); --  the address of the URAM/BRAM to loopup
	
	--2nd stage
	type data_lookup_t is array(MAX_DELAY_STAGE-1 downto 0) of std_logic_vector(LOOK_UP_WIDTH*8-1 downto 0);
	type data_lookup_valid_t is array(MAX_DELAY_STAGE-1 downto 0) of std_logic_vector(INPUT_WIDTH-1 downto 0);
	type lookup_current_addr_t is array(MAX_DELAY_STAGE-1 downto 0) of unsigned(ADDRESS_WIDTH-1 downto 0);
	signal data_lookup_d2			: data_lookup_t;
	signal data_lookup_valid_d2		: data_lookup_valid_t;
	signal data_lookup_last_d2		: std_logic_vector(MAX_DELAY_STAGE-1 downto 0);
	signal lookup_current_addr_d	: lookup_current_addr_t;
	
	--3th stage
	--signals to read the hash_table and compare, should be wire
	signal match_valid_w			: std_logic_vector(INPUT_WIDTH-1 downto 0);
	signal match_address_w			: unsigned (ADDRESS_WIDTH*INPUT_WIDTH-1 downto 0);
	signal match_length_w			: unsigned (HASH_TABLE_HIS_WIDTH_LOG*INPUT_WIDTH-1 downto 0);
	
	signal matches_after_comparison	: matches_t;
	signal data_lookup_d4			: std_logic_vector(INPUT_WIDTH*8-1 downto 0);
	signal data_lookup_valid_d4		: std_logic_vector(INPUT_WIDTH-1 downto 0);
	signal data_lookup_last_d4		: std_logic;
	signal lookup_current_addr_d3	: unsigned(ADDRESS_WIDTH-1 downto 0);
	
	--4th stage
	signal best_match				: match_t;
	signal data_lookup_d5			: std_logic_vector(INPUT_WIDTH*8-1 downto 0);
	signal data_lookup_valid_d5		: std_logic_vector(INPUT_WIDTH-1 downto 0);
	signal data_lookup_last_d5		: std_logic;
	signal lookup_current_addr_d4	: unsigned(ADDRESS_WIDTH-1 downto 0);
	
	--to delay the signal to wait for inserting
	signal delayer_wait_insert_in, delayer_wait_insert_out	: std_logic_vector(INPUT_WIDTH*8 + INPUT_WIDTH + 1 + ADDRESS_WIDTH -1 downto 0);

begin
	GENERATE_HASH_TABLE:for i in 0 to INPUT_WIDTH-1 generate
	hash_table0 : entity work.hash_table	
		generic map(
			LOOK_UP_WIDTH       => LOOK_UP_WIDTH,
			HASH_TABLE_DEPTH	=> HASH_TABLE_DEPTH,
			HASH_TABLE_DEPTH_LOG=> HASH_TABLE_DEPTH_LOG
		)
		port map(
			clk					=> clk,
			reset_n				=> reset_n,

			--some control signals
			clean					=> hash_table_clean,	--start cleaning up the valid bit
			finish					=> hash_table_finish(i),	--whether all the data is processed by this module (after processing all the data, ready signal will still be low until cleaning up)
	
			--insert data input
			data_insert_in			=> data_insert_d2(INSERT_WIDTH*8-i*8-1 downto INSERT_WIDTH*8-i*8-8*LOOK_UP_WIDTH),
			data_insert_valid_in	=> data_insert_valid_d2,		--valid signal for data_in
			insert_current_addr_in  => insert_current_addr_each(i),	   -- the address of the first byte in each inserting
	
			--look up data input
			data_lookup_in			=> data_lookup_d,
			data_lookup_valid_in	=> data_lookup_valid_d(LOOK_UP_WIDTH-1),
			data_lookup_last_in		=> data_lookup_last_d,	--whether it is the last line of the input data_in
			data_lookup_ram_addr_in	=> lookup_ram_address,	--address of RAM to look up
			lookup_current_addr_in	=> lookup_current_addr,	-- current address for look up
		
			--match output
			match_valid_out			=> match_valid_w(i), 							--set to high if the found a match
			match_address_out		=> match_address_w(ADDRESS_WIDTH*i+ADDRESS_WIDTH-1 downto ADDRESS_WIDTH*i),
			match_length_out		=> match_length_w(HASH_TABLE_HIS_WIDTH_LOG*i+HASH_TABLE_HIS_WIDTH_LOG-1 downto HASH_TABLE_HIS_WIDTH_LOG*i)		--match length-1 (if match_valid_out set to high, there should be at least one byte match)
		);
	end generate GENERATE_HASH_TABLE;
	
	
	------------------------------------
	--Insert
	------------------------------------
	--buffer the insert input and calculate hash value
	
	process(clk)begin
		if(rising_edge(clk))then
			data_insert_d		<= data_insert_in;
			data_insert_d2		<= data_insert_d;
			
			data_insert_valid_d <= data_insert_valid_in;
			data_insert_valid_d2<= data_insert_valid_d;
		end if;
	end process;
	
	process(clk)
	begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				hme_state			<= HME_INITIAL;
				idle				<= '1';
				hash_table_clean	<= '0';
			else
				case hme_state is
					when HME_INITIAL =>
						if(start = '1')then
							hme_state	<= HME_COMPRESS;
							idle		<= '0';
						end if;
						finish          <= '0';
						hash_table_clean<= '0';
					when HME_COMPRESS =>
						if(data_lookup_last_d2(MAX_DELAY_STAGE-1) = '1')then --make sure the pipline of this module is empty
							hme_state	<= HME_CLEAN;
							hash_table_clean<= '1';
						end if;
					when HME_CLEAN =>
						hash_table_clean<= '0';
						if(hash_table_finish(0) = '1')then
							hme_state	<= HME_INITIAL;
							idle		<= '1';
							finish      <= '1';
						end if;
					when others =>
						hme_state	<= HME_INITIAL;
				end case;
			end if;
		end if;
	end process;
	

	--count the input to calculate the address;
	process(clk)
		variable insert_current_addr_v : unsigned(ADDRESS_WIDTH-1 downto 0);
	begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				insert_current_addr <= (others => '0');
		    elsif(start = '1')then
		        insert_current_addr <= (others => '0');
			else
				-- combinational logic to calculate address +4
				if(data_insert_valid_d2 = '1')then
					insert_current_addr_v	:= insert_current_addr + INPUT_WIDTH;
				else
					insert_current_addr_v	:= insert_current_addr;
				end if;
				--assign to registers
				insert_current_addr		<= insert_current_addr_v;
				for i in 0 to INPUT_WIDTH-1 loop
					insert_current_addr_each(i) <= insert_current_addr_v(ADDRESS_WIDTH-1 downto 2) & to_unsigned(i, 2);
				end loop;
			end if;
		end if;
	end process;
	
	
	------------------------
	--look up
	------------------------
	--1st stage
	process(clk)
	   variable hash_value : unsigned(32-1 downto 0);
	begin
	    hash_value := hash_3_bytes(data_lookup_in(LOOK_UP_WIDTH*8-1 downto LOOK_UP_WIDTH*8-24));
		if(rising_edge(clk))then
			data_lookup_d		<= data_lookup_in;
			data_lookup_valid_d	<= data_lookup_valid_in;
			data_lookup_last_d	<= data_lookup_last_in;
			lookup_ram_address	<= hash_value(32-1 downto 32-HASH_TABLE_DEPTH_LOG);		--calculate hash value
		end if;	
	end process;
	
	--count the input to calculate the address;
	process(clk)begin
		if(rising_edge(clk))then
		    if(start = '1')then
			    lookup_current_addr <= to_unsigned((8-LOOK_UP_WIDTH), ADDRESS_WIDTH);
		    elsif(data_lookup_valid_d(LOOK_UP_WIDTH-1) = '1')then
					lookup_current_addr	<= lookup_current_addr + 4;
			end if;
		end if;
	end process;
	
	--2nd stage just wait for the output of hash_table
	process(clk)begin
		if(rising_edge(clk))then
			data_lookup_d2(0)			<= data_lookup_d; -- remove the duplicated data
			data_lookup_valid_d2(0)		<= data_lookup_valid_d(LOOK_UP_WIDTH-1 downto LOOK_UP_WIDTH-INPUT_WIDTH);
			data_lookup_last_d2(0)		<= data_lookup_last_d;
			lookup_current_addr_d(0)	<= lookup_current_addr;
			
			for i in MAX_DELAY_STAGE-1 downto 1 loop
				data_lookup_d2(i)		<= data_lookup_d2(i-1);
				data_lookup_valid_d2(i)	<= data_lookup_valid_d2(i-1);
				data_lookup_last_d2(i)	<= data_lookup_last_d2(i-1);
				lookup_current_addr_d(i)<= lookup_current_addr_d(i-1);
			end loop;
		end if;
	end process;

	
	--3th stage
	--first level compare
	process(clk)
		variable matches_from_hash_table	: matches_t;
	begin
		for i in 0 to INPUT_WIDTH-1 loop
			matches_from_hash_table(i).match_valid	:= match_valid_w(i);
			matches_from_hash_table(i).match_length	:= match_length_w(HASH_TABLE_HIS_WIDTH_LOG*i+HASH_TABLE_HIS_WIDTH_LOG-1 downto HASH_TABLE_HIS_WIDTH_LOG*i);
			matches_from_hash_table(i).match_addr	:= match_address_w(ADDRESS_WIDTH*i+ADDRESS_WIDTH-1 downto ADDRESS_WIDTH*i);
		end loop;
		--compare the length, if the length is the same, compare address
		if(rising_edge(clk))then
			for i in 0 to INPUT_WIDTH/2-1 loop
				matches_after_comparison(i)	<= compare_matches(matches_from_hash_table(i*2),matches_from_hash_table(i*2+1));
			end loop;
		end if;
	end process;


	--4th stage
	--second level compare
	process(clk)
	begin
		if(rising_edge(clk))then
			best_match	<= compare_matches(matches_after_comparison(0),matches_after_comparison(1));
		end if;
	end process;
	
	
	--assign the output
	lookup_match_out			<= best_match;
	data_last_out				<= data_lookup_last_d2(5);
	data_out					<= data_lookup_d2(5);	
	data_valid_out				<= data_lookup_valid_d2(5);
	lookup_current_addr_out    	<= lookup_current_addr_d(5);
	
	data_hist_out               <= data_lookup_d2(1)(data_lookup_d2(1)'length-1 downto data_lookup_d2(1)'length-INPUT_WIDTH*8);
	data_hist_valid_out         <= data_lookup_valid_d2(1)(0);

	
end architecture;
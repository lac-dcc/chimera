library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.compressor_pkg.all;

Library xpm;
use xpm.vcomponents.all;

entity history_match_engine is
	generic(
		HIST_ENGINE_ADDR_WIDTH 		: integer := work.arithmetic_pkg.clog2(HISTORY_DEPTH)
	);
	port(
		clk							: in std_logic;
		reset_n						: in std_logic;
		
		--some control signals
		start						: in std_logic;
		
		--write valid data in
		wr_data_in					: in std_logic_vector(INPUT_WIDTH*8-1 downto 0);
		wr_data_valid_in			: in std_logic;
		
		--read
		rd_data_in					: in std_logic_vector(HISTORY_WIDTH*8-1 downto 0); --should not change if invalid
		rd_task_valid_in			: in std_logic; --a pulse valid signal for a reading task
		rd_address_in				: in unsigned(HIST_ENGINE_ADDR_WIDTH-1 downto 0);
		rd_data_offset_in			: in unsigned(HISTORY_WIDTH_LOG-1 downto 0);
		
		--output the match
		match_selector_out			: out unsigned(MATCH_REMAIND_WIDTH-1 downto 0); --update the match_selector in the best_match_finder if match found
		match_remainding_out		: out unsigned(MATCH_REMAIND_WIDTH-1 downto 0);
		match_ready_out				: out std_logic; --whether there is a match ready
		match_ack_in				: in std_logic   --whether best_match_finder acknewledge the reading of match
	);
end entity;

architecture rtl of history_match_engine is
	signal hist_wr_en			: std_logic;
	signal hist1_wr_data		: std_logic_vector(HISTORY_WIDTH*8-1 downto 0);
	signal hist2_wr_data		: std_logic_vector((HISTORY_WIDTH-1)*8-1 downto 0);
	signal hist1_wr_wea			: std_logic_vector(HISTORY_WIDTH-1 downto 0);
	signal hist2_wr_wea			: std_logic_vector(HISTORY_WIDTH-2 downto 0);
	signal hist_wr1_address		: unsigned(HIST_ENGINE_ADDR_WIDTH-1 downto 0);
	signal hist_wr2_address		: unsigned(HIST_ENGINE_ADDR_WIDTH-1 downto 0);
	signal hist_wr_cnt			: unsigned(HIST_ENGINE_ADDR_WIDTH downto 0);
	signal hist_rd_en			: std_logic;
	--------------------------
	---Signals for match------
	--------------------------
	type hist_state_t is (HIST_READ, HIST_WAIT, HIST_MATCH);
	signal rd_state_r			: hist_state_t;
	signal rd_state_w			: hist_state_t;
	
	signal rd_addr_select		: std_logic; --0: read from address from best_match_finder, 1: read from the next address
	signal rd_address			: unsigned(HIST_ENGINE_ADDR_WIDTH-1 downto 0);
	signal rd_addr_selected		: unsigned(HIST_ENGINE_ADDR_WIDTH-1 downto 0);
	
	signal rd_data_offset		: unsigned(HISTORY_WIDTH_LOG-1 downto 0);
	signal rd_offset_selected	: unsigned(HISTORY_WIDTH_LOG-1 downto 0);
	signal rd_data_ready		: std_logic;	
	
	signal rd_data_valid_d		: std_logic;
	signal rd_data_valid_d2		: std_logic;
	signal rd_data1_w			: std_logic_vector(HISTORY_WIDTH*8-1 downto 0);
	signal rd_data2_w			: std_logic_vector((HISTORY_WIDTH-1)*8-1 downto 0);
	signal rd_address_d			: unsigned(HIST_ENGINE_ADDR_WIDTH-1 downto 0);	
	
	signal rd_data_aligned		: std_logic_vector((HISTORY_WIDTH*2-1)*8-1 downto 0);
	signal match_flag_vector	: std_logic_vector(HISTORY_WIDTH*2-2 downto 0);
	signal match_valid			: std_logic;
	signal match_handshake		: std_logic;
	signal match_flag_vector_w	: std_logic_vector(HISTORY_WIDTH*2-2 downto 0);
	
begin

	buffer1 : entity work.common_clk_sdpram
	generic map(
		DATA_WIDTH		=> HISTORY_WIDTH,
		DATA_DEPTH		=> HISTORY_DEPTH,
		ADDRESS_WIDTH	=> HIST_ENGINE_ADDR_WIDTH
	)
	port map(
		clk				=> clk,
		
		wea				=> hist1_wr_wea,
		addra			=> hist_wr1_address,
		dina			=> hist1_wr_data,
		ena				=> hist_wr_en,
		
		enb				=> hist_rd_en,
		addrb			=> rd_addr_selected,
		doutb			=> rd_data1_w
	);
	
	buffer2 : entity work.common_clk_sdpram
	generic map(
		DATA_WIDTH		=> (HISTORY_WIDTH-1),
		DATA_DEPTH		=> HISTORY_DEPTH,
		ADDRESS_WIDTH	=> HIST_ENGINE_ADDR_WIDTH
	)
	port map(
		clk				=> clk,
		
		wea				=> hist2_wr_wea,
		addra			=> hist_wr2_address,
		dina			=> hist2_wr_data,
		ena				=> hist_wr_en,
		
		enb				=> hist_rd_en,
		addrb			=> rd_addr_selected,
		doutb			=> rd_data2_w
	);
	
	------------------------
	-----Write data in------
	------------------------
	
	--duplicate the high 4 bytes of input data
	hist1_wr_data	<= std_logic_vector(wr_data_in & wr_data_in);
	hist2_wr_data	<= std_logic_vector(wr_data_in & wr_data_in(INPUT_WIDTH*8-1 downto 8));
	hist1_wr_wea	<= (ALL_ONES(INPUT_WIDTH-1 downto 0) & ALL_ZEROS(INPUT_WIDTH-1 downto 0))  when hist_wr_cnt(0) = '0'
						else (ALL_ZEROS(INPUT_WIDTH-1 downto 0) & ALL_ONES(INPUT_WIDTH-1 downto 0));
	hist2_wr_wea	<= (ALL_ONES(INPUT_WIDTH-1 downto 0) & ALL_ZEROS(INPUT_WIDTH-2 downto 0))  when hist_wr_cnt(0) = '0'
						else (ALL_ZEROS(INPUT_WIDTH-1 downto 0) & ALL_ONES(INPUT_WIDTH-2 downto 0));	
	hist_wr_en		<= wr_data_valid_in;
	
	--increment the writing address
	process(clk)
	begin
		if(rising_edge(clk))then
			if(start = '1')then
				hist_wr_cnt		<= (others => '0');
			elsif(wr_data_valid_in = '1')then
				hist_wr_cnt		<= hist_wr_cnt + 1;--intentinal overflow
			end if;
		end if;
	end process;
	
	hist_wr1_address		<= hist_wr_cnt(HIST_ENGINE_ADDR_WIDTH downto 1);
	hist_wr2_address		<= hist_wr1_address - 1;
	
	------------------------
	-----Read and match-----
	------------------------
	--the reading address has two sources: input from history_match_engine for new request or (old address + 1) for consequtive reading
	process(all)
	begin
		if(rd_data_ready = '1')then
			if(and_reduce(match_flag_vector_w(HISTORY_WIDTH*2-2 downto HISTORY_WIDTH*2-2-INPUT_WIDTH*2+1)) = '1')then
				rd_addr_select		<=	'1';
			else
				rd_addr_select		<=	'0';
			end if;
		else
			rd_addr_select		<=	'0';
		end if;
	end process;
	
	rd_addr_selected	<= rd_address_in	when rd_addr_select = '0'
							else rd_address;
	rd_offset_selected	<= rd_data_offset_in when rd_addr_select = '0'
							else rd_data_offset;
							
	--each high pulse of match_handshake means a match is transfered to history_match_engine (and acknewledged)
	match_handshake		<= match_ack_in and rd_data_ready;
	
	--there are two cases we need to update the reading address:
	--1. a new request comes (rd_task_valid_in = '1' or match_handshake = '1')
	--2. start a consequtive reading (match_handshake = '1')
	hist_rd_en			<= rd_task_valid_in or match_handshake;

	--FSM to control the output
	process(clk)
	begin
		if(rising_edge(clk))then
			if(reset_n = '0')then
				rd_state_r	<= HIST_READ;
			elsif(start = '1')then
				rd_state_r	<= HIST_READ;
			else
				rd_state_r	<= rd_state_w;
			end if;
		end if;
	end process;
	
	process(all)
	begin
		case rd_state_r is
			when HIST_READ =>
				if(rd_task_valid_in = '1')then --wait until the request
					rd_state_w		<= HIST_WAIT;
					assert rd_addr_select = '0'report "rd_addr_select wrong" severity failure;
				else
					rd_state_w		<= rd_state_r;
				end if;
	
			when HIST_WAIT=> --wait for one cycle until the reading data is ready
				rd_state_w		<= HIST_MATCH;
					
			--this state is corresponding to the HIST_ACK_WAITING state in best_match_finder
			--also the logic to solve 3 cases
			when HIST_MATCH =>
				if(match_ack_in = '1')then 
					if(and_reduce(match_flag_vector_w(HISTORY_WIDTH*2-2 downto HISTORY_WIDTH*2-2-INPUT_WIDTH*2+1)) = '1' )then --check whether all bytes are matched
						rd_state_w		<= HIST_WAIT;
					else
						if(rd_task_valid_in = '1')then
							rd_state_w		<= HIST_WAIT;
						else
							rd_state_w		<= HIST_READ;
						end if;
					end if;
				else
					rd_state_w		<= rd_state_r;
				end if;
			when others =>
				rd_state_w		<= rd_state_r;
		end case;
	end process;
	
	rd_data_ready	<= '1' when rd_state_r = HIST_MATCH
						else '0';
	
	process(clk)
	begin
		if(rising_edge(clk))then
			case rd_state_r is
				when HIST_READ =>
					rd_data_offset	<= rd_data_offset_in;
					rd_address		<= rd_address_in;
				when HIST_WAIT=>
					rd_address		<= rd_address + 1;
					rd_data_offset	<= rd_data_offset;
				when HIST_MATCH =>
					if(match_ack_in = '1')then 
						if(and_reduce(match_flag_vector_w(HISTORY_WIDTH*2-2 downto HISTORY_WIDTH*2-2-INPUT_WIDTH*2+1)) = '1' )then --check whether all bytes are matched
							rd_data_offset	<= rd_data_offset;
							rd_address		<= rd_address;
						else
							rd_data_offset	<= rd_offset_selected; --if not consequtive reading, update offset
							rd_address		<= rd_address_in;
						end if;
					else
						rd_data_offset	<= rd_data_offset;
						rd_address		<= rd_address;
					end if;
				when others =>
					null;
			end case;
		end if;
	end process;
	
	
	--stage1
	process(clk)
		variable rd_data_concacted		: std_logic_vector((HISTORY_WIDTH*2-1)*8-1 downto 0);
	begin
		if(rising_edge(clk))then
			rd_data_concacted	:= rd_data_in & (ALL_ZEROS((HISTORY_WIDTH-1)*8-1 downto 0));
			if(rd_task_valid_in = '1' or match_handshake = '1')then
				rd_data_aligned		<= std_logic_vector(shift_right(unsigned(rd_data_concacted), to_integer(rd_offset_selected)*8));
			end if;
		end if;
	end process;
	
	--stage2
	-- | MSB to bit3  				| bit2 to bit 0 			|
	-- | Determine the read address	| Determine the shift bytes	|
	process(clk)
		variable hist_rd_data			: std_logic_vector((HISTORY_WIDTH*2-1)*8-1 downto 0);
	begin
		if(rising_edge(clk))then
			hist_rd_data		:= rd_data1_w & rd_data2_w;
			
			for i in 0 to (HISTORY_WIDTH*2-2) loop --check whether each byte matches
				if(rd_data_aligned(i*8+7 downto i*8) = hist_rd_data(i*8+7 downto i*8))then
					match_flag_vector(i)	<= '1';
				else
					match_flag_vector(i)	<= '0';
				end if;
			end loop;
			
		end if;
	end process;

	
	---stage 3, combinational logic
	process(all)
		variable match_flag_vector_v	: std_logic_vector(HISTORY_WIDTH*2-2 downto 0);
	begin
		match_flag_vector_v		:= std_logic_vector(shift_left(unsigned(match_flag_vector), to_integer(rd_data_offset)));
		match_flag_vector_w		<= match_flag_vector_v;
			
		--check the length of match 
		match_selector_out 		<= leading_zero_counter(match_flag_vector_v(HISTORY_WIDTH*2-2 downto HISTORY_WIDTH*2-INPUT_WIDTH-1));
			
		--if the starting 4 bytes are match, it is possible that the match extended to the next slice
		if(and_reduce(match_flag_vector_v(HISTORY_WIDTH*2-2 downto HISTORY_WIDTH*2-INPUT_WIDTH-1)) = '1' )then
			match_remainding_out	<= leading_zero_counter(match_flag_vector_v(HISTORY_WIDTH*2-INPUT_WIDTH-2 downto HISTORY_WIDTH*2-INPUT_WIDTH*2-1));
		else
			match_remainding_out	<= (others => '0');
		end if;
		
	end process;
	
	match_ready_out				<= rd_data_ready;
end architecture;
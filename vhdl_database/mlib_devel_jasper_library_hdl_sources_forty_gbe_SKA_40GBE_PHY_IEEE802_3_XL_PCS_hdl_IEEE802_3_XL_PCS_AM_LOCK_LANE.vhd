----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 30.07.2014 15:24:59
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS_AM_LOCK - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.IEEE802_3_XL_PKG.all;

entity IEEE802_3_XL_PCS_AM_LOCK_LANE is
	Generic(
		DEFAULT_LANE_MAP : NIBBLE_t := "0001"
	);
	Port(
		CLK_I        : in  std_logic;
		RST_I        : in  std_logic;

		BLOCK_LOCK_I : in  std_logic;

		PCS_BLOCK_I  : in  BLOCK_t;
		PCS_BLOCK_O  : out BLOCK_t;
		AM_VALID_O   : out std_logic;

		AM_LOCK_O    : out std_logic;
		LANE_MAP_O   : out NIBBLE_t
	);
end IEEE802_3_XL_PCS_AM_LOCK_LANE;

architecture Behavioral of IEEE802_3_XL_PCS_AM_LOCK_LANE is
	--	component AM_LOCK_ILA
	--		PORT(
	--			clk    : in std_logic;
	--
	--			probe0 : in std_logic_vector(0 downto 0);
	--			probe1 : in std_logic_vector(3 downto 0);
	--			probe2 : in std_logic_vector(0 downto 0)
	--		);
	--	end component;

	-- 1 Cycle delay
	signal rx_coded_d1 : BLOCK_t;

	-- 2 Cycle delay
	signal rx_coded_d2 : BLOCK_t;

	-- 2 Cycle delay
	signal rx_coded_d3 : BLOCK_t;

	signal am_valid    : boolean;
	signal lane_map    : NIBBLE_t;
	signal lane_map_d2 : NIBBLE_t;

	signal next_am : std_logic_vector(47 downto 0);

	signal current_am_index_valid : boolean;
	signal current_am_index       : std_logic_vector(1 downto 0);

	signal first_am_index_valid : boolean;
	signal first_am_index       : std_logic_vector(1 downto 0);

	signal current_equal_first : boolean;

	--AM to AM Block Counter
	signal am_counter       : unsigned(14 downto 0);
	signal start_am_counter : boolean;
	signal am_counter_done  : boolean;

	signal am_invld_cnt      : unsigned(1 downto 0);
	signal am_invld_cnt_done : boolean;

	-- This is a sample state-machine using enumerated types.
	-- This will allow the synthesis tool to select the appropriate
	-- encoding style and will make the code more readable.

	--Insert the following in the architecture before the begin keyword
	--Use descriptive names for the states, like st1_reset, st2_search
	type state_type is (AM_LOCK_INIT, FIND_FIRST, FIRST_FOUND, COUNT_ONE, TWO_GOOD, COUNT_TWO, GOOD_AM, INVALID_AM);
	signal state, next_state : state_type;
	--Declare internal signals for all outputs of the state-machine
	signal output_is_am      : std_logic := '0';
	signal output_am_lock    : std_logic := '0';

	--DEBUG
	signal am_valid_d1         : std_logic;
	signal start_am_counter_d1 : std_logic;

begin
	--	REGISTER_INPUT_proc : process(CLK_I) is
	--	begin
	--		if rising_edge(CLK_I) then
	rx_coded_d1 <= PCS_BLOCK_I;
	--		end if;
	--	end process REGISTER_INPUT_proc;

	next_am <= rx_coded_d1.P(55 downto 32) & rx_coded_d1.P(23 downto 0);

	AM_DETECTOR_DECODER_PROC : process(CLK_I) is
	begin
		if (rising_edge(CLK_I)) then
			case (next_am) is
				when (AM_BLOCKs(0).P(55 downto 32) & AM_BLOCKs(0).P(23 downto 0)) =>
					am_valid         <= true;
					current_am_index <= "00";
				when (AM_BLOCKs(1).P(55 downto 32) & AM_BLOCKs(1).P(23 downto 0)) =>
					am_valid         <= true;
					current_am_index <= "01";
				when (AM_BLOCKs(2).P(55 downto 32) & AM_BLOCKs(2).P(23 downto 0)) =>
					am_valid         <= true;
					current_am_index <= "10";
				when (AM_BLOCKs(3).P(55 downto 32) & AM_BLOCKs(3).P(23 downto 0)) =>
					am_valid         <= true;
					current_am_index <= "11";
				when others =>
					am_valid         <= false;
					current_am_index <= "00";
			end case;

			case (next_am(5 downto 4)) is
				when (AM_BLOCKs(0).P(5 downto 4)) =>
					lane_map <= "0001";
				when (AM_BLOCKs(1).P(5 downto 4)) =>
					lane_map <= "0010";
				when (AM_BLOCKs(2).P(5 downto 4)) =>
					lane_map <= "0100";
				when (AM_BLOCKs(3).P(5 downto 4)) =>
					lane_map <= "1000";
				when others =>
			end case;

			if (am_valid) then
				lane_map_d2 <= lane_map;
			end if;

		end if;
	end process AM_DETECTOR_DECODER_PROC;

	current_am_index_valid <= am_valid;

	DATA_DELAY_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			rx_coded_d2 <= rx_coded_d1;
		end if;
	end process DATA_DELAY_PROC;

	SYNC_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if ((RST_I = '1') or (BLOCK_LOCK_I = '0')) then
				state <= AM_LOCK_INIT;
			else
				state <= next_state;
			end if;
		end if;
	end process SYNC_PROC;

	NEXT_STATE_DECODE : process(state, am_valid, am_counter_done, current_equal_first, am_invld_cnt_done) is
	begin
		--declare default state for next_state to avoid latches
		next_state <= state;            --default is to stay in current state
		--insert statements to decode next_state
		--below is a simple example

		case (state) is
			when AM_LOCK_INIT =>
				start_am_counter <= false;
				next_state       <= FIND_FIRST;
			when FIND_FIRST =>
				start_am_counter <= false;
				if (am_valid) then
					next_state <= FIRST_FOUND;
				else
					next_state <= FIND_FIRST;
				end if;
			when FIRST_FOUND =>
				start_am_counter <= true;
				next_state       <= COUNT_ONE;
			when COUNT_ONE =>
				if (am_counter_done) then
					--COMP_SECOND STATE
					start_am_counter <= false;
					if (current_equal_first) then
						next_state <= TWO_GOOD;
					else
						next_state <= FIND_FIRST;
					end if;
				else
					start_am_counter <= true;
				end if;
			when TWO_GOOD =>
				start_am_counter <= true;
				next_state       <= COUNT_TWO;
			when COUNT_TWO =>
				if (am_counter_done) then
					--COMP_AM STATE
					start_am_counter <= false;
					if (current_equal_first) then
						next_state <= GOOD_AM;
					else
						next_state <= INVALID_AM;
					end if;
				else
					start_am_counter <= true;
				end if;
			when GOOD_AM =>
				start_am_counter <= true;
				next_state       <= COUNT_TWO;
			when INVALID_AM =>
				if (am_invld_cnt_done) then
					start_am_counter <= false;
					next_state       <= FIND_FIRST;
				else
					start_am_counter <= true;
					next_state       <= COUNT_TWO;
				end if;
		end case;
	end process NEXT_STATE_DECODE;

	AM_COUNTER_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (start_am_counter) then
				am_counter <= am_counter + 1;
			else
				am_counter <= (others => '0');
			end if;
		end if;
	end process AM_COUNTER_PROC;

	am_counter_done <= (am_counter = 16383);

	INVLD_COUNT_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			case state is
				when FIND_FIRST =>
					am_invld_cnt <= (others => '0');
				when INVALID_AM =>
					if (am_invld_cnt_done) then
						am_invld_cnt <= am_invld_cnt;
					else
						am_invld_cnt <= am_invld_cnt + 1;
					end if;
				when others =>
					am_invld_cnt <= am_invld_cnt;
			end case;
		end if;
	end process INVLD_COUNT_PROC;

	am_invld_cnt_done <= (am_invld_cnt = 3);

	name : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			case state is
				when FIND_FIRST =>
					first_am_index       <= current_am_index;
					first_am_index_valid <= am_valid;
				when others =>
					null;
			end case;
		end if;
	end process name;

	current_equal_first <= (current_am_index = first_am_index) and current_am_index_valid;

	--MOORE State-Machine - Outputs based on state only
	IS_AM_OUTPUT_DECODE : process(state)
	begin
		case state is
			when FIRST_FOUND | TWO_GOOD | GOOD_AM | INVALID_AM =>
				output_is_am <= '1';
			when others =>
				output_is_am <= '0';
		end case;
	end process IS_AM_OUTPUT_DECODE;

	--MOORE State-Machine - Outputs based on state only
	AM_LOCK_OUTPUT_DECODE : process(state)
	begin
		case state is
			when AM_LOCK_INIT | FIND_FIRST | FIRST_FOUND | COUNT_ONE =>
				output_am_lock <= '0';
			when TWO_GOOD | COUNT_TWO | GOOD_AM | INVALID_AM =>
				output_am_lock <= '1';
		end case;
	end process AM_LOCK_OUTPUT_DECODE;

	--MEALY State-Machine - Outputs based on state and inputs
	LANE_MAP_OUTPUT_DECODE : process(CLK_I)
	begin
		if rising_edge(CLK_I) then
			if (RST_I = '1') then
				LANE_MAP_O <= DEFAULT_LANE_MAP;
			else
				if (state = TWO_GOOD) then
					LANE_MAP_O <= lane_map_d2;
				end if;
			end if;
		end if;
	end process LANE_MAP_OUTPUT_DECODE;

	DATA_DELAY2_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			rx_coded_d3 <= rx_coded_d2;
		end if;
	end process DATA_DELAY2_PROC;

	REGISTER_OUTPUT_PROC : process(RST_I, CLK_I)
	begin
		if (RST_I = '1') then
			AM_VALID_O <= '0';
			AM_LOCK_O  <= '0';
		else
			if rising_edge(CLK_I) then
				AM_VALID_O <= output_is_am;
				AM_LOCK_O  <= output_am_lock;
			end if;
		end if;

		if rising_edge(CLK_I) then
			PCS_BLOCK_O <= rx_coded_d3;
		end if;
	end process REGISTER_OUTPUT_PROC;

	--DEBUG

	DEBUG_REGISTER_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if RST_I = '1' then
				am_valid_d1         <= '0';
				start_am_counter_d1 <= '0';
			else
				if (am_valid) then
					am_valid_d1 <= '1';
				else
					am_valid_d1 <= '0';
				end if;
				if (start_am_counter) then
					start_am_counter_d1 <= '1';
				else
					start_am_counter_d1 <= '0';
				end if;

			end if;
		end if;
	end process DEBUG_REGISTER_proc;

end Behavioral;

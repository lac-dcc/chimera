----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 28.07.2014 14:57:53
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS_DECODER - Behavioral
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

entity IEEE802_3_XL_PCS_DECODER is
	Port(
		CLK_I                      : in  std_logic;
		RST_I                      : in  std_logic;

		PCS_BLOCK_I                : in  BLOCK_t;

		BLOCK_IDLE_I               : in  std_logic;

		-- XLGMII Output Interface
		-- Receiver Interface
		XLGMII_RX_O                : out XLGMII_t;

		FRAME_START_DETECTED_O     : out std_logic;
		FRAME_TERMINATE_DETECTED_O : out std_logic
	);
end IEEE802_3_XL_PCS_DECODER;

architecture Behavioral of IEEE802_3_XL_PCS_DECODER is
	attribute DONT_TOUCH : string;
	type R_TYPE_t is (C, S, T, D, E);

	-- 1 Cycle delay
	signal rx_coded_P_d1 : std_logic_vector(63 downto 0);

	signal rx_idle_d1    : std_logic;
	signal rx_term_d1    : std_logic;
	signal rx_control_d1 : std_logic;
	signal rx_data_d1    : std_logic;

	-- 2 Cycle delay
	signal rx_coded_P_d2    : std_logic_vector(63 downto 0);
	signal rx_coded_d1_type : BLOCK_TYPE_t;

	signal rx_idle_d2 : std_logic;
	signal rx_term_d2 : std_logic;
	signal rx_data_d2 : std_logic;

	signal R_TYPE_NEXT_IS_S_OR_C : boolean;

	-- 3 Cycle delay
	signal rx_coded_P_d3    : std_logic_vector(63 downto 0);
	signal rx_coded_d2_type : BLOCK_TYPE_t;

	signal rx_term_data_mask : std_logic_vector(7 downto 0);

	signal R_TYPE : R_TYPE_t;

	signal start_stream : std_logic;
	signal seq_stream   : std_logic;
	signal term_stream  : std_logic;

	-- 4 Cycle Delay
	signal rx_raw_D         : std_logic_vector(63 downto 0);
	signal rx_raw_t         : XLGMII_t := IBLOCK_R;
	signal rx_coded_d3_type : BLOCK_TYPE_t;

	signal rx_raw_en_term_char : std_logic_vector(7 downto 0);

	signal idle_stream         : std_logic;
	signal start_or_seq_stream : std_logic;

	type state_type is (RX_INIT, RX_C, RX_D, RX_T, RX_E);
	signal state, next_state : state_type;

	-- 5 Cycle Delay
	signal rx_raw_d1   : XLGMII_t := LBLOCK_R;
	signal rx_raw_t_d1 : XLGMII_t := IBLOCK_R;

	signal rx_error_en : std_logic_vector(7 downto 0);
	signal rx_term_en  : std_logic_vector(7 downto 0);

	attribute DONT_TOUCH of rx_error_en : signal is "true";
	attribute DONT_TOUCH of rx_term_en : signal is "true";

	signal start_counter_en     : std_logic            := '0';
	signal start_count          : unsigned(1 downto 0) := (others => '0');
	signal terminate_counter_en : std_logic            := '0';
	signal terminate_count      : unsigned(1 downto 0) := (others => '0');

begin
	REGISTER_INPUT_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (RST_I = '1') then
				rx_coded_P_d1 <= LBLOCK_T.P;
				rx_idle_d1    <= '0';
				rx_data_d1    <= '0';
				rx_control_d1 <= '1';
				rx_term_d1    <= '0';
			else
				rx_coded_P_d1 <= PCS_BLOCK_I.P;
				rx_idle_d1    <= BLOCK_IDLE_I;
				rx_data_d1    <= PCS_BLOCK_I.H(1) and (not PCS_BLOCK_I.H(0));
				rx_control_d1 <= (not PCS_BLOCK_I.H(1)) and PCS_BLOCK_I.H(0);
				rx_term_d1    <= PCS_BLOCK_I.P(7) and PCS_BLOCK_I.H(0);

			end if;
		end if;
	end process REGISTER_INPUT_proc;

	RX_CODED_DECODE_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			rx_coded_P_d2 <= rx_coded_P_d1;

			rx_idle_d2 <= rx_idle_d1;
			rx_term_d2 <= rx_term_d1;
			rx_data_d2 <= rx_data_d1;

			if (rx_control_d1 = '1') then
				if (rx_term_d1 = '1') then
					rx_coded_d1_type      <= TX;
					R_TYPE_NEXT_IS_S_OR_C <= false;
				else
					case (rx_coded_P_d1(6 downto 4)) is
						when "111" =>
							rx_coded_d1_type      <= S0;
							R_TYPE_NEXT_IS_S_OR_C <= true;
						when "100" =>
							rx_coded_d1_type      <= O0;
							R_TYPE_NEXT_IS_S_OR_C <= true;
						when "001" =>
							rx_coded_d1_type      <= IX;
							R_TYPE_NEXT_IS_S_OR_C <= true;
						when others =>
							rx_coded_d1_type      <= EX;
							R_TYPE_NEXT_IS_S_OR_C <= false;
					end case;
				end if;
			else
				if (rx_data_d1 = '1') then
					rx_coded_d1_type <= DX;
				else
					rx_coded_d1_type <= EX;
				end if;
				R_TYPE_NEXT_IS_S_OR_C <= false;
			end if;

		end if;
	end process RX_CODED_DECODE_PROC;

	RX_TYPE_DETERMINATION_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			rx_coded_P_d3    <= rx_coded_P_d2;
			rx_coded_d2_type <= rx_coded_d1_type;

			if (rx_idle_d2 = '1') then
				rx_term_data_mask <= "11111111";
			else
				case (rx_coded_P_d2(6 downto 4)) is
					when "000"  => rx_term_data_mask <= "11111111";
					when "001"  => rx_term_data_mask <= "11111110";
					when "010"  => rx_term_data_mask <= "11111100";
					when "011"  => rx_term_data_mask <= "11111000";
					when "100"  => rx_term_data_mask <= "11110000";
					when "101"  => rx_term_data_mask <= "11100000";
					when "110"  => rx_term_data_mask <= "11000000";
					when "111"  => rx_term_data_mask <= "10000000";
					when others => rx_term_data_mask <= "11111111"; --Syntax requirement
				end case;
			end if;

			-- NEXT 
			case (rx_coded_d1_type) is
				when DX => R_TYPE <= D;
				when IX => R_TYPE <= C;
				when S0 => R_TYPE <= S;
				when O0 => R_TYPE <= C;
				when TX => R_TYPE <= T;
				when EX => R_TYPE <= E;
			end case;

			if (rx_coded_d1_type = S0) then
				start_stream <= '1';
			else
				start_stream <= '0';
			end if;

			if (rx_coded_d1_type = O0) then
				seq_stream <= '1';
			else
				seq_stream <= '0';
			end if;

			if (rx_coded_d1_type = TX) then
				term_stream <= '1';
			else
				term_stream <= '0';
			end if;
		end if;
	end process RX_TYPE_DETERMINATION_PROC;

	BYTES_RX_RAW_T : for i in 0 to 6 generate
	begin
		RX_RAW_T_proc : process(CLK_I) is
		begin
			if rising_edge(CLK_I) then
				rx_raw_t.C(i) <= rx_term_data_mask(i);

				if (rx_term_data_mask(i) = '1') then
					rx_raw_t.D(((i + 1) * 8) - 1 downto i * 8) <= rI;
				else
					rx_raw_t.D(((i + 1) * 8) - 1 downto i * 8) <= rx_coded_P_d3(((i + 2) * 8) - 1 downto ((i + 1) * 8));
				end if;
			end if;
		end process RX_RAW_T_proc;
	end generate BYTES_RX_RAW_T;

	RX_RECODE_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (rx_coded_d2_type = IX) then
				idle_stream <= '1';
			else
				idle_stream <= '0';
			end if;

			if ((rx_coded_d2_type = S0) or (rx_coded_d2_type = O0)) then
				start_or_seq_stream <= '1';
			else
				start_or_seq_stream <= '0';
			end if;

			if (start_stream = '1') then
				rx_raw_D(7 downto 0) <= rS;
			elsif (seq_stream = '1') then
				rx_raw_D(7 downto 0) <= rO;
			else
				rx_raw_D(7 downto 0) <= rx_coded_P_d3(7 downto 0);
			end if;

			rx_raw_D(63 downto 8) <= rx_coded_P_d3(63 downto 8);

			rx_coded_d3_type <= rx_coded_d2_type;

			case (rx_coded_P_d3(6 downto 4)) is
				when "000"  => rx_raw_en_term_char <= "00000001";
				when "001"  => rx_raw_en_term_char <= "00000010";
				when "010"  => rx_raw_en_term_char <= "00000100";
				when "011"  => rx_raw_en_term_char <= "00001000";
				when "100"  => rx_raw_en_term_char <= "00010000";
				when "101"  => rx_raw_en_term_char <= "00100000";
				when "110"  => rx_raw_en_term_char <= "01000000";
				when "111"  => rx_raw_en_term_char <= "10000000";
				when others => rx_raw_en_term_char <= "00000000"; --Syntax requirement
			end case;

		end if;
	end process RX_RECODE_PROC;

	BYTES_RX_RAW_T_d2 : for i in 0 to 7 generate
	begin
		RX_RAW_T_proc : process(CLK_I) is
		begin
			if rising_edge(CLK_I) then
				rx_raw_t_d1.C(i) <= rx_raw_t.C(i);

				if (rx_raw_en_term_char(i) = '1') then
					rx_raw_t_d1.D(((i + 1) * 8) - 1 downto i * 8) <= rT;
				else
					rx_raw_t_d1.D(((i + 1) * 8) - 1 downto i * 8) <= rx_raw_t.D(((i + 1) * 8) - 1 downto i * 8);
				end if;
			end if;
		end process RX_RAW_T_proc;
	end generate BYTES_RX_RAW_T_d2;

	RX_RECODE2_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (idle_stream = '1') then
				rx_raw_d1.C <= (others => '1');
				rx_raw_d1.D <= rx_raw_t.D;
			else
				rx_raw_d1.C(0)          <= start_or_seq_stream;
				rx_raw_d1.C(7 downto 1) <= (others => '0');
				rx_raw_d1.D             <= rx_raw_D;
			end if;
		end if;
	end process RX_RECODE2_PROC;

	--Insert the following in the architecture after the begin keyword
	SYNC_PROC : process(CLK_I)
	begin
		if rising_edge(CLK_I) then
			if (RST_I = '1') then
				state <= RX_INIT;
			else
				state <= next_state;
			end if;
		end if;
	end process;

	NEXT_STATE_DECODE : process(state, R_TYPE, R_TYPE_NEXT_IS_S_OR_C)
	begin
		--declare default state for next_state to avoid latches
		next_state <= state;            --default is to stay in current state
		--insert statements to decode next_state
		--below is a simple example
		case (state) is
			when RX_INIT =>
				case R_TYPE is
					when S         => next_state <= RX_D;
					when C         => next_state <= RX_C;
					when E | D | T => next_state <= RX_E;
				end case;

			when RX_C =>
				case R_TYPE is
					when C         => next_state <= RX_C;
					when S         => next_state <= RX_D;
					when E | D | T => next_state <= RX_E;
				end case;

			when RX_D =>
				case R_TYPE is
					when D => next_state <= RX_D;
					when T =>
						if R_TYPE_NEXT_IS_S_OR_C then
							next_state <= RX_T;
						else
							next_state <= RX_E;
						end if;
					when E | C | S => next_state <= RX_E;
				end case;

			when RX_T =>
				case R_TYPE is
					when C      => next_state <= RX_C;
					when S      => next_state <= RX_D;
					when others => next_state <= RX_E; --Not Part of Standard
				end case;

			when RX_E =>
				case R_TYPE is
					when T =>
						if R_TYPE_NEXT_IS_S_OR_C then
							next_state <= RX_T;
						else
							next_state <= RX_E;
						end if;
					when D     => next_state <= RX_D;
					when C     => next_state <= RX_C;
					when E | S => next_state <= RX_E;
				end case;

			when others =>
				next_state <= RX_INIT;

		end case;
	end process;

	OUTPUT_DECODE : process(CLK_I)
	begin
		if rising_edge(CLK_I) then
			if (RST_I = '1') then
				rx_error_en <= x"00";
				rx_term_en  <= x"00";
			else
				if (state = RX_E) then
					rx_error_en <= x"FF";
				else
					rx_error_en <= x"00";
				end if;

				if (state = RX_T) then
					rx_term_en <= x"FF";
				else
					rx_term_en <= x"00";
				end if;
			end if;
		end if;
	end process;

	REGISTER_OUTPUT_PROC_generate : for i in 0 to 7 generate
	begin
		REGISTER_OUTPUT_PROC : process(CLK_I)
		begin
			if rising_edge(CLK_I) then
				if (rx_error_en(i) = '1') then
					XLGMII_RX_O.C(i)                            <= EBLOCK_R.C(i);
					XLGMII_RX_O.D((i + 1) * 8 - 1 downto i * 8) <= EBLOCK_R.D((i + 1) * 8 - 1 downto i * 8);
				else
					if (rx_term_en(i) = '1') then
						XLGMII_RX_O.C(i)                            <= rx_raw_t_d1.C(i);
						XLGMII_RX_O.D((i + 1) * 8 - 1 downto i * 8) <= rx_raw_t_d1.D((i + 1) * 8 - 1 downto i * 8);
					else
						XLGMII_RX_O.C(i)                            <= rx_raw_d1.C(i);
						XLGMII_RX_O.D((i + 1) * 8 - 1 downto i * 8) <= rx_raw_d1.D((i + 1) * 8 - 1 downto i * 8);
					end if;
				end if;
			end if;
		end process REGISTER_OUTPUT_PROC;
	end generate REGISTER_OUTPUT_PROC_generate;

	FRAME_COUNT_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (RST_I = '1') then
				start_counter_en     <= '0';
				start_count          <= (others => '0');
				terminate_counter_en <= '0';
				terminate_count      <= (others => '0');
			else
				start_counter_en <= start_stream;
				if start_counter_en = '1' then
					start_count <= start_count + 1;
				end if;

				terminate_counter_en <= term_stream;
				if terminate_counter_en = '1' then
					terminate_count <= terminate_count + 1;
				end if;
			end if;
		end if;
	end process FRAME_COUNT_proc;

	FRAME_DETECT_OUTPUT_proc : process(CLK_I, RST_I) is
	begin
		if RST_I = '1' then
			FRAME_START_DETECTED_O     <= '0';
			FRAME_TERMINATE_DETECTED_O <= '0';
		elsif rising_edge(CLK_I) then
			FRAME_START_DETECTED_O     <= start_count(1);
			FRAME_TERMINATE_DETECTED_O <= terminate_count(1);
		end if;
	end process FRAME_DETECT_OUTPUT_proc;

end Behavioral;

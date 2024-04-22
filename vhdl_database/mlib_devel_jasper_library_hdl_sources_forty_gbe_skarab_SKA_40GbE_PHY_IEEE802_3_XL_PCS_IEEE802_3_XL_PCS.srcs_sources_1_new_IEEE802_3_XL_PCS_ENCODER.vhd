----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (PTY) Ltd 
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 24.07.2014 16:58:53
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS_ENCODER - Behavioral
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

entity IEEE802_3_XL_PCS_ENCODER is
	Port(
		CLK_I                      : in  std_logic;
		RST_I                      : in  std_logic;
		-- XLGMII INPUT Interface
		-- Transmitter Interface
		XLGMII_TX_I                : in  XLGMII_t;

		BLOCK_VALID_O              : out std_logic;
		PCS_BLOCK_O                : out BLOCK_t;

		FRAME_START_DETECTED_O     : out std_logic;
		FRAME_TERMINATE_DETECTED_O : out std_logic
	);
end IEEE802_3_XL_PCS_ENCODER;

architecture Behavioral of IEEE802_3_XL_PCS_ENCODER is
	attribute DONT_TOUCH : string;
	type T_TYPE_t is (C, S, T, D, E);

	alias txc is XLGMII_TX_I.C;
	alias txd is XLGMII_TX_I.D;

	--1st Clock Cycle
	signal is_not_valid_ISTE_char : std_logic_vector(7 downto 0);
	signal is_not_data            : std_logic;

	signal txc_d1 : std_logic_vector(7 downto 0);
	signal txd_d1 : BYTE_ARRAY_t(7 downto 0);

	--2nd Clock Cycle
	signal data_stream     : std_logic;
	signal is_start_or_seq : std_logic;

	signal is_seq_char   : std_logic;
	signal is_start_char : std_logic;
	signal is_idle_char  : std_logic_vector(7 downto 0);
	signal is_term_char  : std_logic_vector(7 downto 0);
	signal is_error_char : std_logic_vector(7 downto 0);

	signal txd_d2 : BYTE_ARRAY_t(7 downto 0);

	--3rd Clock Cycle
	signal data_stream_d1 : std_logic;
	signal idle_stream    : std_logic;
	signal seq_stream     : std_logic;
	signal start_stream   : std_logic;
	signal term_stream    : std_logic;
	signal error_stream   : std_logic;

	signal is_idle_char_d1 : std_logic_vector(7 downto 1);
	signal is_term_char_d1 : std_logic_vector(7 downto 0);

	signal txd_d3 : BYTE_ARRAY_t(7 downto 0);

	--4th Clock Cycle
	signal T_TYPE : T_TYPE_t := C;

	--5th Clock Cycle
	type state_type is (TX_INIT, TX_C, TX_D, TX_T, TX_E);
	signal state, next_state : state_type := TX_INIT;

	signal error_state : std_logic := '0';
	signal term_state  : std_logic := '0';

	--6th Clock Cycle
	signal tx_error_en : std_logic_vector(7 downto 0);
	signal tx_term_en  : std_logic_vector(7 downto 0);
	attribute DONT_TOUCH of tx_error_en : signal is "true";
	attribute DONT_TOUCH of tx_term_en : signal is "true";

	--4th Clock Cycle
	signal data_stream_d2  : std_logic;
	signal idle_stream_d1  : std_logic;
	signal seq_stream_d1   : std_logic;
	signal start_stream_d1 : std_logic;
	signal error_stream_d1 : std_logic;

	signal is_idle_char_d2 : std_logic_vector(7 downto 1);
	signal term_byte       : std_logic_vector(2 downto 0);

	signal txd_d4 : BYTE_ARRAY_t(7 downto 0);

	--5th Clock Cycle
	signal data_stream_d3 : std_logic;
	signal idle_stream_d2 : std_logic;
	signal seq_stream_d2  : std_logic;

	signal is_idle_char_d3 : std_logic_vector(7 downto 1);
	signal term_byte_d1    : std_logic_vector(2 downto 0);

	signal txd_d5 : BYTE_ARRAY_t(7 downto 0);

	signal tx_coded      : BLOCK_t                       := LBLOCK_T;
	signal tx_coded_cd_P : std_logic_vector(63 downto 0) := LBLOCK_T.P;
	signal tx_coded_t_P  : std_logic_vector(63 downto 0);

	--6th Clock Cycle
	signal idle_stream_d3 : std_logic;

	signal tx_coded_cd_d1  : BLOCK_t := LBLOCK_T;
	signal tx_coded_t_P_d1 : std_logic_vector(63 downto 0);

	--7th Clock Cycle


	signal start_counter_en     : std_logic            := '0';
	signal start_count          : unsigned(1 downto 0) := (others => '0');
	signal terminate_counter_en : std_logic            := '0';
	signal terminate_count      : unsigned(1 downto 0) := (others => '0');

begin

	--This is not input registered
	REGISTER_INPUT_gen : for i in 0 to 7 generate
		REGISTER_INPUT_proc : process(CLK_I) is
		begin
			if rising_edge(CLK_I) then
				if (txc(i) = '1') then
					case txd((8 * i) + 7 downto (8 * i) + 3) is
						when "11111" => is_not_valid_ISTE_char(i) <= '0';
						when "00000" => is_not_valid_ISTE_char(i) <= '0';
						when others  => is_not_valid_ISTE_char(i) <= '1';
					end case;
				else
					is_not_valid_ISTE_char(i) <= '1';
				end if;

				txc_d1(i) <= txc(i);
				txd_d1(i) <= txd((8 * i + 7) downto (8 * i));
			end if;
		end process REGISTER_INPUT_proc;
	end generate REGISTER_INPUT_gen;

	CONTROL_BIT_DECODE_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			case txc(7 downto 2) is
				when "000000" => is_not_data <= '0';
				when others   => is_not_data <= '1';
			end case;
		end if;
	end process CONTROL_BIT_DECODE_proc;

	CONTROL_BIT_DECODE2_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if txc_d1(1) = '1' then
				data_stream     <= '0';
				is_start_or_seq <= '0';
			else
				if (is_not_data = '1') then
					data_stream     <= '0';
					is_start_or_seq <= '0';
				else
					data_stream     <= not txc_d1(0);
					is_start_or_seq <= txc_d1(0);
				end if;
			end if;
		end if;
	end process CONTROL_BIT_DECODE2_proc;

	generate_label : for i in 0 to 7 generate
		CHARACTER_DETECT_proc : process(CLK_I) is
		begin
			if rising_edge(CLK_I) then
				if (is_not_valid_ISTE_char(i) = '1') then
					is_idle_char(i)  <= '0';
					is_term_char(i)  <= '0';
					is_error_char(i) <= '0';
				else
					if (txd_d1(i)(3 downto 0) = rI(3 downto 0)) then
						is_idle_char(i) <= '1';
					else
						is_idle_char(i) <= '0';
					end if;

					if (txd_d1(i)(3 downto 0) = rT(3 downto 0)) then
						is_term_char(i) <= '1';
					else
						is_term_char(i) <= '0';
					end if;

					if (txd_d1(i)(3 downto 0) = rE(3 downto 0)) then
						is_error_char(i) <= '1';
					else
						is_error_char(i) <= '0';
					end if;
				end if;

				txd_d2(i) <= txd_d1(i);

			end if;
		end process CHARACTER_DETECT_proc;
	end generate generate_label;

	CHARACTER_DETECT2_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (is_not_valid_ISTE_char(0) = '1') then
				is_start_char <= '0';
			else
				if (txd_d1(0)(3 downto 0) = rS(3 downto 0)) then
					is_start_char <= '1';
				else
					is_start_char <= '0';
				end if;
			end if;

			if (txd_d1(0) = rO) then
				is_seq_char <= '1';
			else
				is_seq_char <= '0';
			end if;
		end if;
	end process CHARACTER_DETECT2_proc;

	STREAM_DETECT_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			data_stream_d1 <= data_stream;

			if (is_start_or_seq = '1') then
				seq_stream   <= is_seq_char;
				start_stream <= is_start_char;
			else
				seq_stream   <= '0';
				start_stream <= '0';
			end if;

			if (is_idle_char = "11111111") then
				idle_stream <= '1';
			else
				idle_stream <= '0';
			end if;

			if (is_term_char = "00000000") then
				term_stream <= '0';
			else
				term_stream <= '1';
			end if;

			if (is_error_char = "00000000") then
				error_stream <= '0';
			else
				error_stream <= '1';
			end if;

			is_idle_char_d1 <= is_idle_char(7 downto 1);
			is_term_char_d1 <= is_term_char;

			txd_d3 <= txd_d2;

		end if;
	end process STREAM_DETECT_proc;

	XGMII_DECODE_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			if (error_stream = '1') then
				T_TYPE <= E;
			elsif (term_stream = '1') then
				T_TYPE <= T;
			elsif (data_stream_d1 = '1') then
				T_TYPE <= D;
			elsif (idle_stream = '1') then
				T_TYPE <= C;
			elsif (start_stream = '1') then
				T_TYPE <= S;
			elsif (seq_stream = '1') then
				T_TYPE <= C;
			else
				T_TYPE <= E;
			end if;
		end if;
	end process XGMII_DECODE_PROC;

	--Insert the following in the architecture after the begin keyword
	SYNC_PROC : process(CLK_I)
	begin
		if rising_edge(CLK_I) then
			if (RST_I = '1') then
				state       <= TX_INIT;
				error_state <= '0';
				term_state  <= '0';
			else
				state <= next_state;

				if (next_state = TX_E) then
					error_state <= '1';
				else
					error_state <= '0';
				end if;

				if (next_state = TX_T) then
					term_state <= '1';
				else
					term_state <= '0';
				end if;
			end if;
		end if;
	end process;

	NEXT_STATE_DECODE : process(state, T_TYPE)
	begin
		next_state <= state;            --default is to stay in current state

		case (state) is
			when TX_INIT =>
				case T_TYPE is
					when S         => next_state <= TX_D;
					when C         => next_state <= TX_C;
					when E | D | T => next_state <= TX_E;
				end case;

			when TX_C =>
				case T_TYPE is
					when C         => next_state <= TX_C;
					when S         => next_state <= TX_D;
					when E | D | T => next_state <= TX_E;
				end case;

			when TX_D =>
				case T_TYPE is
					when D         => next_state <= TX_D;
					when T         => next_state <= TX_T;
					when E | C | S => next_state <= TX_E;
				end case;

			when TX_T =>
				case T_TYPE is
					when C         => next_state <= TX_C;
					when S         => next_state <= TX_D;
					when E | D | T => next_state <= TX_E;
				end case;

			when TX_E =>
				case T_TYPE is
					when T     => next_state <= TX_T;
					when D     => next_state <= TX_D;
					when C     => next_state <= TX_C;
					when E | S => next_state <= TX_E;
				end case;

		end case;
	end process;

	OUTPUT_DECODE : process(CLK_I)
	begin
		if rising_edge(CLK_I) then
			if (error_state = '1') then
				tx_error_en <= x"FF";
			else
				tx_error_en <= x"00";
			end if;

			if (term_state = '1') then
				tx_term_en <= x"FF";
			else
				tx_term_en <= x"00";
			end if;
		end if;
	end process;

	TX_RECODE_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			data_stream_d2  <= data_stream_d1;
			idle_stream_d1  <= idle_stream;
			seq_stream_d1   <= seq_stream;
			start_stream_d1 <= start_stream;
			error_stream_d1 <= error_stream;

			is_idle_char_d2 <= is_idle_char_d1;

			term_byte(2) <= is_term_char_d1(4) or is_term_char_d1(5) or is_term_char_d1(6) or is_term_char_d1(7);

			case is_term_char_d1(2 downto 0) is
				when "001" => term_byte(1 downto 0) <= "00";
				when "010" => term_byte(1 downto 0) <= "01";
				when "100" => term_byte(1 downto 0) <= "10";
				when "000" =>
					case is_term_char_d1(6 downto 4) is
						when "001"  => term_byte(1 downto 0) <= "00";
						when "010"  => term_byte(1 downto 0) <= "01";
						when "100"  => term_byte(1 downto 0) <= "10";
						when "000"  => term_byte(1 downto 0) <= "11";
						when others => term_byte(1 downto 0) <= "00";
					end case;
				when others => term_byte(1 downto 0) <= "00";
			end case;

			txd_d4 <= txd_d3;

		end if;
	end process TX_RECODE_proc;

	TX_RECODE2_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			data_stream_d3 <= data_stream_d2;
			idle_stream_d2 <= idle_stream_d1;
			seq_stream_d2  <= seq_stream_d1;

			is_idle_char_d3 <= is_idle_char_d2;
			term_byte_d1    <= term_byte;

			if (seq_stream_d1 = '1') then
				tx_coded_cd_P(7 downto 0) <= bO0;
			else
				if (start_stream_d1 = '1') then
					tx_coded_cd_P(7 downto 0) <= bS0;
				else
					tx_coded_cd_P(7 downto 0) <= bCX;
				end if;
			end if;

			txd_d5 <= txd_d4;
		end if;
	end process TX_RECODE2_proc;

	tx_coded.P <= txd_d5(7) & txd_d5(6) & txd_d5(5) & txd_d5(4) & txd_d5(3) & txd_d5(2) & txd_d5(1) & txd_d5(0);

	BYTES_TX_CODED_T : for i in 1 to 7 generate
	begin
		TX_RECODE2_proc2 : process(is_idle_char_d3(i), txd_d5(i - 1), txd_d5(i)) is
		begin
			if (is_idle_char_d3(i) = '1') then
				tx_coded_t_P(((i + 1) * 8) - 1 downto (i * 8))  <= (others => '0');
				tx_coded_cd_P(((i + 1) * 8) - 1 downto (i * 8)) <= (others => '0');
			else
				tx_coded_t_P(((i + 1) * 8) - 1 downto (i * 8))  <= txd_d5(i - 1);
				tx_coded_cd_P(((i + 1) * 8) - 1 downto (i * 8)) <= txd_d5(i);
			end if;
		end process TX_RECODE2_proc2;
	end generate BYTES_TX_CODED_T;

	TX_RECODE3_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			idle_stream_d3 <= idle_stream_d2;

			if (data_stream_d3 = '1') then
				tx_coded_cd_d1.P(7 downto 0) <= tx_coded.P(7 downto 0);
				tx_coded_cd_d1.H(0)          <= '0';
			else
				tx_coded_cd_d1.P(7 downto 0) <= tx_coded_cd_P(7 downto 0);
				tx_coded_cd_d1.H(0)          <= '1';
			end if;

			tx_coded_cd_d1.P(63 downto 8) <= tx_coded_cd_P(63 downto 8);

			case term_byte_d1 is
				when "000"  => tx_coded_t_P_d1(7 downto 0) <= bT0;
				when "001"  => tx_coded_t_P_d1(7 downto 0) <= bT1;
				when "010"  => tx_coded_t_P_d1(7 downto 0) <= bT2;
				when "011"  => tx_coded_t_P_d1(7 downto 0) <= bT3;
				when "100"  => tx_coded_t_P_d1(7 downto 0) <= bT4;
				when "101"  => tx_coded_t_P_d1(7 downto 0) <= bT5;
				when "110"  => tx_coded_t_P_d1(7 downto 0) <= bT6;
				when others => tx_coded_t_P_d1(7 downto 0) <= bT7;
			end case;

			tx_coded_t_P_d1(63 downto 8) <= tx_coded_t_P(63 downto 8);
		end if;
	end process TX_RECODE3_proc;

	tx_coded_cd_d1.H(1) <= not tx_coded_cd_d1.H(0);

	REGISTER_OUTPUT_PROC_generate : for i in 0 to 7 generate
	begin
		REGISTER_OUTPUT_proc2 : process(CLK_I)
		begin
			if rising_edge(CLK_I) then
				if (tx_error_en(i) = '1') then
					PCS_BLOCK_O.P((i + 1) * 8 - 1 downto i * 8) <= EBLOCK_T.P((i + 1) * 8 - 1 downto i * 8);
				else
					if (tx_term_en(i) = '1') then
						PCS_BLOCK_O.P((i + 1) * 8 - 1 downto i * 8) <= tx_coded_t_P_d1((i + 1) * 8 - 1 downto i * 8);
					else
						PCS_BLOCK_O.P((i + 1) * 8 - 1 downto i * 8) <= tx_coded_cd_d1.P((i + 1) * 8 - 1 downto i * 8);
					end if;
				end if;
			end if;
		end process REGISTER_OUTPUT_proc2;
	end generate REGISTER_OUTPUT_PROC_generate;

	REGISTER_OUTPUT_proc : process(CLK_I)
	begin
		if rising_edge(CLK_I) then
			if (tx_error_en(0) = '1') then
				BLOCK_VALID_O <= '1';
				PCS_BLOCK_O.H <= EBLOCK_T.H;
			else
				if (tx_term_en(0) = '1') then
					BLOCK_VALID_O <= '1';
				else
					BLOCK_VALID_O <= not idle_stream_d3;
				end if;
				PCS_BLOCK_O.H <= tx_coded_cd_d1.H;
			end if;
		end if;
	end process REGISTER_OUTPUT_proc;

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


----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (PTY) Ltd 
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 01.12.2014 11:36:20
-- Design Name: 
-- Module Name: IEEE802_3_XL_RS - Behavioral
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

entity IEEE802_3_XL_RS is
	Port(
		SYS_CLK_I              : in  std_logic;
		SYS_RST_I              : in  std_logic;

		XL_TX_CLK_156M25_I     : in  std_logic;
		XL_TX_CLK_625M_I       : in  std_logic;
		XL_TX_CLK_RST_I        : in  std_logic;

		-- XLGMII INPUT Interface
		-- Transmitter Interface
		XLGMII_TX_O            : out XLGMII_t;
		XLGMII_X4_TX_I         : in  XLGMII_ARRAY_t(3 downto 0);

		XL_RX_CLK_156M25_I     : in  std_logic;
		XL_RX_CLK_625M_I       : in  std_logic;
		XL_RX_CLK_RST_I        : in  std_logic;

		-- XLGMII Output Interface
		-- Receiver Interface
		XLGMII_RX_I            : in  XLGMII_t;
		XLGMII_X4_RX_O         : out XLGMII_ARRAY_t(3 downto 0);

		RX_FRAME_COUNT_O       : out std_logic_vector(31 downto 0);
		RX_FRAME_ERROR_COUNT_O : out std_logic_vector(31 downto 0)
	);
end IEEE802_3_XL_RS;

architecture Behavioral of IEEE802_3_XL_RS is
	attribute ASYNC_REG : string;
	attribute DONT_TOUCH : string;

	component DUAL_CLOCK_STROBE_GENERATOR is
		Port(
			CLK_SLOW_I : in  STD_LOGIC;
			CLK_FAST_I : in  STD_LOGIC;
			STROBE_O   : out STD_LOGIC
		);
	end component DUAL_CLOCK_STROBE_GENERATOR;

	component DATA_FREQUENCY_MULTIPLIER is
		Generic(
			DATA_WIDTH : integer := 64
		);
		Port(
			CLK_I        : in  std_logic;
			CLK_MULT_I   : in  std_logic;
			STROBE_I     : in  std_logic;
			DATA_VALID_I : in  std_logic;
			DATA_I       : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
			DATA_VALID_O : out std_logic;
			DATA_O       : out std_logic_vector(DATA_WIDTH - 1 downto 0)
		);
	end component DATA_FREQUENCY_MULTIPLIER;

	component DATA_FREQUENCY_DIVIDER is
		Generic(
			DATA_WIDTH : integer := 64
		);
		Port(
			CLK_I        : in  std_logic;
			CLK_DIV_I    : in  std_logic;
			STROBE_I     : in  std_logic;
			DATA_VALID_I : in  std_logic;
			DATA_I       : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
			DATA_VALID_O : out std_logic;
			DATA_O       : out std_logic_vector(DATA_WIDTH - 1 downto 0)
		);
	end component DATA_FREQUENCY_DIVIDER;

	component XGMII_FIFO_DUAL_SYNC
		port(
			rst    : in  std_logic;
			wr_clk : in  std_logic;
			rd_clk : in  std_logic;
			din    : in  std_logic_vector(287 downto 0);
			wr_en  : in  std_logic;
			rd_en  : in  std_logic;
			dout   : out std_logic_vector(287 downto 0);
			full   : out std_logic;
			empty  : out std_logic
		);
	end component;

	component RS256_FIFO
		port(
			rst    : in  std_logic;
			wr_clk : in  std_logic;
			rd_clk : in  std_logic;
			din    : in  std_logic_vector(290 downto 0);
			wr_en  : in  std_logic;
			rd_en  : in  std_logic;
			dout   : out std_logic_vector(290 downto 0);
			full   : out std_logic;
			empty  : out std_logic
		);
	end component;

	signal tx_strobe : std_logic;

	signal XLGMII_X4_TX_d1_valid : std_logic_vector(3 downto 0);
	signal XLGMII_X4_TX_d1       : XLGMII_ARRAY_t(3 downto 0);
	signal XLGMII_X4_TX_d2_valid : std_logic_vector(3 downto 0);
	signal XLGMII_X4_TX_d2       : XLGMII_ARRAY_t(3 downto 0);
	signal XLGMII_X4_TX_d3       : XLGMII_ARRAY_t(3 downto 0);

	signal XLGMII_TX_FIFO_wr_en    : std_logic                    := '0';
	signal XLGMII_TX_FIFO_rd_en    : std_logic                    := '0';
	signal XLGMII_TX_FIFO_empty    : std_logic;
	signal XLGMII_TX_FIFO_empty_SR : std_logic_vector(2 downto 0) := (others => '1');
	signal XLGMII_TX_FIFO_full     : std_logic;

	-- Counter to point to lane (Round-Robin)
	signal TX_lane_counter : unsigned(1 downto 0) := (others => '0');

	type RS_64bit_t is record
		is_S : std_logic;
		is_T : std_logic;
		is_E : std_logic;
		--		T_index : std_logic_vector(2 downto 0);
		C    : std_logic_vector(7 downto 0); --Control
		D    : std_logic_vector(63 downto 0); --Data
	end record;

	type RS_64bit_ARRAY_t is array (natural range <>) of RS_64bit_t;

	type RS_256bit_t is record
		is_S : std_logic;
		is_T : std_logic;
		is_E : std_logic;
		--		STE_index : std_logic_vector(1 downto 0);
		--		T_index   : std_logic_vector(2 downto 0);
		C    : std_logic_vector(31 downto 0); --Control
		D    : std_logic_vector(255 downto 0); --Data
	end record;

	signal rx_strobe : std_logic;

	signal XLGMII_RX_C_d1   : std_logic_vector(7 downto 0);
	signal XLGMII_RX_D_d1   : BYTE_ARRAY_t(7 downto 0);
	signal RX_is_valid_char : std_logic_vector(7 downto 0);

	signal XLGMII_RX_d2               : XLGMII_t;
	signal RX_terminate_char_detected : std_logic_vector(7 downto 0);
	signal RX_error_char_detected     : std_logic_vector(7 downto 0);
	--signal RX_idle_char_detected      : std_logic_vector(7 downto 0);
	signal RX_start_char_detected     : std_logic;
	--signal RX_seq_char_detected       : std_logic;

	signal RX_RS64_d0 : RS_64bit_t;
	signal RX_RS64_d1 : RS_64bit_t;

	signal RX_in_frame : std_logic;

	signal RX_termination_complete : std_logic;

	-- Counter to point to lane (Round-Robin)
	signal RX_lane_en_sr : std_logic_vector(3 downto 0);

	signal RX_RS64_X4_d0_valid  : std_logic_vector(3 downto 0);
	signal RX_RS64_X4_d0_valid2 : std_logic_vector(3 downto 0);
	signal RX_RS64_X4_d0        : RS_64bit_ARRAY_t(3 downto 0);
	signal RX_RS64_X4_d1_valid  : std_logic_vector(3 downto 0);
	signal RX_RS64_X4_d1        : RS_64bit_ARRAY_t(3 downto 0);

	attribute DONT_TOUCH of RX_RS64_X4_d0_valid : signal is "true";
	attribute DONT_TOUCH of RX_RS64_X4_d0_valid2 : signal is "true";

	signal RX_RS256_d0       : RS_256bit_t;
	signal RX_RS256_d1_valid : std_logic;
	signal RX_RS256_d1       : RS_256bit_t;
	signal RX_RS256_d2_valid : std_logic;
	signal RX_RS256_d2       : RS_256bit_t;

	signal RX_RS256_insert_idle : std_logic;
	signal RX_RS256_insert_idle_comb : std_logic;

	signal RX_frame_started     : std_logic                     := '0';
	signal RX_frame_started_sr  : std_logic_vector(23 downto 0) := (others => '0');
	signal RX_frame_started_old : std_logic                     := '0';

	attribute ASYNC_REG of RX_frame_started_sr : signal is "true";

	signal RX_frame_queue_count     : unsigned(7 downto 0);
	signal RX_frame_queue_count_inc : std_logic;
	signal RX_frame_queue_count_dec : std_logic;
	signal RX_frame_queue_empty     : boolean;

	signal XLGMII_RX_FIFO_wr_en : std_logic;
	signal XLGMII_RX_FIFO_rd_en : std_logic;
	signal XLGMII_RX_FIFO_empty : std_logic;
	signal XLGMII_RX_FIFO_full  : std_logic;

	signal RX_frame_active      : std_logic;
	signal RX_frame_count       : unsigned(31 downto 0);
	signal RX_frame_error_count : unsigned(31 downto 0);
	
	    -- Mark Debug ILA Testing 
    --signal dbg_RX_RS256_d1_valid : std_logic;
    --signal dbg_RX_RS256_d2 : RS_256bit_t;
    --signal dbg_RX_RS256_d1 : RS_256bit_t;
    --signal dbg_RX_frame_queue_count_dec : std_logic;
    --signal dbg_RX_RS256_insert_idle : std_logic;
    --signal dbg_RX_RS256_d2_valid : std_logic;
    --signal dbg_XLGMII_RX_FIFO_rd_en : std_logic;
    --signal dbg_XLGMII_RX_FIFO_empty : std_logic;
    --signal dbg_RX_frame_queue_empty : boolean;
    --signal dbg_XLGMII_RX_FIFO_full : std_logic;
    --signal dbg_RX_FRAME_COUNT_O : std_logic_vector(31 downto 0);
    --signal dbg_RX_FRAME_ERROR_COUNT_O : std_logic_vector(31 downto 0);
    --signal dbg_RX_RS256_insert_idle_comb : std_logic;
    
          
    
    -- Mark Debug ILA Testing   
    --attribute MARK_DEBUG : string;
    --attribute MARK_DEBUG of dbg_RX_RS256_d1_valid : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_RX_RS256_d2 : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_RX_RS256_d1 : signal is "TRUE";
    --attribute MARK_DEBUG of dbg_RX_frame_queue_count_dec : signal is "TRUE"; 
    --attribute MARK_DEBUG of dbg_RX_RS256_insert_idle : signal is "TRUE";    
    --attribute MARK_DEBUG of dbg_RX_RS256_d2_valid : signal is "TRUE";   
    --attribute MARK_DEBUG of dbg_XLGMII_RX_FIFO_rd_en : signal is "TRUE";   
    --attribute MARK_DEBUG of dbg_XLGMII_RX_FIFO_empty : signal is "TRUE"; 
    --attribute MARK_DEBUG of dbg_RX_frame_queue_empty : signal is "TRUE"; 
    --attribute MARK_DEBUG of dbg_XLGMII_RX_FIFO_full : signal is "TRUE"; 
    --attribute MARK_DEBUG of dbg_RX_FRAME_COUNT_O : signal is "TRUE"; 
    --attribute MARK_DEBUG of dbg_RX_FRAME_ERROR_COUNT_O : signal is "TRUE"; 
    --attribute MARK_DEBUG of dbg_RX_RS256_insert_idle_comb : signal is "TRUE"; 	

begin

    --Mark debug ILA
    --dbg_RX_RS256_d1_valid <= RX_RS256_d1_valid;
    --dbg_RX_RS256_d2 <= RX_RS256_d2;
    --dbg_RX_RS256_d1 <= RX_RS256_d1;
    --dbg_RX_frame_queue_count_dec <= RX_frame_queue_count_dec;
    --dbg_RX_RS256_insert_idle <= RX_RS256_insert_idle;
    --dbg_RX_RS256_d2_valid <= RX_RS256_d2_valid;
    --dbg_XLGMII_RX_FIFO_rd_en <= XLGMII_RX_FIFO_rd_en;
    --dbg_XLGMII_RX_FIFO_empty <= XLGMII_RX_FIFO_empty;
    --dbg_RX_frame_queue_empty <= RX_frame_queue_empty;
    --dbg_XLGMII_RX_FIFO_full <= XLGMII_RX_FIFO_full;
    --dbg_RX_FRAME_COUNT_O <= std_logic_vector(RX_frame_count);
    --dbg_RX_FRAME_ERROR_COUNT_O <= std_logic_vector(RX_frame_error_count);
    --dbg_RX_RS256_insert_idle_comb <= RX_RS256_insert_idle_comb;	



	XLGMII_TX_FIFO_WRITE_CTRL_proc : process(XL_TX_CLK_RST_I, SYS_CLK_I) is
	begin
		if XL_TX_CLK_RST_I = '1' then
			XLGMII_TX_FIFO_wr_en <= '0';
		else
			if rising_edge(SYS_CLK_I) then
			    --only write into the FIFO when not full and reset is deasserted 
			    if (XLGMII_TX_FIFO_full = '0') then
				    XLGMII_TX_FIFO_wr_en <= '1';
			    else
				    XLGMII_TX_FIFO_wr_en <= '0';			  	
			    end if;	
			end if;
		end if;
	end process XLGMII_TX_FIFO_WRITE_CTRL_proc;

	XLGMII_TX_FIFO_inst : component XGMII_FIFO_DUAL_SYNC
		port map(
			rst                  => XL_TX_CLK_RST_I,
			wr_clk               => SYS_CLK_I,
			rd_clk               => XL_TX_CLK_156M25_I,
			din(7 downto 0)      => XLGMII_X4_TX_I(0).C,
			din(71 downto 8)     => XLGMII_X4_TX_I(0).D,
			din(79 downto 72)    => XLGMII_X4_TX_I(1).C,
			din(143 downto 80)   => XLGMII_X4_TX_I(1).D,
			din(151 downto 144)  => XLGMII_X4_TX_I(2).C,
			din(215 downto 152)  => XLGMII_X4_TX_I(2).D,
			din(223 downto 216)  => XLGMII_X4_TX_I(3).C,
			din(287 downto 224)  => XLGMII_X4_TX_I(3).D,
			wr_en                => XLGMII_TX_FIFO_wr_en,
			rd_en                => XLGMII_TX_FIFO_rd_en,
			dout(7 downto 0)     => XLGMII_X4_TX_d1(0).C,
			dout(71 downto 8)    => XLGMII_X4_TX_d1(0).D,
			dout(79 downto 72)   => XLGMII_X4_TX_d1(1).C,
			dout(143 downto 80)  => XLGMII_X4_TX_d1(1).D,
			dout(151 downto 144) => XLGMII_X4_TX_d1(2).C,
			dout(215 downto 152) => XLGMII_X4_TX_d1(2).D,
			dout(223 downto 216) => XLGMII_X4_TX_d1(3).C,
			dout(287 downto 224) => XLGMII_X4_TX_d1(3).D,
			full                 => XLGMII_TX_FIFO_full,
			empty                => XLGMII_TX_FIFO_empty
		);

	XLGMII_TX_FIFO_empty_SR(0) <= XLGMII_TX_FIFO_empty;

	XLGMII_TX_FIFO_READ_CTRL_proc : process(XL_TX_CLK_RST_I, XL_TX_CLK_156M25_I) is
	begin
		if XL_TX_CLK_RST_I = '1' then
			XLGMII_TX_FIFO_empty_SR(2 downto 1) <= (others => '1');
			XLGMII_TX_FIFO_rd_en                <= '0';
		else
			if rising_edge(XL_TX_CLK_156M25_I) then
				XLGMII_TX_FIFO_empty_SR(2 downto 1) <= XLGMII_TX_FIFO_empty_SR(1 downto 0);
				if (XLGMII_TX_FIFO_empty_SR = "000") then
					XLGMII_TX_FIFO_rd_en <= '1';
				else
					XLGMII_TX_FIFO_rd_en <= '0';
				end if;
			end if;
		end if;
	end process XLGMII_TX_FIFO_READ_CTRL_proc;

	TX_DUAL_CLK_STROBE_inst : component DUAL_CLOCK_STROBE_GENERATOR
		port map(
			CLK_SLOW_I => XL_TX_CLK_156M25_I,
			CLK_FAST_I => XL_TX_CLK_625M_I,
			STROBE_O   => tx_strobe
		);

	lanes_TX : for i in 0 to 3 generate
	begin
		TX_FREQUENCY_MULT_inst : component DATA_FREQUENCY_MULTIPLIER
			generic map(
				DATA_WIDTH => 72
			)
			port map(
				CLK_I               => XL_TX_CLK_156M25_I,
				CLK_MULT_I          => XL_TX_CLK_625M_I,
				STROBE_I            => tx_strobe,
				DATA_VALID_I        => '1',
				DATA_I(7 downto 0)  => XLGMII_X4_TX_d1(i).C,
				DATA_I(71 downto 8) => XLGMII_X4_TX_d1(i).D,
				DATA_VALID_O        => XLGMII_X4_TX_d2_valid(i),
				DATA_O(7 downto 0)  => XLGMII_X4_TX_d2(i).C,
				DATA_O(71 downto 8) => XLGMII_X4_TX_d2(i).D
			);

	end generate lanes_TX;

	REGISTER_proc : process(XL_TX_CLK_625M_I) is
	begin
		if rising_edge(XL_TX_CLK_625M_I) then
			XLGMII_X4_TX_d3(3) <= XLGMII_X4_TX_d2(3);
		end if;
	end process REGISTER_proc;

	lanes_TX2 : for i in 0 to 2 generate
	begin
		REGISTER_proc : process(XL_TX_CLK_625M_I) is
		begin
			if rising_edge(XL_TX_CLK_625M_I) then
				if (XLGMII_X4_TX_d2_valid(i) = '1') then
					XLGMII_X4_TX_d3(i) <= XLGMII_X4_TX_d2(i);
				else
					XLGMII_X4_TX_d3(i) <= XLGMII_X4_TX_d3(i + 1);
				end if;
			end if;
		end process REGISTER_proc;
	end generate lanes_TX2;

	XLGMII_TX_OUTPUT_proc : process(XL_TX_CLK_625M_I, XL_TX_CLK_RST_I) is
	begin
		if XL_TX_CLK_RST_I = '1' then
			XLGMII_TX_O <= LBLOCK_R;
		elsif rising_edge(XL_TX_CLK_625M_I) then
			XLGMII_TX_O <= XLGMII_X4_TX_d3(0);
		end if;
	end process XLGMII_TX_OUTPUT_proc;

	--This is not input registered
	REGISTER_INPUT_gen : for i in 0 to 7 generate
		REGISTER_INPUT_proc : process(XL_RX_CLK_625M_I) is
		begin
			if rising_edge(XL_RX_CLK_625M_I) then
				XLGMII_RX_C_d1(i) <= XLGMII_RX_I.C(i);
				XLGMII_RX_D_d1(i) <= XLGMII_RX_I.D((8 * i + 7) downto (8 * i));

				case XLGMII_RX_I.D((8 * i) + 7 downto (8 * i) + 3) is
					when "11111" => RX_is_valid_char(i) <= XLGMII_RX_I.C(i);
					when "00000" => RX_is_valid_char(i) <= XLGMII_RX_I.C(i);
					when others  => RX_is_valid_char(I) <= '0';
				end case;
			end if;
		end process REGISTER_INPUT_proc;
	end generate REGISTER_INPUT_gen;

	generate_label : for i in 0 to 7 generate
		CHARACTER_DETECT_proc : process(XL_RX_CLK_625M_I) is
		begin
			if rising_edge(XL_RX_CLK_625M_I) then
				--				if (XLGMII_RX_D_d1(i)(3 downto 0) = rI(3 downto 0)) then
				--					RX_idle_char_detected(i) <= RX_is_valid_char(i);
				--				else
				--					RX_idle_char_detected(i) <= '0';
				--				end if;

				if (XLGMII_RX_D_d1(i)(3 downto 0) = rT(3 downto 0)) then
					RX_terminate_char_detected(i) <= RX_is_valid_char(i);
				else
					RX_terminate_char_detected(i) <= '0';
				end if;

				if (XLGMII_RX_D_d1(i)(3 downto 0) = rE(3 downto 0)) then
					RX_error_char_detected(i) <= RX_is_valid_char(i);
				else
					RX_error_char_detected(i) <= '0';
				end if;

				XLGMII_RX_d2.C(i)                          <= XLGMII_RX_C_d1(i);
				XLGMII_RX_d2.D((8 * i + 7) downto (8 * i)) <= XLGMII_RX_D_d1(i);

			end if;
		end process CHARACTER_DETECT_proc;
	end generate generate_label;

	CHARACTER_DETECT2_proc : process(XL_RX_CLK_625M_I) is
	begin
		if rising_edge(XL_RX_CLK_625M_I) then
			if (XLGMII_RX_D_d1(0)(3 downto 0) = rS(3 downto 0)) then
				RX_start_char_detected <= RX_is_valid_char(0);
			else
				RX_start_char_detected <= '0';
			end if;

		--			if (XLGMII_RX_D_d1.D(0) = rO) then
		--				RX_seq_char_detected <= '1';
		--			else
		--				RX_seq_char_detected <= '0';
		--			end if;
		end if;
	end process CHARACTER_DETECT2_proc;

	RX_START_END_DETECT_proc : process(XL_RX_CLK_625M_I) is
	begin
		if rising_edge(XL_RX_CLK_625M_I) then
			RX_RS64_d0.D(55 downto 0) <= XLGMII_RX_d2.D(55 downto 0);
			if (RX_error_char_detected(0) = '1') then
				RX_RS64_d0.C               <= "10000000";
				RX_RS64_d0.D(63 downto 56) <= rT;
			else
				RX_RS64_d0.C               <= XLGMII_RX_d2.C;
				RX_RS64_d0.D(63 downto 56) <= XLGMII_RX_d2.D(63 downto 56);
			end if;

			if (RX_start_char_detected = '1') then
				RX_RS64_d0.is_S <= '1';
			else
				RX_RS64_d0.is_S <= '0';
			end if;

			case RX_terminate_char_detected is
				when "00000001" => RX_RS64_d0.is_T <= '1';
				when "00000010" => RX_RS64_d0.is_T <= '1';
				when "00000100" => RX_RS64_d0.is_T <= '1';
				when "00001000" => RX_RS64_d0.is_T <= '1';
				when "00010000" => RX_RS64_d0.is_T <= '1';
				when "00100000" => RX_RS64_d0.is_T <= '1';
				when "01000000" => RX_RS64_d0.is_T <= '1';
				when "10000000" => RX_RS64_d0.is_T <= '1';
				when others     => RX_RS64_d0.is_T <= '0';
			end case;

			--			case RX_terminate_char_detected is
			--				when "00000001" => RX_RS64_d0.T_index <= "000";
			--				when "00000010" => RX_RS64_d0.T_index <= "001";
			--				when "00000100" => RX_RS64_d0.T_index <= "010";
			--				when "00001000" => RX_RS64_d0.T_index <= "011";
			--				when "00010000" => RX_RS64_d0.T_index <= "100";
			--				when "00100000" => RX_RS64_d0.T_index <= "101";
			--				when "01000000" => RX_RS64_d0.T_index <= "110";
			--				when "10000000" => RX_RS64_d0.T_index <= "111";
			--				when others     => RX_RS64_d0.T_index <= "000";
			--			end case;

			if (RX_error_char_detected = x"00") then
				RX_RS64_d0.is_E <= '0';
			else
				RX_RS64_d0.is_E <= '1';
			end if;

		end if;
	end process RX_START_END_DETECT_proc;

	RX_BLOCK_DETECT_proc : process(XL_RX_CLK_625M_I) is
	begin
		if rising_edge(XL_RX_CLK_625M_I) then
			RX_RS64_d1 <= RX_RS64_d0;
			if (XL_RX_CLK_RST_I = '1') then
				RX_in_frame             <= '0';
				RX_termination_complete <= '1';
			else
				if (RX_RS64_d0.is_S = '1') then
					RX_in_frame <= '1';

				elsif (RX_in_frame = '1') then
					if (RX_lane_en_sr(3) = '1') then
						RX_in_frame <= RX_termination_complete;
					end if;
				end if;

				if ((RX_RS64_d0.is_T or RX_RS64_d0.is_E) = '1') then
					RX_termination_complete <= not RX_in_frame;
				elsif ((RX_lane_en_sr(3) or RX_RS64_d0.is_S) = '1') then
					RX_termination_complete <= '1';
				end if;
			end if;
		end if;
	end process RX_BLOCK_DETECT_proc;

	--RX
	RX_LANE_EN_SHIFT_REGISTER_proc : process(XL_RX_CLK_625M_I) is
	begin
		if rising_edge(XL_RX_CLK_625M_I) then
			if XL_RX_CLK_RST_I = '1' then
				RX_lane_en_sr <= "0000";
			else
				RX_lane_en_sr(0) <= not ((RX_lane_en_sr(0) and RX_in_frame) or RX_lane_en_sr(1) or RX_lane_en_sr(2));

				RX_lane_en_sr(1) <= RX_lane_en_sr(0) and RX_in_frame;
				RX_lane_en_sr(2) <= RX_lane_en_sr(1);
				RX_lane_en_sr(3) <= RX_lane_en_sr(2);

			end if;
		end if;
	end process RX_LANE_EN_SHIFT_REGISTER_proc;

	RX_DUAL_CLK_STROBE_inst : component DUAL_CLOCK_STROBE_GENERATOR
		port map(
			CLK_SLOW_I => XL_RX_CLK_156M25_I,
			CLK_FAST_I => XL_RX_CLK_625M_I,
			STROBE_O   => rx_strobe
		);

	lanes_RX : for i in 0 to 3 generate
	begin
		ROUND_ROBIN_BLOCK_DISTRIBUTION_PROC : process(XL_RX_CLK_625M_I) is
		begin
			if rising_edge(XL_RX_CLK_625M_I) then
				if (RX_lane_en_sr(i) = '1') then
					RX_RS64_X4_d0(i) <= RX_RS64_d1;
				end if;

				RX_RS64_X4_d0_valid(i)  <= RX_lane_en_sr(3);
				RX_RS64_X4_d0_valid2(i) <= RX_lane_en_sr(3);
			end if;
		end process ROUND_ROBIN_BLOCK_DISTRIBUTION_PROC;

		RX_FREQUENCY_DIV_inst : component DATA_FREQUENCY_DIVIDER
			generic map(
				DATA_WIDTH => 40
			)
			port map(
				CLK_I               => XL_RX_CLK_625M_I,
				CLK_DIV_I           => XL_RX_CLK_156M25_I,
				STROBE_I            => rx_strobe,
				DATA_VALID_I        => RX_RS64_X4_d0_valid(i),
				DATA_I(7 downto 0)  => RX_RS64_X4_d0(i).C,
				DATA_I(39 downto 8) => RX_RS64_X4_d0(i).D(31 downto 0),
				DATA_VALID_O        => RX_RS64_X4_d1_valid(i),
				DATA_O(7 downto 0)  => RX_RS64_X4_d1(i).C,
				DATA_O(39 downto 8) => RX_RS64_X4_d1(i).D(31 downto 0)
			);

		RX_FREQUENCY_DIV_inst2 : component DATA_FREQUENCY_DIVIDER
			generic map(
				DATA_WIDTH => 35
			)
			port map(
				CLK_I               => XL_RX_CLK_625M_I,
				CLK_DIV_I           => XL_RX_CLK_156M25_I,
				STROBE_I            => rx_strobe,
				DATA_VALID_I        => RX_RS64_X4_d0_valid2(i),
				DATA_I(31 downto 0) => RX_RS64_X4_d0(i).D(63 downto 32),
				DATA_I(32)          => RX_RS64_X4_d0(i).is_S,
				DATA_I(33)          => RX_RS64_X4_d0(i).is_T,
				DATA_I(34)          => RX_RS64_X4_d0(i).is_E,
				DATA_VALID_O        => open,
				DATA_O(31 downto 0) => RX_RS64_X4_d1(i).D(63 downto 32),
				DATA_O(32)          => RX_RS64_X4_d1(i).is_S,
				DATA_O(33)          => RX_RS64_X4_d1(i).is_T,
				DATA_O(34)          => RX_RS64_X4_d1(i).is_E
			);
	end generate lanes_RX;

	RX_RS256_d0.is_S <= RX_RS64_X4_d1(3).is_S or RX_RS64_X4_d1(2).is_S or RX_RS64_X4_d1(1).is_S or RX_RS64_X4_d1(0).is_S;
	RX_RS256_d0.is_T <= RX_RS64_X4_d1(3).is_T or RX_RS64_X4_d1(2).is_T or RX_RS64_X4_d1(1).is_T or RX_RS64_X4_d1(0).is_T;
	RX_RS256_d0.is_E <= RX_RS64_X4_d1(3).is_E or RX_RS64_X4_d1(2).is_E or RX_RS64_X4_d1(1).is_E or RX_RS64_X4_d1(0).is_E;

	RX_RS256_d0.C <= RX_RS64_X4_d1(3).C & RX_RS64_X4_d1(2).C & RX_RS64_X4_d1(1).C & RX_RS64_X4_d1(0).C;
	RX_RS256_d0.D <= RX_RS64_X4_d1(3).D & RX_RS64_X4_d1(2).D & RX_RS64_X4_d1(1).D & RX_RS64_X4_d1(0).D;

	FRAME_STARTED_TOGGLE_proc : process(XL_RX_CLK_156M25_I, XL_RX_CLK_RST_I) is
	begin
		if XL_RX_CLK_RST_I = '1' then
			RX_frame_started <= '0';
		elsif rising_edge(XL_RX_CLK_156M25_I) then
			if (RX_RS256_d0.is_S = '1') then
				RX_frame_started <= not RX_frame_started;
			end if;
		end if;
	end process FRAME_STARTED_TOGGLE_proc;

	CROSS_CLK_proc : process(SYS_CLK_I) is
	begin
		if rising_edge(SYS_CLK_I) then
			RX_frame_started_sr(0)           <= RX_frame_started;
			RX_frame_started_sr(23 downto 1) <= RX_frame_started_sr(22 downto 0);
		end if;
	end process CROSS_CLK_proc;
	
    --write into the FIFO when FIFO is not full and reset is not asserted
	XLGMII_RX_FIFO_wr_en <= RX_RS64_X4_d1_valid(0) and (not XLGMII_RX_FIFO_full) and (not XL_RX_CLK_RST_I);

	RX_FIFO_inst : component RS256_FIFO
		port map(
			rst                 => XL_RX_CLK_RST_I,
			wr_clk              => XL_RX_CLK_156M25_I,
			rd_clk              => SYS_CLK_I,
			din(31 downto 0)    => RX_RS256_d0.C,
			din(287 downto 32)  => RX_RS256_d0.D,
			din(288)            => RX_RS256_d0.is_S,
			din(289)            => RX_RS256_d0.is_T,
			din(290)            => RX_RS256_d0.is_E,
			wr_en               => XLGMII_RX_FIFO_wr_en,
			rd_en               => XLGMII_RX_FIFO_rd_en,
			dout(31 downto 0)   => RX_RS256_d1.C,
			dout(287 downto 32) => RX_RS256_d1.D,
			dout(288)           => RX_RS256_d1.is_S,
			dout(289)           => RX_RS256_d1.is_T,
			dout(290)           => RX_RS256_d1.is_E,
			full                => XLGMII_RX_FIFO_full,
			empty               => XLGMII_RX_FIFO_empty
		);

	RX_proc : process(XL_RX_CLK_RST_I, SYS_CLK_I, XLGMII_RX_FIFO_empty) is
	begin
		if XLGMII_RX_FIFO_empty = '1' or XL_RX_CLK_RST_I = '1' then
			XLGMII_RX_FIFO_rd_en <= '0';
		else
			if rising_edge(SYS_CLK_I) then
				if (RX_frame_queue_empty) then
					if (RX_RS256_d1.is_T = '1') then
						XLGMII_RX_FIFO_rd_en <= '0';
					end if;
				else
					XLGMII_RX_FIFO_rd_en <= '1';
				end if;
			end if;
		end if;
	end process RX_proc;
    --AI: Insert debug from here
	RX2_proc : process(SYS_CLK_I) is
	begin
		if rising_edge(SYS_CLK_I) then
			if (XLGMII_RX_FIFO_empty = '1') then
				RX_RS256_d1_valid        <= '0';
				RX_RS256_d2_valid        <= '0';
				RX_frame_queue_count_dec <= '0';
				RX_RS256_insert_idle     <= not RX_RS256_d2_valid;
				--AI: Insert idle as soon as RX FIFO is empty
				--RX_RS256_insert_idle     <= '1';
				
			elsif (XLGMII_RX_FIFO_rd_en = '1') then
				RX_RS256_d1_valid        <= '1';
				RX_RS256_d2_valid        <= RX_RS256_d1_valid;
				RX_frame_queue_count_dec <= RX_RS256_d1.is_S;
				if ((RX_RS256_d1_valid or RX_RS256_d2_valid) = '1') then
					RX_RS256_insert_idle <= '0';
				end if;
			else
				RX_RS256_d1_valid        <= '0';
				RX_frame_queue_count_dec <= '0';
				RX_RS256_insert_idle     <= '1';
			end if;

			if (RX_RS256_d1_valid = '1') then
				RX_RS256_d2 <= RX_RS256_d1;
			end if;
		end if;
	end process RX2_proc;
	
	--AI: Gate insert idle single with start frame or terminate frame signal, so that idles are not inserted after the frame
	--start or frame terminate signal
	RX_RS256_insert_idle_comb <= RX_RS256_insert_idle and (RX_RS256_d1.is_S or RX_RS256_d1.is_T);
	--RX_RS256_insert_idle_comb <= (RX_RS256_d1.is_S and RX_RS256_d2.is_S) or (RX_RS256_d1.is_T and RX_RS256_d2.is_T);
		
	RX_FRAME_STARTED_CROSS_CLOCK_proc : process(SYS_CLK_I) is
	begin
		if rising_edge(SYS_CLK_I) then
			if (SYS_RST_I = '1') then
				RX_frame_started_old     <= '0';
				RX_frame_queue_count_inc <= '0';
			else
				if (RX_frame_started_old /= RX_frame_started_sr(23)) then
					RX_frame_started_old     <= RX_frame_started_sr(23);
					RX_frame_queue_count_inc <= '1';
				else
					RX_frame_queue_count_inc <= '0';
				end if;
			end if;
		end if;
	end process RX_FRAME_STARTED_CROSS_CLOCK_proc;

	RX_FRAME_QUEUE_COUNTER_proc : process(SYS_CLK_I) is
	begin
		if rising_edge(SYS_CLK_I) then
			if XLGMII_RX_FIFO_empty = '1' then
				RX_frame_queue_count <= (others => '0');
			else
				if (RX_frame_queue_count_inc = '1') then
					if (RX_frame_queue_count_dec = '1') then
						RX_frame_queue_count <= RX_frame_queue_count;
					else
						RX_frame_queue_count <= RX_frame_queue_count + 1;
					end if;
				elsif (RX_frame_queue_count_dec = '1') then
					RX_frame_queue_count <= RX_frame_queue_count - 1;
				else
					RX_frame_queue_count <= RX_frame_queue_count;
				end if;
			end if;
		end if;
	end process RX_FRAME_QUEUE_COUNTER_proc;

	RX_frame_queue_empty <= (RX_frame_queue_count = 0);

	RX_OUTPUT_REGISTER_proc : process(SYS_CLK_I) is
	begin
		if rising_edge(SYS_CLK_I) then
			if (RX_RS256_insert_idle_comb = '1') then
				XLGMII_X4_RX_O <= (others => IBLOCK_R);
			else
				XLGMII_X4_RX_O(0).C <= RX_RS256_d2.C(7 downto 0);
				XLGMII_X4_RX_O(1).C <= RX_RS256_d2.C(15 downto 8);
				XLGMII_X4_RX_O(2).C <= RX_RS256_d2.C(23 downto 16);
				XLGMII_X4_RX_O(3).C <= RX_RS256_d2.C(31 downto 24);
				XLGMII_X4_RX_O(0).D <= RX_RS256_d2.D(63 downto 0);
				XLGMII_X4_RX_O(1).D <= RX_RS256_d2.D(127 downto 64);
				XLGMII_X4_RX_O(2).D <= RX_RS256_d2.D(191 downto 128);
				XLGMII_X4_RX_O(3).D <= RX_RS256_d2.D(255 downto 192);
			end if;
		end if;
	end process RX_OUTPUT_REGISTER_proc;

	-- DIAGNOSTICS
	RX_FRAME_COUNTER_proc : process(SYS_CLK_I) is
	begin
		if rising_edge(SYS_CLK_I) then
			if (SYS_RST_I = '1') then
				RX_frame_active      <= '0';
				RX_frame_count       <= (others => '0');
				RX_frame_error_count <= (others => '0');
			else
				if (RX_RS256_insert_idle_comb = '0') then
					if (RX_frame_active = '1') then
						if (RX_RS256_d2.is_T = '1') then
							RX_frame_count <= RX_frame_count + 1;
							if (RX_RS256_d2.is_S = '1') then
								RX_frame_active <= '1';
							else
								RX_frame_active <= '0';
							end if;
						elsif (RX_RS256_d2.is_S = '1') then
							RX_frame_error_count <= RX_frame_error_count + 1;
						end if;
					else
						if (RX_RS256_d2.is_T = '1') then
							RX_frame_error_count <= RX_frame_error_count + 1;
						end if;
						if (RX_RS256_d2.is_S = '1') then
							RX_frame_active <= '1';
						end if;
					end if;
				else
					if (RX_frame_active = '1') then
						RX_frame_error_count <= RX_frame_error_count + 1;
					end if;
				end if;
			end if;
		end if;
	end process RX_FRAME_COUNTER_proc;

	RX_FRAME_COUNT_O       <= std_logic_vector(RX_frame_count);
	RX_FRAME_ERROR_COUNT_O <= std_logic_vector(RX_frame_error_count);

end Behavioral;

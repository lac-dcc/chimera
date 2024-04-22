------------------------------------------------------------------------------
-- FILE NAME            : ADC32RF45_11G2_RX.vhd
------------------------------------------------------------------------------
-- COMPANY              : PERALEX ELECTRONICS (PTY) LTD
------------------------------------------------------------------------------
-- COPYRIGHT NOTICE :
--
-- The copyright, manufacturing and patent rights stemming from this document
-- in any form are vested in PERALEX ELECTRONICS (PTY) LTD.
--
-- (c) PERALEX ELECTRONICS (PTY) LTD 2021
--
-- PERALEX ELECTRONICS (PTY) LTD has ceded these rights to its clients
-- where contractually agreed.
------------------------------------------------------------------------------
-- DESCRIPTION :
--	 This component is a JESD204B Data RX for the ADC32RF45 (LMFS=82820,
--   2.8 GSPS)
--   Target Device: xc7vx690tffg1927-2
------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ADC32RF45_11G2_RX is
	generic(
		RX_POLARITY_INVERT : std_logic_vector(3 downto 0) := "0000");
	port(
		SYS_CLK_I                : in  std_logic;
		SYS_RST_I                : in  std_logic;
		SOFT_RESET_IN            : in  std_logic;
		PLL_SYNC_START           : in  std_logic;
		GTREFCLK_IN              : in  std_logic;
		RXN_I                    : in  std_logic_vector(3 downto 0);
		RXP_I                    : in  std_logic_vector(3 downto 0);
		ADC_SYNC_O               : out std_logic;
		GT_RXUSRCLK2_O           : out std_logic;
		ADC_DATA_CLOCK           : in  std_logic;
		ADC_DATA_16X12B_OUT      : out std_logic_vector(191 downto 0);
		ADC_DATA_16X12B_VAL_OUT  : out std_logic;
		ADC_PLL_ARESET           : out std_logic;
		ADC_PLL_LOCKED           : in  std_logic;
		STATUS_O                 : out std_logic_vector(31 downto 0);
		GBXF_RDEN_OUT            : out std_logic;
		GBXF_RDEN_IN             : in  std_logic);
end ADC32RF45_11G2_RX;

architecture ADC32RF45_11G2_RX_ARC of ADC32RF45_11G2_RX is

	----------------------------------------------
	-- TYPES
	----------------------------------------------
	type stdlvec_arr_36bx4  is array (0 to 3)  of std_logic_vector(35 downto 0);
	type stdlvec_arr_32bx4  is array (0 to 3)  of std_logic_vector(31 downto 0);
	type stdlvec_arr_64bx4  is array (0 to 3)  of std_logic_vector(63 downto 0);
	type stdlvec_arr_4bx4   is array (0 to 3)  of std_logic_vector(3 downto 0);
	type stdlvec_arr_2bx4   is array (0 to 3)  of std_logic_vector(1 downto 0);
	type stdlvec_arr_12bx20 is array (0 to 20) of std_logic_vector(11 downto 0);
	type unsigned_arr_6bx4  is array (0 to 3)  of unsigned(5 downto 0);
	type unsigned_arr_3bx4  is array (0 to 3)  of unsigned(2 downto 0);

	----------------------------------------------
	-- CLOCKS/RESETS
	----------------------------------------------
	signal drpsysclk : std_logic; -- Free running clock provided for core reset/control purposes
	signal drpsysrst : std_logic;
	signal rxusrclk2 : std_logic; -- Recovered 280 MHz clock
	signal adcdatclk : std_logic; -- 175 MHz clock generated from the recovered 280 MHz clock (using PLL/MMCM)
	
	----------------------------------------------
	-- RESET CONTROL
	----------------------------------------------
	-- CONNECTIONS
	signal rctrl_apll_locked : std_logic;
	signal rctrl_drpsysrst   : std_logic;
	signal rctrl_fsmrstdone  : std_logic_vector(3 downto 0);
	signal rctrl_pllsncstart : std_logic;
	signal rctrl_rst         : std_logic;
	signal rctrl_state_code  : std_logic_vector(3 downto 0);
	-- REGISTERS
	type rctrl_state_type is (s0_uninit, s1_rst_predelay, s2_rst_assert, s3_rst_postdelay, s4_wait_rstdone, s5_wait_adcpll_locked, s6_done_delay, s7_done);
	signal rctrl_adcpllrstn        : std_logic                      := '0';
	signal rctrl_datvalen_cnt      : unsigned(3 downto 0)           := to_unsigned(0, 4);
	signal rctrl_drpsysrst_delayed : std_logic                      := '0';
	signal rctrl_drpsysrst_sr      : std_logic_vector(31 downto 0)  := x"00000000";
	signal rctrl_physoftrst        : std_logic                      := '0';
	signal rctrl_pllsncstart_z1    : std_logic                      := '0';
	signal rctrl_rst_z1            : std_logic                      := '0';
	signal rctrl_rstasrt_cnt       : unsigned(7 downto 0)           := to_unsigned(0, 8);
	signal rctrl_rstdasrt_cnt      : unsigned(7 downto 0)           := to_unsigned(0, 8);
	signal rctrl_rstdelay_cnt      : unsigned(3 downto 0)           := to_unsigned(0, 4);
	signal rctrl_rstdone           : std_logic                      := '0';
	signal rctrl_rstdone_async     : std_logic                      := '0';
	signal rctrl_state             : rctrl_state_type               := s0_uninit;

	----------------------------------------------
	-- ADC RX PHY
	----------------------------------------------
	-- CONNECTIONS
	signal rphy_32bitpdat        : stdlvec_arr_32bx4;
	signal rphy_4bitk            : stdlvec_arr_4bx4;
	signal rphy_eyescandataerror : std_logic_vector(3  downto 0);
	signal rphy_gtrefclk         : std_logic;
	signal rphy_qplllock         : std_logic;
	signal rphy_qpllrefclklost   : std_logic;
	signal rphy_rxbufstatus      : std_logic_vector(11 downto 0);
	signal rphy_rxbyteisaligned  : std_logic_vector(3  downto 0);
	signal rphy_rxdisperr        : std_logic_vector(15 downto 0);
	signal rphy_rxfsmresetdone   : std_logic_vector(3  downto 0);
	signal rphy_rxn              : std_logic_vector(3  downto 0);
	signal rphy_rxnotintable     : std_logic_vector(15 downto 0);
	signal rphy_rxp              : std_logic_vector(3  downto 0);
	signal rphy_rxresetdone      : std_logic_vector(3  downto 0);
	signal rphy_softrst          : std_logic;
	-- COMPONENTS
	component ADC32RF45_11G2_RX_PHY is
	generic(
		RX_POLARITY_INVERT          : std_logic_vector(3 downto 0) := "0000";
		EXAMPLE_SIM_GTRESET_SPEEDUP : string                       := "TRUE";
		STABLE_CLOCK_PERIOD         : integer                      := 6);
	port(
		GTREFCLK_IN           : in  std_logic;
		SYSCLK_IN             : in  std_logic;
		SOFT_RESET_IN         : in  std_logic;
		RXP_IN                : in  std_logic_vector(3  downto 0);
		RXN_IN                : in  std_logic_vector(3  downto 0);
		LANE0_RX_DATA_O       : out std_logic_vector(31 downto 0);
		LANE1_RX_DATA_O       : out std_logic_vector(31 downto 0);
		LANE2_RX_DATA_O       : out std_logic_vector(31 downto 0);
		LANE3_RX_DATA_O       : out std_logic_vector(31 downto 0);
		LANE0_RX_DATA_IS_K_O  : out std_logic_vector(3  downto 0);
		LANE1_RX_DATA_IS_K_O  : out std_logic_vector(3  downto 0);
		LANE2_RX_DATA_IS_K_O  : out std_logic_vector(3  downto 0);
		LANE3_RX_DATA_IS_K_O  : out std_logic_vector(3  downto 0);
		GT_RXUSRCLK2_O        : out std_logic;
		GT_RXFSMRESETDONE_O   : out std_logic_vector(3  downto 0);
		GT_RXBUFSTATUS_O      : out std_logic_vector(11 downto 0);
		GT_RXDISPERR_O        : out std_logic_vector(15 downto 0);
		GT_RXNOTINTABLE_O     : out std_logic_vector(15 downto 0);
		GT_EYESCANDATAERROR_O : out std_logic_vector(3  downto 0);
		GT_RXBYTEISALIGNED_O  : out std_logic_vector(3  downto 0);
		GT_RXRESETDONE_O      : out std_logic_vector(3  downto 0);
		GT_QPLLLOCK_O         : out std_logic;
		GT_QPLLREFCLKLOST_O   : out std_logic);
	end component;
	
	----------------------------------------------
	-- K28.5 (0xBC) COMMA CHARACTER VERIFICATION
	----------------------------------------------
	-- CONNECTIONS
	signal k28p5det_32bitpdat : stdlvec_arr_32bx4;
	signal k28p5det_4bitk     : stdlvec_arr_4bx4;
	signal k28p5det_rstn      : std_logic;
	-- REGISTERS
	signal k28p5det_cnt     : unsigned(7 downto 0)         := to_unsigned(0, 8);
	signal k28p5det_done    : std_logic                    := '0';
	signal k28p5det_valid   : std_logic_vector(3 downto 0) := "0000";

	----------------------------------------------
	-- CHANNEL BONDING CONTROL
	----------------------------------------------
	-- CONNECTIONS
	signal chbnd_32bitpdat : stdlvec_arr_32bx4;
	signal chbnd_4bitk     : stdlvec_arr_4bx4;
	signal chbnd_en        : std_logic;
	signal chbnd_rstn      : std_logic;
    signal chbnd_detk28p3  : std_logic_vector(3 downto 0);
    signal chbnd_donen     : std_logic;
	-- REGISTERS
	signal chbnd_32bitpdat_z1 : stdlvec_arr_32bx4            := (others => x"00000000");
	signal chbnd_32bitpdat_z2 : stdlvec_arr_32bx4            := (others => x"00000000");
	signal chbnd_32bitpdat_z3 : stdlvec_arr_32bx4            := (others => x"00000000");
	signal chbnd_4bitk_z1     : stdlvec_arr_4bx4             := (others => x"0");
	signal chbnd_4bitk_z2     : stdlvec_arr_4bx4             := (others => x"0");
	signal chbnd_4bitk_z3     : stdlvec_arr_4bx4             := (others => x"0");
	signal chbnd_datval       : std_logic_vector(3 downto 0) := "0000";
	signal chbnd_detk28p3_z1  : std_logic_vector(3 downto 0) := "0000";
	signal chbnd_detk28p3_z2  : std_logic_vector(3 downto 0) := "0000";
	signal chbnd_done         : std_logic                    := '0';
	signal chbnd_done_z1      : std_logic                    := '0';
	signal chbnd_plsfreq_cnt  : unsigned_arr_6bx4            := (others => "100000"); -- 32
	signal chbnd_plsfreq_err  : std_logic_vector(3 downto 0) := "0000";
	signal chbnd_plsnum_cnt   : unsigned_arr_3bx4            := (others => "000");
	signal chbnd_plsnum_err   : std_logic_vector(3 downto 0) := "0000";
	signal chbnd_plswidth_err : std_logic_vector(3 downto 0) := "0000";
	
	----------------------------------------------
	-- CHANNEL BONDING FIFO
	----------------------------------------------
	-- COMPONENTS
	component chbfifo
	port (
		clk   : in std_logic;
		srst  : in std_logic;
		din   : in std_logic_vector(35 downto 0);
		wr_en : in std_logic;
		rd_en : in std_logic;
		dout  : out std_logic_vector(35 downto 0);
		full  : out std_logic;
		empty : out std_logic);
	end component;
	-- CONNECTIONS
	signal chbfifo_srst  : std_logic_vector(3 downto 0);
	signal chbfifo_wren  : std_logic_vector(3 downto 0);
	signal chbfifo_dout  : stdlvec_arr_36bx4;
	signal chbfifo_full  : std_logic_vector(3 downto 0);
	signal chbfifo_empty : std_logic_vector(3 downto 0);
	signal chbfifo_rden  : std_logic_vector(3 downto 0);
	signal chbfifo_din   : stdlvec_arr_36bx4;
	
	----------------------------------------------
	-- WORD ALIGNMENT
	----------------------------------------------
	-- CONSTANTS
	constant K28p3 : std_logic_vector(8 downto 0) := "101111100";
	-- CONNECTIONS
	signal walgn_32bitpdat : stdlvec_arr_32bx4;
	signal walgn_4bitk     : stdlvec_arr_4bx4;
	signal walgn_algnbuf   : stdlvec_arr_64bx4;
	signal walgn_en        : std_logic;
	signal walgn_rstn      : std_logic;
	-- REGISTERS
	signal walgn_32bitpdat_z1 : stdlvec_arr_32bx4            := (others => x"00000000");
	signal walgn_algndat      : stdlvec_arr_32bx4            := (others => x"00000000");
	signal walgn_done         : std_logic                    := '0';
	signal walgn_error        : std_logic                    := '0';
	signal walgn_ptr          : stdlvec_arr_2bx4             := (others => "00");
	signal walgn_ptr_set      : std_logic_vector(3 downto 0) := "0000";

	----------------------------------------------
	-- DATA UNFRAMING
	----------------------------------------------
	-- CONNECTIONS
	signal unfrm_rstn                 : std_logic;
	signal unfrm_en                   : std_logic;
	signal unfrm_32bitpdat            : stdlvec_arr_32bx4;
	signal unfrm_32bitpdat_bytswpd    : stdlvec_arr_32bx4;
	signal unfrm_32bitpdat_z1_bytswpd : stdlvec_arr_32bx4;
	-- REGISTERS
	signal unfrm_120bdat      : std_logic_vector(119 downto 0) := (others => '0');
	signal unfrm_20x12bsmpbuf : stdlvec_arr_12bx20             := (others => (x"000"));
	signal unfrm_32bitpdat_z1 : stdlvec_arr_32bx4              := (others => (x"00000000"));
	signal unfrm_clk          : std_logic                      := '0';
	signal unfrm_done         : std_logic                      := '0';
	signal unfrm_en_z1        : std_logic                      := '0';
	signal unfrm_en_z2        : std_logic                      := '0';

	----------------------------------------------
	-- 10:16 GEARBOX LOGIC
	----------------------------------------------
	-- CONNECTIONS
	signal gbxl_rstn        : std_logic;
	signal gbxl_120bdat     : std_logic_vector(119 downto 0);
	signal gbxl_192bdat     : std_logic_vector(191 downto 0);
	signal gbxl_192bdat_val : std_logic;
	-- 10:16 GEARBOX LOGIC COMPONENT
	component gearbox_10to16 is
	port(
		clk             : in  std_logic;
		reset_n         : in  std_logic;
		data_in_10x12b  : in  std_logic_vector(119 downto 0);
		data_out_16x12b : out std_logic_vector(191 downto 0);
		valid           : out std_logic);
	end component;
	
	----------------------------------------------
	-- 10:16 GEARBOX FIFO
	----------------------------------------------
	-- CONNECTIONS
	signal gbxf_din               : std_logic_vector(191 downto 0);
	signal gbxf_dout              : std_logic_vector(191 downto 0);
	signal gbxf_dval              : std_logic;
	signal gbxf_empty             : std_logic;
	signal gbxf_full              : std_logic;
	signal gbxf_prog_empty        : std_logic;
	signal gbxf_rden              : std_logic;
	signal gbxf_rden_out_i        : std_logic;
	signal gbxf_rst               : std_logic;
	signal gbxf_rst_async         : std_logic;
	signal gbxf_rst_async_z1      : std_logic;
	signal gbxf_wren              : std_logic;
	-- REGISTERS
	signal gbxf_rden_z1           : std_logic := '0';
	-- COMPONENTS
	component adcrx_async_fifo
		port (
		rst        : in  std_logic;
		wr_clk     : in  std_logic;
		rd_clk     : in  std_logic;
		din        : in  std_logic_vector(191 downto 0);
		wr_en      : in  std_logic;
		rd_en      : in  std_logic;
		dout       : out std_logic_vector(191 downto 0);
		full       : out std_logic;
		empty      : out std_logic;
		prog_empty : out std_logic);
	end component;

	----------------------------------------------
	-- CORE STATUS
	----------------------------------------------
	-- STATUS SIGNALS (ASYNC)
	-- CONNECTIONS
	signal stat_chbnd_done_async         : std_logic;
	signal stat_eyescandataerror_async   : std_logic;
	signal stat_gbxf_empty_async         : std_logic;
	signal stat_gbxf_full_async          : std_logic;
	signal stat_gbxf_prog_empty_async    : std_logic;
	signal stat_k28p5det_done_async      : std_logic;
	signal stat_qplllock_async           : std_logic;
	signal stat_qpllrefclklost_async     : std_logic;
	signal stat_rctrl_rstdone_async      : std_logic;
	signal stat_rxfsmresetdone_async     : std_logic;
	signal stat_unfrm_done_async         : std_logic;
	signal stat_walgn_done_async         : std_logic;
	signal stat_walgn_error_async        : std_logic;
	-- REGISTERS
	signal stat_chbfifo_empty_async      : std_logic := '0';
	signal stat_chbfifo_full_async       : std_logic := '0';
	signal stat_chbnd_datval_async       : std_logic := '0';
	signal stat_chbnd_plsfreq_err_async  : std_logic := '0';
	signal stat_chbnd_plsnum_err_async   : std_logic := '0';
	signal stat_chbnd_plswidth_err_async : std_logic := '0';
	signal stat_rxbufstatus_async        : std_logic := '0';
	signal stat_rxbyteisaligned_async    : std_logic := '0';
	signal stat_rxdisperr_async          : std_logic := '0';
	signal stat_rxnotintable_async       : std_logic := '0';
	signal stat_rxresetdone_async        : std_logic := '0';

	-- STATUS SIGNALS (IN SYNC)
	-- CONNECTIONS
	signal stat_rctrl_apll_locked  : std_logic;
	-- REGISTERS
	signal stat_chbfifo_empty      : std_logic := '0';
	signal stat_chbfifo_full       : std_logic := '0';
	signal stat_chbnd_datval       : std_logic := '0';
	signal stat_chbnd_done         : std_logic := '0';
	signal stat_chbnd_plsfreq_err  : std_logic := '0';
	signal stat_chbnd_plsnum_err   : std_logic := '0';
	signal stat_chbnd_plswidth_err : std_logic := '0';
	signal stat_eyescandataerror   : std_logic := '0';
	signal stat_gbxf_empty         : std_logic := '0';
	signal stat_gbxf_full          : std_logic := '0';
	signal stat_gbxf_prog_empty    : std_logic := '0';
	signal stat_k28p5det_done      : std_logic := '0';
	signal stat_qplllock           : std_logic := '0';
	signal stat_qpllrefclklost     : std_logic := '0';
	signal stat_rctrl_rstdone      : std_logic := '0';
	signal stat_rxbufstatus        : std_logic := '0';
	signal stat_rxbyteisaligned    : std_logic := '0';
	signal stat_rxdisperr          : std_logic := '0';
	signal stat_rxfsmresetdone     : std_logic := '0';
	signal stat_rxnotintable       : std_logic := '0';
	signal stat_rxresetdone        : std_logic := '0';
	signal stat_unfrm_done         : std_logic := '0';
	signal stat_walgn_done         : std_logic := '0';
	signal stat_walgn_error        : std_logic := '0';

	-- LATCHED STATUS SIGNALS
	-- CONNECTIONS
	signal stat_chbfifo_empty_l      : std_logic;
	signal stat_chbfifo_full_l       : std_logic;
	signal stat_chbnd_datval_l       : std_logic;
	signal stat_chbnd_plsfreq_err_l  : std_logic;
	signal stat_chbnd_plsnum_err_l   : std_logic;
	signal stat_chbnd_plswidth_err_l : std_logic;
	signal stat_eyescandataerror_l   : std_logic;
	signal stat_gbxf_empty_l         : std_logic;
	signal stat_gbxf_full_l          : std_logic;
	signal stat_qplllock_l           : std_logic;
	signal stat_qpllrefclklost_l     : std_logic;
	signal stat_rctrl_apll_locked_l  : std_logic;
	signal stat_rxbufstatus_l        : std_logic;
	signal stat_rxbyteisaligned_l    : std_logic;
	signal stat_rxdisperr_l          : std_logic;
	signal stat_rxfsmresetdone_l     : std_logic;
	signal stat_rxnotintable_l       : std_logic;
	signal stat_rxresetdone_l        : std_logic;

	--- STATUS SIGNAL DONE/RESETS
	-- CONNECTIONS
	signal stat_adcpllerror_reset : std_logic;
	signal stat_chbnd_done_n      : std_logic;
	signal stat_chbondl_reset     : std_logic;
	signal stat_k28p5det_done_n   : std_logic;
	signal stat_phyerror_reset    : std_logic;
	signal stat_rstdone_n         : std_logic;
	-- REGISTERS
	signal stat_rstdone : std_logic := '0';
	
	-- COUNTERS
	-- REGISTERS
	signal stat_rstdone_cnt : unsigned(4 downto 0) := to_unsigned(0, 5);

	----------------------------------------------
	-- OTHER
	----------------------------------------------
	-- TFF COMPONENT
	component tff is
	port(
		clk    : in  std_logic;
		async  : in  std_logic;
		synced : out std_logic);
	end component;
	
	-- LATCH COMPONENT
	component latch is
	port(
		clk     : in  std_logic;
		rst     : in  std_logic;
		sig     : in  std_logic;
		latched : out std_logic);
	end component;
	
	-- DELAY COMPONENT
	component del is
	port(
		clk         : in  std_logic;
		input_sig   : in  std_logic;
		delayed_sig : out std_logic);
	end component;

	-- <TEST
	component ila_rphy
	port (
		clk : in std_logic;
		probe0 : in std_logic_vector(31 downto 0);
		probe1 : in std_logic_vector(31 downto 0);
		probe2 : in std_logic_vector(31 downto 0);
		probe3 : in std_logic_vector(31 downto 0);
		probe4 : in std_logic_vector(15 downto 0);
		probe5 : in std_logic_vector(15 downto 0);
		probe6 : in std_logic_vector(11 downto 0);
		probe7 : in std_logic_vector(3 downto 0);
		probe8 : in std_logic_vector(3 downto 0);
		probe9 : in std_logic_vector(3 downto 0);
		probe10 : in std_logic_vector(3 downto 0);
		probe11 : in std_logic_vector(3 downto 0);
		probe12 : in std_logic_vector(3 downto 0);
		probe13 : in std_logic_vector(3 downto 0);
		probe14 : in std_logic_vector(3 downto 0);
		probe15 : in std_logic_vector(3 downto 0);
		probe16 : in std_logic_vector(3 downto 0);
		probe17 : in std_logic_vector(0 downto 0);
		probe18 : in std_logic_vector(0 downto 0);
		probe19 : in std_logic_vector(0 downto 0));
	end component;

	component ila_rctrl
	port (
		clk : in std_logic;
		probe0 : in std_logic_vector(7 downto 0);
		probe1 : in std_logic_vector(7 downto 0);
		probe2 : in std_logic_vector(3 downto 0);
		probe3 : in std_logic_vector(3 downto 0);
		probe4 : in std_logic_vector(3 downto 0);
		probe5 : in std_logic_vector(3 downto 0);
		probe6 : in std_logic_vector(0 downto 0);
		probe7 : in std_logic_vector(0 downto 0);
		probe8 : in std_logic_vector(0 downto 0);
		probe9 : in std_logic_vector(0 downto 0);
		probe10 : in std_logic_vector(0 downto 0);
		probe11 : in std_logic_vector(0 downto 0);
		probe12 : in std_logic_vector(0 downto 0);
		probe13 : in std_logic_vector(0 downto 0));
	end component;

	component ila_chbnd
	port (
		clk : in std_logic;
		probe0  : in std_logic_vector(31 downto 0);
		probe1  : in std_logic_vector(31 downto 0);
		probe2  : in std_logic_vector(31 downto 0);
		probe3  : in std_logic_vector(31 downto 0);
		probe4  : in std_logic_vector(31 downto 0);
		probe5  : in std_logic_vector(31 downto 0);
		probe6  : in std_logic_vector(31 downto 0);
		probe7  : in std_logic_vector(31 downto 0);
		probe8  : in std_logic_vector(31 downto 0);
		probe9  : in std_logic_vector(31 downto 0);
		probe10 : in std_logic_vector(31 downto 0);
		probe11 : in std_logic_vector(31 downto 0);
		probe12 : in std_logic_vector(31 downto 0);
		probe13 : in std_logic_vector(31 downto 0);
		probe14 : in std_logic_vector(31 downto 0);
		probe15 : in std_logic_vector(31 downto 0);
		probe16 : in std_logic_vector(5 downto 0);
		probe17 : in std_logic_vector(5 downto 0);
		probe18 : in std_logic_vector(5 downto 0);
		probe19 : in std_logic_vector(5 downto 0);
		probe20 : in std_logic_vector(3 downto 0);
		probe21 : in std_logic_vector(3 downto 0);
		probe22 : in std_logic_vector(3 downto 0);
		probe23 : in std_logic_vector(3 downto 0);
		probe24 : in std_logic_vector(3 downto 0);
		probe25 : in std_logic_vector(3 downto 0);
		probe26 : in std_logic_vector(3 downto 0);
		probe27 : in std_logic_vector(3 downto 0);
		probe28 : in std_logic_vector(3 downto 0);
		probe29 : in std_logic_vector(3 downto 0);
		probe30 : in std_logic_vector(3 downto 0);
		probe31 : in std_logic_vector(3 downto 0);
		probe32 : in std_logic_vector(3 downto 0);
		probe33 : in std_logic_vector(3 downto 0);
		probe34 : in std_logic_vector(3 downto 0);
		probe35 : in std_logic_vector(3 downto 0);
		probe36 : in std_logic_vector(3 downto 0);
		probe37 : in std_logic_vector(3 downto 0);
		probe38 : in std_logic_vector(3 downto 0);
		probe39 : in std_logic_vector(3 downto 0);
		probe40 : in std_logic_vector(3 downto 0);
		probe41 : in std_logic_vector(3 downto 0);
		probe42 : in std_logic_vector(0 downto 0);
		probe43 : in std_logic_vector(0 downto 0);
		probe44 : in std_logic_vector(0 downto 0);
		probe45 : in std_logic_vector(0 downto 0);
		probe46 : in std_logic_vector(0 downto 0);
		probe47 : in std_logic_vector(2 downto 0);
		probe48 : in std_logic_vector(2 downto 0);
		probe49 : in std_logic_vector(2 downto 0);
		probe50 : in std_logic_vector(2 downto 0);
		probe51 : in std_logic_vector(3 downto 0));
	end component;
	
	component ila_k28p5det
	port (
		clk     : in std_logic;
		probe0  : in std_logic_vector(31 downto 0);
		probe1  : in std_logic_vector(31 downto 0);
		probe2  : in std_logic_vector(31 downto 0);
		probe3  : in std_logic_vector(31 downto 0);
		probe4  : in std_logic_vector(3 downto 0);
		probe5  : in std_logic_vector(3 downto 0);
		probe6  : in std_logic_vector(3 downto 0);
		probe7  : in std_logic_vector(3 downto 0);
		probe8  : in std_logic_vector(7 downto 0);
		probe9  : in std_logic_vector(3 downto 0);
		probe10 : in std_logic_vector(0 downto 0);
		probe11 : in std_logic_vector(0 downto 0));
	end component;
	
	component ila_chbfifo
	port (
		clk     : in std_logic;
		probe0  : in std_logic_vector(35 downto 0);
		probe1  : in std_logic_vector(35 downto 0);
		probe2  : in std_logic_vector(35 downto 0);
		probe3  : in std_logic_vector(35 downto 0);
		probe4  : in std_logic_vector(35 downto 0);
		probe5  : in std_logic_vector(35 downto 0);
		probe6  : in std_logic_vector(35 downto 0);
		probe7  : in std_logic_vector(35 downto 0);
		probe8  : in std_logic_vector(3  downto 0);
		probe9  : in std_logic_vector(3  downto 0);
		probe10 : in std_logic_vector(3  downto 0);
		probe11 : in std_logic_vector(3  downto 0);
		probe12 : in std_logic_vector(3  downto 0));
	end component;
	
	component ila_walgn
	port (
		clk     : in std_logic;
		probe0  : in std_logic_vector(31 downto 0);
		probe1  : in std_logic_vector(31 downto 0);
		probe2  : in std_logic_vector(31 downto 0);
		probe3  : in std_logic_vector(31 downto 0);
		probe4  : in std_logic_vector(31 downto 0);
		probe5  : in std_logic_vector(31 downto 0);
		probe6  : in std_logic_vector(31 downto 0);
		probe7  : in std_logic_vector(31 downto 0);
		probe8  : in std_logic_vector(31 downto 0);
		probe9  : in std_logic_vector(31 downto 0);
		probe10 : in std_logic_vector(31 downto 0);
		probe11 : in std_logic_vector(31 downto 0);
		probe12 : in std_logic_vector(31 downto 0);
		probe13 : in std_logic_vector(31 downto 0);
		probe14 : in std_logic_vector(31 downto 0);
		probe15 : in std_logic_vector(31 downto 0);
		probe16 : in std_logic_vector(3 downto 0);
		probe17 : in std_logic_vector(3 downto 0);
		probe18 : in std_logic_vector(3 downto 0);
		probe19 : in std_logic_vector(3 downto 0);
		probe20 : in std_logic_vector(3 downto 0);
		probe21 : in std_logic_vector(3 downto 0);
		probe22 : in std_logic_vector(3 downto 0);
		probe23 : in std_logic_vector(3 downto 0);
		probe24 : in std_logic_vector(3 downto 0);
		probe25 : in std_logic_vector(1 downto 0);
		probe26 : in std_logic_vector(1 downto 0);
		probe27 : in std_logic_vector(1 downto 0);
		probe28 : in std_logic_vector(1 downto 0);
		probe29 : in std_logic_vector(0 downto 0);
		probe30 : in std_logic_vector(0 downto 0);
		probe31 : in std_logic_vector(0 downto 0);
		probe32 : in std_logic_vector(0 downto 0));
	end component;
	
	component ila_unfrm
	port (
		clk : in std_logic;
		probe0 : in std_logic_vector(191 downto 0);
		probe1 : in std_logic_vector(119 downto 0);
		probe2 : in std_logic_vector(31 downto 0);
		probe3 : in std_logic_vector(31 downto 0);
		probe4 : in std_logic_vector(31 downto 0);
		probe5 : in std_logic_vector(31 downto 0);
		probe6 : in std_logic_vector(31 downto 0);
		probe7 : in std_logic_vector(31 downto 0);
		probe8 : in std_logic_vector(31 downto 0);
		probe9 : in std_logic_vector(31 downto 0);
		probe10 : in std_logic_vector(11 downto 0);
		probe11 : in std_logic_vector(11 downto 0);
		probe12 : in std_logic_vector(11 downto 0);
		probe13 : in std_logic_vector(11 downto 0);
		probe14 : in std_logic_vector(11 downto 0);
		probe15 : in std_logic_vector(0 downto 0);
		probe16 : in std_logic_vector(0 downto 0);
		probe17 : in std_logic_vector(0 downto 0);
		probe18 : in std_logic_vector(0 downto 0);
		probe19 : in std_logic_vector(0 downto 0);
		probe20 : in std_logic_vector(0 downto 0);
		probe21 : in std_logic_vector(0 downto 0);
		probe22 : in std_logic_vector(0 downto 0);
		probe23 : in std_logic_vector(0 downto 0);
		probe24 : in std_logic_vector(0 downto 0);
		probe25 : in std_logic_vector(0 downto 0));
	end component;

	component ila_gbxf
	port (
		clk : in std_logic;
		probe0 : in std_logic_vector(191 downto 0);
		probe1 : in std_logic_vector(0 downto 0);
		probe2 : in std_logic_vector(0 downto 0);
		probe3 : in std_logic_vector(0 downto 0);
		probe4 : in std_logic_vector(0 downto 0);
		probe5 : in std_logic_vector(0 downto 0);
		probe6 : in std_logic_vector(0 downto 0);
		probe7 : in std_logic_vector(0 downto 0);
		probe8 : in std_logic_vector(0 downto 0);
		probe9 : in std_logic_vector(0 downto 0));
	end component;
	--TEST>
	
begin
	--<TEST
	-- ila_rphy_i : ila_rphy port map (
		-- clk     => rxusrclk2,
		-- probe0  => rphy_32bitpdat(0)    ,
		-- probe1  => rphy_32bitpdat(1)    ,
		-- probe2  => rphy_32bitpdat(2)    ,
		-- probe3  => rphy_32bitpdat(3)    ,
		-- probe4  => rphy_rxdisperr       ,
		-- probe5  => rphy_rxnotintable    ,
		-- probe6  => rphy_rxbufstatus     ,
		-- probe7  => rphy_rxbyteisaligned ,
		-- probe8  => "0000",
		-- probe9  => rphy_rxfsmresetdone  ,
		-- probe10 => rphy_rxresetdone     ,
		-- probe11 => "0000",
		-- probe12 => rphy_eyescandataerror,
		-- probe13 => rphy_4bitk(0)        ,
		-- probe14 => rphy_4bitk(1)        ,
		-- probe15 => rphy_4bitk(2)        ,
		-- probe16 => rphy_4bitk(3)        ,
		-- probe17(0) => rphy_qplllock        ,
		-- probe18(0) => rphy_qpllrefclklost  ,
		-- probe19(0) => rphy_softrst         );

	-- ila_rctrl_i : ila_rctrl port map (
		-- clk     => drpsysclk,
		-- probe0  => std_logic_vector(rctrl_rstasrt_cnt ),
		-- probe1  => std_logic_vector(rctrl_rstdasrt_cnt),
		-- probe2  => std_logic_vector(rctrl_rstdelay_cnt),
		-- probe3  => std_logic_vector(rctrl_datvalen_cnt),
		-- probe4  => rctrl_fsmrstdone  ,
		-- probe5  => rctrl_state_code  ,
		-- probe6(0)  => rctrl_apll_locked ,
		-- probe7(0)  => rctrl_rst         ,
		-- probe8(0)  => '0'    ,
		-- probe9(0)  => rctrl_adcpllrstn  ,
		-- probe10(0) => '0'    ,
		-- probe11(0) => rctrl_physoftrst  ,
		-- probe12(0) => rctrl_rst_z1      ,
		-- probe13(0) => rctrl_rstdone     );

	-- ila_chbnd_i : ila_chbnd port map (
		-- clk     => rxusrclk2,
		-- probe0  => chbnd_32bitpdat(0)   ,
		-- probe1  => chbnd_32bitpdat(1)   ,
		-- probe2  => chbnd_32bitpdat(2)   ,
		-- probe3  => chbnd_32bitpdat(3)   ,
		-- probe4  => chbnd_32bitpdat_z1(0),
		-- probe5  => chbnd_32bitpdat_z1(1),
		-- probe6  => chbnd_32bitpdat_z1(2),
		-- probe7  => chbnd_32bitpdat_z1(3),
		-- probe8  => chbnd_32bitpdat_z2(0),
		-- probe9  => chbnd_32bitpdat_z2(1),
		-- probe10 => chbnd_32bitpdat_z2(2),
		-- probe11 => chbnd_32bitpdat_z2(3),
		-- probe12 => chbnd_32bitpdat_z3(0),
		-- probe13 => chbnd_32bitpdat_z3(1),
		-- probe14 => chbnd_32bitpdat_z3(2),
		-- probe15 => chbnd_32bitpdat_z3(3),
		-- probe16 => std_logic_vector(chbnd_plsfreq_cnt(0)) ,
		-- probe17 => std_logic_vector(chbnd_plsfreq_cnt(1)) ,
		-- probe18 => std_logic_vector(chbnd_plsfreq_cnt(2)) ,
		-- probe19 => std_logic_vector(chbnd_plsfreq_cnt(3)) ,
		-- probe20 => chbnd_4bitk_z1(0)    ,
		-- probe21 => chbnd_4bitk_z1(1)    ,
		-- probe22 => chbnd_4bitk_z1(2)    ,
		-- probe23 => chbnd_4bitk_z1(3)    ,
		-- probe24 => chbnd_4bitk_z2(0)    ,
		-- probe25 => chbnd_4bitk_z2(1)    ,
		-- probe26 => chbnd_4bitk_z2(2)    ,
		-- probe27 => chbnd_4bitk_z2(3)    ,
		-- probe28 => chbnd_4bitk_z3(0)    ,
		-- probe29 => chbnd_4bitk_z3(1)    ,
		-- probe30 => chbnd_4bitk_z3(2)    ,
		-- probe31 => chbnd_4bitk_z3(3)    ,
		-- probe32 => chbnd_4bitk(0)       ,
		-- probe33 => chbnd_4bitk(1)       ,
		-- probe34 => chbnd_4bitk(2)       ,
		-- probe35 => chbnd_4bitk(3)       ,
		-- probe36 => chbnd_detk28p3       ,
		-- probe37 => chbnd_datval         ,
		-- probe38 => chbnd_detk28p3_z1    ,
		-- probe39 => chbnd_detk28p3_z2    ,
		-- probe40 => chbnd_plswidth_err   ,
		-- probe41 => chbnd_plsfreq_err    ,
		-- probe42(0) => chbnd_en             ,
		-- probe43(0) => chbnd_rstn           ,
		-- probe44(0) => chbnd_donen          ,
		-- probe45(0) => chbnd_done           ,
		-- probe46(0) => chbnd_done_z1        ,
		-- probe47    => std_logic_vector(chbnd_plsnum_cnt(0)),
		-- probe48    => std_logic_vector(chbnd_plsnum_cnt(1)),
		-- probe49    => std_logic_vector(chbnd_plsnum_cnt(2)),
		-- probe50    => std_logic_vector(chbnd_plsnum_cnt(3)),
		-- probe51    => chbnd_plsnum_err);

	-- ila_k28p5det_i : ila_k28p5det port map (
		-- clk     => rxusrclk2,
		-- probe0  => k28p5det_32bitpdat(0),
		-- probe1  => k28p5det_32bitpdat(1),
		-- probe2  => k28p5det_32bitpdat(2),
		-- probe3  => k28p5det_32bitpdat(3),
		-- probe4  => k28p5det_4bitk(0)    ,
		-- probe5  => k28p5det_4bitk(1)    ,
		-- probe6  => k28p5det_4bitk(2)    ,
		-- probe7  => k28p5det_4bitk(3)    ,
		-- probe8  => std_logic_vector(k28p5det_cnt),
		-- probe9  => k28p5det_valid       ,
		-- probe10(0) => k28p5det_rstn        ,
		-- probe11(0) => k28p5det_done        );
		
	-- ila_walgn_i : ila_walgn port map (
		-- clk     => rxusrclk2,
		-- probe0  => walgn_32bitpdat(0)   ,
		-- probe1  => walgn_32bitpdat(1)   ,
		-- probe2  => walgn_32bitpdat(2)   ,
		-- probe3  => walgn_32bitpdat(3)   ,
		-- probe4  => walgn_32bitpdat_z1(0),
		-- probe5  => walgn_32bitpdat_z1(1),
		-- probe6  => walgn_32bitpdat_z1(2),
		-- probe7  => walgn_32bitpdat_z1(3),
		-- probe8  => walgn_algndat(0)     ,
		-- probe9  => walgn_algndat(1)     ,
		-- probe10 => walgn_algndat(2)     ,
		-- probe11 => walgn_algndat(3)     ,
		-- probe12 => walgn_algndat_z1(0)  ,
		-- probe13 => walgn_algndat_z1(1)  ,
		-- probe14 => walgn_algndat_z1(2)  ,
		-- probe15 => walgn_algndat_z1(3)  ,
		-- probe16 => walgn_4bitk(0)       ,
		-- probe17 => walgn_4bitk(1)       ,
		-- probe18 => walgn_4bitk(2)       ,
		-- probe19 => walgn_4bitk(3)       ,
		-- probe20 => walgn_4bitk_z1(0)    ,
		-- probe21 => walgn_4bitk_z1(1)    ,
		-- probe22 => walgn_4bitk_z1(2)    ,
		-- probe23 => walgn_4bitk_z1(3)    ,
		-- probe24 => walgn_ptr_set        ,
		-- probe25 => walgn_ptr(0)         ,
		-- probe26 => walgn_ptr(1)         ,
		-- probe27 => walgn_ptr(2)         ,
		-- probe28 => walgn_ptr(3)         ,
		-- probe29(0) => walgn_en             ,
		-- probe30(0) => walgn_rstn           ,
		-- probe31(0) => walgn_done           ,
		-- probe32(0) => walgn_error          );
		
	-- ila_chbfifo_i : ila_chbfifo port map (
		-- clk     => rxusrclk2,
		-- probe0  => chbfifo_dout(0),
		-- probe1  => chbfifo_dout(1),
		-- probe2  => chbfifo_dout(2),
		-- probe3  => chbfifo_dout(3),
		-- probe4  => chbfifo_din(0) ,
		-- probe5  => chbfifo_din(1) ,
		-- probe6  => chbfifo_din(2) ,
		-- probe7  => chbfifo_din(3) ,
		-- probe8  => chbfifo_srst   ,
		-- probe9  => chbfifo_wren   ,
		-- probe10 => chbfifo_full   ,
		-- probe11 => chbfifo_empty  ,
		-- probe12 => chbfifo_rden   );
		
	-- ila_unfrm_i : ila_unfrm port map (
		-- clk     => rxusrclk2,
		-- probe0  => gbxl_192bdat         ,
		-- probe1  => gbxl_120bdat         ,
		-- probe2  => unfrm_32bitpdat(0)   ,
		-- probe3  => unfrm_32bitpdat(1)   ,
		-- probe4  => unfrm_32bitpdat(2)   ,
		-- probe5  => unfrm_32bitpdat(3)   ,
		-- probe6  => unfrm_32bitpdat_z1(0),
		-- probe7  => unfrm_32bitpdat_z1(1),
		-- probe8  => unfrm_32bitpdat_z1(2),
		-- probe9  => unfrm_32bitpdat_z1(3),
		-- probe10 => unfrm_20x12bsmpbuf(0),
		-- probe11 => unfrm_20x12bsmpbuf(1),
		-- probe12 => unfrm_20x12bsmpbuf(2),
		-- probe13 => unfrm_20x12bsmpbuf(3),
		-- probe14 => unfrm_20x12bsmpbuf(4),
		-- probe15(0) => unfrm_rstn           ,
		-- probe16(0) => unfrm_en             ,
		-- probe17(0) => unfrm_clk            ,
		-- probe18(0) => unfrm_done           ,
		-- probe19(0) => unfrm_en_z1          ,
		-- probe20(0) => unfrm_en_z2          ,
		-- probe21(0) => gbxl_rstn            ,
		-- probe22(0) => gbxl_192bdat_val     ,
		-- probe23(0) => gbxf_rst,
		-- probe24(0) => gbxf_wren    ,
		-- probe25(0) => gbxf_full  );
		
	 -- ila_gbxf_i : ila_gbxf port map (
		 -- clk        => adcdatclk,
		 -- probe0     => gbxf_dout             ,
		 -- probe1(0)  => gbxf_rst          ,
		 -- probe2(0)  => '0',
		 -- probe3(0)  => '0',
		 -- probe4(0)  => gbxf_dval ,
		 -- probe5(0)  => gbxf_rden_z1,
		 -- probe6(0)  => gbxf_rden ,
		 -- probe7(0)  => gbxf_empty ,
		 -- probe8(0)  => gbxf_prog_empty       ,
		 -- probe9(0)  => '0');
	--TEST>

	----------------------------------------------
	-- RESET CONTROL
	----------------------------------------------
	-- CONNECTIONS
	rctrl_drpsysrst   <= drpsysrst;
	rctrl_fsmrstdone  <= rphy_rxfsmresetdone;
	rctrl_pllsncstart <= PLL_SYNC_START;
	rctrl_rst         <= SOFT_RESET_IN;
	tff_adcplllocked : tff port map (drpsysclk, ADC_PLL_LOCKED, rctrl_apll_locked);
	-- RESET CONTROL FSM PROCESS
	process (drpsysclk)
	begin
		if rising_edge(drpsysclk) then
			if rctrl_drpsysrst_delayed = '1' then
				rctrl_adcpllrstn        <= '0';
				rctrl_datvalen_cnt      <= to_unsigned(0, 4);
				rctrl_physoftrst        <= '0';
				rctrl_pllsncstart_z1    <= '0';
				rctrl_rst_z1            <= '0';
				rctrl_rstasrt_cnt       <= to_unsigned(0, 8);
				rctrl_rstdasrt_cnt      <= to_unsigned(0, 8);
				rctrl_rstdelay_cnt      <= to_unsigned(0, 4);
				rctrl_rstdone_async     <= '0';
				rctrl_state             <= s0_uninit;
			else
				if rctrl_pllsncstart_z1 = '0' and rctrl_pllsncstart = '1' then
					rctrl_state        <= s0_uninit;
				elsif rctrl_rst_z1 = '0' and rctrl_rst = '1' then
					rctrl_rstdelay_cnt <= to_unsigned(0, 4);
					rctrl_state        <= s1_rst_predelay;
				else
					case rctrl_state is
						when s0_uninit =>
							rctrl_state <= s0_uninit;
						when s1_rst_predelay =>
							if rctrl_rstdelay_cnt < 15 then
								rctrl_rstdelay_cnt <= rctrl_rstdelay_cnt + 1;
								rctrl_state <= s1_rst_predelay;
							else
								rctrl_state       <= s2_rst_assert;
								rctrl_rstasrt_cnt <= to_unsigned(0, 8);
							end if;

						when s2_rst_assert =>
							if rctrl_rstasrt_cnt < 255 then
								rctrl_rstasrt_cnt  <= rctrl_rstasrt_cnt + 1;
								rctrl_state        <= s2_rst_assert;
							else
								rctrl_rstdasrt_cnt <= to_unsigned(0, 8);
								rctrl_state        <= s3_rst_postdelay;
							end if;
							
						when s3_rst_postdelay =>
							if rctrl_rstdasrt_cnt < 255 then
								rctrl_rstdasrt_cnt <= rctrl_rstdasrt_cnt + 1;
								rctrl_state        <= s3_rst_postdelay;
							else
								rctrl_state        <= s4_wait_rstdone;
							end if;

						when s4_wait_rstdone =>
							if rctrl_fsmrstdone = x"F" then
								rctrl_state <= s5_wait_adcpll_locked;
							else
								rctrl_state <= s4_wait_rstdone;
							end if;
							
						when s5_wait_adcpll_locked =>
							if rctrl_apll_locked = '1' then
								rctrl_state <= s6_done_delay;
								rctrl_datvalen_cnt <= to_unsigned(0, 4);
							else
								rctrl_state <= s5_wait_adcpll_locked;
							end if;
							
						when s6_done_delay =>
							if rctrl_datvalen_cnt < 15 then
								rctrl_datvalen_cnt <= rctrl_datvalen_cnt + 1;
								rctrl_state <= s6_done_delay;
							else
								rctrl_state <= s7_done;
							end if;
							
						when s7_done =>
							rctrl_state <= s7_done;
					end case;
				end if;

				-- Control signals
				if rctrl_state = s5_wait_adcpll_locked or rctrl_state = s6_done_delay or rctrl_state = s7_done then
					rctrl_adcpllrstn <= '1';
				else
					rctrl_adcpllrstn <= '0';
				end if;
				
				if rctrl_state = s7_done then
					rctrl_rstdone_async <= '1';
				else
					rctrl_rstdone_async <= '0';
				end if;
				
				if rctrl_state = s2_rst_assert then
					rctrl_physoftrst <= '1';
				else
					rctrl_physoftrst <= '0';
				end if;
				
				-- 1-clock-cycle delayed signals
				rctrl_rst_z1         <= rctrl_rst;
				rctrl_pllsncstart_z1 <= rctrl_pllsncstart;
			end if;
			
			-- 32-clock-cycle delayed signals
			rctrl_drpsysrst_delayed <= rctrl_drpsysrst_sr(31);
			for i in 30 downto 0 loop
				rctrl_drpsysrst_sr(i+1) <= rctrl_drpsysrst_sr(i);
			end loop;
			rctrl_drpsysrst_sr(0) <= rctrl_drpsysrst;
		end if;
	end process;
	tff_rctrlrstdone : tff port map (rxusrclk2, rctrl_rstdone_async, rctrl_rstdone);
	
	-- RESET CONTROL FSM DECODING
	with rctrl_state select
		rctrl_state_code <= "0000" when s0_uninit,
		                    "0001" when s1_rst_predelay,
		                    "0010" when s2_rst_assert,
		                    "0011" when s3_rst_postdelay,
		                    "0100" when s4_wait_rstdone,
		                    "0101" when s5_wait_adcpll_locked,
		                    "0110" when s6_done_delay,
		                    "0111" when s7_done,
		                    "1111" when others;
	
	----------------------------------------------
	-- ADC RX PHY
	----------------------------------------------
	rphy_softrst <= rctrl_physoftrst;
	ADC32RF45_11G2_RX_PHY_i : ADC32RF45_11G2_RX_PHY generic map (
		RX_POLARITY_INVERT  => RX_POLARITY_INVERT)
	port map  (
		SYSCLK_IN                => drpsysclk,
		GT_RXUSRCLK2_O           => rxusrclk2,
		SOFT_RESET_IN            => rphy_softrst,
		RXP_IN                   => rphy_rxp,
		RXN_IN                   => rphy_rxn,
		GTREFCLK_IN              => rphy_gtrefclk,
		LANE0_RX_DATA_O          => rphy_32bitpdat(0),
		LANE1_RX_DATA_O          => rphy_32bitpdat(1),
		LANE2_RX_DATA_O          => rphy_32bitpdat(2),
		LANE3_RX_DATA_O          => rphy_32bitpdat(3),
		LANE0_RX_DATA_IS_K_O     => rphy_4bitk(0),
		LANE1_RX_DATA_IS_K_O     => rphy_4bitk(1),
		LANE2_RX_DATA_IS_K_O     => rphy_4bitk(2),
		LANE3_RX_DATA_IS_K_O     => rphy_4bitk(3),
		GT_RXFSMRESETDONE_O      => rphy_rxfsmresetdone,
		GT_RXBUFSTATUS_O         => rphy_rxbufstatus,
		GT_RXDISPERR_O           => rphy_rxdisperr,
		GT_RXNOTINTABLE_O        => rphy_rxnotintable,
		GT_EYESCANDATAERROR_O    => rphy_eyescandataerror,
		GT_RXBYTEISALIGNED_O     => rphy_rxbyteisaligned,
		GT_RXRESETDONE_O         => rphy_rxresetdone,
		GT_QPLLLOCK_O            => rphy_qplllock,
		GT_QPLLREFCLKLOST_O      => rphy_qpllrefclklost);

	----------------------------------------------
	-- K28.5 (0xBC) COMMA CHARACTER VERIFICATION
	----------------------------------------------
	-- CONNECTIONS
	k28p5det_rstn      <= rctrl_rstdone;
	k28p5det_32bitpdat <= rphy_32bitpdat;
	k28p5det_4bitk     <= rphy_4bitk;
	
	-- COMMA CHARACTER VERIFICATION PROCESS
	process(rxusrclk2) is
	begin
		if rising_edge(rxusrclk2) then
			if k28p5det_rstn = '0' then
				k28p5det_cnt     <= to_unsigned(0, 8);
				k28p5det_valid   <= "0000";
				k28p5det_done    <= '0';
			else
				-- Check PHY data and K outputs for valid K28.5 comma characters
				for i in 0 to 3 loop
					if (k28p5det_32bitpdat(i) = x"BCBCBCBC" and k28p5det_4bitk(i) = x"F") then
						k28p5det_valid(i) <= '1';
					else
						k28p5det_valid(i) <= '0';
					end if;
				end loop;
				-- After counting 2048 (128 x 4 x 4) K28.5 comma characters, assert the k28p5det_done signal
				if k28p5det_valid = x"F" then
					if k28p5det_cnt < 128 then
						k28p5det_cnt <= k28p5det_cnt + 1;
					else
						k28p5det_done  <= '1';
					end if;
				else
					k28p5det_cnt <= to_unsigned(0, 8);
				end if;
			end if;
		end if;
	end process;

	----------------------------------------------
	-- CHANNEL BONDING
	----------------------------------------------
	-- CONNECTIONS
	chbnd_32bitpdat   <= rphy_32bitpdat;
	chbnd_4bitk       <= rphy_4bitk;
	chbnd_en          <= k28p5det_done;
	chbnd_rstn        <= rctrl_rstdone;
	G_CHANBOND: for i in 0 to 3 generate
		chbnd_detk28p3(i) <= '1' when ((chbnd_4bitk(i)(0)  & chbnd_32bitpdat(i)(7  downto  0)) = K28p3 or
		                               (chbnd_4bitk(i)(1)  & chbnd_32bitpdat(i)(15 downto  8)) = K28p3 or
		                               (chbnd_4bitk(i)(2)  & chbnd_32bitpdat(i)(23 downto 16)) = K28p3 or
		                               (chbnd_4bitk(i)(3)  & chbnd_32bitpdat(i)(31 downto 24)) = K28p3) else '0';
	end generate;

	-- CHANNEL BONDING CONTROL PROCESS
	process (rxusrclk2)
	begin
		if rising_edge(rxusrclk2) then
			if chbnd_rstn = '0' then
				chbnd_32bitpdat_z1 <= (others => x"00000000");
				chbnd_32bitpdat_z2 <= (others => x"00000000");
				chbnd_32bitpdat_z3 <= (others => x"00000000");
				chbnd_4bitk_z1     <= (others => x"0");
				chbnd_4bitk_z2     <= (others => x"0");
				chbnd_4bitk_z3     <= (others => x"0");
				chbnd_datval       <= "0000";
				chbnd_detk28p3_z1  <= "0000";
				chbnd_detk28p3_z2  <= "0000";
				chbnd_done         <= '0';
				chbnd_done_z1      <= '0';
				chbnd_plsfreq_cnt  <= (others => "100000"); -- 32
				chbnd_plsfreq_err  <= "0000";
				chbnd_plsnum_cnt   <= (others => "000");
				chbnd_plsnum_err   <= "0000";
				chbnd_plswidth_err <= "0000";
			else
				if chbnd_en = '1' then
					
					-- Data valid assertion/de-assertion
					for i in 0 to 3 loop
						if chbnd_detk28p3(i) = '1' then
							chbnd_datval(i) <= '0';
						elsif chbnd_detk28p3_z2(i) = '1' then
							if chbnd_plsnum_cnt(i) = 4 then
								chbnd_datval(i) <= '1';
							end if;
						end if;
					end loop;
					
					-- Data valid assertion
					if (chbnd_datval = X"F") then
						chbnd_done <= '1';
					else
						chbnd_done <= '0';
					end if;
					
					-- Check for k28p3 pulse width errors (should be a single clock cycle pulse)
					for i in 0 to 3 loop
						if chbnd_detk28p3_z1(i) = '1' and chbnd_detk28p3_z2(i) = '1' then
							chbnd_plswidth_err(i) <= '1';
						end if;
					end loop;
					
					-- Count number of k28p3 chars and check for errors
					for i in 0 to 3 loop
						if chbnd_detk28p3_z1(i) = '1' then
							if chbnd_plsnum_cnt(i) < 4 then
								chbnd_plsnum_cnt(i) <= chbnd_plsnum_cnt(i) + 1;
							else
								chbnd_plsnum_err(i) <= '1';
							end if;
						end if;
					end loop;
					
					-- Check for k28p3 frequency errors
					for i in 0 to 3 loop
						if chbnd_detk28p3_z1(i) = '1' then
							chbnd_plsfreq_cnt(i) <= (others=>'0'),(others=>'0'),(others=>'0'),(others=>'0');
						else
							if chbnd_plsfreq_cnt(i) <= 31 then -- count up to 32
								chbnd_plsfreq_cnt(i) <= chbnd_plsfreq_cnt(i) + 1;
							end if;
						end if;
						if chbnd_detk28p3_z1(i) = '1' then
							if chbnd_plsnum_cnt(i) >= 1 then
								if chbnd_plsfreq_cnt(i) /= 31 then
									chbnd_plsfreq_err(i) <= '1';
								end if;
							end if;
						end if;
					end loop;
					
					-- Delayed signals
					chbnd_32bitpdat_z3 <= chbnd_32bitpdat_z2;
					chbnd_32bitpdat_z2 <= chbnd_32bitpdat_z1;
					chbnd_32bitpdat_z1 <= chbnd_32bitpdat;
					chbnd_4bitk_z3     <= chbnd_4bitk_z2;
					chbnd_4bitk_z2     <= chbnd_4bitk_z1;
					chbnd_4bitk_z1     <= chbnd_4bitk;
					chbnd_detk28p3_z2  <= chbnd_detk28p3_z1;
					chbnd_detk28p3_z1  <= chbnd_detk28p3;
					chbnd_done_z1      <= chbnd_done;
				end if;
			end if;
		end if;
	end process;
	chbnd_donen <= not chbnd_done;
	
	----------------------------------------------
	-- CHANNEL BONDING FIFOs
	----------------------------------------------
	-- CONNECTIONS
	G_CHBFIFO_CON: for i in 0 to 3 generate
		chbfifo_srst(i) <= chbnd_detk28p3_z1(i);
		chbfifo_din(i)  <= chbnd_4bitk_z3(i) & chbnd_32bitpdat_z3(i);
		chbfifo_wren(i) <= chbnd_datval(i) and (not chbfifo_full(i));
		chbfifo_rden(i) <= chbnd_done      and (not chbfifo_empty(i));
	end generate;
	
	-- CHANNEL BONDING FIFO IPs
	G_CHBFIFO: for i in 0 to 3 generate
		chbfifo_i : chbfifo port map (
			clk   => rxusrclk2,
			srst  => chbfifo_srst(i),
			din   => chbfifo_din(i),
			wr_en => chbfifo_wren(i),
			rd_en => chbfifo_rden(i),
			dout  => chbfifo_dout(i),
			full  => chbfifo_full(i),
			empty => chbfifo_empty(i));
	end generate;
	
	----------------------------------------------
	-- WORD ALIGNMENT
	----------------------------------------------
	-- CONNECTIONS
	G_WALGN: for i in 0 to 3 generate
		walgn_32bitpdat(i)    <= chbfifo_dout(i)(31 downto 0);
		walgn_4bitk(i)        <= chbfifo_dout(i)(35 downto 32);
		walgn_algnbuf(i)      <= walgn_32bitpdat(i) & walgn_32bitpdat_z1(i);
	end generate;
	walgn_en   <= chbnd_done_z1;
	walgn_rstn <= rctrl_rstdone;
	
	-- WORD ALIGNMENT PROCESS
	process (rxusrclk2)
	begin
		if rising_edge(rxusrclk2) then
			if walgn_rstn = '0' then
				walgn_32bitpdat_z1 <= (others => x"00000000");
				walgn_algndat      <= (others => x"00000000");
				walgn_done         <= '0';
				walgn_error        <= '0';
				walgn_ptr          <= (others => "00");
				walgn_ptr_set      <= "0000";
			else
				if walgn_en = '1' then
					-- Set word alignment pointer
					for i in 0 to 3 loop
						if    (walgn_4bitk(i)(0)  & walgn_32bitpdat(i)(7  downto  0)) = K28p3 then
							walgn_ptr(i)     <= "00";
							walgn_ptr_set(i) <= '1';
						elsif (walgn_4bitk(i)(1)  & walgn_32bitpdat(i)(15 downto  8)) = K28p3 then
							walgn_ptr(i)     <= "01";
							walgn_ptr_set(i) <= '1';
						elsif (walgn_4bitk(i)(2)  & walgn_32bitpdat(i)(23 downto 16)) = K28p3 then
							walgn_ptr(i)     <= "10";
							walgn_ptr_set(i) <= '1';
						elsif (walgn_4bitk(i)(3)  & walgn_32bitpdat(i)(31 downto 24)) = K28p3 then
							walgn_ptr(i)     <= "11";
							walgn_ptr_set(i) <= '1';
						end if;
					end loop;
					
					-- Aligned data according to walgn_ptr
					for i in 0 to 3 loop
                        case walgn_ptr(i) is
                            when "00"   =>
                                walgn_algndat(i) <= walgn_algnbuf(i)(39 downto 8);
                            when "01"   =>
                                walgn_algndat(i) <= walgn_algnbuf(i)(47 downto 16);
                            when "10"   =>
                                walgn_algndat(i) <= walgn_algnbuf(i)(55 downto 24);
                            when others =>
                                walgn_algndat(i) <= walgn_algnbuf(i)(63 downto 32);
                        end case;
					end loop;
					
					-- Assert walgn_done if word alignment is completed on all lanes
					if walgn_ptr_set = x"F" then
						walgn_done <= '1';
					else
						walgn_done <= '0';
					end if;
					
					if not (walgn_ptr_set = x"0" or walgn_ptr_set = x"F") then
						walgn_error <= '1';
					end if;
					
					-- Delayed signals
					walgn_32bitpdat_z1 <= walgn_32bitpdat;
					
				end if;
			end if;
		end if;
	end process;

	----------------------------------------------
	-- DATA UNFRAMING
	----------------------------------------------
	-- CONNECTIONS
	unfrm_32bitpdat            <= walgn_algndat;
	unfrm_en                   <= walgn_done;
	unfrm_rstn                 <= rctrl_rstdone;
	G_UNFRM: for i in 0 to 3 generate
		unfrm_32bitpdat_z1_bytswpd(i) <= unfrm_32bitpdat_z1(i)(7  downto  0) & unfrm_32bitpdat_z1(i)(15 downto  8) & unfrm_32bitpdat_z1(i)(23 downto 16) & unfrm_32bitpdat_z1(i)(31 downto 24);
		unfrm_32bitpdat_bytswpd(i)    <= unfrm_32bitpdat(i)(7  downto  0)    & unfrm_32bitpdat(i)(15 downto  8)    & unfrm_32bitpdat(i)(23 downto 16)    & unfrm_32bitpdat(i)(31 downto 24);
	end generate;
	-- DATA UNFRAMING PROCESS
	process (rxusrclk2)
	begin
		if rising_edge(rxusrclk2) then
			if unfrm_rstn = '0' then
				-- Hold all signals in reset
				unfrm_120bdat      <= (others => '0');
				unfrm_20x12bsmpbuf <= (others => (x"000"));
				unfrm_32bitpdat_z1 <= (others => (x"00000000"));
				unfrm_clk          <= '0';
				unfrm_done         <= '0';
				unfrm_en_z1        <= '0';
				unfrm_en_z2        <= '0';
			else
				if unfrm_en = '1' then
					if unfrm_clk = '1' then
						for i in 0 to 3 loop
							unfrm_20x12bsmpbuf(i*5 + 0)  <= unfrm_32bitpdat_z1_bytswpd(i)(31 downto 20);
							unfrm_20x12bsmpbuf(i*5 + 1)  <= unfrm_32bitpdat_z1_bytswpd(i)(19 downto 8);
							unfrm_20x12bsmpbuf(i*5 + 2)  <= unfrm_32bitpdat_z1_bytswpd(i)(7  downto 0) & unfrm_32bitpdat_bytswpd(i)(31 downto 28);
							unfrm_20x12bsmpbuf(i*5 + 3)  <= unfrm_32bitpdat_bytswpd(i)(27 downto 16);
							unfrm_20x12bsmpbuf(i*5 + 4)  <= unfrm_32bitpdat_bytswpd(i)(15 downto 4);
						end loop;
					end if;
					
					if unfrm_clk = '0' then
						unfrm_120bdat(11  downto 0)   <= unfrm_20x12bsmpbuf(0);
						unfrm_120bdat(23  downto 12)  <= unfrm_20x12bsmpbuf(1);
						unfrm_120bdat(35  downto 24)  <= unfrm_20x12bsmpbuf(2);
						unfrm_120bdat(47  downto 36)  <= unfrm_20x12bsmpbuf(3);
						unfrm_120bdat(59  downto 48)  <= unfrm_20x12bsmpbuf(4);
						unfrm_120bdat(71  downto 60)  <= unfrm_20x12bsmpbuf(5);
						unfrm_120bdat(83  downto 72)  <= unfrm_20x12bsmpbuf(6);
						unfrm_120bdat(95  downto 84)  <= unfrm_20x12bsmpbuf(7);
						unfrm_120bdat(107 downto 96)  <= unfrm_20x12bsmpbuf(8);
						unfrm_120bdat(119 downto 108) <= unfrm_20x12bsmpbuf(9);
					else
						unfrm_120bdat(11  downto 0)   <= unfrm_20x12bsmpbuf(10);
						unfrm_120bdat(23  downto 12)  <= unfrm_20x12bsmpbuf(11);
						unfrm_120bdat(35  downto 24)  <= unfrm_20x12bsmpbuf(12);
						unfrm_120bdat(47  downto 36)  <= unfrm_20x12bsmpbuf(13);
						unfrm_120bdat(59  downto 48)  <= unfrm_20x12bsmpbuf(14);
						unfrm_120bdat(71  downto 60)  <= unfrm_20x12bsmpbuf(15);
						unfrm_120bdat(83  downto 72)  <= unfrm_20x12bsmpbuf(16);
						unfrm_120bdat(95  downto 84)  <= unfrm_20x12bsmpbuf(17);
						unfrm_120bdat(107 downto 96)  <= unfrm_20x12bsmpbuf(18);
						unfrm_120bdat(119 downto 108) <= unfrm_20x12bsmpbuf(19);
					end if;
					
					-- Done signal
					unfrm_done <= unfrm_en_z2;
					
					-- Toggle Un-frame clock
					unfrm_clk <= not unfrm_clk;
					
					-- Delayed signals
					unfrm_32bitpdat_z1 <= unfrm_32bitpdat;
					unfrm_en_z2        <= unfrm_en_z1;
					unfrm_en_z1        <= unfrm_en;
				end if;
			end if;
		end if;
	end process;

	----------------------------------------------
	-- 10:16 GEARBOX LOGIC
	----------------------------------------------
	-- CONNECTIONS
	gbxl_rstn    <= unfrm_done and rctrl_rstdone;
	gbxl_120bdat <= unfrm_120bdat;
	-- GEARBOX LOGIC COMPONENT
	gearbox_10to16_i : gearbox_10to16 port map (
		clk             => rxusrclk2,
		reset_n         => gbxl_rstn,
		data_in_10x12b  => gbxl_120bdat,
		data_out_16x12b => gbxl_192bdat,
		valid           => gbxl_192bdat_val);
		
	----------------------------------------------
	-- 10:16 GEARBOX FIFO
	----------------------------------------------
	-- CONNECTIONS
	-- Reset
	gbxf_rst_async <= (not (rctrl_rstdone_async)) or drpsysrst;
	del_gbxf_rst_async : del port map (drpsysclk, gbxf_rst_async,    gbxf_rst_async_z1);
	tff_gbxf_rst       : tff port map (rxusrclk2, gbxf_rst_async_z1, gbxf_rst);
	-- Data in
	gbxf_din  <= gbxl_192bdat;
	gbxf_wren <= gbxl_192bdat_val and (not gbxf_full);
	-- Data out
	gbxf_rden_out_i <= not gbxf_prog_empty;
	process (adcdatclk)
	begin
		if rising_edge(adcdatclk) then
			gbxf_rden_z1 <= gbxf_rden;
		end if;
	end process;
	gbxf_dval <= gbxf_rden_z1 and (not gbxf_empty);
	
	-- 10:16 GEARBOX FIFO IP
	gearbox_fifo : adcrx_async_fifo port map (
		rst        => gbxf_rst,
		wr_clk     => rxusrclk2,
		rd_clk     => adcdatclk,
		din        => gbxf_din,
		wr_en      => gbxf_wren,
		rd_en      => gbxf_rden,
		dout       => gbxf_dout,
		full       => gbxf_full,
		empty      => gbxf_empty,
		prog_empty => gbxf_prog_empty);

	----------------------------------------------
	-- PORT CONNECTIONS
	----------------------------------------------
	ADC_DATA_16X12B_OUT     <= gbxf_dout;
	ADC_DATA_16X12B_VAL_OUT <= gbxf_dval;
	ADC_PLL_ARESET          <= not rctrl_adcpllrstn;
	ADC_SYNC_O              <= not k28p5det_done;
	GBXF_RDEN_OUT           <= gbxf_rden_out_i;
	GT_RXUSRCLK2_O          <= rxusrclk2;
	adcdatclk               <= ADC_DATA_CLOCK;
	drpsysclk               <= SYS_CLK_I;
	drpsysrst               <= SYS_RST_I;
	gbxf_rden               <= GBXF_RDEN_IN;
	rphy_gtrefclk           <= GTREFCLK_IN;
	rphy_rxn                <= RXN_I;
	rphy_rxp                <= RXP_I;

	----------------------------------------------
	-- CORE STATUS
	----------------------------------------------
	-- PHY ERROR CHECK
	stat_k28p5det_done_n <= not k28p5det_done;
	tff_phyerror_reset : tff port map (drpsysclk, stat_k28p5det_done_n, stat_phyerror_reset);
	process (rxusrclk2)
	begin
		if rising_edge(rxusrclk2) then
			if rphy_rxbufstatus     = x"000"  then stat_rxbufstatus_async     <= '0'; else stat_rxbufstatus_async     <= '1'; end if;
			if rphy_rxdisperr       = x"0000" then stat_rxdisperr_async       <= '0'; else stat_rxdisperr_async       <= '1'; end if;
			if rphy_rxnotintable    = x"0000" then stat_rxnotintable_async    <= '0'; else stat_rxnotintable_async    <= '1'; end if;
			if rphy_rxbyteisaligned = x"F"    then stat_rxbyteisaligned_async <= '0'; else stat_rxbyteisaligned_async <= '1'; end if;
			if rphy_rxresetdone     = x"F"    then stat_rxresetdone_async     <= '0'; else stat_rxresetdone_async     <= '1'; end if;
		end if;
	end process;
	stat_rxfsmresetdone_async   <= '0' when rphy_rxfsmresetdone   = "1111" else '1';
	stat_eyescandataerror_async <= '0' when rphy_eyescandataerror = x"0"   else '1';
	stat_qplllock_async         <= '0' when rphy_qplllock         = '1'    else '1';
	stat_qpllrefclklost_async   <= '0' when rphy_qpllrefclklost   = '0'    else '1';
	tff_rxfsmresetdone   : tff port map (drpsysclk, stat_rxfsmresetdone_async,   stat_rxfsmresetdone  );
	tff_rxbufstatus      : tff port map (drpsysclk, stat_rxbufstatus_async,      stat_rxbufstatus     );
	tff_rxdisperr        : tff port map (drpsysclk, stat_rxdisperr_async,        stat_rxdisperr       );
	tff_rxnotintable     : tff port map (drpsysclk, stat_rxnotintable_async,     stat_rxnotintable    );
	tff_eyescandataerror : tff port map (drpsysclk, stat_eyescandataerror_async, stat_eyescandataerror);
	tff_rxbyteisaligned  : tff port map (drpsysclk, stat_rxbyteisaligned_async,  stat_rxbyteisaligned );
	tff_rxresetdone      : tff port map (drpsysclk, stat_rxresetdone_async,      stat_rxresetdone     );
	tff_qplllock         : tff port map (drpsysclk, stat_qplllock_async,         stat_qplllock        );
	tff_qpllrefclklost   : tff port map (drpsysclk, stat_qpllrefclklost_async,   stat_qpllrefclklost     );
	latch_rxfsmresetdone   : latch port map (drpsysclk, stat_phyerror_reset, stat_rxfsmresetdone,   stat_rxfsmresetdone_l  );
	latch_rxbufstatus      : latch port map (drpsysclk, stat_phyerror_reset, stat_rxbufstatus,      stat_rxbufstatus_l     );
	latch_rxdisperr        : latch port map (drpsysclk, stat_phyerror_reset, stat_rxdisperr,        stat_rxdisperr_l       );
	latch_rxnotintable     : latch port map (drpsysclk, stat_phyerror_reset, stat_rxnotintable,     stat_rxnotintable_l    );
	latch_eyescandataerror : latch port map (drpsysclk, stat_phyerror_reset, stat_eyescandataerror, stat_eyescandataerror_l);
	latch_rxbyteisaligned  : latch port map (drpsysclk, stat_phyerror_reset, stat_rxbyteisaligned,  stat_rxbyteisaligned_l );
	latch_rxresetdone      : latch port map (drpsysclk, stat_phyerror_reset, stat_rxresetdone,      stat_rxresetdone_l     );
	latch_qplllock         : latch port map (drpsysclk, stat_phyerror_reset, stat_qplllock,         stat_qplllock_l        );
	latch_qpllrefclklost   : latch port map (drpsysclk, stat_phyerror_reset, stat_qpllrefclklost,   stat_qpllrefclklost_l  );

	-- ADC PLL ERROR CHECK
	stat_adcpllerror_reset <= not rctrl_rstdone_async;
	stat_rctrl_apll_locked <= '0' when rctrl_apll_locked = '1' else '1';
	latch_rctrl_apll_locked : latch port map (drpsysclk, stat_adcpllerror_reset, stat_rctrl_apll_locked, stat_rctrl_apll_locked_l);
	
	-- RESET CONTROL FSM ERROR CHECK
	-- rctrl_state_code(0)
	-- rctrl_state_code(1)
	-- rctrl_state_code(2)
	-- rctrl_state_code(3)
	
	-- CHANNEL BONDING LOGIC ERROR CHECK
	stat_chbnd_done_n <= (not chbnd_done_z1);
	tff_chbondl_reset : tff port map (drpsysclk, stat_chbnd_done_n, stat_chbondl_reset);
	process (rxusrclk2)
	begin
		if rising_edge(rxusrclk2) then
			if chbnd_plswidth_err = x"0" then stat_chbnd_plswidth_err_async <= '0'; else stat_chbnd_plswidth_err_async <= '1'; end if;
			if chbnd_plsfreq_err  = x"0" then stat_chbnd_plsfreq_err_async  <= '0'; else stat_chbnd_plsfreq_err_async  <= '1'; end if;
			if chbnd_plsnum_err   = x"0" then stat_chbnd_plsnum_err_async   <= '0'; else stat_chbnd_plsnum_err_async   <= '1'; end if;
			if chbnd_datval       = x"F" then stat_chbnd_datval_async       <= '0'; else stat_chbnd_datval_async       <= '1'; end if;
		end if;
	end process;
	tff_chbnd_plswidth_err : tff port map (drpsysclk, stat_chbnd_plswidth_err_async, stat_chbnd_plswidth_err);
	tff_chbnd_plsfreq_err  : tff port map (drpsysclk, stat_chbnd_plsfreq_err_async,  stat_chbnd_plsfreq_err );
	tff_chbnd_plsnum_err   : tff port map (drpsysclk, stat_chbnd_plsnum_err_async,   stat_chbnd_plsnum_err  );
	tff_chbnd_datval       : tff port map (drpsysclk, stat_chbnd_datval_async,       stat_chbnd_datval      );
	latch_chbnd_plswidth_err : latch port map (drpsysclk, stat_chbondl_reset, stat_chbnd_plswidth_err, stat_chbnd_plswidth_err_l);
	latch_chbnd_plsfreq_err  : latch port map (drpsysclk, stat_chbondl_reset, stat_chbnd_plsfreq_err,  stat_chbnd_plsfreq_err_l );
	latch_chbnd_plsnum_err   : latch port map (drpsysclk, stat_chbondl_reset, stat_chbnd_plsnum_err,   stat_chbnd_plsnum_err_l  );
	latch_chbnd_datval       : latch port map (drpsysclk, stat_chbondl_reset, stat_chbnd_datval,       stat_chbnd_datval_l      );
	
	-- CHANNEL BONDING FIFO ERROR CHECK
	process (rxusrclk2)
	begin
		if rising_edge(rxusrclk2) then
			if chbfifo_full  = x"0" then stat_chbfifo_full_async  <= '0'; else stat_chbfifo_full_async  <= '1'; end if;
			if chbfifo_empty = x"0" then stat_chbfifo_empty_async <= '0'; else stat_chbfifo_empty_async <= '1'; end if;
		end if;
	end process;
	tff_chbfifo_full  : tff port map (drpsysclk, stat_chbfifo_full_async , stat_chbfifo_full );
	tff_chbfifo_empty : tff port map (drpsysclk, stat_chbfifo_empty_async, stat_chbfifo_empty);
	latch_chbfifo_full  : latch port map (drpsysclk, stat_chbondl_reset, stat_chbfifo_full,  stat_chbfifo_full_l );
	latch_chbfifo_empty : latch port map (drpsysclk, stat_chbondl_reset, stat_chbfifo_empty, stat_chbfifo_empty_l);
	
	-- WORD ALIGNMENT ERROR CHECK
	stat_walgn_error_async <= '0' when walgn_error = '0' else '1';
	tff_walgn_error : tff port map (drpsysclk, stat_walgn_error_async, stat_walgn_error);

	-- GEARBOX FIFO ERROR CHECK
	stat_gbxf_full_async  <= '0' when gbxf_full = '0' else '1';
	tff_gbxf_full   : tff   port map (drpsysclk, stat_gbxf_full_async, stat_gbxf_full);
	stat_gbxf_empty_async <= '0' when gbxf_empty = '0' else '1';
	tff_gbxf_empty : tff port map (drpsysclk, stat_gbxf_empty_async, stat_gbxf_empty);
	stat_gbxf_prog_empty_async <= '0' when gbxf_prog_empty = '0' else '1';
	tff_gbxf_prog_empty : tff port map (drpsysclk, stat_gbxf_prog_empty_async, stat_gbxf_prog_empty);
	process (drpsysclk)
	begin
		if rising_edge(drpsysclk) then
			if stat_unfrm_done = '0' then
				stat_rstdone_cnt <= to_unsigned(0, 5);
				stat_rstdone     <= '0';
			else
				if stat_rstdone_cnt < 31 then
					stat_rstdone_cnt <= stat_rstdone_cnt + 1;
				else
					stat_rstdone <= '1';
				end if;
			end if;
		end if;
	end process;
	stat_rstdone_n <= not stat_rstdone;
	latch_gbxf_full  : latch port map (drpsysclk, stat_rstdone_n, stat_gbxf_full,  stat_gbxf_full_l);
	latch_gbxf_empty : latch port map (drpsysclk, stat_rstdone_n, stat_gbxf_empty, stat_gbxf_empty_l);

	-- DONE SIGNAL ERROR CHECK
	stat_rctrl_rstdone_async <= '0' when rctrl_rstdone = '1' else '1';
	stat_k28p5det_done_async <= '0' when k28p5det_done = '1' else '1';
	stat_chbnd_done_async    <= '0' when chbnd_done    = '1' else '1';
	stat_walgn_done_async    <= '0' when walgn_done    = '1' else '1';
	stat_unfrm_done_async    <= '0' when unfrm_done    = '1' else '1';
	tff_rctrl_rstdone     : tff port map (drpsysclk, stat_rctrl_rstdone_async , stat_rctrl_rstdone);
	tff_k28p5det_done     : tff port map (drpsysclk, stat_k28p5det_done_async , stat_k28p5det_done);
	tff_chbnd_done        : tff port map (drpsysclk, stat_chbnd_done_async    , stat_chbnd_done   );
	tff_walgn_done        : tff port map (drpsysclk, stat_walgn_done_async    , stat_walgn_done   );
	tff_unfrm_done        : tff port map (drpsysclk, stat_unfrm_done_async    , stat_unfrm_done   );
	
	-- STATUS REGISTER CONNECTIONS
	STATUS_O(0 ) <= '0';
	STATUS_O(1 ) <= stat_gbxf_full_l;
	STATUS_O(2 ) <= stat_gbxf_empty_l;
	STATUS_O(3 ) <= stat_rxfsmresetdone_l;
	STATUS_O(4 ) <= stat_rxbufstatus_l;
	STATUS_O(5 ) <= stat_rxdisperr_l;
	STATUS_O(6 ) <= stat_rxnotintable_l;
	STATUS_O(7 ) <= stat_eyescandataerror_l;
	STATUS_O(8 ) <= stat_rxbyteisaligned_l;
	STATUS_O(9 ) <= stat_rxresetdone_l;
	STATUS_O(10) <= stat_qplllock_l;
	STATUS_O(11) <= stat_qpllrefclklost_l;
	STATUS_O(12) <= stat_rctrl_apll_locked_l;
	STATUS_O(13) <= stat_chbnd_plswidth_err_l;
	STATUS_O(14) <= stat_chbnd_plsfreq_err_l;
	STATUS_O(15) <= stat_chbnd_plsnum_err_l;
	STATUS_O(16) <= stat_chbnd_datval_l;
	STATUS_O(17) <= stat_chbfifo_full_l;
	STATUS_O(18) <= stat_chbfifo_empty_l;
	STATUS_O(19) <= stat_walgn_error;
	STATUS_O(20) <= stat_gbxf_full;
	STATUS_O(21) <= stat_gbxf_empty;
	STATUS_O(22) <= stat_gbxf_prog_empty;
	STATUS_O(23) <= stat_rctrl_rstdone;
	STATUS_O(24) <= stat_k28p5det_done;
	STATUS_O(25) <= stat_chbnd_done;
	STATUS_O(26) <= stat_walgn_done;
	STATUS_O(27) <= stat_unfrm_done;
	STATUS_O(28) <= rctrl_state_code(3);
	STATUS_O(29) <= rctrl_state_code(2);
	STATUS_O(30) <= rctrl_state_code(1);
	STATUS_O(31) <= rctrl_state_code(0);

end ADC32RF45_11G2_RX_ARC;

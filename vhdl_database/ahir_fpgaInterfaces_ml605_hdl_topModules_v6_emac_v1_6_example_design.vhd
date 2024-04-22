-------------------------------------------------------------------------------
-- Title      : Virtex-6 Embedded Tri-Mode Ethernet MAC Wrapper Example Design
-- Project    : Virtex-6 Embedded Tri-Mode Ethernet MAC Wrapper
-- File       : v6_emac_v1_6_example_design.vhd
-- Version    : 1.6
-------------------------------------------------------------------------------
--
-- (c) Copyright 2009-2012 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-------------------------------------------------------------------------------
-- Description:  This is the Example Design wrapper for the Virtex-6
--               Embedded Tri-Mode Ethernet MAC. It is intended that this
--               example design can be quickly adapted and downloaded onto an
--               FPGA to provide a hardware test environment.
--
--               The Example Design wrapper:
--
--               * instantiates the EMAC LocalLink-level wrapper (the EMAC
--                 block-level wrapper with the RX and TX FIFOs and a
--                 LocalLink interface);
--
--               * instantiates a simple example design which provides an
--                 address swap and loopback function at the user interface;
--
--               * instantiates the fundamental clocking resources required
--                 by the core.
--
--               Please refer to the Datasheet, Getting Started Guide, and
--               the Virtex-6 Embedded Tri-Mode Ethernet MAC User Gude for
--               further information.
--
--    ---------------------------------------------------------------------
--    |EXAMPLE DESIGN WRAPPER                                             |
--    |           --------------------------------------------------------|
--    |           |LOCALLINK-LEVEL WRAPPER                                |
--    |           |              -----------------------------------------|
--    |           |              |BLOCK-LEVEL WRAPPER                     |
--    |           |              |    ---------------------               |
--    | --------  |  ----------  |    | INSTANCE-LEVEL    |               |
--    | |      |  |  |        |  |    | WRAPPER           |  ---------    |
--    | |      |->|->|        |->|--->| Tx            Tx  |->|       |--->|
--    | |      |  |  |        |  |    | client        PHY |  |       |    |
--    | | ADDR |  |  | LOCAL- |  |    | I/F           I/F |  |       |    |
--    | | SWAP |  |  | LINK   |  |    |                   |  | PHY   |    |
--    | |      |  |  | FIFO   |  |    |                   |  | I/F   |    |
--    | |      |  |  |        |  |    |                   |  |       |    |
--    | |      |  |  |        |  |    | Rx            Rx  |  |       |    |
--    | |      |  |  |        |  |    | client        PHY |  |       |    |
--    | |      |<-|<-|        |<-|<---| I/F           I/F |<-|       |<---|
--    | |      |  |  |        |  |    |                   |  ---------    |
--    | --------  |  ----------  |    ---------------------               |
--    |           |              -----------------------------------------|
--    |           --------------------------------------------------------|
--    ---------------------------------------------------------------------
--
-------------------------------------------------------------------------------

library unisim;
use unisim.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------
-- Entity declaration for the example design
-------------------------------------------------------------------------------

-- clock frequency of user hardware design = (1000/eth_usr_clk_div) MHz
entity v6_emac_v1_6_example_design is
   generic (
	eth_usr_clk_div	: integer := 8 
   );
   port(

      -- Client receiver interface
      EMACCLIENTRXDVLD         : out std_logic;
      EMACCLIENTRXFRAMEDROP    : out std_logic;
      EMACCLIENTRXSTATS        : out std_logic_vector(6 downto 0);
      EMACCLIENTRXSTATSVLD     : out std_logic;
      EMACCLIENTRXSTATSBYTEVLD : out std_logic;

      -- Client transmitter interface
      CLIENTEMACTXIFGDELAY     : in  std_logic_vector(7 downto 0);
      EMACCLIENTTXSTATS        : out std_logic;
      EMACCLIENTTXSTATSVLD     : out std_logic;
      EMACCLIENTTXSTATSBYTEVLD : out std_logic;

      -- MAC control interface
      CLIENTEMACPAUSEREQ       : in  std_logic;
      CLIENTEMACPAUSEVAL       : in  std_logic_vector(15 downto 0);

      -- Clock Signal
      --GTX_CLK                  : in  std_logic;

      -- GMII Interface
      GMII_TXD                 : out std_logic_vector(7 downto 0);
      GMII_TX_EN               : out std_logic;
      GMII_TX_ER               : out std_logic;
      GMII_TX_CLK              : out std_logic;
      GMII_RXD                 : in  std_logic_vector(7 downto 0);
      GMII_RX_DV               : in  std_logic;
      GMII_RX_ER               : in  std_logic;
      GMII_RX_CLK              : in  std_logic;

      -- Reference clock for IODELAYs
      --REFCLK                   : in  std_logic;
		SYSCLK_N, SYSCLK_P		: in std_logic;
		
		PHY_RESET					: out std_logic;
      -- Asynchronous reset
      RESET                    : in  std_logic
   );

end v6_emac_v1_6_example_design;


architecture TOP_LEVEL of v6_emac_v1_6_example_design is

-------------------------------------------------------------------------------
-- Component declarations for lower hierarchial level entities
-------------------------------------------------------------------------------

  -- Component declaration for the LocalLink-level EMAC wrapper
 
	 component clk_wiz_v3_6 is
	generic
	(
	usr_clk_div : integer := 8
	);	
	port
	(-- Clock in ports
	CLK_IN1_P         : in     std_logic;
	CLK_IN1_N         : in     std_logic;
	-- Clock out ports
	CLK_OUT1          : out    std_logic;
	CLK_OUT2          : out    std_logic;
	CLK_OUT3	  : out	   std_logic;
	-- Status and control signals
	RESET             : in     std_logic;
	LOCKED            : out    std_logic
	);
	end component;

 component v6_emac_v1_6_locallink is
   port(
      -- TX clock output
      TX_CLK_OUT               : out std_logic;
      -- TX clock input from BUFG
      TX_CLK                   : in  std_logic;

      -- LocalLink receiver interface
      RX_LL_CLOCK              : in  std_logic;
      RX_LL_RESET              : in  std_logic;
      RX_LL_DATA               : out std_logic_vector(7 downto 0);
      RX_LL_SOF_N              : out std_logic;
      RX_LL_EOF_N              : out std_logic;
      RX_LL_SRC_RDY_N          : out std_logic; --indicates data out is valid
      RX_LL_DST_RDY_N          : in  std_logic; --indicates downstream user application is ready to accept data
      RX_LL_FIFO_STATUS        : out std_logic_vector(3 downto 0);

      -- LocalLink transmitter interface
      TX_LL_CLOCK              : in  std_logic;
      TX_LL_RESET              : in  std_logic;
      TX_LL_DATA               : in  std_logic_vector(7 downto 0);
      TX_LL_SOF_N              : in  std_logic;
      TX_LL_EOF_N              : in  std_logic;
      TX_LL_SRC_RDY_N          : in  std_logic; --indicates data in is valid during current cycle
      TX_LL_DST_RDY_N          : out std_logic; --indicates that fifo is ready to accept the data presented

      -- Client receiver interface
      EMACCLIENTRXDVLD         : out std_logic;
      EMACCLIENTRXFRAMEDROP    : out std_logic;
      EMACCLIENTRXSTATS        : out std_logic_vector(6 downto 0);
      EMACCLIENTRXSTATSVLD     : out std_logic;
      EMACCLIENTRXSTATSBYTEVLD : out std_logic;

      -- Client Transmitter Interface
      CLIENTEMACTXIFGDELAY     : in  std_logic_vector(7 downto 0);
      EMACCLIENTTXSTATS        : out std_logic;
      EMACCLIENTTXSTATSVLD     : out std_logic;
      EMACCLIENTTXSTATSBYTEVLD : out std_logic;

      -- MAC control interface
      CLIENTEMACPAUSEREQ       : in  std_logic;
      CLIENTEMACPAUSEVAL       : in  std_logic_vector(15 downto 0);

      -- Receive-side PHY clock on regional buffer, to EMAC
      PHY_RX_CLK               : in  std_logic;

      -- Reference clock
      GTX_CLK                  : in  std_logic;

      -- GMII interface
      GMII_TXD                 : out std_logic_vector(7 downto 0);
      GMII_TX_EN               : out std_logic;
      GMII_TX_ER               : out std_logic;
      GMII_TX_CLK              : out std_logic;
      GMII_RXD                 : in  std_logic_vector(7 downto 0);
      GMII_RX_DV               : in  std_logic;
      GMII_RX_ER               : in  std_logic;
      GMII_RX_CLK              : in  std_logic;

      -- Asynchronous reset
      RESET                    : in  std_logic
   );
  end component;

   --  Component Declaration for address swapping module
   component address_swap_module_8
   port (
      rx_usr_clock	  : in  std_logic;
      rx_gtx_clock	  : in  std_logic;
      rx_ll_reset         : in  std_logic;
      rx_ll_data_in       : in  std_logic_vector(7 downto 0);
      rx_ll_sof_in_n      : in  std_logic;
      rx_ll_eof_in_n      : in  std_logic;
      rx_ll_src_rdy_in_n  : in  std_logic;
      rx_ll_dst_rdy_out_n : out std_logic;
      rx_ll_data_out      : out std_logic_vector(7 downto 0);
      rx_ll_sof_out_n     : out std_logic;
      rx_ll_eof_out_n     : out std_logic;
      rx_ll_src_rdy_out_n : out std_logic;
      rx_ll_dst_rdy_in_n  : in  std_logic
      );
   end component;


-----------------------------------------------------------------------
-- Signal declarations
-----------------------------------------------------------------------

    -- Global asynchronous reset
    signal reset_i             : std_logic;

    -- LocalLink interface clocking signal
    signal ll_clk_i            : std_logic;


	-- REFCLK and GTXCLK ------
	signal GTX_CLK 				: std_logic;
	signal REFCLK					: std_logic;
	signal locked					: std_logic;
	
    -- Address swap transmitter connections
    signal tx_ll_data_i        : std_logic_vector(7 downto 0);
    signal tx_ll_sof_n_i       : std_logic;
    signal tx_ll_eof_n_i       : std_logic;
    signal tx_ll_src_rdy_n_i   : std_logic;
    signal tx_ll_dst_rdy_n_i   : std_logic;

   -- Address swap receiver connections
    signal rx_ll_data_i        : std_logic_vector(7 downto 0);
    signal rx_ll_sof_n_i       : std_logic;
    signal rx_ll_eof_n_i       : std_logic;
    signal rx_ll_src_rdy_n_i   : std_logic;
    signal rx_ll_dst_rdy_n_i   : std_logic;

    -- Synchronous reset registers in the LocalLink clock domain
    signal ll_pre_reset_i     : std_logic_vector(5 downto 0);
    signal ll_reset_i         : std_logic;

    attribute async_reg : string;
    attribute async_reg of ll_pre_reset_i : signal is "true";

    -- Reference clock for IODELAYs
    signal refclk_ibufg_i      : std_logic;
    signal refclk_bufg_i       : std_logic;

    -- GMII input clocks to wrappers
    signal tx_clk              : std_logic;

    attribute keep : boolean;
    attribute keep of tx_clk : signal is true;

    -- user hardware clocking signal
    signal usr_clk	       : std_logic;
    signal usr_clk_prebuf      : std_logic;

    attribute keep of usr_clk : signal is true;


    signal rx_clk_i            : std_logic;
    signal gmii_rx_clk_bufio   : std_logic;
    signal gmii_rx_clk_delay   : std_logic;

    -- IDELAY controller
    signal idelayctrl_reset_r  : std_logic_vector(12 downto 0);
    signal idelayctrl_reset_i  : std_logic;

    attribute syn_noprune : boolean;
    attribute syn_noprune of dlyctrl : label is true;

    attribute buffer_type : string;

    -- GTX reference clock
    signal gtx_clk_i           : std_logic;


-------------------------------------------------------------------------------
-- Main body of code
-------------------------------------------------------------------------------

begin 
    ll_clk_i <= tx_clk;
    -- Reset input buffer
    reset_ibuf : IBUF port map (
      I => RESET,
      O => reset_i
    );

    --------------------------------------------------------------------------
    -- Clock skew management: use IDELAY on GMII_RX_CLK to move
    -- the clock into proper alignment with the data
    --------------------------------------------------------------------------

    -- Instantiate IDELAYCTRL for the IDELAY in Fixed Tap Delay Mode
    dlyctrl : IDELAYCTRL port map (
      RDY    => open,
      REFCLK => refclk_bufg_i,
      RST    => idelayctrl_reset_i
    );


	clk_wiz : clk_wiz_v3_6
  generic map
    (usr_clk_div => eth_usr_clk_div)
  port map
   (-- Clock in ports
    CLK_IN1_P => SYSCLK_P,
    CLK_IN1_N => SYSCLK_N,
    -- Clock out ports
    CLK_OUT1           => GTX_CLK,
    CLK_OUT2           => REFCLK,
    CLK_OUT3	       => usr_clk_prebuf,
    -- Status and control signals
    RESET              => reset_i,
    LOCKED             => locked);
	 
	 phy_reset <= locked;


    -- Assert the proper reset pulse for the IDELAYCTRL
    delayrstgen :process (refclk_bufg_i, reset_i)
    begin
      if (reset_i = '1') then
        idelayctrl_reset_r(0)           <= '0';
        idelayctrl_reset_r(12 downto 1) <= (others => '1');
      elsif refclk_bufg_i'event and refclk_bufg_i = '1' then
        idelayctrl_reset_r(0)           <= '0';
        idelayctrl_reset_r(12 downto 1) <= idelayctrl_reset_r(11 downto 0);
      end if;
    end process delayrstgen;
    idelayctrl_reset_i <= idelayctrl_reset_r(12);

    -- Please modify the IDELAY_VALUE to suit your design.
    -- The IDELAY_VALUE set here is tuned to this example design.
    -- For more information on IDELAYCTRL and IODELAY, please
    -- refer to the Virtex-6 User Guide.
    gmii_rxc_delay : IODELAY
    generic map (
      IDELAY_TYPE           => "FIXED",
      IDELAY_VALUE          => 0,
      DELAY_SRC             => "I",
      SIGNAL_PATTERN        => "CLOCK",
      HIGH_PERFORMANCE_MODE => TRUE
    )
    port map (
      IDATAIN => GMII_RX_CLK,
      ODATAIN => '0',
      DATAOUT => gmii_rx_clk_delay,
      DATAIN  => '0',
      C       => '0',
      T       => '0',
      CE      => '0',
      INC     => '0',
      RST     => '0'
    );

    -- Globally-buffer the GTX reference clock, used to clock
    -- the transmit-side functions of the EMAC wrappers
    -- (tx_clk can be shared between multiple EMAC instances, including
    --  multiple instantiations of the EMAC wrappers)
    bufg_tx : BUFG port map (
      I => gtx_clk_i,
      O => tx_clk
    );

    bufg_usr : BUFG port map (
      I => usr_clk_prebuf,
      o => usr_clk
    );
    -- Use a low-skew BUFIO on the delayed RX_CLK, which will be used in the
    -- GMII phyical interface block to capture incoming data and control.
    bufio_rx : BUFIO port map (
      I => gmii_rx_clk_delay,
      O => gmii_rx_clk_bufio
    );

    -- Regionally-buffer the receive-side GMII physical interface clock
    -- for use with receive-side functions of the EMAC
    bufr_rx : BUFR port map (
      I   => gmii_rx_clk_delay,
      O   => rx_clk_i,
      CE  => '1',
      CLR => '0'
    );


    ------------------------------------------------------------------------
    -- Instantiate the LocalLink-level EMAC Wrapper (v6_emac_v1_6_locallink.vhd)
    ------------------------------------------------------------------------
    v6_emac_v1_6_locallink_inst : v6_emac_v1_6_locallink port map (
      -- TX clock output
      TX_CLK_OUT               => open,
      -- TX clock input from BUFG
      TX_CLK                   => tx_clk,

      -- LocalLink receiver interface
      RX_LL_CLOCK              => usr_clk,
      RX_LL_RESET              => ll_reset_i,
      RX_LL_DATA               => rx_ll_data_i,
      RX_LL_SOF_N              => rx_ll_sof_n_i,
      RX_LL_EOF_N              => rx_ll_eof_n_i,
      RX_LL_SRC_RDY_N          => rx_ll_src_rdy_n_i,
      RX_LL_DST_RDY_N          => rx_ll_dst_rdy_n_i,
      RX_LL_FIFO_STATUS        => open,

      -- Client receiver signals
      EMACCLIENTRXDVLD         => EMACCLIENTRXDVLD,
      EMACCLIENTRXFRAMEDROP    => EMACCLIENTRXFRAMEDROP,
      EMACCLIENTRXSTATS        => EMACCLIENTRXSTATS,
      EMACCLIENTRXSTATSVLD     => EMACCLIENTRXSTATSVLD,
      EMACCLIENTRXSTATSBYTEVLD => EMACCLIENTRXSTATSBYTEVLD,

      -- LocalLink transmitter interface
      TX_LL_CLOCK              => usr_clk,
      TX_LL_RESET              => ll_reset_i,
      TX_LL_DATA               => tx_ll_data_i,
      TX_LL_SOF_N              => tx_ll_sof_n_i,
      TX_LL_EOF_N              => tx_ll_eof_n_i,
      TX_LL_SRC_RDY_N          => tx_ll_src_rdy_n_i,
      TX_LL_DST_RDY_N          => tx_ll_dst_rdy_n_i,

      -- Client transmitter signals
      CLIENTEMACTXIFGDELAY     => CLIENTEMACTXIFGDELAY,
      EMACCLIENTTXSTATS        => EMACCLIENTTXSTATS,
      EMACCLIENTTXSTATSVLD     => EMACCLIENTTXSTATSVLD,
      EMACCLIENTTXSTATSBYTEVLD => EMACCLIENTTXSTATSBYTEVLD,

      -- MAC control interface
      CLIENTEMACPAUSEREQ       => CLIENTEMACPAUSEREQ,
      CLIENTEMACPAUSEVAL       => CLIENTEMACPAUSEVAL,

      -- Receive-side PHY clock on regional buffer, to EMAC
      PHY_RX_CLK               => rx_clk_i,

      -- Reference clock (unused)
      GTX_CLK                  => '0',

      -- GMII interface
      GMII_TXD                 => GMII_TXD,
      GMII_TX_EN               => GMII_TX_EN,
      GMII_TX_ER               => GMII_TX_ER,
      GMII_TX_CLK              => GMII_TX_CLK,
      GMII_RXD                 => GMII_RXD,
      GMII_RX_DV               => GMII_RX_DV,
      GMII_RX_ER               => GMII_RX_ER,
      GMII_RX_CLK              => gmii_rx_clk_bufio,

      -- Asynchronous reset
      RESET                    => reset_i
    );

    ---------------------------------------------------------------------
    --  Instatiate the address swapping module
    ---------------------------------------------------------------------
    client_side_asm : address_swap_module_8 port map (
      rx_usr_clock        => usr_clk,
      rx_gtx_clock	  => tx_clk,
      rx_ll_reset         => ll_reset_i,
      rx_ll_data_in       => rx_ll_data_i,
      rx_ll_sof_in_n      => rx_ll_sof_n_i,
      rx_ll_eof_in_n      => rx_ll_eof_n_i,
      rx_ll_src_rdy_in_n  => rx_ll_src_rdy_n_i,
      rx_ll_dst_rdy_out_n => rx_ll_dst_rdy_n_i,
      rx_ll_data_out      => tx_ll_data_i,
      rx_ll_sof_out_n     => tx_ll_sof_n_i,
      rx_ll_eof_out_n     => tx_ll_eof_n_i,
      rx_ll_src_rdy_out_n => tx_ll_src_rdy_n_i,
      rx_ll_dst_rdy_in_n  => tx_ll_dst_rdy_n_i
    );
 

    -- Create synchronous reset in the transmitter clock domain
    gen_ll_reset : process (ll_clk_i, reset_i)
    begin
      if reset_i = '1' then
        ll_pre_reset_i <= (others => '1');
        ll_reset_i     <= '1';
      elsif ll_clk_i'event and ll_clk_i = '1' then
        ll_pre_reset_i(0)          <= '0';
        ll_pre_reset_i(5 downto 1) <= ll_pre_reset_i(4 downto 0);
        ll_reset_i                 <= ll_pre_reset_i(5);
      end if;
    end process gen_ll_reset;

    -- Globally-buffer the reference clock used for
    -- the IODELAYCTRL primitive
  --  refclk_ibufg : IBUFG port map (
  --    I => REFCLK,
  --    O => refclk_ibufg_i
  --  );
		refclk_ibufg_i <= REFCLK;
    refclk_bufg : BUFG port map (
      I => refclk_ibufg_i,
      O => refclk_bufg_i
    );
    -- Prepare the GTX_CLK for a BUFG
 --   gtx_clk_ibufg : IBUFG port map (
   --   I => GTX_CLK,
   --   O => gtx_clk_i
   -- );
		gtx_clk_i <= GTX_CLK;

end TOP_LEVEL;

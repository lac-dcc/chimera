----------------------------------------------------------------------------------
-- Company:   Peralex Electronics (Pty) Ltd
-- Engineer:  Matthew Bridges
-- 
-- Create Date: 12.09.2014 15:36:12
-- Design Name: 
-- Module Name: IEEE802_3_XL_PMA - Behavioral
-- Project Name: 
-- Target Devices:  Ultrascale (Since 4/2/2020)
-- Tool Versions: Vivado 2019.1
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
-- 04/02/2020: Edited by JH to support ultrascale series
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity IEEE802_3_XL_PMA is
  generic(
    TX_POLARITY_INVERT          : std_logic_vector(3 downto 0) := "0000";
    EXAMPLE_SIM_GTRESET_SPEEDUP : string                       := "TRUE"; -- simulation setting for GT SecureIP model
    STABLE_CLOCK_PERIOD         : integer                      := 7;
    EXAMPLE_USE_CHIPSCOPE       : integer                      := 0 -- Set to 1 to use Chipscope to drive resets
  );
  port(
    SYS_CLK_I               : in  std_logic;

    SOFT_RESET_IN           : in  std_logic;

    GTREFCLK_PAD_N_I        : in  std_logic;
    GTREFCLK_PAD_P_I        : in  std_logic;

    GTREFCLK_O              : out std_logic;

    GT0_TXOUTCLK_OUT        : out std_logic;
    GT_TXUSRCLK2_IN         : in  std_logic;
    GT_TXUSRCLK_IN          : in  std_logic;
    GT_TXUSRCLK_LOCKED_IN   : in  std_logic;
    GT_TXUSRCLK_RESET_OUT   : out std_logic;

    GT0_RXOUTCLK_OUT        : out std_logic;
    --GT_RXUSRCLK2_OUT        : out std_logic;
    GT_RXUSRCLK2_IN         : in  std_logic;
    GT_RXUSRCLK_IN          : in  std_logic;
    GT_RXUSRCLK_LOCKED_IN   : in  std_logic;
    GT_RXUSRCLK_RESET_OUT   : out std_logic;

    TX_READ_EN_O            : out std_logic;

    LANE0_TX_HEADER_I       : in  std_logic_vector(1 downto 0);
    LANE0_TX_DATA_I         : in  std_logic_vector(63 downto 0);
    LANE1_TX_HEADER_I       : in  std_logic_vector(1 downto 0);
    LANE1_TX_DATA_I         : in  std_logic_vector(63 downto 0);
    LANE2_TX_HEADER_I       : in  std_logic_vector(1 downto 0);
    LANE2_TX_DATA_I         : in  std_logic_vector(63 downto 0);
    LANE3_TX_HEADER_I       : in  std_logic_vector(1 downto 0);
    LANE3_TX_DATA_I         : in  std_logic_vector(63 downto 0);

    LANE0_RX_HEADER_VALID_O : out std_logic;
    LANE0_RX_HEADER_O       : out std_logic_vector(1 downto 0);
    LANE0_RX_DATA_VALID_O   : out std_logic;
    LANE0_RX_DATA_O         : out std_logic_vector(63 downto 0);
    LANE0_RX_GEARBOXSLIP_I  : in  std_logic;
    LANE0_RX_DATA_VALID_I   : in  std_logic;
    LANE1_RX_HEADER_VALID_O : out std_logic;
    LANE1_RX_HEADER_O       : out std_logic_vector(1 downto 0);
    LANE1_RX_DATA_VALID_O   : out std_logic;
    LANE1_RX_DATA_O         : out std_logic_vector(63 downto 0);
    LANE1_RX_GEARBOXSLIP_I  : in  std_logic;
    LANE1_RX_DATA_VALID_I   : in  std_logic;
    LANE2_RX_HEADER_VALID_O : out std_logic;
    LANE2_RX_HEADER_O       : out std_logic_vector(1 downto 0);
    LANE2_RX_DATA_VALID_O   : out std_logic;
    LANE2_RX_DATA_O         : out std_logic_vector(63 downto 0);
    LANE2_RX_GEARBOXSLIP_I  : in  std_logic;
    LANE2_RX_DATA_VALID_I   : in  std_logic;
    LANE3_RX_HEADER_VALID_O : out std_logic;
    LANE3_RX_HEADER_O       : out std_logic_vector(1 downto 0);
    LANE3_RX_DATA_VALID_O   : out std_logic;
    LANE3_RX_DATA_O         : out std_logic_vector(63 downto 0);
    LANE3_RX_GEARBOXSLIP_I  : in  std_logic;
    LANE3_RX_DATA_VALID_I   : in  std_logic;

    RXN_I                   : in  std_logic_vector(3 downto 0);
    RXP_I                   : in  std_logic_vector(3 downto 0);
    TXN_O                   : out std_logic_vector(3 downto 0);
    TXP_O                   : out std_logic_vector(3 downto 0);

    GT_TX_READY_O           : out std_logic_vector(3 downto 0);
    GT_RX_READY_O           : out std_logic_vector(3 downto 0);

    gt0_txbufstatus_out     : out std_logic_vector(1 downto 0);
    gt0_rxbufstatus_out     : out std_logic_vector(2 downto 0);
    gt1_txbufstatus_out     : out std_logic_vector(1 downto 0);
    gt1_rxbufstatus_out     : out std_logic_vector(2 downto 0);
    gt2_txbufstatus_out     : out std_logic_vector(1 downto 0);
    gt2_rxbufstatus_out     : out std_logic_vector(2 downto 0);
    gt3_txbufstatus_out     : out std_logic_vector(1 downto 0);
    gt3_rxbufstatus_out     : out std_logic_vector(2 downto 0)
  );
end IEEE802_3_XL_PMA;

architecture Behavioral of IEEE802_3_XL_PMA is
        COMPONENT xlaui_us
  PORT (
    gtwiz_userclk_tx_active_in : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    gtwiz_userclk_rx_active_in : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    gtwiz_reset_clk_freerun_in : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    gtwiz_reset_all_in : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    gtwiz_reset_tx_pll_and_datapath_in : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    gtwiz_reset_tx_datapath_in : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    gtwiz_reset_rx_pll_and_datapath_in : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    gtwiz_reset_rx_datapath_in : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    gtwiz_reset_rx_cdr_stable_out : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    gtwiz_reset_tx_done_out : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    gtwiz_reset_rx_done_out : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    gtwiz_userdata_tx_in : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
    gtwiz_userdata_rx_out : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    gtrefclk00_in : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    qpll0outclk_out : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    qpll0outrefclk_out : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    gthrxn_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    gthrxp_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    rxgearboxslip_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    rxusrclk_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    rxusrclk2_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    txdiffctrl_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    txheader_in : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    txpolarity_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    txpostcursor_in : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
    txprecursor_in : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
    txsequence_in : IN STD_LOGIC_VECTOR(27 DOWNTO 0);
    txusrclk_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    txusrclk2_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    gthtxn_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    gthtxp_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    gtpowergood_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    rxdatavalid_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rxheader_out : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    rxheadervalid_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rxoutclk_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    rxpmaresetdone_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    rxstartofseq_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    txoutclk_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    txpmaresetdone_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
  END COMPONENT;
  component ARRAY_REVERSE_ORDER is
    Generic(
      NUMBER_OF_BITS : Natural := 32
    );
    Port(
      DATA_IN  : in  std_logic_vector(NUMBER_OF_BITS - 1 downto 0);
      DATA_OUT : out std_logic_vector(NUMBER_OF_BITS - 1 downto 0)
    );
  end component ARRAY_REVERSE_ORDER;

  component IEEE802_3_XL_PMA_AN is
    Port(
      CLK_I          : in  std_logic;
      RST_I          : in  std_logic;

      HEADER_VALID_I : in  std_logic;
      HEADER_I       : in  std_logic_vector(1 downto 0);
      DATA_VALID_I   : in  std_logic;
      DATA_I         : in  std_logic_vector(63 downto 0);

      SLIP_O         : out std_logic
    );
  end component IEEE802_3_XL_PMA_AN;
  
  --component ila_0 is
  --  Port (
  --  clk : in std_logic;
  --  probe0 : in std_logic_vector(1 downto 0);
  --  probe1 : in std_logic_vector(63 downto 0);
  --  probe2 : in std_logic_vector(1 downto 0);
  --  probe3 : in std_logic_vector(63 downto 0);
  --  probe4 : in std_logic_vector(1 downto 0);
  --  probe5 : in std_logic_vector(63 downto 0);
  --  probe6 : in std_logic_vector(1 downto 0);
  --  probe7 : in std_logic_vector(63 downto 0)
  --  );
  --end component;

  signal tied_to_ground_i : std_logic;
  signal tied_to_vcc_i    : std_logic;
        
  --GT ref clock after input buffer
  signal GTREFCLK              : std_logic;
  -- Internal signal to connect GTREFCLK to BUFG_GT
  -- (since this needs to use the ODIV2 output of an IBUFDS_GTE)
  signal GTREFCLK_INT          : std_logic;

  --GT0
  signal LANE0_RX_DATA         : std_logic_vector(63 downto 0);
  signal LANE0_RX_DATA_VALID   : std_logic;
  signal LANE0_RX_HEADER       : std_logic_vector(1 downto 0);
  signal LANE0_RX_HEADER_VALID : std_logic;
  signal LANE0_RX_GEARBOXSLIP  : std_logic;
  signal LANE0_TX_HEADER       : std_logic_vector(1 downto 0);
  signal LANE0_TX_DATA         : std_logic_vector(63 downto 0);
  --GT1 
  signal LANE1_RX_DATA         : std_logic_vector(63 downto 0);
  signal LANE1_RX_DATA_VALID   : std_logic;
  signal LANE1_RX_HEADER       : std_logic_vector(1 downto 0);
  signal LANE1_RX_HEADER_VALID : std_logic;
  signal LANE1_RX_GEARBOXSLIP  : std_logic;
  signal LANE1_TX_HEADER       : std_logic_vector(1 downto 0);
  signal LANE1_TX_DATA         : std_logic_vector(63 downto 0);
  --GT2
  signal LANE2_RX_DATA         : std_logic_vector(63 downto 0);
  signal LANE2_RX_DATA_VALID   : std_logic;
  signal LANE2_RX_HEADER       : std_logic_vector(1 downto 0);
  signal LANE2_RX_HEADER_VALID : std_logic;
  signal LANE2_RX_GEARBOXSLIP  : std_logic;
  signal LANE2_TX_HEADER       : std_logic_vector(1 downto 0);
  signal LANE2_TX_DATA         : std_logic_vector(63 downto 0);
  --GT3
  signal LANE3_RX_DATA         : std_logic_vector(63 downto 0);
  signal LANE3_RX_DATA_VALID   : std_logic;
  signal LANE3_RX_HEADER       : std_logic_vector(1 downto 0);
  signal LANE3_RX_HEADER_VALID : std_logic;
  signal LANE3_RX_GEARBOXSLIP  : std_logic;
  signal LANE3_TX_HEADER       : std_logic_vector(1 downto 0);
  signal LANE3_TX_DATA         : std_logic_vector(63 downto 0);

  signal gt_tx_ready : std_logic_vector(3 downto 0);
  signal gt_rx_ready : std_logic_vector(3 downto 0);

  signal gt0_rxbufstatus : std_logic_vector(2 downto 0);
  signal gt1_rxbufstatus : std_logic_vector(2 downto 0);
  signal gt2_rxbufstatus : std_logic_vector(2 downto 0);
  signal gt3_rxbufstatus : std_logic_vector(2 downto 0);

  signal gt0_rxbuffault : std_logic;
  signal gt1_rxbuffault : std_logic;
  signal gt2_rxbuffault : std_logic;
  signal gt3_rxbuffault : std_logic;
  
  signal GT1_RXOUTCLK_OUT : std_logic;
  signal GT2_RXOUTCLK_OUT : std_logic;
  signal GT3_RXOUTCLK_OUT : std_logic;
  signal GT1_TXOUTCLK_OUT : std_logic;
  signal GT2_TXOUTCLK_OUT : std_logic;
  signal GT3_TXOUTCLK_OUT : std_logic;


  signal gt0_rxdatavalid_in_d1 : std_logic;
  signal gt1_rxdatavalid_in_d1 : std_logic;
  signal gt2_rxdatavalid_in_d1 : std_logic;
  signal gt3_rxdatavalid_in_d1 : std_logic;

  signal gt0_rxvalidfault : std_logic;
  signal gt1_rxvalidfault : std_logic;
  signal gt2_rxvalidfault : std_logic;
  signal gt3_rxvalidfault : std_logic;
  
  signal gt0_rxbufreset  : std_logic;
  signal gt1_rxbufreset  : std_logic;
  signal gt2_rxbufreset  : std_logic;
  signal gt3_rxbufreset  : std_logic;

  signal txseq_counter   : unsigned(5 downto 0) := (5 => '1', others => '0');
  signal txseq_counter_i : std_logic_vector(6 downto 0);

  signal fixed_delay_strobe_sr : std_logic_vector(130 downto 0);
  signal start_RXBUF_reset     : std_logic;

begin

  --  Static signal Assigments
  tied_to_ground_i <= '0';
  tied_to_vcc_i    <= '1';

  --$$$~~ BIT ORDER REVERSAL START ~~$$$--
  --LANE0
  LANE0_RX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
    generic map(NUMBER_OF_BITS => 64)
    port map(DATA_IN  => LANE0_RX_DATA,
           DATA_OUT => LANE0_RX_DATA_O);

  LANE0_RX_DATA_VALID_O   <= LANE0_RX_DATA_VALID;
  LANE0_RX_HEADER_O(0)    <= LANE0_RX_HEADER(1);
  LANE0_RX_HEADER_O(1)    <= LANE0_RX_HEADER(0);
  LANE0_RX_HEADER_VALID_O <= LANE0_RX_HEADER_VALID;
  LANE0_RX_GEARBOXSLIP    <= LANE0_RX_GEARBOXSLIP_I;

  LANE0_TX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
    generic map(NUMBER_OF_BITS => 64)
    port map(DATA_IN  => LANE0_TX_DATA_I,
           DATA_OUT => LANE0_TX_DATA);

  LANE0_TX_HEADER(0) <= LANE0_TX_HEADER_I(1);
  LANE0_TX_HEADER(1) <= LANE0_TX_HEADER_I(0);
  --LANE1
  LANE1_RX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
    generic map(NUMBER_OF_BITS => 64)
    port map(DATA_IN  => LANE1_RX_DATA,
           DATA_OUT => LANE1_RX_DATA_O);

  LANE1_RX_DATA_VALID_O   <= LANE1_RX_DATA_VALID;
  LANE1_RX_HEADER_O(0)    <= LANE1_RX_HEADER(1);
  LANE1_RX_HEADER_O(1)    <= LANE1_RX_HEADER(0);
  LANE1_RX_HEADER_VALID_O <= LANE1_RX_HEADER_VALID;
  LANE1_RX_GEARBOXSLIP    <= LANE1_RX_GEARBOXSLIP_I;

  LANE1_TX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
    generic map(NUMBER_OF_BITS => 64)
    port map(DATA_IN  => LANE1_TX_DATA_I,
           DATA_OUT => LANE1_TX_DATA);

  LANE1_TX_HEADER(0) <= LANE1_TX_HEADER_I(1);
  LANE1_TX_HEADER(1) <= LANE1_TX_HEADER_I(0);
  --LANE2
  LANE2_RX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
    generic map(NUMBER_OF_BITS => 64)
    port map(DATA_IN  => LANE2_RX_DATA,
           DATA_OUT => LANE2_RX_DATA_O);

  LANE2_RX_DATA_VALID_O   <= LANE2_RX_DATA_VALID;
  LANE2_RX_HEADER_O(0)    <= LANE2_RX_HEADER(1);
  LANE2_RX_HEADER_O(1)    <= LANE2_RX_HEADER(0);
  LANE2_RX_HEADER_VALID_O <= LANE2_RX_HEADER_VALID;
  LANE2_RX_GEARBOXSLIP    <= LANE2_RX_GEARBOXSLIP_I;

  LANE2_TX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
    generic map(NUMBER_OF_BITS => 64)
    port map(DATA_IN  => LANE2_TX_DATA_I,
           DATA_OUT => LANE2_TX_DATA);

  LANE2_TX_HEADER(0) <= LANE2_TX_HEADER_I(1);
  LANE2_TX_HEADER(1) <= LANE2_TX_HEADER_I(0);
  --LANE3
  LANE3_RX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
    generic map(NUMBER_OF_BITS => 64)
    port map(DATA_IN  => LANE3_RX_DATA,
           DATA_OUT => LANE3_RX_DATA_O);

  LANE3_RX_DATA_VALID_O   <= LANE3_RX_DATA_VALID;
  LANE3_RX_HEADER_O(0)    <= LANE3_RX_HEADER(1);
  LANE3_RX_HEADER_O(1)    <= LANE3_RX_HEADER(0);
  LANE3_RX_HEADER_VALID_O <= LANE3_RX_HEADER_VALID;
  LANE3_RX_GEARBOXSLIP    <= LANE3_RX_GEARBOXSLIP_I;

  LANE3_TX_ARRAY_REV_inst : component ARRAY_REVERSE_ORDER
    generic map(NUMBER_OF_BITS => 64)
    port map(DATA_IN  => LANE3_TX_DATA_I,
           DATA_OUT => LANE3_TX_DATA);

  LANE3_TX_HEADER(0) <= LANE3_TX_HEADER_I(1);
  LANE3_TX_HEADER(1) <= LANE3_TX_HEADER_I(0);
  --$$$~~ BIT ORDER REVERSAL END ~~$$$--

  gth_refclk_ibuf : IBUFDS_GTE3
    generic map (
      REFCLK_HROW_CK_SEL => "00"
    ) port map (
      I     => GTREFCLK_PAD_P_I,
      IB    => GTREFCLK_PAD_N_I,
      O     => GTREFCLK,
      CEB   => '0',
      ODIV2 => GTREFCLK_INT
    );

  gtrefclk_bufg_gt: BUFG_GT
    port map(
      CE => '1',
      CEMASK => '0',
      CLR => '0',
      CLRMASK => '0',
      DIV => "000",
      I => GTREFCLK_INT,
      O => GTREFCLK_O
    );

  --xlaui_ila: ila_0
  --  port map(
  --    clk => GT_TXUSRCLK2_IN,
  --    probe0 => LANE0_TX_HEADER,
  --    probe1 => LANE0_TX_DATA,
  --    probe2 => LANE1_TX_HEADER,
  --    probe3 => LANE1_TX_DATA,
  --    probe4 => LANE2_TX_HEADER,
  --    probe5 => LANE2_TX_DATA,
  --    probe6 => LANE3_TX_HEADER,
  --    probe7 => LANE3_TX_DATA
  --  );

  XLAUI_support_i : xlaui_us
    port map(
    gtwiz_userclk_tx_active_in(0) => GT_TXUSRCLK_LOCKED_IN,
    gtwiz_userclk_rx_active_in(0) => GT_RXUSRCLK_LOCKED_IN,
      gtwiz_reset_clk_freerun_in(0)  => SYS_CLK_I,
      gtwiz_reset_all_in(0)          => SOFT_RESET_IN,
     -- gtwiz_userclk_tx_reset_in(0)   => tied_to_ground_i,
     -- gtwiz_userclk_rx_reset_in(0)   => tied_to_ground_i,
      gtwiz_reset_tx_pll_and_datapath_in(0) => tied_to_ground_i,
      gtwiz_reset_tx_datapath_in(0)         => tied_to_ground_i,
      gtwiz_reset_rx_pll_and_datapath_in(0) => tied_to_ground_i,
      gtwiz_reset_rx_datapath_in(0)         => tied_to_ground_i,
      gtwiz_reset_rx_cdr_stable_out      => open,
      gtwiz_reset_tx_done_out            => open,
      gtwiz_reset_rx_done_out            => open,

     -- gtwiz_userclk_tx_srcclk_out(0)  => GT0_TXOUTCLK_OUT,
     -- gtwiz_userclk_rx_srcclk_out(0)  => GT0_RXOUTCLK_OUT,
     -- gtwiz_userclk_tx_usrclk_out(0)  => open,
     -- gtwiz_userclk_tx_usrclk2_out(0) => open,
     -- gtwiz_userclk_tx_active_out(0)  => open,
     -- gtwiz_userclk_rx_usrclk_out(0)  => open,
     -- gtwiz_userclk_rx_usrclk2_out(0) => GT_RXUSRCLK2_OUT, --open,
     -- gtwiz_userclk_rx_active_out(0)  => open,
      gtwiz_userdata_tx_in(255 downto 192)   => LANE3_TX_DATA,
      gtwiz_userdata_tx_in(191 downto 128)   => LANE2_TX_DATA,
      gtwiz_userdata_tx_in(127 downto 64 )   => LANE1_TX_DATA,
      gtwiz_userdata_tx_in( 63 downto 0  )   => LANE0_TX_DATA,
      gtwiz_userdata_rx_out(255 downto 192)  => LANE3_RX_DATA,
      gtwiz_userdata_rx_out(191 downto 128)  => LANE2_RX_DATA,
      gtwiz_userdata_rx_out(127 downto 64 )  => LANE1_RX_DATA,
      gtwiz_userdata_rx_out( 63 downto 0  )  => LANE0_RX_DATA,

      gtrefclk00_in(0)       => GTREFCLK,
      qpll0outrefclk_out  => open, --GTREFCLK_O,
      qpll0outclk_out     => open,

      rxpmaresetdone_out     => gt_rx_ready,
      txpmaresetdone_out     => gt_tx_ready,

      gthrxn_in         => RXN_I,
      gthrxp_in         => RXP_I,
      gthtxn_out        => TXN_O,
      gthtxp_out        => TXP_O,
      
      rxusrclk_in(0)  => GT_RXUSRCLK_IN,
      rxusrclk_in(1)  => GT_RXUSRCLK_IN,
      rxusrclk_in(2)  => GT_RXUSRCLK_IN,
      rxusrclk_in(3)  => GT_RXUSRCLK_IN,

      rxusrclk2_in(0) => GT_RXUSRCLK2_IN,
      rxusrclk2_in(1) => GT_RXUSRCLK2_IN,
      rxusrclk2_in(2) => GT_RXUSRCLK2_IN,
      rxusrclk2_in(3) => GT_RXUSRCLK2_IN,

      txusrclk_in(0)  => GT_TXUSRCLK_IN,
      txusrclk_in(1)  => GT_TXUSRCLK_IN,
      txusrclk_in(2)  => GT_TXUSRCLK_IN,
      txusrclk_in(3)  => GT_TXUSRCLK_IN,
      
      txusrclk2_in(0) => GT_TXUSRCLK2_IN,
      txusrclk2_in(1) => GT_TXUSRCLK2_IN,
      txusrclk2_in(2) => GT_TXUSRCLK2_IN,
      txusrclk2_in(3) => GT_TXUSRCLK2_IN,

      rxoutclk_out(0) => GT0_RXOUTCLK_OUT,
      rxoutclk_out(1) => GT1_RXOUTCLK_OUT,
      rxoutclk_out(2) => GT2_RXOUTCLK_OUT,
      rxoutclk_out(3) => GT3_RXOUTCLK_OUT,

      txoutclk_out(0) => GT0_TXOUTCLK_OUT,
      txoutclk_out(1) => GT1_TXOUTCLK_OUT,
      txoutclk_out(2) => GT2_TXOUTCLK_OUT,
      txoutclk_out(3) => GT3_TXOUTCLK_OUT,
      txsequence_in(27 downto 21)    => txseq_counter_i,
      txsequence_in(20 downto 14)    => txseq_counter_i,
      txsequence_in(13 downto 7)     => txseq_counter_i,
      txsequence_in( 6 downto 0)     => txseq_counter_i,
      rxgearboxslip_in(3)  => LANE3_RX_GEARBOXSLIP,
      rxgearboxslip_in(2)  => LANE2_RX_GEARBOXSLIP,
      rxgearboxslip_in(1)  => LANE1_RX_GEARBOXSLIP,
      rxgearboxslip_in(0)  => LANE0_RX_GEARBOXSLIP,
      txheader_in(23 downto 20)  => (others => '0'),
      txheader_in(19 downto 18)  => LANE3_TX_HEADER,
      txheader_in(17 downto 14)  => (others => '0'),
      txheader_in(13 downto 12)  => LANE2_TX_HEADER,
      txheader_in(11 downto 8 )  => (others => '0'),
      txheader_in( 7 downto 6 )  => LANE1_TX_HEADER,
      txheader_in( 5 downto 2 )  => (others => '0'),
      txheader_in( 1 downto 0 )  => LANE0_TX_HEADER,
      rxheader_out(23 downto 20) => open,
      rxheader_out(19 downto 18) => LANE3_RX_HEADER,
      rxheader_out(17 downto 14) => open,
      rxheader_out(13 downto 12) => LANE2_RX_HEADER,
      rxheader_out(11 downto 8 ) => open,
      rxheader_out( 7 downto 6 ) => LANE1_RX_HEADER,
      rxheader_out( 5 downto 2 ) => open,
      rxheader_out( 1 downto 0 ) => LANE0_RX_HEADER,
      gtpowergood_out   => open,
      rxdatavalid_out(7)   => open,
      rxdatavalid_out(6)   => LANE3_RX_DATA_VALID,
      rxdatavalid_out(5)   => open,
      rxdatavalid_out(4)   => LANE2_RX_DATA_VALID,
      rxdatavalid_out(3)   => open,
      rxdatavalid_out(2)   => LANE1_RX_DATA_VALID,
      rxdatavalid_out(1)   => open,
      rxdatavalid_out(0)   => LANE0_RX_DATA_VALID,
      rxheadervalid_out(7) => open,
      rxheadervalid_out(6) => LANE3_RX_HEADER_VALID,
      rxheadervalid_out(5) => open,
      rxheadervalid_out(4) => LANE2_RX_HEADER_VALID,
      rxheadervalid_out(3) => open,
      rxheadervalid_out(2) => LANE1_RX_HEADER_VALID,
      rxheadervalid_out(1) => open,
      rxheadervalid_out(0) => LANE0_RX_HEADER_VALID,
      rxstartofseq_out  => open,
      txpolarity_in     => TX_POLARITY_INVERT,
      txprecursor_in    => "10101101011010110101",
      txpostcursor_in   => "00000000000000000000",
      txdiffctrl_in     => "1100110011001100"
    );

  --____________________________ TXSEQUENCE counter to GT __________________________    
  process(GT_TXUSRCLK2_IN)
  begin
    if rising_edge(GT_TXUSRCLK2_IN) then
      if (GT_TXUSRCLK_LOCKED_IN = '0') or (txseq_counter(5) = '1') then
        txseq_counter <= (others => '0');
      else
        txseq_counter <= txseq_counter + 1;
      end if;
    end if;
  end process;

  txseq_counter_i(5 downto 0) <= std_logic_vector(txseq_counter);
  txseq_counter_i(6)          <= '0';

  GT_TX_READY_O <= gt_tx_ready;
  GT_RX_READY_O <= gt_rx_ready;

  TX_READ_EN_O <= not txseq_counter(5);

  gt0_rxbufstatus_out <= gt0_rxbufstatus;
  gt1_rxbufstatus_out <= gt1_rxbufstatus;
  gt2_rxbufstatus_out <= gt2_rxbufstatus;
  gt3_rxbufstatus_out <= gt3_rxbufstatus;

  RX_BUF_RESET_proc : process(GT_RXUSRCLK2_IN) is
  begin
    if rising_edge(GT_RXUSRCLK2_IN) then
      if (GT_RXUSRCLK_LOCKED_IN = '0') then
        fixed_delay_strobe_sr(0) <= '1';
        fixed_delay_strobe_sr(1) <= '0';
        gt0_rxbuffault <= '0';
        gt1_rxbuffault <= '0';
        gt2_rxbuffault <= '0';
        gt3_rxbuffault <= '0';
      else
        fixed_delay_strobe_sr(0) <= fixed_delay_strobe_sr(130);
        fixed_delay_strobe_sr(1) <= fixed_delay_strobe_sr(0);

        if (fixed_delay_strobe_sr(130) = '1') then
          gt0_rxbuffault <= gt0_rxbufstatus(2);
          gt1_rxbuffault <= gt1_rxbufstatus(2);
          gt2_rxbuffault <= gt2_rxbufstatus(2);
          gt3_rxbuffault <= gt3_rxbufstatus(2);
        else
          gt0_rxbuffault <= '0';
          gt1_rxbuffault <= '0';
          gt2_rxbuffault <= '0';
          gt3_rxbuffault <= '0';
        end if;
      end if;
      fixed_delay_strobe_sr(130 downto 2) <= fixed_delay_strobe_sr(129 downto 1);
    end if;
  end process RX_BUF_RESET_proc;
  
  RX_BUF_RESET2_proc : process(SYS_CLK_I) is
  begin
    if rising_edge(SYS_CLK_I) then
      gt0_rxdatavalid_in_d1 <= LANE0_RX_DATA_VALID_I;
      gt1_rxdatavalid_in_d1 <= LANE1_RX_DATA_VALID_I;
      gt2_rxdatavalid_in_d1 <= LANE2_RX_DATA_VALID_I;
      gt3_rxdatavalid_in_d1 <= LANE3_RX_DATA_VALID_I;

      gt0_rxvalidfault <= (not LANE0_RX_DATA_VALID_I) and gt0_rxdatavalid_in_d1;
      gt1_rxvalidfault <= (not LANE1_RX_DATA_VALID_I) and gt1_rxdatavalid_in_d1;
      gt2_rxvalidfault <= (not LANE2_RX_DATA_VALID_I) and gt2_rxdatavalid_in_d1;
      gt3_rxvalidfault <= (not LANE3_RX_DATA_VALID_I) and gt3_rxdatavalid_in_d1;
    end if;
  end process RX_BUF_RESET2_proc;

  gt0_rxbufreset <= gt0_rxbuffault or gt0_rxvalidfault;
  gt1_rxbufreset <= gt1_rxbuffault or gt1_rxvalidfault;
  gt2_rxbufreset <= gt2_rxbuffault or gt2_rxvalidfault;
  gt3_rxbufreset <= gt3_rxbuffault or gt3_rxvalidfault;

end Behavioral;



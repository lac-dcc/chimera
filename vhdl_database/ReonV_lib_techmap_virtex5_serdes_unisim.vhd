------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2014, Aeroflex Gaisler
--  Copyright (C) 2015 - 2017, Cobham Gaisler
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
-----------------------------------------------------------------------------
-- Entity:      serdes_unisim
-- File:        serdes_unisim.vhd
-- Author:      Andrea Gianarro - Cobham Gaisler AB
-- Description: Xilinx Virtex 5 GTP and GTX-based SGMII Gigabit Ethernet Serdes
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.stdlib.all;
library techmap;
use techmap.gencomp.all;
library unisim;
--use unisim.BUFG;
use unisim.vcomponents.all;
-- pragma translate_off
-- pragma translate_on

entity serdes_unisim is
  generic (
    transtech : integer
  );
  port (
    clk_125     : in std_logic;
    rst_125     : in std_logic;
    rx_in_p     : in std_logic;           -- SER IN
    rx_in_n     : in std_logic;           -- SER IN
    rx_out      : out std_logic_vector(9 downto 0); -- PAR OUT
    rx_clk      : out std_logic;
    rx_rstn     : out std_logic;
    rx_pll_clk  : out std_logic;
    rx_pll_rstn : out std_logic;
    tx_pll_clk  : out std_logic;
    tx_pll_rstn : out std_logic;
    tx_in       : in std_logic_vector(9 downto 0) ; -- PAR IN
    tx_out_p    : out std_logic;          -- SER OUT
    tx_out_n    : out std_logic;          -- SER OUT
    bitslip     : in std_logic
  );
end entity;

architecture rtl of serdes_unisim is

  constant SIMULATION_P : integer := 1;

  component BUFG
    port (  O : out std_logic;
            I : in std_logic );
  end component;

--  signal rx_clk_int, rx_pll_clk_int, tx_pll_clk_int, rst_int, pll_areset_int, rx_locked_int, rx_rstn_int_0, tx_locked_int : std_logic;
--  signal rx_cda_reset_int, bitslip_int, rx_in_int, rx_rst_int, rx_divfwdclk_int, tx_out_int : std_logic_vector(0 downto 0) ;
--  signal rx_clk_rstn_int, rx_pll_rstn_int, tx_pll_rstn_int,  rx_cda_reset_int_0 : std_logic;
--  signal rx_out_int, tx_in_int : std_logic_vector(9 downto 0) ;

  signal ref_clk_int, ref_clk_lock_int, ref_clk_rstn_int, ref_clk_rst_int : std_logic;
  signal ref_clk_buf_int, rx_usrclk_int, rx_usrclk2_int, tx_usrclk_int, tx_usrclk2_int : std_logic;
  signal ref_clk_buf_rstn_int, rx_usrclk2_rstn_int, tx_usrclk2_rstn_int, tx_rst_int, rx_rst_int : std_logic;
  signal rx_rec_clk_int, rx_rec_clk_buf_int : std_logic;
  signal tx_out_clk_int, tx_out_clk_rstn_int, rst_done_int : std_logic;
  signal tx_usrclk_lock_int, rx_usrclk_lock_int : std_logic;

  signal rx_rec_clk0_int, rst_done0_int, rx_in0_n, rx_in0_p, tx_out0_n, tx_out0_p : std_logic;
  signal rx_rec_clk1_int, rst_done1_int, rx_in1_n, rx_in1_p, tx_out1_n, tx_out1_p : std_logic;

  signal r0, r1, r2 : std_logic_vector(4 downto 0);

  signal clkdv_i, clk0_i, clkfb_i, reset_to_dcm : std_logic;
  signal count_to_dcm_reset : std_logic_vector(1 downto 0);
  signal clkfbout_i, clkout0_i, clkout1_i, pll_lk_out, pll_locked_out_r, time_elapsed : std_logic;
  signal lock_wait_counter : std_logic_vector(15 downto 0);

  -- ground and tied_to_vcc_i signals
  signal  tied_to_ground_i                :   std_logic;
  signal  tied_to_ground_vec_i            :   std_logic_vector(63 downto 0);
  signal  tied_to_vcc_i                   :   std_logic;
  signal  tied_to_vcc_vec_i               :   std_logic_vector(63 downto 0);

  -- RX Datapath signals
  signal rxdata0_i                        :   std_logic_vector(31 downto 0);      
  signal rxchariscomma0_float_i           :   std_logic;
  signal rxcharisk0_float_i               :   std_logic;
  signal rxdisperr0_float_i               :   std_logic;
  signal rxnotintable0_float_i            :   std_logic;
  signal rxrundisp0_float_i               :   std_logic;
  signal rxdata0_out_i                    :   std_logic_vector(9 downto 0);
  signal rxcharisk0_i                     :   std_logic_vector(3 downto 0);
  signal rxdisperr0_i                     :   std_logic_vector(3 downto 0);

  -- TX Datapath signals
  signal txdata0_i                        :   std_logic_vector(31 downto 0);
  signal txdata0_in_i                     :   std_logic_vector(9 downto 0);
  signal txchardispmode0_i                :   std_logic_vector(3 downto 0);
  signal txchardispval0_i                 :   std_logic_vector(3 downto 0);
  signal txkerr0_float_i                  :   std_logic;
  signal txrundisp0_float_i               :   std_logic;

  -- Electrical idle reset logic signals
  signal rxelecidle0_i                    :   std_logic;
  signal rxelecidlereset0_i               :   std_logic;

  -- RX Datapath signals
  signal rxdata1_i                        :   std_logic_vector(31 downto 0);      
  signal rxchariscomma1_float_i           :   std_logic;
  signal rxcharisk1_float_i               :   std_logic;
  signal rxdisperr1_float_i               :   std_logic;
  signal rxnotintable1_float_i            :   std_logic;
  signal rxrundisp1_float_i               :   std_logic;
  signal rxdata1_out_i                    :   std_logic_vector(9 downto 0);
  signal rxcharisk1_i                     :   std_logic_vector(3 downto 0);
  signal rxdisperr1_i                     :   std_logic_vector(3 downto 0);

  -- TX Datapath signals
  signal txdata1_i                        :   std_logic_vector(31 downto 0);
  signal txdata1_in_i                     :   std_logic_vector(9 downto 0);
  signal txchardispmode1_i                :   std_logic_vector(3 downto 0);
  signal txchardispval1_i                 :   std_logic_vector(3 downto 0);
  signal txkerr1_float_i                  :   std_logic;
  signal txrundisp1_float_i               :   std_logic;

  -- Electrical idle reset logic signals
  signal rxelecidle1_i                    :   std_logic;
  signal resetdone1_i                     :   std_logic;
  signal rxelecidlereset1_i               :   std_logic;

  -- Shared Electrical Idle Reset signal
  signal rxenelecidleresetb_i                      :   std_logic;
  signal txelecidle_r                              :   std_logic; 
  signal txelecidle0_r                              :   std_logic; 
  signal txelecidle1_r                              :   std_logic; 
  signal txpowerdown0_r                            :   std_logic_vector(1 downto 0);  
  signal rxpowerdown0_r                            :   std_logic_vector(1 downto 0);  
  signal txpowerdown1_r                            :   std_logic_vector(1 downto 0);  
  signal rxpowerdown1_r                            :   std_logic_vector(1 downto 0);  
begin

  -- output clocks
  rx_clk      <= rx_usrclk2_int;
  rx_pll_clk  <= ref_clk_buf_int;
  tx_pll_clk  <= tx_usrclk2_int;
  -- output synchronized resets
  rx_rstn     <= rx_usrclk2_rstn_int;
  rx_pll_rstn <= ref_clk_buf_rstn_int;
  tx_pll_rstn <= tx_usrclk2_rstn_int;

  ref_clk_rst_int <= not ref_clk_lock_int;

  -- reset synchronizers
  rst0 : process (ref_clk_buf_int, ref_clk_rst_int) begin
    if rising_edge(ref_clk_buf_int) then 
      r0 <= r0(3 downto 0) & rst_done_int; 
      ref_clk_buf_rstn_int <= r0(4) and r0(3) and r0(2);
    end if;
    if (ref_clk_rst_int = '1') then r0 <= "00000"; ref_clk_buf_rstn_int <= '0'; end if;
  end process;

  rst1 : process (rx_usrclk2_int, rx_rst_int) begin
    if rising_edge(rx_usrclk2_int) then 
      r1 <= r1(3 downto 0) & rst_done_int; 
      rx_usrclk2_rstn_int <= r1(4) and r1(3) and r1(2);
    end if;
    if (rx_rst_int = '1') then r1 <= "00000"; rx_usrclk2_rstn_int <= '0'; end if;
  end process;

  rst2 : process (tx_usrclk2_int, tx_rst_int) begin
    if rising_edge(tx_usrclk2_int) then 
      r2 <= r2(3 downto 0) & rst_done_int; 
      tx_usrclk2_rstn_int <= r2(4) and r2(3) and r2(2);
    end if;
    if (tx_rst_int = '1') then r2 <= "00000"; tx_usrclk2_rstn_int <= '0'; end if;
  end process;

  -- Transceiver channel selection
  ch0: if transtech = TT_XGTP0 or transtech = TT_XGTX0 generate
    rx_rec_clk_int  <= rx_rec_clk0_int;
    rst_done_int    <= rst_done0_int;
    rx_in0_n        <= rx_in_n;
    rx_in0_p        <= rx_in_p;
    tx_out_n        <= tx_out0_n;
    tx_out_p        <= tx_out0_p;
    inv_tx: for i in 0 to 9 generate
        txdata0_in_i(i) <=   tx_in(9-i);
        rx_out(i)       <=   rxdata0_out_i(9-i);
    end generate ;
  end generate;

  ch1: if transtech = TT_XGTP1 or transtech = TT_XGTX1 generate
    rx_rec_clk_int  <= rx_rec_clk1_int;
    rst_done_int    <= rst_done1_int;
    rx_in1_n        <= rx_in_n;
    rx_in1_p        <= rx_in_p;
    tx_out_n        <= tx_out1_n;
    tx_out_p        <= tx_out1_p;
    inv_tx: for i in 0 to 9 generate
        txdata1_in_i(i) <=   tx_in(9-i);
        rx_out(i)       <=   rxdata1_out_i(9-i);
    end generate ;
  end generate;

    ---------------------------  Static signal Assignments ---------------------   

    tied_to_ground_i                    <= '0';
    tied_to_ground_vec_i(63 downto 0)   <= (others => '0');
    tied_to_vcc_i                       <= '1';
    tied_to_vcc_vec_i(63 downto 0)      <= (others => '1');
     
    

    -------------------  GTP Datapath byte mapping  -----------------    
    
    --The GTP deserializes the rightmost parallel bit (LSb) first 

    --The GTP serializes the rightmost parallel bit (LSb) first
    
    --The GTP deserializes the rightmost parallel bit (LSb) first 

    --The GTP serializes the rightmost parallel bit (LSb) first


    -------------  GTP0 rxdata_out_i Assignments for 10 bit datapath  -------  

    rxdata0_out_i    <= (rxdisperr0_i(0) & rxcharisk0_i(0) & rxdata0_i(7 downto 0));

    -------------  GTP0 txdata_i Assignments for 10 bit datapath  ------- 
    
    txdata0_i              <= (tied_to_ground_vec_i(23 downto 0) & txdata0_in_i(7 downto 0));
    txchardispval0_i       <= (tied_to_ground_vec_i(2 downto 0) & txdata0_in_i(8));
    txchardispmode0_i      <= (tied_to_ground_vec_i(2 downto 0) & txdata0_in_i(9));
    -------------  GTP1 rxdata_out_i Assignments for 10 bit datapath  -------  

    rxdata1_out_i    <= (rxdisperr1_i(0) & rxcharisk1_i(0) & rxdata1_i(7 downto 0));

    -------------  GTP1 txdata_i Assignments for 10 bit datapath  ------- 
    
    txdata1_i              <= (tied_to_ground_vec_i(23 downto 0) & txdata1_in_i(7 downto 0));
    txchardispval1_i       <= (tied_to_ground_vec_i(2 downto 0) & txdata1_in_i(8));
    txchardispmode1_i      <= (tied_to_ground_vec_i(2 downto 0) & txdata1_in_i(9));


    ---- Clock buffers

    ref_clk_buf0 : BUFG
      port map
      (
        I     =>  ref_clk_int,
        O     =>  ref_clk_buf_int
      );

    rx_rec_clk_buf0 : BUFG
      port map
      (
        I     =>  rx_rec_clk_int,
        O     =>  rx_rec_clk_buf_int
      );

    ---- GTP_DUAL instantiation

    inst_gtp0: if (transtech = TT_XGTP0) or (transtech = TT_XGTP1) generate

      -- no need for extra clocks on GTP transtech
      tx_usrclk_int   <= ref_clk_buf_int;
      tx_usrclk2_int  <= ref_clk_buf_int;
      tx_rst_int      <= not ref_clk_lock_int;

      rx_usrclk_int   <= rx_rec_clk_buf_int;
      rx_usrclk2_int  <= rx_rec_clk_buf_int;
      rx_rst_int      <= not ref_clk_lock_int;

      gtp_dual_i:GTP_DUAL
        generic map (

          --_______________________ Simulation-Only Attributes ___________________
          SIM_RECEIVER_DETECT_PASS0   =>       TRUE,
          SIM_RECEIVER_DETECT_PASS1   =>       TRUE,
          SIM_MODE                    =>       "FAST",        
          SIM_GTPRESET_SPEEDUP        =>       0,
          SIM_PLL_PERDIV2             =>       x"190",

          --___________________________ Shared Attributes ________________________

          -------------------------- Tile and PLL Attributes ---------------------

          CLK25_DIVIDER               =>       5, 
          CLKINDC_B                   =>       TRUE,
          OOB_CLK_DIVIDER             =>       4,
          OVERSAMPLE_MODE             =>       FALSE,
          PLL_DIVSEL_FB               =>       2,
          PLL_DIVSEL_REF              =>       1,
          PLL_TXDIVSEL_COMM_OUT       =>       2,
          TX_SYNC_FILTERB             =>       1,   


          --____________________ Transmit Interface Attributes ___________________

          ------------------- TX Buffering and Phase Alignment -------------------   

          TX_BUFFER_USE_0             =>       FALSE,
          TX_XCLK_SEL_0               =>       "TXUSR",
          TXRX_INVERT_0               =>       "00100",        

          TX_BUFFER_USE_1             =>       FALSE,
          TX_XCLK_SEL_1               =>       "TXUSR",
          TXRX_INVERT_1               =>       "00100",        

          --------------------- TX Serial Line Rate settings ---------------------   

          PLL_TXDIVSEL_OUT_0          =>       1,

          PLL_TXDIVSEL_OUT_1          =>       1,

          --------------------- TX Driver and OOB signalling --------------------  

          TX_DIFF_BOOST_0             =>       TRUE,

          TX_DIFF_BOOST_1             =>       TRUE,

          ------------------ TX Pipe Control for PCI Express/SATA ---------------

          COM_BURST_VAL_0             =>       "1111",

          COM_BURST_VAL_1             =>       "1111",
          --_______________________ Receive Interface Attributes ________________

          ------------ RX Driver,OOB signalling,Coupling and Eq,CDR -------------  

          AC_CAP_DIS_0                =>       TRUE,
          OOBDETECT_THRESHOLD_0       =>       "001",
          PMA_CDR_SCAN_0              =>       x"6c07640",
          PMA_RX_CFG_0                =>       x"09f0088",
          RCV_TERM_GND_0              =>       FALSE,
          RCV_TERM_MID_0              =>       FALSE,
          RCV_TERM_VTTRX_0            =>       FALSE,
          TERMINATION_IMP_0           =>       50,

          AC_CAP_DIS_1                =>       TRUE,
          OOBDETECT_THRESHOLD_1       =>       "001",
          PMA_CDR_SCAN_1              =>       x"6c07640",
          PMA_RX_CFG_1                =>       x"09f0088",  
          RCV_TERM_GND_1              =>       FALSE,
          RCV_TERM_MID_1              =>       FALSE,
          RCV_TERM_VTTRX_1            =>       FALSE,
          TERMINATION_IMP_1           =>       50,

          PCS_COM_CFG                 =>       x"1680a0e",  
          TERMINATION_CTRL            =>       "10100",
          TERMINATION_OVRD            =>       FALSE,

          --------------------- RX Serial Line Rate Attributes ------------------   

          PLL_RXDIVSEL_OUT_0          =>       2,
          PLL_SATA_0                  =>       FALSE,

          PLL_RXDIVSEL_OUT_1          =>       2,
          PLL_SATA_1                  =>       FALSE,

          ----------------------- PRBS Detection Attributes ---------------------  

          PRBS_ERR_THRESHOLD_0        =>       x"00000001",

          PRBS_ERR_THRESHOLD_1        =>       x"00000001",

          ---------------- Comma Detection and Alignment Attributes -------------  

          ALIGN_COMMA_WORD_0          =>       1,
          COMMA_10B_ENABLE_0          =>       "1111111111",
          COMMA_DOUBLE_0              =>       FALSE,
          DEC_MCOMMA_DETECT_0         =>       FALSE,
          DEC_PCOMMA_DETECT_0         =>       FALSE,
          DEC_VALID_COMMA_ONLY_0      =>       FALSE,
          MCOMMA_10B_VALUE_0          =>       "1010000011",
          MCOMMA_DETECT_0             =>       FALSE,
          PCOMMA_10B_VALUE_0          =>       "0101111100",
          PCOMMA_DETECT_0             =>       FALSE,
          RX_SLIDE_MODE_0             =>       "PCS",

          ALIGN_COMMA_WORD_1          =>       1,
          COMMA_10B_ENABLE_1          =>       "1111111111",
          COMMA_DOUBLE_1              =>       FALSE,
          DEC_MCOMMA_DETECT_1         =>       FALSE,
          DEC_PCOMMA_DETECT_1         =>       FALSE,
          DEC_VALID_COMMA_ONLY_1      =>       FALSE,
          MCOMMA_10B_VALUE_1          =>       "1010000011",
          MCOMMA_DETECT_1             =>       FALSE,
          PCOMMA_10B_VALUE_1          =>       "0101111100",
          PCOMMA_DETECT_1             =>       FALSE,
          RX_SLIDE_MODE_1             =>       "PCS",

          ------------------ RX Loss-of-sync State Machine Attributes -----------  

          RX_LOSS_OF_SYNC_FSM_0       =>       FALSE,
          RX_LOS_INVALID_INCR_0       =>       8,
          RX_LOS_THRESHOLD_0          =>       128,

          RX_LOSS_OF_SYNC_FSM_1       =>       FALSE,
          RX_LOS_INVALID_INCR_1       =>       8,
          RX_LOS_THRESHOLD_1          =>       128,

          -------------- RX Elastic Buffer and Phase alignment Attributes -------   

          RX_BUFFER_USE_0             =>       FALSE,
          RX_XCLK_SEL_0               =>       "RXUSR",

          RX_BUFFER_USE_1             =>       FALSE,
          RX_XCLK_SEL_1               =>       "RXUSR",                   

          ------------------------ Clock Correction Attributes ------------------   

          CLK_CORRECT_USE_0           =>       FALSE,
          CLK_COR_ADJ_LEN_0           =>       1,
          CLK_COR_DET_LEN_0           =>       1,
          CLK_COR_INSERT_IDLE_FLAG_0  =>       FALSE,
          CLK_COR_KEEP_IDLE_0         =>       FALSE,
          CLK_COR_MAX_LAT_0           =>       18,
          CLK_COR_MIN_LAT_0           =>       16,
          CLK_COR_PRECEDENCE_0        =>       TRUE,
          CLK_COR_REPEAT_WAIT_0       =>       0,
          CLK_COR_SEQ_1_1_0           =>       "0000000000",
          CLK_COR_SEQ_1_2_0           =>       "0000000000",
          CLK_COR_SEQ_1_3_0           =>       "0000000000",
          CLK_COR_SEQ_1_4_0           =>       "0000000000",
          CLK_COR_SEQ_1_ENABLE_0      =>       "0000",
          CLK_COR_SEQ_2_1_0           =>       "0000000000",
          CLK_COR_SEQ_2_2_0           =>       "0000000000",
          CLK_COR_SEQ_2_3_0           =>       "0000000000",
          CLK_COR_SEQ_2_4_0           =>       "0000000000",
          CLK_COR_SEQ_2_ENABLE_0      =>       "0000",
          CLK_COR_SEQ_2_USE_0         =>       FALSE,
          RX_DECODE_SEQ_MATCH_0       =>       FALSE,

          CLK_CORRECT_USE_1           =>       FALSE,
          CLK_COR_ADJ_LEN_1           =>       1,
          CLK_COR_DET_LEN_1           =>       1,
          CLK_COR_INSERT_IDLE_FLAG_1  =>       FALSE,
          CLK_COR_KEEP_IDLE_1         =>       FALSE,
          CLK_COR_MAX_LAT_1           =>       18,
          CLK_COR_MIN_LAT_1           =>       16,
          CLK_COR_PRECEDENCE_1        =>       TRUE,
          CLK_COR_REPEAT_WAIT_1       =>       0,
          CLK_COR_SEQ_1_1_1           =>       "0000000000",
          CLK_COR_SEQ_1_2_1           =>       "0000000000",
          CLK_COR_SEQ_1_3_1           =>       "0000000000",
          CLK_COR_SEQ_1_4_1           =>       "0000000000",
          CLK_COR_SEQ_1_ENABLE_1      =>       "0000",
          CLK_COR_SEQ_2_1_1           =>       "0000000000",
          CLK_COR_SEQ_2_2_1           =>       "0000000000",
          CLK_COR_SEQ_2_3_1           =>       "0000000000",
          CLK_COR_SEQ_2_4_1           =>       "0000000000",
          CLK_COR_SEQ_2_ENABLE_1      =>       "0000",
          CLK_COR_SEQ_2_USE_1         =>       FALSE,
          RX_DECODE_SEQ_MATCH_1       =>       FALSE,

          ------------------------ Channel Bonding Attributes -------------------   

          CHAN_BOND_1_MAX_SKEW_0      =>       1,
          CHAN_BOND_2_MAX_SKEW_0      =>       1,
          CHAN_BOND_LEVEL_0           =>       0,
          CHAN_BOND_MODE_0            =>       "OFF",
          CHAN_BOND_SEQ_1_1_0         =>       "0000000000",
          CHAN_BOND_SEQ_1_2_0         =>       "0000000000",
          CHAN_BOND_SEQ_1_3_0         =>       "0000000000",
          CHAN_BOND_SEQ_1_4_0         =>       "0000000000",
          CHAN_BOND_SEQ_1_ENABLE_0    =>       "0001",
          CHAN_BOND_SEQ_2_1_0         =>       "0000000000",
          CHAN_BOND_SEQ_2_2_0         =>       "0000000000",
          CHAN_BOND_SEQ_2_3_0         =>       "0000000000",
          CHAN_BOND_SEQ_2_4_0         =>       "0000000000",
          CHAN_BOND_SEQ_2_ENABLE_0    =>       "0000",
          CHAN_BOND_SEQ_2_USE_0       =>       FALSE,  
          CHAN_BOND_SEQ_LEN_0         =>       1,
          PCI_EXPRESS_MODE_0          =>       FALSE,   
       
          CHAN_BOND_1_MAX_SKEW_1      =>       1,
          CHAN_BOND_2_MAX_SKEW_1      =>       1,
          CHAN_BOND_LEVEL_1           =>       0,
          CHAN_BOND_MODE_1            =>       "OFF",
          CHAN_BOND_SEQ_1_1_1         =>       "0000000000",
          CHAN_BOND_SEQ_1_2_1         =>       "0000000000",
          CHAN_BOND_SEQ_1_3_1         =>       "0000000000",
          CHAN_BOND_SEQ_1_4_1         =>       "0000000000",
          CHAN_BOND_SEQ_1_ENABLE_1    =>       "0001",
          CHAN_BOND_SEQ_2_1_1         =>       "0000000000",
          CHAN_BOND_SEQ_2_2_1         =>       "0000000000",
          CHAN_BOND_SEQ_2_3_1         =>       "0000000000",
          CHAN_BOND_SEQ_2_4_1         =>       "0000000000",
          CHAN_BOND_SEQ_2_ENABLE_1    =>       "0000",
          CHAN_BOND_SEQ_2_USE_1       =>       FALSE,  
          CHAN_BOND_SEQ_LEN_1         =>       1,
          PCI_EXPRESS_MODE_1          =>       FALSE,

          ------------------ RX Attributes for PCI Express/SATA ---------------

          RX_STATUS_FMT_0             =>       "PCIE",
          SATA_BURST_VAL_0            =>       "100",
          SATA_IDLE_VAL_0             =>       "100",
          SATA_MAX_BURST_0            =>       9,
          SATA_MAX_INIT_0             =>       27,
          SATA_MAX_WAKE_0             =>       9,
          SATA_MIN_BURST_0            =>       5,
          SATA_MIN_INIT_0             =>       15,
          SATA_MIN_WAKE_0             =>       5,
          TRANS_TIME_FROM_P2_0        =>       x"003c",
          TRANS_TIME_NON_P2_0         =>       x"0019",
          TRANS_TIME_TO_P2_0          =>       x"0064",

          RX_STATUS_FMT_1             =>       "PCIE",
          SATA_BURST_VAL_1            =>       "100",
          SATA_IDLE_VAL_1             =>       "100",
          SATA_MAX_BURST_1            =>       9,
          SATA_MAX_INIT_1             =>       27,
          SATA_MAX_WAKE_1             =>       9,
          SATA_MIN_BURST_1            =>       5,
          SATA_MIN_INIT_1             =>       15,
          SATA_MIN_WAKE_1             =>       5,
          TRANS_TIME_FROM_P2_1        =>       x"003c",
          TRANS_TIME_NON_P2_1         =>       x"0019",
          TRANS_TIME_TO_P2_1          =>       x"0064"
        ) 
        port map (
          ------------------------ Loopback and Powerdown Ports ----------------------
          LOOPBACK0                       =>      tied_to_ground_vec_i(2 downto 0),
          LOOPBACK1                       =>      tied_to_ground_vec_i(2 downto 0),
          RXPOWERDOWN0                    =>      tied_to_ground_vec_i(1 downto 0),
          RXPOWERDOWN1                    =>      tied_to_ground_vec_i(1 downto 0),
          TXPOWERDOWN0                    =>      tied_to_ground_vec_i(1 downto 0),
          TXPOWERDOWN1                    =>      tied_to_ground_vec_i(1 downto 0),
          ----------------------- Receive Ports - 8b10b Decoder ----------------------
          RXCHARISCOMMA0                  =>      open,
          RXCHARISCOMMA1                  =>      open,
          RXCHARISK0                      =>      rxcharisk0_i(1 downto 0),
          RXCHARISK1                      =>      rxcharisk1_i(1 downto 0),
          RXDEC8B10BUSE0                  =>      tied_to_ground_i,
          RXDEC8B10BUSE1                  =>      tied_to_ground_i,
          RXDISPERR0                      =>      rxdisperr0_i(1 downto 0),
          RXDISPERR1                      =>      rxdisperr1_i(1 downto 0),
          RXNOTINTABLE0                   =>      open,
          RXNOTINTABLE1                   =>      open,
          RXRUNDISP0                      =>      open,
          RXRUNDISP1                      =>      open,
          ------------------- Receive Ports - Channel Bonding Ports ------------------
          RXCHANBONDSEQ0                  =>      open,
          RXCHANBONDSEQ1                  =>      open,
          RXCHBONDI0                      =>      tied_to_ground_vec_i(2 downto 0),
          RXCHBONDI1                      =>      tied_to_ground_vec_i(2 downto 0),
          RXCHBONDO0                      =>      open,
          RXCHBONDO1                      =>      open,
          RXENCHANSYNC0                   =>      tied_to_ground_i,
          RXENCHANSYNC1                   =>      tied_to_ground_i,
          ------------------- Receive Ports - Clock Correction Ports -----------------
          RXCLKCORCNT0                    =>      open,
          RXCLKCORCNT1                    =>      open,
          --------------- Receive Ports - Comma Detection and Alignment --------------
          RXBYTEISALIGNED0                =>      open,
          RXBYTEISALIGNED1                =>      open,
          RXBYTEREALIGN0                  =>      open,
          RXBYTEREALIGN1                  =>      open,
          RXCOMMADET0                     =>      open,
          RXCOMMADET1                     =>      open,
          RXCOMMADETUSE0                  =>      tied_to_vcc_i,
          RXCOMMADETUSE1                  =>      tied_to_vcc_i,
          RXENMCOMMAALIGN0                =>      tied_to_ground_i,
          RXENMCOMMAALIGN1                =>      tied_to_ground_i,
          RXENPCOMMAALIGN0                =>      tied_to_ground_i,
          RXENPCOMMAALIGN1                =>      tied_to_ground_i,
          RXSLIDE0                        =>      bitslip,
          RXSLIDE1                        =>      bitslip,
          ----------------------- Receive Ports - PRBS Detection ---------------------
          PRBSCNTRESET0                   =>      tied_to_ground_i,
          PRBSCNTRESET1                   =>      tied_to_ground_i,
          RXENPRBSTST0                    =>      tied_to_ground_vec_i(1 downto 0),
          RXENPRBSTST1                    =>      tied_to_ground_vec_i(1 downto 0),
          RXPRBSERR0                      =>      open,
          RXPRBSERR1                      =>      open,
          ------------------- Receive Ports - RX Data Path interface -----------------
          RXDATA0                         =>      rxdata0_i(15 downto 0),
          RXDATA1                         =>      rxdata1_i(15 downto 0),
          RXDATAWIDTH0                    =>      tied_to_ground_i,
          RXDATAWIDTH1                    =>      tied_to_ground_i,
          RXRECCLK0                       =>      rx_rec_clk0_int,
          RXRECCLK1                       =>      rx_rec_clk1_int,
          RXRESET0                        =>      rx_rst_int,
          RXRESET1                        =>      rx_rst_int,
          RXUSRCLK0                       =>      rx_usrclk_int,
          RXUSRCLK1                       =>      rx_usrclk_int,
          RXUSRCLK20                      =>      rx_usrclk2_int,
          RXUSRCLK21                      =>      rx_usrclk2_int,
          ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
          RXCDRRESET0                     =>      tied_to_ground_i,
          RXCDRRESET1                     =>      tied_to_ground_i,
          RXELECIDLE0                     =>      rxelecidle0_i,
          RXELECIDLE1                     =>      rxelecidle1_i,
          RXELECIDLERESET0                =>      tied_to_ground_i,
          RXELECIDLERESET1                =>      tied_to_ground_i,
          RXENEQB0                        =>      tied_to_vcc_i,
          RXENEQB1                        =>      tied_to_vcc_i,
          RXEQMIX0                        =>      tied_to_ground_vec_i(1 downto 0),
          RXEQMIX1                        =>      tied_to_ground_vec_i(1 downto 0),
          RXEQPOLE0                       =>      tied_to_ground_vec_i(3 downto 0),
          RXEQPOLE1                       =>      tied_to_ground_vec_i(3 downto 0),
          RXN0                            =>      rx_in0_n,
          RXN1                            =>      rx_in1_n,
          RXP0                            =>      rx_in0_p,
          RXP1                            =>      rx_in1_p,
          -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
          RXBUFRESET0                     =>      tied_to_ground_i,
          RXBUFRESET1                     =>      tied_to_ground_i,
          RXBUFSTATUS0                    =>      open,
          RXBUFSTATUS1                    =>      open,
          RXCHANISALIGNED0                =>      open,
          RXCHANISALIGNED1                =>      open,
          RXCHANREALIGN0                  =>      open,
          RXCHANREALIGN1                  =>      open,
          RXPMASETPHASE0                  =>      tied_to_ground_i,
          RXPMASETPHASE1                  =>      tied_to_ground_i,
          RXSTATUS0                       =>      open,
          RXSTATUS1                       =>      open,
          --------------- Receive Ports - RX Loss-of-sync State Machine --------------
          RXLOSSOFSYNC0                   =>      open,
          RXLOSSOFSYNC1                   =>      open,
          ---------------------- Receive Ports - RX Oversampling ---------------------
          RXENSAMPLEALIGN0                =>      tied_to_ground_i,
          RXENSAMPLEALIGN1                =>      tied_to_ground_i,
          RXOVERSAMPLEERR0                =>      open,
          RXOVERSAMPLEERR1                =>      open,
          -------------- Receive Ports - RX Pipe Control for PCI Express -------------
          PHYSTATUS0                      =>      open,
          PHYSTATUS1                      =>      open,
          RXVALID0                        =>      open,
          RXVALID1                        =>      open,
          ----------------- Receive Ports - RX Polarity Control Ports ----------------
          RXPOLARITY0                     =>      tied_to_ground_i,
          RXPOLARITY1                     =>      tied_to_ground_i,
          ------------- Shared Ports - Dynamic Reconfiguration Port (DRP) ------------
          DADDR                           =>      tied_to_ground_vec_i(6 downto 0),
          DCLK                            =>      tied_to_ground_i,
          DEN                             =>      tied_to_ground_i,
          DI                              =>      tied_to_ground_vec_i(15 downto 0),
          DO                              =>      open,
          DRDY                            =>      open,
          DWE                             =>      tied_to_ground_i,
          --------------------- Shared Ports - Tile and PLL Ports --------------------
          CLKIN                           =>      clk_125,
          GTPRESET                        =>      rst_125,
          GTPTEST                         =>      tied_to_ground_vec_i(3 downto 0),
          INTDATAWIDTH                    =>      tied_to_vcc_i,
          PLLLKDET                        =>      ref_clk_lock_int,
          PLLLKDETEN                      =>      tied_to_vcc_i,
          PLLPOWERDOWN                    =>      tied_to_ground_i,
          REFCLKOUT                       =>      ref_clk_int,
          REFCLKPWRDNB                    =>      tied_to_vcc_i,
          RESETDONE0                      =>      rst_done0_int,
          RESETDONE1                      =>      rst_done1_int,
          RXENELECIDLERESETB              =>      tied_to_vcc_i,
          TXENPMAPHASEALIGN               =>      tied_to_ground_i,
          TXPMASETPHASE                   =>      tied_to_ground_i,
          ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
          TXBYPASS8B10B0                  =>      tied_to_ground_vec_i(1 downto 0),
          TXBYPASS8B10B1                  =>      tied_to_ground_vec_i(1 downto 0),
          TXCHARDISPMODE0                 =>      txchardispmode0_i(1 downto 0),
          TXCHARDISPMODE1                 =>      txchardispmode1_i(1 downto 0),
          TXCHARDISPVAL0                  =>      txchardispval0_i(1 downto 0),
          TXCHARDISPVAL1                  =>      txchardispval1_i(1 downto 0),
          TXCHARISK0                      =>      tied_to_ground_vec_i(1 downto 0),
          TXCHARISK1                      =>      tied_to_ground_vec_i(1 downto 0),
          TXENC8B10BUSE0                  =>      tied_to_ground_i,
          TXENC8B10BUSE1                  =>      tied_to_ground_i,
          TXKERR0                         =>      open,
          TXKERR1                         =>      open,
          TXRUNDISP0                      =>      open,
          TXRUNDISP1                      =>      open,
          ------------- Transmit Ports - TX Buffering and Phase Alignment ------------
          TXBUFSTATUS0                    =>      open,
          TXBUFSTATUS1                    =>      open,
          ------------------ Transmit Ports - TX Data Path interface -----------------
          TXDATA0                         =>      txdata0_i(15 downto 0),
          TXDATA1                         =>      txdata1_i(15 downto 0),
          TXDATAWIDTH0                    =>      tied_to_ground_i,
          TXDATAWIDTH1                    =>      tied_to_ground_i,
          TXOUTCLK0                       =>      open,
          TXOUTCLK1                       =>      open,
          TXRESET0                        =>      tx_rst_int,
          TXRESET1                        =>      tx_rst_int,
          TXUSRCLK0                       =>      tx_usrclk_int,
          TXUSRCLK1                       =>      tx_usrclk_int,
          TXUSRCLK20                      =>      tx_usrclk2_int,
          TXUSRCLK21                      =>      tx_usrclk2_int,
          --------------- Transmit Ports - TX Driver and OOB signalling --------------
          TXBUFDIFFCTRL0                  =>      "000",
          TXBUFDIFFCTRL1                  =>      "000",
          TXDIFFCTRL0                     =>      "000",
          TXDIFFCTRL1                     =>      "000",
          TXINHIBIT0                      =>      tied_to_ground_i,
          TXINHIBIT1                      =>      tied_to_ground_i,
          TXN0                            =>      tx_out0_n,
          TXN1                            =>      tx_out1_n,
          TXP0                            =>      tx_out0_p,
          TXP1                            =>      tx_out1_p,
          TXPREEMPHASIS0                  =>      "000",
          TXPREEMPHASIS1                  =>      "000",
          --------------------- Transmit Ports - TX PRBS Generator -------------------
          TXENPRBSTST0                    =>      tied_to_ground_vec_i(1 downto 0),
          TXENPRBSTST1                    =>      tied_to_ground_vec_i(1 downto 0),
          -------------------- Transmit Ports - TX Polarity Control ------------------
          TXPOLARITY0                     =>      tied_to_ground_i,
          TXPOLARITY1                     =>      tied_to_ground_i,
          ----------------- Transmit Ports - TX Ports for PCI Express ----------------
          TXDETECTRX0                     =>      tied_to_ground_i,
          TXDETECTRX1                     =>      tied_to_ground_i,
          TXELECIDLE0                     =>      tied_to_ground_i,
          TXELECIDLE1                     =>      tied_to_ground_i,
          --------------------- Transmit Ports - TX Ports for SATA -------------------
          TXCOMSTART0                     =>      tied_to_ground_i,
          TXCOMSTART1                     =>      tied_to_ground_i,
          TXCOMTYPE0                      =>      tied_to_ground_i,
          TXCOMTYPE1                      =>      tied_to_ground_i
        );
    end generate;

    ---- GTX_DUAL instantiation
    inst_gtx0: if (transtech = TT_XGTX0) or (transtech = TT_XGTX1) generate

--      refclkout_dcm0: MGT_USRCLK_SOURCE
--        generic map
--        (
--            FREQUENCY_MODE                  =>      "LOW",
--            PERFORMANCE_MODE                =>      "MAX_SPEED"
--        )
--        port map
--        (
--            DIV1_OUT                        =>      tx_usrclk2_int,
--            DIV2_OUT                        =>      tx_usrclk_int,
--            DCM_LOCKED_OUT                  =>      tx_usrclk_lock_int,
--            CLK_IN                          =>      ref_clk_buf_int,
--            DCM_RESET_IN                    =>      ref_clk_rst_int
--        );



      -- Logic to apply DCM reset for 3 CLKIN cycles
      process(ref_clk_buf_int, ref_clk_rst_int)
      begin
         if(ref_clk_rst_int='1') then
              count_to_dcm_reset  <= "00";
         elsif(ref_clk_buf_int'event and ref_clk_buf_int='1') then
              if(count_to_dcm_reset<"11") then
                 count_to_dcm_reset <= count_to_dcm_reset + '1';
              else
                 count_to_dcm_reset <= count_to_dcm_reset;
              end if;
         end if;  
      end process;

      reset_to_dcm <= '1' when (count_to_dcm_reset <"11") else
                     '0';

      -- Instantiate a DCM module to divide the reference clock.
      clock_divider_i : DCM_BASE
      generic map
      (
          CLKDV_DIVIDE          =>          2.0,
          DFS_FREQUENCY_MODE    =>          "LOW", 
          DLL_FREQUENCY_MODE    =>          "LOW",
          DCM_PERFORMANCE_MODE  =>          "MAX_SPEED"
      )    
      port map
      (
          CLK0                =>          clk0_i,
          CLK180              =>          open,
          CLK270              =>          open,
          CLK2X               =>          open,
          CLK2X180            =>          open,
          CLK90               =>          open,
          CLKDV               =>          clkdv_i,
          CLKFX               =>          open,
          CLKFX180            =>          open,
          LOCKED              =>          tx_usrclk_lock_int,
          CLKFB               =>          clkfb_i,
          CLKIN               =>          ref_clk_buf_int,
          RST                 =>          reset_to_dcm
      );

      dcm_1x_bufg_i : BUFG
      port map
      (
          I                   =>          clk0_i,
          O                   =>          clkfb_i
      );
      
      tx_usrclk2_int  <=  clkfb_i;

      dcm_div2_bufg_i : BUFG 
      port map
      (
          I                   =>          clkdv_i,
          O                   =>          tx_usrclk_int
      );



      pll_adv_i  : PLL_ADV
      generic map
      (
           CLKFBOUT_MULT   =>  18,
           DIVCLK_DIVIDE   =>  1,
           CLKFBOUT_PHASE  =>  0.0,
           CLKIN1_PERIOD   =>  16.0,
           CLKIN2_PERIOD   =>  10.0,          -- Not used
           CLKOUT0_DIVIDE  =>  18,
           CLKOUT0_PHASE   =>  0.0,
           CLKOUT1_DIVIDE  =>  9,
           CLKOUT1_PHASE   =>  0.0,
           CLKOUT2_DIVIDE  =>  1,
           CLKOUT2_PHASE   =>  0.0,
           CLKOUT3_DIVIDE  =>  1,
           CLKOUT3_PHASE   =>  0.0         
      )
      port map
      (
           CLKIN1          =>  rx_rec_clk_buf_int,
           CLKIN2          =>  tied_to_ground_i,
           CLKINSEL        =>  tied_to_vcc_i,
           CLKFBIN         =>  clkfbout_i,
           CLKOUT0         =>  clkout0_i,
           CLKOUT1         =>  clkout1_i,
           CLKOUT2         =>  open,
           CLKOUT3         =>  open,
           CLKOUT4         =>  open,
           CLKOUT5         =>  open,
           CLKFBOUT        =>  clkfbout_i,
           CLKFBDCM        =>  open,
           CLKOUTDCM0      =>  open,
           CLKOUTDCM1      =>  open,
           CLKOUTDCM2      =>  open,
           CLKOUTDCM3      =>  open,
           CLKOUTDCM4      =>  open,
           CLKOUTDCM5      =>  open,
           DO              =>  open,
           DRDY            =>  open,
           DADDR           =>  tied_to_ground_vec_i(4 downto 0),
           DCLK            =>  tied_to_ground_i,
           DEN             =>  tied_to_ground_i,
           DI              =>  tied_to_ground_vec_i(15 downto 0),
           DWE             =>  tied_to_ground_i,
           REL             =>  tied_to_ground_i,
           LOCKED          =>  pll_lk_out,
           RST             =>  ref_clk_rst_int
      );
      
      
      clkout0_bufg_i  :  BUFG   
      port map
      (
          O      =>    rx_usrclk_int, 
          I      =>    clkout0_i
      ); 


      clkout1_bufg_i  :  BUFG   
      port map
      (
          O      =>    rx_usrclk2_int,
          I      =>    clkout1_i
      );
      
    --lockwait_count : if SIMULATION_P = 1 generate
    --  
    --  -- lock not valid until 100us after PLL is released from reset
    --  process(rx_rec_clk_buf_int, ref_clk_rst_int) 
    --  begin
    --      if (ref_clk_rst_int = '1') then
    --          lock_wait_counter <= "0000000000000000"; 
    --          pll_locked_out_r <= '0';
    --          time_elapsed <= '0';
    --      elsif (rx_rec_clk_buf_int'event and rx_rec_clk_buf_int = '1') then
    --          if (lock_wait_counter = "0001100001101010" or (time_elapsed = '1')) then
    --              pll_locked_out_r <= pll_lk_out;
    --              time_elapsed <= '1';                
    --          else 
    --              lock_wait_counter <= lock_wait_counter + 1;
    --          end if;
    --      end if;
    --  end process;
    --  
    --  rx_usrclk_lock_int <= pll_locked_out_r;
    --  
    --  end generate lockwait_count; -- end SIMULATION_P=1 generate section
--
    --  no_lockwait_count : if SIMULATION_P = 0 generate

      rx_usrclk_lock_int <= pll_lk_out;

      --end generate no_lockwait_count; -- End generate for SIMULATION_P


--      rxrecclk_pll1_i : MGT_USRCLK_SOURCE_PLL
--        generic map
--        (
--            MULT                            =>      18,
--            DIVIDE                          =>      1,
--            CLK_PERIOD                      =>      16.0,
--            OUT0_DIVIDE                     =>      18,
--            OUT1_DIVIDE                     =>      9,
--            OUT2_DIVIDE                     =>      1,
--            OUT3_DIVIDE                     =>      1,
--            SIMULATION_P                    =>      1,
--            LOCK_WAIT_COUNT                 =>      "0001100001101010"
--        )
--        port map
--        (
--            CLK0_OUT                        =>      rx_usrclk_int,
--            CLK1_OUT                        =>      rx_usrclk2_int,
--            CLK2_OUT                        =>      open,
--            CLK3_OUT                        =>      open,
--            CLK_IN                          =>      rx_rec_clk_buf_int,
--            PLL_LOCKED_OUT                  =>      rx_usrclk_lock_int,
--            PLL_RESET_IN                    =>      ref_clk_rst_int
--        );

      tx_rst_int <= not tx_usrclk_lock_int;
      rx_rst_int <= not rx_usrclk_lock_int;

      gtx_dual_i: GTX_DUAL
        generic map
        (

          --_______________________ Simulation-Only Attributes ___________________

          SIM_RECEIVER_DETECT_PASS_0  =>       TRUE,
          
          SIM_RECEIVER_DETECT_PASS_1  =>       TRUE,

          SIM_MODE                    =>       "FAST",
          SIM_GTXRESET_SPEEDUP        =>       0,
          SIM_PLL_PERDIV2             =>       x"0c8",
    

          --___________________________ Shared Attributes ________________________

          -------------------------- Tile and PLL Attributes ---------------------

          CLK25_DIVIDER               =>       5, 
          CLKINDC_B                   =>       TRUE,
          CLKRCV_TRST                 =>       TRUE,
          OOB_CLK_DIVIDER             =>       4,
          OVERSAMPLE_MODE             =>       FALSE,
          PLL_COM_CFG                 =>       x"21680a",
          PLL_CP_CFG                  =>       x"00",
          PLL_DIVSEL_FB               =>       4,
          PLL_DIVSEL_REF              =>       1,
          PLL_FB_DCCEN                =>       FALSE,
          PLL_LKDET_CFG               =>       "101",
          PLL_TDCC_CFG                =>       "000",
          PMA_COM_CFG                 =>       x"000000000000000000",


          --____________________ Transmit Interface Attributes ___________________


          ------------------- TX Buffering and Phase Alignment -------------------   

          TX_BUFFER_USE_0             =>       FALSE,
          TX_XCLK_SEL_0               =>       "TXUSR",
          TXRX_INVERT_0               =>       "111",        

          TX_BUFFER_USE_1             =>       FALSE,
          TX_XCLK_SEL_1               =>       "TXUSR",
          TXRX_INVERT_1               =>       "111",        

          --------------------- TX Gearbox Settings -----------------------------

          GEARBOX_ENDEC_0             =>       "000", 
          TXGEARBOX_USE_0            =>        FALSE,

          GEARBOX_ENDEC_1            =>        "000", 
          TXGEARBOX_USE_1            =>        FALSE,

          --------------------- TX Serial Line Rate settings ---------------------   

          PLL_TXDIVSEL_OUT_0          =>       4,

          PLL_TXDIVSEL_OUT_1          =>       4,

          --------------------- TX Driver and OOB signalling --------------------  

          CM_TRIM_0                   =>       "10",
          PMA_TX_CFG_0                =>       x"80082",
          TX_DETECT_RX_CFG_0          =>       x"1832",
          TX_IDLE_DELAY_0             =>       "010",

          CM_TRIM_1                   =>       "10",
          PMA_TX_CFG_1                =>       x"80082",
          TX_DETECT_RX_CFG_1          =>       x"1832",
          TX_IDLE_DELAY_1             =>       "010",

          ------------------ TX Pipe Control for PCI Express/SATA ---------------

          COM_BURST_VAL_0             =>       "1111",

          COM_BURST_VAL_1             =>       "1111",
          --_______________________ Receive Interface Attributes ________________


          ------------ RX Driver,OOB signalling,Coupling and Eq,CDR -------------  

          AC_CAP_DIS_0                =>       TRUE,
          OOBDETECT_THRESHOLD_0       =>       "111",
          PMA_CDR_SCAN_0              =>       x"6404035",
          PMA_RX_CFG_0                =>       x"0f44088",
          RCV_TERM_GND_0              =>       FALSE,
          RCV_TERM_VTTRX_0            =>       FALSE,
          TERMINATION_IMP_0           =>       50,

          AC_CAP_DIS_1                =>       TRUE,
          OOBDETECT_THRESHOLD_1       =>       "111",
          PMA_CDR_SCAN_1              =>       x"6404035",
          PMA_RX_CFG_1                =>       x"0f44088",  
          RCV_TERM_GND_1              =>       FALSE,
          RCV_TERM_VTTRX_1            =>       FALSE,
          TERMINATION_IMP_1           =>       50,

          TERMINATION_CTRL            =>       "10100",
          TERMINATION_OVRD            =>       FALSE,

          ---------------- RX Decision Feedback Equalizer(DFE)  ----------------  

          DFE_CFG_0                   =>       "1001111011",
                   
          DFE_CFG_1                   =>       "1001111011",

          DFE_CAL_TIME                =>       "00110",

          --------------------- RX Serial Line Rate Attributes ------------------   

          PLL_RXDIVSEL_OUT_0          =>       4,
          PLL_SATA_0                  =>       FALSE,

          PLL_RXDIVSEL_OUT_1          =>       4,
          PLL_SATA_1                  =>       FALSE,

          ----------------------- PRBS Detection Attributes ---------------------  

          PRBS_ERR_THRESHOLD_0        =>       x"00000001",

          PRBS_ERR_THRESHOLD_1        =>       x"00000001",

          ---------------- Comma Detection and Alignment Attributes -------------  

          ALIGN_COMMA_WORD_0          =>       1,
          COMMA_10B_ENABLE_0          =>       "0001111111",
          COMMA_DOUBLE_0              =>       FALSE,
          DEC_MCOMMA_DETECT_0         =>       FALSE,
          DEC_PCOMMA_DETECT_0         =>       FALSE,
          DEC_VALID_COMMA_ONLY_0      =>       FALSE,
          MCOMMA_10B_VALUE_0          =>       "1010000011",
          MCOMMA_DETECT_0             =>       FALSE,
          PCOMMA_10B_VALUE_0          =>       "0101111100",
          PCOMMA_DETECT_0             =>       FALSE,
          RX_SLIDE_MODE_0             =>       "PCS",

          ALIGN_COMMA_WORD_1          =>       1,
          COMMA_10B_ENABLE_1          =>       "0001111111",
          COMMA_DOUBLE_1              =>       FALSE,
          DEC_MCOMMA_DETECT_1         =>       FALSE,
          DEC_PCOMMA_DETECT_1         =>       FALSE,
          DEC_VALID_COMMA_ONLY_1      =>       FALSE,
          MCOMMA_10B_VALUE_1          =>       "1010000011",
          MCOMMA_DETECT_1             =>       FALSE,
          PCOMMA_10B_VALUE_1          =>       "0101111100",
          PCOMMA_DETECT_1             =>       FALSE,
          RX_SLIDE_MODE_1             =>       "PCS",

          ------------------ RX Loss-of-sync State Machine Attributes -----------  

          RX_LOSS_OF_SYNC_FSM_0       =>       FALSE,
          RX_LOS_INVALID_INCR_0       =>       8,
          RX_LOS_THRESHOLD_0          =>       128,

          RX_LOSS_OF_SYNC_FSM_1       =>       FALSE,
          RX_LOS_INVALID_INCR_1       =>       8,
          RX_LOS_THRESHOLD_1          =>       128,

          --------------------- RX Gearbox Settings -----------------------------

          RXGEARBOX_USE_0             =>       FALSE,

          RXGEARBOX_USE_1             =>       FALSE,

          -------------- RX Elastic Buffer and Phase alignment Attributes -------   

          PMA_RXSYNC_CFG_0            =>       x"00",
          RX_BUFFER_USE_0             =>       FALSE,
          RX_XCLK_SEL_0               =>       "RXUSR",

          PMA_RXSYNC_CFG_1            =>       x"00",
          RX_BUFFER_USE_1             =>       FALSE,
          RX_XCLK_SEL_1               =>       "RXUSR",                   

          ------------------------ Clock Correction Attributes ------------------   

          CLK_CORRECT_USE_0           =>       FALSE,
          CLK_COR_ADJ_LEN_0           =>       2,
          CLK_COR_DET_LEN_0           =>       2,
          CLK_COR_INSERT_IDLE_FLAG_0  =>       FALSE,
          CLK_COR_KEEP_IDLE_0         =>       FALSE,
          CLK_COR_MAX_LAT_0           =>       20,
          CLK_COR_MIN_LAT_0           =>       16,
          CLK_COR_PRECEDENCE_0        =>       TRUE,
          CLK_COR_REPEAT_WAIT_0       =>       0,
          CLK_COR_SEQ_1_1_0           =>       "0000000000",
          CLK_COR_SEQ_1_2_0           =>       "0000000000",
          CLK_COR_SEQ_1_3_0           =>       "0000000000",
          CLK_COR_SEQ_1_4_0           =>       "0000000000",
          CLK_COR_SEQ_1_ENABLE_0      =>       "0000",
          CLK_COR_SEQ_2_1_0           =>       "0000000000",
          CLK_COR_SEQ_2_2_0           =>       "0000000000",
          CLK_COR_SEQ_2_3_0           =>       "0000000000",
          CLK_COR_SEQ_2_4_0           =>       "0000000000",
          CLK_COR_SEQ_2_ENABLE_0      =>       "0000",
          CLK_COR_SEQ_2_USE_0         =>       FALSE,
          RX_DECODE_SEQ_MATCH_0       =>       FALSE,

          CLK_CORRECT_USE_1           =>       FALSE,
          CLK_COR_ADJ_LEN_1           =>       2,
          CLK_COR_DET_LEN_1           =>       2,
          CLK_COR_INSERT_IDLE_FLAG_1  =>       FALSE,
          CLK_COR_KEEP_IDLE_1         =>       FALSE,
          CLK_COR_MAX_LAT_1           =>       20,
          CLK_COR_MIN_LAT_1           =>       16,
          CLK_COR_PRECEDENCE_1        =>       TRUE,
          CLK_COR_REPEAT_WAIT_1       =>       0,
          CLK_COR_SEQ_1_1_1           =>       "0000000000",
          CLK_COR_SEQ_1_2_1           =>       "0000000000",
          CLK_COR_SEQ_1_3_1           =>       "0000000000",
          CLK_COR_SEQ_1_4_1           =>       "0000000000",
          CLK_COR_SEQ_1_ENABLE_1      =>       "0000",
          CLK_COR_SEQ_2_1_1           =>       "0000000000",
          CLK_COR_SEQ_2_2_1           =>       "0000000000",
          CLK_COR_SEQ_2_3_1           =>       "0000000000",
          CLK_COR_SEQ_2_4_1           =>       "0000000000",
          CLK_COR_SEQ_2_ENABLE_1      =>       "0000",
          CLK_COR_SEQ_2_USE_1         =>       FALSE,
          RX_DECODE_SEQ_MATCH_1       =>       FALSE,

          ------------------------ Channel Bonding Attributes -------------------   

          CB2_INH_CC_PERIOD_0         =>       8,
          CHAN_BOND_1_MAX_SKEW_0      =>       1,
          CHAN_BOND_2_MAX_SKEW_0      =>       1,
          CHAN_BOND_KEEP_ALIGN_0      =>       FALSE,
          CHAN_BOND_LEVEL_0           =>       0,
          CHAN_BOND_MODE_0            =>       "OFF",
          CHAN_BOND_SEQ_1_1_0         =>       "0000000000",
          CHAN_BOND_SEQ_1_2_0         =>       "0000000000",
          CHAN_BOND_SEQ_1_3_0         =>       "0000000000",
          CHAN_BOND_SEQ_1_4_0         =>       "0000000000",
          CHAN_BOND_SEQ_1_ENABLE_0    =>       "0000",
          CHAN_BOND_SEQ_2_1_0         =>       "0000000000",
          CHAN_BOND_SEQ_2_2_0         =>       "0000000000",
          CHAN_BOND_SEQ_2_3_0         =>       "0000000000",
          CHAN_BOND_SEQ_2_4_0         =>       "0000000000",
          CHAN_BOND_SEQ_2_ENABLE_0    =>       "0000",
          CHAN_BOND_SEQ_2_USE_0       =>       FALSE,  
          CHAN_BOND_SEQ_LEN_0         =>       1,
          PCI_EXPRESS_MODE_0          =>       FALSE,   
       
          CB2_INH_CC_PERIOD_1         =>       8,
          CHAN_BOND_1_MAX_SKEW_1      =>       1,
          CHAN_BOND_2_MAX_SKEW_1      =>       1,
          CHAN_BOND_KEEP_ALIGN_1      =>       FALSE,
          CHAN_BOND_LEVEL_1           =>       0,
          CHAN_BOND_MODE_1            =>       "OFF",
          CHAN_BOND_SEQ_1_1_1         =>       "0000000000",
          CHAN_BOND_SEQ_1_2_1         =>       "0000000000",
          CHAN_BOND_SEQ_1_3_1         =>       "0000000000",
          CHAN_BOND_SEQ_1_4_1         =>       "0000000000",
          CHAN_BOND_SEQ_1_ENABLE_1    =>       "0000",
          CHAN_BOND_SEQ_2_1_1         =>       "0000000000",
          CHAN_BOND_SEQ_2_2_1         =>       "0000000000",
          CHAN_BOND_SEQ_2_3_1         =>       "0000000000",
          CHAN_BOND_SEQ_2_4_1         =>       "0000000000",
          CHAN_BOND_SEQ_2_ENABLE_1    =>       "0000",
          CHAN_BOND_SEQ_2_USE_1       =>       FALSE,  
          CHAN_BOND_SEQ_LEN_1         =>       1,
          PCI_EXPRESS_MODE_1          =>       FALSE,

          -------- RX Attributes to Control Reset after Electrical Idle  ------

          RX_EN_IDLE_HOLD_DFE_0       =>       TRUE,
          RX_EN_IDLE_RESET_BUF_0      =>       TRUE,
          RX_IDLE_HI_CNT_0            =>       "1000",
          RX_IDLE_LO_CNT_0            =>       "0000",

          RX_EN_IDLE_HOLD_DFE_1       =>       TRUE,
          RX_EN_IDLE_RESET_BUF_1      =>       TRUE,
          RX_IDLE_HI_CNT_1            =>       "1000",
          RX_IDLE_LO_CNT_1            =>       "0000",


          CDR_PH_ADJ_TIME             =>       "01010",
          RX_EN_IDLE_RESET_FR         =>       TRUE,
          RX_EN_IDLE_HOLD_CDR         =>       FALSE,
          RX_EN_IDLE_RESET_PH         =>       TRUE,

          ------------------ RX Attributes for PCI Express/SATA ---------------

          RX_STATUS_FMT_0             =>       "PCIE",
          SATA_BURST_VAL_0            =>       "100",
          SATA_IDLE_VAL_0             =>       "100",
          SATA_MAX_BURST_0            =>       9,
          SATA_MAX_INIT_0             =>       27,
          SATA_MAX_WAKE_0             =>       9,
          SATA_MIN_BURST_0            =>       5,
          SATA_MIN_INIT_0             =>       15,
          SATA_MIN_WAKE_0             =>       5,
          TRANS_TIME_FROM_P2_0        =>       x"003c",
          TRANS_TIME_NON_P2_0         =>       x"0019",
          TRANS_TIME_TO_P2_0          =>       x"0064",

          RX_STATUS_FMT_1             =>       "PCIE",
          SATA_BURST_VAL_1            =>       "100",
          SATA_IDLE_VAL_1             =>       "100",
          SATA_MAX_BURST_1            =>       9,
          SATA_MAX_INIT_1             =>       27,
          SATA_MAX_WAKE_1             =>       9,
          SATA_MIN_BURST_1            =>       5,
          SATA_MIN_INIT_1             =>       15,
          SATA_MIN_WAKE_1             =>       5,
          TRANS_TIME_FROM_P2_1        =>       x"003c",
          TRANS_TIME_NON_P2_1         =>       x"0019",
          TRANS_TIME_TO_P2_1          =>       x"0064"
      ) 
      port map 
      (
          ------------------------ Loopback and Powerdown Ports ----------------------
          LOOPBACK0                       =>      tied_to_ground_vec_i(2 downto 0),
          LOOPBACK1                       =>      tied_to_ground_vec_i(2 downto 0),
          RXPOWERDOWN0                    =>      tied_to_ground_vec_i(1 downto 0),
          RXPOWERDOWN1                    =>      tied_to_ground_vec_i(1 downto 0),
          TXPOWERDOWN0                    =>      tied_to_ground_vec_i(1 downto 0),
          TXPOWERDOWN1                    =>      tied_to_ground_vec_i(1 downto 0),
          -------------- Receive Ports - 64b66b and 64b67b Gearbox Ports -------------
          RXDATAVALID0                    =>      open,
          RXDATAVALID1                    =>      open,
          RXGEARBOXSLIP0                  =>      tied_to_ground_i,
          RXGEARBOXSLIP1                  =>      tied_to_ground_i,
          RXHEADER0                       =>      open,
          RXHEADER1                       =>      open,
          RXHEADERVALID0                  =>      open,
          RXHEADERVALID1                  =>      open,
          RXSTARTOFSEQ0                   =>      open,
          RXSTARTOFSEQ1                   =>      open,
          ----------------------- Receive Ports - 8b10b Decoder ----------------------
          RXCHARISCOMMA0                  =>      open,
          RXCHARISCOMMA1                  =>      open,
          RXCHARISK0                      =>      rxcharisk0_i,
          RXCHARISK1                      =>      rxcharisk1_i,
          RXDEC8B10BUSE0                  =>      tied_to_ground_i,
          RXDEC8B10BUSE1                  =>      tied_to_ground_i,
          RXDISPERR0                      =>      rxdisperr0_i,
          RXDISPERR1                      =>      rxdisperr1_i,
          RXNOTINTABLE0                   =>      open,
          RXNOTINTABLE1                   =>      open,
          RXRUNDISP0                      =>      open,
          RXRUNDISP1                      =>      open,
          ------------------- Receive Ports - Channel Bonding Ports ------------------
          RXCHANBONDSEQ0                  =>      open,
          RXCHANBONDSEQ1                  =>      open,
          RXCHBONDI0                      =>      tied_to_ground_vec_i(3 downto 0),
          RXCHBONDI1                      =>      tied_to_ground_vec_i(3 downto 0),
          RXCHBONDO0                      =>      open,
          RXCHBONDO1                      =>      open,
          RXENCHANSYNC0                   =>      tied_to_ground_i,
          RXENCHANSYNC1                   =>      tied_to_ground_i,
          ------------------- Receive Ports - Clock Correction Ports -----------------
          RXCLKCORCNT0                    =>      open,
          RXCLKCORCNT1                    =>      open,
          --------------- Receive Ports - Comma Detection and Alignment --------------
          RXBYTEISALIGNED0                =>      open,
          RXBYTEISALIGNED1                =>      open,
          RXBYTEREALIGN0                  =>      open,
          RXBYTEREALIGN1                  =>      open,
          RXCOMMADET0                     =>      open,
          RXCOMMADET1                     =>      open,
          RXCOMMADETUSE0                  =>      tied_to_vcc_i,
          RXCOMMADETUSE1                  =>      tied_to_vcc_i,
          RXENMCOMMAALIGN0                =>      tied_to_ground_i,
          RXENMCOMMAALIGN1                =>      tied_to_ground_i,
          RXENPCOMMAALIGN0                =>      tied_to_ground_i,
          RXENPCOMMAALIGN1                =>      tied_to_ground_i,
          RXSLIDE0                        =>      bitslip,
          RXSLIDE1                        =>      bitslip,
          ----------------------- Receive Ports - PRBS Detection ---------------------
          PRBSCNTRESET0                   =>      tied_to_ground_i,
          PRBSCNTRESET1                   =>      tied_to_ground_i,
          RXENPRBSTST0                    =>      tied_to_ground_vec_i(1 downto 0),
          RXENPRBSTST1                    =>      tied_to_ground_vec_i(1 downto 0),
          RXPRBSERR0                      =>      open,
          RXPRBSERR1                      =>      open,
          ------------------- Receive Ports - RX Data Path interface -----------------
          RXDATA0                         =>      rxdata0_i,
          RXDATA1                         =>      rxdata1_i,
          RXDATAWIDTH0                    =>      "00",
          RXDATAWIDTH1                    =>      "00",
          RXRECCLK0                       =>      rx_rec_clk0_int,
          RXRECCLK1                       =>      rx_rec_clk1_int,
          RXRESET0                        =>      rx_rst_int,
          RXRESET1                        =>      rx_rst_int,
          RXUSRCLK0                       =>      rx_usrclk_int,
          RXUSRCLK1                       =>      rx_usrclk_int,
          RXUSRCLK20                      =>      rx_usrclk2_int,
          RXUSRCLK21                      =>      rx_usrclk2_int,
          ------------ Receive Ports - RX Decision Feedback Equalizer(DFE) -----------
          DFECLKDLYADJ0                   =>      tied_to_ground_vec_i(5 downto 0),
          DFECLKDLYADJ1                   =>      tied_to_ground_vec_i(5 downto 0),
          DFECLKDLYADJMONITOR0            =>      open,
          DFECLKDLYADJMONITOR1            =>      open,
          DFEEYEDACMONITOR0               =>      open,
          DFEEYEDACMONITOR1               =>      open,
          DFESENSCAL0                     =>      open,
          DFESENSCAL1                     =>      open,
          DFETAP10                        =>      tied_to_ground_vec_i(4 downto 0),
          DFETAP11                        =>      tied_to_ground_vec_i(4 downto 0),
          DFETAP1MONITOR0                 =>      open,
          DFETAP1MONITOR1                 =>      open,
          DFETAP20                        =>      tied_to_ground_vec_i(4 downto 0),
          DFETAP21                        =>      tied_to_ground_vec_i(4 downto 0),
          DFETAP2MONITOR0                 =>      open,
          DFETAP2MONITOR1                 =>      open,
          DFETAP30                        =>      tied_to_ground_vec_i(3 downto 0),
          DFETAP31                        =>      tied_to_ground_vec_i(3 downto 0),
          DFETAP3MONITOR0                 =>      open,
          DFETAP3MONITOR1                 =>      open,
          DFETAP40                        =>      tied_to_ground_vec_i(3 downto 0),
          DFETAP41                        =>      tied_to_ground_vec_i(3 downto 0),
          DFETAP4MONITOR0                 =>      open,
          DFETAP4MONITOR1                 =>      open,
          ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
          RXCDRRESET0                     =>      tied_to_ground_i,
          RXCDRRESET1                     =>      tied_to_ground_i,
          RXELECIDLE0                     =>      open,
          RXELECIDLE1                     =>      open,
          RXENEQB0                        =>      tied_to_ground_i,
          RXENEQB1                        =>      tied_to_ground_i,
          RXEQMIX0                        =>      "11",
          RXEQMIX1                        =>      "11",
          RXEQPOLE0                       =>      "0000",
          RXEQPOLE1                       =>      "0000",
          RXN0                            =>      rx_in0_n,
          RXN1                            =>      rx_in1_n,
          RXP0                            =>      rx_in0_p,
          RXP1                            =>      rx_in1_p,
          -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
          RXBUFRESET0                     =>      tied_to_ground_i,
          RXBUFRESET1                     =>      tied_to_ground_i,
          RXBUFSTATUS0                    =>      open,
          RXBUFSTATUS1                    =>      open,
          RXCHANISALIGNED0                =>      open,
          RXCHANISALIGNED1                =>      open,
          RXCHANREALIGN0                  =>      open,
          RXCHANREALIGN1                  =>      open,
          RXENPMAPHASEALIGN0              =>      tied_to_ground_i,
          RXENPMAPHASEALIGN1              =>      tied_to_ground_i,
          RXPMASETPHASE0                  =>      tied_to_ground_i,
          RXPMASETPHASE1                  =>      tied_to_ground_i,
          RXSTATUS0                       =>      open,
          RXSTATUS1                       =>      open,
          --------------- Receive Ports - RX Loss-of-sync State Machine --------------
          RXLOSSOFSYNC0                   =>      open,
          RXLOSSOFSYNC1                   =>      open,
          ---------------------- Receive Ports - RX Oversampling ---------------------
          RXENSAMPLEALIGN0                =>      tied_to_ground_i,
          RXENSAMPLEALIGN1                =>      tied_to_ground_i,
          RXOVERSAMPLEERR0                =>      open,
          RXOVERSAMPLEERR1                =>      open,
          -------------- Receive Ports - RX Pipe Control for PCI Express -------------
          PHYSTATUS0                      =>      open,
          PHYSTATUS1                      =>      open,
          RXVALID0                        =>      open,
          RXVALID1                        =>      open,
          ----------------- Receive Ports - RX Polarity Control Ports ----------------
          RXPOLARITY0                     =>      tied_to_ground_i,
          RXPOLARITY1                     =>      tied_to_ground_i,
          ------------- Shared Ports - Dynamic Reconfiguration Port (DRP) ------------
          DADDR                           =>      tied_to_ground_vec_i(6 downto 0),
          DCLK                            =>      tied_to_ground_i,
          DEN                             =>      tied_to_ground_i,
          DI                              =>      tied_to_ground_vec_i(15 downto 0),
          DO                              =>      open,
          DRDY                            =>      open,
          DWE                             =>      tied_to_ground_i,
          --------------------- Shared Ports - Tile and PLL Ports --------------------
          CLKIN                           =>      clk_125,
          GTXRESET                        =>      rst_125,
          GTXTEST                         =>      "10000000000000",
          INTDATAWIDTH                    =>      tied_to_vcc_i,
          PLLLKDET                        =>      ref_clk_lock_int,
          PLLLKDETEN                      =>      tied_to_vcc_i,
          PLLPOWERDOWN                    =>      tied_to_ground_i,
          REFCLKOUT                       =>      ref_clk_int,
          REFCLKPWRDNB                    =>      tied_to_vcc_i,
          RESETDONE0                      =>      rst_done0_int,
          RESETDONE1                      =>      rst_done1_int,
          -------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
          TXGEARBOXREADY0                 =>      open,
          TXGEARBOXREADY1                 =>      open,
          TXHEADER0                       =>      tied_to_ground_vec_i(2 downto 0),
          TXHEADER1                       =>      tied_to_ground_vec_i(2 downto 0),
          TXSEQUENCE0                     =>      tied_to_ground_vec_i(6 downto 0),
          TXSEQUENCE1                     =>      tied_to_ground_vec_i(6 downto 0),
          TXSTARTSEQ0                     =>      tied_to_ground_i,
          TXSTARTSEQ1                     =>      tied_to_ground_i,
          ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
          TXBYPASS8B10B0                  =>      tied_to_ground_vec_i(3 downto 0),
          TXBYPASS8B10B1                  =>      tied_to_ground_vec_i(3 downto 0),
          TXCHARDISPMODE0                 =>      txchardispmode0_i,
          TXCHARDISPMODE1                 =>      txchardispmode1_i,
          TXCHARDISPVAL0                  =>      txchardispval0_i,
          TXCHARDISPVAL1                  =>      txchardispval1_i,
          TXCHARISK0                      =>      tied_to_ground_vec_i(3 downto 0),
          TXCHARISK1                      =>      tied_to_ground_vec_i(3 downto 0),
          TXENC8B10BUSE0                  =>      tied_to_ground_i,
          TXENC8B10BUSE1                  =>      tied_to_ground_i,
          TXKERR0                         =>      open,
          TXKERR1                         =>      open,
          TXRUNDISP0                      =>      open,
          TXRUNDISP1                      =>      open,
          ------------- Transmit Ports - TX Buffering and Phase Alignment ------------
          TXBUFSTATUS0                    =>      open,
          TXBUFSTATUS1                    =>      open,
          ------------------ Transmit Ports - TX Data Path interface -----------------
          TXDATA0                         =>      txdata0_i,
          TXDATA1                         =>      txdata1_i,
          TXDATAWIDTH0                    =>      "00",
          TXDATAWIDTH1                    =>      "00",
          TXOUTCLK0                       =>      open,
          TXOUTCLK1                       =>      open,
          TXRESET0                        =>      tx_rst_int,
          TXRESET1                        =>      tx_rst_int,
          TXUSRCLK0                       =>      tx_usrclk_int,
          TXUSRCLK1                       =>      tx_usrclk_int,
          TXUSRCLK20                      =>      tx_usrclk2_int,
          TXUSRCLK21                      =>      tx_usrclk2_int,
          --------------- Transmit Ports - TX Driver and OOB signalling --------------
          TXBUFDIFFCTRL0                  =>      "101",
          TXBUFDIFFCTRL1                  =>      "101",
          TXDIFFCTRL0                     =>      "000",
          TXDIFFCTRL1                     =>      "000",
          TXINHIBIT0                      =>      tied_to_ground_i,
          TXINHIBIT1                      =>      tied_to_ground_i,
          TXN0                            =>      tx_out0_n,
          TXN1                            =>      tx_out1_n,
          TXP0                            =>      tx_out0_p,
          TXP1                            =>      tx_out1_p,
          TXPREEMPHASIS0                  =>      "0000",
          TXPREEMPHASIS1                  =>      "0000",
          -------- Transmit Ports - TX Elastic Buffer and Phase Alignment Ports ------
          TXENPMAPHASEALIGN0              =>      tied_to_ground_i,
          TXENPMAPHASEALIGN1              =>      tied_to_ground_i,
          TXPMASETPHASE0                  =>      tied_to_ground_i,
          TXPMASETPHASE1                  =>      tied_to_ground_i,
          --------------------- Transmit Ports - TX PRBS Generator -------------------
          TXENPRBSTST0                    =>      tied_to_ground_vec_i(1 downto 0),
          TXENPRBSTST1                    =>      tied_to_ground_vec_i(1 downto 0),
          -------------------- Transmit Ports - TX Polarity Control ------------------
          TXPOLARITY0                     =>      tied_to_ground_i,
          TXPOLARITY1                     =>      tied_to_ground_i,
          ----------------- Transmit Ports - TX Ports for PCI Express ----------------
          TXDETECTRX0                     =>      tied_to_ground_i,
          TXDETECTRX1                     =>      tied_to_ground_i,
          TXELECIDLE0                     =>      tied_to_ground_i,
          TXELECIDLE1                     =>      tied_to_ground_i,
          --------------------- Transmit Ports - TX Ports for SATA -------------------
          TXCOMSTART0                     =>      tied_to_ground_i,
          TXCOMSTART1                     =>      tied_to_ground_i,
          TXCOMTYPE0                      =>      tied_to_ground_i,
          TXCOMTYPE1                      =>      tied_to_ground_i
        );
    end generate;

end architecture ;


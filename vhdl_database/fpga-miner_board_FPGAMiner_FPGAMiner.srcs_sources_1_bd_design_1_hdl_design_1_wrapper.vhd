--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
--Date        : Wed Jun  6 13:31:22 2018
--Host        : hp-laptop running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    an : out STD_LOGIC_VECTOR ( 7 downto 0 );
    cellular_ram_addr : out STD_LOGIC_VECTOR ( 22 downto 0 );
    cellular_ram_adv_ldn : out STD_LOGIC;
    cellular_ram_ben : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cellular_ram_ce_n : out STD_LOGIC;
    cellular_ram_cre : out STD_LOGIC;
    cellular_ram_dq_io : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    cellular_ram_oen : out STD_LOGIC;
    cellular_ram_wait : in STD_LOGIC;
    cellular_ram_wen : out STD_LOGIC;
    dp : out STD_LOGIC;
    eth_mdio_mdc_mdc : out STD_LOGIC;
    eth_mdio_mdc_mdio_io : inout STD_LOGIC;
    eth_ref_clk : out STD_LOGIC;
    eth_rmii_crs_dv : in STD_LOGIC;
    eth_rmii_rx_er : in STD_LOGIC;
    eth_rmii_rxd : in STD_LOGIC_VECTOR ( 1 downto 0 );
    eth_rmii_tx_en : out STD_LOGIC;
    eth_rmii_txd : out STD_LOGIC_VECTOR ( 1 downto 0 );
    led : out STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC;
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    sys_clock : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    cellular_ram_addr : out STD_LOGIC_VECTOR ( 22 downto 0 );
    cellular_ram_adv_ldn : out STD_LOGIC;
    cellular_ram_ben : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cellular_ram_ce_n : out STD_LOGIC;
    cellular_ram_cre : out STD_LOGIC;
    cellular_ram_dq_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cellular_ram_dq_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cellular_ram_dq_t : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cellular_ram_oen : out STD_LOGIC;
    cellular_ram_wait : in STD_LOGIC;
    cellular_ram_wen : out STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC;
    eth_rmii_crs_dv : in STD_LOGIC;
    eth_rmii_rx_er : in STD_LOGIC;
    eth_rmii_rxd : in STD_LOGIC_VECTOR ( 1 downto 0 );
    eth_rmii_tx_en : out STD_LOGIC;
    eth_rmii_txd : out STD_LOGIC_VECTOR ( 1 downto 0 );
    eth_mdio_mdc_mdc : out STD_LOGIC;
    eth_mdio_mdc_mdio_i : in STD_LOGIC;
    eth_mdio_mdc_mdio_o : out STD_LOGIC;
    eth_mdio_mdc_mdio_t : out STD_LOGIC;
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    eth_ref_clk : out STD_LOGIC;
    an : out STD_LOGIC_VECTOR ( 7 downto 0 );
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    dp : out STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal cellular_ram_dq_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal cellular_ram_dq_i_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal cellular_ram_dq_i_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal cellular_ram_dq_i_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal cellular_ram_dq_i_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal cellular_ram_dq_i_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal cellular_ram_dq_i_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal cellular_ram_dq_i_15 : STD_LOGIC_VECTOR ( 15 to 15 );
  signal cellular_ram_dq_i_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal cellular_ram_dq_i_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal cellular_ram_dq_i_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal cellular_ram_dq_i_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal cellular_ram_dq_i_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal cellular_ram_dq_i_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal cellular_ram_dq_i_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal cellular_ram_dq_i_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal cellular_ram_dq_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal cellular_ram_dq_io_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal cellular_ram_dq_io_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal cellular_ram_dq_io_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal cellular_ram_dq_io_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal cellular_ram_dq_io_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal cellular_ram_dq_io_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal cellular_ram_dq_io_15 : STD_LOGIC_VECTOR ( 15 to 15 );
  signal cellular_ram_dq_io_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal cellular_ram_dq_io_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal cellular_ram_dq_io_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal cellular_ram_dq_io_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal cellular_ram_dq_io_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal cellular_ram_dq_io_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal cellular_ram_dq_io_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal cellular_ram_dq_io_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal cellular_ram_dq_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal cellular_ram_dq_o_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal cellular_ram_dq_o_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal cellular_ram_dq_o_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal cellular_ram_dq_o_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal cellular_ram_dq_o_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal cellular_ram_dq_o_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal cellular_ram_dq_o_15 : STD_LOGIC_VECTOR ( 15 to 15 );
  signal cellular_ram_dq_o_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal cellular_ram_dq_o_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal cellular_ram_dq_o_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal cellular_ram_dq_o_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal cellular_ram_dq_o_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal cellular_ram_dq_o_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal cellular_ram_dq_o_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal cellular_ram_dq_o_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal cellular_ram_dq_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal cellular_ram_dq_t_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal cellular_ram_dq_t_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal cellular_ram_dq_t_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal cellular_ram_dq_t_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal cellular_ram_dq_t_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal cellular_ram_dq_t_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal cellular_ram_dq_t_15 : STD_LOGIC_VECTOR ( 15 to 15 );
  signal cellular_ram_dq_t_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal cellular_ram_dq_t_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal cellular_ram_dq_t_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal cellular_ram_dq_t_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal cellular_ram_dq_t_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal cellular_ram_dq_t_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal cellular_ram_dq_t_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal cellular_ram_dq_t_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal eth_mdio_mdc_mdio_i : STD_LOGIC;
  signal eth_mdio_mdc_mdio_o : STD_LOGIC;
  signal eth_mdio_mdc_mdio_t : STD_LOGIC;
begin
cellular_ram_dq_iobuf_0: component IOBUF
     port map (
      I => cellular_ram_dq_o_0(0),
      IO => cellular_ram_dq_io(0),
      O => cellular_ram_dq_i_0(0),
      T => cellular_ram_dq_t_0(0)
    );
cellular_ram_dq_iobuf_1: component IOBUF
     port map (
      I => cellular_ram_dq_o_1(1),
      IO => cellular_ram_dq_io(1),
      O => cellular_ram_dq_i_1(1),
      T => cellular_ram_dq_t_1(1)
    );
cellular_ram_dq_iobuf_10: component IOBUF
     port map (
      I => cellular_ram_dq_o_10(10),
      IO => cellular_ram_dq_io(10),
      O => cellular_ram_dq_i_10(10),
      T => cellular_ram_dq_t_10(10)
    );
cellular_ram_dq_iobuf_11: component IOBUF
     port map (
      I => cellular_ram_dq_o_11(11),
      IO => cellular_ram_dq_io(11),
      O => cellular_ram_dq_i_11(11),
      T => cellular_ram_dq_t_11(11)
    );
cellular_ram_dq_iobuf_12: component IOBUF
     port map (
      I => cellular_ram_dq_o_12(12),
      IO => cellular_ram_dq_io(12),
      O => cellular_ram_dq_i_12(12),
      T => cellular_ram_dq_t_12(12)
    );
cellular_ram_dq_iobuf_13: component IOBUF
     port map (
      I => cellular_ram_dq_o_13(13),
      IO => cellular_ram_dq_io(13),
      O => cellular_ram_dq_i_13(13),
      T => cellular_ram_dq_t_13(13)
    );
cellular_ram_dq_iobuf_14: component IOBUF
     port map (
      I => cellular_ram_dq_o_14(14),
      IO => cellular_ram_dq_io(14),
      O => cellular_ram_dq_i_14(14),
      T => cellular_ram_dq_t_14(14)
    );
cellular_ram_dq_iobuf_15: component IOBUF
     port map (
      I => cellular_ram_dq_o_15(15),
      IO => cellular_ram_dq_io(15),
      O => cellular_ram_dq_i_15(15),
      T => cellular_ram_dq_t_15(15)
    );
cellular_ram_dq_iobuf_2: component IOBUF
     port map (
      I => cellular_ram_dq_o_2(2),
      IO => cellular_ram_dq_io(2),
      O => cellular_ram_dq_i_2(2),
      T => cellular_ram_dq_t_2(2)
    );
cellular_ram_dq_iobuf_3: component IOBUF
     port map (
      I => cellular_ram_dq_o_3(3),
      IO => cellular_ram_dq_io(3),
      O => cellular_ram_dq_i_3(3),
      T => cellular_ram_dq_t_3(3)
    );
cellular_ram_dq_iobuf_4: component IOBUF
     port map (
      I => cellular_ram_dq_o_4(4),
      IO => cellular_ram_dq_io(4),
      O => cellular_ram_dq_i_4(4),
      T => cellular_ram_dq_t_4(4)
    );
cellular_ram_dq_iobuf_5: component IOBUF
     port map (
      I => cellular_ram_dq_o_5(5),
      IO => cellular_ram_dq_io(5),
      O => cellular_ram_dq_i_5(5),
      T => cellular_ram_dq_t_5(5)
    );
cellular_ram_dq_iobuf_6: component IOBUF
     port map (
      I => cellular_ram_dq_o_6(6),
      IO => cellular_ram_dq_io(6),
      O => cellular_ram_dq_i_6(6),
      T => cellular_ram_dq_t_6(6)
    );
cellular_ram_dq_iobuf_7: component IOBUF
     port map (
      I => cellular_ram_dq_o_7(7),
      IO => cellular_ram_dq_io(7),
      O => cellular_ram_dq_i_7(7),
      T => cellular_ram_dq_t_7(7)
    );
cellular_ram_dq_iobuf_8: component IOBUF
     port map (
      I => cellular_ram_dq_o_8(8),
      IO => cellular_ram_dq_io(8),
      O => cellular_ram_dq_i_8(8),
      T => cellular_ram_dq_t_8(8)
    );
cellular_ram_dq_iobuf_9: component IOBUF
     port map (
      I => cellular_ram_dq_o_9(9),
      IO => cellular_ram_dq_io(9),
      O => cellular_ram_dq_i_9(9),
      T => cellular_ram_dq_t_9(9)
    );
design_1_i: component design_1
     port map (
      an(7 downto 0) => an(7 downto 0),
      cellular_ram_addr(22 downto 0) => cellular_ram_addr(22 downto 0),
      cellular_ram_adv_ldn => cellular_ram_adv_ldn,
      cellular_ram_ben(1 downto 0) => cellular_ram_ben(1 downto 0),
      cellular_ram_ce_n => cellular_ram_ce_n,
      cellular_ram_cre => cellular_ram_cre,
      cellular_ram_dq_i(15) => cellular_ram_dq_i_15(15),
      cellular_ram_dq_i(14) => cellular_ram_dq_i_14(14),
      cellular_ram_dq_i(13) => cellular_ram_dq_i_13(13),
      cellular_ram_dq_i(12) => cellular_ram_dq_i_12(12),
      cellular_ram_dq_i(11) => cellular_ram_dq_i_11(11),
      cellular_ram_dq_i(10) => cellular_ram_dq_i_10(10),
      cellular_ram_dq_i(9) => cellular_ram_dq_i_9(9),
      cellular_ram_dq_i(8) => cellular_ram_dq_i_8(8),
      cellular_ram_dq_i(7) => cellular_ram_dq_i_7(7),
      cellular_ram_dq_i(6) => cellular_ram_dq_i_6(6),
      cellular_ram_dq_i(5) => cellular_ram_dq_i_5(5),
      cellular_ram_dq_i(4) => cellular_ram_dq_i_4(4),
      cellular_ram_dq_i(3) => cellular_ram_dq_i_3(3),
      cellular_ram_dq_i(2) => cellular_ram_dq_i_2(2),
      cellular_ram_dq_i(1) => cellular_ram_dq_i_1(1),
      cellular_ram_dq_i(0) => cellular_ram_dq_i_0(0),
      cellular_ram_dq_o(15) => cellular_ram_dq_o_15(15),
      cellular_ram_dq_o(14) => cellular_ram_dq_o_14(14),
      cellular_ram_dq_o(13) => cellular_ram_dq_o_13(13),
      cellular_ram_dq_o(12) => cellular_ram_dq_o_12(12),
      cellular_ram_dq_o(11) => cellular_ram_dq_o_11(11),
      cellular_ram_dq_o(10) => cellular_ram_dq_o_10(10),
      cellular_ram_dq_o(9) => cellular_ram_dq_o_9(9),
      cellular_ram_dq_o(8) => cellular_ram_dq_o_8(8),
      cellular_ram_dq_o(7) => cellular_ram_dq_o_7(7),
      cellular_ram_dq_o(6) => cellular_ram_dq_o_6(6),
      cellular_ram_dq_o(5) => cellular_ram_dq_o_5(5),
      cellular_ram_dq_o(4) => cellular_ram_dq_o_4(4),
      cellular_ram_dq_o(3) => cellular_ram_dq_o_3(3),
      cellular_ram_dq_o(2) => cellular_ram_dq_o_2(2),
      cellular_ram_dq_o(1) => cellular_ram_dq_o_1(1),
      cellular_ram_dq_o(0) => cellular_ram_dq_o_0(0),
      cellular_ram_dq_t(15) => cellular_ram_dq_t_15(15),
      cellular_ram_dq_t(14) => cellular_ram_dq_t_14(14),
      cellular_ram_dq_t(13) => cellular_ram_dq_t_13(13),
      cellular_ram_dq_t(12) => cellular_ram_dq_t_12(12),
      cellular_ram_dq_t(11) => cellular_ram_dq_t_11(11),
      cellular_ram_dq_t(10) => cellular_ram_dq_t_10(10),
      cellular_ram_dq_t(9) => cellular_ram_dq_t_9(9),
      cellular_ram_dq_t(8) => cellular_ram_dq_t_8(8),
      cellular_ram_dq_t(7) => cellular_ram_dq_t_7(7),
      cellular_ram_dq_t(6) => cellular_ram_dq_t_6(6),
      cellular_ram_dq_t(5) => cellular_ram_dq_t_5(5),
      cellular_ram_dq_t(4) => cellular_ram_dq_t_4(4),
      cellular_ram_dq_t(3) => cellular_ram_dq_t_3(3),
      cellular_ram_dq_t(2) => cellular_ram_dq_t_2(2),
      cellular_ram_dq_t(1) => cellular_ram_dq_t_1(1),
      cellular_ram_dq_t(0) => cellular_ram_dq_t_0(0),
      cellular_ram_oen => cellular_ram_oen,
      cellular_ram_wait => cellular_ram_wait,
      cellular_ram_wen => cellular_ram_wen,
      dp => dp,
      eth_mdio_mdc_mdc => eth_mdio_mdc_mdc,
      eth_mdio_mdc_mdio_i => eth_mdio_mdc_mdio_i,
      eth_mdio_mdc_mdio_o => eth_mdio_mdc_mdio_o,
      eth_mdio_mdc_mdio_t => eth_mdio_mdc_mdio_t,
      eth_ref_clk => eth_ref_clk,
      eth_rmii_crs_dv => eth_rmii_crs_dv,
      eth_rmii_rx_er => eth_rmii_rx_er,
      eth_rmii_rxd(1 downto 0) => eth_rmii_rxd(1 downto 0),
      eth_rmii_tx_en => eth_rmii_tx_en,
      eth_rmii_txd(1 downto 0) => eth_rmii_txd(1 downto 0),
      led(15 downto 0) => led(15 downto 0),
      reset => reset,
      seg(6 downto 0) => seg(6 downto 0),
      sys_clock => sys_clock,
      usb_uart_rxd => usb_uart_rxd,
      usb_uart_txd => usb_uart_txd
    );
eth_mdio_mdc_mdio_iobuf: component IOBUF
     port map (
      I => eth_mdio_mdc_mdio_o,
      IO => eth_mdio_mdc_mdio_io,
      O => eth_mdio_mdc_mdio_i,
      T => eth_mdio_mdc_mdio_t
    );
end STRUCTURE;

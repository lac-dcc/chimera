--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
--Date        : Tue Jun 22 15:22:32 2021
--Host        : quadhog running 64-bit Ubuntu 18.04.5 LTS
--Command     : generate_target ProcessingSystemOnly_wrapper.bd
--Design      : ProcessingSystemOnly_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ProcessingSystemOnly_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FCLK_CLK0_0 : out STD_LOGIC;
    FCLK_RESET0_N_0 : out STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    UART1_RX_0 : in STD_LOGIC;
    UART1_TX_0 : out STD_LOGIC;
    gpio_io_o_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_io_o_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_io_o_2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_io_o_3 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end ProcessingSystemOnly_wrapper;

architecture STRUCTURE of ProcessingSystemOnly_wrapper is
  component ProcessingSystemOnly is
  port (
    FCLK_CLK0_0 : out STD_LOGIC;
    FCLK_RESET0_N_0 : out STD_LOGIC;
    UART1_RX_0 : in STD_LOGIC;
    UART1_TX_0 : out STD_LOGIC;
    gpio_io_o_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_io_o_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_io_o_2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_io_o_3 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component ProcessingSystemOnly;
begin
ProcessingSystemOnly_i: component ProcessingSystemOnly
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FCLK_CLK0_0 => FCLK_CLK0_0,
      FCLK_RESET0_N_0 => FCLK_RESET0_N_0,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      UART1_RX_0 => UART1_RX_0,
      UART1_TX_0 => UART1_TX_0,
      gpio_io_o_0(31 downto 0) => gpio_io_o_0(31 downto 0),
      gpio_io_o_1(31 downto 0) => gpio_io_o_1(31 downto 0),
      gpio_io_o_2(31 downto 0) => gpio_io_o_2(31 downto 0),
      gpio_io_o_3(31 downto 0) => gpio_io_o_3(31 downto 0)
    );
end STRUCTURE;

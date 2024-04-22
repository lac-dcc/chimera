----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
--
-- Create Date: 05.09.2014 10:19:29
-- Design Name:
-- Module Name: wishbone_i2c - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Wishbone Classic slave, I2C interface
--
--  Assumes a 156.25MHz clock.
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.parameter.all;

entity wishbone_i2c is
    port (
        -- WISHBONE CLASSIC SIGNALS
        CLK_I : in std_logic;
        RST_I : in std_logic;
        DAT_I : in std_logic_vector(31 downto 0);
        DAT_O : out std_logic_vector(31 downto 0);
        ACK_O : out std_logic;
        ADR_I : in std_logic_vector(4 downto 0);
        CYC_I : in std_logic;
        SEL_I : in std_logic_vector(3 downto 0);
        STB_I : in std_logic;
        WE_I  : in std_logic;

        -- I2C INTERFACE
        scl_pad_i     : in std_logic;
        scl_pad_o     : out std_logic;
        scl_padoen_o  : out std_logic;
        sda_pad_i     : in std_logic;
        sda_pad_o     : out std_logic;
        sda_padoen_o  : out std_logic);
end wishbone_i2c;

architecture arch_wishbone_i2c of wishbone_i2c is

    component i2c_master_top
    generic (
        ARST_LVL : std_logic := '0');                   -- asynchronous reset level
    port (
        -- wishbone signals
        wb_clk_i      : in  std_logic;                    -- master clock input
        wb_rst_i      : in  std_logic := '0';             -- synchronous active high reset
        arst_i        : in  std_logic := not ARST_LVL;    -- asynchronous reset
        wb_adr_i      : in  std_logic_vector(2 downto 0); -- lower address bits
        wb_dat_i      : in  std_logic_vector(7 downto 0); -- Databus input
        wb_dat_o      : out std_logic_vector(7 downto 0); -- Databus output
        wb_we_i       : in  std_logic;                    -- Write enable input
        wb_stb_i      : in  std_logic;                    -- Strobe signals / core select signal
        wb_cyc_i      : in  std_logic;                    -- Valid bus cycle input
        wb_ack_o      : out std_logic;                    -- Bus cycle acknowledge output
        wb_inta_o     : out std_logic;                    -- interrupt request output signal

        -- i2c lines
        scl_pad_i     : in  std_logic;                    -- i2c clock line input
        scl_pad_o     : out std_logic;                    -- i2c clock line output
        scl_padoen_o  : out std_logic;                    -- i2c clock line output enable, active low
        sda_pad_i     : in  std_logic;                    -- i2c data line input
        sda_pad_o     : out std_logic;                    -- i2c data line output
        sda_padoen_o  : out std_logic);                     -- i2c data line output enable, active low
    end component;

    signal addra : std_logic_vector(2 downto 0);
    signal dout : std_logic_vector(7 downto 0);

begin

    addra <= ADR_I(4 downto 2);

    DAT_O(7 downto 0) <= dout;
    DAT_O(31 downto 8) <= (others => '0');

-------------------------------------------------------------------------------------
-- INSTANTIATE OPEN CORES I2C CORE
-------------------------------------------------------------------------------------

    i2c_master_top_0 : i2c_master_top
    generic map(
        ARST_LVL => '1')
    port map(
        wb_clk_i      => CLK_I,
        wb_rst_i      => RST_I,
        arst_i        => '0',
        wb_adr_i      => addra,
        wb_dat_i      => DAT_I(7 downto 0),
        wb_dat_o      => dout,
        wb_we_i       => WE_I,
        wb_stb_i      => STB_I,
        wb_cyc_i      => CYC_I,
        wb_ack_o      => ACK_O,
        wb_inta_o     => open,
        scl_pad_i     => scl_pad_i,
        scl_pad_o     => scl_pad_o,
        scl_padoen_o  => scl_padoen_o,
        sda_pad_i     => sda_pad_i,
        sda_pad_o     => sda_pad_o,
        sda_padoen_o  => sda_padoen_o);

end arch_wishbone_i2c;

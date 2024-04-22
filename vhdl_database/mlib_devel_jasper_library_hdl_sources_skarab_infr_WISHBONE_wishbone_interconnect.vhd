----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
--
-- Create Date: 05.09.2014 10:19:29
-- Design Name:
-- Module Name: wishbone_interconnect - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Connects multiple Wishbone slaves to a single Wishbone master
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

entity wishbone_interconnect is
    port (
        -- WISHBONE CLASSIC SIGNALS - COMMON
        CLK_I : in std_logic;
        RST_I : in std_logic;

        -- WISHBONE CLASSIC SIGNALS - MASTER
        MST_DAT_O : in std_logic_vector(31 downto 0);
        MST_DAT_I : out std_logic_vector(31 downto 0);
        MST_ACK_I : out std_logic;
        MST_ADR_O : in std_logic_vector((C_WB_MST_ADDRESS_BITS - 1) downto 0);
        MST_CYC_O : in std_logic;
        MST_SEL_O : in std_logic_vector(3 downto 0);
        MST_STB_O : in std_logic;
        MST_WE_O  : in std_logic;

        -- WISHBONE CLASSIC SIGNALS - SLAVES
        SLV_DAT_O : in T_SLAVE_WB_DATA;
        SLV_DAT_I : out T_SLAVE_WB_DATA;
        SLV_ACK_O : in std_logic_vector(0 to (C_WB_NUM_SLAVES - 1));
        SLV_ADR_I : out T_SLAVE_WB_ADDRESS;
        SLV_CYC_I : out std_logic_vector(0 to (C_WB_NUM_SLAVES - 1));
        SLV_SEL_I : out T_SLAVE_WB_SEL;
        SLV_STB_I : out std_logic_vector(0 to (C_WB_NUM_SLAVES - 1));
        SLV_WE_I  : out std_logic_vector(0 to (C_WB_NUM_SLAVES - 1)));
end wishbone_interconnect;

architecture arch_wishbone_interconnect of wishbone_interconnect is

    signal current_slave : integer range 0 to C_WB_MAX_NUM_SLAVES;
    --AI: New signals to handle DSP address space
    signal upper_add_bits : std_logic_vector(4 downto 0);

    --attribute mark_debug : string;
    --attribute mark_debug of upper_add_bits : signal is "true";
    --attribute mark_debug of current_slave  : signal is "true";

    --attribute mark_debug of MST_ACK_I : signal is "true";
    --attribute mark_debug of MST_ADR_O : signal is "true";
    --attribute mark_debug of MST_CYC_O : signal is "true";
    --attribute mark_debug of MST_DAT_I : signal is "true";
    --attribute mark_debug of MST_DAT_O : signal is "true";
    --attribute mark_debug of MST_SEL_O : signal is "true";
    --attribute mark_debug of MST_STB_O : signal is "true";
    --attribute mark_debug of MST_WE_O  : signal is "true";

    --component ila_0
   --port(
   --     clk : IN STD_LOGIC;
   --     probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   --     probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
   --     probe2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
   --     probe3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
    --);
    --end component;
    
begin


---- ILA Instantiation
--    ILA_DEBUG_0 : ila_0
--    port map(
--        clk => CLK_I,
--        probe0 => MST_ADR_O(31 downto 0),
--        probe1 => x"000000"& "000" & upper_add_bits(4 downto 0),
--        probe2 => "0000",
--        probe3 => "0000");

    -- TRY DIRECT CONNECTIONS FIRST, RELY ON REGISTERING IN MASTER AND SLAVE

    -- DETERMINE CURRENT SLAVE BASED ON UPPER ADDRESS BITS
    --current_slave <= to_integer(unsigned(MST_ADR_O((C_WB_MST_ADDRESS_BITS - 1) downto C_WB_SLV_ADDRESS_BITS)));
    --AI: These are address bits to select slave when accessing Peralex wishbone slaves
    --upper_add_bits <= MST_ADR_O(19 downto 15);
    upper_add_bits <= MST_ADR_O(19 downto 15) when (MST_ADR_O < x"80048000" ) else
                      "01001" when (MST_ADR_O >= x"80048000" and MST_ADR_O < x"80054000") else --9 (GbE)
                      "01010" when (MST_ADR_O >= x"80054000" and MST_ADR_O < x"80060000") else --10 (40 GbE Port 0)
                      "01011" when (MST_ADR_O >= x"80060000" and MST_ADR_O < x"8006C000") else --11 (40GbE Port 1)
                      "01100" when (MST_ADR_O >= x"8006C000" and MST_ADR_O < x"80078000") else --12 (40GbE Port 2)                     
                      "01101" when (MST_ADR_O >= x"80078000" and MST_ADR_O < x"80084000") else --13 (40GbE Port 3)
                      "00000";        

    --AI: If address range is less than x"80070000" then access Peralex wishbone slave else use DSP register address scheme,
    -- which selects the arbiter. The microblaze wishbone bus base address is x"80000000"
    --current_slave <= to_integer(unsigned(upper_add_bits)) when (MST_ADR_O < x"80070000" ) else (C_WB_NUM_SLAVES - 1);
    current_slave <= to_integer(unsigned(upper_add_bits)) when (MST_ADR_O < x"80084000" ) else (C_WB_NUM_SLAVES - 1);
    
    generate_slave_connections : for a in 0 to (C_WB_NUM_SLAVES - 1) generate
        SLV_DAT_I(a) <= MST_DAT_O;
        --SLV_ADR_I(a) <= MST_ADR_O((C_WB_SLV_ADDRESS_BITS - 1) downto 0);
        SLV_ADR_I(a) <= MST_ADR_O - x"80048000" when (MST_ADR_O < x"80048000" ) else
               MST_ADR_O - x"80048000" when (MST_ADR_O >= x"80048000" and MST_ADR_O < x"80054000") else --9 (GbE)
               MST_ADR_O - x"80054000" when (MST_ADR_O >= x"80054000" and MST_ADR_O < x"80060000") else --10 (40GbE Port 0)
               MST_ADR_O - x"80060000" when (MST_ADR_O >= x"80060000" and MST_ADR_O < x"8006C000") else --11 (40GbE Port 1)
               MST_ADR_O - x"8006C000" when (MST_ADR_O >= x"8006C000" and MST_ADR_O < x"80078000") else --12 (40GbE Port 2)                     
               MST_ADR_O - x"80078000" when (MST_ADR_O >= x"80078000" and MST_ADR_O < x"80084000") else --13 (40GbE Port 3)
               MST_ADR_O;
        SLV_CYC_I(a) <= MST_CYC_O;
        SLV_SEL_I(a) <= MST_SEL_O;
        SLV_WE_I(a) <= MST_WE_O;

        -- STB SELECTED SLAVE
        SLV_STB_I(a) <= MST_STB_O when (a = current_slave) else '0';
    end generate generate_slave_connections;

    -- DEMULTIPLEX THE ACK TO THE MASTER
    MST_ACK_I <= SLV_ACK_O(current_slave);

    -- DEMULTIPLEX THE DATA TO THE MASTER
    MST_DAT_I <= SLV_DAT_O(current_slave);

end arch_wishbone_interconnect;

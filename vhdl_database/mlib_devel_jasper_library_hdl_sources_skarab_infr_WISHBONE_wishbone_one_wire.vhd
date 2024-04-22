----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
--
-- Create Date: 05.09.2014 10:19:29
-- Design Name:
-- Module Name: wishbone_one_wire - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Wishbone Classic slave, one wire interface
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

entity wishbone_one_wire is
    generic (
        NUM_ONE_WIRE_INTERFACES : integer);
    port (
        -- WISHBONE CLASSIC SIGNALS
        CLK_I : in std_logic;
        RST_I : in std_logic;
        DAT_I : in std_logic_vector(31 downto 0);
        DAT_O : out std_logic_vector(31 downto 0);
        ACK_O : out std_logic;
        ADR_I : in std_logic_vector(2 downto 0);
        CYC_I : in std_logic;
        SEL_I : in std_logic_vector(3 downto 0);
        STB_I : in std_logic;
        WE_I  : in std_logic;

        -- ONE-WIRE INTERFACES
        one_wire_pull_down_enable         : out std_logic_vector((NUM_ONE_WIRE_INTERFACES - 1) downto 0);
        one_wire_in                       : in std_logic_vector((NUM_ONE_WIRE_INTERFACES - 1) downto 0);
        one_wire_strong_pull_up_enable    : out std_logic_vector((NUM_ONE_WIRE_INTERFACES - 1) downto 0));
end wishbone_one_wire;

architecture arch_wishbone_one_wire of wishbone_one_wire is


    component sockit_owm
    generic (
        OVD_E   : integer;
        CDR_E   : integer;
        BAW     : integer;
        BDW     : integer;
        OWN     : integer;
        BTP_N   : string;
        BTP_O   : string;
        CDR_N   : integer;
        CDR_O   : integer);
    port (
        clk     : in std_logic;
        rst     : in std_logic;
        bus_ren     : in std_logic;
        bus_wen     : in std_logic;
        bus_adr     : in std_logic_vector((BAW - 1) downto 0);
        bus_wdt     : in std_logic_vector((BDW - 1) downto 0);
        bus_rdt     : out std_logic_vector((BDW - 1) downto 0);
        bus_irq     : out std_logic;
        owr_p  : out std_logic_vector((OWN - 1) downto 0);
        owr_e  : out std_logic_vector((OWN - 1) downto 0);
        owr_i  : in std_logic_vector((OWN - 1) downto 0));
    end component;

    signal bus_ren : std_logic;
    signal bus_wen : std_logic;
    signal bus_adr : std_logic_vector(0 downto 0);
    signal bus_wdt : std_logic_vector(31 downto 0);
    signal bus_rdt : std_logic_vector(31 downto 0);
    signal bus_irq : std_logic;

begin

---------------------------------------------------------------------------------------
-- INSTANTIATE OPEN CORES 1-WIRE CORE
---------------------------------------------------------------------------------------

    sockit_owm_0 : sockit_owm
    generic map(
        OVD_E   => 1, -- ENABLE OVERDRIVE FUNCTIONALITY
        CDR_E   => 0, -- NO CLOCK DIVIDER REGISTER
        BAW     => 1,
        BDW     => 32,
        OWN     => NUM_ONE_WIRE_INTERFACES,
        BTP_N   => "6.0", -- 156.25 DOESN'T DIVIDE EXACTLY SO USE RANGE
        BTP_O   => "0.5", -- 156.25 DOESN'T DIVIDE EXACTLY SO USE RANGE
        CDR_N   => 263, --NORMAL BASE TIME PERIOD = 6.758 us --1054, -- NORMAL BASE TIME PERIOD = 6.752 us
        CDR_O   => 19)  --OVERDRIVE BASE TIME PERIOD = 0.512us --89) -- OVERDRIVE BASE TIME PERIOD = 0.576us
    port map(
        clk     => CLK_I,
        rst     => RST_I,
        bus_ren     => bus_ren,
        bus_wen     => bus_wen,
        bus_adr     => bus_adr,
        bus_wdt     => bus_wdt,
        bus_rdt     => bus_rdt,
        bus_irq     => bus_irq,
        owr_p  => one_wire_strong_pull_up_enable,
        owr_e  => one_wire_pull_down_enable,
        owr_i  => one_wire_in);

---------------------------------------------------------------------------------------
-- CONVERT TO WISHBONE BUS
---------------------------------------------------------------------------------------

    bus_adr(0) <= ADR_I(2); -- should always be '0' anyway

    bus_ren <= '1' when
    ((CYC_I = '1')and
    (STB_I = '1')and
    (WE_I = '0')) else '0';

    bus_wen <= '1' when
    ((CYC_I = '1')and
    (STB_I = '1')and
    (WE_I = '1')) else '0';

    bus_wdt <= DAT_I;

    gen_ACK_O : process(RST_I, CLK_I)
    begin
        if (RST_I = '1')then
            ACK_O <= '0';
            DAT_O <= (others => '0');
        elsif (rising_edge(CLK_I))then
            ACK_O <= '0';

            if ((CYC_I = '1')and(STB_I = '1'))then
                ACK_O <= '1';

                -- IF READ, THEN LATCH READ DATA NOW WHILE STILL VALID
                if (WE_I = '0')then
                    DAT_O <= bus_rdt;
                end if;
            end if;
        end if;
    end process;

end arch_wishbone_one_wire;

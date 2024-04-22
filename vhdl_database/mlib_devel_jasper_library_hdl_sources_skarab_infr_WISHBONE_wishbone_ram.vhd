----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
--
-- Create Date: 05.09.2014 10:19:29
-- Design Name:
-- Module Name: wishbone_ram - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Wishbone Classic slave, 32kB RAM
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

entity wishbone_ram is
    port (
        -- WISHBONE CLASSIC SIGNALS
        CLK_I : in std_logic;
        RST_I : in std_logic;
        DAT_I : in std_logic_vector(31 downto 0);
        DAT_O : out std_logic_vector(31 downto 0);
        ACK_O : out std_logic;
        ADR_I : in std_logic_vector(14 downto 0);
        CYC_I : in std_logic;
        SEL_I : in std_logic_vector(3 downto 0);
        STB_I : in std_logic;
        WE_I  : in std_logic);
end wishbone_ram;

architecture arch_wishbone_ram of wishbone_ram is

    component wishbone_bram
    port (
        clka    : in std_logic;
        wea     : in std_logic_vector(0 downto 0);
        addra   : in std_logic_vector(9 downto 0);
        dina    : in std_logic_vector(31 downto 0);
        douta   : out std_logic_vector(31 downto 0));
    end component;

    signal addra : std_logic_vector(9 downto 0);
    signal wea : std_logic_vector(0 downto 0);
    signal STB_I_z : std_logic;
    signal STB_I_z2 : std_logic;
begin

    addra <= ADR_I(11 downto 2);

    gen_wea : process(RST_I, CLK_I)
    begin
        if (RST_I = '1')then
            wea(0) <= '0';
        elsif (rising_edge(CLK_I))then
            if ((CYC_I = '1')and(STB_I = '1')and(WE_I = '1'))then
                wea(0) <= '1';
            else
                wea(0) <= '0';
            end if;
        end if;
    end process;

    gen_STB_I_z : process(RST_I, CLK_I)
    begin
        if (RST_I = '1')then
            STB_I_z <= '0';
            STB_I_z2 <= '0';
        elsif (rising_edge(CLK_I))then
            STB_I_z <= STB_I;
            STB_I_z2 <= STB_I_z;
        end if;
    end process;

    gen_ACK_O : process(RST_I, CLK_I)
    begin
        if (RST_I = '1')then
            ACK_O <= '0';
        elsif (rising_edge(CLK_I))then
            if ((STB_I_z = '1')and(STB_I_z2 = '0'))then
                ACK_O <= '1';
            else
                ACK_O <= '0';
            end if;
        end if;
    end process;

    wishbone_bram_0 : wishbone_bram
    port map(
        clka    => CLK_I,
        wea     => wea,
        addra   => addra,
        dina    => DAT_I,
        douta   => DAT_O);

end arch_wishbone_ram;

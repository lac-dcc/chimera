----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
--
-- Create Date: 05.09.2014 10:19:29
-- Design Name:
-- Module Name: wishbone_register - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Wishbone Classic slave, 32 x 32 register interface
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

entity wishbone_register is
    port (
        -- WISHBONE CLASSIC SIGNALS
        CLK_I : in std_logic;
        RST_I : in std_logic;
        DAT_I : in std_logic_vector(31 downto 0);
        DAT_O : out std_logic_vector(31 downto 0);
        ACK_O : out std_logic;
        ADR_I : in std_logic_vector((C_NUM_REGISTER_ADDRESS_BITS + 1) downto 0);
        CYC_I : in std_logic;
        SEL_I : in std_logic_vector(3 downto 0);
        STB_I : in std_logic;
        WE_I  : in std_logic;

        -- REGISTER INTERFACE
        user_read_regs    : in T_REGISTER_BLOCK;
        user_write_regs   : out T_REGISTER_BLOCK);
end wishbone_register;

architecture arch_wishbone_register of wishbone_register is

    signal addra : std_logic_vector((C_NUM_REGISTER_ADDRESS_BITS - 1) downto 0);
    signal wea : std_logic_vector(0 downto 0);
    signal STB_I_z : std_logic;
    signal STB_I_z2 : std_logic;
begin

    addra <= ADR_I((C_NUM_REGISTER_ADDRESS_BITS + 1) downto 2);

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

    -- GENERATE WRITE REGISTER
    gen_user_write_regs : process(RST_I, CLK_I)
    begin
        if (RST_I = '1')then
            for a in 0 to C_NUM_REGISTERS - 1 loop
                user_write_regs(a) <= (others => '0');
            end loop;
        elsif (rising_edge(CLK_I))then
            if (wea(0) = '1')then
                if (SEL_I(0) = '1')then
                    user_write_regs(to_integer(unsigned(addra)))(7 downto 0) <= DAT_I(7 downto 0);
                end if;
                if (SEL_I(1) = '1')then
                    user_write_regs(to_integer(unsigned(addra)))(15 downto 8) <= DAT_I(15 downto 8);
                end if;
                if (SEL_I(2) = '1')then
                    user_write_regs(to_integer(unsigned(addra)))(23 downto 16) <= DAT_I(23 downto 16);
                end if;
                if (SEL_I(3) = '1')then
                    user_write_regs(to_integer(unsigned(addra)))(31 downto 24) <= DAT_I(31 downto 24);
                end if;
            end if;
        end if;
    end process;

    -- GENERATE READ REGISTER OUTPUTS
    gen_DAT_O : process(RST_I, CLK_I)
    begin
        if (RST_I = '1')then
            DAT_O <= (others => '0');
        elsif (rising_edge(CLK_I))then
            DAT_O <= user_read_regs(to_integer(unsigned(addra)));
        end if;
    end process;

end arch_wishbone_register;

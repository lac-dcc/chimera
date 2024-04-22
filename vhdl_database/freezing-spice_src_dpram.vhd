-- Based on the Quartus II VHDL Template for True Dual-Port RAM with single clock
-- Read-during-write on port A or B returns newly written data

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_textio.all;
use work.std_logic_textio.all;

use std.textio.all;

entity dpram is
    generic(g_data_width : natural := 16;
            g_addr_width : natural := 10;
            g_init       : boolean := false;
            g_init_file  : string  := "");
    port(clk    : in  std_logic;
         addr_a : in  std_logic_vector(g_addr_width-1 downto 0);
         addr_b : in  std_logic_vector(g_addr_width-1 downto 0);
         data_a : in  std_logic_vector((g_data_width-1) downto 0);
         data_b : in  std_logic_vector((g_data_width-1) downto 0);
         we_a   : in  std_logic := '1';
         we_b   : in  std_logic := '1';
         q_a    : out std_logic_vector((g_data_width -1) downto 0);
         q_b    : out std_logic_vector((g_data_width -1) downto 0));
end dpram;

architecture rtl of dpram is

    -- Build a 2-D array type for the RAM
    subtype word_t is std_logic_vector((g_data_width-1) downto 0);
    type ram_t is array(0 to 2**g_addr_width-1) of word_t;

    -- function to initialize the RAM from a file
    impure function init_ram(fn : in string) return ram_t is
        file f       : text;
        variable l   : line;
        variable ram : ram_t;
    begin
        if g_init = true then
            file_open(f, fn, READ_MODE);
            for i in ram_t'range loop
                readline(f, l);
                read(l, ram(i));
            end loop;
            file_close(f);
        else
            ram := (others => (others => '0'));
        end if;

        return ram;
    end function;

    -- Declare the RAM
    shared variable ram : ram_t := init_ram(g_init_file); --(others => (others => '0'));

begin
    -- Port A
    process (clk)
        variable addr : natural range 0 to 2**g_addr_width-1;
    begin
        if (rising_edge(clk)) then
            addr := to_integer(unsigned(addr_a));
            if (we_a = '1') then
                ram(addr) := data_a;
            end if;

            q_a <= ram(addr);
        end if;
    end process;

    -- Port B 
    process (clk)
        variable addr : natural range 0 to 2**g_addr_width-1;
    begin
        if (rising_edge(clk)) then
            addr := to_integer(unsigned(addr_b));
            if (we_b = '1') then
                ram(addr) := data_b;
            end if;

            q_b <= ram(addr);
        end if;
    end process;

end rtl;

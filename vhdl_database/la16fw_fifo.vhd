--
-- This file is part of the la16fw project.
--
-- Copyright (C) 2014-2015 Gregor Anich
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
--

----------------------------------------------------------------------------------
--
-- fifo unit for sending data from the sample clock domain to the 48MHz/fx2 domain
--
-- multiple block rams are used which are filled one after the other and sent to
-- the read domain where they are consumed and sent back to the write domain
--
-- WARNING: the block ram acts strange so the input data must 
--          be valid until 1 cylcle after the write!
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.all;


entity fifo is
    generic(
        ram_count_log2 : integer := 3;
        ram_size_log2  : integer := 10
    );
    port(
        reset        : in std_logic; -- sync'd to write clock
        clk_read     : in std_logic;
        clk_write    : in std_logic;
        empty        : out std_logic;
        almost_empty : out std_logic;
        full         : out std_logic;
        almost_full  : out std_logic;
        enable_read  : in std_logic;
        enable_write : in std_logic;
        data_out     : out std_logic_vector(15 downto 0);
        data_in      : in std_logic_vector(15 downto 0)
    );
end fifo;


architecture behavioral of fifo is

    subtype vector_t is std_logic_vector(2**ram_count_log2-1 downto 0);
    subtype vector16_t is std_logic_vector(15 downto 0);
    subtype addr_t is unsigned(ram_size_log2-1 downto 0);
    type vector16_arr_t is array (natural range <>) of vector16_t;
    type addr_arr_t is array (natural range <>) of addr_t;

    -- read domain state
    signal reset_read_get          : std_logic;
    signal reset_read_done_set     : std_logic := '0';
    signal data_out_valid          : std_logic;
    signal data_out_reg            : vector16_t;
    signal data_out_reg_valid      : std_logic;
    signal ram_read_index          : unsigned(ram_count_log2-1 downto 0);
    signal ram_in_read_domain      : unsigned(ram_count_log2 downto 0);
    signal ram_in_read_domain_get  : std_logic;
    signal ram_in_write_domain_set : std_logic := '0';
    signal ram_enable_read         : vector_t;
    signal ram_read_addr           : addr_t;
    signal ram_read_end            : std_logic;
    signal ram_data_out            : vector16_arr_t(2**ram_count_log2-1 downto 0);
    signal ram_data_out_valid      : std_logic;
    
    -- write domain state
    signal reset_last              : std_logic := '0';
    signal reset_done              : std_logic := '1';
    signal reset_read_set          : std_logic := '0';
    signal reset_read_done_get     : std_logic;
    signal full_int                : std_logic;
    signal ram_write_index         : unsigned(ram_count_log2-1 downto 0);
    signal ram_in_write_domain     : unsigned(ram_count_log2 downto 0);
    signal ram_in_read_domain_set  : std_logic := '0';
    signal ram_in_write_domain_get : std_logic;
    signal ram_enable_write        : vector_t;
    signal ram_write_addr          : addr_t;
    signal ram_write_addr_at_end   : std_logic;
    signal ram_data_in             : vector16_t;

    signal will_read_data_out : boolean;
    signal want_read_data_out_reg : boolean;
    signal will_read_data_out_reg : boolean;
    signal want_read_ram_data_out : boolean;
    signal will_read_ram_data_out : boolean;
    signal end_of_ram : boolean;
    signal almost_end_of_ram : boolean;
    signal want_read_ram_2 : boolean;
    signal will_read_ram_2 : boolean;

begin

    gen_ram : for i in 0 to 2**ram_count_log2-1 generate
    begin
        ramb16bwe_s18_s18_inst : ramb16bwe_s18_s18
            port map (
                doa   => ram_data_out(i),                  -- port a 16-bit data output
                dob   => open,                             -- port b 16-bit data output
                dopa  => open,                             -- port a 2-bit parity output
                dopb  => open,                             -- port b 2-bit parity output
                addra => std_logic_vector(ram_read_addr),  -- port a 10-bit address input
                addrb => std_logic_vector(ram_write_addr), -- port b 10-bit address input
                clka  => clk_read,                         -- port a 1-bit clock
                clkb  => clk_write,                        -- port b 1-bit clock
                dia   => (others=>'0'),                    -- port a 16-bit data input
                dib   => ram_data_in,                      -- port b 16-bit data input
                dipa  => (others=>'0'),                    -- port a 2-bit parity input
                dipb  => (others=>'0'),                    -- port-b 2-bit parity input
                ena   => ram_enable_read(i),               -- port a 1-bit ram enable input
                enb   => ram_enable_write(i),              -- port b 1-bit ram enable input
                ssra  => '0',                              -- port a 1-bit synchronous set/reset input
                ssrb  => '0',                              -- port b 1-bit synchronous set/reset input
                wea   => (others=>'0'),                    -- port a 2-bit write enable input
                web   => (others=>'1')                     -- port b 2-bit write enable input
            );
    end generate gen_ram;
    flag_ram1_inst : entity work.syncflag
        port map(
            clk_input  => clk_write,
            clk_output => clk_read,
            input      => ram_in_read_domain_set,
            output     => ram_in_read_domain_get
        );
    flag_ram2_inst : entity work.syncflag
        port map(
            clk_input  => clk_read,
            clk_output => clk_write,
            input      => ram_in_write_domain_set,
            output     => ram_in_write_domain_get
        );

    empty <= not data_out_valid;
    almost_empty <= (not data_out_valid) or
                    (data_out_valid and not (data_out_reg_valid or ram_data_out_valid));
    full <= full_int;
    --data_out <= ram_data_out(to_integer(ram_read_index));

    -- synchronize reset signals
    flag1_inst : entity work.syncflag
        port map(
            clk_input  => clk_write,
            clk_output => clk_read,
            input      => reset_read_set,
            output     => reset_read_get
        );
    flag2_inst : entity work.syncflag
        port map(
            clk_input  => clk_read,
            clk_output => clk_write,
            input      => reset_read_done_set,
            output     => reset_read_done_get
        );

        will_read_data_out <= (data_out_valid = '1') and (enable_read = '1');
        want_read_data_out_reg <= (data_out_valid = '0') or will_read_data_out;
        will_read_data_out_reg <= (data_out_reg_valid = '1') and want_read_data_out_reg;
        want_read_ram_data_out <= (data_out_reg_valid = '0') or (will_read_data_out_reg and not will_read_data_out);
        will_read_ram_data_out <= (ram_data_out_valid = '1') and want_read_ram_data_out;
        almost_end_of_ram <= (data_out_valid = '1') and (unsigned(ram_read_addr) = 2**ram_size_log2-1);
        end_of_ram <= (data_out_valid = '1') and (unsigned(ram_read_addr) = 0);
        want_read_ram_2 <= (want_read_data_out_reg and (not will_read_data_out_reg)) or will_read_data_out;
        will_read_ram_2 <= (ram_in_read_domain /= 0) and want_read_ram_2 and (ram_read_end = '0');
    -- read domain
    process(clk_read)
--        variable will_read_data_out : boolean;
--        variable want_read_data_out_reg : boolean;
--        variable will_read_data_out_reg : boolean;
--        variable want_read_ram_data_out : boolean;
--        variable will_read_ram_data_out : boolean;
--        variable want_read_ram_2 : boolean;
--        variable will_read_ram_2 : boolean;
        variable ram_in_read_domain_inc : boolean;
        variable ram_in_read_domain_dec : boolean;
    begin
--        will_read_data_out := (data_out_valid = '1') and (enable_read = '1');
--        want_read_data_out_reg := (data_out_valid = '0') or will_read_data_out;
--        will_read_data_out_reg := (data_out_reg_valid = '1') and want_read_data_out_reg;
--        want_read_ram_data_out := (data_out_reg_valid = '0') or will_read_data_out;
--        will_read_ram_data_out := (ram_data_out_valid = '1') and want_read_ram_data_out;
--                                  --(will_read_data_out or want_read_data_out_reg);
--        --want_read_ram := want_read_ram_data_out;
--        want_read_ram_2 := want_read_data_out_reg and (not will_read_data_out_reg);
--        will_read_ram_2 := (unsigned(ram_in_read_domain) /= 0) and want_read_ram_2;

        ram_in_read_domain_inc := false;
        ram_in_read_domain_dec := false;

        if rising_edge(clk_read) then
            -- default value for signals
            reset_read_done_set <= '0';
            ram_in_write_domain_set <= '0';
            ram_enable_read <= (others=>'0');
            
            -- handle read from user
            if will_read_data_out then
                data_out_valid <= '0';
            end if;
            
            -- transfer data from output register to user
            if will_read_data_out_reg then
                data_out <= data_out_reg;
                data_out_valid <= '1';
                data_out_reg_valid <= '0';
            end if;

            -- transfer data from ram to output register or user
            if will_read_ram_data_out then
                if will_read_data_out then
                    data_out <= ram_data_out(to_integer(ram_read_index));
                    data_out_valid <= '1';
                else
                    data_out_reg <= ram_data_out(to_integer(ram_read_index));
                    data_out_reg_valid <= '1';
                end if;
                ram_data_out_valid <= '0';
                
                if (ram_read_addr = 0) then
                    -- ram is emptied with this clock cycle
                    ram_in_write_domain_set <= '1';
                    ram_in_read_domain_dec := true;
                    ram_read_index <= ram_read_index + 1;
                end if;
            end if;
            
            -- read ram next cycle if data is available and can be transferred one step in the pipeline
            if will_read_ram_2 then
                -- ask ram to read data next cycle
                ram_enable_read(to_integer(ram_read_index)) <= '1';
                if (ram_read_addr = 2**ram_size_log2-1) then
                    ram_read_end <= '1';
                    if (unsigned(ram_enable_read) /= 0) then
                        -- already reading last address
                        ram_enable_read(to_integer(ram_read_index)) <= '0';
                    end if;
                end if;
            end if;
            if (unsigned(ram_enable_read) /= 0) then
                -- ram will read during this cycle, data valid next cycle
                ram_data_out_valid <= '1';
                ram_read_addr <= ram_read_addr + 1;
            end if;
            
            -- start reading next ram if it's available
            if (data_out_valid = '0') and (ram_read_end = '1') then
                ram_read_end <= '0';
            end if;
            
            -- handle flags from write domain
            if (ram_in_read_domain_get = '1') then
                ram_in_read_domain_inc := true;
            end if;
            
            -- increment or decrement ram count if needed
            if ram_in_read_domain_inc and not ram_in_read_domain_dec then
                ram_in_read_domain <= ram_in_read_domain + 1;
            elsif ram_in_read_domain_dec and not ram_in_read_domain_inc then
                ram_in_read_domain <= ram_in_read_domain - 1;
            end if;
            
            -- reset
            if (reset_read_get = '1') then
                -- initialize variables
                data_out_valid <= '0';
                data_out_reg_valid <= '0';
                ram_read_index <= (others=>'0');
                ram_in_read_domain <= (others=>'0');
                ram_read_addr <= (others=>'0');
                ram_read_end <= '0';
                ram_data_out_valid <= '0';
                -- default value for signals
                ram_in_write_domain_set <= '0';
                ram_enable_read <= (others=>'0');
                -- tell write domain that read domain is reset
                reset_read_done_set <= '1';
            end if;
        end if;
    end process;
    
    -- write domain
    process(clk_write)
        variable ram_in_write_domain_inc : boolean;
        variable ram_in_write_domain_dec : boolean;
    begin
        ram_in_write_domain_inc := false;
        ram_in_write_domain_dec := false;
        if rising_edge(clk_write) then
            -- default value for signals
            reset_read_set <= '0';
            ram_in_read_domain_set <= '0';
            ram_enable_write <= (others=>'0');
            
            -- write data to ram
            if (full_int = '0') and (enable_write = '1') then
                ram_data_in <= data_in;
                ram_enable_write(to_integer(ram_write_index)) <= '1';
                ram_write_addr <= ram_write_addr + 1;
                if (ram_write_addr + 2 = 2**ram_size_log2-1) then
                    almost_full <= '1';
                end if;
--                if (ram_write_addr + 1 = 2**ram_size_log2-1) then
                ram_write_addr_at_end <= '0';
                if (ram_write_addr + 2 = 2**ram_size_log2-1) then
                    ram_write_addr_at_end <= '1';
                end if;
                if (ram_write_addr_at_end = '1') then
                    -- ram is filled with this clock cycle
                    ram_in_read_domain_set <= '1';
                    ram_in_write_domain_dec := true;
                    ram_write_index <= ram_write_index + 1;
                    full_int <= '1';
                end if;
            end if;
            -- don't set full/almost_full flag if next ram block is in write domain
            if (ram_in_write_domain > 1) then
                full_int <= '0';
                almost_full <= '0';
            end if;
            
            -- handle flags from read domain
            if (ram_in_write_domain_get = '1') then
                ram_in_write_domain_inc := true;
                full_int <= '0';
                almost_full <= '0';
            end if;

            -- increment or decrement ram count if needed
            if ram_in_write_domain_inc and not ram_in_write_domain_dec then
                ram_in_write_domain <= ram_in_write_domain + 1;
            elsif ram_in_write_domain_dec and not ram_in_write_domain_inc then
                ram_in_write_domain <= ram_in_write_domain - 1;
            end if;

            -- reset
            reset_last <= reset;
            if (reset_last = '0') and (reset = '1') then
                -- tell read domain to reset
                reset_read_set <= '1';
                reset_done <= '0';
            end if;
            if (reset_read_done_get = '1') then
                -- read domain reset
                reset_done <= '1';
            end if;
            if (reset = '1') or (reset_done = '0') then
                full_int <= '1';
                almost_full <= '1';
                -- initialize variables
                ram_write_index <= (others=>'0');
                ram_in_write_domain <= to_unsigned(2**ram_count_log2, ram_in_write_domain'length);
                ram_write_addr <= (others=>'1');
                ram_write_addr_at_end <= '0';
                -- default value for signals
                ram_in_read_domain_set <= '0';
                ram_enable_write <= (others=>'0');
            end if;
        end if;
    end process;    

end behavioral;



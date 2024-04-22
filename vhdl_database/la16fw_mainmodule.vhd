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
-- connect all stuff together
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mainmodule is
    generic(
        -- spi addresses
        ADDRESS_FPGA_VERSION : integer := 0;
        ADDRESS_STATUS_CONTROL : integer := 1;
        ADDRESS_CHANNEL_SELECT_LO : integer := 2;
        ADDRESS_CHANNEL_SELECT_HI : integer := 3;
        ADDRESS_SAMPLE_RATE_DIVISOR : integer := 4;
        ADDRESS_LED_BRIGHTNESS : integer := 5;
        ADDRESS_SAMPLE_CLOCK_CONTROL : integer := 10;
        
        FPGA_VERSION : integer := 16;
        
        -- other constants
        tick_1M_div : integer := 48 -- divider to get 1MHz from 48MHz clk
    );
    port(
        -- always used
        clk_in      : in std_logic; --external clock input
        led         : out std_logic;
        spi_ss_n    : in std_logic;
        spi_sclk    : in std_logic;
        spi_mosi    : in std_logic;
        spi_miso    : out std_logic;
        -- parallel data bus to fx2 chip
        fifo_clk    : in std_logic; -- 48MHz clock for the fifo bus
        fifo_empty  : out std_logic; -- flag the fx2 whether the fifo is empty (fx2 RDY0 pin)
        fifo_read_n : in std_logic; -- low while the fx2 reads data, high otherwise
        fifo_data   : out std_logic_vector(15 downto 0);
        -- logic inputs
        logic_data  : in std_logic_vector(15 downto 0)
--        logic_data : out std_logic_vector(15 downto 0)
    );
end mainmodule;


architecture behavioral of mainmodule is

    -- reset
    signal reset       : std_logic := '1';
    signal reset_count : unsigned(4 downto 0) := (others=>'1');
    signal reset_dcm   : std_logic;
    
    -- clock
    signal clk                : std_logic; -- 48MHz clock signal from the selected DCM
    signal clk_a, clk_b       : std_logic;
    signal clk_c, clk_d       : std_logic;
    signal clk_100M           : std_logic; -- 100MHz clock from dcm1
    signal clk_100M_locked    : std_logic;
    signal clk_160M           : std_logic; -- 160MHz clock from dcm2
    signal clk_160M_locked    : std_logic;
    signal clk_user           : std_logic; -- user clock
    signal clk_user_2x        : std_logic; -- 2x user clock from dcm3
    signal clk_user_2x_locked : std_logic;
    signal clk_user_4x        : std_logic; -- 4x user clock from dcm4
    signal clk_user_4x_locked : std_logic;
    signal tick_1M            : std_logic := '0';
    signal tick_1M_count      : unsigned(5 downto 0) := (others=>'0');
    
    -- internal data bus FIXME: spi
    signal spi_enable_write : std_logic;
    signal spi_enable_read  : std_logic;
    signal spi_addr         : std_logic_vector(6 downto 0);
    signal spi_data_out     : std_logic_vector(7 downto 0);
    signal spi_data_in      : std_logic_vector(7 downto 0);
    
    -- status/control
    signal led_brightness      : std_logic_vector(7 downto 0);
    signal led_invert          : std_logic;
    signal sample_run          : std_logic := '0'; -- set to '1' to sample data
    signal status_bit6         : std_logic;
    signal sample_rate_divisor : std_logic_vector(7 downto 0); -- sample rate is base clock / (rate_divisor + 1)
    signal sample_clk_sel      : unsigned(1 downto 0); -- 0: clk_100M, 1: clk_160M, 2: user 2x, 3: user 4x
    signal sample_clk          : std_logic; -- sample clock, 100 or 160MHz
    signal selected_channels   : std_logic_vector(15 downto 0);

    -- fifo to buffer logic data (from the core generator)
    signal fifo_reset        : std_logic;
    signal fifo_almost_empty : std_logic;
    signal fifo_data_in      : std_logic_vector(15 downto 0);
    signal fifo_data_out     : std_logic_vector(15 downto 0);
    signal fifo_enable_read  : std_logic;
    signal fifo_enable_write : std_logic;
    signal fifo_full         : std_logic;
    signal fifo_almost_full  : std_logic;
    
    -- debug
    signal debug : std_logic_vector(15 downto 0);

begin

    -- debug
    --logic_data <= debug;
    debug(0) <= sample_run;
    --debug(2) <= fifo_almost_empty;
    --debug(2) <= not fifo_read_n;
    debug(2) <= '1' when (unsigned(fifo_data_out) = 165) else '0';

    -- clock units: generates 100MHz and 160MHz from 48MHz input
    clock_100M_inst : entity work.clock
        generic map(
            CLK_FAST_DIV => 12,
            CLK_FAST_MUL => 25,
            STARTUP_WAIT => true
        )
        port map(
            clk_in   => clk_in,
            reset    => reset_dcm,
            clk      => clk_a,
            clk_fb   => clk_a,
            clk_fast => clk_100M,
            locked   => clk_100M_locked
        );
    clock_160M_inst : entity work.clock
        generic map(
            CLK_FAST_DIV => 3,
            CLK_FAST_MUL => 10,
            STARTUP_WAIT => true
        )
        port map(
            clk_in   => clk_in,
            reset    => reset_dcm,
            clk      => clk_b,
            clk_fb   => clk_b,
            clk_fast => clk_160M,
            locked   => clk_160M_locked
        );
--    clock_user1_inst : entity work.clock
--        generic map(
--            CLK_FAST_DIV => 1,
--            CLK_FAST_MUL => 2
--        )
--        port map(
--            clk_in   => clk_user,
--            reset    => reset_dcm,
--            clk      => clk_c,
--            clk_fb   => clk_c,
--            clk_fast => clk_user_2x,
--            locked   => clk_user_2x_locked
--        );
--    clock_user2_inst : entity work.clock
--        generic map(
--            CLK_FAST_DIV => 1,
--            CLK_FAST_MUL => 4
--        )
--        port map(
--            clk_in   => clk_user,
--            reset    => reset_dcm,
--            clk      => clk_d,
--            clk_fb   => clk_d,
--            clk_fast => clk_user_4x,
--            locked   => clk_user_4x_locked
--        );
    clk_user <= logic_data(15);
    clockmux_inst : entity work.clockmux
        generic map(
            n_log2 => 2
        )
        port map(
            clk_ctl    => clk,
            clk_sel    => std_logic_vector(sample_clk_sel),
            clk_in(0)  => clk_100M,
            clk_in(1)  => clk_160M,
            clk_in(2)  => '0',--clk_user_2x,
            clk_in(3)  => '0',--clk_user_4x,
            clk_out    => sample_clk
        );
    clk <= clk_in; --FIXME: which clock to use for logic?
    -- FIXME: use a BUFGMUX or custom circuit to avoid glitches
    --sample_clk <= clk_100M when (sample_clk_sel = '0') else clk_160M;
    
    -- led unit: creates pwm signal for the led from 1MHz tick
    led_inst : entity work.led
        port map(
            clk        => clk,
            reset      => reset,
            tick_1M    => tick_1M,
            brightness => led_brightness,
            invert     => led_invert,
            led        => led
        );

    -- spi unit: provides the control interface to the fx2 chip
    spi_inst : entity work.spi
        port map(
            clk          => clk,
            reset        => reset,
            enable_write => spi_enable_write,
            enable_read  => spi_enable_read,
            addr         => spi_addr,
            data_out     => spi_data_out,
            data_in      => spi_data_in,
            ss_n         => spi_ss_n,
            sclk         => spi_sclk,
            mosi         => spi_mosi,
            miso         => spi_miso
        );

    -- fifo unit
    --   used for buffering the data between logic input and fx2
    --   output is connected to the fx2
    --   input is connected to the sample unit
    fifo_inst : entity work.fifo
        port map(
            reset        => fifo_reset,
            clk_write    => sample_clk,
            clk_read     => fifo_clk,
            data_in      => fifo_data_in,
            enable_write => fifo_enable_write,
            enable_read  => fifo_enable_read,
            data_out     => fifo_data_out,
            full         => fifo_full,
            almost_full  => fifo_almost_full,
            almost_empty => fifo_almost_empty
        );
    -- for some reason the fx2 reads one word too much if empty is used
    fifo_empty <= fifo_almost_empty or (not sample_run);
    fifo_data <= fifo_data_out;
    fifo_enable_read <= (not fifo_read_n);

    -- sample logic inputs
    sample_inst : entity work.sample
        port map(
            sample_clk          => sample_clk,
            sample_run          => sample_run,
            sample_rate_divisor => sample_rate_divisor,
            channel_select      => selected_channels,
            logic_data          => logic_data,
            --logic_data          => (others=>'0'),
            fifo_data           => fifo_data_in,
            fifo_reset          => fifo_reset,
            fifo_write          => fifo_enable_write,
            fifo_full           => fifo_full,
            fifo_almost_full    => fifo_almost_full
        );

    -- create internal reset signal from 48MHz input clock
    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if (reset_count = 0) then
                reset <= '0';
            else
                reset <= '1';
            end if;
            if (reset_count /= 0) and 
               (((clk_100M_locked = '1') and (clk_160M_locked = '1')) or
                (reset_count /= 5)) then
                reset_count <= reset_count - 1;
            end if;
        end if;
    end process;
    -- make sure dcm clock starts/runs while reset is still '1'
    reset_dcm <= '1' when (reset_count > 2**reset_count'length-5) else '0';

    -- create 1MHz tick from 48MHz clock
    process(clk)
    begin
        if rising_edge(clk) then
            -- create 1MHz tick
            if (tick_1M_count = 0) then
                tick_1M <= '1';
                tick_1M_count <= to_unsigned(tick_1M_div - 1, tick_1M_count'length);
            else
                tick_1M <= '0';
                tick_1M_count <= tick_1M_count - 1;
            end if;
        end if;
    end process;
    
    -- handle reset and spi
    process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                sample_clk_sel <= (others=>'0');
                spi_data_in <= (others=>'0');
                -- init status/control
                led_brightness <= (others=>'0');
                led_invert <= '0';
                sample_run <= '0';
                status_bit6 <= '0';
                selected_channels <= (others=>'1');
                sample_rate_divisor <= (others=>'0');
            else
                -- handle spi
                spi_data_in <= (others=>'0');
                if (spi_enable_read = '1') then
                    if (unsigned(spi_addr) = ADDRESS_FPGA_VERSION) then
                        spi_data_in <= std_logic_vector(to_unsigned(FPGA_VERSION, spi_data_in'length));
                    elsif (unsigned(spi_addr) = ADDRESS_STATUS_CONTROL) then
                        spi_data_in <= "0" & status_bit6 & "00100" & sample_run;
                    elsif (unsigned(spi_addr) = ADDRESS_CHANNEL_SELECT_LO) then
                        spi_data_in <= selected_channels(7 downto 0);
                    elsif (unsigned(spi_addr) = ADDRESS_CHANNEL_SELECT_HI) then
                        spi_data_in <= selected_channels(15 downto 8);
                    elsif (unsigned(spi_addr) = ADDRESS_SAMPLE_RATE_DIVISOR) then
                        spi_data_in <= sample_rate_divisor;
                    elsif (unsigned(spi_addr) = ADDRESS_LED_BRIGHTNESS) then
                        spi_data_in <= led_brightness;
                    elsif (unsigned(spi_addr) = ADDRESS_SAMPLE_CLOCK_CONTROL) then
                        spi_data_in <= "0000000" & sample_clk_sel(0);
                    end if;
                end if;
                if (spi_enable_write = '1') then
                    if (unsigned(spi_addr) = ADDRESS_STATUS_CONTROL) then
                        sample_run <= spi_data_out(0);
                        status_bit6 <= spi_data_out(6);
                        led_invert <= spi_data_out(0);
                    elsif (unsigned(spi_addr) = ADDRESS_CHANNEL_SELECT_LO) then
                        selected_channels(7 downto 0) <= spi_data_out;
                    elsif (unsigned(spi_addr) = ADDRESS_CHANNEL_SELECT_HI) then
                        selected_channels(15 downto 8) <= spi_data_out;
                    elsif (unsigned(spi_addr) = ADDRESS_SAMPLE_RATE_DIVISOR) then
                        sample_rate_divisor <= spi_data_out;
                    elsif (unsigned(spi_addr) = ADDRESS_LED_BRIGHTNESS) then
                        led_brightness <= spi_data_out;
                    elsif (unsigned(spi_addr) = ADDRESS_SAMPLE_CLOCK_CONTROL) then
                        sample_clk_sel(0) <= spi_data_out(0);
                    elsif (unsigned(spi_addr) = 123) then--foo
                        sample_clk_sel(1) <= spi_data_out(0);--bogus
                    end if;
                end if;
            end if;
        end if;
    end process;

end behavioral;


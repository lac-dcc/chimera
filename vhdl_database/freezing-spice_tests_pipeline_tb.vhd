library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.common.all;
use work.id_pkg.all;
use work.encode_pkg.all;
use work.test_config.all;

entity pipeline_tb is
end entity pipeline_tb;

architecture testbench of pipeline_tb is
    signal clk   : std_logic := '0';
    signal rst_n : std_logic := '1';

    -- inputs
    signal insn_in    : word      := (others => '0');
    signal insn_addr  : word      := (others => '0');
    signal insn_valid : std_logic := '0';

    -- shift registers to simulate delays in accessing memory
    constant c_data_in_delay : integer            := 4;  -- number of delay cycles for memory reads
    type data_in_sr_t is array (0 to c_data_in_delay - 1) of std_logic_vector(31 downto 0); --word;
    type data_in_valid_sr_t is array (0 to c_data_in_delay - 1) of std_logic;
    signal data_in           : data_in_sr_t       := (others => (others => '0'));
    signal data_in_valid     : data_in_valid_sr_t := (others => '0');
    signal data_valid        : std_logic;

    -- outputs
    signal data_write_en : std_logic;
    signal data_read_en  : std_logic;
    signal data_addr     : word;
    signal data_out      : word;

    -- simulation specific
    signal done         : boolean := false;
    constant clk_period : time    := 10 ns;  -- 100 MHz
    file memfile        : text open write_mode is "sim/memio.vec";

    -- data memory
    type ram_t is array(0 to 100) of word;
    signal ram : ram_t := (0      => X"80008081",
                           others => (others => '0'));
begin

    instruction_memory : entity work.dpram(rtl)
        generic map (g_data_width => 32,
                     g_addr_width => 8,
                     g_init       => true,
                     g_init_file  => pipeline_tb_test_vector_input_filename)
        port map (clk    => clk,
                  addr_a => insn_addr(7 downto 0),
                  data_a => (others => '0'),
                  we_a   => '0',
                  q_a    => insn_in,
                  addr_b => (others => '0'),
                  data_b => (others => '0'),
                  we_b   => '0',
                  q_b    => open);

    -- create a clock
    clk <= '0' when done else (not clk) after clk_period / 2;

    -- purpose: data memory
    ram_proc : process (clk, rst_n) is
        variable addr  : integer;
        variable valid : std_logic;
    begin
        if rst_n = '0' then
            reset_shift_regs : for i in data_in'range loop
                data_in(i)       <= (others => '0');
                data_in_valid(i) <= '0';
            end loop reset_shift_regs;
        elsif rising_edge(clk) then
            -- default values
            data_in_valid(0) <= '0';
            data_in(0)       <= (others => '0');

            -- create shift registers
            shift_regs : for i in 1 to data_in'high loop
                data_in(i)       <= data_in(i - 1);
                data_in_valid(i) <= data_in_valid(i - 1);
            end loop shift_regs;

            if ((data_in_valid(data_in_valid'high) = '0')
                and (data_in_valid(data_in_valid'high - 1) = '1')) then
                valid := '1';
            else
                valid := '0';
            end if;

            data_valid <= valid;

            -- writes/reads
            addr := to_integer(unsigned(data_addr));
            if data_write_en = '1' then
                ram(addr) <= data_out;
            elsif data_read_en = '1' then
                data_in(0)       <= ram(addr);
                data_in_valid(0) <= '1';
            end if;
        end if;
    end process ram_proc;

    ---------------------------------------------------
    -- print memory bus transactions
    ---------------------------------------------------
    log_memio_proc : process (data_write_en, data_read_en, data_valid, clk) is
        variable l : line;
    begin  -- process log_memio_proc
        if data_write_en = '1' and clk = '0' then
            write(l, string'("W "));
            write(l, hstr(data_addr));
            write(l, string'(", "));
            write(l, hstr(data_out));
            writeline(memfile, l);
        end if;

        if (data_valid = '1' and clk = '0') then
            write(l, string'("R "));
            write(l, hstr(data_addr));
            write(l, string'(", "));
            write(l, hstr(data_in(data_in'high)));
            writeline(memfile, l);
        end if;
    end process log_memio_proc;

    -- instantiate the unit under test
    uut : entity work.pipeline(Behavioral)
        generic map (
            g_initial_pc => (others => '0'),
            g_for_sim    => true)
        port map (
            clk           => clk,
            rst_n         => rst_n,
            insn_in       => insn_in,
            insn_addr     => insn_addr,
            insn_valid    => insn_valid,
            data_in       => data_in(data_in'high),
            data_out      => data_out,
            data_addr     => data_addr,
            data_write_en => data_write_en,
            data_read_en  => data_read_en,
            data_in_valid => data_valid);

    -- purpose: Provide stimulus to test the pipeline
    stimulus_proc : process is
        variable i : natural := 0;
    begin  -- process stimulus_proc
        -- reset sequence        
        println ("Beginning simulation");

        -- fill up the instruction memory
        rst_n <= '0';
        wait for clk_period * 2;
        rst_n <= '1';

        -- begin stimulus
        wait for clk_period;
        insn_valid <= '1';

        -- run for a bit.
        wait for clk_period * 35;

        -- finished with simulation
        ----------------------------------------------------------------
        println("Simulation complete");
        ----------------------------------------------------------------

        done <= true;
        wait;

    end process stimulus_proc;
    
end architecture testbench;

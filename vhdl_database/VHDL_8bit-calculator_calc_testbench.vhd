library IEEE;

use IEEE.std_logic_1164.all;

entity calc_testbench is end calc_testbench;

architecture tb of calc_testbench is

    component calculator is 
        port(
            input : in std_logic_vector (0 to 7);
            input_valid : in std_logic;

            output : out std_logic_vector (0 to 7);
            output_valid : out std_logic;

            clk : in std_logic;
            rst : in std_logic);
    end component;

    signal input : std_logic_vector (0 to 7);
    signal input_valid : std_logic;

    signal output : std_logic_vector (0 to 7);
    signal output_valid : std_logic;

    signal clk : std_logic;
    signal rst : std_logic;

    constant clk_period : time := 10 ns;
    constant clk_cycle : time := clk_period * 2;

begin

    calc_comp : calculator port map(
        input => input,
        input_valid => input_valid,
        output => output,
        output_valid => output_valid,
        clk => clk,
        rst => rst
    );

    rst_proc : process
    begin
        rst <= '0';
        wait;
    end process;

    clock_proc : process
    begin
        clk <= '0';
        wait for clk_period;
        clk <= '1';
        wait for clk_period;
    end process;

    input_proc : process
    begin

        -- sync
        wait for clk_period;

        ------------------------
        -- Test add operation --
        ------------------------

        -- Test: 1 + 1 = 2
        -- input 1
        input <= "00000001";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- operator +
        input <= "00000000";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 2
        input <= "00000001";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;

        -- wait for output
        input <= "00000000";
        wait for 16 * clk_cycle;

        -- Test: 5 + 12 = 17 (00010001)
        -- input 1
        input <= "00000101";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- operator +
        input <= "00000000";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 2
        input <= "00001100";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;

        -- wait for output
        input <= "00000000";
        wait for 16 * clk_cycle;

        -- Test: 255 + 255 = 255
        -- input 1
        input <= "11111111";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- operator +
        input <= "00000000";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 2
        input <= "11111111";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;

        -- wait for output
        input <= "00000000";
        wait for 16 * clk_cycle;


        -----------------------------
        -- Test subtract operation --
        -----------------------------

        -- Test: 3 - 1 = 2
        -- input 1
        input <= "00000011";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- operator -
        input <= "00000001";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 2
        input <= "00000001";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;

        -- wait for output
        input <= "00000000";
        wait for 16 * clk_cycle;

        -- Test: 15 - 16 = 0 
        -- input 1
        input <= "00001111";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- operator -
        input <= "00000001";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 2
        input <= "00010000";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;

        -- wait for output
        input <= "00000000";
        wait for 16 * clk_cycle;

        -----------------------------
        -- Test multiply operation --
        -----------------------------

        -- Test: 3 * 3 = 9
        -- input 1
        input <= "00000011";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- operator *
        input <= "00000010";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 2
        input <= "00000011";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;

        -- wait for output
        input <= "00000000";
        wait for 128 * clk_cycle;

        -- Test: 14 * 8 = 112 (01110000)
        -- input 1
        input <= "00001110";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- operator *
        input <= "00000010";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 2
        input <= "00001000";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;

        -- wait for output
        input <= "00000000";
        wait for 128 * clk_cycle;

        -- Test: 200 * 2 = 255
        -- input 1
        input <= "11001000";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- operator *
        input <= "00000010";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 2
        input <= "00000010";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;

        -- wait for output
        input_valid <= '0';
        input <= "00000000";
        wait for 128 * clk_cycle;


        -----------------------------
        -- Test divide operation --
        -----------------------------

        -- Test: 9 / 3 = 3
        -- input 1
        input <= "00001001";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 2 - divide
        input <= "00000011";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 3 
        input <= "00000011";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;

        -- wait for output
        input_valid <= '0';
        input <= "00000000";
        wait for 128 * clk_cycle;

        -- Test: 128 / 2 = 64
        -- input 1
        input <= "10000000";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 2 - divide
        input <= "00000011";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 3 
        input <= "00000010";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;

        -- wait for output
        input_valid <= '0';
        input <= "00000000";
        wait for 128 * clk_cycle;

        -- Test: 136 / 4 = 34
        -- input 1
        input <= "10001000";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 2 - divide
        input <= "00000011";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;
        -- input 3 
        input <= "00000100";
        input_valid <= '0';
        wait for clk_cycle;
        -- pulse input_valid
        input_valid <= '1';
        wait for clk_cycle;

        -- wait for output
        input_valid <= '0';
        input <= "00000000";
        wait;
        --wait for 128 * clk_cycle;


    end process;
    
end tb;

-- vim: et:ts=4:sw=4:sts=4:ai:hlsearch:nu:

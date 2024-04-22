
-- Vending machine controller

library IEEE;
library work;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.all;

entity vmc_tb is end vmc_tb;

architecture test of vmc_tb is

    component vmc is
    port(
        in_a             : in std_logic;
        in_b             : in std_logic;
        in_c             : in std_logic;
        in_d             : in std_logic;
        in_e             : in std_logic;
        in_f             : in std_logic;
        in_0             : in std_logic;
        in_1             : in std_logic;
        in_2             : in std_logic;
        in_3             : in std_logic;
        in_4             : in std_logic;
        in_5             : in std_logic;
        in_6             : in std_logic;
        in_7             : in std_logic;
        in_8             : in std_logic;
        in_9             : in std_logic;

        clk              : in std_logic;
        rst              : in std_logic;

        nickle_in        : in std_logic;
        dime_in          : in std_logic;
        quarter_in       : in std_logic;

        nickle_out       : out std_logic;
        dime_out         : out std_logic;
        quarter_out      : out std_logic;

        coin_return      : in std_logic;
        selection_out    : out std_logic_vector (0 to 5);
        vend             : out std_logic
        );
    end component;

    signal in_a : std_logic;
    signal in_b : std_logic;
    signal in_c : std_logic;
    signal in_d : std_logic;
    signal in_e : std_logic;
    signal in_f : std_logic;
    signal in_0 : std_logic;
    signal in_1 : std_logic;
    signal in_2 : std_logic;
    signal in_3 : std_logic;
    signal in_4 : std_logic;
    signal in_5 : std_logic;
    signal in_6 : std_logic;
    signal in_7 : std_logic;
    signal in_8 : std_logic;
    signal in_9 : std_logic;

    signal clk : std_logic;
    signal rst : std_logic;

    signal nickle_in : std_logic;
    signal dime_in : std_logic;
    signal quarter_in : std_logic;

    signal nickle_out : std_logic;
    signal dime_out : std_logic;
    signal quarter_out : std_logic;

    signal coin_return : std_logic;
    signal selection_out : std_logic_vector (0 to 5);
    signal vend : std_logic;

    constant clk_period : time := 10 ns;
    constant clk_cycle : time := clk_period*2;
    constant change : integer := 10;

    begin

    unit : vmc 
    port map (
        in_0 => in_0,
        in_1 => in_1,
        in_2 => in_2,
        in_3 => in_3,
        in_4 => in_4,
        in_5 => in_5,
        in_6 => in_6,
        in_7 => in_7,
        in_8 => in_8,
        in_9 => in_9,
        in_a => in_a,
        in_b => in_b,
        in_c => in_c,
        in_d => in_d,
        in_e => in_e,
        in_f => in_f,
        clk => clk,
        rst => rst,
        nickle_in => nickle_in,
        dime_in => dime_in,
        quarter_in => quarter_in,
        nickle_out => nickle_out,
        dime_out => dime_out,
        quarter_out => quarter_out,
        coin_return => coin_return,
        selection_out => selection_out,
        vend => vend
    );

    rest : process begin
        wait for clk_period;
        rst <= '0';
        wait for 48*clk_cycle;
        rst <= '1';
        wait for clk_cycle;
        rst <= '0';
        wait;
    end process;

    clock : process begin
        clk <= '0';
        wait for clk_period;
        clk <= '1';
        wait for clk_period;
    end process;

    selection : process begin
        in_a <= '0'; in_b <= '0'; in_c <= '0'; in_d <= '0';
        in_e <= '0'; in_f <= '0'; in_0 <= '0'; in_1 <= '0';
        in_2 <= '0'; in_3 <= '0'; in_4 <= '0'; in_5 <= '0';
        in_6 <= '0'; in_7 <= '0'; in_8 <= '0'; in_9 <= '0';
        wait for clk_period;
        wait for clk_cycle*4;
        in_a <= '1';
        wait for clk_cycle;
        in_a <= '0';
        in_1 <= '1';
        wait for clk_cycle;
        in_1 <= '0';
        wait for clk_cycle*(change+6);
        in_a <= '1';
        wait for clk_cycle;
        in_a <= '0';
        in_2 <= '1';
        wait for clk_cycle;
        in_2 <= '0';
        wait for clk_cycle*(change+10);
        in_b <= '1';
        wait for clk_cycle;
        in_b <= '0';
        wait;
    end process;  

    coin_ret : process
    begin
        coin_return <= '0';
        wait for clk_period;
        wait for clk_cycle*36;
        coin_return <= '1';
        wait for clk_cycle;
        coin_return <= '0';
        wait;
    end process;

    money : process
    begin
        nickle_in  <= '0';
        dime_in    <= '0';
        quarter_in <= '0';
        wait for clk_period;
        quarter_in <= '1';
        wait for clk_cycle*3;          
        nickle_in  <= '1';
        quarter_in <= '0';
        wait for clk_cycle;
        nickle_in  <= '0';
        wait for clk_cycle*(change+2); 
        quarter_in <= '1';
        wait for clk_cycle*3; 
        nickle_in  <= '1';
        quarter_in <= '0';
        wait for clk_cycle;
        nickle_in  <= '0';
        wait for clk_cycle*(change+2);
        quarter_in <= '1';
        wait for clk_cycle*3; 
        nickle_in  <= '1';
        quarter_in <= '0';
        wait for clk_cycle;
        nickle_in  <= '0';
        wait for clk_cycle*(change);
        nickle_in  <= '1';
        wait for clk_cycle;
        nickle_in  <= '0';
        wait;
    end process; 

end architecture test;

-- vim: et:ts=4:sw=4:sts=4:ai:hlsearch:nu:

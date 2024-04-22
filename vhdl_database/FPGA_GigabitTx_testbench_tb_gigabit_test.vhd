----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.05.2016 08:16:02
-- Design Name: 
-- Module Name: tb_gigabit_test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_gigabit_test is
end tb_gigabit_test;

architecture Behavioral of tb_gigabit_test is
    signal clk100MHz : std_logic := '0'; -- system clock
           -- Control signals
    signal eth_int_b : std_logic := '0'; -- interrupt
    signal eth_pme_b : std_logic := '0'; -- power management event
    signal eth_rst_b : std_logic := '0'; -- reset
           -- Management interface
    signal eth_mdc   : std_logic := '0'; 
    signal eth_mdio  : std_logic := '0';
           -- Receive interface
    signal eth_rxck  : std_logic := '0'; 
    signal eth_rxctl : std_logic := '0';
    signal eth_rxd   : std_logic_vector(3 downto 0) := (others => '0');
           -- Transmit interface
    signal eth_txck  : std_logic := '0';
    signal eth_txctl : std_logic := '0';
    signal eth_txd   : std_logic_vector(3 downto 0) := (others => '0');

    component gigabit_test is
    Port ( clk100MHz : in    std_logic; -- system clock
           switches  : in    std_logic_vector(5 downto 0);
           -- Control signals
           eth_int_b : in    std_logic; -- interrupt
           eth_pme_b : in    std_logic; -- power management event
           eth_rst_b : out   std_logic := '0'; -- reset
           -- Management interface
           eth_mdc   : out   std_logic := '0'; 
           eth_mdio  : inout std_logic := '0';
           -- Receive interface
           eth_rxck  : in    std_logic; 
           eth_rxctl : in    std_logic;
           eth_rxd   : in    std_logic_vector(3 downto 0);
           -- Transmit interface
           eth_txck  : out   std_logic := '0';
           eth_txctl : out   std_logic := '0';
           eth_txd   : out   std_logic_vector(3 downto 0) := (others => '0')
    );
    end component;

begin

uut: gigabit_test Port map (
    clk100MHz => clk100MHz,
           switches => "111110",
           -- Control signals
           eth_int_b => eth_int_b,
           eth_pme_b => eth_pme_b,
           eth_rst_b => eth_rst_b,
           -- Management interface
           eth_mdc   => eth_mdc, 
           eth_mdio  => eth_mdio,
           -- Receive interface
           eth_rxck  => eth_rxck, 
           eth_rxctl => eth_rxctl,
           eth_rxd   => eth_rxd,
           -- Transmit interface
           eth_txck  => eth_txck,
           eth_txctl => eth_txctl,
           eth_txd   => eth_txd
    );

clk_proc: process
    begin
        clk100MHz <= '0';
        wait for 5 ns;
        clk100MHz <= '1';
        wait for 5 ns;        
    end process;
end Behavioral;

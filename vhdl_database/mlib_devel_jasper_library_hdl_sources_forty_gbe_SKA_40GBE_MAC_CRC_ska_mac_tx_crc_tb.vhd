

----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
-- 
-- Create Date: 05.09.2014 10:19:29
-- Design Name: 
-- Module Name: ska_mac_tx_crc_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Calculate CRC for MAC TX only (assumes specific data alignment) - testbench
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

entity ska_mac_tx_crc_tb is
end ska_mac_tx_crc_tb;

architecture arch_ska_mac_tx_crc_tb of ska_mac_tx_crc_tb is

    component mac_hard_crc_tx
    port (
        clk         : in std_logic;
        rst         : in std_logic;
        din         : in std_logic_vector(63 downto 0);
        din_valid   : in std_logic_vector(7 downto 0);
        crc_out     : out std_logic_vector(31 downto 0));
    end component;

--    component tx_crc64_test
--    port (
--        CRC_INIT        : in std_logic_vector(31 downto 0);
--        CRCOUT          : out std_logic_vector(31 downto 0);
--        CRCCLK          : in std_logic;
--        CRCDATAVALID    : in std_logic;
--        CRC_DATAWIDTH   : in std_logic_vector(2 downto 0);
--        CRCIN           : in std_logic_vector(63 downto 0);
--        CRCRESET        : in std_logic);
--    end component;

    component ska_mac_tx_crc
    port (
        clk             : in std_logic;
        crc_reset       : in std_logic;
        crc_init        : in std_logic_vector(31 downto 0);
        data_in         : in std_logic_vector(255 downto 0);
        data_in_val     : in std_logic_vector(31 downto 0);
        crc_out         : out std_logic_vector(31 downto 0));
    end component;

    component ska_mac_rx_crc
    port (
        clk             : in std_logic;
        crc_reset       : in std_logic;
        crc_init        : in std_logic_vector(31 downto 0);
        data_in         : in std_logic_vector(255 downto 0);
        data_in_val     : in std_logic_vector(31 downto 0);
        crc_out         : out std_logic_vector(31 downto 0));
    end component;

    signal clk : std_logic;
    signal rst : std_logic;

    signal din_64 : std_logic_vector(63 downto 0);
    signal din_valid_64 : std_logic_vector(7 downto 0);
    signal crc_out_64  : std_logic_vector(31 downto 0);
    signal data_in_256 : std_logic_vector(255 downto 0);
    signal data_in_val_256 : std_logic_vector(31 downto 0);
    signal crc_out_256 : std_logic_vector(31 downto 0);
    signal crc_out_64_test : std_logic_vector(31 downto 0);
    signal data_valid_64_test : std_logic;
    signal crc_out_rx_256 : std_logic_vector(31 downto 0);
     
begin

 	gen_clk : process
 	begin
        clk <= '0';
        wait for 3.2 ns; 	  
        clk <= '1';
        wait for 3.2 ns;       
 	end process;
 	
    gen_din64 : process
    begin
        din_64 <= (others => '0');
        din_valid_64 <= (others => '0');
        data_in_256 <= (others => '0');
        data_in_val_256 <= (others => '0');
        data_valid_64_test <= '0';        
        rst <= '0';
        wait for 2 us;
        wait until rising_edge(clk);
        rst <= '1';
        din_64 <= X"1112131415161718";
        din_valid_64 <= X"FF";
        data_in_256(255 downto 0) <= X"4142434445464748313233343536373821222324252627281112131415161718";
        data_in_val_256 <= X"FFFFFFFF";        
        data_valid_64_test <= '1';        
        wait until rising_edge(clk);
        rst <= '0';
        din_64 <= X"2122232425262728";
        din_valid_64 <= X"FF";
        data_in_256(31 downto 0) <= not X"B8C78E27";
        data_in_256(255 downto 32) <= (others => '0');
        data_in_val_256 <= X"000000FF";
        data_valid_64_test <= '1';        
        wait until rising_edge(clk);
        rst <= '0';
        din_64 <= X"3132333435363738";
        din_valid_64 <= X"FF";
        data_in_256 <= (others => '0');
        data_in_val_256 <= (others => '0');
        data_valid_64_test <= '1';        
        wait until rising_edge(clk);
        rst <= '0';
        din_64 <= X"4142434445464748";
        din_valid_64 <= X"FF";
        data_in_256 <= (others => '0');
        data_in_val_256 <= (others => '0');
        data_valid_64_test <= '1';        
        wait until rising_edge(clk);
        data_in_256 <= (others => '0');
        data_in_val_256 <= (others => '0');        
        din_64 <= (others => '0');
        din_valid_64 <= (others => '0');
        data_valid_64_test <= '0';        
        wait;    
    end process;

    mac_hard_crc_tx_0 : mac_hard_crc_tx 
    port map(
        clk         => clk,
        rst         => rst,
        din         => din_64,
        din_valid   => din_valid_64,
        crc_out     => crc_out_64);

    ska_mac_tx_crc_0 : ska_mac_tx_crc
    port map(
        clk             => clk,
        crc_reset       => rst,
        crc_init        => (others => '1'),
        data_in         => data_in_256,
        data_in_val     => data_in_val_256,
        crc_out         => crc_out_256);

    ska_mac_rx_crc_0 : ska_mac_rx_crc
    port map(
        clk             => clk,
        crc_reset       => rst,
        crc_init        => (others => '1'),
        data_in         => data_in_256,
        data_in_val     => data_in_val_256,
        crc_out         => crc_out_rx_256);

--    tx_crc64_test_0 : tx_crc64_test
--    port map(
--        CRC_INIT        => (others => '1'),
--        CRCOUT          => crc_out_64_test,
--        CRCCLK          => clk,
--        CRCDATAVALID    => data_valid_64_test,
--        CRC_DATAWIDTH   => "111",
--        CRCIN           => din_64,
--        CRCRESET        => rst);


 	
 	
 	
end arch_ska_mac_tx_crc_tb;

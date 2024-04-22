----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2016 17:26:37
-- Design Name: 
-- Module Name: rgmii_rx - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity rgmii_rx is
    Port ( rx_clk           : in  STD_LOGIC;
           rx_ctl           : in  STD_LOGIC;
           rx_data          : in  STD_LOGIC_VECTOR (3 downto 0);
           link_10mb        : out STD_LOGIC;
           link_100mb       : out STD_LOGIC;
           link_1000mb      : out STD_LOGIC;
           link_full_duplex : out STD_LOGIC;
           data             : out STD_LOGIC_VECTOR (7 downto 0);
           data_valid       : out STD_LOGIC;
           data_enable      : out STD_LOGIC;
           data_error       : out STD_LOGIC);
end rgmii_rx;

architecture Behavioral of rgmii_rx is
    signal raw_ctl  : std_logic_vector(1 downto 0);
    signal raw_data : std_logic_vector(7 downto 0) := (others => '0');
begin
ddr_rx_ctl : IDDR generic map (DDR_CLK_EDGE => "SAME_EDGE_PIPELINED", INIT_Q1 => '0', INIT_Q2 => '0', SRTYPE => "SYNC")  
    port map (Q1 => raw_ctl(0), Q2 => raw_ctl(1), C  => rx_clk, CE => '1', D  => rx_ctl, R  => '0', S  => '0');
ddr_rxd0 : IDDR generic map (DDR_CLK_EDGE => "SAME_EDGE_PIPELINED", INIT_Q1 => '0', INIT_Q2 => '0', SRTYPE => "SYNC")  
    port map (Q1 => raw_data(0), Q2 => raw_data(4), C  => rx_clk, CE => '1', D  => rx_data(0), R  => '0', S  => '0');
ddr_rxd1 : IDDR generic map (DDR_CLK_EDGE => "SAME_EDGE_PIPELINED", INIT_Q1 => '0', INIT_Q2 => '0', SRTYPE => "SYNC")  
    port map (Q1 => raw_data(1), Q2 => raw_data(5), C  => rx_clk, CE => '1', D  => rx_data(1), R  => '0', S  => '0');
ddr_rxd2 : IDDR generic map (DDR_CLK_EDGE => "SAME_EDGE_PIPELINED", INIT_Q1 => '0', INIT_Q2 => '0', SRTYPE => "SYNC")  
    port map (Q1 => raw_data(2), Q2 => raw_data(6), C  => rx_clk, CE => '1', D  => rx_data(2), R  => '0', S  => '0');
ddr_rxd3 : IDDR generic map (DDR_CLK_EDGE => "SAME_EDGE_PIPELINED", INIT_Q1 => '0', INIT_Q2 => '0', SRTYPE => "SYNC")  
    port map (Q1 => raw_data(3), Q2 => raw_data(7), C  => rx_clk, CE => '1', D  => rx_data(3), R  => '0', S  => '0');

process(rx_clk) 
    begin
        if rising_edge(rx_clk) then
            data_valid <= raw_ctl(0);
            data_error <= raw_ctl(0) XOR raw_ctl(1);
            data       <= raw_data;
            -- check for inter-frame with matching upper and lower nibble
            if raw_ctl = "00"  and raw_data(3 downto 0) = raw_data(7 downto 4) then
                link_10mb        <= '0';
                link_100mb       <= '0';
                link_1000mb      <= '0';
                link_full_duplex <= '0';
                case raw_data(2 downto 0) is
                    when "001" => link_10mb   <= '1'; link_full_duplex <= raw_data(3);
                    when "011" => link_100mb  <= '1'; link_full_duplex <= raw_data(3);
                    when "101" => link_1000mb <= '1'; link_full_duplex <= raw_data(3);
                    when others => NULL;
                end case;
            end if; 
        end if;
    end process;
end Behavioral;

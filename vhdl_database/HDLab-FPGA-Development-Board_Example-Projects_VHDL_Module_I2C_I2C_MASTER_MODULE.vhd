----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:29:22 03/25/2015 
-- Design Name: 
-- Module Name:    I2C_MASTER_MODULE - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity I2C_MASTER_MODULE is
port(
clk,reset : in std_logic;
reset_av : out std_logic;
scl : inout std_logic;
sda : inout std_logic;
falt : out std_logic;
busy : out std_logic;
free : out std_logic;
i2c_end : out std_logic);
end I2C_MASTER_MODULE;

architecture Behavioral of I2C_MASTER_MODULE is

signal tik_boad : std_logic;
signal max_tick : std_logic;
signal akt_send : std_logic;
signal douta : std_logic_vector(23 downto 0);
signal addra : std_logic_vector(2 downto 0);

begin

ROM_MODULE : entity work.ROM_I2C
port map (clka => clk , addra => addra(1 downto 0) , douta => douta);

I2C_MASTER_CORE : entity work.I2C_MASTER
port map (
clk => clk,reset => reset , max_tik => tik_boad ,
scl => scl ,sda => sda ,address_akt => douta(23 downto 16) ,address_reg => douta(15 downto 8) ,data_reg => douta(7 downto 0) ,tik_boad => max_tick , start_send => addra(2), akt_send => akt_send , falt => falt , busy => busy , free => free);

I2C_clk_core: entity work.I2C_CLK
port map (
clk => clk,reset => reset ,max_tick => max_tick,clk_out => tik_boad );

timer_core : entity work.timer 
port map(
clk => akt_send,reset => reset ,Q => addra);

reset_av <= reset;
i2c_end <= addra(2);	 

end Behavioral;


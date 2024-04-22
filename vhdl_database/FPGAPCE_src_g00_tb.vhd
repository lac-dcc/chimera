library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity g00_tb is
end g00_tb;

architecture sim of g00_tb is

signal LDATA 	: std_logic_vector(23 downto 0);
signal RDATA	: std_logic_vector(23 downto 0);

signal CLK		: std_logic;
signal RST		: std_logic;
signal INIT		: std_logic;
signal WE		: std_logic;

signal PULSE_48KHZ	: std_logic;
signal AUD_MCLK		: std_logic;
signal AUD_BCLK		: std_logic;
signal AUD_DACDAT	: std_logic;
signal AUD_DACLRCK	: std_logic;
signal I2C_SDAT		: std_logic;
signal I2C_SCLK		: std_logic;

begin

g00 : entity work.g00_audio_interface
port map(
	LDATA	=> LDATA,
	RDATA	=> RDATA,     
	clk		=> CLK, 
	rst 	=> RST,
	INIT	=> INIT,
	W_EN	=> WE,
	pulse_48KHz	=> PULSE_48KHZ,
	AUD_MCLK	=> AUD_MCLK,
	AUD_BCLK	=> AUD_BCLK,
	AUD_DACDAT	=> AUD_DACDAT,
	AUD_DACLRCK	=> AUD_DACLRCK,
	I2C_SDAT	=> I2C_SDAT,
	I2C_SCLK	=> I2C_SCLK
);


LDATA <= (others => '0');
RDATA <= (others => '1');

-- CLOCK (24 MHz)
process
begin
	CLK <= '0';
	wait for 20.833 ns;
	CLK <= '1';
	wait for 20.833 ns;
end process;

-- RESET
process
begin
	RST <= '1';
	wait for 100 ns;
	RST <= '0';
	wait;
end process;

-- INIT
process
begin
	INIT <= '0';
	wait for 150 ns;
	INIT <= '1';
	wait;
end process;

WE <= '0';

end sim;
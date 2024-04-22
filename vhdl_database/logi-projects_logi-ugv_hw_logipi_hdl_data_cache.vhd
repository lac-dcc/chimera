----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:31:18 03/20/2014 
-- Design Name: 
-- Module Name:    data_cache - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_cache is
generic(PORT_A_WIDTH : positive := 16; PORT_B_WIDTH : positive := 32);
port(
	clk, reset : in std_logic ;
	
	port_a_line_number : in std_logic_vector(2 downto 0);
	port_b_line_number : in std_logic_vector(2 downto 0);
	
	port_a_line_address : in std_logic_vector(6 downto 0);
	port_b_line_address : in std_logic_vector(5 downto 0);
	
	port_a_line_datain : in std_logic_vector(PORT_A_WIDTH-1 downto 0);
	port_b_line_datain : in std_logic_vector(PORT_B_WIDTH-1 downto 0);
	
	port_a_line_dataout : out std_logic_vector(PORT_A_WIDTH-1 downto 0);
	port_b_line_dataout : out std_logic_vector(PORT_B_WIDTH-1 downto 0);
	
	port_a_write, port_b_write : in std_logic ;
	
	cache_invalid : in std_logic ;
	line_dirty : out std_logic_vector(7 downto 0);
	line_clean : in std_logic_vector(7 downto 0)
	

);
end data_cache;

architecture Behavioral of data_cache is

component tdp_bram is
generic (
    DATA_A    : integer := 16;
    ADDR_A    : integer := 10;
	 DATA_B    : integer := 16;
    ADDR_B    : integer := 10
);
port (
    -- Port A
    a_clk   : in  std_logic;
    a_wr    : in  std_logic;
    a_addr  : in  std_logic_vector(ADDR_A-1 downto 0);
    a_din   : in  std_logic_vector(DATA_A-1 downto 0);
    a_dout  : out std_logic_vector(DATA_A-1 downto 0);
     
    -- Port B
    b_clk   : in  std_logic;
    b_wr    : in  std_logic;
    b_addr  : in  std_logic_vector(ADDR_B-1 downto 0);
    b_din   : in  std_logic_vector(DATA_B-1 downto 0);
    b_dout  : out std_logic_vector(DATA_B-1 downto 0)
);
end component;

signal cache_line_dirty : std_logic_vector(2 downto 0);
begin


cache_mem : tdp_bram
		generic map(DATA_A => PORT_A_WIDTH, ADDR_A => 10, DATA_B => PORT_B_WIDTH, ADDR_B => 9)
		port map(
			-- Port A
			a_clk	=> clk,
			a_wr	=> port_a_write,
			a_addr => (port_a_line_number & port_a_line_address),
			a_din	=> port_a_line_datain,
			a_dout => port_a_line_dataout,

			-- Port B
			b_clk   => clk,
			b_wr    => port_b_write,
			b_addr  => (port_b_line_number & port_b_line_address),
			b_din   => port_b_line_datain,
			b_dout  => port_b_line_dataout
		);
		
line_dirty_proc : process(clk, reset)
begin
    if reset = '1' then
       cache_line_dirty <= (others => '0');
    elsif rising_edge(clk) then
		if cache_invalid = '1' then
		 cache_line_dirty <= (others => '1');
		elsif line_clean /= 0 then
			cache_line_dirty <=  cache_line_dirty AND (NOT line_clean); -- cleaning only required lines
		elsif port_a_write= '1' then -- flag the ram with dirty whenever its written by logic
			cache_line_dirty(conv_integer(port_a_line_number)) <= '1' ;
		end if ;
    end if;
end process line_dirty_proc;				

end Behavioral;


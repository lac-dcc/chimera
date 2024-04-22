----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:22:48 04/12/2012 
-- Design Name: 
-- Module Name:    FAST_with_NMS - Behavioral 
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

entity FAST_with_NMS is
port(
			clk, rst, ce : in std_logic;
			data_in : in std_logic_vector(7 downto 0);
			iscorner : out std_logic;
			x_coord, y_coord : out std_logic_vector(9 downto 0)
		);
end FAST_with_NMS;

architecture Behavioral of FAST_with_NMS is

signal x_coord_int, y_coord_int : std_logic_vector(9 downto 0);
signal score_int : std_logic_vector(12 downto 0);
signal iscorner_int : std_logic;

component NMS_top is
port(
		data_in : in std_logic_vector(12 downto 0); -- corner score data
		iscorner, clk, EN, rst : in std_logic;	-- contig + clock data
		x_coord_in, y_coord_in : in std_logic_vector(9 downto 0);
		x_coord_out, y_coord_out : out std_logic_vector(9 downto 0);
		corner_out : out std_logic -- corners detected after NMS
);
end component;

component fast_main_top is
port(				
			data_in : in std_logic_vector(7 downto 0);
			clk, rst, ce : in std_logic;
			iscorner : out  std_logic;
			x_coord : out std_logic_vector(9 downto 0);			-- delayed X coord.
			y_coord : out std_logic_vector(9 downto 0);			-- delayed Y coord.
			score : out std_logic_vector(12 downto 0)
		);
end component;


begin

do_fast : fast_main_top port map(
													data_in => data_in,
													clk => clk,
													ce => ce,
													rst => rst,
													iscorner => iscorner_int,
													x_coord => x_coord_int,
													y_coord => y_coord_int,
													score => score_int
											);


do_nms : NMS_top port map(
													clk => clk,
													EN => ce,
													rst => rst,
													data_in => score_int,
													x_coord_in => x_coord_int,
													y_coord_in => y_coord_int,
													x_coord_out => x_coord,
													y_coord_out => y_coord,
													iscorner => iscorner_int,
													corner_out => iscorner
													
								);

end Behavioral;


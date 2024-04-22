library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

use ieee.numeric_std.all;
use std.textio.all;
use work.txt_util.all;
-- uncomment the following library declaration if using
-- arithmetic functions with signed or unsigned values
--use ieee.numeric_std.all;
 
entity rom_tb is
generic (
			constant data_width : integer := 8;
            constant addr_cnt	:integer := 20;
			constant rom_depth  : integer := 76800
			--			
			--constant data_width : integer := 8;
            --constant addr_cnt	:integer := 10;
			--constant rom_depth  : integer := 256
);
end rom_tb;
 
architecture behavior of rom_tb is 
 
	file edge_dete_file: text open write_mode is "edge_dete.dat";	
	component image_process is
	port (
		clk : in std_logic;
		en : in std_logic;
		rst : in std_logic;
			
--		r33, r32, r31, r23,r22,r21,r13,r12,r11 : out std_logic_vector(data_width-1 downto 0)		
		edge_dete_valid : out std_logic;
		edge_dete_data: out std_logic_vector(data_width - 1 downto  0)
	  );
	end component;


   --inputs
   signal clk : std_logic ;
   signal en : std_logic  ;
   signal rst : std_logic ;


	signal s_edge_dete_valid : std_logic;
	signal s_edge_dete_data : std_logic_vector(data_width - 1 downto 0);
   -- clock period definitions
   constant clk_period : time := 10 ns;
   
   

begin
	
   med: image_process
   port map (
        clk => clk,
        en => en,
        rst => rst,
		
		edge_dete_data => s_edge_dete_data,
		edge_dete_valid => s_edge_dete_valid
			
        );

   -- clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	rst_process: process
	begin
		rst <= '0';
		wait for clk_period * 10;
		rst <= '1';
		en <= '1';
		wait;
	end process;
	
	
	
	edge_dete_write : process(clk, rst)
		variable outline : line;
	begin
		if rst = '0' then 
		elsif rising_edge(clk) then
			if s_edge_dete_valid = '1' then
			write(outline, s_edge_dete_data);
			writeline(edge_dete_file, outline);
			end if;
		end if;
		
	end process;


end;

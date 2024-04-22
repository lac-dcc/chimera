-- Listing 4.21
--// notes to run on logi:
--// * the read write functions are controlled by btn(0)=write and btn(1)=read
--// * the sw(1:0) controls the write data that is written into the fifo when write btn is pushed.
--// * When btn(1) is pushed the data is read from the fifo and dispalyed on bit(1:0) of the leds.
--// * the 4xsseg dispaly is used to emulate 8x linear leds that will display the buffer
--// status and read data.  
library ieee;
use ieee.std_logic_1164.all;
entity fifo_test is
   port(
      clk: in std_logic;
      btn_n: std_logic_vector(1 downto 0);
		an: out std_logic_vector(3 downto 0);
		sseg: out std_logic_vector(7 downto 0);
      sw_n: std_logic_vector(1 downto 0)
    
   );
end fifo_test;

architecture arch of fifo_test is
   signal db_btn: std_logic_vector(1 downto 0);
	
	signal led, test: std_logic_vector(7 downto 0);
	signal sw, btn: std_logic_vector(1 downto 0);
begin
	sw <= not(sw_n);
	btn <= not(btn_n);

   -- debounce circuit for btn(0)
   btn_db_unit0: entity work.debounce(fsmd_arch)
      port map(clk=>clk, 
					reset=>'0', 
					sw=>btn(0),
               db_level=>open, 
					db_tick=>db_btn(0)
					);
   -- debounce circuit for btn(1)
   btn_db_unit1: entity work.debounce(fsmd_arch)
      port map(clk=>clk, 
					reset=>'0', 
					sw=>btn(1),
               db_level=>open, 
					db_tick=>db_btn(1)
					);
   -- instantiate a 2^2-by-3 fifo)
   fifo_unit: entity work.fifo(arch)
      generic map(B=>3, W=>2)
      port map(clk=>clk, 
					reset=>'0',
               rd=>db_btn(0), 
					wr=>db_btn(1),
               w_data=>"0" & sw, --upper 2 bits are set to high
					r_data=>led(2 downto 0),
               full=>led(7), 
					empty=>led(6)
					);
 
	-- disable unused leds
   led(5 downto 3)<=(others=>'0');
	

 led8_sseg_unit: entity work.led8_sseg
	 port map (
		   clk  => clk,
		   reset  => '0', 
		   led => led, 
		   an_edu => an, 
		   sseg_out => sseg
	 );
	
	
 end arch;
--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library work;
use work.zpuino_config.all;

package papilio_pkg is

 type wishbone_bus_in_type is record
    wb_clk_i:    std_logic;                     -- Wishbone clock
    wb_rst_i:    std_logic;                     -- Wishbone reset (synchronous)
    wb_dat_i:    std_logic_vector(31 downto 0); -- Wishbone data input  (32 bits)
    wb_adr_i:    std_logic_vector(26 downto 2); -- Wishbone address input  (32 bits)
    wb_we_i:     std_logic;                     -- Wishbone write enable signal
    wb_cyc_i:    std_logic;                     -- Wishbone cycle signal
    wb_stb_i:    std_logic;                     -- Wishbone strobe signal
 end record;
 
 type wishbone_bus_out_type is record
    wb_dat_o:    std_logic_vector(31 downto 0); -- Wishbone data output (32 bits)
    wb_ack_o:    std_logic;                      -- Wishbone acknowledge out signal
    wb_inta_o:   std_logic;
	wb_id_o:    std_logic_vector(15 downto 0);	
 end record; 

 type gpio_bus_in_type is record
    gpio_i:   std_logic_vector(48 downto 0);
    gpio_spp_data: std_logic_vector(PPSCOUNT_OUT-1 downto 0);
 end record; 
 
 type gpio_bus_out_type is record
	 gpio_clk:  std_logic;
    gpio_o:    std_logic_vector(48 downto 0);
    gpio_t:    std_logic_vector(48 downto 0);
    gpio_spp_read:  std_logic_vector(PPSCOUNT_IN-1 downto 0); 
 end record;  

 type gpio_bus_in_duo_type is record
    gpio_i:   std_logic_vector(54 downto 0);
    gpio_spp_data: std_logic_vector(54 downto 0);
 end record; 
 
 type gpio_bus_out_duo_type is record
	 gpio_clk:  std_logic;
    gpio_o:    std_logic_vector(54 downto 0);
    gpio_t:    std_logic_vector(54 downto 0);
    gpio_spp_read:  std_logic_vector(54 downto 0); 
 end record;    

end papilio_pkg;

package body papilio_pkg is

 
end papilio_pkg;

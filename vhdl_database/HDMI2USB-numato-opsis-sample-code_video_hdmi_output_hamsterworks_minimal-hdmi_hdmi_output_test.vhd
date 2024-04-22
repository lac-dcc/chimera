----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Top level design for my minimal HDMI output project
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hdmi_output_test is
    Port ( clk50         : in  STD_LOGIC;

           hdmi_out_p : out  STD_LOGIC_VECTOR(3 downto 0);
           hdmi_out_n : out  STD_LOGIC_VECTOR(3 downto 0);
                      
           leds       : out std_logic_vector(7 downto 0));
end hdmi_output_test;

architecture Behavioral of hdmi_output_test is

   COMPONENT vga_gen
   PORT(
      clk50           : IN std_logic;          
      pixel_clock     : OUT std_logic;
      red_p           : OUT std_logic_vector(7 downto 0);
      green_p         : OUT std_logic_vector(7 downto 0);
      blue_p          : OUT std_logic_vector(7 downto 0);
      blank           : OUT std_logic;
      hsync           : OUT std_logic;
      vsync           : OUT std_logic
      );
   END COMPONENT;

   COMPONENT Minimal_hdmi_symbols
   PORT(
      clk : IN std_logic;
      blank : IN std_logic;
      hsync : IN std_logic;
      vsync : IN std_logic;
      red   : IN std_logic;
      green : IN std_logic;
      blue  : IN std_logic;          
      c0    : OUT std_logic_vector(9 downto 0);          
      c1    : OUT std_logic_vector(9 downto 0);          
      c2    : OUT std_logic_vector(9 downto 0)         
      );
   END COMPONENT;
 
	COMPONENT serializers
	PORT(
		clk : IN std_logic;
		c0 : IN std_logic_vector(9 downto 0);
		c1 : IN std_logic_vector(9 downto 0);
		c2 : IN std_logic_vector(9 downto 0);          
		hdmi_p : OUT std_logic_vector(3 downto 0);
		hdmi_n : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
 
   signal pixel_clock     : std_logic;

   signal red_p   : std_logic_vector(7 downto 0);
   signal green_p : std_logic_vector(7 downto 0);
   signal blue_p  : std_logic_vector(7 downto 0);
   signal blank   : std_logic;
   signal hsync   : std_logic;
   signal vsync   : std_logic;          

   signal c0, c1, c2 : std_logic_vector(9 downto 0);
begin
   leds <= x"AA";
   
---------------------------------------
-- Generate a 1280x720 VGA test pattern
---------------------------------------
Inst_vga_gen: vga_gen PORT MAP(
      clk50 => clk50,
      pixel_clock     => pixel_clock,      
      red_p           => red_p,
      green_p         => green_p,
      blue_p          => blue_p,
      blank           => blank,
      hsync           => hsync,
      vsync           => vsync
   );

---------------------------------------------------
-- Convert 9 bits of the VGA signals to the DVI-D/TMDS output 
---------------------------------------------------
i_Minimal_hdmi_symbols: Minimal_hdmi_symbols PORT MAP(
      clk    => pixel_clock,
      blank  => blank,
      hsync  => hsync,
      vsync  => vsync,
      red    => red_p(7),
      green  => green_p(7),
      blue   => blue_p(7),
      c0     => c0,
      c1     => c1,
      c2     => c2
   );

i_serializers : serializers PORT MAP (
      clk    => pixel_clock,
      c0     => c0,
      c1     => c1,
      c2     => c2,
      hdmi_p => hdmi_out_p,
      hdmi_n => hdmi_out_n);
      
end Behavioral;

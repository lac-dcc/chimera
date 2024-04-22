library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dvid_output_test is
    Port ( clk50         : in  STD_LOGIC;

           hdmi_out_p : out  STD_LOGIC_VECTOR(3 downto 0);
           hdmi_out_n : out  STD_LOGIC_VECTOR(3 downto 0));
end dvid_output_test;

architecture Behavioral of dvid_output_test is

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


   COMPONENT MinimalDVID_encoder
   PORT(
      clk : IN std_logic;
      blank : IN std_logic;
      hsync : IN std_logic;
      vsync : IN std_logic;
      red : IN std_logic_vector(2 downto 0);
      green : IN std_logic_vector(2 downto 0);
      blue : IN std_logic_vector(2 downto 0);          
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

begin

---------------------------------------
-- Generate a 800x600 VGA test pattern
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
Inst_MinimalDVID_encoder: MinimalDVID_encoder PORT MAP(
      clk    => pixel_clock,
      blank  => blank,
      hsync  => hsync,
      vsync  => vsync,
      red    => red_p(7 downto 5),
      green  => green_p(7 downto 5),
      blue   => blue_p(7 downto 5),
      hdmi_p => hdmi_out_p,
      hdmi_n => hdmi_out_n
   );

end Behavioral;

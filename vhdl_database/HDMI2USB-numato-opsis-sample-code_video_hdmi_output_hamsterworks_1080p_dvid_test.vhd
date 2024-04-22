----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Description: dvid_test 
--  Top level design for testing my DVI-D interface
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

entity dvid_test is
    Port ( clk_50  : in  STD_LOGIC;
           tmds    : out  STD_LOGIC_VECTOR(3 downto 0);
           tmdsb   : out  STD_LOGIC_VECTOR(3 downto 0));
end dvid_test;

architecture Behavioral of dvid_test is
   component clocking
   port (
      -- Clock in ports
      CLK_50      : in     std_logic;
      -- Clock out ports
      CLK_TMDS0   : out    std_logic;
      CLK_TMDS90  : out    std_logic;
      CLK_pixel     : out    std_logic
   );
   end component;

   COMPONENT dvid
   PORT(
      clk_tmds0  : IN std_logic;
      clk_tmds90 : IN std_logic;
      clk_pixel  : IN std_logic;
      red_p      : IN std_logic_vector(7 downto 0);
      green_p    : IN std_logic_vector(7 downto 0);
      blue_p     : IN std_logic_vector(7 downto 0);
      blank      : IN std_logic;
      hsync      : IN std_logic;
      vsync      : IN std_logic;          
      red_s      : OUT std_logic;
      green_s    : OUT std_logic;
      blue_s     : OUT std_logic;
      clock_s    : OUT std_logic
      );
   END COMPONENT;

   COMPONENT vga
   generic (
      hRez        : natural;
      hStartSync  : natural;
      hEndSync    : natural;
      hMaxCount   : natural;
      hsyncActive : std_logic;

      vRez        : natural;
      vStartSync  : natural;
      vEndSync    : natural;
      vMaxCount   : natural;
      vsyncActive : std_logic
    );

   PORT(
      pixelClock : IN std_logic;          
      Red : OUT std_logic_vector(7 downto 0);
      Green : OUT std_logic_vector(7 downto 0);
      Blue : OUT std_logic_vector(7 downto 0);
      hSync : OUT std_logic;
      vSync : OUT std_logic;
      blank : OUT std_logic
      );
   END COMPONENT;

   signal clk_tmds0  : std_logic := '0';
   signal clk_tmds90 : std_logic := '0';
   signal clk_pixel  : std_logic := '0';

   signal red     : std_logic_vector(7 downto 0) := (others => '0');
   signal green   : std_logic_vector(7 downto 0) := (others => '0');
   signal blue    : std_logic_vector(7 downto 0) := (others => '0');
   signal hsync   : std_logic := '0';
   signal vsync   : std_logic := '0';
   signal blank   : std_logic := '0';
   signal red_s   : std_logic;
   signal green_s : std_logic;
   signal blue_s  : std_logic;
   signal clock_s : std_logic;
begin
   
   
I_clocking : clocking port map (
      CLK_50     => clk_50,
      CLK_tmds0  => clk_tmds0,
      CLK_tmds90 => clk_tmds90,
      CLK_pixel  => clk_pixel
    );

I_dvid: dvid PORT MAP(
      clk_tmds0  => clk_tmds0,
      clk_tmds90 => clk_tmds90, 
      clk_pixel  => clk_pixel,
      red_p      => red,
      green_p    => green,
      blue_p     => blue,
      blank      => blank,
      hsync      => hsync,
      vsync      => vsync,
      -- outputs to TMDS drivers
      red_s      => red_s,
      green_s    => green_s,
      blue_s     => blue_s,
      clock_s    => clock_s
   );
   
OBUFDS_blue  : OBUFDS port map ( O  => TMDS(0), OB => TMDSB(0), I  => blue_s  );
OBUFDS_red   : OBUFDS port map ( O  => TMDS(1), OB => TMDSB(1), I  => red_s   );
OBUFDS_green : OBUFDS port map ( O  => TMDS(2), OB => TMDSB(2), I  => green_s );
OBUFDS_clock : OBUFDS port map ( O  => TMDS(3), OB => TMDSB(3), I  => clock_s );
    -- generic map ( IOSTANDARD => "DEFAULT")    
   
I_vga: vga GENERIC MAP (

-- For 1280x720  - set clocks to 75MHz & 187.5MHz
--     hRez       => 1280, hStartSync => 1352, hEndSync   => 1432, hMaxCount  => 1648, hsyncActive => '1',
--     vRez       => 720,  vStartSync =>  723, vEndSync   =>  728, vMaxCount  =>  750, vsyncActive => '1'
			
-- For 1920x1080 @ 60Hz  - set clocks to 150MHz & 375MHz
--"1920x1080" 148,500 1920 2008 2052 2200 1080 1084 1089 1125 +hsync +vsync
      hRez       => 1920, hStartSync => 2008, hEndSync   => 2052, hMaxCount  => 2200, hsyncActive => '1',
      vRez       => 1080, vStartSync => 1084, vEndSync   => 1089, vMaxCount  => 1125, vsyncActive => '1'

   ) PORT MAP(
      pixelClock => clk_pixel,
      Red        => red,
      Green      => green,
      Blue       => blue,
      hSync      => hSync,
      vSync      => vSync,
      blank      => blank
   );
end Behavioral;
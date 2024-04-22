--------------------------------------------------------------------------------
-- Engineers:     Mike Field <hamster@snap.net.nz>
--                Alvaro Lopes <alvieboy@alvie.com>
-- Description:   Converts VGA signals into DVID bitstreams.
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

entity dvid is
    Port ( clk       : in  STD_ULOGIC;
           clk_pixel : in  STD_ULOGIC;
           clk2x     : in std_ulogic;
           pll_locked: in std_ulogic;
           lock_out  : out std_ulogic;
           red_p     : in  STD_LOGIC_VECTOR (7 downto 0);
           green_p   : in  STD_LOGIC_VECTOR (7 downto 0);
           blue_p    : in  STD_LOGIC_VECTOR (7 downto 0);
           blank     : in  STD_LOGIC;
           guard     : in  STD_LOGIC;
           startp    : in  STD_LOGIC;
           dataisland: in  STD_LOGIC;
           indata    : in  STD_LOGIC;
           data0     : in  STD_LOGIC_VECTOR(3 downto 0);
           data1     : in  STD_LOGIC_VECTOR(3 downto 0);
           data2     : in  STD_LOGIC_VECTOR(3 downto 0);
           hsync     : in  STD_LOGIC;
           vsync     : in  STD_LOGIC;
           red_s     : out STD_ULOGIC;
           green_s   : out STD_ULOGIC;
           blue_s    : out STD_ULOGIC;
           clock_s   : out STD_ULOGIC);
end dvid;

architecture Behavioral of dvid is

  signal encoded_d0, encoded_d1, encoded_d2: std_logic_vector(9 downto 0);

  signal encoded_red, encoded_green, encoded_blue : std_logic_vector(9 downto 0);
  signal encoded_ch0, encoded_ch1,   encoded_ch2  : std_logic_vector(9 downto 0);
   
  signal c_red:   std_logic_vector(1 downto 0);
  signal c_green: std_logic_vector(1 downto 0);
  signal c_blue:  std_logic_vector(1 downto 0);

  signal ioclk:         std_ulogic;
  signal serdesstrobe:  std_ulogic;
  signal dataisland_q:  std_logic;
  signal serdesrst:     std_ulogic;
  signal bufpll_locked: std_ulogic;

begin   
            -- C1   -- C0
  c_blue <= vsync & hsync;
  process(startp, indata)
  begin
    if startp='1' then
      -- CTL1, 0
      c_green<="01";
      if indata='1' then
        -- CLL 3, 2
        c_red<="01";
      else
        c_red<="00";
      end if;
    else
      c_green<="00";
      c_red  <="00";
    end if;
  end process;

  TMDS_encoder_blue:  entity work.TMDS_encoder GENERIC MAP ( CHANNEL => 0 ) PORT MAP(clk => clk_pixel, data => blue_p,  c => c_blue,  blank => blank, guard => guard, indata => indata, encoded => encoded_blue);
  TMDS_encoder_green: entity work.TMDS_encoder GENERIC MAP ( CHANNEL => 1 ) PORT MAP(clk => clk_pixel, data => green_p, c => c_green, blank => blank, guard => guard, indata => indata, encoded => encoded_green);
  TMDS_encoder_red:   entity work.TMDS_encoder GENERIC MAP ( CHANNEL => 2 ) PORT MAP(clk => clk_pixel, data => red_p,   c => c_red,   blank => blank, guard => guard, indata => indata, encoded => encoded_red);

  ipll: BUFPLL
    generic map (
      DIVIDE => 5,
      ENABLE_SYNC => true
    )
    port map (
      IOCLK        => ioclk,
      LOCK         => bufpll_locked,
      SERDESSTROBE => serdesstrobe,
      GCLK         => clk2x,
      LOCKED       => pll_locked,
      PLLIN        => clk
    );

  lock_out <= bufpll_locked;

  process(clk_pixel,pll_locked,bufpll_locked)
  begin
    if pll_locked='0' or bufpll_locked='0' then
      serdesrst<='1';
    elsif rising_edge(clk_pixel) then
      serdesrst<='0';
    end if;
  end process;

  osclk:  entity work.ser10 port map ( clk => ioclk, rst => serdesrst, locked => pll_locked, serdesstrobe => serdesstrobe, clkdiv => clk2x, datain => "0000011111", dataout => clock_s );
  osbluc: entity work.ser10 port map ( clk => ioclk, rst => serdesrst, locked => pll_locked, serdesstrobe => serdesstrobe, clkdiv => clk2x, datain => encoded_ch0, dataout => blue_s );
  osgreen:entity work.ser10 port map ( clk => ioclk, rst => serdesrst, locked => pll_locked, serdesstrobe => serdesstrobe, clkdiv => clk2x, datain => encoded_ch1, dataout => green_s );
  osred:  entity work.ser10 port map ( clk => ioclk, rst => serdesrst, locked => pll_locked, serdesstrobe => serdesstrobe, clkdiv => clk2x, datain => encoded_ch2, dataout => red_s );

  process(clk_pixel)
  begin
    if rising_edge(clk_pixel) then
      dataisland_q<=dataisland;
    end if;
  end process;

  encoded_ch0 <= encoded_blue  when dataisland_q='0' else encoded_d0;
  encoded_ch1 <= encoded_green when dataisland_q='0' else encoded_d1;
  encoded_ch2 <= encoded_red   when dataisland_q='0' else encoded_d2;

  -- Data
  d0enc:  entity work.terc4_encoder port map ( clk => clk_pixel, din => data0, dout => encoded_d0 );
  d1enc:  entity work.terc4_encoder port map ( clk => clk_pixel, din => data1, dout => encoded_d1 );
  d2enc:  entity work.terc4_encoder port map ( clk => clk_pixel, din => data2, dout => encoded_d2 );

end Behavioral;

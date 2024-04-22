---------------------------------------------------------------------------------
-- Phoenix video generator by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.all;

entity phoenix_video is
port(
 clk11    : in std_logic;
 reset    : in std_logic;
 hclk     : out std_logic;
 hcnt     : out std_logic_vector(9 downto 1);
 vcnt     : out std_logic_vector(8 downto 1);
 sync     : out std_logic;
 adrsel   : out std_logic;
 rdy      : out std_logic;
 vblank       : out std_logic;
 hblank_frgrd : out std_logic;
 hblank_bkgrd : out std_logic
); end phoenix_video;

architecture struct of phoenix_video is 
 signal hclk_i : std_logic := '0';
 signal hstb_i : std_logic := '0';
 signal hcnt_i : unsigned(9 downto 1) := (others=>'0');
 signal vcnt_i : unsigned(8 downto 1) := (others=>'0');
 signal vblank_n : std_logic := '0';
 signal sync1_i  : std_logic;
 signal sync2_i  : std_logic;

 signal pulse_a  : std_logic;
 signal pulse_b1 : std_logic;
 signal pulse_b2 : std_logic;
 signal pulse_c1 : std_logic;
 signal pulse_c2 : std_logic;
 signal pulse_d1 : std_logic;
 signal pulse_d2 : std_logic;
 signal sync_i   : std_logic;
 signal vcntr_i  : unsigned(8 downto 1) := (others=>'0');
 
 signal rdy1_i  : std_logic;
 signal rdy2_i  : std_logic;
 signal j1      : std_logic;
 signal k1      : std_logic;
 signal q1      : std_logic;
 signal j2      : std_logic;
 signal k2      : std_logic;
 signal q2      : std_logic;
 
begin

-- horizontal counter clock (pixel clock) 
process (clk11)
begin
 if rising_edge(clk11) then
  hclk_i <= not hclk_i;
 end if;
end process;

-- horizontal counter from 0x0A0 to 0x1FF : 352 pixels 
process (hclk_i)
begin
 if rising_edge(hclk_i) then
  if reset = '1' then
   hcnt_i  <= (others=>'0');
  else
   hcnt_i  <= hcnt_i +1;
   if hcnt_i = "111111111" then
    hcnt_i <= "010100000";
   end if;
  end if;
 end if;
end process;

-- vertical counter clock (line clock) = hblank
process (hclk_i)
begin
 if rising_edge(hclk_i) then
  if (hcnt_i(3) and hcnt_i(2) and hcnt_i(1)) = '1' then hstb_i <= not hcnt_i(9); end if;
 end if;
end process;

-- vertical clock from 0x00 to 0xFF : 256 lines 
process (hstb_i)
begin
 if rising_edge(hstb_i) then
  if reset = '1' then
   vcnt_i  <= (others=>'0');
  else
   vcnt_i  <= vcnt_i +1;
   if vcnt_i = "11111111" then
    vcnt_i <= "00000000";
   end if;
  end if;  
 end if;
end process;

-- vertical blanking
vblank_n <=  
 not(vcnt_i(8) and vcnt_i(7))
 or
 ( not
  ( not (vcnt_i(8) and vcnt_i(7) and not vcnt_i(6) and not vcnt_i(5) and not vcnt_i(4))
    and 
    not (vcnt_i(8) and vcnt_i(7) and not vcnt_i(6) and not vcnt_i(5) and vcnt_i(4))
  )
 );

-- vertical syncs 
sync1_i <= not( vcnt_i(8) and vcnt_i(7) and (vcnt_i(6) and not vcnt_i(5) and not vcnt_i(4) and not vcnt_i(3)));      
-- horizontal syncs 
sync2_i <= not( not hcnt_i(9) and (hcnt_i(7) and not hcnt_i(6) and not hcnt_i(5)));

-- ready signal for microprocessor
rdy1_i <= not( not(hcnt_i(9)) and not hcnt_i(7) and hcnt_i(6) and not hcnt_i(5));
rdy2_i <= not( not(hcnt_i(9)) and hcnt_i(7) and hcnt_i(6) and hcnt_i(5));

-- background horizontal blanking
j1 <= hcnt_i(6) and hcnt_i(4);
k1 <= hstb_i;

process (hclk_i)
begin
 if rising_edge(hclk_i) then
  if (j1 xor k1) = '1' then
   q1 <= j1;
  elsif j1 = '1' then
   q1 <= not q1;
  else
   q1 <= q1;
  end if;
 end if;
end process;

j2 <= not hcnt_i(6) and hcnt_i(5);
k2 <= hcnt_i(8) and hcnt_i(7) and hcnt_i(6) and hcnt_i(4);

process (hclk_i)
begin
 if rising_edge(hclk_i) then
  if (j2 xor k2) = '1' then
   q2 <= j2;
  elsif j2 = '1' then
   q2 <= not q2;
  else
   q2 <= q2;
  end if;
 end if;
end process;

-- output
hclk <= hclk_i;
hcnt <= std_logic_vector(hcnt_i);
vcnt <= std_logic_vector(vcnt_i);
--sync <= not(sync1_i xor sync2_i) ; original syncs
rdy  <= not(vblank_n and (not (rdy1_i and rdy2_i and not hcnt_i(9)))); 
adrsel <= vblank_n and hcnt_i(9);

vblank       <= not vblank_n;
hblank_frgrd <= hstb_i;
hblank_bkgrd <= not(hcnt_i(9) and q1) and not(hcnt_i(9) and (q2));

-- make sync pulses width close to 4.7us (26 pixels)
-- and add compensation pulse 2.35us (13 pixels)
-- falling edge should always occured at 32 or 64us
process (hclk_i)
begin
 if rising_edge(hclk_i) then
  if hcnt_i = '0'&X"BF" then pulse_a <= '0'; end if; -- 4.7us normal sync
  if hcnt_i = '0'&X"D9" then pulse_a <= '1'; end if; -- negative pulse , start at 0x0C0

  if hcnt_i = '0'&X"BF" then pulse_b1 <= '0'; end if; -- 2.35us fisrt precomp sync
  if hcnt_i = '0'&X"CC" then pulse_b1 <= '1'; end if; -- negative pulse, start at 0x0C0
  
  if hcnt_i = '1'&X"6F" then pulse_b2 <= '0'; end if; -- 2.35us 2nd precomp sync
  if hcnt_i = '1'&X"7C" then pulse_b2 <= '1'; end if; -- negative pulse, start at 0x170

  if hcnt_i = '0'&X"A5" then pulse_c1 <= '1'; end if; -- 4.7us fisrt precomp sync
  if hcnt_i = '0'&X"BF" then pulse_c1 <= '0'; end if; -- positive pulse, end at 0x0C0
  
  if hcnt_i = '1'&X"55" then pulse_c2 <= '1'; end if; -- 4.7us 2nd precomp sync 
  if hcnt_i = '1'&X"6F" then pulse_c2 <= '0'; end if; -- positive pulse, end at 0x170
 
  if hcnt_i = '1'&X"FF" then pulse_d1 <= '0'; end if; -- begin of vsync field
  if hcnt_i = '0'&X"BF" then pulse_d1 <= '1'; end if; -- falling edge at 0x0C0
  
  if hcnt_i = '1'&X"FF" then pulse_d2 <= '1'; end if; -- end of vsync field
  if hcnt_i = '1'&X"6F" then pulse_d2 <= '0'; end if; -- rising edge at 0x0170
 
  sync <= sync_i;
  
  if hcnt_i = '1'&X"FF" then vcntr_i <= vcnt_i; end if; -- synchronise vcnt with hcnt
 end if;
end process;

-- mux syncs with respect to line counter
with vcntr_i select
sync_i <= pulse_b1 and pulse_b2 when X"DF",
          pulse_b1 and pulse_b2 when X"E0",
          pulse_b1 and pulse_d2 when X"E1",
          pulse_c1 or  pulse_c2 when X"E2",
          pulse_c1 or  pulse_c2 when X"E3",
         (pulse_c1 and not pulse_d1) or (pulse_b1 and pulse_b2 and pulse_d1) when X"E4",
          pulse_b1 and pulse_b2 when X"E5",  
          pulse_a when others;
 
end struct;

-- ps2.vhd - Kompletni radic portu PS2
-- Autori: Jakub Cabal
-- Posledni zmena: 19.11.2014
-- Popis: Tato jednotka zajistuje kompletni komunikaci s portem PS2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PS2 is
   Port (
      CLK          : in   STD_LOGIC; -- Vychozi hodinovy signal
      RST          : in   STD_LOGIC; -- Vychozi synchronni reset
      PS2C         : in   STD_LOGIC; -- Hodinovy signal z PS2 portu
      PS2D         : in   STD_LOGIC; -- Seriova vstupni data z PS2 portu
      KEY_W        : out  STD_LOGIC; -- Znaci ze byla stisknuta klavesa W
      KEY_S        : out  STD_LOGIC; -- Znaci ze byla stisknuta klavesa S
      KEY_A        : out  STD_LOGIC; -- Znaci ze byla stisknuta klavesa A
      KEY_D        : out  STD_LOGIC; -- Znaci ze byla stisknuta klavesa D
      KEY_SPACE    : out  STD_LOGIC  -- Znaci ze byla stisknuta klavesa SPACE
   );
end PS2;

architecture FULL of PS2 is

   signal sig_ps2c_deb    : STD_LOGIC;
   signal sig_ps2rx_valid : STD_LOGIC;
   signal sig_ps2rx_data  : STD_LOGIC_VECTOR(7 downto 0);
   signal sig_key_code    : STD_LOGIC_VECTOR(7 downto 0);

   signal sig_key_w       : STD_LOGIC;
   signal sig_key_s       : STD_LOGIC;
   signal sig_key_a       : STD_LOGIC;
   signal sig_key_d       : STD_LOGIC;
   signal sig_key_space   : STD_LOGIC;

begin

   ----------------------------------------------------------------------
   -- Propojeni vnitrnich podkomponent
   ----------------------------------------------------------------------

   -- PS2 Debouncer
   ps2_debouncer_i: entity work.DEBOUNCER
   port map(
      CLK  => CLK,
      RST  => RST,
      DIN  => PS2C,
      DOUT => sig_ps2c_deb
   );

   -- Prijem seriovych dat z PS2
   ps2_rx_1: entity work.PS2_RX
   port map(
      CLK         => CLK,
      RST         => RST,
      PS2C        => sig_ps2c_deb,
      PS2D        => PS2D,
      PS2RX_DATA  => sig_ps2rx_data,
      PS2RX_VALID => sig_ps2rx_valid
   );

   -- Ziskani kodu klavesy
   kb_code_1: entity work.KB_CODE
   port map(
      CLK         => CLK,
      RST         => RST,
      PS2RX_DATA  => sig_ps2rx_data,
      PS2RX_VALID => sig_ps2rx_valid,
      KEY_CODE    => sig_key_code
   );

   ----------------------------------------------------------------------
   -- Generovani vystupnich signalu
   ----------------------------------------------------------------------

   -- Generovani signalu o zmacknute klavesy W
   process (CLK)
   begin
      if (rising_edge(CLK)) then
         if (RST = '1') then
            sig_key_w <= '0';
         elsif (sig_key_code = X"1D") then
            sig_key_w <= '1';
         else
            sig_key_w <= '0';
         end if;
      end if;
   end process;

   rised1: entity work.RISING_EDGE_DETECTOR
   port map(
      CLK    => CLK,
      VSTUP  => sig_key_w,
      VYSTUP => KEY_W
   );

   -- Generovani signalu o zmacknute klavesy S
   process (CLK)
   begin
      if (rising_edge(CLK)) then
         if (RST = '1') then
            sig_key_s <= '0';
         elsif (sig_key_code = X"1B") then
            sig_key_s <= '1';
         else
            sig_key_s <= '0';
         end if;
      end if;
   end process;

   rised2: entity work.RISING_EDGE_DETECTOR
   port map(
      CLK    => CLK,
      VSTUP  => sig_key_s,
      VYSTUP => KEY_S
   );

   -- Generovani signalu o zmacknute klavesy A
   process (CLK)
   begin
      if (rising_edge(CLK)) then
         if (RST = '1') then
            sig_key_a <= '0';
         elsif (sig_key_code = X"1C") then
            sig_key_a <= '1';
         else
            sig_key_a <= '0';
         end if;
      end if;
   end process;

   rised3: entity work.RISING_EDGE_DETECTOR
   port map(
      CLK    => CLK,
      VSTUP  => sig_key_a,
      VYSTUP => KEY_A
   );

   -- Generovani signalu o zmacknute klavesy D
   process (CLK)
   begin
      if (rising_edge(CLK)) then
         if (RST = '1') then
            sig_key_d <= '0';
         elsif (sig_key_code = X"23") then
            sig_key_d <= '1';
         else
            sig_key_d <= '0';
         end if;
      end if;
   end process;

   rised4: entity work.RISING_EDGE_DETECTOR
   port map(
      CLK    => CLK,
      VSTUP  => sig_key_d,
      VYSTUP => KEY_D
   );

   -- Generovani signalu o zmacknute klavesy SPACE
   process (CLK)
   begin
      if (rising_edge(CLK)) then
         if (RST = '1') then
            sig_key_space <= '0';
         elsif (sig_key_code = X"29") then
            sig_key_space <= '1';
         else
            sig_key_space <= '0';
         end if;
      end if;
   end process;

   rised5: entity work.RISING_EDGE_DETECTOR
   port map(
      CLK    => CLK,
      VSTUP  => sig_key_space,
      VYSTUP => KEY_SPACE
   );

end FULL;

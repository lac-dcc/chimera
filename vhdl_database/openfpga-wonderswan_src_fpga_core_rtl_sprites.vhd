library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;   

entity sprites is
   port 
   (
      clk            : in  std_logic;
      ce             : in  std_logic;
      
      startLine      : in  std_logic;
      lineY          : in  std_logic_vector(7 downto 0);
      
      enable         : in  std_logic;
      depth2         : in  std_logic;
      packed         : in  std_logic;
      
      useWindow      : in  std_logic := '0';
      WinX0          : in  std_logic_vector(7 downto 0) := (others => '0');
      WinY0          : in  std_logic_vector(7 downto 0) := (others => '0');
      WinX1          : in  std_logic_vector(7 downto 0) := (others => '0');
      WinY1          : in  std_logic_vector(7 downto 0) := (others => '0');
      
      clearNext      : in  std_logic;
      loadNext       : in  std_logic;
      loadIndex      : in  integer range 0 to 31;
      loadData       : in  std_logic_vector(31 downto 0);
      loadColor      : in  std_logic_vector(31 downto 0);
      
      tileActive     : out std_logic := '0';
      tilePrio       : out std_logic := '0';
      tilePalette    : out std_logic_vector(3 downto 0) := (others => '0');
      tileColor      : out std_logic_vector(3 downto 0) := (others => '0');
      
      tileActive2    : out std_logic := '0';
      tilePalette2   : out std_logic_vector(3 downto 0) := (others => '0');
      tileColor2     : out std_logic_vector(3 downto 0) := (others => '0')
   );
end entity;

architecture arch of sprites is
 
   type tspriteSetting is record
      color         : std_logic_vector(31 downto 0);
      xPos          : unsigned(7 downto 0);
      yPos          : std_logic_vector(7 downto 0);
      horFlip       : std_logic;
      Scr2Prio      : std_logic;
      windowClip    : std_logic;
      palette       : std_logic_vector(2 downto 0);
      tileColor     : std_logic_vector(3 downto 0);
      tileColorNext : std_logic_vector(3 downto 0);
   end record;
 
   type tspriteSettings is array(0 to 31) of tspriteSetting;
   signal spriteSettings     : tspriteSettings := (others => ((others => '0'), (others => '0'), (others => '0'), '0', '0', '0', (others => '0'), (others => '0'), (others => '0')));
   signal spriteSettingsNext : tspriteSettings := (others => ((others => '0'), (others => '0'), (others => '0'), '0', '0', '0', (others => '0'), (others => '0'), (others => '0')));
   
   signal spritesActive      : std_logic_vector(0 to 31) := (others => '0');
   signal spritesActiveNext  : std_logic_vector(0 to 31) := (others => '0');
   
   signal posX               : unsigned(7 downto 0) := (others => '0');
   signal pixelCount         : integer range 0 to 255;

   signal spriteActiveOn     : std_logic := '0';
   signal spriteActiveCnt    : integer range 0 to 31;   
   
   signal spriteActiveOn2    : std_logic := '0';
   signal spriteActiveCnt2   : integer range 0 to 31;
   
   -- window
   signal wX0             : unsigned(7 downto 0) := (others => '0');
   signal wY0             : unsigned(7 downto 0) := (others => '0');
   signal wX1             : unsigned(7 downto 0) := (others => '0');
   signal wY1             : unsigned(7 downto 0) := (others => '0');
   signal windowInside    : std_logic := '0';
   signal windowOutside   : std_logic := '0';
   
   signal wxCheck         : unsigned(7 downto 0) := (others => '0');

begin 
   
   process (clk)
      variable tileX8 : unsigned(7 downto 0);
      variable tileX3 : unsigned(2 downto 0);
   begin
      if rising_edge(clk) then
      
         if (clearNext = '1') then
            spritesActiveNext <= (others => '0');
         end if;
         
         if (loadNext = '1') then
            spriteSettingsNext(loadIndex).color      <= loadColor;
            spriteSettingsNext(loadIndex).xPos       <= unsigned(loadData(31 downto 24));
            spriteSettingsNext(loadIndex).yPos       <= loadData(23 downto 16);
            spriteSettingsNext(loadIndex).horFlip    <= loadData(14);
            spriteSettingsNext(loadIndex).Scr2Prio   <= loadData(13);
            spriteSettingsNext(loadIndex).windowClip <= loadData(12);
            spriteSettingsNext(loadIndex).palette    <= loadData(11 downto 9);
            spritesActiveNext(loadIndex) <= '1';
         end if;
         
         if (ce = '1') then
         
            -- window check
            wX0 <= unsigned(WinX0);
            wX1 <= unsigned(WinX1);
            wY0 <= unsigned(WinY0);
            wY1 <= unsigned(WinY1);
            
            windowInside <= '0';
            if ((wxCheck >= wX0 and wxCheck <= wX1) or (wxCheck >= wX1 and wxCheck <= wX0)) then -- inside
               if ((unsigned(lineY) >= wY0 and unsigned(lineY) <= wY1) or (unsigned(lineY) >= wY1 and unsigned(lineY) <= wY0)) then 
                  windowInside <= '1';
               end if;
            end if;
            
            windowOutside <= '0';
            if (wxCheck < wX0 or wxCheck > wX1 or unsigned(lineY) < wY0 or unsigned(lineY) > wY1) then -- outside
               windowOutside <= '1';
            end if;
         
            if (startLine = '1' and enable = '1') then
            
               pixelCount     <= 0;
               spriteSettings <= spriteSettingsNext;
               spritesActive  <= spritesActiveNext;
               
               posX           <= to_unsigned(0, 8) - 15; -- for prefetching
               wxCheck        <= to_unsigned(0, 8) - 14; -- for prefetching
               
            elsif (pixelCount < 250) then
                  
                  pixelCount <= pixelCount + 1;
                  posX       <= posX + 1;
                  wxCheck    <= wxCheck + 1;
            
                  spriteActiveOn   <= '0';
                  spriteActiveOn2  <= '0';
                  for i in 31 downto 0 loop
                  
                     tileX8 := (posX + 1) - spriteSettings(i).xPos;
                     if (spriteSettings(i).horFlip = '1') then
                        tileX3 := to_unsigned(7, 3) - tileX8(2 downto 0);
                     else
                        tileX3 := tileX8(2 downto 0);
                     end if;
                     
                     -- pick data 
                     if (packed = '0') then
                        if (depth2 = '1') then -- 2 bit planar
                           spriteSettings(i).tileColorNext <= "00" & spriteSettings(i).color(15 - to_integer(unsigned(tileX3))) & spriteSettings(i).color(7 - to_integer(unsigned(tileX3)));
                        else  -- 4 bit planar
                           spriteSettings(i).tileColorNext <= spriteSettings(i).color(31 - to_integer(unsigned(tileX3))) & spriteSettings(i).color(23 - to_integer(unsigned(tileX3))) & spriteSettings(i).color(15 - to_integer(unsigned(tileX3))) & spriteSettings(i).color(7 - to_integer(unsigned(tileX3)));
                        end if;
                     else
                        if (depth2 = '1') then -- 2 bit packed
                           case (tileX3) is
                              when "000" => spriteSettings(i).tileColorNext <= "00" & spriteSettings(i).color( 7 downto  6);
                              when "001" => spriteSettings(i).tileColorNext <= "00" & spriteSettings(i).color( 5 downto  4);
                              when "010" => spriteSettings(i).tileColorNext <= "00" & spriteSettings(i).color( 3 downto  2);
                              when "011" => spriteSettings(i).tileColorNext <= "00" & spriteSettings(i).color( 1 downto  0);
                              when "100" => spriteSettings(i).tileColorNext <= "00" & spriteSettings(i).color(15 downto 14);
                              when "101" => spriteSettings(i).tileColorNext <= "00" & spriteSettings(i).color(13 downto 12);
                              when "110" => spriteSettings(i).tileColorNext <= "00" & spriteSettings(i).color(11 downto 10);
                              when "111" => spriteSettings(i).tileColorNext <= "00" & spriteSettings(i).color( 9 downto  8);
                              when others => null;
                           end case;
                        else -- 4 bit packed
                           case (tileX3) is
                              when "000" => spriteSettings(i).tileColorNext <= spriteSettings(i).color( 7 downto  4);
                              when "001" => spriteSettings(i).tileColorNext <= spriteSettings(i).color( 3 downto  0);
                              when "010" => spriteSettings(i).tileColorNext <= spriteSettings(i).color(15 downto 12);
                              when "011" => spriteSettings(i).tileColorNext <= spriteSettings(i).color(11 downto  8);
                              when "100" => spriteSettings(i).tileColorNext <= spriteSettings(i).color(23 downto 20);
                              when "101" => spriteSettings(i).tileColorNext <= spriteSettings(i).color(19 downto 16);
                              when "110" => spriteSettings(i).tileColorNext <= spriteSettings(i).color(31 downto 28);
                              when "111" => spriteSettings(i).tileColorNext <= spriteSettings(i).color(27 downto 24);
                              when others => null;
                           end case;
                        end if;     
                     end if;
                  
                     spriteSettings(i).tileColor <= spriteSettings(i).tileColorNext;
                     -- find active sprite
                     if (spritesActive(i) = '1') then
                        if ((posX - spriteSettings(i).xPos) < 8) then
                           if (spriteSettings(i).tileColorNext /= x"0" or (depth2 = '1' and spriteSettings(i).palette(2) = '0')) then
                              if (useWindow = '0' or (windowInside = '0' and spriteSettings(i).windowClip = '1') or (windowOutside = '0' and spriteSettings(i).windowClip = '0')) then
                                 spriteActiveCnt <= i;
                                 spriteActiveOn  <='1';
                              end if;
                           end if;
                        end if;
                     end if;
                     
                     -- find active sprite with high prio set
                     if (spritesActive(i) = '1' and spriteSettings(i).Scr2Prio = '1') then
                        if ((posX - spriteSettings(i).xPos) < 8) then
                           if (spriteSettings(i).tileColorNext /= x"0" or (depth2 = '1' and spriteSettings(i).palette(2) = '0')) then
                              if (useWindow = '0' or (windowInside = '0' and spriteSettings(i).windowClip = '1') or (windowOutside = '0' and spriteSettings(i).windowClip = '0')) then
                                 spriteActiveCnt2 <= i;
                                 spriteActiveOn2  <='1';
                              end if;
                           end if;
                        end if;
                     end if;
                  end loop;
                  
                  -- output data
                  tileActive  <= spriteActiveOn;
                  tilePrio    <= spriteSettings(spriteActiveCnt).Scr2Prio;
                  tilePalette <= '1' & spriteSettings(spriteActiveCnt).palette;
                  tileColor   <= spriteSettings(spriteActiveCnt).tileColor;
                  
                  tileActive2  <= spriteActiveOn2;
                  tilePalette2 <= '1' & spriteSettings(spriteActiveCnt2).palette;
                  tileColor2   <= spriteSettings(spriteActiveCnt2).tileColor;
            
            end if;
   
         end if;
      
      end if;
   end process; 
   
  
end architecture;






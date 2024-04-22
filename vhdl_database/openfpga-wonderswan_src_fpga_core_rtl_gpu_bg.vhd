library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;   

entity gpu_bg is
   port 
   (
      clk            : in  std_logic;
      ce             : in  std_logic;
      isColor        : in  std_logic;
      
      startLine      : in  std_logic;
      lineY          : in  std_logic_vector(7 downto 0);
      
      enable         : in  std_logic;
      depth2         : in  std_logic;
      packed         : in  std_logic;
      tilemapSize    : in  std_logic;
      screenbase     : in  std_logic_vector(3 downto 0);
      scrollX        : in  std_logic_vector(7 downto 0);
      scrollY        : in  std_logic_vector(7 downto 0);
      
      useWindow      : in  std_logic := '0';
      WindowOutside  : in  std_logic := '0';
      WinX0          : in  std_logic_vector(7 downto 0) := (others => '0');
      WinY0          : in  std_logic_vector(7 downto 0) := (others => '0');
      WinX1          : in  std_logic_vector(7 downto 0) := (others => '0');
      WinY1          : in  std_logic_vector(7 downto 0) := (others => '0');

      RAM_Address    : out std_logic_vector(15 downto 0);
      RAM_Data       : in  std_logic_vector(15 downto 0);    
      RAM_valid      : in  std_logic;    
      
      tileActive     : out std_logic := '0';
      tilePalette    : out std_logic_vector(3 downto 0) := (others => '0');
      tileColor      : out std_logic_vector(3 downto 0) := (others => '0')
   );
end entity;

architecture arch of gpu_bg is
 
   type tfetchState is
   (
      FETCHTILE,
      FETCHCOLOR0,
      FETCHCOLOR1,
      FETCHDONE
   );
   signal fetchState : tfetchState;
   signal fetchwait  : integer range 0 to 3;
   

   signal pixelCount      : integer range 0 to 255;

   signal tilemapAddress    : std_logic_vector(15 downto 0);
   signal ColorAddress    : std_logic_vector(15 downto 0);

   signal tilemapBuf      : std_logic_vector(15 downto 0) := (others => '0');
   signal tilemapBuf_1    : std_logic_vector(15 downto 0) := (others => '0');

   signal posX            : unsigned(7 downto 0) := (others => '0');
   signal posY            : std_logic_vector(7 downto 0) := (others => '0');
   
   signal tileIndex       : std_logic_vector(9 downto 0);
   signal tileX_1         : std_logic_vector(2 downto 0);
   signal tileY           : std_logic_vector(2 downto 0);
   
   signal colorBuf        : std_logic_vector(31 downto 0) := (others => '0');
   signal colorBuf_1      : std_logic_vector(31 downto 0) := (others => '0');
   
   -- window
   signal wX0             : unsigned(7 downto 0) := (others => '0');
   signal wY0             : unsigned(7 downto 0) := (others => '0');
   signal wX1             : unsigned(7 downto 0) := (others => '0');
   signal wY1             : unsigned(7 downto 0) := (others => '0');
   signal windowAllow     : std_logic := '0';
   
   signal wxCheck         : unsigned(7 downto 0) := (others => '0');

begin 

   tilemapAddress <= "00" & screenbase(2 downto 0) & posY(7 downto 3) & std_logic_vector(posX(7 downto 3)) & '0' when isColor = '0' else
                      '0' & screenbase & posY(7 downto 3) & std_logic_vector(posX(7 downto 3)) & '0'; 

   ColorAddress <=  std_logic_vector(to_unsigned(16#2000#, 16) + unsigned(tileIndex & tileY & '0'))  when depth2 = '1' and packed = '0' else
                    std_logic_vector(to_unsigned(16#4000#, 16) + unsigned(tileIndex & tileY & "00")) when depth2 = '0' and packed = '0' else
                    std_logic_vector(to_unsigned(16#2000#, 16) + unsigned(tileIndex & tileY & '0'))  when depth2 = '1' and packed = '1' else
                    std_logic_vector(to_unsigned(16#4000#, 16) + unsigned(tileIndex & tileY & "00"));

   
   RAM_Address <= tilemapAddress                   when fetchState = FETCHTILE   else
                  ColorAddress(15 downto 2) & "00" when fetchState = FETCHCOLOR0 else
                  ColorAddress(15 downto 2) & "10"; --when fetchState = FETCHCOLOR1;
   

   tileIndex <= tilemapBuf(13) & tilemapBuf(8 downto 0) when (tilemapSize = '1' and isColor = '1') else '0' & tilemapBuf(8 downto 0);
   tileY     <= std_logic_vector(to_unsigned(7, 3) - unsigned(posY(2 downto 0))) when tilemapBuf(15) = '1' else posY(2 downto 0);
   
   tileX_1   <= std_logic_vector(to_unsigned(7, 3) - posX(2 downto 0)) when tilemapBuf_1(14) = '1' else std_logic_vector(posX(2 downto 0));


   
   process (clk)
   begin
      if rising_edge(clk) then
      
      
         -- read tile
         case (fetchState) is
         
            when FETCHTILE => 
               if (fetchwait > 0) then
                  fetchwait <= fetchwait - 1;
               elsif (RAM_valid = '1') then
                  fetchState <= FETCHCOLOR0;
                  tilemapBuf <= RAM_Data;
               end if;
               
            when FETCHCOLOR0 => 
               if (RAM_valid = '1') then
                  fetchState <= FETCHCOLOR1;
                  colorBuf(15 downto  0) <= RAM_Data;
               end if;
               
            when FETCHCOLOR1 => 
               if (RAM_valid = '1') then
                  fetchState <= FETCHDONE;
                  colorBuf(31 downto 16) <= RAM_Data;
               end if;
               
            when FETCHDONE =>
               null;
         
         end case;

      
         if (ce = '1') then
         
            tileActive <= '0';

            -- window check
            wX0 <= unsigned(WinX0);
            wX1 <= unsigned(WinX1);
            wY0 <= unsigned(WinY0);
            wY1 <= unsigned(WinY1);
            
            windowAllow <= '1';
            if ((wxCheck >= wX0 and wxCheck <= wX1) or (wxCheck >= wX1 and wxCheck <= wX0)) then -- inside
               if ((unsigned(lineY) >= wY0 and unsigned(lineY) <= wY1) or (unsigned(lineY) >= wY1 and unsigned(lineY) <= wY0)) then 
                  if (useWindow = '1' and WindowOutside = '1') then
                     windowAllow <= '0';
                  end if;
               end if;
            end if;
            
            if (wxCheck < wX0 or wxCheck > wX1 or unsigned(lineY) < wY0 or unsigned(lineY) > wY1) then -- outside
               if (useWindow = '1' and WindowOutside = '0') then
                  windowAllow <= '0';
               end if;
            end if;

            -- generate position
            if (startLine = '1' and enable = '1') then
               pixelCount     <= 0;
               wxCheck        <= to_unsigned(0, 8) - 15;
               posX           <= unsigned(scrollX) - 8; -- for prefetching
               posY           <= std_logic_vector(unsigned(lineY) + unsigned(scrollY));
            elsif (pixelCount < 250) then
               
               pixelCount <= pixelCount + 1;
               posX       <= posX + 1;
               wxCheck    <= wxCheck + 1;
               tileActive <= windowAllow;
               
               if (posX(2 downto 0) = "111") then
                  fetchState   <= FETCHTILE;
                  fetchwait    <= 3;
                  tilemapBuf_1 <= tilemapBuf;
                  colorBuf_1   <= colorBuf;
                  -- depth 2 has only 16 bit per 8 pixel
                  if (depth2 = '1' and tileY(0) = '1') then
                     colorBuf_1 <= x"0000" & colorBuf(31 downto 16);
                  end if;
               end if;
               
            end if;
            
            -- pick data 
            tilePalette <= tilemapBuf_1(12 downto 9);
            
            if (packed = '0') then
               if (depth2 = '1') then -- 2 bit planar
                  tileColor <= "00" & colorBuf_1(15 - to_integer(unsigned(tileX_1))) & colorBuf_1(7 - to_integer(unsigned(tileX_1)));
               else  -- 4 bit planar
                  tileColor <= colorBuf_1(31 - to_integer(unsigned(tileX_1))) & colorBuf_1(23 - to_integer(unsigned(tileX_1))) & colorBuf_1(15 - to_integer(unsigned(tileX_1))) & colorBuf_1(7 - to_integer(unsigned(tileX_1)));
               end if;
            else
               if (depth2 = '1') then -- 2 bit packed
                  case (tileX_1) is
                     when "000" => tileColor <= "00" & colorBuf_1( 7 downto  6);
                     when "001" => tileColor <= "00" & colorBuf_1( 5 downto  4);
                     when "010" => tileColor <= "00" & colorBuf_1( 3 downto  2);
                     when "011" => tileColor <= "00" & colorBuf_1( 1 downto  0);
                     when "100" => tileColor <= "00" & colorBuf_1(15 downto 14);
                     when "101" => tileColor <= "00" & colorBuf_1(13 downto 12);
                     when "110" => tileColor <= "00" & colorBuf_1(11 downto 10);
                     when "111" => tileColor <= "00" & colorBuf_1( 9 downto  8);
                     when others => null;
                  end case;
               else -- 4 bit packed
                  case (tileX_1) is
                     when "000" => tileColor <= colorBuf_1( 7 downto  4);
                     when "001" => tileColor <= colorBuf_1( 3 downto  0);
                     when "010" => tileColor <= colorBuf_1(15 downto 12);
                     when "011" => tileColor <= colorBuf_1(11 downto  8);
                     when "100" => tileColor <= colorBuf_1(23 downto 20);
                     when "101" => tileColor <= colorBuf_1(19 downto 16);
                     when "110" => tileColor <= colorBuf_1(31 downto 28);
                     when "111" => tileColor <= colorBuf_1(27 downto 24);
                     when others => null;
                  end case;
               end if;     
            end if;
      
         end if;
      end if;
   end process; 
   
   

end architecture;






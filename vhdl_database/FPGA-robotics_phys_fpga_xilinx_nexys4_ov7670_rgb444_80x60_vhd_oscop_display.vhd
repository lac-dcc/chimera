library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library WORK;
use WORK.OSC_PKG.ALL;
use WORK.VGA_PKG.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DRAW_OSC is
  Port (
    rst               : in  STD_LOGIC;
    clk               : in  STD_LOGIC;
    FilaPantalla      : in  std_logic_vector (c_nb_lines-1 downto 0);
    ColPantalla       : in  std_logic_vector (c_nb_pxls-1 downto 0);
    Visible           : in  STD_LOGIC;
    red               : out std_logic_vector (7 downto 0);
    green             : out std_logic_vector (7 downto 0);
    blue              : out std_logic_vector (7 downto 0);
    -- addres and data to/from the ram
    data_ram          : in  std_logic_vector (c_bt_ramword-1 downto 0);
    addr_ram          : out std_logic_vector (c_bt_ramdepth-1 downto 0);
    -- were is the last (leftmost) sample in the ram (lifo)
    offset_addr_ram   : in  std_logic_vector (c_bt_ramdepth-1 downto 0)
  );
end DRAW_OSC;

architecture BEHAVIORAL of DRAW_OSC is

  signal    FilaPant_us   : unsigned (c_nb_lines-1 downto 0);
  signal    ColPant_us    : unsigned (c_nb_pxls-1 downto 0);
  signal    offset_addr_ram_us : unsigned (c_bt_ramdepth-1 downto 0);
  signal    addr_ram_us   : unsigned (c_bt_ramdepth-1 downto 0);

  -- Each wave row takes 16 pixels
  signal    waverow       : unsigned (c_bt_extwaverow-1 downto 0);
  -- Each wave row takes 32 pixels
  signal    wave          : unsigned (c_bt_extwaverow-2 downto 0);
  signal    inwaverow     : unsigned (c_bt_inwaverow-1 downto 0);

  -- the number of columns left to reach the total number of samples
  signal    cols2numsamples : unsigned (c_bt_ramdepth-1 downto 0);

begin

  ColPant_us  <= unsigned (ColPantalla);
  FilaPant_us <= unsigned (FilaPantalla);
  offset_addr_ram_us <= unsigned (offset_addr_ram);
  addr_ram <= std_logic_vector(addr_ram_us); 

  cols2numsamples <= c_numsamples - offset_addr_ram_us;

  waverow <= FilaPant_us(c_nb_lines-1 downto c_bt_inwaverow);
  wave <= waverow(c_bt_extwaverow-1 downto 1);
  inwaverow <= FilaPant_us(c_bt_inwaverow-1 downto 0);

  -- the address we have to ask for is the result of substracting 
 
  -- when Colpantalla = 0 we have to ask for offset_addr_ram_us
  --      Colpantalla = 1 -> offset_addr_ram_us + ColPantalla
  --      Colpantalla = 2 -> offset_addr_ram_us + ColPantalla
  -- the limit is when  offset_addr_ram_us + ColPantalla > c_numsamples
  --   example 1              50        +   100       <   640
  --   In that case we perform 
  --      addr_ram <= offset_addr_ram + ColPantalla
  --
  --   example 2              600       +   100       >   640
  --   In that case we have to ask for 700 - 640 = 60
  --   or:     640 - 600 = 40 -> 100 -40 = 60
  -- therefore we perform:
  --       c_numsamples - offset_addr_ram 
  --      addr_ram <= ColPantalla - (c_numsamples - offset_addr_ram)

  addr_ram_us <=  ColPant_us + offset_addr_ram_us
                      when (ColPant_us < cols2numsamples) else
               ColPant_us - cols2numsamples;
 
  --    

--Ciclos Clk| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |10 |11 |12 |
--  ClkPxl  |       1       |       2       |       3       |
--           _   _   _   _   _   _   _   _   _   _   _   _   _
-- Clk:    _| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_|
--          :               :               :               :
--           _______         _______         _______         _
-- ClkPxl: _|       |_______|       |_______|       |_______|
--          :               :               :               :
--               ___             ___             ___             ___
--FlancoClk_____|   |___________|   |___________|   |___________|   |__
--          :               :               :               :
--          ____________ _______________ _______________ ____________
--Filapant  _______0____X__________1____X__________2____X__________3_
--          :               :               :               :
--          ________ _______________ _______________ ____________
--PxlImg    ____0___X__________1____X__________2____X__________3_
-- pide a la memo   
--          :               :               :               :
--           ___________ _______________ _______________ ____________
--Memo(pxlIm ___M(0)____X__________1____X__________2____X__________3_
-- Asi que en el nuevo ciclo de reloj tengo el dato listo
--
--           _________________________________________________
--Visible __|

  PPinta: Process (visible,FilaPant_us, ColPant_us,inwaverow, waverow )
  begin
    --if rst = c_on then
      red    <= (others=>'0');
      green  <= (others=>'0');
      blue   <= (others=>'0');
    --elsif Clk'event and Clk='1' then
      if visible = '1' then
        red    <= "10000000";
        green  <= "10000000";
        blue   <= "10000000";
        -- each 32 pixels, paint a blue column
        if FilaPant_us < 256 then
          red    <= (others => '0');
          green  <= (others => '0');
          blue   <= (others => '0');
          if ColPant_us(4 downto 0) = "11111" then
            red    <= (others=>'0');
            green  <= (others=>'0');
            blue   <= (others=>'1');
          end if;
          if inwaverow = 0 then
            red    <= (others=>'0');
            blue   <= (others=>'0');
            if ColPant_us(2) = '1' then
              green  <= (others=>'1');
            else
              green  <= (others=>'0');
            end if;
          end if;
          if waverow(0) = '1' then
            if data_ram(TO_INTEGER(wave(2 downto 0))) = '1' then
              if inwaverow = 15 or inwaverow = 14 then
                red    <= (others=>'1');
                green  <= (others=>'1');
                blue   <= (others=>'1');         
              else
                red    <= (others=>'0');
                green  <= (others=>'0');
                blue   <= (others=>'0');         
              end if;
            else
              if inwaverow = 1 or inwaverow = 2then
                red    <= (others=>'1');
                green  <= (others=>'1');
                blue   <= (others=>'1');         
              else
                red    <= (others=>'0');
                green  <= (others=>'0');
                blue   <= (others=>'0');         
              end if;
            end if;
          end if;
        end if;
      end if;
    --end if;
  end process;

--  PPinta: Process (rst, Clk)
--  begin
--    if rst = c_on then
--      red    <= (others=>'0');
--      green  <= (others=>'0');
--      blue   <= (others=>'0');
--    elsif Clk'event and Clk='1' then
--      if visible = '1' then
--        red    <= "10000000";
--        green  <= "10000000";
--        blue   <= "10000000";
--        -- each 32 pixels, paint a blue column
--        if FilaPant_us < 256 then
--          red    <= (others => '0');
--          green  <= (others => '0');
--          blue   <= (others => '0');
--          if ColPant_us(4 downto 0) = "11111" then
--            red    <= (others=>'0');
--            green  <= (others=>'0');
--            blue   <= (others=>'1');
--          end if;
--          if inwaverow = 0 then
--            red    <= (others=>'0');
--            blue   <= (others=>'0');
--            if ColPant_us(2) = '1' then
--              green  <= (others=>'1');
--            else
--              green  <= (others=>'0');
--            end if;
--          end if;
--          if waverow(0) = '1' then
--            if data_ram(TO_INTEGER(wave(2 downto 0))) = '1' then
--              if inwaverow = 15 then
--                red    <= (others=>'1');
--                green  <= (others=>'1');
--                blue   <= (others=>'1');         
--              else
--                red    <= (others=>'0');
--                green  <= (others=>'0');
--                blue   <= (others=>'0');         
--              end if;
--            else
--              if inwaverow = 1 then
--                red    <= (others=>'1');
--                green  <= (others=>'1');
--                blue   <= (others=>'1');         
--              else
--                red    <= (others=>'0');
--                green  <= (others=>'0');
--                blue   <= (others=>'0');         
--              end if;
--            end if;
--          end if;
--        end if;
--      end if;
--    end if;
--  end process;


end BEHAVIORAL;


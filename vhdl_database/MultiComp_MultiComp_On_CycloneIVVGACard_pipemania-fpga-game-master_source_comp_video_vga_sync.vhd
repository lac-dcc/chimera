--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    VGA_SYNC
-- AUTHORS: Vojtěch Jeřábek <xjerab17@stud.feec.vutbr.cz>
--          Jakub Cabal     <xcabal05@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VGA_SYNC is
    Port (
        CLK      : in  std_logic; -- clock, must be 50 MHz
        RST      : in  std_logic; -- reset
        PIXEL_X  : out std_logic_vector(9 downto 0); -- cislo pixelu na radku
        PIXEL_Y  : out std_logic_vector(9 downto 0); -- cislo pixelu ve sloupci
        HSYNC    : out std_logic; -- synchronizacni pulzy pro VGA vystup
        VSYNC    : out std_logic
    );
end VGA_SYNC;

architecture Behavioral of VGA_SYNC is

    signal pixel_tick : std_logic; -- doba vykreslovani pixelu - 25 MHz
    signal position_x : unsigned(9 downto 0); -- udava cislo pixelu na radku
    signal position_y : unsigned(9 downto 0); -- udava cislo pixelu ve sloupci

begin

    ----------------------------------------------------------------------------
    -- pixel_tick o potrebne frekvenci 25MHz, vyzaduje CLK o frekvenci 50MHZ

    pixel_tick_p : process (CLK, RST)
    begin
        if (RST = '1') then
            pixel_tick <= '0';
        elsif (rising_edge(CLK)) then
            pixel_tick <= not pixel_tick;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- pocitani na jakem pixelu na radku se nachazime

    position_x_p : process (CLK, RST)
    begin
        if (RST = '1') then
            position_x <= (others => '0');
        elsif (rising_edge(CLK)) then
            if (pixel_tick = '1') then
                if (position_x = 799) then
                    position_x <= (others => '0');
                else
                    position_x <= position_x + 1;
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- pocitani na jakem pixelu ve sloupci se nachazime

    position_y_p : process (CLK, RST)
    begin
        if (RST = '1') then
            position_y <= (others => '0');
        elsif (rising_edge(CLK)) then
            if (pixel_tick = '1' and position_x = 799) then
                if (position_y = 524) then
                    position_y <= (others => '0');
                else
                    position_y <= position_y + 1;
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- synchronizacni pulzy pro VGA

    hsync_reg_p : process (CLK, RST)
    begin
        if (RST = '1') then
            HSYNC <= '0';
        elsif (rising_edge(CLK)) then
            if (position_x > 655 and position_x < 752) then
                HSYNC <= '0';
            else
                HSYNC <= '1';
            end if;
        end if;
    end process;

    vsync_reg_p : process (CLK, RST)
    begin
        if (RST = '1') then
            VSYNC <= '0';
        elsif (rising_edge(CLK)) then
            if (position_y > 489 and position_y < 492) then
                VSYNC <= '0';
            else
                VSYNC <= '1';
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- prirazeni vystupnich signalu

    PIXEL_X <= std_logic_vector(position_x);
    PIXEL_Y <= std_logic_vector(position_y);

end Behavioral;

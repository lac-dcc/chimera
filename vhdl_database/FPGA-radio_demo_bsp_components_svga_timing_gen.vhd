--  ****************************************************************************
--  Filename         :svga_timing_gen.vhd
--  Project          :Wishbone VGA Core 
--  Version          :0.1
--  Author           :Jonathan P Dawson
--  Created Date     :2005-12-18
--  ****************************************************************************
--  Description      :Generates video timings for a caracter maped video 
--                    display. Generates sync signals, the address of a 
--                    character within the screen and the address of a pixel 
--                    within a character.
--  ****************************************************************************
--  Dependencies     :Standard Libraries
--  ****************************************************************************
--  Revision History :
--  
--  Date :2005-12-18
--  Author :Jonathan P Dawson
--  Modification: Created File
--  
--  ****************************************************************************
--  Copyright (C) Jonathan P Dawson 2005
--  ****************************************************************************
library IEEE;
use Ieee.std_logic_1164.all;
use Ieee.numeric_std.all;

entity VIDEO_TIME_GEN is
  port ( 
  CLK                    : in  Std_logic;
  RST                    : in  Std_logic;
  CHARADDR               : out Std_logic_vector(12 downto 0);
  PIXROW                 : out Std_logic_vector(2 downto 0);
  PIXCOL                 : out Std_logic_vector(2 downto 0);
  HSYNCH                 : out Std_logic;
  VSYNCH                 : out Std_logic;
  BLANK                  : out Std_logic);
end VIDEO_TIME_GEN;

architecture RTL of VIDEO_TIME_GEN is
  
  signal PIX_ROW_ADDRESS : Unsigned(2 downto 0);
  signal PIX_COL_ADDRESS : Unsigned(2 downto 0);
  signal ROW_ADDRESS     : Unsigned(12 downto 0);
  signal COL_ADDRESS     : Unsigned(6 downto 0);
  
  signal VTIMER          : Unsigned(9 downto 0);
  signal HTIMER          : Unsigned(10 downto 0);
  signal VTIMER_EN       : Std_logic;
  signal VBLANK          : Std_logic;
  signal HBLANK          : Std_logic;
  signal INTVSYNCH       : Std_logic;
  signal INTHSYNCH       : Std_logic;
  
  constant HSYNCHTIME    : Integer := 120;
  constant HACTIVETIME   : Integer := 800;
  constant FPORCHTIME    : Integer := 64;
  constant BPORCHTIME    : Integer := 56;
  
  constant VSYNCHTIME    : Integer := 6;
  constant VACTIVETIME   : Integer := 600;
  constant VFPORCHTIME   : Integer := 35;
  constant VBPORCHTIME   : Integer := 21;
  
begin
  
  process
  begin
    wait until rising_edge(CLK);
    if VBLANK = '0' and HBLANK = '0' then
      if PIX_COL_ADDRESS = To_unsigned(7, 3) then
        PIX_COL_ADDRESS <= (others => '0');
        if COL_ADDRESS = To_unsigned(99, 7) then
          COL_ADDRESS <= (others => '0');
          if PIX_ROW_ADDRESS = To_unsigned(7, 3) then
            PIX_ROW_ADDRESS <= (others => '0');
            if ROW_ADDRESS = To_unsigned(7400, 13) then
              ROW_ADDRESS <= (others => '0');
            else
              ROW_ADDRESS <= ROW_ADDRESS + 100;
            end if;
          else
            PIX_ROW_ADDRESS <= PIX_ROW_ADDRESS + 1;
          end if;
        else
          COL_ADDRESS <= COL_ADDRESS + 1;
        end if;
      else
        PIX_COL_ADDRESS <= PIX_COL_ADDRESS +1;
      end if;
    end if;

    if RST = '1' then
      PIX_COL_ADDRESS <= (others => '0');
      PIX_ROW_ADDRESS <= (others => '0');
      COL_ADDRESS     <= (others => '0');
      ROW_ADDRESS     <= (others => '0');
    end if;
  end process;
  
  process
  begin
    wait until rising_edge(CLK);

    if VTIMER_EN = '1' then
      VTIMER <= VTIMER + 1;
      
      if VTIMER = To_unsigned(VSYNCHTIME, 10) then
        INTVSYNCH <= '1';
      end if;
      
      if VTIMER = To_unsigned(VSYNCHTIME 
        + VFPORCHTIME, 10) then
        VBLANK   <= '0';
      end if;
      
      if VTIMER = To_unsigned(VSYNCHTIME 
        + VFPORCHTIME 
        + VACTIVETIME, 10) then
        VBLANK   <= '1';
      end if;
      
      if VTIMER = To_unsigned(VSYNCHTIME 
        + VFPORCHTIME 
        + VACTIVETIME 
        + VBPORCHTIME, 10) then          
        INTVSYNCH <= '0';
        VTIMER <= (others => '0');
      end if;
    end if;
    if RST = '1' then
      VTIMER <= (others => '0');
      INTVSYNCH <= '0';
      VBLANK <= '1';
    end if;
  end process;
  
  process
  begin         
    wait until Rising_edge(CLK);
    HTIMER <= HTIMER + 1;
    VTIMER_EN <= '0';
    
    if HTIMER = To_unsigned(HSYNCHTIME, 11) then      
      INTHSYNCH <= '1';
    end if;
    
    if HTIMER = To_unsigned(HSYNCHTIME 
      + FPORCHTIME, 11) then
      HBLANK <= '0';
    end if;
    
    if HTIMER = To_unsigned(HSYNCHTIME 
      + FPORCHTIME 
      + HACTIVETIME, 11) then
      HBLANK <= '1';
    end if;
    
    if HTIMER = To_unsigned(HSYNCHTIME 
      + FPORCHTIME 
      + HACTIVETIME 
      + BPORCHTIME, 11) then          
      INTHSYNCH <= '0';
      VTIMER_EN <= '1';
      HTIMER <= (others => '0');          
    end if;
    if RST = '1' then
      HTIMER     <= (others => '0');
      INTHSYNCH   <= '0';
      HBLANK   <= '1';
      VTIMER_EN  <= '1';
    end if;              
  end process;
  
  HSYNCH <= INTHSYNCH;
  VSYNCH <= INTVSYNCH;
  BLANK <= HBLANK or VBLANK;
  
  CHARADDR <= Std_logic_vector(ROW_ADDRESS + COL_ADDRESS);
  PIXCOL   <= Std_logic_vector(PIX_COL_ADDRESS);
  PIXROW   <= Std_logic_vector(PIX_ROW_ADDRESS);
  
  
end RTL;





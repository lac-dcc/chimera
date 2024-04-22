--  ****************************************************************************
--  Filename         :svga_core.vhd
--  Project          :VGA Core 
--  Version          :0.1
--  Author           :Jonathan P Dawson
--  Created Date     :2005-12-18
--  ****************************************************************************
--  Description      :A wishbone compatible VGA core. The core is implemented 
--                    using BLOCK RAMs to create character maped graphics. An 
--                    SVGA (800x600 75hz) display is generated consisting of 
--                    100x75 characters of 8x8 pixels each. Each character is set
--                    to an 8-bit value. At present ASCII glyphs have been 
--                    generated.
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
use WORK.PIXPACKAGE.all;

entity CHARSVGA is
  port ( 

  CLK        : in  Std_logic;
  DATA       : in  Std_logic_vector(31 downto 0);
  DATA_ACK   : out Std_logic;
  DATA_STB   : in  Std_logic;
  
  --VGA interface
  VGACLK        : in  Std_logic;
  RST        : in  Std_logic;
  R          : out Std_logic;
  G          : out Std_logic;
  B          : out Std_logic;
  HSYNCH     : out Std_logic;
  VSYNCH     : out Std_logic
  );
end CHARSVGA;

architecture RTL of CHARSVGA is

  component VIDEO_TIME_GEN is
    port ( 
    CLK      : in  Std_logic;
    RST      : in  Std_logic;
    CHARADDR : out Std_logic_vector(12 downto 0);
    PIXROW   : out Std_logic_vector(2 downto 0);
    PIXCOL   : out Std_logic_vector(2 downto 0);
    HSYNCH   : out Std_logic;
    VSYNCH   : out Std_logic;
    BLANK    : out Std_logic);
  end component;

  component BRAM is
  generic(
    DEPTH : integer := 7500;
    WIDTH : integer := 8
  );
  port(
    CLK_IN : in std_logic;
    CLK_OUT : in std_logic;

    WE : in std_logic;
    DIN : in std_logic_vector;
    AIN : in std_logic_vector;

    DOUT : out std_logic_vector;
    AOUT : in std_logic_vector
  );
  end component BRAM;
  
  type CHAR_ARRAY_TYPE is array (0 to 7499)  of Std_logic_vector(7 downto 0);
  shared variable CHARARRAY : CHAR_ARRAY_TYPE;
  
  signal INTHSYNCH, INTVSYNCH   : Std_logic;
  signal HSYNCH_DEL, VSYNCH_DEL : Std_logic;
  signal BLANK, BLANK_DEL, BLANK_DEL_DEL 
                                : Std_logic;
  signal PIX, WR                : Std_logic;
  signal PIXROW, PIXROW_DEL     : Std_logic_vector(2 downto 0);
  signal PIXCOL, PIXCOL_DEL, PIXCOL_DEL_DEL 
                                : Std_logic_vector(2 downto 0);
  signal CHARADDR               : Std_logic_vector(12 downto 0);
  signal CHAR, PIXELS           : Std_logic_vector(7 downto 0);

  signal AIN                    : std_logic_vector(12 downto 0);
  signal DIN                    : std_logic_vector(7 downto 0);
  signal WE                     : std_logic;
    
begin

  TIMEING1: VIDEO_TIME_GEN port map( 
  CLK      => VGACLK,
  RST      => RST,
  CHARADDR => CHARADDR, 
  PIXROW   => PIXROW,
  PIXCOL   => PIXCOL,
  HSYNCH   => INTHSYNCH,
  VSYNCH   => INTVSYNCH,
  BLANK    => BLANK
  );
  

 BRAM_INST_1 : BRAM generic map(
    DEPTH => 7500,
    WIDTH => 8
 ) port map(
    CLK_IN => CLK,
    CLK_OUT => VGACLK,

    WE => WE,
    DIN => DIN,
    AIN => AIN,

    DOUT => CHAR,
    AOUT => CHARADDR
 );
  
  process
  begin
    wait until rising_edge(CLK);
    WE <= '0';
    if DATA_STB = '1' then
      WE <= '1';
      AIN <= DATA(20 downto 8);
      DIN <= DATA(7 downto 0);
    end if;
  end process;
  DATA_ACK <= '1';

  process
    
    variable PIXADDRESS :Integer;
    variable PIXVECTOR  : Std_logic_vector(10 downto 0);
  
  begin
    
    wait until rising_edge(VGACLK);
    PIXVECTOR := CHAR & PIXROW_DEL;
    PIXADDRESS := To_integer(Unsigned(PIXVECTOR));
    PIXELS <= PIXARRAY(PIXADDRESS);
  
  end process;
  
  process
  begin
    
    wait until rising_edge(VGACLK);
    HSYNCH_DEL     <= INTHSYNCH;
    HSYNCH         <= HSYNCH_DEL;
    VSYNCH_DEL     <= INTVSYNCH;
    VSYNCH         <= VSYNCH_DEL;
    BLANK_DEL      <= BLANK;
    BLANK_DEL_DEL  <= BLANK_DEL;
    PIXROW_DEL     <= PIXROW;
    PIXCOL_DEL     <= PIXCOL;
    PIXCOL_DEL_DEL <= PIXCOL_DEL;
  
  end process;
  
  PIX <= PIXELS(to_integer(unsigned(PIXCOL_DEL_DEL)));
  
  R <= PIX and not(BLANK_DEL_DEL);
  G <= PIX and not(BLANK_DEL_DEL);
  B <= PIX and not(BLANK_DEL_DEL);
  
end RTL;





----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:42:44 12/04/2010 
-- Design Name: 
-- Module Name:    VgaDisplay - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package VgaDisplayPckg is

  component VgaDisplay
    port (
      Clk     : in  std_logic;
      Reset   : in  std_logic;
      Hsync_n : out std_logic;
      Vsync_n : out std_logic;
      Rgb     : out std_logic_vector (2 downto 0);
      Row     : in  std_logic_vector (7 downto 0);
      Col     : in  std_logic_vector (7 downto 0);
      Char    : in  std_logic_vector (7 downto 0)
      );
  end component;

end package;


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.VgaCtlrPckg.all;
use work.ClkGenPckg.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VgaDisplay is
  port (
    Clk     : in  std_logic;
    Reset   : in  std_logic;
    Hsync_n : out std_logic;
    Vsync_n : out std_logic;
    Rgb     : out std_logic_vector (2 downto 0);
    Row     : in  std_logic_vector (7 downto 0);
    Col     : in  std_logic_vector (7 downto 0);
    Char    : in  std_logic_vector (7 downto 0)
    );
end VgaDisplay;



architecture Behavioral of VgaDisplay is

  component CharRom
    port (
      clka  : in  std_logic;
      addra : in  std_logic_vector(11 downto 0);
      douta : out std_logic_vector(7 downto 0));
  end component;

  component ScreenRam
    port (
      clka  : in  std_logic;
      wea   : in  std_logic_vector(0 downto 0);
      addra : in  std_logic_vector(11 downto 0);
      dina  : in  std_logic_vector(7 downto 0);
      clkb  : in  std_logic;
      addrb : in  std_logic_vector(11 downto 0);
      doutb : out std_logic_vector(7 downto 0));
  end component;

  signal VgaClk   : std_logic;          -- 25 MHz clock for VGA display
  signal RamAddr  : std_logic_vector(11 downto 0);
  signal RamData  : std_logic_vector(7 downto 0);
  signal RomAddr  : std_logic_vector(11 downto 0);
  signal RomData  : std_logic_vector(7 downto 0);
  signal CharAddr : std_logic_vector(11 downto 0);

begin

  u0 : ClkGen
    generic map(BASE_FREQ_G => 100.0, CLK_MUL_G => 2, CLK_DIV_G => 4) port map(I => Clk, O => VgaClk);
  
  CharAddr <= CONV_STD_LOGIC_VECTOR(CONV_INTEGER(Row) * 80 + CONV_INTEGER(Col), CharAddr'length);

  u1 : ScreenRam
    port map (
      clka  => Clk,
      wea   => "1",
      addra => CharAddr,
      dina  => Char,
      clkb  => VgaClk,
      addrb => RamAddr,
      doutb => RamData
      );

  u2 : CharRom
    port map (
      clka  => VgaClk,
      addra => RomAddr,
      douta => RomData
      );

  u3 : VgaCtlr
    port map (
      Reset   => Reset,
      Clk     => VgaClk,
      Hsync_n => Hsync_n,
      Vsync_n => Vsync_n,
      Rgb     => Rgb,
      RamAddr => RamAddr,
      RamData => RamData,
      RomAddr => RomAddr,
      RomData => RomData
      );

end Behavioral;


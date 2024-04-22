----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:38:18 12/04/2010 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.VgaPckg.all;
use work.VgaDisplayPckg.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
  port (
    Clk     : in  std_logic;
    Hsync_n : out std_logic;
    Vsync_n : out std_logic;
    Rgb     : out std_logic_vector (8 downto 0)
    );
end top;

architecture Behavioral of top is

  signal Reset     : std_logic                     := '1';
  signal Data      : std_logic_vector(15 downto 0) := X"EF45";
  signal Char      : std_logic_vector(7 downto 0);
  signal Row       : std_logic_vector(7 downto 0);
  signal Col       : std_logic_vector(7 downto 0);
  signal Rgb_small : std_logic_vector(2 downto 0);

begin

  process(Clk)
    variable ResetCntr : natural range 0 to 15 := 15;
  begin
    if rising_edge(Clk) then
      if ResetCntr /= 0 then
        ResetCntr := ResetCntr - 1;
      else
        Reset <= '0';
      end if;
    end if;
  end process;

  --  Convert 16-bit data into four-digit hexadecimal number for storage into screen RAM.
  process(Reset, Clk)
    constant HOME_ROW  : std_logic_vector(7 downto 0) := CONV_STD_LOGIC_VECTOR(10, 8);
    constant HOME_COL  : std_logic_vector(7 downto 0) := CONV_STD_LOGIC_VECTOR(40, 8);
    variable NybbleCnt : natural range 0 to 3;

    -- Function to convert four-bit nybble into the code for the corresponding hex digit.
    function NybbleToHexChar(Nybble : std_logic_vector(3 downto 0)) return std_logic_vector is
      variable Char : std_logic_vector(7 downto 0);
    begin
      case Nybble is
        when "0000" => Char := "00100000";
        when "0001" => Char := "00100001";
        when "0010" => Char := "00100010";
        when "0011" => Char := "00100011";
        when "0100" => Char := "00100100";
        when "0101" => Char := "00100101";
        when "0110" => Char := "00100110";
        when "0111" => Char := "00100111";
        when "1000" => Char := "00101000";
        when "1001" => Char := "00101001";
        when "1010" => Char := "00000001";
        when "1011" => Char := "00000010";
        when "1100" => Char := "00000011";
        when "1101" => Char := "00000100";
        when "1110" => Char := "00000101";
        when "1111" => Char := "00000110";
        when others => Char := "00000000";
      end case;
      return Char;
    end NybbleToHexChar;

  begin
    if Reset = '1' then
      NybbleCnt := 0;
      Row       <= HOME_ROW;
      Col       <= HOME_COL;
    elsif rising_edge(Clk) then
      case NybbleCnt is
        when 0 =>
          Char      <= NybbleToHexChar(Data(15 downto 12));
          Col       <= HOME_COL;
          NybbleCnt := NybbleCnt + 1;
        when 1 =>
          Char      <= NybbleToHexChar(Data(11 downto 8));
          Col       <= Col + 1;
          NybbleCnt := NybbleCnt + 1;
        when 2 =>
          Char      <= NybbleToHexChar(Data(7 downto 4));
          Col       <= Col + 1;
          NybbleCnt := NybbleCnt + 1;
        when 3 =>
          Char      <= NybbleToHexChar(Data(3 downto 0));
          Col       <= Col + 1;
          NybbleCnt := 0;
      end case;
    end if;
  end process;

  u0 : VgaDisplay
    port map (
      Clk     => Clk,
      Reset   => Reset,
      Hsync_n => Hsync_n,
      Vsync_n => Vsync_n,
      Rgb     => Rgb_small,
      Row     => Row,
      Col     => Col,
      Char    => Char
      );

  -- Convert the 3-bit RGB into the 9-bit RGB of the XSA-3S1000 Board.
  Rgb(2 downto 0) <= Rgb_small(0) & Rgb_small(0) & Rgb_small(0);
  Rgb(5 downto 3) <= Rgb_small(1) & Rgb_small(1) & Rgb_small(1);
  Rgb(8 downto 6) <= Rgb_small(2) & Rgb_small(2) & Rgb_small(2);

end Behavioral;


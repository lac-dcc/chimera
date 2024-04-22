----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:54:20 09/12/2011 
-- Design Name: 
-- Module Name:    winglcdsndbut - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity winglcdsndbut is
    Port (
			W1A : inout  STD_LOGIC_VECTOR (15 downto 0);
         W1B : inout  STD_LOGIC_VECTOR (15 downto 0);
			buttons : out std_logic_vector(5 downto 0);
			audio_left : in  STD_LOGIC;
         audio_right : in  STD_LOGIC;
			ud : in  STD_LOGIC;
			rl : in  STD_LOGIC;
			enab : in  STD_LOGIC;
			vsync : in  STD_LOGIC;
			hsync : in  STD_LOGIC;
			ck : in  STD_LOGIC;
			r : in std_logic_vector(5 downto 0);
			g : in std_logic_vector(5 downto 0);
			b : in std_logic_vector(5 downto 0)
		);
end winglcdsndbut;

architecture Behavioral of winglcdsndbut is

signal CLK_OUT, clki, clki_n : STD_LOGIC;

begin
	w1b(14) <= 'Z';
	w1b(15) <= 'Z';
	w1a(0) <= 'Z';
	w1a(1) <= 'Z';
	w1b(0) <= 'Z';
	w1b(1) <= 'Z';
    buttons(5) <= w1b(14);
    buttons(4) <= w1b(15);
    buttons(3) <= w1a(0);
    buttons(2) <= w1a(1);
    buttons(1) <= w1b(0);
    buttons(0) <= w1b(1);
    w1a(14) <= audio_right;
    w1a(15) <= audio_left;

   w1a(2) <= ud;
    w1b(13) <= rl;
    w1a(3) <= enab;
    w1b(3) <= vsync;
    w1a(13) <= hsync;
--    w1b(2) <= ck;
    w1a(10) <= r(5);
    w1b(6) <= r(4);
    w1a(11) <= r(3);
    w1b(5) <= r(2);
    w1a(12) <= r(1);
    w1b(4) <= r(0);
    w1b(9) <= g(5);
    w1a(7) <= g(4);
    w1b(8) <= g(3);
    w1a(8) <= g(2);
    w1b(7) <= g(1);
    w1a(9) <= g(0);
    w1a(4) <= b(5);
    w1b(12) <= b(4);
    w1a(5) <= b(3);
    w1b(11) <= b(2);
    w1a(6) <= b(1);
    w1b(10) <= b(0);

  clkout_oddr : ODDR2
  port map
   (Q  => w1b(2),
    C0 => clki,
    C1 => clki_n,
    CE => '1',
    D0 => '1',
    D1 => '0',
    R  => '0',
    S  => '0');
  -- Connect the output clocks to the design
  -------------------------------------------
  clki <= ck;
  clki_n <= not clki;

end Behavioral;


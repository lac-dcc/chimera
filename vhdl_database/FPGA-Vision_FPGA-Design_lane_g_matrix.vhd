-- lane_g_matrix.vhd
--
-- arithmetic for 3x3 matrix of Sobel filter
--
-- FPGA Vision Remote Lab http://h-brs.de/fpga-vision-lab
-- (c) Marco Winzker, Hochschule Bonn-Rhein-Sieg, 03.01.2018

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lane_g_matrix is
  port ( clk       : in  std_logic;
         reset     : in  std_logic;
         in_p1a    : in  std_logic_vector(23 downto 0);
         in_p2     : in  std_logic_vector(23 downto 0);
         in_p1b    : in  std_logic_vector(23 downto 0);
         in_m1a    : in  std_logic_vector(23 downto 0);
         in_m2     : in  std_logic_vector(23 downto 0);
         in_m1b    : in  std_logic_vector(23 downto 0);
         data_out  : out integer range 0 to 268435456);
end lane_g_matrix;

architecture behave of lane_g_matrix is
signal   lum_p1a      : integer range  0 to  4095;
signal   lum_p2       : integer range  0 to  4095;
signal   lum_p1b      : integer range  0 to  4095;
signal   lum_m1a      : integer range  0 to  4095;
signal   lum_m2       : integer range  0 to  4095;
signal   lum_m1b      : integer range  0 to  4095;
signal   sum          : integer range -16383 to 16383;

function rgb2y (vec : std_logic_vector(23 downto 0)) return integer is
    variable result : integer range  0 to  4095;
begin
    -- convert RGB to luminance: Y (5*R + 9*G + 2*B)
    result := 5*to_integer(unsigned(vec(23 downto 16)))
            + 9*to_integer(unsigned(vec(15 downto  8)))
            + 2*to_integer(unsigned(vec( 7 downto  0)));
return result;
end function;

begin

process
begin
   wait until rising_edge(clk);

    -- convert RGB to Y with VHDL-function
                                  -- pixel with factor
    lum_p1a   <= rgb2y(in_p1a);   --  plus 1
    lum_p2    <= rgb2y(in_p2);    --  plus 2
    lum_p1b   <= rgb2y(in_p1b);   --  plus 1
    lum_m1a   <= rgb2y(in_m1a);   -- minus 1
    lum_m2    <= rgb2y(in_m2);    -- minus 2
    lum_m1b   <= rgb2y(in_m1b);   -- minus 1

    -- add values according to sobel matrix
    --         |-1  0  1|      | 1  2  1|
    --         |-2  0  2|  or  | 0  0  0|
    --         |-1  0  1|      |-1 -2 -1|
    sum   <=  lum_p1a + 2*lum_p2 + lum_p1b - lum_m1a - 2*lum_m2 - lum_m1b;

    -- square of sum
    data_out <= sum*sum;

end process;

end behave;

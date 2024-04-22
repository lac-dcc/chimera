-------------------------------------------------------------------------------
-- Title       : Full-adder
-- Project     : VHDL Library of Arithmetic Units
-------------------------------------------------------------------------------
-- File        : FullAdder.vhd
-- Author      : Reto Zimmermann  <zimmi@iis.ee.ethz.ch>
-- Company     : Integrated Systems Laboratory, ETH Zurich
-- Date        : 1997/11/04
-------------------------------------------------------------------------------
-- Copyright (c) 1998 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Description :
-- Should force the compiler to use a full-adder cell instead of simple logic
-- gates. Otherwise, a full-adder cell of the target library has to be
-- instantiated at this point (see second architecture).
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity rz_FullAdder is

  port (A, B, CI : in std_logic;  	-- operands
        S, CO : out std_logic);  	-- sum and carry out

end rz_FullAdder;

-------------------------------------------------------------------------------

architecture Structural of rz_FullAdder is 

  signal Auns, Buns, CIuns, Suns : unsigned(1 downto 0);  -- unsigned temp
  
begin

  -- type conversion: std_logic -> 2-bit unsigned
  Auns <= '0' & A;
  Buns <= '0' & B;
  CIuns <= '0' & CI;

  -- should force the compiler to use a full-adder cell
  Suns <= Auns + Buns + CIuns;

  -- type conversion: 2-bit unsigned -> std_logic
  S <= Suns(0);
  CO <= Suns(1);

end Structural;

-------------------------------------------------------------------------------
-- Title       : Unsigned array divider
-- Project     : VHDL Library of Arithmetic Units
-------------------------------------------------------------------------------
-- File        : DivArrUns.vhd
-- Author      : Reto Zimmermann  <zimmi@iis.ee.ethz.ch>
-- Company     : Integrated Systems Laboratory, ETH Zurich
-- Date        : 1997/12/03
-------------------------------------------------------------------------------
-- Copyright (c) 1998 Integrated Systems Laboratory, ETH Zurich
-------------------------------------------------------------------------------
-- Description :
-- Restoring array divider for unsigned numbers. Divisor must be normalized
-- (i.e. Y(widthY-1) = '1')
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity rz_DivArrUns is

	generic (widthX : positive := 16;	-- word width of X
		     widthY : positive := 8);	-- word width of Y
	port (X : in std_logic_vector(widthX-1 downto 0);  -- dividend
		  Y : in std_logic_vector(widthY-1 downto 0);  -- divisor, normalized
		  Q : out std_logic_vector(widthX-widthY downto 0);  -- quotient
		  R : out std_logic_vector(widthY-1 downto 0));  -- remainder

end rz_DivArrUns;

-------------------------------------------------------------------------------

architecture Structural of rz_DivArrUns is


COMPONENT rz_FullAdder IS
	port (A, B, CI : in std_logic;  	-- operands
		  S, CO : out std_logic);  	-- sum and carry out
END COMPONENT;

	constant widthQ : positive := widthX-widthY+1;  -- word width of Q

	signal YI : std_logic_vector(widthY downto 0);  -- inverted Y
	signal ST : std_logic_vector(widthQ*(widthY+1)-1 downto 0);  -- sums
	signal RT : std_logic_vector((widthQ+1)*(widthY+2)-1 downto 0); -- remainders
	signal CT : std_logic_vector(widthQ*(widthY+2)-1 downto 0);  -- carries

begin

  -- invert divisor Y for subtraction
  YI <= '1' & not Y;
  -- first partial remainder is dividend X
  RT(widthQ*(widthY+2)+widthY downto widthQ*(widthY+2)+1) <=
    '0' & X(widthX-1 downto widthX-widthY+1);

  -- process one row for each quotient bit
  row : for k in widthQ-1 downto 0 generate

    -- carry-in = '1' for subtraction
    CT(k*(widthY+2)) <= '1';
    -- attach next dividend bit to current remainder
    RT((k+1)*(widthY+2)) <= X(k);

    -- perform subtraction using ripple-carry adder
    -- (currend partial remainder - divisor)
    bits : for i in widthY downto 0 generate
      fa : rz_FullAdder
	port map (YI(i), RT((k+1)*(widthY+2)+i), CT(k*(widthY+2)+i),
		  ST(k*(widthY+1)+i), CT(k*(widthY+2)+i+1));
    end generate bits;

    -- if subtraction result is negative => quotient bit = '0'
    Q(k) <= CT(k*(widthY+2)+widthY+1);

    -- restore previous partial remainder if quotient bit = '0'
    RT(k*(widthY+2)+widthY+1 downto k*(widthY+2)+1) <=
      RT((k+1)*(widthY+2)+widthY downto (k+1)*(widthY+2))
				     when CT(k*(widthY+2)+widthY+1) = '0' else
      ST(k*(widthY+1)+widthY downto k*(widthY+1));

  end generate row;

  -- last partial remainder is division remainder
  R <= RT(widthY downto 1);

end Structural;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SEG7_LUT_4 is
  port (
	 clk50 : in std_logic;
	 h0 : out STD_LOGIC_VECTOR( 6 downto 0 );
	 h1 : out STD_LOGIC_VECTOR( 6 downto 0 );
	 h2 : out STD_LOGIC_VECTOR( 6 downto 0 );
	 h3 : out STD_LOGIC_VECTOR( 6 downto 0 );
	 mSEG7_DIG : in STD_LOGIC_VECTOR ( 15 downto 0 )
       );
end SEG7_LUT_4;

architecture rtl of SEG7_LUT_4 is

  COMPONENT SEG7_LUT
    PORT(
	  clk50 : in std_logic;
	  seg : out std_logic_vector( 6 downto 0 );
	  dig : in std_logic_vector( 3 downto 0 )
	);
  END COMPONENT;

begin

  u0 : SEG7_LUT PORT MAP
  (	  
    clk50 => clk50,
    seg => h0,
    dig => mSEG7_DIG(3 downto 0)
  );

  u1 : SEG7_LUT PORT MAP
  (	  
    clk50 => clk50,
    seg => h1,
    dig => mSEG7_DIG(7 downto 4)
  );

  u2 : SEG7_LUT PORT MAP
  (	  
    clk50 => clk50,
    seg => h2,
    dig => mSEG7_DIG(11 downto 8)
  );

  u3 : SEG7_LUT PORT MAP
  (	  
    clk50 => clk50,
    seg => h3,
    dig => mSEG7_DIG(15 downto 12)
  );

end rtl;

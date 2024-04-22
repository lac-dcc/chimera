-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tetris is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    UP_KEY : in STD_LOGIC;
    LEFT_KEY : in STD_LOGIC;
    RIGHT_KEY : in STD_LOGIC;
    DOWN_KEY : in STD_LOGIC;
    start : in STD_LOGIC;
    vsync_r : out STD_LOGIC;
    hsync_r : out STD_LOGIC;
    OutRed : out STD_LOGIC_VECTOR ( 3 downto 0 );
    OutGreen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    OutBlue : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end tetris;

architecture stub of tetris is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
begin
end;

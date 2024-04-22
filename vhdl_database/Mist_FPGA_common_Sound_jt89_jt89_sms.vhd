library IEEE;
use IEEE.std_logic_1164.all;

package jt89 is 

-- SMS wrapper. clk_en assumed to be 1. x16 LPF+interpolator enabled
component jt89_sms
port
(
    rst        : in  std_logic;
    clk        : in  std_logic;         -- CPU clock
    din        : in  std_logic_vector(7 downto 0);
    wr_n       : in  std_logic;
    ready      : out std_logic;
    sound      : out std_logic_vector(10 downto 0) -- signed
);
end component;

component jt12_dac2
port
(
    rst        : in  std_logic;
    clk        : in  std_logic;         -- CPU clock
    din        : in  std_logic_vector(10 downto 0); -- signed
    dout       : out std_logic
);
end component;

end;

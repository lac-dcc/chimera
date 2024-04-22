library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Simplify is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           T : in  STD_LOGIC;
           W : in  STD_LOGIC;
           OUTA : out  STD_LOGIC);
end Simplify;

architecture Behavioral of Simplify is

component AND_gate is
port (A, B : in std_logic;
         Y: out std_logic
 );
end component;

component NOT_gate is
port (A : in  STD_LOGIC;
      A_not : out  STD_LOGIC);
end component;

component OR_gate is
port ( A : in  STD_LOGIC;
       B : in  STD_LOGIC;
       Y : out STD_LOGIC);
end component;

signal x_not,y_not,z_not,t_not,w_not : std_logic;
signal a, a1, b, b1, c, c1, c2, d, d1, d2, o1, o2 : std_logic;

begin

NOTX: NOT_gate port map(X, x_not);
NOTY: NOT_gate port map(Y, y_not);
NOTZ: NOT_gate port map(Z, z_not);
NOTT: NOT_gate port map(T, t_not);
NOTW: NOT_gate port map(W, w_not);--not's of input variables

anda1: AND_gate port map (y_not, z_not, a1);--y'z'
anda:  AND_gate port map (a1, w_not,a);--y'z'w'

andb1: AND_gate port map (Y , Z, b1);--yz
andb:  AND_gate port map (b1, W, b);--yzw

andc1: AND_gate port map (x_not , Y, c1);--x'y
andc2: AND_gate port map (c1, T,c2);--x'yt
andc:  AND_gate port map (c2, w_not, c);--x'ytw'

andd1: AND_gate port map (X , Y, d1);--xy
andd2: AND_gate port map (d1, t_not, d2);--xyt'
andd:  AND_gate port map (d2, w_not, d);--xyt'w'

or1: OR_gate port map (a, b, o1);--y'z'w' + yzw 
or2: OR_gate port map (c, d, o2);--x'ytw' + xyt'w'


result1: OR_gate port map (o1, o2, OUTA);--y'z'w' + yzw + x'ytw' + xyt'w'

end Behavioral;

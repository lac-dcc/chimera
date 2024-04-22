library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vgacore is
    Port ( clk : in std_logic;
	        reset : in std_logic;
           hs : out std_logic;
           vs : out std_logic;
           r : out std_logic_vector(3 downto 0);
           g : out std_logic_vector(3 downto 0);
           b : out std_logic_vector(3 downto 0);
			clk2 : in std_logic;
			sw	:	in std_logic_vector(17 downto 0);
			ledr	:	out std_logic_vector(17 downto 0);
			ledg	:	out std_logic_vector(7 downto 0);
			key		:	in std_logic_vector(2 downto 0);
			addr_reg	:	out std_logic_vector(15 downto 0)
		);
end vgacore;

architecture Behavioral of vgacore is
--signal div_count : std_logic_vector(1 downto 0);
signal hsyncb : std_logic;
signal vsyncb : std_logic;
signal enable : std_logic;
signal hloc : std_logic_vector(9 downto 0);
signal vloc : std_logic_vector(9 downto 0);
signal r_reg,g_reg,b_reg: std_logic_vector(3 downto 0);
signal r_reg2,g_reg2,b_reg2: std_logic_vector(3 downto 0);
--signal mmd : std_logic_vector(1 downto 0);

component vgasig 
   Port (
       clock : in std_logic;
       reset : in std_logic;
       hsyncb : buffer std_logic;
       vsyncb : out std_logic;
       enable : out std_logic;
       Xaddr : out std_logic_vector(9 downto 0);
       Yaddr : out std_logic_vector(9 downto 0)
	 );
end component;

component ppu
  port (
	clk : in std_logic;
	reset : in std_logic;
    vx : in std_logic_vector(9 downto 0);
    vy : in std_logic_vector(9 downto 0);
	r_out : out std_logic_vector(3 downto 0);
	g_out : out std_logic_vector(3 downto 0);
	b_out : out std_logic_vector(3 downto 0);
	clk2 : in std_logic;
	sw 	:	in std_logic_vector(17 downto 0);
	ledr	:	out std_logic_vector(17 downto 0);
	ledg	:	out std_logic_vector(7 downto 0);
	key		:	in std_logic_vector(2 downto 0);
	addr_pass	:	out std_logic_vector(15 downto 0)
	);
end component;

component linebuf
   port (
         address  : in  std_logic_vector(9 downto 0);
         inclock  : in  std_logic;
		 we		  : in  std_logic;
         data     : in  std_logic_vector(3 downto 0);
         q        : out std_logic_vector(3 downto 0)
        );
end component;

begin

  makesig: vgasig Port map(
       clock => clk,
       reset => reset,
       hsyncb => hsyncb,
       vsyncb => vsyncb,
       enable => enable,
       Xaddr => hloc,
       Yaddr => vloc
	 );

  hs <= hsyncb;
  vs <= vsyncb;
ppu0:ppu port map(clk,reset,hloc,vloc,r_reg,g_reg,b_reg,clk2,sw,ledr,ledg,key,addr_reg);


linebuf1 : linebuf port map(hloc,clk,vloc(0),r_reg,r_reg2);
linebuf2 : linebuf port map(hloc,clk,vloc(0),g_reg,g_reg2);
linebuf3 : linebuf port map(hloc,clk,vloc(0),b_reg,b_reg2);

process(clk)
begin 
if clk'event and clk='1' then
  if sw(4)='1' then
	if enable='1' then
	  r <= r_reg;
	  g <= g_reg;
	  b <= b_reg;
	else
	  r<="0000";
	  g<="0000";
	  b<="0000";
	end if;
  else
	  r<=r_reg2;
	  g<=g_reg2;
	  b<=b_reg2;
  end if;
end if;
end process;



end Behavioral;

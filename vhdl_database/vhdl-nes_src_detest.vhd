library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity detest is
	port(
		KEY	:	in std_logic_vector(3 downto 0);
		SW	:	in std_logic_vector(17 downto 0);
		HEX0	:	out std_logic_vector(6 downto 0);
		HEX1	:	out std_logic_vector(6 downto 0);
		HEX2	:	out std_logic_vector(6 downto 0);
		HEX3	:	out std_logic_vector(6 downto 0);
		LEDR	:	out std_logic_vector(17 downto 0);
		LEDG	:	out std_logic_vector(7 downto 0);
		CLOCK_50	:	in std_logic;
		PS2_CLK	:	in std_logic;
		PS2_DAT	:	in std_logic;
		VGA_BLANK	:	out std_logic;
		VGA_SYNC	:	out std_logic;
		VGA_CLK	:	out std_logic;
		VGA_R	:	out std_logic_vector(9 downto 0);
		VGA_G	:	out std_logic_vector(9 downto 0);
		VGA_B	:	out std_logic_vector(9 downto 0);
		VGA_HS	:	out std_logic;
		VGA_VS	:	out std_logic
		);
end detest;

architecture behav of detest is
	
	component vgacore is
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
	end component;

type hexrom_type is array (0 to 15) of std_logic_vector(6 downto 0);
constant hexrom : hexrom_type := (
	"1000000",
	"1111001",
	"0100100",
	"0110000",
	"0011001",
	"0010010",
	"0000010",
	"1111000",
	"0000000",
	"0010000",
	"0001000",
	"0000011",
	"1000110",
	"0100001",
	"0000110",
	"0001110"
	);

signal sysclk : std_logic;
signal hs_reg : std_logic;
signal vs_reg : std_logic;
signal addr_reg	:	std_logic_vector(15 downto 0);
	
begin

divclk: process(CLOCK_50,KEY(0))
  begin
    if KEY(0)='0' then
 	   sysclk <= '0';
	 elsif CLOCK_50'event and CLOCK_50='1' then
	   sysclk <= not sysclk;
	 end if;
  end process;

V	:	vgacore port map(sysclk,KEY(0),hs_reg,vs_reg,VGA_R(9 downto 6),VGA_G(9 downto 6),VGA_B(9 downto 6),CLOCK_50,SW,LEDR,LEDG,KEY(3 downto 1),addr_reg);
VGA_R(5 downto 0)<="000000";
VGA_G(5 downto 0)<="000000";
VGA_B(5 downto 0)<="000000";
VGA_SYNC<='1';
VGA_CLK<=sysclk;
VGA_BLANK<=hs_reg and vs_reg;
VGA_HS<=hs_reg;
VGA_VS<=vs_reg;
HEX0<=hexrom(conv_integer(addr_reg(3 downto 0)));
HEX1<=hexrom(conv_integer(addr_reg(7 downto 4)));
HEX2<=hexrom(conv_integer(addr_reg(11 downto 8)));
HEX3<=hexrom(conv_integer(addr_reg(15 downto 12)));

end;
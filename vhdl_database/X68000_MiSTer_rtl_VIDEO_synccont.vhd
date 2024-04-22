library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity synccont is
generic(
	DOTPU	:integer	:=8;
	HWIDTH	:integer	:=800;
	VWIDTH	:integer	:=525;
	HVIS	:integer	:=640;
	VVIS	:integer	:=400;
	CPD		:integer	:=3;		--clocks per dot
	HFP		:integer	:=3;
	HSY		:integer	:=12;
	VFP		:integer	:=51;
	VSY		:integer	:=2
);	
port(
	UCOUNT	:in integer range 0 to DOTPU-1;
	HUCOUNT	:in integer range 0 to (HWIDTH/DOTPU)-1;
	VCOUNT	:in integer range 0 to VWIDTH-1;
	HCOMP	:in std_logic;
	VCOMP	:in std_logic;

	HSYNC	:out std_logic;
	VSYNC	:out std_logic;
	VISIBLE	:out std_logic;
	
	HRTC	:out std_logic;
	VRTC	:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end synccont;

architecture MAIN of  synccont is
constant 	HUWIDTH :integer	:=HWIDTH/DOTPU;
constant 	HUVIS	:integer	:=HVIS/DOTPU;
constant 	HBP		:integer	:=HUWIDTH-HUVIS-HFP-HSY;
constant 	HIV		:integer	:=HFP+HSY+HBP;
constant 	VBP		:integer	:=VWIDTH-VVIS-VFP-VSY;
constant	VIV		:integer	:=VFP+VSY+VBP;

signal	HSYNCB	:std_logic_vector(7 downto 0);
signal	VSYNCB	:std_logic_vector(7 downto 0);
signal	VISIBLEB:std_logic_vector(7 downto 0);
signal	HSYNCN	:std_logic;
signal	VSYNCN	:std_logic;
signal	VISIBLEN:std_logic;
begin
	HSYNCN<=	'0' when (HUCOUNT<HFP) else
				'1' when (HUCOUNT<(HFP+HSY)) else
				'0';
	VSYNCN<=	'0' when (VCOUNT<VFP) else
				'1' when (VCOUNT<(VFP+VSY)) else
				'0';
	VISIBLEN<=	'0' when VCOUNT<VIV else
					'0' when HUCOUNT<HIV else
					'1';
	VRTC		<=	'1' when VCOUNT<VIV else '0';
	HRTC		<=	'1' when HUCOUNT<HIV else '0';
	
	process	(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				HSYNCB(6 downto 0)<=(others=>'0');
				VSYNCB(6 downto 0)<=(others=>'0');
				VISIBLEB(6 downto 0)<=(others=>'0');
				HSYNC<='0';
				VSYNC<='0';
				VISIBLE<='0';
			elsif(ce = '1')then
				HSYNC<=HSYNCB(0);
				VSYNC<=VSYNCB(0);
				VISIBLE<=VISIBLEB(0);
				VSYNCB(7 downto 0)<=VSYNCN & VSYNCB(7 downto 1);
				HSYNCB(7 downto 0)<=HSYNCN & HSYNCB(7 downto 1);
				VISIBLEB(7 downto 0)<=VISIBLEN & VISIBLEB(7 downto 1);
			end if;
		end if;
	end process;
end MAIN;



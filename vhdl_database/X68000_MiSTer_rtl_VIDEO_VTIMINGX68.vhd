library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity VTIMINGX68 is
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
	VCOUNT	:out integer range 0 to VWIDTH-1;
	HUCOUNT	:out integer range 0 to (HWIDTH/DOTPU)-1;
	UCOUNT	:out integer range 0 to DOTPU-1;
	
	HCOMP	:out std_logic;
	VCOMP	:out std_logic;
	
	clk2	:out std_logic;
	
	clk		:in std_logic;
	rstn	:in std_logic
);
end VTIMINGX68;
architecture MAIN of VTIMINGX68 is
constant 	HUWIDTH :integer	:=HWIDTH/DOTPU;
constant 	HUVIS	:integer	:=HVIS/DOTPU;
constant 	HBP		:integer	:=HUWIDTH-HUVIS-HFP-HSY;
constant 	HIV		:integer	:=HFP+HSY+HBP;
constant 	VBP		:integer	:=VWIDTH-VVIS-VFP-VSY;
constant	VIV		:integer	:=VFP+VSY+VBP;

signal	vcounter	:integer range 0 to VWIDTH-1;
signal	hucounter	:integer range 0 to (HWIDTH/DOTPU)-1;
signal	ucounter	:integer range 0 to DOTPU-1;
signal	hcompb	:std_logic;
signal	vcompb	:std_logic;
signal	clk2sft	:std_logic_vector(1 downto 0);
signal	clk2b	:std_logic;

begin

	process(clk,rstn)begin
		if(rstn='0')then
			clk2sft<="01";
		elsif(clk' event and clk='1')then
			clk2sft<=clk2sft(0) & clk2sft(1);
		end if;
	end process;
	clk2<=clk2sft(1);
	clk2b<=clk2sft(1);

	process(clk2b,rstn)begin
		if(rstn='0')then
			vcounter<=VWIDTH-1;
			hucounter<=0;
			ucounter<=0;
			hcompb<='0';
			vcompb<='0';
		elsif(clk2b' event and clk2b='1')then
			hcompb<='0';
			vcompb<='0';
			if(ucounter=(DOTPU-1))then
				ucounter<=0;
				if(hucounter=((HWIDTH/DOTPU)-1))then
					hucounter<=0;
					hcompb<='1';
					if(vcounter=VWIDTH-1)then
						vcounter<=0;
						vcompb<='1';
					else 
						vcounter<=vcounter+1;
					end if;
				else
					hucounter<=hucounter+1;
				end if;
			else
				ucounter<=ucounter+1;
			end if;
		end if;
	end process;
	
	
	process(clk,rstn)begin
		if(rstn='0')then
			VCOUNT<=0;
			HUCOUNT<=0;
			UCOUNT<=0;
			VCOMP<='0';
			HCOMP<='0';
		elsif(clk' event and clk='1')then
			VCOUNT<=vcounter;
			HUCOUNT<=hucounter;
			UCOUNT<=ucounter;
			VCOMP<=vcompb;
			HCOMP<=hcompb;
		end if;
	end process;

end MAIN;
					
			
			
	
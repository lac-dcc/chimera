library ieee,work;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity iir is
generic(
	datwidth	:integer	:=32;
	fltwidth	:integer	:=16;
	shift		:integer	:=13;
	alpha		:integer	:=16
);
port(
	datin		:in std_logic_vector(datwidth-1 downto 0);
	wr			:in std_logic;
	fl_a1		:in std_logic_vector(fltwidth-1 downto 0);
	fl_a2		:in std_logic_vector(fltwidth-1 downto 0);
	fl_b0		:in std_logic_vector(fltwidth-1 downto 0);
	fl_b1		:in std_logic_vector(fltwidth-1 downto 0);
	fl_b2		:in std_logic_vector(fltwidth-1 downto 0);
	
	datout		:out std_logic_vector(datwidth-1 downto 0);
	
	monz1		:out std_logic_vector(datwidth+fltwidth+alpha downto 0);
	monz2		:out std_logic_vector(datwidth+fltwidth+alpha downto 0);
	monasum		:out std_logic_vector(datwidth+fltwidth+alpha downto 0);
	monbsum		:out std_logic_vector(datwidth+fltwidth+alpha downto 0);
	monin		:out std_logic_vector(datwidth+fltwidth+alpha downto 0);
	mona1		:out std_logic_vector(datwidth+fltwidth+alpha downto 0);
	mona2		:out std_logic_vector(datwidth+fltwidth+alpha downto 0);
	
	clk			:in std_logic;
	ce          :in std_logic := '1';
	rstn		:in std_logic
);
end iir;

architecture rtl of iir is
signal	asum	:std_logic_vector(datwidth+fltwidth+alpha downto 0);
signal	bsum	:std_logic_vector(datwidth+fltwidth+alpha downto 0);
signal	z1	:std_logic_vector(datwidth+fltwidth+alpha downto 0);
signal	z2	:std_logic_vector(datwidth+fltwidth+alpha downto 0);
signal	win	:std_logic_vector(datwidth+fltwidth+alpha downto 0);
signal xa1,xa2,xb1,xb2	:std_logic_vector(datwidth+fltwidth+fltwidth+alpha downto 0);
signal xa1d,xa2d,xb1d,xb2d	:std_logic_vector(datwidth+fltwidth+alpha downto 0);

begin
	win(datwidth+fltwidth+alpha downto datwidth+shift)<=(others=>datin(datwidth-1));
	win(datwidth+shift-1 downto shift)<=datin;
	win(shift-1 downto 0)<=(others=>'0');
	monin<=win;
	xa1<=z1*fl_a1;
	xa1d<=xa1(datwidth+fltwidth+shift+alpha downto shift);
	mona1<=xa1d;
	xa2<=z2*fl_a2;
	xa2d<=xa2(datwidth+fltwidth+shift+alpha downto shift);
	mona2<=xa2d;
	xb1<=z1*fl_b1;
	xb1d<=xb1(datwidth+fltwidth+shift+alpha downto shift);
	xb2<=z2*fl_b2;
	xb2d<=xb2(datwidth+fltwidth+shift+alpha downto shift);
	asum<=win+xa1d+xa2d;
	bsum<=(asum(datwidth+shift+alpha downto shift)*fl_b0)+xb1d+xb2d;
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				z1<=(others=>'0');
				z2<=(others=>'0');
			elsif(ce = '1')then
				if(wr='1')then
					z2<=z1;
					z1<=asum;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				datout<=(others=>'0');
			elsif(ce = '1')then
				datout<=bsum(datwidth+shift-1 downto shift);
			end if;
		end if;
	end process;
	monz1<=z1;
	monz2<=z2;
	monasum<=asum;
	monbsum<=bsum;

end rtl;

			


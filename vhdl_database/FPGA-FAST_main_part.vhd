----------------------------------------------------------------------------------
-- Company: Poznan Univ. of Technology
-- Engineer: Marek Kraft		
-- 
-- Create Date:    14:06:35 12/05/2007 
-- Design Name: FAST corner detector
-- Module Name:    main - Behavioral 
-- Project Name: 
-- Target Devices: S3
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fast_main is
generic (threshold :  signed:= to_signed(10, 10) );
port(
		in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15 : in std_logic_vector(7 downto 0);
		clk, rst, ce : in std_logic;
		center : in std_logic_vector(7 downto 0);
		o0b, o1b, o2b, o3b, o4b, o5b, o6b, o7b, o8b, o9b, o10b, o11b, o12b, o13b, o14b, o15b : out std_logic_vector(9 downto 0);
		o0d, o1d, o2d, o3d, o4d, o5d, o6d, o7d, o8d, o9d, o10d, o11d, o12d, o13d, o14d, o15d : out std_logic_vector(9 downto 0);
		--result : out std_logic_vector(9 downto 0);
		bright, dark : out std_logic_vector(15 downto 0)
	);
end fast_main;

architecture Behavioral of fast_main is

signal cmr0, cmr1, cmr2, cmr3, cmr4, cmr5, cmr6, cmr7, cmr8, cmr9, cmr10, cmr11, cmr12, cmr13, cmr14, cmr15 : signed (9 downto 0); --center minus ring
signal rmc0, rmc1, rmc2, rmc3, rmc4, rmc5, rmc6, rmc7, rmc8, rmc9, rmc10, rmc11, rmc12, rmc13, rmc14, rmc15 : signed (9 downto 0); --ring minus center

signal cmr0t, cmr1t, cmr2t, cmr3t, cmr4t, cmr5t, cmr6t, cmr7t, cmr8t, cmr9t, cmr10t, cmr11t, cmr12t, cmr13t, cmr14t, cmr15t : signed (9 downto 0); 
signal rmc0t, rmc1t, rmc2t, rmc3t, rmc4t, rmc5t, rmc6t, rmc7t, rmc8t, rmc9t, rmc10t, rmc11t, rmc12t, rmc13t, rmc14t, rmc15t : signed (9 downto 0); 

begin

cmr : process(clk)
begin
	if clk'event and clk='1' then
		if rst='1' then
			cmr0<=(others=>'0');		cmr1<=(others=>'0');		cmr2<=(others=>'0');		cmr3<=(others=>'0');	
			cmr4<=(others=>'0');		cmr5<=(others=>'0');		cmr6<=(others=>'0');		cmr7<=(others=>'0');	
			cmr8<=(others=>'0');		cmr9<=(others=>'0');		cmr10<=(others=>'0');	cmr11<=(others=>'0');	
			cmr12<=(others=>'0');	cmr13<=(others=>'0');	cmr14<=(others=>'0');	cmr15<=(others=>'0');	
		elsif ce='1' then
			cmr0 <= signed( "00" & center ) - signed( "00" & in0 ); -- center minus ring - dark
			cmr1 <= signed( "00" & center ) - signed( "00" & in1 );
			cmr2 <= signed( "00" & center ) - signed( "00" & in2 );
			cmr3 <= signed( "00" & center ) - signed( "00" & in3 );
			cmr4 <= signed( "00" & center ) - signed( "00" & in4 );
			cmr5 <= signed( "00" & center ) - signed( "00" & in5 );
			cmr6 <= signed( "00" & center ) - signed( "00" & in6 );
			cmr7 <= signed( "00" & center ) - signed( "00" & in7 );
			cmr8 <= signed( "00" & center ) - signed( "00" & in8 );
			cmr9 <= signed( "00" & center ) - signed( "00" & in9 );
			cmr10 <= signed( "00" & center ) - signed( "00" & in10 );
			cmr11 <= signed( "00" & center ) - signed( "00" & in11 );
			cmr12 <= signed( "00" & center ) - signed( "00" & in12 );
			cmr13 <= signed( "00" & center ) - signed( "00" & in13 );
			cmr14 <= signed( "00" & center ) - signed( "00" & in14 );
			cmr15 <= signed( "00" & center ) - signed( "00" & in15 );
		end if;
	end if;
end process cmr;

rmc : process(clk)
begin
	if clk'event and clk='1' then
		if rst='1' then
			rmc0<=(others=>'0');		rmc1<=(others=>'0');		rmc2<=(others=>'0');		rmc3<=(others=>'0');	
			rmc4<=(others=>'0');		rmc5<=(others=>'0');		rmc6<=(others=>'0');		rmc7<=(others=>'0');	
			rmc8<=(others=>'0');		rmc9<=(others=>'0');		rmc10<=(others=>'0');	rmc11<=(others=>'0');	
			rmc12<=(others=>'0');	rmc13<=(others=>'0');	rmc14<=(others=>'0');	rmc15<=(others=>'0');	
		elsif ce='1' then
			rmc0 <= signed( "00" & in0 ) - signed( "00" & center ); -- ring minus center - bright
			rmc1 <= signed( "00" & in1 ) - signed( "00" & center );
			rmc2 <= signed( "00" & in2 ) - signed( "00" & center );
			rmc3 <= signed( "00" & in3 ) - signed( "00" & center );
			rmc4 <= signed( "00" & in4 ) - signed( "00" & center );
			rmc5 <= signed( "00" & in5 ) - signed( "00" & center );
			rmc6 <= signed( "00" & in6 ) - signed( "00" & center );
			rmc7 <= signed( "00" & in7 ) - signed( "00" & center );
			rmc8 <= signed( "00" & in8 ) - signed( "00" & center );
			rmc9 <= signed( "00" & in9 ) - signed( "00" & center );
			rmc10 <= signed( "00" & in10 ) - signed( "00" & center );
			rmc11 <= signed( "00" & in11 ) - signed( "00" & center );
			rmc12 <= signed( "00" & in12 ) - signed( "00" & center );
			rmc13 <= signed( "00" & in13 ) - signed( "00" & center );
			rmc14 <= signed( "00" & in14 ) - signed( "00" & center );
			rmc15 <= signed( "00" & in15 ) - signed( "00" & center );
		end if;
	end if;
end process rmc;

cmrt : process(clk)
begin
	if clk='1' and clk'event then -- dark minus threshold
		if rst='1' then
			cmr0t<=(others=>'0');	cmr1t<=(others=>'0');	cmr2t<=(others=>'0');	cmr3t<=(others=>'0');	
			cmr4t<=(others=>'0');	cmr5t<=(others=>'0');	cmr6t<=(others=>'0');	cmr7t<=(others=>'0');	
			cmr8t<=(others=>'0');	cmr9t<=(others=>'0');	cmr10t<=(others=>'0');	cmr11t<=(others=>'0');	
			cmr12t<=(others=>'0');	cmr13t<=(others=>'0');	cmr14t<=(others=>'0');	cmr15t<=(others=>'0');	
		elsif ce='1' then
			cmr0t <= cmr0 - threshold;
			cmr1t <= cmr1 - threshold;
			cmr2t <= cmr2 - threshold;
			cmr3t <= cmr3 - threshold;
			cmr4t <= cmr4 - threshold;
			cmr5t <= cmr5 - threshold;
			cmr6t <= cmr6 - threshold;
			cmr7t <= cmr7 - threshold;
			cmr8t <= cmr8 - threshold;
			cmr9t <= cmr9 - threshold;
			cmr10t <= cmr10 - threshold;
			cmr11t <= cmr11 - threshold;
			cmr12t <= cmr12 - threshold;
			cmr13t <= cmr13 - threshold;
			cmr14t <= cmr14 - threshold;
			cmr15t <= cmr15 - threshold;
		end if;
	end if;
end process cmrt;

rmct : process(clk)
begin
	if clk='1' and clk'event then  --  bright minus threshold
		if rst='1' then
			rmc0t<=(others=>'0');	rmc1t<=(others=>'0');	rmc2t<=(others=>'0');	rmc3t<=(others=>'0');	
			rmc4t<=(others=>'0');	rmc5t<=(others=>'0');	rmc6t<=(others=>'0');	rmc7t<=(others=>'0');	
			rmc8t<=(others=>'0');	rmc9t<=(others=>'0');	rmc10t<=(others=>'0');	rmc11t<=(others=>'0');	
			rmc12t<=(others=>'0');	rmc13t<=(others=>'0');	rmc14t<=(others=>'0');	rmc15t<=(others=>'0');	
		elsif ce='1' then
			rmc0t <= rmc0 - threshold;
			rmc1t <= rmc1 - threshold;
			rmc2t <= rmc2 - threshold;
			rmc3t <= rmc3 - threshold;
			rmc4t <= rmc4 - threshold;
			rmc5t <= rmc5 - threshold;
			rmc6t <= rmc6 - threshold;
			rmc7t <= rmc7 - threshold;
			rmc8t <= rmc8 - threshold;
			rmc9t <= rmc9 - threshold;
			rmc10t <= rmc10 - threshold;
			rmc11t <= rmc11 - threshold;
			rmc12t <= rmc12 - threshold;
			rmc13t <= rmc13 - threshold;
			rmc14t <= rmc14 - threshold;
			rmc15t <= rmc15 - threshold;
		end if;
	end if;
end process rmct;

is_dark : process(clk)
begin
	if clk='1' and clk'event then -- final dark check and eventual passing of value for nms calculation
		if rst='1' then
			o0d<=(others=>'0');		o1d<=(others=>'0');		o2d<=(others=>'0');		o3d<=(others=>'0');	
			o4d<=(others=>'0');		o5d<=(others=>'0');		o6d<=(others=>'0');		o7d<=(others=>'0');	
			o8d<=(others=>'0');		o9d<=(others=>'0');		o10d<=(others=>'0');		o11d<=(others=>'0');	
			o12d<=(others=>'0');		o13d<=(others=>'0');		o14d<=(others=>'0');		o15d<=(others=>'0');	
			dark <= (others => '0');
		elsif ce='1' then
			if cmr0t>0 then 
				dark(0)<='1';
				o0d<=std_logic_vector(cmr0t);
			else
				dark(0)<='0';
				o0d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr1t>0 then
				dark(1)<='1';
				o1d<=std_logic_vector(cmr1t);
			else
				dark(1)<='0';
				o1d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr2t>0 then
				dark(2)<='1';
				o2d<=std_logic_vector(cmr2t);
			else
				dark(2)<='0';
				o2d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr3t>0 then
				dark(3)<='1';
				o3d<=std_logic_vector(cmr3t);
			else
				dark(3)<='0';
				o3d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr4t>0 then
				dark(4)<='1';
				o4d<=std_logic_vector(cmr4t);
			else
				dark(4)<='0';
				o4d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr5t>0 then
				dark(5)<='1';
				o5d<=std_logic_vector(cmr5t);
			else
				dark(5)<='0';
				o5d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr6t>0 then
				dark(6)<='1';
				o6d<=std_logic_vector(cmr6t);
			else
				dark(6)<='0';
				o6d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr7t>0 then
				dark(7)<='1';
				o7d<=std_logic_vector(cmr7t);
			else
				dark(7)<='0';
				o7d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr8t>0 then
				dark(8)<='1';
				o8d<=std_logic_vector(cmr8t);
			else
				dark(8)<='0';
				o8d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr9t>0 then
				dark(9)<='1';
				o9d<=std_logic_vector(cmr9t);
			else
				dark(9)<='0';
				o9d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr10t>0 then
				dark(10)<='1';
				o10d<=std_logic_vector(cmr10t);
			else
				dark(10)<='0';
				o10d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr11t>0 then
				dark(11)<='1';
				o11d<=std_logic_vector(cmr11t);
			else
				dark(11)<='0';
				o11d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr12t>0 then
				dark(12)<='1';
				o12d<=std_logic_vector(cmr12t);
			else
				dark(12)<='0';
				o12d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr13t>0 then
				dark(13)<='1';
				o13d<=std_logic_vector(cmr13t);
			else
				dark(13)<='0';
				o13d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr14t>0 then
				dark(14)<='1';
				o14d<=std_logic_vector(cmr14t);
			else
				dark(14)<='0';
				o14d<=std_logic_vector( to_signed(0, 10) );
			end if;
			if cmr15t>0 then
				dark(15)<='1';
				o15d<=std_logic_vector(cmr15t);
			else
				dark(15)<='0';
				o15d<=std_logic_vector( to_signed(0, 10) );
			end if;
		end if;
	end if;
end process is_dark;

is_bright : process(clk) -- final bright check and eventual passing of value for nms calculation
begin
	if clk='1' and clk'event then
		if rst='1' then
			o0b<=(others=>'0');		o1b<=(others=>'0');		o2b<=(others=>'0');		o3b<=(others=>'0');	
			o4b<=(others=>'0');		o5b<=(others=>'0');		o6b<=(others=>'0');		o7b<=(others=>'0');	
			o8b<=(others=>'0');		o9b<=(others=>'0');		o10b<=(others=>'0');		o11b<=(others=>'0');	
			o12b<=(others=>'0');		o13b<=(others=>'0');		o14b<=(others=>'0');		o15b<=(others=>'0');	
			bright <= (others => '0');
		elsif ce='1' then
			if rmc0t>0 then 
				bright(0)<='1';
				o0b<=std_logic_vector(rmc0t);
			else
				bright(0)<='0';
				o0b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc1t>0 then
				bright(1)<='1';
				o1b<=std_logic_vector(rmc1t);
			else
				bright(1)<='0';
				o1b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc2t>0 then
				bright(2)<='1';
				o2b<=std_logic_vector(rmc2t);
			else
				bright(2)<='0';
				o2b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc3t>0 then
				bright(3)<='1';
				o3b<=std_logic_vector(rmc3t);
			else
				bright(3)<='0';
				o3b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc4t>0 then
				bright(4)<='1';
				o4b<=std_logic_vector(rmc4t);
			else
				bright(4)<='0';
				o4b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc5t>0 then
				bright(5)<='1';
				o5b<=std_logic_vector(rmc5t);
			else
				bright(5)<='0';
				o5b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc6t>0 then
				bright(6)<='1';
				o6b<=std_logic_vector(rmc6t);
			else
				bright(6)<='0';
				o6b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc7t>0 then
				bright(7)<='1';
				o7b<=std_logic_vector(rmc7t);
			else
				bright(7)<='0';
				o7b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc8t>0 then
				bright(8)<='1';
				o8b<=std_logic_vector(rmc8t);
			else
				bright(8)<='0';
				o8b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc9t>0 then
				bright(9)<='1';
				o9b<=std_logic_vector(rmc9t);
			else
				bright(9)<='0';
				o9b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc10t>0 then
				bright(10)<='1';
				o10b<=std_logic_vector(rmc10t);
			else
				bright(10)<='0';
				o10b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc11t>0 then
				bright(11)<='1';
				o11b<=std_logic_vector(rmc11t);
			else
				bright(11)<='0';
				o11b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc12t>0 then
				bright(12)<='1';
				o12b<=std_logic_vector(rmc12t);
			else
				bright(12)<='0';
				o12b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc13t>0 then
				bright(13)<='1';
				o13b<=std_logic_vector(rmc13t);
			else
				bright(13)<='0';
				o13b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc14t>0 then
				bright(14)<='1';
				o14b<=std_logic_vector(rmc14t);
			else
				bright(14)<='0';
				o14b<=std_logic_vector( to_signed(0, 10) );
			end if;
			if rmc15t>0 then
				bright(15)<='1';
				o15b<=std_logic_vector(rmc15t);
			else
				bright(15)<='0';
				o15b<=std_logic_vector( to_signed(0, 10) );
			end if;
		end if;
	end if;
end process is_bright;


end Behavioral;


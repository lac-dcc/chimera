

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity ClockMultiplier6 is	
	port (
		-- reference clock
		CLK25: in std_logic;		
		-- atari pixel clock
		F0O: in std_logic;
		
		-- x4 times output clock
		CLK: out std_logic
	);	
end entity;


architecture immediate of ClockMultiplier6 is
	-- high-speed clock to generate synchronous clock from. this is done
	-- with 4 coupled signals that are 0,45,90,135 degree phase shifted to give
	-- 8 usable edges.
	signal CLK171A : std_logic;  
	signal CLK171B : std_logic;
	signal CLK171C : std_logic;
	signal CLK171D : std_logic;
	
   component PLL171 is
	PORT
	(
		inclk0 : IN STD_LOGIC ;
		c0		: OUT STD_LOGIC ;
		c1		: OUT STD_LOGIC ;
		c2		: OUT STD_LOGIC ;
		c3		: OUT STD_LOGIC 
	);
	end component;
		
begin		
	subdividerpll: PLL171 port map ( CLK25, CLK171A, CLK171B, CLK171C, CLK171D );
		
	process (F0O, CLK171A, CLK171B, CLK171C, CLK171D)
		-- having 8 versions of the circuit running slightly 
		-- time-shifted
		variable counter0 : integer range 0 to 63 := 0;
		variable counter1 : integer range 0 to 63 := 0;
		variable counter2 : integer range 0 to 63 := 0;
		variable counter3 : integer range 0 to 63 := 0;
		variable counter4 : integer range 0 to 63 := 0;
		variable counter5 : integer range 0 to 63 := 0;
		variable counter6 : integer range 0 to 63 := 0;
		variable counter7 : integer range 0 to 63 := 0;
		variable in0_clk : std_logic := '0'; 
		variable in1_clk : std_logic := '0'; 		
		variable in2_clk : std_logic := '0'; 		
		variable in3_clk : std_logic := '0'; 		
		variable in4_clk : std_logic := '0'; 
		variable in5_clk : std_logic := '0'; 		
		variable in6_clk : std_logic := '0'; 		
		variable in7_clk : std_logic := '0'; 		
		variable prev0_clk : std_logic := '0';
		variable prev1_clk : std_logic := '0';		
		variable prev2_clk : std_logic := '0';		
		variable prev3_clk : std_logic := '0';	
		variable prev4_clk : std_logic := '0';
		variable prev5_clk : std_logic := '0';		
		variable prev6_clk : std_logic := '0';		
		variable prev7_clk : std_logic := '0';	
			
		variable bits : std_logic_vector(3 downto 0);
		constant reset : integer := 2;
		constant stop : integer := reset+47;
	begin
	
		if rising_edge(CLK171A) then
			if in0_clk='1' and prev0_clk='0' then 
				counter0 := reset; 
			elsif counter0<stop then
				counter0 := counter0+1;
			end if;
			prev0_clk := in0_clk;
			in0_clk := F0O;  
		end if;
		if rising_edge(CLK171B) then
			if in1_clk='1' and prev1_clk='0' then 
				counter1 := reset; 
			elsif counter1<stop then
				counter1 := counter1+1;
			end if;
			prev1_clk := in1_clk;
			in1_clk := F0O;  
		end if;
		if rising_edge(CLK171C) then
			if in2_clk='1' and prev2_clk='0' then 
				counter2 := reset; 
			elsif counter2<stop then
				counter2 := counter2+1;
			end if;
			prev2_clk := in2_clk;
			in2_clk := F0O;  
		end if;
		if rising_edge(CLK171D) then
			if in3_clk='1' and prev3_clk='0' then 
				counter3 := reset; 
			elsif counter3<stop then
				counter3 := counter3+1;
			end if;
			prev3_clk := in3_clk;
			in3_clk := F0O;  
		end if;
		if falling_edge(CLK171A) then
			if in4_clk='1' and prev4_clk='0' then 
				counter4 := reset; 
			elsif counter4<stop then
				counter4 := counter4+1;
			end if;
			prev4_clk := in4_clk;
			in4_clk := F0O;  
		end if;
		if falling_edge(CLK171B) then
			if in5_clk='1' and prev5_clk='0' then 
				counter5 := reset; 
			elsif counter5<stop then
				counter5 := counter5+1;
			end if;
			prev5_clk := in5_clk;
			in5_clk := F0O;  
		end if;
		if falling_edge(CLK171C) then
			if in6_clk='1' and prev6_clk='0' then 
				counter6 := reset; 
			elsif counter6<stop then
				counter6 := counter6+1;
			end if;
			prev6_clk := in6_clk;
			in6_clk := F0O;  
		end if;
		if falling_edge(CLK171D) then
			if in7_clk='1' and prev7_clk='0' then 
				counter7 := reset; 
			elsif counter7<stop then
				counter7 := counter7+1;
			end if;
			prev7_clk := in7_clk;
			in7_clk := F0O;  
		end if;
		
      -- merge clock counters asynchronously
		bits:= std_logic_vector
		(	   to_unsigned(counter0,4) 
			or to_unsigned(counter1,4) 
		   or to_unsigned(counter2,4) 
			or to_unsigned(counter3,4)
			or to_unsigned(counter4,4) 
		   or to_unsigned(counter5,4) 
			or to_unsigned(counter6,4)
			or to_unsigned(counter7,4)
		);
		
		CLK <= bits(2);
	end process;
	
end immediate;


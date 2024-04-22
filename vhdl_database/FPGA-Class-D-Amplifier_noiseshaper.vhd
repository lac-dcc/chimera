----------------------------------------------------------------------------------
-- Engineer: github.com/YetAnotherElectronicsChannel
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity noiseshaper is
port (
    clk  : in std_logic;
    
    ns_in : in signed (31 downto 0);
    ns_valid_in  : in std_logic;
    
    ns_out : out signed(4 downto 0) := (others=>'0');
    ns_valid_out : out std_logic := '0';
    
    busy : out std_logic := '0';
	limit : out std_logic := '0';
	
    a1 : integer;
    a2 : integer;
    a3 : integer;
    a4 : integer;
    b1 : integer;
    b2 : integer;
    b3 : integer;
    b4 : integer;
    g1 : integer;
    g2 : integer

    );
end noiseshaper;


architecture Behavioral of noiseshaper is

--summing points after each node
signal x1 : signed(31 downto 0) := (others=>'0');
signal x2 : signed(31 downto 0) := (others=>'0');
signal x3 : signed(31 downto 0) := (others=>'0');
signal x4 : signed(31 downto 0) := (others=>'0');
signal x5 : signed(31 downto 0) := (others=>'0');

--delay registers for integrators
signal x1d : signed(31 downto 0) := (others=>'0');
signal x2d : signed(31 downto 0) := (others=>'0');
signal x3d : signed(31 downto 0) := (others=>'0');
signal x4d : signed(31 downto 0) := (others=>'0');
signal x5_24b : signed(23 downto 0) := (others=>'0');
signal state : integer := 0;

signal in_sample : signed(31 downto 0) := (others=>'0');

--multiplier signals
signal mul_inp_2 : signed(15 downto 0) := (others=>'0');
signal mul_inp_1 : signed(31 downto 0) := (others=>'0');
signal mul_result : signed(31 downto 0) := (others=>'0');

begin


process (mul_inp_1, mul_inp_2)
begin
	--multiply and do right-shift by 15 (fixed-point mult with 32-bit int and q1.15 value)
    mul_result <= resize(shift_right(mul_inp_1*mul_inp_2,15),32);
end process;



process (clk)
begin


if (rising_edge(clk)) then
   
   --start and calculate through the structure as shown in the block diagram in documentation-pdf file
	if (state = 0) then
		ns_valid_out <= '0';
		busy <= '0';
		if (ns_valid_in = '1') then
			in_sample <= ns_in;
			state <= 1;
			busy <= '1';
			
			mul_inp_1 <= ns_in;
		    mul_inp_2 <= to_signed(b1,16);
		end if;
		
										
	elsif (state = 1) then
		x1 <= mul_result;
		state <= 2;
		
		mul_inp_1 <= x5;
		mul_inp_2 <= to_signed(a1,16);


	elsif (state=2) then
		x1 <= x1 + mul_result;
		state <= 3;
		
		mul_inp_1 <= x2;
		mul_inp_2 <= to_signed(g1,16);		
		
	elsif (state=3) then
	
		x1 <= x1 + mul_result + x1d;
		mul_inp_1 <= in_sample;
		mul_inp_2 <= to_signed(b2,16);
		state <= 4;		
				
		
	elsif (state=4) then
		x2 <= mul_result;
		state <= 5;
		
		mul_inp_1 <= x5;
		mul_inp_2 <= to_signed(a2,16);			
		
		
	elsif (state = 5) then
		x2 <= x2 + mul_result + x2d +x1;
		state <= 6;
			
		mul_inp_1 <= in_sample;
		mul_inp_2 <= to_signed(b3,16);			
		

	elsif (state = 6) then
		x3 <= mul_result;
		state <= 7;
		
		mul_inp_1 <= x5;
		mul_inp_2 <= to_signed(a3,16);				
		
	elsif (state = 7) then
		x3 <= x3 + mul_result;
		state <= 8;
		
		mul_inp_1 <= x4;
		mul_inp_2 <= to_signed(g2,16);				
		

	elsif (state = 8) then
		x3 <= x3 + mul_result + x3d + x2;
		state <= 9;
		
		mul_inp_1 <= in_sample;
		mul_inp_2 <= to_signed(b4,16);				
			
		
	elsif (state = 9) then
		x4 <= mul_result;
		mul_inp_1 <= x5;
		mul_inp_2 <= to_signed(a4,16);	
		state <= 10;   
				 
	elsif (state = 10) then
		x4 <= x4 + mul_result + x4d + x3;
		state <= 11;
	elsif (state = 11) then
		x5 <= x4 + in_sample;
		state <= 12;
		
	
	--limit signal 
	elsif (state = 12) then
		if (x5 > to_signed(8388607,31)) then
			x5_24b <= to_signed(8388607,24);
			limit <= '1';
		elsif (x5 < to_signed(-8388607,31))then
			x5_24b <= to_signed(-8388607,24);
			limit <= '1';
		else
			x5_24b <= resize(x5,24);
		end if; 
		state <= 13;
		
	-- quantize signal to 5 bit (cut off lsb)
	elsif (state = 13) then
		 x5 <= x5(31 downto 19) & "0000000000000000000";          
		 ns_out <= x5_24b(23 downto 19);    
		 x1d <= x1;
		 x2d <= x2;
		 x3d <= x3;
		 x4d <= x4;  
		 ns_valid_out <= '1';
		 state <= 0;  
		 limit <= '0';
		 
	end if;
		
		

    
end if;
end process;

end Behavioral;
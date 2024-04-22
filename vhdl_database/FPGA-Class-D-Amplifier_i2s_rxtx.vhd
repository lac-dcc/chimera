----------------------------------------------------------------------------------
-- Engineer: github.com/YetAnotherElectronicsChannel
----------------------------------------------------------------------------------

--Warning: This design was implemented for clk = 4*bclk frequency. 
--Therefore the triggering of the bclk and lr edges might be confusing in the code below

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity i2s_rxtx is
port(
    clk : in std_logic;
    
    i2s_bclk : in std_logic;
    i2s_lr : in std_logic;
    i2s_din : in std_logic;
    i2s_dout : out std_logic := '0';
    
    out_l : out signed (23 downto 0) := (others=>'0');
    out_r : out signed (23 downto 0) := (others=>'0');
    
    in_l : in signed (23 downto 0);
    in_r : in signed (23 downto 0);
    
    sync : out std_logic := '0'
    );
end i2s_rxtx;

architecture Behavioral of i2s_rxtx is

signal in_shift : std_logic_vector (63 downto 0) := (others=>'0');
signal shift_out : std_logic_vector (63 downto 0) := (others=>'0');
signal bclk_edge : std_logic_vector (1 downto 0) := (others=>'0');
signal lr_edge : std_logic_vector (1 downto 0) := (others=>'0');
signal framesync : std_logic := '0';

begin

--frame syncing
process (clk)
begin 
if (rising_edge(clk)) then

	if (lr_edge = b"10") then
		framesync <= '1';
	elsif (bclk_edge = b"01") then
		framesync <= '0';
	end if;
    
end if;
end process;


--input shifting on rising edge
process (clk)
begin
if (rising_edge(clk)) then
    
	if (bclk_edge = b"10") then
		in_shift <= in_shift(62 downto 0) & i2s_din;
		
	   if (lr_edge = b"10") then                
	   
			out_l <= signed(in_shift(62 downto 39));
			out_r <= signed(in_shift(30 downto 7));
			sync <= '1';
		end if;      
		
	else
		sync <= '0';
	end if;
        
 
    
end if;
end process;



--output shifting on falling bclk edge
process (clk)
begin
if (rising_edge(clk)) then
    
	if (bclk_edge = b"01") then
	   i2s_dout <= shift_out(63);
		shift_out <= shift_out(62 downto 0)&b"0";  
	elsif (bclk_edge = b"00" and framesync='1') then
		shift_out <= std_logic_vector(in_l) & x"00" & std_logic_vector(in_r) & x"00";
				  
	end if;  
           
    
end if;
end process;

--latching bclk and lr edges
process (clk)
begin
if (rising_edge(clk)) then
    
	bclk_edge <= bclk_edge(0)&i2s_bclk;
	lr_edge <= lr_edge(0)&i2s_lr;     
    
end if;
end process;

end Behavioral;

LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
use IEEE.NUMERIC_STD.all;

ENTITY vga_testbench  IS 
END ; 

ARCHITECTURE testbench_arch OF vga_testbench IS
  SIGNAL n_reset   :  STD_LOGIC  ; 
  SIGNAL hSync   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL vSync   :  STD_LOGIC  ; 
  
  SIGNAL row : unsigned(9 downto 0);
  SIGNAL col : unsigned(9 downto 0);
  
  SIGNAL enable : std_LOGIC;
  
  COMPONENT vga_controller  
    PORT ( 
      n_reset  : in STD_LOGIC ; 
      hSync  : out STD_LOGIC ; 
      pixelClk  : in STD_LOGIC ; 
		disp_enable : out std_logic;
		column		: out unsigned(9 downto 0);
		row			: out unsigned(9 downto 0);
      vSync  : out STD_LOGIC ); 
  END COMPONENT ; 
  
  BEGIN
  DUT  : vga_controller  
    PORT MAP ( 
      n_reset   => n_reset  ,
      hSync   => hSync  ,
      pixelClk   => clk  ,
		disp_enable => enable,
		row => row,
		column => col,
      vSync   => vSync   ) ; 

-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ns, End Time = 1 us, Period = 20 ns
  Process
	Begin
	 clk  <= '0'  ;
	wait for 10 ns ;
-- 10 ns, single loop till start period.
-- this is 18ms (one frame is 13.8ms)
	for Z in 1 to 1800000
	loop
	    clk  <= '1'  ;
	   wait for 10 ns ;
	    clk  <= '0'  ;
	   wait for 10 ns ;
-- 990 ns, repeat pattern in loop.
	end  loop;
	 clk  <= '1'  ;
	wait for 10 ns ;
-- dumped values till 1 us
	wait;
 End Process;
 
 -- hold reset low for a few clocks to make sure the counters get reset
 Process
 Begin
	n_reset <= '0';
	wait for 100 ns;
	n_reset <= '1';
	wait;
 End Process;
 
END;
LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_arith.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY testbench  IS 
END ; 
 
ARCHITECTURE testbench_arch OF testbench IS
  SIGNAL Reset_n   :  STD_LOGIC  ; 
  SIGNAL hSync   :  STD_LOGIC  ; 
  SIGNAL videoB   :  std_logic_vector (1 downto 0)  ; 
  SIGNAL videoR   :  std_logic_vector (1 downto 0)  ; 
  SIGNAL videoG   :  std_logic_vector (1 downto 0)  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL vSync   :  STD_LOGIC  ; 

BEGIN
  DUT  : entity work.vt100  
    PORT MAP ( 
      Reset_n   => Reset_n  ,
      hSync   => hSync  ,
      videoB   => videoB  ,
      videoR   => videoR  ,
      videoG   => videoG  ,
		
		NMI_n	=> '1',
		
		RXD0	=> '0',
		CTS0	=> '0',
		DSR0	=> '0',
		RI0		=> '0',
		DCD0	=> '0',
		
      clk   => clk  ,
      vSync   => vSync   ) ; 



-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ns, End Time = 1 us, Period = 20 ns
  Process
	Begin
	 clk  <= '0'  ;
	wait for 10 ns ;
-- 10 ns, single loop till start period.
	for Z in 1 to 360000
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
	Reset_n <= '0';
	wait for 100 ns;
	Reset_n <= '1';
	wait;
 End Process;
 
END;

LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
use IEEE.NUMERIC_STD.all;

ENTITY vga_gfx_testbench  IS 
END ; 

ARCHITECTURE testbench_arch OF vga_gfx_testbench IS
  SIGNAL n_reset   :  STD_LOGIC  ; 
  SIGNAL hSync   :  STD_LOGIC  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL vSync   :  STD_LOGIC  ; 
  
  SIGNAL row : unsigned(9 downto 0);
  SIGNAL col : unsigned(9 downto 0);
  
  SIGNAL enable : std_LOGIC;
  
  SIGNAL row_start : std_logic;
  SIGNAL frame_start : std_logic;
  
	SIGNAL videoR		:  std_logic_vector(1 downto 0);
	SIGNAL videoG		:  std_logic_vector(1 downto 0);
	SIGNAL videoB		:  std_logic_vector(1 downto 0);	
	
	signal dispram_addr_b : std_logic_vector(10 downto 0) := "00000000000";
	signal dispram_output_b : std_logic_vector(15 downto 0);
  
  COMPONENT vga_controller  
    PORT ( 
      n_reset  : in STD_LOGIC ; 
      hSync  : out STD_LOGIC ; 
      pixelClk  : in STD_LOGIC ; 
		disp_enable : out std_logic;
		column		: out unsigned(9 downto 0);
		row			: out unsigned(9 downto 0);
		frame_start : out std_logic := '0';
		row_start   : out std_logic := '0';
      vSync  : out STD_LOGIC ); 
  END COMPONENT ; 
  
  BEGIN
  DUT  : vga_controller  
    PORT MAP ( 
      n_reset   => n_reset  ,
      hSync   => hSync  ,
      pixelClk   => clk  ,
		disp_enable => enable,
		row_start => row_start,
		frame_start => frame_start,
		row => row,
		column => col,
      vSync   => vSync   ) ; 

	vgagfx1: entity work.vga_textmode
		port map(
			n_reset => n_reset,
			pixelClk => clk,
			row => std_logic_vector(row),
			column => std_logic_vector(col),
			disp_enable => enable,
			row_start => row_start,
			frame_start => frame_start,
			display_mem_addr => dispram_addr_b,
			display_mem_data => dispram_output_b,
			videoR => videoR,
			videoG => videoG,
			videoB => videoB
		);
		
	displaymem: entity work.displayram
		port map (
			clock_a => clk,
			address_a => "000000000000",
			--q_a => "00000000",
			data_a => "00000000",
			
			clock_b => clk,
			address_b => dispram_addr_b,
			q_b => dispram_output_b,
			data_b => "0000000000000000"
		);
		
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
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_color_proc IS
END tb_color_proc;
 
ARCHITECTURE behavior OF tb_color_proc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT color_proc
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         proc_ctrl : IN  std_logic;
         new_frame_i : IN  std_logic;
         orig_pxl : IN  std_logic_vector(11 downto 0);
         orig_addr : OUT  std_logic_vector(15-1 downto 0);
         proc_we : OUT  std_logic;
         proc_pxl : OUT  std_logic_vector(11 downto 0);
         proc_addr : OUT  std_logic_vector(15-1 downto 0);
         new_frame_proc_o : OUT  std_logic;
         colorpxls_bin0 : OUT  std_logic_vector(11-1 downto 0);
         colorpxls_bin1 : OUT  std_logic_vector(11-1 downto 0);
         colorpxls_bin2 : OUT  std_logic_vector(11-1 downto 0);
         colorpxls_bin3 : OUT  std_logic_vector(11-1 downto 0);
         colorpxls_bin4 : OUT  std_logic_vector(11-1 downto 0);
         colorpxls_bin5 : OUT  std_logic_vector(11-1 downto 0);
         colorpxls_bin6 : OUT  std_logic_vector(11-1 downto 0);
         colorpxls_bin7 : OUT  std_logic_vector(11-1 downto 0);
         colorpxls_o : OUT  std_logic_vector(14-1 downto 0);
         colorpxls_left_o : OUT  std_logic_vector(14-2 downto 0);
         colorpxls_rght_o : OUT  std_logic_vector(14-2 downto 0);
         colorpxls_bin012_o : OUT  std_logic_vector(14-2 downto 0);
         colorpxls_bin567_o : OUT  std_logic_vector(14-2 downto 0);
         colorpxls_bin01_o : OUT  std_logic_vector(14-2 downto 0);
         colorpxls_bin67_o : OUT  std_logic_vector(14-2 downto 0);
         rgbfilter : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal proc_ctrl : std_logic := '0';
   signal new_frame_i : std_logic := '0';
   signal orig_pxl : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal orig_addr : std_logic_vector(15-1 downto 0);
   signal proc_we : std_logic;
   signal proc_pxl : std_logic_vector(11 downto 0);
   signal proc_addr : std_logic_vector(15-1 downto 0);
   signal new_frame_proc_o : std_logic;
   signal colorpxls_bin0 : std_logic_vector(11-1 downto 0);
   signal colorpxls_bin1 : std_logic_vector(11-1 downto 0);
   signal colorpxls_bin2 : std_logic_vector(11-1 downto 0);
   signal colorpxls_bin3 : std_logic_vector(11-1 downto 0);
   signal colorpxls_bin4 : std_logic_vector(11-1 downto 0);
   signal colorpxls_bin5 : std_logic_vector(11-1 downto 0);
   signal colorpxls_bin6 : std_logic_vector(11-1 downto 0);
   signal colorpxls_bin7 : std_logic_vector(11-1 downto 0);
   signal colorpxls_o : std_logic_vector(14-1 downto 0);
   signal colorpxls_left_o : std_logic_vector(14-2 downto 0);
   signal colorpxls_rght_o : std_logic_vector(14-2 downto 0);
   signal colorpxls_bin012_o : std_logic_vector(14-2 downto 0);
   signal colorpxls_bin567_o : std_logic_vector(14-2 downto 0);
   signal colorpxls_bin01_o : std_logic_vector(14-2 downto 0);
   signal colorpxls_bin67_o : std_logic_vector(14-2 downto 0);
   signal rgbfilter : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns; -- 50MHz clock
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: color_proc PORT MAP (
          rst => rst,
          clk => clk,
          proc_ctrl => proc_ctrl,
          new_frame_i => new_frame_i,
          orig_pxl => orig_pxl,
          orig_addr => orig_addr,
          proc_we => proc_we,
          proc_pxl => proc_pxl,
          proc_addr => proc_addr,
          new_frame_proc_o => new_frame_proc_o,
          colorpxls_bin0 => colorpxls_bin0,
          colorpxls_bin1 => colorpxls_bin1,
          colorpxls_bin2 => colorpxls_bin2,
          colorpxls_bin3 => colorpxls_bin3,
          colorpxls_bin4 => colorpxls_bin4,
          colorpxls_bin5 => colorpxls_bin5,
          colorpxls_bin6 => colorpxls_bin6,
          colorpxls_bin7 => colorpxls_bin7,
          colorpxls_o => colorpxls_o,
          colorpxls_left_o => colorpxls_left_o,
          colorpxls_rght_o => colorpxls_rght_o,
          colorpxls_bin012_o => colorpxls_bin012_o,
          colorpxls_bin567_o => colorpxls_bin567_o,
          colorpxls_bin01_o => colorpxls_bin01_o,
          colorpxls_bin67_o => colorpxls_bin67_o,
          rgbfilter => rgbfilter
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 
 
   -- reset process
   rst_proc: process
   begin		
      rst <= '1';
      wait for 95 ns;	
      rst <= '0';
      wait;
   end process;

   -- frame buffer process, just to know in which pixel we are
   framebuffer_proc: process (clk)
   begin		
     if rising_edge(clk) then
       orig_pxl <= orig_addr(11 downto 0);
     end if;
   end process;

   -- new frame
   newframe_proc: process
   begin		
     new_frame_i <= '0';
     wait for 66 ms; -- around 15 frames per second
     wait until clk'event and clk='1';
     new_frame_i <= '1';
     wait until clk'event and clk='1';
     new_frame_i <= '0';
   end process;

   -- proc control, to change the color
   p_color_proc: process
   begin		
      proc_ctrl <= '0';
      wait for 205 ns;	
      proc_ctrl <= '1';  -- first: change to red
      wait for 500 ns;	
      proc_ctrl <= '0';
      wait for 10 us;	
      proc_ctrl <= '1';  -- 2nd: change to green
      wait for 500 ns;	
      proc_ctrl <= '0';
      wait for 10 us;	
      proc_ctrl <= '1';  -- 3rd: change to blue
      wait for 500 ns;	
      proc_ctrl <= '0';
      wait for 10 us;	
      proc_ctrl <= '1';  -- 4th: change to red & green
      wait for 500 ns;	
      proc_ctrl <= '0';
      wait for 10 us;	
      proc_ctrl <= '1';  -- 5th: change to red & blue
      wait for 500 ns;	
      proc_ctrl <= '0';
      wait for 10 us;	
      proc_ctrl <= '1';  -- 6th: change to green & blue
      wait for 500 ns;	
      proc_ctrl <= '0';
      wait for 10 us;	
      proc_ctrl <= '1';  -- 7th: change to red & green & blue
      wait for 500 ns;	
      proc_ctrl <= '0';
      wait for 10 us;	
      proc_ctrl <= '1';  -- 8th: change to no filter
      wait for 500 ns;	
      proc_ctrl <= '0';
      wait for 10 us;	
      -----
      proc_ctrl <= '1';  -- back to change to red
      wait for 500 ns;	
      proc_ctrl <= '0';
      wait for 10 us;	
      wait;
   end process;
   


END;

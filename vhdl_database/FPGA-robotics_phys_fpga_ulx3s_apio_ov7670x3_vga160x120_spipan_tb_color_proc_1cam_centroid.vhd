------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--
-- VHDL Test Bench Created by ISE for module: color_proc_1cam
-- 
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
--USE ieee.numeric_std.ALL;
 
ENTITY tb_color_proc_1cam_centr IS
END tb_color_proc_1cam_centr;
 
ARCHITECTURE behavior OF tb_color_proc_1cam_centr IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT color_proc_1cam_centr
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         proc_ctrl : IN  std_logic;
         new_frame : IN  std_logic;
         orig_pxl : IN  std_logic_vector(11 downto 0);
         orig_addr : OUT  std_logic_vector(15-1 downto 0);
         proc_we : OUT  std_logic;
         proc_pxl : OUT  std_logic_vector(11 downto 0);
         proc_addr : OUT  std_logic_vector(15-1 downto 0);
         centroid : OUT  std_logic_vector(7 downto 0);
         new_centroid : OUT  std_logic;
         proximity : OUT  std_logic_vector(2 downto 0);
         rgbfilter : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal proc_ctrl : std_logic := '0';
   signal new_frame : std_logic := '0';
   signal orig_pxl : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal orig_addr : std_logic_vector(15-1 downto 0);
   signal proc_we : std_logic;
   signal proc_pxl : std_logic_vector(11 downto 0);
   signal proc_addr : std_logic_vector(15-1 downto 0);
   signal centroid : std_logic_vector(7 downto 0);
   signal new_centroid : std_logic;
   signal proximity : std_logic_vector(2 downto 0);
   signal rgbfilter : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns; -- 50MHz clock
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: color_proc_1cam_centr PORT MAP (
          rst => rst,
          clk => clk,
          proc_ctrl => proc_ctrl,
          new_frame => new_frame,
          orig_pxl => orig_pxl,
          orig_addr => orig_addr,
          proc_we => proc_we,
          proc_pxl => proc_pxl,
          proc_addr => proc_addr,
          centroid => centroid,
          new_centroid => new_centroid,
          proximity => proximity,
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
     new_frame <= '0';
     wait for 66 ms; -- around 15 frames per second
     wait until clk'event and clk='1';
     new_frame <= '1';
     wait until clk'event and clk='1';
     new_frame <= '0';
   end process;

   -- proc control, to change the color
   color_proc: process
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
      wait;
   end process;


END;

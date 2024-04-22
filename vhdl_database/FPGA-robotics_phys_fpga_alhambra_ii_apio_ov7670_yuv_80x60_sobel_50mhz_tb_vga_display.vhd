
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_vga_display IS
END tb_vga_display;
 
ARCHITECTURE behavior OF tb_vga_display IS 

    COMPONENT vga_sync
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         visible : out  std_logic;
         new_pxl : out  std_logic;
         hsync : out  std_logic;
         vsync : out  std_logic;
         col : out  std_logic_vector(9 downto 0);
         row : out  std_logic_vector(9 downto 0)
        );
    END COMPONENT;    
 
    COMPONENT vga_display
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         visible : IN  std_logic;
         new_pxl : IN  std_logic;
         hsync : IN  std_logic;
         vsync : IN  std_logic;
         rgbmode : IN  std_logic;
         col : IN  std_logic_vector(9 downto 0);
         row : IN  std_logic_vector(9 downto 0);
         frame_pixel : IN  std_logic_vector(11 downto 0);
         frame_addr : OUT  std_logic_vector(12 downto 0);
         hsync_out : OUT  std_logic;
         vsync_out : OUT  std_logic;
         vga_red_out : OUT  std_logic_vector(3 downto 0);
         vga_green_out : OUT  std_logic_vector(3 downto 0);
         vga_blue_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;



   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal visible : std_logic;
   signal new_pxl : std_logic;
   signal rgbmode : std_logic := '0';
   signal col : std_logic_vector(9 downto 0);
   signal row : std_logic_vector(9 downto 0);
   signal frame_pixel : std_logic_vector(11 downto 0);
   signal frame_addr : std_logic_vector(12 downto 0);
   signal hsync_wr : std_logic;
   signal vsync_wr : std_logic;
   signal hsync_out : std_logic;
   signal vsync_out : std_logic;
   signal vga_red_out : std_logic_vector(3 downto 0);
   signal vga_green_out : std_logic_vector(3 downto 0);
   signal vga_blue_out : std_logic_vector(3 downto 0);


   -- Clock period definition
   constant clk_period : time := 20 ns;
 
BEGIN
 

   sync: vga_sync PORT MAP (
          rst => rst,
          clk => clk,
          visible => visible,
          new_pxl => new_pxl,
          hsync => hsync_wr,
          vsync => vsync_wr,
          col => col,
          row => row
        );

   disp: vga_display PORT MAP (
          rst => rst,
          clk => clk,
          visible => visible,
          new_pxl => new_pxl,
          hsync => hsync_wr,
          vsync => vsync_wr,
          rgbmode => rgbmode,
          col => col,
          row => row,
          frame_pixel => frame_pixel,
          frame_addr => frame_addr,
          hsync_out => hsync_out,
          vsync_out => vsync_out,
          vga_red_out => vga_red_out,
          vga_green_out => vga_green_out,
          vga_blue_out => vga_blue_out
        );


   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   -- rst process
   stim_proc: process
   begin		
      rst <= '1';
      wait for 103 ns;	
      rst <= '0';
      wait;
   end process;

   -- rst process
   mem_proc: process(clk)
   begin
	   if clk'event and clk='1' then
		  -- to see if it is synchronized
		  frame_pixel <= frame_addr(11 downto 0);
      end if;
   end process;


END;

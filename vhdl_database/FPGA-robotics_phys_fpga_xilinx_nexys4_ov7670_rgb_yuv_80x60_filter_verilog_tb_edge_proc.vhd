--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:31:51 10/01/2020
-- Design Name:   
-- Module Name:   F:/urjc/proyectos/jderobot/fpga-robot/Projects/ComputerVision/ov7670_xilinx/ov7670_rgb_yuv_80x60_filter/verilog/tb_edge_proc.vhd
-- Project Name:  ov7670_rgb_yuv_80x60_filter_vlg
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: edge_proc
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

--library work;
--use work.ov7670_pkg.all;
 
ENTITY tb_edge_proc IS
END tb_edge_proc;
 
ARCHITECTURE behavior OF tb_edge_proc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT edge_proc
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         edgefilter : IN  std_logic_vector(1 downto 0);
         orig_pxl : IN  std_logic_vector(11 downto 0);
         orig_addr : OUT  std_logic_vector(12 downto 0);
         proc_we : OUT  std_logic;
         proc_pxl : OUT  std_logic_vector(7 downto 0);
         proc_addr : OUT  std_logic_vector(12 downto 0)
        );
    END COMPONENT;
  
  -- QQVGA2
  constant c_cols_qqvga2 : natural := 80;
  constant c_rows_qqvga2 : natural := 60;

  constant c_img_cols : natural := c_cols_qqvga2;
  constant c_img_rows : natural := c_rows_qqvga2;
  constant c_img_pxls : natural := c_img_cols * c_img_rows;

  -- number of bits to count the rows of a image
  --constant c_nb_rows : natural := log2i(c_img_rows-1) + 1;
  constant c_nb_rows : natural := 6;
  -- number of bits necessary to represent c_img_pxls in binary
  constant c_nb_line_pxls : natural := 7; -- log2i(c_img_cols-1) + 1;
  --constant c_nb_img_pxls : natural := log2i(c_img_pxls-1) + 1;
  constant c_nb_img_pxls : natural :=  13; --80*60=4800 -> 2^13 
  

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal edgefilter : std_logic_vector(1 downto 0) := (others => '0');
   signal cntedgefilter : unsigned(2 downto 0) := (others => '0');
   signal orig_pxl : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal tb_addr : unsigned(12 downto 0);
   signal orig_addr : std_logic_vector(12 downto 0);
   signal proc_we : std_logic;
   signal proc_pxl : std_logic_vector(7 downto 0);
   signal proc_addr : std_logic_vector(12 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;


  -- row and col number to avoid making divisions and multiplications
  signal tb_rownum : unsigned(c_nb_rows-1 downto 0);
  signal tb_colnum : unsigned(c_nb_line_pxls-1 downto 0);
 
BEGIN

 
	-- Instantiate the Unit Under Test (UUT)
   uut: edge_proc PORT MAP (
          rst => rst,
          clk => clk,
          edgefilter => edgefilter,
          orig_pxl => orig_pxl,
          orig_addr => orig_addr,
          proc_we => proc_we,
          proc_pxl => proc_pxl,
          proc_addr => proc_addr
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 


   -- reset process definitions
   rst_process :process
   begin
	rst <= '1';
	wait for 53 ns;
	rst <= '0';
	wait;
   end process;

   --tb_colnum <= tb_addr mod c_img_cols;
   --tb_rownum <= tb_addr / c_img_cols;

   edgefilter <= std_logic_vector(cntedgefilter(2 downto 1));

   -- processing
   proc: process (rst, clk)
   begin
     if rst = '1' then
        tb_addr <= (others=>'0');
        cntedgefilter <= "000";
        tb_colnum <= (others=>'0');
        tb_rownum <= (others=>'0');
     elsif clk'event and clk='1' then
       tb_addr <= unsigned(orig_addr);
       if unsigned(orig_addr) = c_img_pxls -1 then -- change the processing when finish image
          if cntedgefilter = "101" then
            cntedgefilter <= "000";
          else
            cntedgefilter<= cntedgefilter + 1;
          end if;
          tb_colnum <= (others=>'0');
          tb_rownum <= (others=>'0');
       elsif tb_colnum = c_img_cols-1 then
         tb_colnum <= (others=>'0');
         tb_rownum <= tb_rownum + 1;
       else
         tb_colnum <= tb_colnum + 1;
       end if;
     end if;
   end process;

   -- Stimulus process
   stim_proc: process (clk,rst)
   begin
   if rst = '1' then
     orig_pxl <=(others =>'0');
   elsif clk'event and clk='1' then
     if tb_rownum < (c_img_rows / 4) then --First quarter vertical lines
       orig_pxl <= orig_addr(11 downto 0);
     elsif tb_rownum < (3*c_img_rows / 4) then--2nd quarter to 3rd horizontal lines
       if (tb_rownum(3) = '0') then -- horizontal lines each 8 
         orig_pxl <= (others=> '0');
       else
         orig_pxl <= (others=> '1');
       end if;
     else
       if (tb_colnum(3) = '0') then -- vertical lines each 8 
         orig_pxl <= (others=> '0');
       else
         orig_pxl <= (others=> '1');
       end if;
     end if;
     end if;
   end process;


   -- Stimulus process
--   stim_proc: process (clk,rst)
--   begin
--   if rst = '1' then
--     orig_pxl <=(others =>'0');
--   elsif clk'event and clk='1' then
--     if tb_rownum < (c_img_rows / 4) then --First quarter vertical lines
--       if (tb_colnum(3) = '0') then -- vertical lines each 8 
--         orig_pxl <= (others=> '0');
--       else
--         orig_pxl <= (others=> '1');
--       end if;
--     elsif tb_rownum < (3*c_img_rows / 4) then--2nd quarter to 3rd horizontal lines
--       if (tb_rownum(3) = '0') then -- horizontal lines each 8 
--         orig_pxl <= (others=> '0');
--       else
--         orig_pxl <= (others=> '1');
--       end if;
--     else
--       orig_pxl <= orig_addr(11 downto 0);
--     end if;
--     end if;
--   end process;

END;

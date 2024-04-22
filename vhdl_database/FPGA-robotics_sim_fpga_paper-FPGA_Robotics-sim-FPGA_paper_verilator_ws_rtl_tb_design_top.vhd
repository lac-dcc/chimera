LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_design_top IS
END tb_design_top;
 
ARCHITECTURE behavior OF tb_design_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT design_top
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         wea : IN  std_logic;
         addrin : IN  std_logic_vector(15-1 downto 0);
         datain : IN  std_logic_vector(11 downto 0);
         addrout : IN  std_logic_vector(15-1 downto 0);
         wRgbfilter : IN  std_logic_vector(2 downto 0);
         -- pulse 1 clk, when a frame has been sent 
         capture_newframe : in std_logic;
         dataout : OUT  std_logic_vector(11 downto 0);
         leds : OUT  std_logic_vector(7 downto 0);
         centroid_nop : OUT  std_logic_vector(7 downto 0);
         new_centroid : OUT  std_logic;
         proximity : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    
  constant  c_img_cols : natural := 160;
  constant  c_img_rows : natural := 120;
  constant  c_img_pxls : natural := c_img_cols * c_img_rows;
  -- $clog2(c_img_pxls), //160*120=19200 -> 2^15
  constant  c_nb_img_pxls :natural :=  15;
  constant  c_nb_img_cols :natural :=  8; -- 8 bits to count 160

  signal cnt_pxl : unsigned(c_nb_img_pxls-1 downto 0);
  signal cnt_col : unsigned(c_nb_img_cols-1 downto 0);
   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal wea : std_logic := '0';
   signal capture_newframe : std_logic := '0';
   signal addrin : std_logic_vector(15-1 downto 0) := (others => '0');
   signal datain : std_logic_vector(11 downto 0) := (others => '0');
   signal addrout : std_logic_vector(15-1 downto 0) := (others => '0');
   signal wRgbfilter : std_logic_vector(2 downto 0) := "100";

 	--Outputs
   signal dataout : std_logic_vector(11 downto 0);
   signal leds : std_logic_vector(7 downto 0);
   signal centroid_nop : std_logic_vector(7 downto 0);
   signal new_centroid : std_logic;
   signal proximity : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: design_top PORT MAP (
          clk => clk,
          rst => rst,
          wea => wea,
          addrin => addrin,
          datain => datain,
          addrout => addrout,
          wRgbfilter => wRgbfilter,
          capture_newframe => capture_newframe,
          dataout => dataout,
          leds => leds,
          centroid_nop => centroid_nop,
          new_centroid => new_centroid,
          proximity => proximity
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   rst_proc: process
   begin		
      rst <= '1';
      wait for 93 ns;	
      rst <= '0';
      wait;
   end process;

  pxl_proc: process
  begin
    cnt_pxl <= (others => '0');
    cnt_col <= (others => '0');
    capture_newframe <= '0';
    wea <= '0';
    wait until rst = '0';
    wait until clk'event and clk = '1';
    while true loop
      capture_newframe <= '0';
      wea <= '1';
      wait until clk'event and clk = '1';
      if cnt_col < c_img_cols-1 then
        cnt_col <= cnt_col + 1;
      else
        cnt_col <= (others => '0');
      end if;
 
      if cnt_pxl < c_img_pxls-1 then
        cnt_pxl <= cnt_pxl + 1;
      else
        cnt_pxl <= (others => '0');
        wait until clk'event and clk = '1';
        capture_newframe <= '1';
        wait until clk'event and clk = '1';
      end if;
    end loop;
  end process;

  addrin <= std_logic_vector(cnt_pxl);
  --datain <= std_logic_vector(cnt_pxl(11 downto 0));
  datain <= std_logic_vector(cnt_pxl(11 downto 0)) when cnt_col < c_img_cols/2
            else (others => '0');
  addrout <= std_logic_vector(cnt_pxl);
   
END;

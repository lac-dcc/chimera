----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2022 02:31:15 PM
-- Design Name: 
-- Module Name: sim_full_tx - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity sim_video_stream is Generic (	
        N_MIPI_LANES : integer := 2;
        SERDES_DATA_WIDTH : integer := 8;
        ADD_DEBUG_OVERLAY : integer := 0 --We don't add overlay on simulation
    );
--  Port ( );
end sim_video_stream;

architecture Behavioral of sim_video_stream is

COMPONENT fmc_mipi_top is     Generic (	
        N_MIPI_LANES : integer := N_MIPI_LANES;
        SERDES_DATA_WIDTH : integer := SERDES_DATA_WIDTH;
        ADD_DEBUG_OVERLAY : integer := ADD_DEBUG_OVERLAY
    );
   Port ( 
   sys_clk_p : in std_logic;  --AD12 SYSCLK_P
   sys_clk_n : in std_logic;  --AD11 SYSCLK_N
   sys_rst : in std_logic; -- AB7 use CPU_RESET button
     
   --start of V2 board, in the commments pinout for KC705 board, HPC connector
                                --FMC pin number, HPC name, KC705 FPGA pin
   i2c3_cam_clk : in std_logic; --H7, HPC_LA02_P; H24
   monitor_1p2v : in std_logic; --H8, HPC_LA02_N; H25
   
   i2c2_cam_clk : in std_logic;    --G9,  HPC_LA03_P; H26
   i2c3_cam_dat : inout std_logic; --G10, HPC_LA03_N; H27
   
   switch_data_lanes_vadj  : out std_logic; --G12, HPC_LA08_P; E29
   switch_clock_lanes_vadj : out std_logic; --G13, HPC_LA08_N; E30
   
   i2c_cam_dat : inout std_logic; --G24, HPC_LA22_P; C20
   i2c_cam_clk : inout std_logic;    --G25, HPC_LA22_N; B20
   
   monitor_1p8v : in std_logic; --G27, HPC_LA25_P; G17
   cam0_rst     : in std_logic; --G28, HPC_LA25_N; F17
   
   cam0_pwr     : in std_logic;  --G30, HPC_LA29_P; C17
   
   cam0_mclk    : in std_logic;  --G33, HPC_LA31_P; G22
   
   monitor_2p8v : in std_logic;  --D8, HPC_LA01_CC_P; D26                           
   monitor_3p3v : in std_logic;  --D9, HPC_LA01_CC_N; C26
   
   i2c2_cam_dat : inout std_logic; --D11, HPC_LA05_P; G29
   
   en_mipi_out_data_vadj  :  out std_logic := '0'; --D14, HPC_LA09_P; B30
   en_mipi_out_clock_vadj :  out std_logic := '0'; --D15, HPC_LA09_N; A30
   
   enn_jt_gpio_input : out std_logic := '1'; --D17, HPC_LA13_P; A25
   
   gpio17_out : out std_logic := '0'; --D26, HPC_LA26_P; B18
   gpio9_out  : out std_logic := '0'; --D27, HPC_LA26_N; A18
   
   --CSI related
   
    hs_c_d1_p  : out std_logic; --H10, HPC_LA04_P; G28
    hs_c_d1_n  : out std_logic; --H11, HPC_LA04_N; F28

    hs_c_d0_p  : out std_logic; --H13, HPC_LA07_P; E28
    hs_c_d0_n  : out std_logic; --H14, HPC_LA07_N; D28

    lp_c_d1_p  : out std_logic; --H16, HPC_LA11_P; G27
    lp_c_d1_n  : out std_logic; --H17, HPC_LA11_N; F27

    lp_c_d0_p  : out std_logic; --H19, HPC_LA15_P; C24
    lp_c_d0_n  : out std_logic; --H20, HPC_LA15_N; B24

    lp_c_clk_p : out std_logic; --H22, HPC_LA19_P; G18
    lp_c_clk_n : out std_logic; --H23, HPC_LA19_N; F18
 
    hs_d_d1_p  : out std_logic; --H31, HPC_LA28_P; D16
    hs_d_d1_n  : out std_logic; --H32, HPC_LA28_N; C16

    hs_d_d0_p  : out std_logic; --H34, HPC_LA30_P; D22
    hs_d_d0_n  : out std_logic; --H35, HPC_LA30_N; C22

    hs_d_clk_p : out std_logic; --H37, HPC_LA32_P; D21
    hs_d_clk_n : out std_logic; --H38, HPC_LA32_N; C21
   
   
    hs_c_clk_p : out std_logic; --G6, HPC_LA00_CC_P; C25
    hs_c_clk_n : out std_logic; --G7, HPC_LA00_CC_N; B25

    lp_d_d1_p  : out std_logic; --G15, HPC_LA12_P; C29
    lp_d_d1_n  : out std_logic; --G16, HPC_LA12_N; B29

    lp_d_d0_p  : out std_logic; --G18, HPC_LA16_P; B27
    lp_d_d0_n  : out std_logic; --G19, HPC_LA16_N; A27

    lp_d_clk_p : out std_logic; --G21, HPC_LA20_P; E19
    lp_d_clk_n : out std_logic; --G22, HPC_LA20_N; D19
     
   
   --debug IO              
   leds_debug : out std_logic_vector(7 downto 0) := (others => '1'); --debug
   dbg_io_1   : out std_logic; --G34,HPC_LA31_N; F22
   dbg_io_2   : out std_logic; --G37,HPC_LA33_N; H22
   dbg_io_3   : out std_logic; --G36,HPC_LA33_P; H21
   GPIO_SW_N  : in std_logic; -- AA12   up button
   GPIO_SW_E  : in std_logic; -- AG5    right button 
   GPIO_SW_S  : in std_logic; -- AB12   down button
   GPIO_SW_W  : in std_logic; -- AC6    left button
   GPIO_SW_C  : in std_logic  -- G12    Center button
   
   );
end COMPONENT;


--SIGNALS

   signal sys_clk_p :  std_logic;  --AD12 SYSCLK_P
   signal sys_clk_n :  std_logic;  --AD11 SYSCLK_N
   --signal rst :  std_logic; -- AB7 use CPU_RESET button
      
   --start of V2 board, in the commments pinout for KC705 board, HPC connector
                                --FMC pin number, HPC name, KC705 FPGA pin
   signal i2c3_cam_clk :  std_logic; --H7, HPC_LA02_P; H24
   signal monitor_1p2v :  std_logic; --H8, HPC_LA02_N; H25
   
   signal i2c2_cam_clk :  std_logic;    --G9,  HPC_LA03_P; H26
   signal i2c3_cam_dat :  std_logic; --G10, HPC_LA03_N; H27
   
   signal switch_data_lanes_vadj  :  std_logic; --G12, HPC_LA08_P; E29
   signal switch_clock_lanes_vadj :  std_logic; --G13, HPC_LA08_N; E30
   
   signal i2c_cam_dat :  std_logic; --G24, HPC_LA22_P; C20
   signal i2c_cam_clk :  std_logic;    --G25, HPC_LA22_N; B20
   
   signal monitor_1p8v :  std_logic; --G27, HPC_LA25_P; G17
   signal cam0_rst     :  std_logic; --G28, HPC_LA25_N; F17
   
   signal cam0_pwr     :  std_logic;  --G30, HPC_LA29_P; C17
   
   signal cam0_mclk    :  std_logic;  --G33, HPC_LA31_P; G22
   
   signal monitor_2p8v :  std_logic;  --D8, HPC_LA01_CC_P; D26                           
   signal monitor_3p3v :  std_logic;  --D9, HPC_LA01_CC_N; C26
   
   signal i2c2_cam_dat :  std_logic; --D11, HPC_LA05_P; G29
   
   signal en_mipi_out_data_vadj  :   std_logic := '0'; --D14, HPC_LA09_P; B30
   signal en_mipi_out_clock_vadj :   std_logic := '0'; --D15, HPC_LA09_N; A30
   
   signal enn_jt_gpio_input :  std_logic := '1'; --D17, HPC_LA13_P; A25
   
   signal gpio17_out :  std_logic := '0'; --D26, HPC_LA26_P; B18
   signal gpio9_out  :  std_logic := '0'; --D27, HPC_LA26_N; A18
   
   --CSI related
   
    signal hs_c_d1_p  :  std_logic; --H10, HPC_LA04_P; G28
    signal hs_c_d1_n  :  std_logic; --H11, HPC_LA04_N; F28

    signal hs_c_d0_p  :  std_logic; --H13, HPC_LA07_P; E28
    signal hs_c_d0_n  :  std_logic; --H14, HPC_LA07_N; D28

    signal lp_c_d1_p  :  std_logic; --H16, HPC_LA11_P; G27
    signal lp_c_d1_n  :  std_logic; --H17, HPC_LA11_N; F27

    signal lp_c_d0_p  :  std_logic; --H19, HPC_LA15_P; C24
    signal lp_c_d0_n  :  std_logic; --H20, HPC_LA15_N; B24

    signal lp_c_clk_p :  std_logic; --H22, HPC_LA19_P; G18
    signal lp_c_clk_n :  std_logic; --H23, HPC_LA19_N; F18
 
    signal hs_d_d1_p  :  std_logic; --H31, HPC_LA28_P; D16
    signal hs_d_d1_n  :  std_logic; --H32, HPC_LA28_N; C16

    signal hs_d_d0_p  :  std_logic; --H34, HPC_LA30_P; D22
    signal hs_d_d0_n  :  std_logic; --H35, HPC_LA30_N; C22

    signal hs_d_clk_p :  std_logic; --H37, HPC_LA32_P; D21
    signal hs_d_clk_n :  std_logic; --H38, HPC_LA32_N; C21
   
   
    signal hs_c_clk_p :  std_logic; --G6, HPC_LA00_CC_P; C25
    signal hs_c_clk_n :  std_logic; --G7, HPC_LA00_CC_N; B25

    signal lp_d_d1_p  :  std_logic; --G15, HPC_LA12_P; C29
    signal lp_d_d1_n  :  std_logic; --G16, HPC_LA12_N; B29

    signal lp_d_d0_p  :  std_logic; --G18, HPC_LA16_P; B27
    signal lp_d_d0_n  :  std_logic; --G19, HPC_LA16_N; A27

    signal lp_d_clk_p :  std_logic; --G21, HPC_LA20_P; E19
    signal lp_d_clk_n :  std_logic; --G22, HPC_LA20_N; D19
     
    signal leds_debug : std_logic_vector(7 downto 0) := (others => '1'); --debug
    signal dbg_io_1   : std_logic; --G34,HPC_LA31_N; F22
    signal dbg_io_2   : std_logic; --G37,HPC_LA33_N; H22
    signal dbg_io_3   : std_logic; --G36,HPC_LA33_P; H21   
    signal GPIO_SW_N  : std_logic; -- AA12   up button
    signal GPIO_SW_E  : std_logic; -- AG5    right button 
    signal GPIO_SW_S  : std_logic; -- AB12   down button
    signal GPIO_SW_W  : std_logic; -- AC6    left button
    signal GPIO_SW_C  : std_logic;  -- G12    Center button
   
--simulation
signal clk : std_logic;
signal pixel_clk : std_logic;
signal sys_rst,rx_rst : std_logic;
constant clk_period : time := 5 ns; --200 Mhz
--file write
signal o_valid        : std_logic;
signal o_add          : std_logic_vector(7 downto 0);
signal tst          : std_logic_vector(15 downto 0) := x"0100";
begin


-- Clock process definitions
clk_process :process
begin
     clk <= '1';
     wait for clk_period/2;
     clk <= '0';
     wait for clk_period/2;
end process;  



-- Write the d0,d1 outputs to a file
csi_dump_to_file : Process(hs_c_clk_p)
Variable write_buf_d0,write_buf_d1    : line;
Variable val_d0,val_d1   : integer;
file file_d0        : TEXT open WRITE_MODE is "hs_c_d0_p.csv";
file file_d1        : TEXT open WRITE_MODE is "hs_c_d1_p.csv";
 
begin
   if rising_edge(hs_c_clk_p) or falling_edge(hs_c_clk_p) then
         --d0
         val_d0   := to_integer(unsigned'('0' & hs_c_d0_p));                
         Write(write_buf_d0, val_d0);
         Write(write_buf_d0, string'(","));       
         WriteLine(file_d0, write_buf_d0);
         
         --d1
         val_d1   := to_integer(unsigned'('0' & hs_c_d1_p));                
         Write(write_buf_d1, val_d1);
         Write(write_buf_d1, string'(","));       
         WriteLine(file_d1, write_buf_d1);
         
         

   end if;
end process csi_dump_to_file;



sys_clk_p <= clk;
sys_clk_n <= not clk;


inst_fmc_mipi_top:  fmc_mipi_top      
    Generic Map (	
        N_MIPI_LANES => N_MIPI_LANES,
        SERDES_DATA_WIDTH => SERDES_DATA_WIDTH,
        ADD_DEBUG_OVERLAY => ADD_DEBUG_OVERLAY
    )
   Port map( 
    sys_clk_p => sys_clk_p,
    sys_clk_n => sys_clk_n, 
    sys_rst => sys_rst,
      
    i2c3_cam_clk =>  i2c3_cam_clk, --H7, HPC_LA02_P, H24
    monitor_1p2v =>  monitor_1p2v, --H8, HPC_LA02_N, H25

    i2c2_cam_clk =>  i2c2_cam_clk,    --G9,  HPC_LA03_P, H26
    i2c3_cam_dat =>  i2c3_cam_dat, --G10, HPC_LA03_N, H27

    switch_data_lanes_vadj  =>  switch_data_lanes_vadj, --G12, HPC_LA08_P, E29
    switch_clock_lanes_vadj =>  switch_clock_lanes_vadj, --G13, HPC_LA08_N, E30

    i2c_cam_dat =>  i2c_cam_dat, --G24, HPC_LA22_P, C20
    i2c_cam_clk =>  i2c_cam_clk,    --G25, HPC_LA22_N, B20

    monitor_1p8v =>  monitor_1p8v, --G27, HPC_LA25_P, G17
    cam0_rst     =>  cam0_rst, --G28, HPC_LA25_N, F17

    cam0_pwr     =>  cam0_pwr,  --G30, HPC_LA29_P, C17

    cam0_mclk    =>  cam0_mclk,  --G33, HPC_LA31_P, G22

    monitor_2p8v =>  monitor_2p8v,  --D8, HPC_LA01_CC_P, D26                           
    monitor_3p3v =>  monitor_3p3v,  --D9, HPC_LA01_CC_N, C26

    i2c2_cam_dat =>  i2c2_cam_dat, --D11, HPC_LA05_P, G29

    en_mipi_out_data_vadj  => en_mipi_out_data_vadj, --D14, HPC_LA09_P, B30
    en_mipi_out_clock_vadj  => en_mipi_out_clock_vadj, --D15, HPC_LA09_N, A30

    enn_jt_gpio_input => enn_jt_gpio_input, --D17, HPC_LA13_P, A25

    gpio17_out => gpio17_out, --D26, HPC_LA26_P, B18
    gpio9_out  => gpio9_out, --D27, HPC_LA26_N, A18

    --CSI related

    hs_c_d1_p  =>  hs_c_d1_p, --H10, HPC_LA04_P, G28
    hs_c_d1_n  =>  hs_c_d1_n, --H11, HPC_LA04_N, F28

    hs_c_d0_p  =>  hs_c_d0_p, --H13, HPC_LA07_P, E28
    hs_c_d0_n  =>  hs_c_d0_n, --H14, HPC_LA07_N, D28

    lp_c_d1_p  =>  lp_c_d1_p, --H16, HPC_LA11_P, G27
    lp_c_d1_n  =>  lp_c_d1_n, --H17, HPC_LA11_N, F27

    lp_c_d0_p  =>  lp_c_d0_p, --H19, HPC_LA15_P, C24
    lp_c_d0_n  =>  lp_c_d0_n, --H20, HPC_LA15_N, B24

    lp_c_clk_p =>  lp_c_clk_p, --H22, HPC_LA19_P, G18
    lp_c_clk_n =>  lp_c_clk_n, --H23, HPC_LA19_N, F18

    hs_d_d1_p  =>  hs_d_d1_p, --H31, HPC_LA28_P, D16
    hs_d_d1_n  =>  hs_d_d1_n, --H32, HPC_LA28_N, C16

    hs_d_d0_p  =>  hs_d_d0_p, --H34, HPC_LA30_P, D22
    hs_d_d0_n  =>  hs_d_d0_n, --H35, HPC_LA30_N, C22

    hs_d_clk_p =>  hs_d_clk_p, --H37, HPC_LA32_P, D21
    hs_d_clk_n =>  hs_d_clk_n, --H38, HPC_LA32_N, C21


    hs_c_clk_p =>  hs_c_clk_p, --G6, HPC_LA00_CC_P, C25
    hs_c_clk_n =>  hs_c_clk_n, --G7, HPC_LA00_CC_N, B25

    lp_d_d1_p  =>  lp_d_d1_p, --G15, HPC_LA12_P, C29
    lp_d_d1_n  =>  lp_d_d1_n, --G16, HPC_LA12_N, B29

    lp_d_d0_p  =>  lp_d_d0_p, --G18, HPC_LA16_P, B27
    lp_d_d0_n  =>  lp_d_d0_n, --G19, HPC_LA16_N, A27

    lp_d_clk_p =>  lp_d_clk_p, --G21, HPC_LA20_P, E19
    lp_d_clk_n =>  lp_d_clk_n, --G22, HPC_LA20_N, D19
   
    --debug IO              
    leds_debug => leds_debug,
    dbg_io_1   => dbg_io_1,
    dbg_io_2   => dbg_io_2,
    dbg_io_3   => dbg_io_3,
    GPIO_SW_N  => GPIO_SW_N,
    GPIO_SW_E  =>  GPIO_SW_E,
    GPIO_SW_S  => GPIO_SW_S,
    GPIO_SW_W  => GPIO_SW_W,
    GPIO_SW_C  => GPIO_SW_C
   
   );


       
-- Stimulus process
stim_proc: process
begin        
  
   wait for clk_period*5;
     
   --reset
   sys_rst <= '1';
   rx_rst  <= '1';
   wait for clk_period*5;  
   --rx_rst  <= '0';  
      
   wait for clk_period*20;
   sys_rst <= '0';
   
	--wait a little
   wait for clk_period*200;
 
   
  GPIO_SW_C <= '1';
  wait for clk_period*2000;
--GPIO_SW_C <= '0';
     
   
     
   wait for clk_period*20000;
   
   wait;
   
end process;



end Behavioral;

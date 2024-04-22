----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/08/2017 09:57:14 AM
-- Design Name: 
-- Module Name: fmc_mipi_top - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity fmc_mipi_top is     Generic (	
        N_MIPI_LANES : integer := 2;
        SERDES_DATA_WIDTH : integer := 8;
        ADD_DEBUG_OVERLAY : integer := 1 --If 1 , adds a vertical line overly across the frame, to indicate line numbers on display
    );
   Port ( 
   sys_clk_p : in std_logic;  --AD12 SYSCLK_P;
   sys_clk_n : in std_logic;  --AD11 SYSCLK_N;
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
   
   en_mipi_out_data_vadj  :  out std_logic := '1'; --D14, HPC_LA09_P; B30 --CSI C
   en_mipi_out_clock_vadj :  out std_logic := '0'; --D15, HPC_LA09_N; A30 --CSI D
   
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
end fmc_mipi_top;

architecture Behavioral of fmc_mipi_top is


COMPONENT   clock_wizard is
  Port (
    --Clock in ports
    sys_clk_200MHz_in_p : in std_logic;
    sys_clk_200MHz_in_n : in std_logic;
    --Clock out ports
    clk_DPHY_100Mhz          : out std_logic;
    clk_200MHz_deg90     : out std_logic;
    clk_50MHz         : out std_logic;
    clk_10MHz           : out std_logic;
    clk_200MHz_serdes       : out std_logic;
    --Status and control signals
    reset              : in std_logic;
    locked             : out std_logic
    );
END COMPONENT;

COMPONENT send_single_frame is
    Generic (	
        N_MIPI_LANES : integer := N_MIPI_LANES;
        ADD_DEBUG_OVERLAY : integer := ADD_DEBUG_OVERLAY
    );
    Port (
        clk : in std_logic; --data in/out clock HS clock, ~100 MHZ
        rst : in  std_logic;
        clk_DPHY_100Mhz : in std_logic;
        send_frame : in std_logic; --triggers frame sending, one clock cycle is enough  
        frame_done : out std_logic; --indicates that frame was sent successfully
        hs_active : out std_logic; -- ON when entrering HS mode, it is a good time to switch mixer lines and activate HS clock
        hs_data_valid : out std_logic; -- when ON, csi_hs_data_out is valid to transmit 
        csi_hs_data_1_out : out std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializersignal
        csi_hs_data_2_out : out std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializersignal 
        csi_hs_data_3_out : out std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializersignal
        csi_hs_data_4_out : out std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializersignal
        lp_lanes : out std_logic_vector(1 downto 0); --bit 1 = Dp line, bit 0 = Dn line        
        lp_clk_lane  : out std_logic_vector(1 downto 0); --bit 1 = Dp line, bit 0 = Dn line
        csi_clk_hs_active : out std_logic -- ON when entrering HS mode in clock lane, it is a good time to switch mixer lines and activate HS 
    );
END COMPONENT;

         

COMPONENT selectio_serdes is
  port (
    data_out_from_device : in STD_LOGIC_VECTOR ( 15 downto 0 );
    data_out_to_pins_p : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_out_to_pins_n : out STD_LOGIC_VECTOR ( 1 downto 0 );
    clk_in : in STD_LOGIC;
    clk_div_in : in STD_LOGIC;
    clock_enable : in STD_LOGIC;
    io_reset : in STD_LOGIC
  );
END COMPONENT;  


COMPONENT I2C_SLAVE_TOP is
		port(
    clk_10MHz : in std_logic;  
    rst : in std_logic; -- AB7 use CPU_RESET button        
    SCL        : inout    std_logic;
    SDA        : inout    std_logic;
       --debug IO              
    --leds_debug : out std_logic_vector(7 downto 0) := (others => '0') --debug
    EEPROM_ACTIVE : out std_logic;
    OV_ACTIVE : out std_logic;
    start_activated_by_i2c  : out std_logic
    );
END COMPONENT;


constant COUNTER_WIDTH : integer := 11; --max 2047*10ns(100Mhz clock) = 204.7 us delay
constant SLOW_COUNTER_WIDTH: integer := 11;
COMPONENT counter is GENERIC(n: natural :=COUNTER_WIDTH);
PORT(clk :	in std_logic;
	rst:	in std_logic;
	counter_out :	out std_logic_vector(COUNTER_WIDTH-1 downto 0)
);
END COMPONENT;


signal clk_DPHY_100Mhz,clk_50MHz,clk_200MHz_deg90,clk_10MHz,clk_200MHz_serdes : std_logic;
signal locked,rst : std_logic;
signal hs_clk,hs_d0,hs_d1,hs_d2,hs_d3 : std_logic;


signal send_frame         :  std_logic := '0'; --triggers frame sending, one clock cycle is enough  
signal frame_done         : std_logic;
signal hs_active          :  std_logic; -- ON when entrering HS mode, it is a good time to switch mixer lines and activate HS clock
signal csi_clk_hs_active  :  std_logic; -- ON when entrering HS mode in clock lane, it is a good time to switch mixer lines and activate HS 
signal hs_data_valid      :  std_logic; -- when ON, csi_hs_data_out is valid to transmit  

signal csi_hs_data_1_out,csi_hs_data_2_out,csi_hs_data_3_out,csi_hs_data_4_out : std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializer
signal lp_lanes     :  std_logic_vector(1 downto 0); --bit 1 = Dp line, bit 0 = Dn line 
signal lp_clk_lane  :  std_logic_vector(1 downto 0); --bit 1 = Dp line, bit 0 = Dn line


signal counter_value :  STD_LOGIC_VECTOR (COUNTER_WIDTH - 1 downto 0) := (others => '0');
signal slow_counter_value :  STD_LOGIC_VECTOR (COUNTER_WIDTH - 1 downto 0) := (others => '0');
signal clk_slow_counter :std_logic;

--For serdes
signal parallel_data_to_serdes :  STD_LOGIC_VECTOR ( 31 downto 0 ); --parallel data in
--Outputs
signal eeprom_active : std_logic;
signal ov_active : std_logic;

--For SelectIO
signal data_out_to_pins_p : STD_LOGIC_VECTOR ( 1 downto 0 );
signal data_out_to_pins_n :  STD_LOGIC_VECTOR ( 1 downto 0 );
signal data_out_from_device : STD_LOGIC_VECTOR (15 downto 0 );

signal start_activated_by_i2c : std_logic;  

begin
  

inst_selectio: selectio_serdes PORT MAP (
    data_out_from_device => data_out_from_device,
    data_out_to_pins_p => data_out_to_pins_p,
    data_out_to_pins_n => data_out_to_pins_n,
    clk_in => clk_200MHz_serdes,
    clk_div_in => clk_50MHz,
    clock_enable => '1',--hs_active,
    io_reset => rst
  );

data_out_from_device(1) <= parallel_data_to_serdes(0);
data_out_from_device(3) <= parallel_data_to_serdes(1);
data_out_from_device(5) <= parallel_data_to_serdes(2);
data_out_from_device(7) <= parallel_data_to_serdes(3);
data_out_from_device(9) <= parallel_data_to_serdes(4);
data_out_from_device(11) <= parallel_data_to_serdes(5);
data_out_from_device(13) <= parallel_data_to_serdes(6);
data_out_from_device(15) <= parallel_data_to_serdes(7);

data_out_from_device(0) <= parallel_data_to_serdes(8);
data_out_from_device(2) <= parallel_data_to_serdes(9);
data_out_from_device(4) <= parallel_data_to_serdes(10);
data_out_from_device(6) <= parallel_data_to_serdes(11);
data_out_from_device(8) <= parallel_data_to_serdes(12);
data_out_from_device(10) <= parallel_data_to_serdes(13);
data_out_from_device(12) <= parallel_data_to_serdes(14);
data_out_from_device(14) <= parallel_data_to_serdes(15);

 
hs_c_d0_p <= data_out_to_pins_p(1);
hs_c_d0_n  <= data_out_to_pins_n(1);
hs_c_d1_p <= data_out_to_pins_p(0);
hs_c_d1_n <= data_out_to_pins_n(0);


--Instantinate differential outputs

out_HS_C_clk: unisim.vcomponents.OBUFDS
port map (
  I  => clk_200MHz_deg90,
  O => hs_c_clk_p,
  OB  => hs_c_clk_n
);


--set D camera HS to zero
out_HS_D_clk: unisim.vcomponents.OBUFDS
port map (
  I  => '0',
  O => hs_d_clk_p,
  OB  => hs_d_clk_n
);

out_HS_D_D0: unisim.vcomponents.OBUFDS
port map (
  I  => '0',
  O => hs_d_d0_p,
  OB  => hs_d_d0_n
);

out_HS_D_D1: unisim.vcomponents.OBUFDS
port map (
  I  => '0',
  O => hs_d_d1_p,
  OB  => hs_d_d1_n
);

--Instantinate 200 MHz main clock in
--clck_in_IBUFDS: unisim.vcomponents.IBUFDS
--port map (
--  I  => sys_clk_p,
--  IB => sys_clk_n,
--  O  => clk_200Mhz
--);

i2c_slave: I2C_SLAVE_TOP
		PORT MAP (
    clk_10MHz => clk_10MHz,
    rst =>  rst,     
    SCL  => i2c_cam_clk,
    SDA  => i2c_cam_dat,
       --debug IO              
    --leds_debug => open
    eeprom_active => eeprom_active, 
    ov_active =>  ov_active,
    start_activated_by_i2c => start_activated_by_i2c
    );




clock_network :  clock_wizard
  PORT MAP (
    --Clock in ports
    sys_clk_200MHz_in_p  => sys_clk_p,
    sys_clk_200MHz_in_n  => sys_clk_n,
    --Clock out ports
    clk_DPHY_100Mhz          => clk_DPHY_100Mhz,
    clk_200MHz_deg90     => clk_200MHz_deg90,
    clk_50MHz         => clk_50MHz,
    clk_10MHz           => clk_10MHz,
    clk_200MHz_serdes   => clk_200MHz_serdes,
    --Status and control signals
    reset              => sys_rst,
    locked             => locked
    );

delay_counter: counter 
GENERIC MAP(n => COUNTER_WIDTH)
PORT MAP(clk => clk_DPHY_100Mhz,
         rst => rst,
         counter_out => counter_value); 


clk_slow_counter <= '1' when (counter_value > "0111111111") else '0'; 
delay_slow_counter: counter 
GENERIC MAP(n => SLOW_COUNTER_WIDTH)
PORT MAP(clk =>  clk_slow_counter,
         rst => (not monitor_1p8v),
         counter_out => slow_counter_value); 



--Instantiate the Frame stream generator 
frame_gen: send_single_frame  
     GENERIC MAP(    
       N_MIPI_LANES => N_MIPI_LANES, --number of MIPI CSI lanes currently only 2 implemented
       ADD_DEBUG_OVERLAY => ADD_DEBUG_OVERLAY
     )
     PORT MAP(
     clk => clk_50MHz,
     rst => rst,
     clk_DPHY_100Mhz => clk_DPHY_100Mhz,
     send_frame =>  send_frame,
     frame_done => frame_done,
     hs_active => hs_active,
     hs_data_valid => hs_data_valid,
     csi_hs_data_1_out => csi_hs_data_1_out,
     csi_hs_data_2_out => csi_hs_data_2_out,
     csi_hs_data_3_out => csi_hs_data_3_out,
     csi_hs_data_4_out => csi_hs_data_4_out,
     lp_lanes => lp_lanes,
     lp_clk_lane => lp_clk_lane,
     csi_clk_hs_active => csi_clk_hs_active
     ); 
     
            
rst <= not locked; --hold all the system on reset while clocks are not locked 
send_frame <=  '1' when (counter_value < "0000000011" and rst = '0' and ( GPIO_SW_C = '1' or start_activated_by_i2c = '1' or slow_counter_value >  "0111111111"))  else '0'; --100 MHz
--send_frame <=  '1' when (counter_value < "0000001100" and rst = '0') else '0'; --400 MHz

leds_debug(0) <= start_activated_by_i2c;
leds_debug(1) <= eeprom_active;
leds_debug(2) <= ov_active;
leds_debug(3) <= '1';
leds_debug(4) <= monitor_1p2v;
leds_debug(5) <= monitor_1p8v;
leds_debug(6) <= monitor_2p8v;
leds_debug(7) <= monitor_3p3v;

dbg_io_1   <= monitor_1p8v;
dbg_io_2   <= send_frame;
dbg_io_3   <= frame_done;
           
i2c_cam_dat <= 'Z';
i2c2_cam_dat <= 'Z';
i2c3_cam_dat <= 'Z';


--HS Lanes

parallel_data_to_serdes(7  downto 0)  <= csi_hs_data_1_out;
parallel_data_to_serdes(15 downto 8)  <= csi_hs_data_2_out;
parallel_data_to_serdes(23 downto 16) <= csi_hs_data_3_out;
parallel_data_to_serdes(31 downto 24) <= csi_hs_data_4_out;


------------------------------------------LP Lanes-----------------------------
--CSI_C
lp_c_d0_p  <= lp_lanes(1);
lp_c_d0_n  <= lp_lanes(0);
lp_c_d1_p  <= lp_lanes(1);
lp_c_d1_n  <= lp_lanes(0);
lp_c_clk_p <= lp_clk_lane(1);
lp_c_clk_n <= lp_clk_lane(0);
--CSI_D
lp_d_d0_p  <= '0'; --TODO check if need to switch (1) <-> (0)
lp_d_d0_n  <= '0'; --TODO check if need to switch (1) <-> (0)
lp_d_d1_p  <= '0'; --TODO check if need to switch (1) <-> (0)
lp_d_d1_n  <= '0'; --TODO check if need to switch (1) <-> (0)
lp_d_clk_p <= '0'; --TODO check if need to switch (1) <-> (0)
lp_d_clk_n <= '0'; --TODO check if need to switch (1) <-> (0)

------------------------------------------SWITCH LP/HS ---------------------------
switch_data_lanes_vadj <= lp_lanes(0); -- switch LP and HS mode
switch_clock_lanes_vadj <= lp_clk_lane(0); -- switch LP and HS mode

  
end Behavioral;

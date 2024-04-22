library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

--openMixR top level design
--Copyright (C) 2017 David Shah
--Licensed under the MIT License

entity ov13850_demo is
  Port (
    --Core signals
    clock_p : in std_logic;
    clock_n : in std_logic;
    aux_clock_p : in std_logic;
    aux_clock_n : in std_logic;

    --User interface
    btn_miso : in std_logic;
    btn_clk : out std_logic;
    btn_ld_n : out std_logic;
    rgb_led : out std_logic_vector(2 downto 0);
    imu_mosi : out std_logic;
    imu_miso : in std_logic;
    imu_sclk : out std_logic;
    imu_cs_n : out std_logic;
    imu_fsync : out std_logic;

    --FTDI interface
    ftdi_data : inout std_logic_vector(7 downto 0);
    ftdi_rd_n : out std_logic;
    ftdi_wr_n : out std_logic;
    ftdi_siwu_n : out std_logic;
    ftdi_rxf_n : in std_logic;
    ftdi_txf_n : in std_logic;

    --USB-C and DP interface
    ccg_io0 : inout std_logic;
    ccg_io1 : inout std_logic;
    dp_aux_p : inout std_logic;
    dp_aux_n : inout std_logic;
    dp_hpd : inout std_logic;
    dprt_en : out std_logic;
    dprt_sda : inout std_logic;
    dprt_scl : inout std_logic;

    --Camera CSI port
    csi0_clk : in std_logic_vector(1 downto 0);
    csi0_d0 : in std_logic_vector(1 downto 0);
    csi0_d1 : in std_logic_vector(1 downto 0);
    csi0_d2 : in std_logic_vector(1 downto 0);
    csi0_d3 : in std_logic_vector(1 downto 0);
    csi1_clk : in std_logic_vector(1 downto 0);
    csi1_d0 : in std_logic_vector(1 downto 0);
    csi1_d1 : in std_logic_vector(1 downto 0);
    csi1_d2 : in std_logic_vector(1 downto 0);
    csi1_d3 : in std_logic_vector(1 downto 0);

    --Camera control port
    cam0_mclk : out std_logic;
    cam_rstn : out std_logic;
    cam0_i2c_sda : inout std_logic;
    cam0_i2c_sck : inout std_logic;
    cam0_led : out std_logic;
    cam0_gpio : inout std_logic;
    cam1_mclk : out std_logic;
    cam1_i2c_sda : inout std_logic;
    cam1_i2c_sck : inout std_logic;
    cam1_led : out std_logic;
    cam1_gpio : inout std_logic;

    --LCD control interface
    vddd_en : out std_logic;
    vdda_en : out std_logic;
    lcd_reset_b : out std_logic;
    bl_pwm_b : out std_logic;
    lcd_te : in std_logic;
    lcd_id : in std_logic_vector(3 downto 0);
    lcd_gpio : inout std_logic_vector(2 downto 0);
    lcd_psu_sda : inout std_logic_vector;
    lcd_psu_scl : inout std_logic_vector;

    --DSI port 0 (master, left)
    dphy0_hs_clk : inout STD_LOGIC_VECTOR (1 downto 0); --DSI lanes; hs is high speed and lp is low power for resistor network
    dphy0_lp_clk : inout STD_LOGIC_VECTOR (1 downto 0); -- In each case 1 is P and 0 is N
    dphy0_hs_d0 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy0_lp_d0 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy0_hs_d1 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy0_lp_d1 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy0_hs_d2 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy0_lp_d2 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy0_hs_d3 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy0_lp_d3 : inout STD_LOGIC_VECTOR (1 downto 0);

    --DSI port 1 (slave, right)
    dphy1_hs_clk : inout STD_LOGIC_VECTOR (1 downto 0); --DSI lanes; hs is high speed and lp is low power for resistor network
    dphy1_lp_clk : inout STD_LOGIC_VECTOR (1 downto 0); -- In each case 1 is P and 0 is N
    dphy1_hs_d0 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy1_lp_d0 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy1_hs_d1 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy1_lp_d1 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy1_hs_d2 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy1_lp_d2 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy1_hs_d3 : inout STD_LOGIC_VECTOR (1 downto 0);
    dphy1_lp_d3 : inout STD_LOGIC_VECTOR (1 downto 0);

    --A64 control interface
    a64_boot_ctl : out std_logic;
    a64_reset_ctl : out std_logic;
    a64_fpga_oe : in std_logic;
    a64_mosi : in std_logic;
    a64_miso : inout std_logic;
    a64_sck : in std_logic;
    a64_csn : in std_logic;
    a64_io0 : inout std_logic;

    --A64 vLCD interface
    a64_lcd_pixclk : in std_logic;
    a64_lcd_data : in std_logic_vector(17 downto 0);
    a64_lcd_hsync : in std_logic;
    a64_lcd_vsync : in std_logic;
    a64_lcd_den : in std_logic;

    --A64 vCamera interface
    a64_cam_pixclk : inout std_logic;
    a64_cam_mclk : in std_logic;
    a64_cam_data : inout std_logic_vector(7 downto 0);
    a64_cam_vsync : inout std_logic;
    a64_cam_hsync : inout std_logic;
    
   --DDR3 interface
    ddr3_addr : out std_logic_vector(14 downto 0);
    ddr3_ba : out std_logic_vector(2 downto 0);
    ddr3_cas_n : out std_logic;
    ddr3_ck_n : out std_logic_vector(0 downto 0);
    ddr3_ck_p : out std_logic_vector(0 downto 0);
    ddr3_cke : out std_logic_vector(0 downto 0);
    ddr3_ras_n : out std_logic;
    ddr3_reset_n : out std_logic;
    ddr3_we_n : out std_logic;
    ddr3_dq : inout std_logic_vector(31 downto 0);
    ddr3_dqs_n : inout std_logic_vector(3 downto 0);
    ddr3_dqs_p : inout std_logic_vector(3 downto 0);
    ddr3_cs_n : out std_logic_vector(0 downto 0);
    ddr3_dm : out std_logic_vector(3 downto 0);
    ddr3_odt : out std_logic_vector(0 downto 0)
  );
end ov13850_demo;

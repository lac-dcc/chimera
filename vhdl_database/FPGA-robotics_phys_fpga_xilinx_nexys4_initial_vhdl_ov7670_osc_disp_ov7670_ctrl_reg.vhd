--------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--
--   ov7670_ctrl_reg.vhd
--   Module in charge of telling the SCCB module what registers to write
--   in the camera camera and to control the camera inputs:
--     - ov7670_rst_n
--          0: camera reset
--          1: normal mode            
--     - pwdn: power down mode selection
--          0: normal mode
--          1: power down mode
--     - xclk: system clock input
--          freq   :  min: 10 MHz  -- typ: 24 MHz  -- Max: 48 MHz
--          Period : max: 100 ns   -- typ: 42 ns   -- Max: 21 ns
--   Register values taken from
--   http://hamsterworks.co.nz/mediawiki/index.php/Zedboard_OV7670
--   http://hamsterworks.co.nz/mediawiki/index.php/OV7670_camera
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ov7670_pkg.all;  -- definition of the clk frequency
use work.pkg_fun.all;  -- definition of the clk frequency

entity ov7670_ctrl_reg is
  port(
    rst        : in  std_logic;                    --reset, active high
    clk        : in  std_logic;                    --fpga clock
    test_mode  : in  std_logic;                    --if '1': in test mode
    test_send  : in  std_logic;                --in testmode, send 1 instruction
    sw_regs    : in  std_logic_vector(1 downto 0);
    resend     : in  std_logic;                    --resend all the sequence
    sccb_ready : in  std_logic;                    --SCCB ready to transmit
    start_tx   : out std_logic;                    --start transmission
    done       : out std_logic;                    --all the registers written
    id         : out std_logic_vector(6 downto 0); --id of the slave
    addr       : out std_logic_vector(7 downto 0); --address to be written
    data_wr    : out std_logic_vector(7 downto 0); --data to write to slave
    ov7670_rst_n : out std_logic;                  --camera reset
    ov7670_clk   : out std_logic;                  --camera system clock
    ov7670_pwdn  : out std_logic                   --camera power down
  );
end ov7670_ctrl_reg;

architecture behav of ov7670_ctrl_reg is

  type mem_reg is array (natural range <>) of std_logic_vector(15 downto 0); 
  -- msb 8 bits are the address (15 downto 8)
  -- lsb 8 bits are the register value to be written

  -- cuenta 3(2)
  constant reg_vga_yuv : mem_reg := (
    x"1280", -- COM7   Reset
    x"1101", -- CLKRC  6->0 External clock, no pre-scale
             --           internal clock pre-scale /2
    x"1200", -- COM7   2,0->(0,0) YUV  1: disable color bar
             --        1->0 disable color bar
    x"0C00", -- COM3   3->0 scale disable
             --        2->0 DCW disable
    x"3E00", -- COM14  4->0 Normal PCLK
             --        3->0 Scaling cannot be adjusted manually
    x"70BA", -- SCALING_XSC  7->0 , (SCALING_YSC[7])-> (0,0): No test
    --x"703A", -- SCALING_XSC  7->0 , (SCALING_YSC[7])-> (0,0): No test
             --        6:0-> 011 1010 (58) Horizontal scale factor (?)
    x"7135", -- SCALING_YSC  7->0 , (SCALING_XSC[7])-> (0,0): No test
             --        6:0-> 011 1010 (53) Vertical scale factor (?)
    x"7211", -- SCALING_DCWCTR
             --        7->0 Vertical truncation vertical average calculation
             --        5:4-> 01: Vertical down sample by 2     
             --        4->0 Horizontal truncation horizontal average calculation
             --        1:0-> 01: Vertical  down sample by 2     
    x"73F0", -- SCALING_PCLK_DIV
             --        7:4-> Reserved
             --        3->0 Enable clock divider
             --        2:0 -> clock divider control for DSP
             --               only valid when COM15[3]=1
    x"A202", -- SCALING_PCLK_DELAY
             --        6:0-> 2 Scaling output delay
    x"FFFF", -- FINISH CONDITION
    x"FFFF"  -- FINISH CONDITION
  );


  -- cuenta 3 (2) 
  constant reg_vga_rgb565 : mem_reg := (
    x"1280", -- COM7   Reset
    x"1101", -- CLKRC  6->0 External clock, no pre-scale
             --           internal clock pre-scale /2
    x"1204", -- COM7   2,0->(1,0) RGB 
             --        1->0 disable color bar
    --x"0C00", -- COM3   3->0 scale disable
             --        2->0 DCW disable
    x"3E00", -- COM14  4->0 Normal PCLK
             --        3->0 Scaling cannot be adjusted manually
    x"40D0", -- COM15  7,6->(1,1): full range enable
             --        5:4->(0,1): RGB565
             --        3:0-> Reserved

    --x"7080", -- test
    --x"7100", -- test
    --x"703A", -- SCALING_XSC  7->0 , (SCALING_YSC[7])-> (0,0): No test
    --         --        6:0-> 011 1010 (58) Horizontal scale factor (?)
    --x"7135", -- SCALING_YSC  7->0 , (SCALING_XSC[7])-> (0,0): No test
    --         --        6:0-> 011 1010 (53) Vertical scale factor (?)
    --x"7211", -- SCALING_DCWCTR
             --        7->0 Vertical truncation vertical average calculation
             --        5:4-> 01: Vertical down sample by 2     
             --        4->0 Horizontal truncation horizontal average calculation
             --        1:0-> 01: Vertical  down sample by 2     
    --x"73F0", -- SCALING_PCLK_DIV
             --        7:4-> Reserved
             --        3->0 Enable clock divider
             --        2:0 -> clock divider control for DSP
             --               only valid when COM15[3]=1
    --x"A202", -- SCALING_PCLK_DELAY
             --        6:0-> 2 Scaling output delay
    x"FFFF", -- FINISH CONDITION
    x"FFFF"  -- FINISH CONDITION

  );

  -- cuenta 1, mas cerca los pclk
  constant reg_hzed : mem_reg := (
       x"1280", -- COM7   Reset
       x"1280", -- COM7   Reset
       x"1204", -- COM7   Size & RGB output
       x"1100", -- CLKRC  Prescaler - Fin/(1+1)
       x"0C00", -- COM3   Lots of stuff, enable scaling, all others off
       x"3E00", -- COM14  PCLK scaling off
       
       x"8C00", -- RGB444 Set RGB format
       x"0400", -- COM1   no CCIR601
       x"4010", -- COM15  Full 0-255 output, RGB 565
       x"3a04", -- TSLB   Set UV ordering,  do not auto-reset window
       x"1438", -- COM9  - AGC Celling
       x"4f40", --x"4fb3"; -- MTX1  - colour conversion matrix
       x"5034", --x"50b3"; -- MTX2  - colour conversion matrix
       x"510C", --x"5100"; -- MTX3  - colour conversion matrix
       x"5217", --x"523d"; -- MTX4  - colour conversion matrix
       x"5329", --x"53a7"; -- MTX5  - colour conversion matrix
       x"5440", --x"54e4"; -- MTX6  - colour conversion matrix
       x"581e", --x"589e"; -- MTXS  - Matrix sign and auto contrast
       x"3dc0", -- COM13 - Turn on GAMMA and UV Auto adjust
       x"1100", -- CLKRC  Prescaler - Fin/(1+1)
            
       x"1711", -- HSTART HREF start (high 8 bits)
       x"1861", -- HSTOP  HREF stop (high 8 bits)
       x"32A4", -- HREF   Edge offset and low 3 bits of HSTART and HSTOP
      
       x"1903", -- VSTART VSYNC start (high 8 bits)
       x"1A7b", -- VSTOP  VSYNC stop (high 8 bits) 
       x"030a", -- VREF   VSYNC low two bits
      
       x"0e61", -- COM5(0x0E) 0x61
       x"0f4b", -- COM6(0x0F) 0x4B 
            
       x"1602", --
       x"1e37", -- MVFP (0x1E) 0x07  -- FLIP AND MIRROR IMAGE 0x3x

       x"2102",
       x"2291",
            
       x"2907",
       x"330b",
                                  
       x"350b",
       x"371d",
                                  
       x"3871",
       x"392a",
                                   
       x"3c78", -- COM12 (0x3C) 0x78
       x"4d40", 
                                  
       x"4e20",
       x"6900", -- GFIX (0x69) 0x00
                                   
       x"6b4a",
       x"7410",
                                  
       x"8d4f",
       x"8e00",
                                   
       x"8f00",
       x"9000",
                                  
       x"9100",
       x"9600",
                                  
       x"9a00",
       x"b084",
                                  
       x"b10c",
       x"b20e",
                                  
       x"b382",
       x"b80a",
            
       x"ffff",
       x"ffff"
  );



  -- cuenta 2-3 
  constant reg_test : mem_reg := (
    x"1280", -- COM7   Reset
    x"1280", -- COM7   Reset
    x"1204", -- COM7   "00000100" No reset + RGB
    x"4010", -- COM15  Full 0-255 output, RGB 444
    x"8C02", -- RGB444 Set RGB format

    x"1100", -- CLKRC  Prescaler - Fin/(1+1)  ?
    --x"1204", -- COM7   QIF + RGB output
    --x"1204", -- COM7   QIF + RGB output
    --x"0C04", -- COM3  Lots of stuff, enable scaling, all others off
    --x"3E19", -- COM14  PCLK scaling = 0
            
    x"40D0", -- COM15  Full 0-255 output, RGB 565
    x"3a04", -- TSLB   Set UV ordering,  do not auto-reset window
    --x"8C00", -- RGB444 Set RGB format
    
    --x"1714", -- HSTART HREF start (high 8 bits)
    --x"1802", -- HSTOP  HREF stop (high 8 bits)
    --x"32A4", -- HREF   Edge offset and low 3 bits of HSTART and HSTOP
    --x"1903", -- VSTART VSYNC start (high 8 bits)
    --x"1A7b", -- VSTOP  VSYNC stop (high 8 bits) 
    --x"030a", -- VREF   VSYNC low two bits

    --x"7080", -- test
    --x"7100", -- test
            
    --x"703a", -- SCALING_XSC
    --x"7135", -- SCALING_YSC
    --x"7211", -- SCALING_DCWCTR
    --x"73f1", -- SCALING_PCLK_DIV
    --x"a202", -- SCALING_PCLK_DELAY  PCLK scaling = 4, must match COM14
            
    --x"1500", -- COM10 Use HREF not hSYNC
    x"7a20", -- SLOP
    x"7b10", -- GAM1
    x"7c1e", -- GAM2
    x"7d35", -- GAM3
    x"7e5a", -- GAM4
    x"7f69", -- GAM5
    x"8076", -- GAM6
    x"8180", -- GAM7
    x"8288", -- GAM8
    x"838f", -- GAM9
    x"8496", -- GAM10
    x"85a3", -- GAM11
    x"86af", -- GAM12
    x"87c4", -- GAM13
    x"88d7", -- GAM14
    x"89e8", -- GAM15
    --x"13E0", -- COM8 - AGC, White balance
    x"0000", -- GAIN AGC 
    x"1000", -- AECH Exposure
    --x"0D40", -- COMM4 - Window Size
    x"1418", -- COMM9 AGC 
    x"a505", -- AECGMAX banding filter step
    x"2495", -- AEW AGC Stable upper limite
    x"2533", -- AEB AGC Stable lower limi
    x"26e3", -- VPT AGC fast mode limits
    x"9f78", -- HRL High reference level
    x"A068", -- LRL low reference level
    x"a103", -- DSPC3 DSP control
    x"A6d8", -- LPH Lower Prob High
    x"A7d8", -- UPL Upper Prob Low
    x"A8f0", -- TPL Total Prob Low
    x"A990", -- TPH Total Prob High
    x"AA94", -- NALG AEC Algo select
    x"13E5", -- COM8 AGC Settings
    x"FFFF",  -- FINISH CONDITION
    x"FFFF"  -- FINISH CONDITION
    );

  -- frequency divider for camera clk (divide by 4) 
  --signal cnt_cam_clk : unsigned (1 downto 0);
  -- frequency divider for camera clk (divide by 8) 
  signal cnt_cam_clk : unsigned (2 downto 0);

  -- 6 bits: less than 64 registers to be written, change if the number
  -- of registers to be written change
  signal cnt_reg : unsigned (5 downto 0);

  -- auxiliary signal, connected to output port done
  signal alltx_done : std_logic;

  -- auxiliary signal, connected to start_tx
  signal start_tx_aux : std_logic;

  --id of the slave; 0x21.
  -- if adding the write bit, would be 0x42 for writing and 0x43 for reading
  constant c_id_write  : std_logic_vector(6 downto 0) :=  B"0100_001" ;
  signal   addr_aux    : std_logic_vector(7 downto 0); --address to be written
  signal   data_aux    : std_logic_vector(7 downto 0); --data to write to slave
  -- register from the register memory: address & data
  signal   reg_i       : std_logic_vector(15 downto 0);

  type ctrl_states is ( WAIT_ST,      -- waiting to send, until not busy
                        WRITE_REG_ST, -- sending the initial sequence
                        DONE_ST       -- all the registers written
                      ); 

  signal pr_ctrl_st, nx_ctrl_st  : ctrl_states;  -- present state, next state

  -- save the switch values to see if the have changed
  signal sw_regs_st : std_logic_vector (1 downto 0);
  signal sw_regs_change : std_logic;

begin

  -- camera system clock:
  --     freq   :  min: 10 MHz  -- typ: 24 MHz  -- Max: 48 MHz
  --     Period : max: 100 ns   -- typ: 42 ns   -- Max: 21 ns
  -- duty cycle between 45% and 55%
  -- Since our clock is 10 ns (100 MHz), we have to divide frequency by:
  --  4: 25 MHz - 40 ns
  P_camera_clk_cnt: process(rst, clk)
  begin
    if rst = c_on then
      cnt_cam_clk <= (others => '0');
    elsif clk'event and clk='1' then
      if cnt_cam_clk = "111" then
        cnt_cam_clk <= (others => '0');
      else
        cnt_cam_clk <= cnt_cam_clk + 1;
      end if;
    end if;
  end process;

  -- when cnt_cam_clk = 0 | 1 => '0', when 2 | 3 => '1'
  ov7670_clk <= cnt_cam_clk(2);

  -- camera reset and power down
  -- reset camera when rst is pressed
  ov7670_rst_n <= '0' when rst = c_on else '1';
  ov7670_pwdn  <= '0';

  -------- controlling the registers to be sent ------------

  id        <= c_id_write; -- 0x21
  addr_aux  <= reg_i(15 downto 8);
  addr      <= addr_aux;
  data_wr   <= reg_i(7 downto 0);

  done     <= alltx_done;
  start_tx <= start_tx_aux;

  -- sequentially counts the registers to be sent to the SCCB
  P_reg_cnt: process(rst, clk)
  begin
    if rst = c_on then
      cnt_reg <= (others =>'0');
    elsif clk'event and clk='1' then
      if resend = '1' or sw_regs_change = '1' then
        cnt_reg <= (others =>'0'); -- start again sending the sequence
      elsif alltx_done = '0' then  -- 
        if start_tx_aux = '1' then
          cnt_reg <= cnt_reg + 1;
        end if;
      end if;
    end if;
  end process;
        
  -- instead of comparing addr_aux = x"FF", to simplify, since there is no
  -- address in F ("1111"), it can be compared
  alltx_done <= '1' when addr_aux(7 downto 4) = "1111" else '0'; 

  P_save_sw_regs: process(rst, clk)
  begin
    if rst = c_on then
      sw_regs_st <= (others => '0');
    elsif clk'event and clk = '1' then
      sw_regs_st <= sw_regs;
    end if;
  end process;

  sw_regs_change <= '1' when (sw_regs_st xor sw_regs) /= "00" else '0';

  -- without clk -> Distributed CLBS
  -- reg_i <= registers(to_integer(unsigned(cnt_reg));
  -- process with clk -> BRAM
  P_regs: process(rst,clk)
  begin
    if rst = c_on then
      reg_i <= x"1280"; -- reset
    elsif clk'event and clk='1' then
      case sw_regs is
        when "00" =>
          reg_i <= reg_test(to_integer(unsigned(cnt_reg)));
        when "01" => --hamster Zed
          reg_i <= reg_hzed(to_integer(unsigned(cnt_reg)));
        when "10" => 
          reg_i <= reg_vga_rgb565(to_integer(unsigned(cnt_reg)));
        when others => 
          reg_i <= reg_vga_yuv(to_integer(unsigned(cnt_reg)));
      end case;
    end if;
  end process;

  -- FSM sequential process
  P_fsm_seq: process(rst,clk)
  begin
    if rst = c_on then
      pr_ctrl_st <= WAIT_ST;
    elsif clk'event and clk='1' then
      pr_ctrl_st <= nx_ctrl_st;
    end if;
  end process;

  -- FSM combinatorial process
  P_fsm_comb: process(pr_ctrl_st, alltx_done, sccb_ready, test_mode, test_send)
  begin
    -- default values
    nx_ctrl_st <= pr_ctrl_st;
    start_tx_aux <= '0';
    case  pr_ctrl_st is
      when WAIT_ST => -- waiting for the SCCB to be available
        if alltx_done = '1' then
          nx_ctrl_st <= DONE_ST;
        elsif sccb_ready = '1' then
          if test_mode = '0' or (test_mode = '1' and test_send='1') then
            nx_ctrl_st <= WRITE_REG_ST;
            start_tx_aux <= '1';
          end if;
        end if;
      when WRITE_REG_ST => -- writting a new register (maybe not necessary)
        nx_ctrl_st <= WAIT_ST;
      when DONE_ST => -- writting a new register
        if alltx_done = '0' then -- in case of resend = '1'
          nx_ctrl_st <= WAIT_ST;
        end if;
    end case;
  end process;

end behav;

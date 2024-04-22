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
  -- RGB444
  constant reg_rgb444_test : mem_reg := (
    x"1280", -- 12:COM7
             -- [7]=1: Reset all registers to default values
    x"1204", -- 12:COM7
             -- [2,0]="10": Output format RGB 
    x"0901", -- 09:COM2 Common Control 2. Default: 01
             -- [7:5] : Reserved
             -- [4]   : Soft sleep mode
             -- [3:2] : Reserved
             -- [1:0] : output drive capability, to increase IOL/OH drive
             --   00: 1x
             --   01: 2x
             --   10: 3x
             --   11: 4x
    x"40F0", -- 40:COM15  Full 0-255 output, RGB 444
             -- [7:6] = 11: Full output range. 12 (C)
             -- [5:4] = x0: Normal RGB output (not we want) Seems: GRB422
             -- [5:4] = 11: RGB555 only if RGB444 is low, we want RGB444
             -- [3:0] = 0:  Reserved

    x"8C02", -- RGB444 Set RGB format: RGB444
             -- [1]= 1: RGB444 enable
             -- [0]= 0: word format: xR GB (chosen)
             -- [0]= 1: word format: RG Bx

    x"1180", -- CLKRC  6->0 External clock, pre-scale 
             --        [7]: 1 (reserved)
             --        [5:0]: Interal clock pre-scalar
             --           F(internal clk) = F(input clk)/([5:0]+1)
             --        [5:0]= 0: No prescale (internal clk)

    --x"0F43", -- COM6  
    x"0F4B", -- COM6  (hamster)
                -- [7] = 0 Disable HREF at optical black
                -- [1] = 1 Resets timming when format changes
                -- others reserved
                -- [3] = 1 (reserved) hamster

    x"1E37", -- MVFP Mirror/flip enable. Default 00
             -- [7:6]= 00 : reserved
             -- [5]= 1 : Mirror image
             -- [4]= 1 : Flip image
             -- [3] : Reserved
             -- [2] : Black Sun Enable
             -- [1:0] : Reserved

    -- color from hamster
    x"1438", -- COM9 reserved: default 4A
             -- [6:4] Automatic Gain Ceiling - maximum AGC value
             --   100 : 32x (default)
             --   011 : 16x (default)
             -- [3:1] Reserved (default 101)
             --   100 : Hamster

     --x"4F40", --x"4fb3", -- MTX1  - colour conversion matrix
     --x"5034", --x"50b3", -- MTX2  - colour conversion matrix
     --x"510C", --x"5100", -- MTX3  - colour conversion matrix
     --x"5217", --x"523d", -- MTX4  - colour conversion matrix
     --x"5329", --x"53a7", -- MTX5  - colour conversion matrix
     --x"54E4", -- MTX6  - colour conversion matrix
     --x"581E", --x"589e", -- MTXS  - Matrix sign and auto contrast

     x"4FB3", -- MTX1  - colour conversion matrix
     x"50B3", -- MTX2  - colour conversion matrix
     x"5100", -- MTX3  - colour conversion matrix
     x"523D", -- MTX4  - colour conversion matrix
     x"53A7", -- MTX5  - colour conversion matrix
     x"54E4", -- MTX6  - colour conversion matrix
     x"589E", -- MTXS  - Matrix sign and auto contrast

     x"3DC0", -- COM13: default 88
              -- [7]=1 : Gamma enable (defaul)
              -- [6]=1 : UV Saturation Level - UV autoadjustment
              -- [5:1]: Reserved
              -- [0]: UV swap


    -- Trial and error
    x"B084", -- recommended TFG (reserved)
    -- hamster
    x"0E61", -- COM5 reserved: default 01
    x"1602", -- reserved
    x"2102", -- ADCCTR0 (reserved): default 02 
    x"2291", -- ADCCTR1 (reserved): default 01 
    x"2907", -- RSVD (reserved): default XX 
    x"330B", -- CHLF Array Current Control (reserved): default 08 
    x"350B", -- RSVD (reserved): default XX
    x"371D", -- ADC (reserved): default 3F
    x"3871", -- ACOM (reserved): default 01. ADC and Analog Common Mode Control
    x"392A", -- OFON (reserved): default 00. ADC Offset Control 
    x"3C78", -- COM12 (default 69)
             -- [7]= 0: No HREF when VSYNC is low
             -- [6:0]: Reserved
    x"4D40", -- RSVD (reserved): default XX
    x"4E20", -- RSVD (reserved): default XX
    x"7410", -- REG74 default 00
             -- [4]=1 : Digital Gain control by REG74[1:0]
             -- [1:0]=00: Bypass
    x"8D4F", -- RSVD (reserved): default XX
    x"8E00", -- RSVD (reserved): default XX
    x"8F00", -- RSVD (reserved): default XX
    x"9000", -- RSVD (reserved): default XX
    x"9100", -- RSVD (reserved): default XX
    x"9600", -- RSVD (reserved): default XX
    x"9A00", -- RSVD (reserved): default XX
    x"B10C", -- ABLC1: default 00. Automatic Black Level Calibration
             -- [3]=1 : Reserved (hamster=1)
             -- [2]=1 : Enable ABLC
    x"B20E", -- RSVD (reserved): default XX
    x"B382", -- THL_ST: ABLC Target: default 80
             -- Lower limit of black leve +0x80
    x"B80A", -- RSVD (reserved): default XX

    --x"1500", -- COM10 Use HREF not hSYNC
    x"1520", -- COM10 Use HREF not hSYNC
             -- [7]=0: Reserved
             -- [6]=0: Use HREF not HSYNC
             -- [5]=1 pclk does not toggle during horizontal blank
             -- others default
    --x"1700", -- HSTART HREF start high 8-bit. For windowing. Dont want to do
    x"1711", -- HSTART HREF start high 8-bit. The first pixels flicker
    x"1800", -- HSTOP HREF end high 8-bit. For windowing. Dont want to do
    x"1900", -- VSTRT VREF start high 8-bit. For windowing. Dont want to do
    x"1A00", -- VSTOP VREF end high 8-bit. For windowing. Dont want to do
    x"3200", -- HREF Control
             -- [7:6] : HREF edge offset to data ouput
             -- [5:3] : HREF end LSB (high 8MSB at HSTOP)
             -- [2:0] : HREF start LSB (high 8MSB at HSTART)

   --QVGA
    x"0C04", -- COM3
             -- [3]=1 scale enable (for QVGA)
             -- [2]=0 DCW disable
    x"3E19", -- COM14
             -- [4]=1 : Scaling PCLK enable (also DCW)
             -- [3]=1 : Manual scaling enable (QVGA)
             -- [2:0] PCLK divided when COM14[4]=1
             -- [2:0]-> 001: pclk divided by 2 -> QVGA: 320x480   
    x"703A", -- SCALING_XSC 
             -- [7]: test_pattern[0], works with test_pattern[1]
             --  00: No test output                            
             --  01: Shifting "1"
             --  10: 8-bar color bar
             --  11: Fade to gray color bar
             -- [7]: 0 -> 8-bar color bar (test_pattern[1]=1)
             -- [6:0]: default horizontal scale factor
    --x"70BA", -- SCALING_XSC
             -- [7] = 1 (BA) Fade to gray color bar
    --x"7135", -- SCALING_YSC (default)
    x"71B5", -- SCALING_YSC (default)
             -- [7]: test_pattern[1], works with test_pattern[0]
             --  00: No test output                            
             --  01: Shifting "1"
             --  10: 8-bar color bar
             --  11: Fade to gray color bar
             -- [7]: 1 -> 8-bar color bar (test_pattern[0]=0)
             -- [6:0]: default vertical scale factor
    --x"7222", -- SCALING_DCWCTR (down sampling by 4)
    x"7211", -- SCALING_DCWCTR (down sampling by 8)
             -- [7]=0: Vertical average calc truncation(default)
             -- [6]=0: Vertical truncation downsampling(default)
             -- [5:4]: Vertical down sampling rate
             -- [5:4]=01: Vertical down sampling by 2->QVGA
             -- [3]=0: Horztal average calc truncation(default)
             -- [2]=0: Horztal truncation downsampling(default)
             -- [1:0]: Horztal down sampling rate
             -- [1:0]=01: Horztal down sampling by 2->QVGA
    --x"73F2", -- SCALING_PCLK_DIV (divided by 4)
    x"73F1", -- SCALING_PCLK_DIV (divided by 8)
             -- [7:4]=F: Reserved, and manual says default is 0
             --          but Implementation Guide says F
             -- [3]=0: Enable clk divider for DSP scale control
             -- [2:0]=001: Divided by 2 -> QVGA       
    x"A202", -- SCALING_PCLK_DELAY (default)
             -- [7]: Reserved
             -- [6:0]=02: Default scaling ouput delay

    x"FFFF", -- FINISH CONDITION
    x"FFFF"  -- FINISH CONDITION
  );


  constant reg_rgb444 : mem_reg := (
    x"1280", -- 12:COM7
             -- [7]=1: Reset all registers to default values

    x"1180", -- CLKRC  6->0 External clock, pre-scale 
             --        [7]: 1 (reserved)
             --        [5:0]: Interal clock pre-scalar
             --           F(internal clk) = F(input clk)/([5:0]+1)
             --        [5:0]= 0: No prescale (internal clk)

    -- TOCHECK as in linux driver
    --x"1100", -- CLKRC  6->0 External clock, pre-scale 

    x"6B0A", -- DBLV  default 0A
             -- [7:6] = 00 : Bypass PLL
             -- [5]: reserved
             -- [4] = 0 : Enable internal regulator
             -- [3:0]: reserved 

    x"1204", -- 12:COM7
             -- [2,0]="10": Output format RGB 


    x"0901", -- 09:COM2 Common Control 2. Default: 01
             -- [7:5] : Reserved
             -- [4]   : Soft sleep mode
             -- [3:2] : Reserved
             -- [1:0] : output drive capability, to increase IOL/OH drive
             --   00: 1x
             --   01: 2x
             --   10: 3x
             --   11: 4x

    x"40F0", -- 40:COM15  Full 0-255 output, RGB 444
             -- [7:6] = 11: Full output range. 12 (C)
             -- [5:4] = x0: Normal RGB output (not we want) Seems: GRB422
             -- [5:4] = 11: RGB555 only if RGB444 is low, we want RGB444
             -- [3:0] = 0:  Reserved

    x"8C02", -- RGB444 Set RGB format: RGB444
             -- [1]= 1: RGB444 enable
             -- [0]= 0: word format: xR GB (chosen)
             -- [0]= 1: word format: RG Bx


    ------------------------ FROM LINUX DRIVER -----------------------
    -- Gamma curve values
    x"7A20", -- SLOP: Gamma Curve Highest segment Slope. Default: 24
             -- SLOP[7:0] = (0x100 - GAM15[7:0]x4/3
    x"7B10", -- GAM1: Gamma Curve 1st segment input end point 0x04 Output Value
             -- Default: 04
    x"7C1E", -- GAM2: Gamma Curve 2nd segment input end point 0x08 Output Value
             -- Default: 07
    x"7D35", -- GAM3: Gamma Curve 3rd segment input end point 0x10 Output Value
             -- Default: 10
    x"7E5A", -- GAM4: Gamma Curve 4th segment input end point 0x20 Output Value
             -- Default: 28
    x"7F69", -- GAM5: Gamma Curve 5th segment input end point 0x28 Output Value
             -- Default: 36
    x"8076", -- GAM6: Gamma Curve 6th segment input end point 0x30 Output Value
             -- Default: 44
    x"8180", -- GAM7: Gamma Curve 7th segment input end point 0x38 Output Value
             -- Default: 52
    x"8288", -- GAM8: Gamma Curve 8th segment input end point 0x40 Output Value
             -- Default: 60
    x"838F", -- GAM9: Gamma Curve 9th segment input end point 0x48 Output Value
             -- Default: 6C
    x"8496", -- GAM10: Gamma Curve 10th segment input endpoint 0x50 Output Value
             -- Default: 78
    x"85A3", -- GAM11: Gamma Curve 11th segment input endpoint 0x60 Output Value
             -- Default: 8C
    x"86AF", -- GAM12: Gamma Curve 12th segment input endpoint 0x70 Output Value
             -- Default: 9E
    x"87C4", -- GAM13: Gamma Curve 13th segment input endpoint 0x90 Output Value
             -- Default: BB
    x"88D7", -- GAM14: Gamma Curve 14th segment input endpoint 0xB0 Output Value
             -- Default: D2
    x"89E8", -- GAM15: Gamma Curve 15th segment input endpoint 0xD0 Output Value
             -- Default: E5

    ------------------------ FROM LINUX DRIVER -----------------------
    -- Automatic Gain Control (AGC) Automatic Exposure Control (AEC)
    -- AGC and AEC parameters. First these features are disabled, then
    -- turned on after tweaking the values (actually, what it is disabled
    -- is the AGC, AWB and AEC 

    x"13E0", -- COM8. Default 8F (1000 1111)
             -- Actual linux value is x"13E0", but bit 3 is reserved: 1 default
             -- [7]: Enable fast AGC/AEC algorithm
             -- [6]: AEC - Step size limit
             --    = 0 : Step size is limited to vertical blank
             --    = 1 : Unlimited Step
             -- [5]: Banding filter ON/OFF. To turn ON de banding filter
             --      BD50ST (0x9D) or BD60ST (0x9E) must be set to non zero
             --    = 0 : OFF
             --    = 1 : ON
             -- [4:3]: Reserved . Default 01
             -- [2]: AGC Enable -> OFF
             -- [1]: AWB Enable (Auto White Enable) -> OFF
             -- [0]: AEC Enable -> OFF
    x"0000", -- GAIN. AGC control gain setting (automatic gain control)
             -- default 00
    x"1000", -- AECH. Exposure value
             -- default 40
             -- [7:0]: AEC[9:2], see registers AECHH (0x07) for AEC[15:10]
             --                                COM1 (0x04) for AEC[1:0]
    x"0D40", -- COM4. Default 00
             -- [7:6]: reserved -> magic reserved bit -> 01
             -- [5:4]: AEC window, must be same as COM17[7:6] (0x42)
             --        00: Full window
             --        01: 1/2 window... does not change
    x"1418", -- COM9. Default  4A: 0100 1010
             --       selected 18: 0001 1000
             --       hamster  38: 0011 1000
             -- [7]: reserved 0
             -- [6:4]: Automatic Gain Ceiling - maximum AGC value
             --      = 000: 2x
             --      = 001: 4x -> selected
             --      = 010: 8x
             --      = 011: 16x -> hamster
             --      = ...
             --      = 100: 32x -> default
             -- [3:1]: Reserved (101) -> 100 selected magic
             -- [0]: Freeze AGC/AEC

    x"A505", -- BD50MAX: 50Hz Banding Step Limit. Default 0F
    x"AB07", -- BD60MAX: 60Hz Banding Step Limit. Default 0F
    x"2495", -- AEW: AGC/AEC Stable operation Region (upper limit). Default 75
    x"2533", -- AEW: AGC/AEC Stable operation Region (lower limit). Default 63
    x"26E3", -- VPT: AGC/AEC Fast Mode Operating Region. Default D4
    x"9F78", -- HAECC1: Histogram-based AGC/AEC Control 1. Default C0
    x"A068", -- HAECC2: Histogram-based AGC/AEC Control 2. Default 90
    x"A103", -- Reserved, default XX. magic
    x"A6D8", -- HAECC3: Histogram-based AGC/AEC Control 3. Default F0
    x"A7D8", -- HAECC4: Histogram-based AGC/AEC Control 4. Default C1
    x"A8F0", -- HAECC5: Histogram-based AGC/AEC Control 5. Default F0 <-
    x"A990", -- HAECC6: Histogram-based AGC/AEC Control 6. Default C1
    x"AA94", -- HAECC7: default 14
             -- [7]: AEC algorith selection
             --    = 0: Average-based AEC Algorithm   -> default
             --    = 1: Histogram-based AEC Algorithm -> selected
             -- [6:0]: reserved 001 0100 -> selected
    -- COM8 Again, turn on AGC and AEC
    x"13E5", -- COM8. Default  8F (1000 1111)
             -- COM8. Selected E5 (1110 0101)
             -- Actual linux value is x"13E0", but bit 3 is reserved: 1 default
             -- [7]: Enable fast AGC/AEC algorithm
             -- [6]: AEC - Step size limit
             --    = 0 : Step size is limited to vertical blank
             --    = 1 : Unlimited Step
             -- [5]: Banding filter ON/OFF. To turn ON de banding filter
             --      BD50ST (0x9D) or BD60ST (0x9E) must be set to non zero
             --    = 0 : OFF
             --    = 1 : ON
             -- [4:3]: Reserved . Default 01
             -- [2]: AGC Enable -> ON
             -- [1]: AWB Enable (Auto White Enable) -> OFF
             -- [0]: AEC Enable -> ON

    -- Almost all are magic
    x"0E61", -- COM5. Default XX (reserved)
    x"0F4B", -- COM6. Default 43 1000 0011
             --       Used    4B 1000 1011
             -- [7] = 0 Disable HREF at optical black
             -- [1] = 1 Resets timming when format changes
             -- others reserved
             -- [3] = 1 (reserved) 
             -- [0] = 1 (reserved) 
    x"1602", -- reserved
    x"1E37", -- MVFP Mirror/flip enable. Default 01
             -- [7:6]= 00 : reserved
             -- [5]= 1 : Mirror image (linux 0)
             -- [4]= 1 : Flip image   (linux 0)
             -- [3] : Reserved
             -- [2] : Black Sun Enable -> 1
             -- [1:0] : Reserved (01) - > 11
    x"2102", -- ADCCTR0 (reserved): default 02 
    x"2291", -- ADCCTR1 (reserved): default 01 
    x"2907", -- RSVD (reserved): default XX 
    x"330B", -- CHLF Array Current Control (reserved): default 08 
    x"350B", -- RSVD (reserved): default XX
    x"371D", -- ADC (reserved): default 3F
    x"3871", -- ACOM (reserved): default 01. ADC and Analog Common Mode Control
    x"392A", -- OFON (reserved): default 00. ADC Offset Control 
    x"3C78", -- COM12 (default 69)
             -- [7]= 0: No HREF when VSYNC is low
             -- [6:0]: Reserved
    x"4D40", -- RSVD (reserved): default XX
    x"4E20", -- RSVD (reserved): default XX
    x"6900", -- Fix Gain Control
             -- [7:6]: Fix Gain for Gr channel
             -- [5:4]: Fix Gain for Gb channel
             -- [3:2]: Fix Gain for R channel
             -- [1:0]: Fix Gain for B channel
             --  values:
             --  00: 1x
             --  01: 1.25x
             --  10: 1.5x
             --  11: 1.75x
    --x"6B0A", -- DBLV  default 0A (already done)
    x"7410", -- REG74 default 00
             -- [4]=1 : Digital Gain control by REG74[1:0]
             -- [1:0]=00: Bypass
    x"8D4F", -- RSVD (reserved): default XX
    x"8E00", -- RSVD (reserved): default XX
    x"8F00", -- RSVD (reserved): default XX
    x"9000", -- RSVD (reserved): default XX
    x"9100", -- RSVD (reserved): default XX
    x"9600", -- RSVD (reserved): default XX
    x"9A00", -- RSVD (reserved): default XX

    x"B084", -- recommended TFG (reserved)
    x"B10C", -- ABLC1: default 00. Automatic Black Level Calibration
             -- [3]=1 : Reserved -> 1
             -- [2]=1 : Enable ABLC
    x"B20E", -- RSVD (reserved): default XX
    x"B382", -- THL_ST: ABLC Target: default 80
             -- Lower limit of black leve +0x80
    x"B80A", -- RSVD (reserved): default XX

    x"430A", -- AWBC1 (reserved): default 14
    x"44F0", -- AWBC2 (reserved): default F0 <-
    x"4534", -- AWBC3 (reserved): default 45
    x"4658", -- AWBC4 (reserved): default 61
    x"4728", -- AWBC5 (reserved): default 51
    x"483A", -- AWBC6 (reserved): default 79

    x"5988", -- AWB Control (reserved): default XX
    x"5A88", -- AWB Control (reserved): default XX
    x"5B44", -- AWB Control (reserved): default XX
    x"5C67", -- AWB Control (reserved): default XX
    x"5D49", -- AWB Control (reserved): default XX
    x"5E0E", -- AWB Control (reserved): default XX

    x"6C0A", -- AWBCTR3. AWB Control 3: default 02
    x"6D55", -- AWBCTR2. AWB Control 2: default 55
    x"6E11", -- AWBCTR1. AWB Control 1: default C0
    x"6F9F", -- AWBCTR0. AWB Control 0: default 9A
             -- 9E for advance AWB
    x"6A40", -- GGAIN. G Channel AWB Gain. default 00
    x"0140", -- AWB Blue channel gain setting. default 80. Range 00-FF
    x"0260", -- AWB Red  channel gain setting. default 80. Range 00-FF

    -- COM8 Again, turn on AGC and AEC and AWB
    x"13E7", -- COM8. Default  8F (1000 1111)
             -- COM8. Selected E7 (1110 0111)
             -- Actual linux value is x"13E0", but bit 3 is reserved: 1 default
             -- [7]: Enable fast AGC/AEC algorithm
             -- [6]: AEC - Step size limit
             --    = 0 : Step size is limited to vertical blank
             --    = 1 : Unlimited Step
             -- [5]: Banding filter ON/OFF. To turn ON de banding filter
             --      BD50ST (0x9D) or BD60ST (0x9E) must be set to non zero
             --    = 0 : OFF
             --    = 1 : ON
             -- [4:3]: Reserved . Default 01. Used 00
             -- [2]: AGC Enable -> ON
             -- [1]: AWB Enable (Auto White Enable) -> ON
             -- [0]: AEC Enable -> ON

    -- Matrix color conversion
    x"4F80", -- MTX1  - Matrix Coefficient 1. default 40
    x"5080", -- MTX2  - Matrix Coefficient 2. default 34
    x"5100", -- MTX3  - Matrix Coefficient 3. default 0C
    x"5222", -- MTX4  - Matrix Coefficient 4. default 17
    x"535E", -- MTX5  - Matrix Coefficient 5. default 29
    x"5480", -- MTX6  - Matrix Coefficient 6. default 40
    x"589E", -- MTXS  - Matrix sign and auto contrast

    -- 
    x"4108", -- COM16. default 08
             -- [7:6]: reserved
             -- [5]: Enable edge enhancement for YUV
             -- [4]: denoise threshold enable
             -- [3]: AWB gain enable
             -- [2]: Reserved
             -- [1]: Color matrix coefficient double option
             --    = 0: original, =1: double
             -- [0]: Reserved
    x"3F00", -- EDGE. Edge Enhancement adjustment. default 00
             -- [7:5]: reserved
             -- [4:0]: edge enhancement factor
    x"7505", -- REG75. default 0F
             -- [7:5]: reserved
             -- [4:0]: edge enhancement lower limit
    x"76E5", -- REG76. default 01
             -- [7]: black pixel correction enable <- 1
             -- [6]: white pixel correction enable <- 1
             -- [5]: reserved <- 1
             -- [4:0]: edge enhancement higher limit 0 0101
    x"4C00", -- DNSTH. De-noise strength. default 00
    x"7701", -- REG77. default 10
             -- [7:0]: De-noise offset
    x"3DC2", -- COM13: default  88: 1000 1000
             --        selected C0: 1100 0010
             -- [7]=1 : Gamma enable (default)
             -- [6]=1 : UV Saturation Level - UV autoadjustment
             -- [5:1]: Reserved <- 00 0010 (changed)
             -- [0]: UV swap
    x"4B09", -- REG4B, default 00
             -- [7:1]: reserved -> changed
             -- [0]: UV average enable -> selected
    x"C960", -- SATCTR, saturationcontrol. default C0
             -- [7:4]: UV saturation control min. 1100 -> 0110
             -- [3:0]: UV saturation control result. 0000
    -- again COM16, enable
    x"4138", -- COM16. default 08
             -- [7:6]: reserved
             -- [5]: Enable edge enhancement for YUV -> ON
             -- [4]: denoise threshold enable        -> ON
             -- [3]: AWB gain enable
             -- [2]: Reserved
             -- [1]: Color matrix coefficient double option
             --    = 0: original, =1: double
             -- [0]: Reserved
    x"5640", -- Contrast Control. default 40
    x"3411", -- ARBLM. Array Reference Control. default 11 <-
    x"3B12", -- COM11. default 00
             --        selected C3: 0001 0010
             -- [7]: Night mode. = 0 Disabled
             --    = 1. Frame rate is reduced automatically while minimum 
             --         frame rate is limited by COM11[6:5].
             --         Also ADVFH adn ADVFL will be automatically uptaded
             -- [6:5]: Minimum frame rate of night mode
             --   00: same as normal mode frame rate <-
             --   01: 1/2 of normal mode frame rate
             --   10: 1/4 of normal mode frame rate
             --   11: 1/8 of normal mode frame rate
             -- [4]: D56 Auto
             --   0: disable 50/60 Hz auto detection
             --   1: enable 50/60 Hz auto detection <-
             -- [3]: Banding filter value select (only when COM11[4] = 0)
             --   0: Select BD60ST[7:0] (0x9E) as Banding Filter Value
             --   1: Select BD50ST[7:0] (0x9D) as Banding Filter Value
             -- [2]: reserved: 0 <-
             -- [1]: Exposure timing can be less than limit of banding filter
             --      when light is too strong <- 1
             -- [0]: reserved: 0 <-
    x"A488", -- NT_CTRL. default 00. Selected 1000 1000
             -- [7:4]: reserved: <- selected 1000 
             -- [3]: Auto frame rate adjustment control
             --   0: double exposure time
             --   1: reduce frame rate by half <-
             -- [2]: reserved: 0 <-
             -- [1:0]: Auto frame rate adjustment switch point
             --   00: inster dummy row at 2x gain <-
             --   01: inster dummy row at 4x gain
             --   10: inster dummy row at 8x gain
    x"9600", -- RSVD (reserved): default XX -- Again
    x"9730", -- RSVD (reserved): default XX
    x"9820", -- RSVD (reserved): default XX
    x"9930", -- RSVD (reserved): default XX
    x"9A84", -- RSVD (reserved): default XX
    x"9B29", -- RSVD (reserved): default XX
    x"9C03", -- RSVD (reserved): default XX
    x"9D4C", -- BD50ST: 50Hz banding filter value. default 99
             -- efective only when COM8[5]=1 and COM11[3]=1
    x"9E3F", -- BD60ST: 60Hz banding filter value. default 7F
             -- efective only when COM8[5]=1 and COM11[3]=0
    x"7804", -- RSVD (reserved): default XX

    -- extra weird stuff, some sort of multiplexor register
    x"7901", -- RSVD (reserved): default XX
    x"C8F0", -- RSVD (reserved): default XX
   
    x"790F", -- RSVD (reserved): default XX
    x"C8F0", -- RSVD (reserved): default XX

    x"7910", -- RSVD (reserved): default XX
    x"C87E", -- RSVD (reserved): default XX

    x"790A", -- RSVD (reserved): default XX
    x"C880", -- RSVD (reserved): default XX

    x"790B", -- RSVD (reserved): default XX
    x"C801", -- RSVD (reserved): default XX

    x"790C", -- RSVD (reserved): default XX
    x"C80F", -- RSVD (reserved): default XX

    x"790D", -- RSVD (reserved): default XX
    x"C820", -- RSVD (reserved): default XX

    x"7909", -- RSVD (reserved): default XX
    x"C880", -- RSVD (reserved): default XX

    x"7902", -- RSVD (reserved): default XX
    x"C8C0", -- RSVD (reserved): default XX

    x"7903", -- RSVD (reserved): default XX
    x"C840", -- RSVD (reserved): default XX

    x"7905", -- RSVD (reserved): default XX
    x"C830", -- RSVD (reserved): default XX

    x"7926", -- RSVD (reserved): default XX





 
    ------
             

    --x"1500", -- COM10 Use HREF not hSYNC
    x"1520", -- COM10 Use HREF not hSYNC
             -- [6]=0: Use HREF not HSYNC
             -- [5]=1 pclk does not toggle during horizontal blank
             -- others default
    --x"1700", -- HSTART HREF start high 8-bit. For windowing. Dont want to do
    x"1711", -- HSTART HREF start high 8-bit. The first pixels flicker
    x"1800", -- HSTOP HREF end high 8-bit. For windowing. Dont want to do
    x"1900", -- VSTRT VREF start high 8-bit. For windowing. Dont want to do
    x"1A00", -- VSTOP VREF end high 8-bit. For windowing. Dont want to do
    x"3200", -- HREF Control
             -- [7:6] : HREF edge offset to data ouput
             -- [5:3] : HREF end LSB (high 8MSB at HSTOP)
             -- [2:0] : HREF start LSB (high 8MSB at HSTART)

    


   --QVGA
    x"0C04", -- COM3
             -- [3]=1 scale enable (for QQVGA/2)
             -- [2]=0 DCW disable
    x"3E19", -- COM14
             -- [4]=1 : Scaling PCLK enable (also DCW)
             -- [3]=1 : Manual scaling enable (QVGA)
             -- [2:0] PCLK divided when COM14[4]=1
             -- [2:0]-> 001: pclk divided by 2 -> QVGA: 320x480 
    x"703A", -- SCALING_XSC 
             -- [7]: test_pattern[0], works with test_pattern[1]
             --  00: No test output  <-
             --  01: Shifting "1"
             --  10: 8-bar color bar
             --  11: Fade to gray color bar
             -- [7]: 0 -> No test pattern (test_pattern[1]=0)
             -- [6:0]: default horizontal scale factor
    --x"70BA", -- SCALING_XSC
             -- [7] = 1 (BA) Fade to gray color bar
    --x"7135", -- SCALING_YSC (default)
    x"7135", -- SCALING_YSC (default)
             -- [7]: test_pattern[1], works with test_pattern[0]
             --  00: No test output <-                         
             --  01: Shifting "1"
             --  10: 8-bar color bar
             --  11: Fade to gray color bar
             -- [7]: 0 -> No test pattern (test_pattern[0]=0)
             -- [6:0]: default vertical scale factor
    --x"7222", -- SCALING_DCWCTR (down sampling by 4)
    x"7211", -- SCALING_DCWCTR (down sampling by 8)
             -- [7]=0: Vertical average calc truncation(default)
             -- [6]=0: Vertical truncation downsampling(default)
             -- [5:4]: Vertical down sampling rate
             -- [5:4]=01: Vertical down sampling by 2->QVGA
             -- [5:4]=11: Vertical down sampling by 8->QQVGA/2
             -- [3]=0: Horztal average calc truncation(default)
             -- [2]=0: Horztal truncation downsampling(default)
             -- [1:0]: Horztal down sampling rate
             -- [1:0]=01: Horztal down sampling by 2->QVGA
    --x"73F2", -- SCALING_PCLK_DIV (divided by 4)
    x"73F1", -- SCALING_PCLK_DIV (divided by 8)
             -- [7:4]=F: Reserved, and manual says default is 0
             --          but Implementation Guide says F
             -- [3]=0: Enable clk divider for DSP scale control
             -- [2:0]=001: Divided by 2 -> QVGA  
    x"A202", -- SCALING_PCLK_DELAY (default)
             -- [7]: Reserved
             -- [6:0]=02: Default scaling ouput delay

    x"FFFF", -- FINISH CONDITION
    x"FFFF"  -- FINISH CONDITION
  );



  constant reg_yuv422_test : mem_reg := (
    x"1280", -- 12:COM7
             -- [7]=1: Reset all registers to default values
    x"1200", -- 12:COM7
             -- [2,0]="00": Output format YUV 
    x"0901", -- 09:COM2 Common Control 2. Default: 01
             -- [7:5] : Reserved
             -- [4]   : Soft sleep mode
             -- [3:2] : Reserved
             -- [1:0] : output drive capability, to increase IOL/OH drive
             --   00: 1x
             --   01: 2x
             --   10: 3x
             --   11: 4x

    x"40C0", -- 40:COM15  Full 0-255 output, YUV
                -- [7:6] = 11: Full output range. 12 (C)
                -- [5:4] = x0: Normal RGB output and YUV
                -- [5:4] = 11: RGB 55 only if RGB444 is low
                -- [3:0] = 0:  Reserved

    x"8C00", -- RGB444 Set RGB format: RGB444 (not in RGB44-> default)
             -- [1]= '1' RGB444 enable
             -- [0]= '0' word format: xR GB
    x"1180", -- CLKRC  6->0 External clock, pre-scale
             --        [7]: 1 (reserved)
             --        [5:0]: Interal clock pre-scalar
             --           F(internal clk) = F(input clk)/([5:0]+1)
             --        [5:0]= 0: no prescale (internal clk)
    x"0F43", -- COM6  
                -- [7] = 0 Disable HREF at optical black
                -- [1] = 1 Resets timming when format changes
                -- others reserved

    --x"1500", -- COM10 Use HREF not hSYNC
    x"1520", -- COM10 Use HREF not hSYNC
             -- [6]=0: Use HREF not HSYNC
             -- [5]=1 pclk does not toggle during horizontal blank
             -- others default
    --x"1700", -- HSTART HREF start high 8-bit. For windowing. Dont want to do
    x"1711", -- HSTART HREF start high 8-bit. The first pixels flicker
    x"1800", -- HSTOP HREF end high 8-bit. For windowing. Dont want to do
    x"1900", -- VSTRT VREF start high 8-bit. For windowing. Dont want to do
    x"1A00", -- VSTOP VREF end high 8-bit. For windowing. Dont want to do
    x"3200", -- HREF Control
             -- [7:6] : HREF edge offset to data ouput
             -- [5:3] : HREF end LSB (high 8MSB at HSTOP)
             -- [2:0] : HREF start LSB (high 8MSB at HSTART)

    x"3A04", -- TLSB: Line buffer test option (default 0C)
             -- [7:6] : reserved
             -- [5]   : negative image enable
             -- [5]=0 : Normal image 
             -- [4]=0 : Use normal UV output
             -- [3]   : Output sequence with COM13[1]
             --      TSLB[3], COM13[1]:
             --    00: Y U Y V
             --    01: Y U Y V
             --    10: U Y V Y
             --    11: V Y U Y

   --QVGA
    x"0C04", -- COM3
             -- [3]=1 scale enable (for QQVGA/2)
             -- [2]=0 DCW disable
    x"3E19", -- COM14
             -- [4]=1 : Scaling PCLK enable (also DCW)
             -- [3]=1 : Manual scaling enable (QVGA)
             -- [2:0] PCLK divided when COM14[4]=1
             -- [2:0]-> 011: pclk divided by 8 -> QQVGA/2: 80x60   
    x"703A", -- SCALING_XSC 
             -- [7]: test_pattern[0], works with test_pattern[1]
             --  00: No test output                            
             --  01: Shifting "1"
             --  10: 8-bar color bar
             --  11: Fade to gray color bar
             -- [7]: 0 -> 8-bar color bar (test_pattern[1]=1)
             -- [6:0]: default horizontal scale factor
    --x"70BA", -- SCALING_XSC
             -- [7] = 1 (BA) Fade to gray color bar
    --x"7135", -- SCALING_YSC (default)
    x"71B5", -- SCALING_YSC (default)
             -- [7]: test_pattern[1], works with test_pattern[0]
             --  00: No test output                            
             --  01: Shifting "1"
             --  10: 8-bar color bar
             --  11: Fade to gray color bar
             -- [7]: 1 -> 8-bar color bar (test_pattern[0]=0)
             -- [6:0]: default vertical scale factor
    --x"7222", -- SCALING_DCWCTR (down sampling by 4)
    x"7211", -- SCALING_DCWCTR (down sampling by 8)
             -- [7]=0: Vertical average calc truncation(default)
             -- [6]=0: Vertical truncation downsampling(default)
             -- [5:4]: Vertical down sampling rate
             -- [5:4]=11: Vertical down sampling by 8->QQVGA/2
             -- [3]=0: Horztal average calc truncation(default)
             -- [2]=0: Horztal truncation downsampling(default)
             -- [1:0]: Horztal down sampling rate
             -- [1:0]=11: Horztal down sampling by 8->QQVGA/2
    --x"73F2", -- SCALING_PCLK_DIV (divided by 4)
    x"73F1", -- SCALING_PCLK_DIV (divided by 8)
             -- [7:4]=F: Reserved, and manual says default is 0
             --          but Implementation Guide says F
             -- [3]=0: Enable clk divider for DSP scale control
             -- [2:0]=001: Divided by 2 -> QVGA       
    x"A202", -- SCALING_PCLK_DELAY (default)
             -- [7]: Reserved
             -- [6:0]=02: Default scaling ouput delay

    x"FFFF", -- FINISH CONDITION
    x"FFFF"  -- FINISH CONDITION
  );


  constant reg_yuv422 : mem_reg := (
    x"1280", -- 12:COM7
             -- [7]=1: Reset all registers to default values
    x"1200", -- 12:COM7
             -- [2,0]="00": Output format YUV 
    x"0901", -- 09:COM2 Common Control 2. Default: 01
             -- [7:5] : Reserved
             -- [4]   : Soft sleep mode
             -- [3:2] : Reserved
             -- [1:0] : output drive capability, to increase IOL/OH drive
             --   00: 1x
             --   01: 2x
             --   10: 3x
             --   11: 4x

    x"40C0", -- 40:COM15  Full 0-255 output, YUV
                -- [7:6] = 11: Full output range. 12 (C)
                -- [5:4] = x0: Normal RGB output and YUV
                -- [5:4] = 11: RGB 55 only if RGB444 is low
                -- [3:0] = 0:  Reserved

    x"8C00", -- RGB444 Set RGB format: RGB444 (not in RGB44-> defaul)
             -- [1]= '1' RGB444 enable
             -- [0]= '0' word format: xR GB
    x"1180", -- CLKRC  6->0 External clock, pre-scale
             --        [7]: 1 (reserved)
             --        [5:0]: Interal clock pre-scalar
             --           F(internal clk) = F(input clk)/([5:0]+1)
             --        [5:0]= 0: no prescale (internal clk)
    x"0F43", -- COM6  ** check 0F4B
                -- [7] = 0 Disable HREF at optical black
                -- [1] = 1 Resets timming when format changes
                -- others reserved
                -- [3] = 1 (reserved) hamster


    -- check
    -- x"1E37", -- MVFP Mirror/flip enable. Default 00
             -- [7:6]= 00 : reserved
             -- [5]= 1 : Mirror image
             -- [4]= 1 : Flip image
             -- [3] : Reserved
             -- [2] : Black Sun Enable
             -- [1:0] : Reserved

    -- check
    -- x"3DC0", -- COM13: default 88
              -- [7]=1 : Gamma enable (defaul)
              -- [6]=1 : UV Saturation Level - UV autoadjustment
              -- [5:1]: Reserved
              -- [0]: UV swap

    --x"1500", -- COM10 Use HREF not hSYNC
    x"1520", -- COM10 Use HREF not hSYNC
             -- [6]=0: Use HREF not HSYNC
             -- [5]=1 pclk does not toggle during horizontal blank
             -- others default
    --x"1700", -- HSTART HREF start high 8-bit. For windowing. Dont want to do
    x"1711", -- HSTART HREF start high 8-bit. The first pixels flicker
    x"1800", -- HSTOP HREF end high 8-bit. For windowing. Dont want to do
    x"1900", -- VSTRT VREF start high 8-bit. For windowing. Dont want to do
    x"1A00", -- VSTOP VREF end high 8-bit. For windowing. Dont want to do
    x"3200", -- HREF Control
             -- [7:6] : HREF edge offset to data ouput
             -- [5:3] : HREF end LSB (high 8MSB at HSTOP)
             -- [2:0] : HREF start LSB (high 8MSB at HSTART)

    x"3A04", -- TLSB: Line buffer test option (default 0C)
             -- [7:6] : reserved
             -- [5]   : negative image enable
             -- [5]=0 : Normal image 
             -- [4]=0 : Use normal UV output
             -- [3]   : Output sequence with COM13[1]
             --      TSLB[3], COM13[1]:
             --    00: Y U Y V
             --    01: Y U Y V
             --    10: U Y V Y
             --    11: V Y U Y


   --QVGA
    x"0C04", -- COM3
             -- [3]=1 scale enable (for QQVGA/2)
             -- [2]=0 DCW disable
    x"3E19", -- COM14
             -- [4]=1 : Scaling PCLK enable (also DCW)
             -- [3]=1 : Manual scaling enable (QVGA)
             -- [2:0] PCLK divided when COM14[4]=1
             -- [2:0]-> 011: pclk divided by 8 -> QQVGA/2: 80x60   
    x"703A", -- SCALING_XSC 
             -- [7]: test_pattern[0], works with test_pattern[1]
             --  00: No test output                            
             --  01: Shifting "1"
             --  10: 8-bar color bar
             --  11: Fade to gray color bar
             -- [7]: 0 -> No test pattern (test_pattern[1]=0)
             -- [6:0]: default horizontal scale factor
    --x"70BA", -- SCALING_XSC
             -- [7] = 1 (BA) Fade to gray color bar
    --x"7135", -- SCALING_YSC (default)
    x"7135", -- SCALING_YSC (default)
             -- [7]: test_pattern[1], works with test_pattern[0]
             --  00: No test output                            
             --  01: Shifting "1"
             --  10: 8-bar color bar
             --  11: Fade to gray color bar
             -- [7]: 0 -> No test pattern (test_pattern[0]=0)
             -- [6:0]: default vertical scale factor
    --x"7222", -- SCALING_DCWCTR (down sampling by 4)
    x"7211", -- SCALING_DCWCTR (down sampling by 8)
             -- [7]=0: Vertical average calc truncation(default)
             -- [6]=0: Vertical truncation downsampling(default)
             -- [5:4]: Vertical down sampling rate
             -- [5:4]=11: Vertical down sampling by 8->QQVGA/2
             -- [3]=0: Horztal average calc truncation(default)
             -- [2]=0: Horztal truncation downsampling(default)
             -- [1:0]: Horztal down sampling rate
             -- [1:0]=11: Horztal down sampling by 8->QQVGA/2
    --x"73F2", -- SCALING_PCLK_DIV (divided by 4)
    x"73F1", -- SCALING_PCLK_DIV (divided by 8)
             -- [7:4]=F: Reserved, and manual says default is 0
             --          but Implementation Guide says F
             -- [3]=0: Enable clk divider for DSP scale control
             -- [2:0]=001: Divided by 2 -> QVGA       
    x"A202", -- SCALING_PCLK_DELAY (default)
             -- [7]: Reserved
             -- [6:0]=02: Default scaling ouput delay

    x"FFFF", -- FINISH CONDITION
    x"FFFF"  -- FINISH CONDITION
  );



  -- frequency divider for camera clk (divide by 4) 
  --signal cnt_cam_clk : unsigned (1 downto 0);
  -- frequency divider for camera clk (divide by 8) 
  signal cnt_cam_clk : unsigned (2 downto 0);

  -- 6 bits: less than 64 registers to be written, change if the number
  -- of registers to be written change
  signal cnt_reg : unsigned (7 downto 0);

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

  type ctrl_states is (
                        RSTCAM_ST,    -- Reset camera during 300ms
                        WAIT_RSTCAM_ST, -- wait camera during 300ms to be ready
                        WAIT_ST,      -- waiting to send, until not busy
                        WRITE_REG_ST, -- sending the initial sequence
                        DONE_ST       -- all the registers written
                      ); 

  signal pr_ctrl_st, nx_ctrl_st  : ctrl_states;  -- present state, next state

  -- save the switch values to see if the have changed
  signal sw_regs_st : std_logic_vector (1 downto 0);
  signal sw_regs_change : std_logic;

  signal end300ms : std_logic;
  signal ena_cnt300ms : std_logic;
  signal cnt300ms : unsigned (24 downto 0);
  constant C_END300MS : integer := 30000000; -- 30 millions


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
      if cnt_cam_clk = "011" then
        cnt_cam_clk <= (others => '0');
      else
        cnt_cam_clk <= cnt_cam_clk + 1;
      end if;
    end if;
  end process;

  -- when cnt_cam_clk = 0 | 1 => '0', when 2 | 3 => '1'
  ov7670_clk <= cnt_cam_clk(1);

  -- camera reset and power down
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
          reg_i <= reg_rgb444(to_integer(unsigned(cnt_reg)));
        when "01" => 
          reg_i <= reg_yuv422(to_integer(unsigned(cnt_reg)));
        when "10" => 
          reg_i <= reg_rgb444_test(to_integer(unsigned(cnt_reg)));
        when others =>  -- 11
          reg_i <= reg_yuv422_test(to_integer(unsigned(cnt_reg)));
      end case;
    end if;
  end process;

  -- FSM sequential process
  P_fsm_seq: process(rst,clk)
  begin
    if rst = c_on then
      pr_ctrl_st <= RSTCAM_ST;
    elsif clk'event and clk='1' then
      pr_ctrl_st <= nx_ctrl_st;
    end if;
  end process;


  -- FSM combinatorial process
  P_fsm_comb: process(pr_ctrl_st, alltx_done, sccb_ready, test_mode, test_send,
                      end300ms)
  begin
    -- default values
    nx_ctrl_st <= pr_ctrl_st;
    start_tx_aux <= '0';
    ov7670_rst_n <= '1'; --inactive camera reset
    ena_cnt300ms <= '0';
    case  pr_ctrl_st is
      when RSTCAM_ST => -- reset camera
        ov7670_rst_n <= '0'; --active camera reset
        ena_cnt300ms <= '1';
        if end300ms = '1' then
          nx_ctrl_st <= WAIT_RSTCAM_ST;
        end if;
      when WAIT_RSTCAM_ST => -- reset camera
        ena_cnt300ms <= '1';
        if end300ms = '1' then
          nx_ctrl_st <= WAIT_ST;
        end if;
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
        ena_cnt300ms <= '1';
        if end300ms = '1' then
          nx_ctrl_st <= WAIT_ST;
        end if;
      when DONE_ST => -- writting a new register
        if alltx_done = '0' then -- in case of resend = '1'
          nx_ctrl_st <= RSTCAM_ST;
        end if;
    end case;
  end process;

  P_cnt300ms: process(rst, clk)
  begin
    if rst = c_on then
      cnt300ms <= (others =>'0');
    elsif clk'event and clk='1' then
      if ena_cnt300ms = '0' then
        cnt300ms <= (others =>'0');
      else -- enabled
        if end300ms = '1' then
          cnt300ms <= (others =>'0');
        else
          cnt300ms <= cnt300ms + 1;
        end if;
      end if;
    end if;
  end process;

  end300ms <= '1' when cnt300ms = C_END300MS else '0';



end behav;

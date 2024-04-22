-------------------------------------------------------------------------------
---
---  CHIPS - 2.0 Simple Web App Demo
---
---  :Author: Jonathan P Dawson
---  :Date: 04/04/2014
---  :email: chips@jondawson.org.uk
---  :license: MIT
---  :Copyright: Copyright (C) Jonathan P Dawson 2014
---
--------------------------------------------------------------------------------
---
---           +--------------+
---           | CLOCK TREE   |
---           +--------------+
---           |              >-- CLK1   (50MHz) ---> CLK
--- CLK_IN >-->              |
---           |              >-- CLK2   (100MHz)
---           |              |                     +-------+
---           |              +-- CLK3   (125MHz) ->+ ODDR2 +-->[GTXCLK]
---           |              |                     |       |
---           |              +-- CLK3_N (125MHZ) ->+       |
---           |              |                     +-------+
--- RST >----->              >-- CLK4   (200MHz)
---           |              |
---           |              |
---           |              |  CLK >--+--------+
---           |              |         |        |
---           |              |      +--v-+   +--v-+
---           |              |      |    |   |    |
---           |       LOCKED >------>    >--->    >-------> INTERNAL_RESET
---           |              |      |    |   |    |
---           +--------------+      +----+   +----+
---
---              +-------------+               
---              | USER DESIGN |
---              +-------------+
---              |             |
---              |             <-------< SWITCHES
---              |             |
---              |             >-------> LEDS
---              |             |               
---              |             <-------< BUTTONS
---              |             |
---              |             >-------> SEVEN_SEGMENT_CATHODE
---              |             |
---              |             >-------> SEVEN_SEGMENT_ANNODE
---              |             |
---              |             |     +--------------+
---              |             |     | UART         |
---              |             |     +--------------+
---              |             >----->              >-----> RS232-TX
---              |             |     |              |
---              |             |     |              <-------< RS232-RX
---              +---v-----^---+     +--------------+          
---                  |     |
---                  |     |
---              +---v-----^---+           
---              | ETHERNET    |           
---              | MAC         |           
---              +-------------+           
---              |             +------> [PHY_RESET]           
---              |             |           
---[RXCLK] ----->+             +------> [TXCLK]           
---              |             |           
---              |             |                       
---              |             |           
---  [RXD] ----->+             +------> [TXD]
---              |             |           
--- [RXDV] ----->+             +------> [TXEN]           
---              |             |           
--- [RXER] ----->+             +------> [TXER]           
---              |             |           
---              |             |
---              +-------------+
---

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity BSP is
  port(
   CLK_IN                : in    std_logic;       
   RST                   : in    std_logic;       

   --PHY INTERFACE
   ETH_CLK               : out   std_logic;     
   PHY_RESET_N           : out   std_logic;       

   RXDV                  : in    std_logic;       
   RXER                  : in    std_logic;       
   RXD                   : in    std_logic_vector(1 downto 0);

   TXD                   : out   std_logic_vector(1 downto 0);
   TXEN                  : out   std_logic;      

   JC                    : inout std_logic_vector(7 downto 0);

   --I2C
   SDA                   : inout std_logic;
   SCL                   : inout std_logic;

   --PS2 keyboard interface
   KD                    : in  std_logic;
   KC                    : in  std_logic;

   --radio interface
   RF_P                  : in std_logic;
   RF_N                  : in std_logic;
   RF_OUT                : out std_logic;

   --AUDIO interface
   AUDIO                 : out std_logic;
   AUDIO_EN              : out std_logic;

   --VGA interface
   VGA_R                 : out Std_logic_vector(3 downto 0);
   VGA_G                 : out Std_logic_vector(3 downto 0);
   VGA_B                 : out Std_logic_vector(3 downto 0);
   HSYNCH                : out Std_logic;
   VSYNCH                : out Std_logic;

   --LEDS
   GPIO_LEDS             : out std_logic_vector(15 downto 0);   
   GPIO_SWITCHES         : in  std_logic_vector(15 downto 0);   
   GPIO_BUTTONS          : in  std_logic_vector(4 downto 0);   

   --RGB LED
   LED_R_PWM             : out std_logic;
   LED_G_PWM             : out std_logic;
   LED_B_PWM             : out std_logic;

   SEVEN_SEGMENT_CATHODE : out std_logic_vector(6 downto 0);
   SEVEN_SEGMENT_ANNODE  : out std_logic_vector(7 downto 0);

   --RS232 INTERFACE
   RS232_RX              : in std_logic;
   RS232_TX              : out std_logic
  );
end entity BSP;

architecture RTL of BSP is

  component rmii_ethernet is
    port(

      CLK         : in  std_logic;
      RST         : in  std_logic;

      ETH_CLK     : in  std_logic;
      PHY_RESET   : out std_logic; 

      --MII IF
      TXD         : out std_logic_vector(1 downto 0);
      TXER        : out std_logic;
      TXEN        : out std_logic;

      RXD         : in  std_logic_vector(1 downto 0);
      RXER        : in  std_logic;
      RXDV        : in  std_logic;

      --RX STREAM
      TX          : in  std_logic_vector(15 downto 0);
      TX_STB      : in  std_logic;
      TX_ACK      : out std_logic;

      --RX STREAM
      RX          : out std_logic_vector(15 downto 0);
      RX_STB      : out std_logic;
      RX_ACK      : in  std_logic
    );
  end component rmii_ethernet;

  component radio is
  port(
    clk : in std_logic;
    rst : in std_logic;
    
    rf : in std_logic;
    rf_out : out std_logic;

    --Frequency control input
    frequency : in std_logic_vector(31 downto 0);
    frequency_stb : in std_logic;
    frequency_ack : out std_logic;

    --Average samples
    average_samples : in std_logic_vector(31 downto 0);
    average_samples_stb : in std_logic;
    average_samples_ack : out std_logic;

    --Audio output
    am : out std_logic_vector(31 downto 0);
    am_stb : out std_logic;
    am_ack : in std_logic;

    fm : out std_logic_vector(31 downto 0);
    fm_stb : out std_logic;
    fm_ack : in std_logic

  );
  end component radio;

  component CHARSVGA is
    port ( 

    CLK        : in  Std_logic;
    DATA       : in  Std_logic_vector(31 downto 0);
    DATA_ACK   : out Std_logic;
    DATA_STB   : in  Std_logic;
    
    --VGA interface
    VGACLK     : in  Std_logic;
    RST        : in  Std_logic;
    R          : out Std_logic;
    G          : out Std_logic;
    B          : out Std_logic;
    HSYNCH     : out Std_logic;
    VSYNCH     : out Std_logic
    );
  end component CHARSVGA;

  component PWM is
    generic(
      MAX_VAL : integer := 256;
      CLOCK_DIVIDER : integer := 256
    );
    port(
      CLK : in std_logic;

      DATA : in std_logic_vector(31 downto 0);
      DATA_STB : in std_logic;
      DATA_ACK : out std_logic;

      OUT_BIT : out std_logic
    );
  end component PWM;

  component KEYBOARD is
    port (
    CLK      : in  Std_logic;
    RST      : in  Std_logic;

    DATA_STB : out Std_logic;
    DATA_ACK : in  Std_logic;
    DATA     : out Std_logic_vector (31 downto 0);
    
    KD      : in  Std_logic;
    KC      : in  Std_logic
    );
  end component KEYBOARD;

  component I2C is
    generic(
      CLOCKS_PER_SECOND : integer := 100000000;
      SPEED : integer := 100000
    );
    port(
      CLK : in std_logic;
      RST : in std_logic;
 
      SDA : inout std_logic;
      SCL : inout std_logic;

      I2C_IN : in std_logic_vector(31 downto 0);
      I2C_IN_STB : in std_logic;
      I2C_IN_ACK : out std_logic;
 
      I2C_OUT : out std_logic_vector(31 downto 0);
      I2C_OUT_STB : out std_logic;
      I2C_OUT_ACK : in std_logic
    );
  end component I2C;

  component USER_DESIGN is
    port(
      CLK : in std_logic;
      RST : in std_logic;
    
      OUTPUT_LEDS : out std_logic_vector(31 downto 0);
      OUTPUT_LEDS_STB : out std_logic;
      OUTPUT_LEDS_ACK : in std_logic;

      INPUT_SWITCHES : in std_logic_vector(31 downto 0);
      INPUT_SWITCHES_STB : in std_logic;
      INPUT_SWITCHES_ACK : out std_logic;

      INPUT_BUTTONS : in std_logic_vector(31 downto 0);
      INPUT_BUTTONS_STB : in std_logic;
      INPUT_BUTTONS_ACK : out std_logic;

      OUTPUT_VGA : out  Std_logic_vector(31 downto 0);
      OUTPUT_VGA_ACK : in Std_logic;
      OUTPUT_VGA_STB : out  Std_logic;

      OUTPUT_AUDIO : out std_logic_vector(31 downto 0);
      OUTPUT_AUDIO_STB : out std_logic;
      OUTPUT_AUDIO_ACK : in std_logic;

      output_radio_frequency : out std_logic_vector(31 downto 0);
      output_radio_frequency_stb : out std_logic;
      output_radio_frequency_ack : in std_logic;

      output_radio_average_samples : out std_logic_vector(31 downto 0);
      output_radio_average_samples_stb : out std_logic;
      output_radio_average_samples_ack : in std_logic;

      input_radio_am : in std_logic_vector(31 downto 0);
      input_radio_am_stb : in std_logic;
      input_radio_am_ack : out std_logic;

      input_radio_fm : in std_logic_vector(31 downto 0);
      input_radio_fm_stb : in std_logic;
      input_radio_fm_ack : out std_logic;

      OUTPUT_LED_R : out std_logic_vector(31 downto 0);
      OUTPUT_LED_R_STB : out std_logic;
      OUTPUT_LED_R_ACK : in std_logic;
      OUTPUT_LED_G : out std_logic_vector(31 downto 0);
      OUTPUT_LED_G_STB : out std_logic;
      OUTPUT_LED_G_ACK : in std_logic;
      OUTPUT_LED_B : out std_logic_vector(31 downto 0);
      OUTPUT_LED_B_STB : out std_logic;
      OUTPUT_LED_B_ACK : in std_logic;

      OUTPUT_SEVEN_SEGMENT_CATHODE : out std_logic_vector(31 downto 0);
      OUTPUT_SEVEN_SEGMENT_CATHODE_STB : out std_logic;
      OUTPUT_SEVEN_SEGMENT_CATHODE_ACK : in std_logic;

      OUTPUT_SEVEN_SEGMENT_ANNODE : out std_logic_vector(31 downto 0);
      OUTPUT_SEVEN_SEGMENT_ANNODE_STB : out std_logic;
      OUTPUT_SEVEN_SEGMENT_ANNODE_ACK : in std_logic;

      INPUT_PS2 : in std_logic_vector(31 downto 0);
      INPUT_PS2_STB : in std_logic;
      INPUT_PS2_ACK : out std_logic;

      INPUT_I2C : in std_logic_vector(31 downto 0);
      INPUT_I2C_STB : in std_logic;
      INPUT_I2C_ACK : out std_logic;
      OUTPUT_I2C : out std_logic_vector(31 downto 0);
      OUTPUT_I2C_STB : out std_logic;
      OUTPUT_I2C_ACK : in std_logic;

      --ETH RX STREAM
      INPUT_ETH_RX : in std_logic_vector(31 downto 0);
      INPUT_ETH_RX_STB : in std_logic;
      INPUT_ETH_RX_ACK : out std_logic;

      --ETH TX STREAM
      OUTPUT_ETH_TX : out std_logic_vector(31 downto 0);
      OUTPUT_ETH_TX_STB : out std_logic;
      OUTPUT_ETH_TX_ACK : in std_logic;

      --RS232 RX STREAM
      INPUT_RS232_RX : in std_logic_vector(31 downto 0);
      INPUT_RS232_RX_STB : in std_logic;
      INPUT_RS232_RX_ACK : out std_logic;

      --RS232 TX STREAM
      OUTPUT_RS232_TX : out std_logic_vector(31 downto 0);
      OUTPUT_RS232_TX_STB : out std_logic;
      OUTPUT_RS232_TX_ACK : in std_logic


    );
  end component;

  component SERIAL_INPUT is
    generic(
      CLOCK_FREQUENCY : integer;
      BAUD_RATE       : integer
    );
    port(
      CLK      : in std_logic;
      RST      : in std_logic;
      RX       : in std_logic;
     
      OUT1     : out std_logic_vector(7 downto 0);
      OUT1_STB : out std_logic;
      OUT1_ACK : in  std_logic
    );
  end component SERIAL_INPUT;

  component SERIAL_OUTPUT is
    generic(
      CLOCK_FREQUENCY : integer;
      BAUD_RATE       : integer
    );
    port(
      CLK     : in std_logic;
      RST     : in  std_logic;
      TX      : out std_logic;
     
      IN1     : in std_logic_vector(7 downto 0);
      IN1_STB : in std_logic;
      IN1_ACK : out std_logic
    );
  end component serial_output;

  component pwm_audio is
    generic(
      CLOCK_FREQUENCY : integer := 100000000;
      SAMPLE_RATE : integer := 6104;
      AUDIO_BITS : integer := 8
    );
    port(
      CLK : in std_logic;
      RST : in std_logic;

      DATA_IN : in std_logic_vector(31 downto 0);
      DATA_IN_STB : in std_logic;
      DATA_IN_ACK : out std_logic;

      AUDIO : out std_logic

    );
  end component pwm_audio;

  --chips signals
  signal CLK : std_logic;

  --clock tree signals
  signal clkin1            : std_logic;
  -- Output clock buffering
  signal clkfb             : std_logic;
  signal clk0              : std_logic;
  signal clk2x             : std_logic;
  signal clkfx             : std_logic;
  signal clkfx180          : std_logic;
  signal clkdv             : std_logic;
  signal clkfbout          : std_logic;
  signal locked_internal   : std_logic;
  signal status_internal   : std_logic_vector(7 downto 0);
  signal CLK_OUT1          : std_logic;
  signal CLK_OUT2          : std_logic;
  signal CLK_OUT3          : std_logic;
  signal CLK_OUT3_N        : std_logic;
  signal CLK_OUT4          : std_logic;
  signal NOT_LOCKED        : std_logic;
  signal RST_INV           : std_logic;
  signal INTERNAL_RST      : std_logic;


  --GPIO signals
  signal OUTPUT_LEDS : std_logic_vector(31 downto 0);
  signal OUTPUT_LEDS_STB : std_logic;
  signal OUTPUT_LEDS_ACK : std_logic;

  signal INPUT_SWITCHES : std_logic_vector(31 downto 0);
  signal INPUT_SWITCHES_STB : std_logic;
  signal INPUT_SWITCHES_ACK : std_logic;
  signal GPIO_SWITCHES_D : std_logic_vector(15 downto 0);

  signal INPUT_BUTTONS : std_logic_vector(31 downto 0);
  signal INPUT_BUTTONS_STB : std_logic;
  signal INPUT_BUTTONS_ACK : std_logic;
  signal GPIO_BUTTONS_D : std_logic_vector(4 downto 0);

  --SEVEN SEGMENT DISPLAY STREAM
  signal OUTPUT_SEVEN_SEGMENT_CATHODE : std_logic_vector(31 downto 0);
  signal OUTPUT_SEVEN_SEGMENT_CATHODE_STB : std_logic;
  signal OUTPUT_SEVEN_SEGMENT_CATHODE_ACK : std_logic;
  signal OUTPUT_SEVEN_SEGMENT_ANNODE : std_logic_vector(31 downto 0);
  signal OUTPUT_SEVEN_SEGMENT_ANNODE_STB : std_logic;
  signal OUTPUT_SEVEN_SEGMENT_ANNODE_ACK : std_logic;

  --AUDIO
  signal OUTPUT_AUDIO : std_logic_vector(31 downto 0);
  signal OUTPUT_AUDIO_STB : std_logic;
  signal OUTPUT_AUDIO_ACK :  std_logic;

  --RADIO
  signal  rf : std_logic;

  --Frequency control input
  signal  output_radio_frequency : std_logic_vector(31 downto 0);
  signal  output_radio_frequency_stb : std_logic;
  signal  output_radio_frequency_ack : std_logic;

  --Average samples
  signal  output_radio_average_samples : std_logic_vector(31 downto 0);
  signal  output_radio_average_samples_stb : std_logic;
  signal  output_radio_average_samples_ack : std_logic;

  --Audio output
  signal  input_radio_am : std_logic_vector(31 downto 0);
  signal  input_radio_am_stb : std_logic;
  signal  input_radio_am_ack : std_logic;
  signal  input_radio_fm : std_logic_vector(31 downto 0);
  signal  input_radio_fm_stb : std_logic;
  signal  input_radio_fm_ack : std_logic;

  --Interface for SVGA
  signal VGACLK : std_logic;
  signal VGA_RR : std_logic;
  signal VGA_GG : std_logic;
  signal VGA_BB : std_logic;
  signal OUTPUT_VGA : std_logic_vector(31 downto 0);
  signal OUTPUT_VGA_ACK : std_logic;
  signal OUTPUT_VGA_STB : std_logic;

  --PS2 interface for kb/mouse
  signal PS2_STB : std_logic;
  signal PS2_ACK : std_logic;
  signal PS2 : std_logic_vector (31 downto 0);

  --I2C interface for temperature monitor
  signal INPUT_I2C : std_logic_vector(31 downto 0);
  signal INPUT_I2C_STB : std_logic;
  signal INPUT_I2C_ACK : std_logic;
  signal OUTPUT_I2C : std_logic_vector(31 downto 0);
  signal OUTPUT_I2C_STB : std_logic;
  signal OUTPUT_I2C_ACK : std_logic;

  --ETH TX STREAM
  signal ETH_TX          : std_logic_vector(31 downto 0);
  signal ETH_TX_STB      : std_logic;
  signal ETH_TX_ACK      : std_logic;
  
  --ETH RX STREAM
  signal ETH_RX          : std_logic_vector(31 downto 0);
  signal ETH_RX_STB      : std_logic;
  signal ETH_RX_ACK      : std_logic;

  --RS232 RX STREAM
  signal INPUT_RS232_RX : std_logic_vector(31 downto 0);
  signal INPUT_RS232_RX_STB : std_logic;
  signal INPUT_RS232_RX_ACK : std_logic;

  --RS232 TX STREAM
  signal OUTPUT_RS232_TX : std_logic_vector(31 downto 0);
  signal OUTPUT_RS232_TX_STB : std_logic;
  signal OUTPUT_RS232_TX_ACK : std_logic;

  --tri color LED signals
  signal LED_R : std_logic_vector(31 downto 0);
  signal LED_R_STB : std_logic;
  signal LED_R_ACK : std_logic;
  signal LED_G : std_logic_vector(31 downto 0);
  signal LED_G_STB : std_logic;
  signal LED_G_ACK : std_logic;
  signal LED_B : std_logic_vector(31 downto 0);
  signal LED_B_STB : std_logic;
  signal LED_B_ACK : std_logic;

begin


  ethernet_inst_1 : rmii_ethernet port map(
      CLK         => CLK,
      RST         => INTERNAL_RST,

      --GMII IF
      ETH_CLK     => CLK_OUT1,

      TXD         => TXD,
      TXER        => open,
      TXEN        => TXEN,

      PHY_RESET   => PHY_RESET_N,

      RXD         => RXD,
      RXER        => RXER,
      RXDV        => RXDV,

      --RX STREAM
      TX          => ETH_TX(15 downto 0),
      TX_STB      => ETH_TX_STB,
      TX_ACK      => ETH_TX_ACK,

      --RX STREAM
      RX          => ETH_RX(15 downto 0),
      RX_STB      => ETH_RX_STB,
      RX_ACK      => ETH_RX_ACK
    );

  CHARSVGA_INST_1 : CHARSVGA port map( 

    CLK => CLK,
    DATA => OUTPUT_VGA,
    DATA_ACK => OUTPUT_VGA_ACK,
    DATA_STB => OUTPUT_VGA_STB,
    
    --VGA interface
    VGACLK => VGACLK,
    RST => INTERNAL_RST,
    R => VGA_RR,
    G => VGA_GG,
    B => VGA_BB,
    HSYNCH => HSYNCH,
    VSYNCH => VSYNCH
  );

  generate_vga : for I in 0 to 3 generate
    VGA_R(I) <= VGA_RR;
    VGA_G(I) <= VGA_GG;
    VGA_B(I) <= VGA_BB;
  end generate;

  radio_inst_1 : radio port map (
    clk => clk,
    rst => internal_rst,
    
    rf => rf,
    rf_out => rf_out,

    --Frequency control input
    frequency => output_radio_frequency,
    frequency_stb => output_radio_frequency_stb,
    frequency_ack => output_radio_frequency_ack,

    --Average samples
    average_samples => output_radio_average_samples,
    average_samples_stb => output_radio_average_samples_stb,
    average_samples_ack => output_radio_average_samples_ack,

    --Audio output
    am => input_radio_am,
    am_stb => input_radio_am_stb,
    am_ack => input_radio_am_ack,

    fm => input_radio_fm,
    fm_stb => input_radio_fm_stb,
    fm_ack => input_radio_fm_ack
  );
  
  ibufds_inst_1 : ibufds port map(
    i => rf_p,
    ib => rf_n,
    o => rf
  );

  pwm_audio_inst_1 : pwm_audio 
  generic map(
      CLOCK_FREQUENCY => 100000000,
      --SAMPLE_RATE => 12207,
      SAMPLE_RATE => 48828,
      AUDIO_BITS => 10
  ) port map (
      CLK => CLK,
      RST => INTERNAL_RST,

      DATA_IN => OUTPUT_AUDIO,
      DATA_IN_STB => OUTPUT_AUDIO_STB,
      DATA_IN_ACK => OUTPUT_AUDIO_ACK,

      AUDIO => AUDIO

  );
  AUDIO_EN <= '1';
  JC(0) <= OUTPUT_AUDIO_STB;
  JC(1) <= OUTPUT_AUDIO_ACK;

  USER_DESIGN_INST_1 : USER_DESIGN port map(
      CLK => CLK,
      RST => INTERNAL_RST,
    
      --GPIO interfaces
      OUTPUT_LEDS => OUTPUT_LEDS,
      OUTPUT_LEDS_STB => OUTPUT_LEDS_STB,
      OUTPUT_LEDS_ACK => OUTPUT_LEDS_ACK,

      INPUT_SWITCHES => INPUT_SWITCHES,
      INPUT_SWITCHES_STB => INPUT_SWITCHES_STB,
      INPUT_SWITCHES_ACK => INPUT_SWITCHES_ACK,

      INPUT_BUTTONS => INPUT_BUTTONS,
      INPUT_BUTTONS_STB => INPUT_BUTTONS_STB,
      INPUT_BUTTONS_ACK => INPUT_BUTTONS_ACK,

      --VGA interfave
      OUTPUT_VGA => OUTPUT_VGA,
      OUTPUT_VGA_ACK => OUTPUT_VGA_ACK,
      OUTPUT_VGA_STB => OUTPUT_VGA_STB,

      --TRI color LED interface
      OUTPUT_LED_R => LED_R,
      OUTPUT_LED_R_STB => LED_R_STB,
      OUTPUT_LED_R_ACK => LED_R_ACK,
      OUTPUT_LED_G => LED_G,
      OUTPUT_LED_G_STB => LED_G_STB,
      OUTPUT_LED_G_ACK => LED_G_ACK,
      OUTPUT_LED_B => LED_B,
      OUTPUT_LED_B_STB => LED_B_STB,
      OUTPUT_LED_B_ACK => LED_B_ACK,

      --RS232 RX STREAM
      INPUT_RS232_RX => INPUT_RS232_RX,
      INPUT_RS232_RX_STB => INPUT_RS232_RX_STB,
      INPUT_RS232_RX_ACK => INPUT_RS232_RX_ACK,

      --RS232 TX STREAM
      OUTPUT_RS232_TX => OUTPUT_RS232_TX,
      OUTPUT_RS232_TX_STB => OUTPUT_RS232_TX_STB,
      OUTPUT_RS232_TX_ACK => OUTPUT_RS232_TX_ACK,

      --AUDIO OUT
      OUTPUT_AUDIO => OUTPUT_AUDIO,
      OUTPUT_AUDIO_STB => OUTPUT_AUDIO_STB,
      OUTPUT_AUDIO_ACK => OUTPUT_AUDIO_ACK,

      --radio interface
      output_radio_frequency => output_radio_frequency,
      output_radio_frequency_stb => output_radio_frequency_stb,
      output_radio_frequency_ack => output_radio_frequency_ack,

      output_radio_average_samples => output_radio_average_samples,
      output_radio_average_samples_stb => output_radio_average_samples_stb,
      output_radio_average_samples_ack => output_radio_average_samples_ack,

      input_radio_am => input_radio_am,
      input_radio_am_stb => input_radio_am_stb,
      input_radio_am_ack => input_radio_am_ack,

      input_radio_fm => input_radio_fm,
      input_radio_fm_stb => input_radio_fm_stb,
      input_radio_fm_ack => input_radio_fm_ack,

      --SEVEN SEGMENT DISPLAY INTERFACE
      OUTPUT_SEVEN_SEGMENT_CATHODE => OUTPUT_SEVEN_SEGMENT_CATHODE,
      OUTPUT_SEVEN_SEGMENT_CATHODE_STB => OUTPUT_SEVEN_SEGMENT_CATHODE_STB,
      OUTPUT_SEVEN_SEGMENT_CATHODE_ACK => OUTPUT_SEVEN_SEGMENT_CATHODE_ACK,
      OUTPUT_SEVEN_SEGMENT_ANNODE => OUTPUT_SEVEN_SEGMENT_ANNODE,
      OUTPUT_SEVEN_SEGMENT_ANNODE_STB => OUTPUT_SEVEN_SEGMENT_ANNODE_STB,
      OUTPUT_SEVEN_SEGMENT_ANNODE_ACK => OUTPUT_SEVEN_SEGMENT_ANNODE_ACK,
     
      --PS2 KEYBOAD INTERFACE
      INPUT_PS2_STB => PS2_STB,
      INPUT_PS2_ACK => PS2_ACK,
      INPUT_PS2 => PS2,

      --I2C interface for temperature monitor
      INPUT_I2C      => OUTPUT_I2C,
      INPUT_I2C_STB  => OUTPUT_I2C_STB,
      INPUT_I2C_ACK  => OUTPUT_I2C_ACK,
      OUTPUT_I2C     => INPUT_I2C,
      OUTPUT_I2C_STB => INPUT_I2C_STB,
      OUTPUT_I2C_ACK => INPUT_I2C_ACK,

      --ETH RX STREAM
      INPUT_ETH_RX => ETH_RX,
      INPUT_ETH_RX_STB => ETH_RX_STB,
      INPUT_ETH_RX_ACK => ETH_RX_ACK,

      --ETH TX STREAM
      OUTPUT_ETH_TX => ETH_TX,
      OUTPUT_ETH_TX_STB => ETH_TX_STB,
      OUTPUT_ETH_TX_ACK => ETH_TX_ACK

  );

  SERIAL_OUTPUT_INST_1 : SERIAL_OUTPUT generic map(
      CLOCK_FREQUENCY => 100000000,
      BAUD_RATE       => 115200
  )port map(
      CLK     => CLK,
      RST     => INTERNAL_RST,
      TX      => RS232_TX,
     
      IN1     => OUTPUT_RS232_TX(7 downto 0),
      IN1_STB => OUTPUT_RS232_TX_STB,
      IN1_ACK => OUTPUT_RS232_TX_ACK
  );

  SERIAL_INPUT_INST_1 : SERIAL_INPUT generic map(
      CLOCK_FREQUENCY => 100000000,
      BAUD_RATE       => 115200
  ) port map (
      CLK      => CLK,
      RST      => INTERNAL_RST,
      RX       => RS232_RX,
     
      OUT1     => INPUT_RS232_RX(7 downto 0),
      OUT1_STB => INPUT_RS232_RX_STB,
      OUT1_ACK => INPUT_RS232_RX_ACK
  );

  INPUT_RS232_RX(15 downto 8) <= (others => '0');

  I2C_INST_1 : I2C generic map(
      CLOCKS_PER_SECOND => 100000000,
      SPEED => 10000
  ) port map (
      CLK => CLK,
      RST => INTERNAL_RST,
 
      SDA => SDA,
      SCL => SCL,

      I2C_IN => INPUT_I2C,
      I2C_IN_STB => INPUT_I2C_STB,
      I2C_IN_ACK =>INPUT_I2C_ACK,
 
      I2C_OUT => OUTPUT_I2C,
      I2C_OUT_STB => OUTPUT_I2C_STB,
      I2C_OUT_ACK => OUTPUT_I2C_ACK
  );

  PWM_INST_1 : PWM generic map(
      MAX_VAL => 255,
      CLOCK_DIVIDER => 1000
  ) port map (
      CLK => CLK,

      DATA => LED_R,
      DATA_STB => LED_R_STB,
      DATA_ACK => LED_R_ACK,

      OUT_BIT => LED_R_PWM
  );

  PWM_INST_2 : PWM generic map(
      MAX_VAL => 255,
      CLOCK_DIVIDER => 1000
  ) port map (
      CLK => CLK,

      DATA => LED_G,
      DATA_STB => LED_G_STB,
      DATA_ACK => LED_G_ACK,

      OUT_BIT => LED_G_PWM
  );

  PWM_INST_3 : PWM generic map(
      MAX_VAL => 255,
      CLOCK_DIVIDER => 1000
  ) port map (
      CLK => CLK,

      DATA => LED_B,
      DATA_STB => LED_B_STB,
      DATA_ACK => LED_B_ACK,

      OUT_BIT => LED_B_PWM
  );

  KEYBOARD_INST1 : KEYBOARD port map(
    CLK => CLK,
    RST => INTERNAL_RST,

    DATA_STB => PS2_STB,
    DATA_ACK => PS2_ACK,
    DATA => PS2,
    
    KD => KD,
    KC => KC
  );

  process
  begin
    wait until rising_edge(CLK);
    NOT_LOCKED <= not LOCKED_INTERNAL;
    INTERNAL_RST <= NOT_LOCKED;
   
    if OUTPUT_LEDS_STB = '1' then
       GPIO_LEDS <= OUTPUT_LEDS(15 downto 0);
    end if;
    OUTPUT_LEDS_ACK <= '1';

    if OUTPUT_SEVEN_SEGMENT_ANNODE_STB = '1' then
       SEVEN_SEGMENT_ANNODE <= not OUTPUT_SEVEN_SEGMENT_ANNODE(7 downto 0);
    end if;
    OUTPUT_SEVEN_SEGMENT_ANNODE_ACK <= '1';

    if OUTPUT_SEVEN_SEGMENT_CATHODE_STB = '1' then
       SEVEN_SEGMENT_CATHODE <= not OUTPUT_SEVEN_SEGMENT_CATHODE(6 downto 0);
    end if;
    OUTPUT_SEVEN_SEGMENT_CATHODE_ACK <= '1';

    INPUT_SWITCHES_STB <= '1';
    GPIO_SWITCHES_D <= GPIO_SWITCHES;
    INPUT_SWITCHES <= (others => '0');
    INPUT_SWITCHES(15 downto 0) <= GPIO_SWITCHES_D;

    INPUT_BUTTONS_STB <= '1';
    GPIO_BUTTONS_D <= GPIO_BUTTONS;
    INPUT_BUTTONS <= (others => '0');
    INPUT_BUTTONS(4 downto 0) <= GPIO_BUTTONS_D;

  end process;


  -------------------------
  -- Output     Output     
  -- Clock     Freq (MHz)  
  -------------------------
  -- CLK_OUT1    50.000    
  -- CLK_OUT2   100.000    
  -- CLK_OUT3   125.000    
  -- CLK_OUT4   200.000    

  ----------------------------------
  -- Input Clock   Input Freq (MHz) 
  ----------------------------------
  -- primary         100.000        


  -- Input buffering
  --------------------------------------
  clkin1_buf : IBUFG
  port map
   (O  => clkin1,
    I  => CLK_IN);


  -- Clocking primitive
  --------------------------------------
  -- Instantiation of the DCM primitive
  --    * Unused inputs are tied off
  --    * Unused outputs are labeled unused
  dcm_sp_inst: DCM_SP
  generic map
   (CLKDV_DIVIDE          => 2.000,
    CLKFX_DIVIDE          => 4,
    CLKFX_MULTIPLY        => 5,
    CLKIN_DIVIDE_BY_2     => FALSE,
    CLKIN_PERIOD          => 10.0,
    CLKOUT_PHASE_SHIFT    => "NONE",
    CLK_FEEDBACK          => "1X",
    DESKEW_ADJUST         => "SYSTEM_SYNCHRONOUS",
    PHASE_SHIFT           => 0,
    STARTUP_WAIT          => FALSE)
  port map
   -- Input clock
   (CLKIN                 => clkin1,
    CLKFB                 => clkfb,
    -- Output clocks
    CLK0                  => clk0,
    CLK90                 => open,
    CLK180                => open,
    CLK270                => open,
    CLK2X                 => clk2x,
    CLK2X180              => open,
    CLKFX                 => clkfx,
    CLKFX180              => clkfx180,
    CLKDV                 => clkdv,
   -- Ports for dynamic phase shift
    PSCLK                 => '0',
    PSEN                  => '0',
    PSINCDEC              => '0',
    PSDONE                => open,
   -- Other control and status signals
    LOCKED                => LOCKED_INTERNAL,
    STATUS                => status_internal,
    RST                   => RST_INV,
   -- Unused pin, tie low
    DSSEN                 => '0');

  -- Output buffering
  -------------------------------------
  clkfb <= CLK_OUT2;

  BUFG_INST1 : BUFG
  port map
   (O   => CLK_OUT1,
    I   => clkdv);

  BUFG_INST2 : BUFG
  port map
   (O   => CLK_OUT2,
    I   => clk0);

  BUFG_INST3 : BUFG
  port map
   (O   => CLK_OUT3,
    I   => clkfx);
  
  BUFG_INST4 : BUFG
  port map
   (O   => CLK_OUT3_N,
    I   => clkfx180);

  BUFG_INST5 : BUFG
  port map
   (O   => CLK_OUT4,
    I   => clk2x);
    
  RST_INV <= not RST;
  ETH_CLK <= CLK_OUT1;
  VGACLK <= CLK_OUT1;
  

  -- Chips CLK frequency selection
  -------------------------------------
  --CLK <= CLK_OUT1; --50 MHz
  CLK <= CLK_OUT2; --100 MHz
  --CLK <= CLK_OUT3; --125 MHz
  --CLK <= CLK_OUT4; --200 MHz

end architecture RTL;

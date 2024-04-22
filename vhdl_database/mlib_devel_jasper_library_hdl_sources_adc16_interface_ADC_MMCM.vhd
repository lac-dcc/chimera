----------------------------------------------------------------------------
-- Import useful libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

-- entity declaraction
entity  ADC_MMCM  is
    generic (
               ADC_RESOLUTION     : integer  := 8
    );
    port (
               -- System
               reset        :  in  std_logic;
               locked       :  out std_logic;

               -- Clock inputs
               clkin        :  in  std_logic;

               -- Clock outputs
               clkout0p     :  out std_logic; -- serial line clock (line_clk)
               clkout0n     :  out std_logic;
               clkout1p     :  out std_logic; -- framing clock (frame_clk = line_clk/8)
               clkout1n     :  out std_logic;
               clkout2      :  out std_logic; -- fabric clock (2 * frame_clk) @   0 degrees phase
               clkout2_90   :  out std_logic; -- fabric clock (2 * frame_clk) @  90 degrees phase
               clkout2_180  :  out std_logic; -- fabric clock (2 * frame_clk) @ 180 degrees phase
               clkout2_270  :  out std_logic  -- fabric clock (2 * frame_clk) @ 270 degrees phase
    );

end  ADC_MMCM;

architecture ADC_MMCM_arc of ADC_MMCM is

     -- Components

     component IBUFGDS port (
      O     : out std_logic;
      I     : in  std_logic;
      IB    : in  std_logic
     );
     end component;

     component MMCM_ADV generic (
      BANDWIDTH            : string;
      CLKOUT4_CASCADE      : boolean;
      CLOCK_HOLD           : boolean;
      COMPENSATION         : string;
      STARTUP_WAIT         : boolean;
      DIVCLK_DIVIDE        : integer;
      CLKFBOUT_MULT_F      : real;
      CLKFBOUT_PHASE       : real;
      CLKFBOUT_USE_FINE_PS : boolean;
      CLKOUT0_DIVIDE_F     : real;
      CLKOUT0_PHASE        : real;
      CLKOUT0_DUTY_CYCLE   : real;
      CLKOUT0_USE_FINE_PS  : boolean;
      CLKOUT1_DIVIDE       : integer;
      CLKOUT1_PHASE        : real;
      CLKOUT1_DUTY_CYCLE   : real;
      CLKOUT1_USE_FINE_PS  : boolean;
      CLKOUT2_DIVIDE       : integer;
      CLKOUT2_PHASE        : real;
      CLKOUT2_DUTY_CYCLE   : real;
      CLKOUT2_USE_FINE_PS  : boolean;
      CLKOUT3_DIVIDE       : integer;
      CLKOUT3_PHASE        : real;
      CLKOUT3_DUTY_CYCLE   : real;
      CLKOUT3_USE_FINE_PS  : boolean;
      --CLKIN1_PERIOD        : real;
      REF_JITTER1          : real
      );
     port (
      CLKFBOUT     : out std_logic;
      CLKFBOUTB    : out std_logic;
      CLKOUT0      : out std_logic;
      CLKOUT0B     : out std_logic;
      CLKOUT1      : out std_logic;
      CLKOUT1B     : out std_logic;
      CLKOUT2      : out std_logic;
      CLKOUT2B     : out std_logic;
      CLKOUT3      : out std_logic;
      CLKOUT3B     : out std_logic;
      CLKOUT4      : out std_logic;
      CLKOUT5      : out std_logic;
      CLKOUT6      : out std_logic;
      CLKFBIN      : in  std_logic;
      CLKIN1       : in  std_logic;
      CLKIN2       : in  std_logic;
      CLKINSEL     : in  std_logic;
      DADDR        : in  std_logic_vector(6 downto 0);
      DCLK         : in  std_logic;
      DEN          : in  std_logic;
      DI           : in  std_logic_vector(15 downto 0);
      DO           : out std_logic_vector(15 downto 0);
      DRDY         : out std_logic;
      DWE          : in  std_logic;
      PSCLK        : in  std_logic;
      PSEN         : in  std_logic;
      PSINCDEC     : in  std_logic;
      PSDONE       : out std_logic;
      LOCKED       : out std_logic;
      CLKINSTOPPED : out std_logic;
      CLKFBSTOPPED : out std_logic;
      PWRDWN       : in  std_logic;
      RST          : in  std_logic
      );
     end component;

     -- BUFG Signals
     signal ibufgds_clkinp  : std_logic;
     signal ibufgds_clkinn  : std_logic;
     signal ibufgds_clkout  : std_logic;

     -- MMCM Signals
     signal mmcm_clkfbout   : std_logic;
     signal mmcm_clkout0    : std_logic;
     signal mmcm_clkout0b   : std_logic;
     signal mmcm_clkout1    : std_logic;
     signal mmcm_clkout1b   : std_logic;
     signal mmcm_clkout2    : std_logic;
     signal mmcm_clkout2_90  : std_logic;
     signal mmcm_clkout2_180 : std_logic;
     signal mmcm_clkout2_270 : std_logic;
     signal mmcm_clkfbin    : std_logic;
     signal mmcm_clkin      : std_logic;
     signal mmcm_locked     : std_logic;
     signal mmcm_reset      : std_logic;

     constant CLK_MUL : REAL := 8.0;
     constant CLK_DIV : Integer := 4;
     constant CLK0_DIV : Real := CLK_MUL/Real(CLK_DIV);
     constant CLK1_DIV : Integer := Integer(CLK0_DIV*(Real(ADC_RESOLUTION)/4.0)*2.0);
     constant CLK2_DIV : Integer := Integer(CLK0_DIV*(Real(ADC_RESOLUTION)/4.0));

     begin

     -- Signal routing

     mmcm_reset <= reset;
     locked <= mmcm_locked;

     mmcm_clkin <= clkin;
     mmcm_clkfbin <= mmcm_clkfbout;

     clkout0p <= mmcm_clkout0;
     clkout0n <= mmcm_clkout0b;
     clkout1p <= mmcm_clkout1;
     clkout1n <= mmcm_clkout1b;
     clkout2  <= mmcm_clkout2;
     clkout2_90  <= mmcm_clkout2_90;
     clkout2_180 <= mmcm_clkout2_180;
     clkout2_270 <= mmcm_clkout2_270;

     -- Clock input from adc @ around 1GHz
     mmcm_adv_inst : MMCM_ADV
     GENERIC MAP (
      BANDWIDTH            => "OPTIMIZED",
      CLKOUT4_CASCADE      => false,
      CLOCK_HOLD           => false,
      COMPENSATION         => "ZHOLD",
      STARTUP_WAIT         => false,
      DIVCLK_DIVIDE        => CLK_DIV,  -- D = 2
      CLKFBOUT_MULT_F      => CLK_MUL,  -- M = 5.000
      CLKFBOUT_PHASE       => 0.000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKOUT0_DIVIDE_F     => CLK0_DIV, -- Fout = (M * Fin) / (D * 2.500) = Fin (when D=2, M=5)
      CLKOUT0_PHASE        => 0.000,
      CLKOUT0_DUTY_CYCLE   => 0.500,
      CLKOUT0_USE_FINE_PS  => false,
      CLKOUT1_DIVIDE       => CLK1_DIV, -- Fout = (M * Fin) / (D * 10) = Fin / 4 (when D=2, M=5)
      CLKOUT1_PHASE        => 0.000,
      CLKOUT1_DUTY_CYCLE   => 0.500,
      CLKOUT1_USE_FINE_PS  => false,
      CLKOUT2_DIVIDE       => CLK2_DIV, -- Fout = (M * Fin) / (D * 4) = Fin / 2 (when D=2, M=5)
      CLKOUT2_PHASE        => 0.000,
      CLKOUT2_DUTY_CYCLE   => 0.500,
      CLKOUT2_USE_FINE_PS  => false,
      CLKOUT3_DIVIDE       => CLK2_DIV, -- Fout = (M * Fin) / (D * 4) = Fin / 2 (when D=2, M=5)
      CLKOUT3_PHASE        => 90.000,
      CLKOUT3_DUTY_CYCLE   => 0.500,
      CLKOUT3_USE_FINE_PS  => false,
      -- CLKIN1_PERIOD        => 2.500, -- 400 MHz (should be calculated from user input)
      REF_JITTER1          => 0.010

      --BANDWIDTH            => "OPTIMIZED",
      --CLKOUT4_CASCADE      => false,
      --CLOCK_HOLD           => false,
      --COMPENSATION         => "ZHOLD",
      --STARTUP_WAIT         => false,
      --DIVCLK_DIVIDE        => 1,
      --CLKFBOUT_MULT_F      => 6.000,
      --CLKFBOUT_PHASE       => 0.000,
      --CLKFBOUT_USE_FINE_PS => false,
      --CLKOUT0_DIVIDE_F     => 6.000,
      --CLKOUT0_PHASE        => 0.000,
      --CLKOUT0_DUTY_CYCLE   => 0.500,
      --CLKOUT0_USE_FINE_PS  => true,
      --CLKOUT1_DIVIDE       => 12,
      --CLKOUT1_PHASE        => 0.000,
      --CLKOUT1_DUTY_CYCLE   => 0.500,
      --CLKOUT1_USE_FINE_PS  => true,
      --CLKOUT2_DIVIDE       => 3,
      --CLKOUT2_PHASE        => 0.250,
      --CLKOUT2_DUTY_CYCLE   => 0.500,
      --CLKOUT2_USE_FINE_PS  => true,
      --CLKIN1_PERIOD        => 5.000,
      --REF_JITTER1          => 0.010


      )
     PORT MAP (
      CLKFBOUT     => mmcm_clkfbout,
      CLKFBOUTB    => open,
      CLKOUT0      => mmcm_clkout0,
      CLKOUT0B     => mmcm_clkout0b,
      CLKOUT1      => mmcm_clkout1,
      CLKOUT1B     => mmcm_clkout1b,
      CLKOUT2      => mmcm_clkout2,
      CLKOUT2B     => mmcm_clkout2_180,
      CLKOUT3      => mmcm_clkout2_90,
      CLKOUT3B     => mmcm_clkout2_270,
      CLKOUT4      => open,
      CLKOUT5      => open,
      CLKOUT6      => open,
      -- Input clock control
      CLKFBIN      => mmcm_clkfbin,
      CLKIN1       => mmcm_clkin,
      CLKIN2       => '0',
      -- Tied to always select the primary input clock
      CLKINSEL     => '1',
      -- Ports for dynamic reconfiguration
      DADDR        => (OTHERS => '0'),
      DCLK         => '0',
      DEN          => '0',
      DI           => (OTHERS => '0'),
      DO           => open,
      DRDY         => open,
      DWE          => '0',
      -- Ports for dynamic phase shift
      PSCLK        => '0',
      PSEN         => '0',
      PSINCDEC     => '0',
      PSDONE       => open,
      -- Other control and status signals
      LOCKED       => mmcm_locked,
      CLKINSTOPPED => open,
      CLKFBSTOPPED => open,
      PWRDWN       => '0',
      RST          => mmcm_reset
      );

end ADC_MMCM_arc;


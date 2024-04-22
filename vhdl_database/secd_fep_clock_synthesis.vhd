-- Clock synthesis

-- This module generates the 25 Mhz pixel clock and the 12.5 Mhz CPU clock
-- using two DCMs.  The outputs are fed into BUFGs.

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
-- synopsys translate_off
library UNISIM;
use UNISIM.Vcomponents.ALL;
-- synopsys translate_on

entity clock_synthesis is
  port ( clk_30mhz : in  std_logic; 
         vdu_clk   : out std_logic;
         cpu_clk   : out std_logic;
         locked    : out std_logic);
end clock_synthesis;

architecture BEHAVIORAL of clock_synthesis is
  signal clkfb_in        : std_logic;
  signal vdu_clk_buf     : std_logic;
  signal vdu_clk_out     : std_logic;
  signal cpu_clk_buf     : std_logic;
  signal cpu_clk_int     : std_logic;
  signal vdu_clkin_ibufg : std_logic;
  signal feedback_buf    : std_logic;
  signal vdu_clk_locked  : std_logic;
  signal cpu_clk_locked  : std_logic;
  signal gnd1            : std_logic;

  component BUFG
    port ( I : in    std_logic; 
           O : out   std_logic);
  end component;
  
  component IBUFG
    port ( I : in    std_logic; 
           O : out   std_logic);
  end component;
  
  -- Period Jitter with noise (unit interval) for block DCM_INST = 0.04 UI
  -- Period Jitter with noise (Peak-to-Peak) for block DCM_INST = 0.86 ns
  component DCM
    generic( CLK_FEEDBACK : string :=  "1X";
             CLKDV_DIVIDE : real :=  2.000000;
             CLKFX_DIVIDE : integer :=  1;
             CLKFX_MULTIPLY : integer := 4;
             CLKIN_DIVIDE_BY_2 : boolean :=  FALSE;
             CLKIN_PERIOD : real :=  10.000000;
             CLKOUT_PHASE_SHIFT : string :=  "NONE";
             DESKEW_ADJUST : string :=  "SYSTEM_SYNCHRONOUS";
             DFS_FREQUENCY_MODE : string :=  "LOW";
             DLL_FREQUENCY_MODE : string :=  "LOW";
             DUTY_CYCLE_CORRECTION : boolean :=  TRUE;
             FACTORY_JF : bit_vector :=  x"C080";
             PHASE_SHIFT : integer :=  0;
             STARTUP_WAIT : boolean :=  TRUE;
             DSS_MODE : string :=  "NONE");
    port ( CLKIN    : in    std_logic; 
           CLKFB    : in    std_logic; 
           RST      : in    std_logic; 
           PSEN     : in    std_logic; 
           PSINCDEC : in    std_logic; 
           PSCLK    : in    std_logic; 
           DSSEN    : in    std_logic; 
           CLK0     : out   std_logic; 
           CLK90    : out   std_logic; 
           CLK180   : out   std_logic; 
           CLK270   : out   std_logic; 
           CLKDV    : out   std_logic; 
           CLK2X    : out   std_logic; 
           CLK2X180 : out   std_logic; 
           CLKFX    : out   std_logic; 
           CLKFX180 : out   std_logic; 
           STATUS   : out   std_logic_vector (7 downto 0); 
           LOCKED   : out   std_logic; 
           PSDONE   : out   std_logic);
  end component;
  
begin

  GND1 <= '0';

  vdu_clkin_ibufg_inst : ibufg
    port map (i => clk_30mhz,
              o => vdu_clkin_ibufg);
  
  vdu_clk_bufg_inst : bufg
    port map (i => vdu_clk_buf,
              o => vdu_clk_out);
  
  cpu_clk_bufg_inst : bufg
    port map (i => cpu_clk_buf,
              o => cpu_clk_int);
  
  feedback_bufg_inst : bufg
    port map (i => feedback_buf,
              o => clkfb_in);

  vdu_clk_dcm : dcm
    generic map( clk_feedback  =>  "1X",
                 clkfx_divide  =>  12,
                 clkfx_multiply  =>  10,
                 clkin_divide_by_2  =>  FALSE,
                 clkin_period  =>  33.333300,
                 clkout_phase_shift  =>  "NONE",
                 deskew_adjust  =>  "SYSTEM_SYNCHRONOUS",
                 dfs_frequency_mode  =>  "LOW",
                 dll_frequency_mode  =>  "LOW",
                 duty_cycle_correction  =>  TRUE,
                 factory_jf  =>  x"C080",
                 phase_shift  =>  0,
                 startup_wait  =>  FALSE)

    port map (clkfb => clkfb_in,
              clkin => vdu_clkin_ibufg,
              dssen => gnd1,
              psclk => gnd1,
              psen => gnd1,
              psincdec => gnd1,
              rst => gnd1,
              clkdv => open,
              clkfx => vdu_clk_buf,
              clkfx180 => open,
              clk0 => feedback_buf,
              clk2x => open,
              clk2x180 => open,
              clk90 => open,
              clk180 => open,
              clk270 => open,
              locked => vdu_clk_locked,
              psdone => open,
              status => open);

  cpu_clk_dcm : dcm
    generic map( clk_feedback  =>  "1X",
                 clkdv_divide  =>  2.0,
                 clkin_divide_by_2  =>  TRUE,
                 clkin_period  =>  40.0,
                 clkout_phase_shift  =>  "NONE",
                 deskew_adjust  =>  "SYSTEM_SYNCHRONOUS",
                 dfs_frequency_mode  =>  "LOW",
                 dll_frequency_mode  =>  "LOW",
                 duty_cycle_correction  =>  TRUE,
                 factory_jf  =>  x"C080",
                 phase_shift  =>  0,
                 startup_wait  =>  FALSE)

    port map (clkfb => cpu_clk_int,
              clkin => vdu_clk_out,
              dssen => gnd1,
              psclk => gnd1,
              psen => gnd1,
              psincdec => gnd1,
              rst => gnd1,
              clkdv => open,
              clkfx => open,
              clkfx180 => open,
              clk0 => cpu_clk_buf,
              clk2x => open,
              clk2x180 => open,
              clk90 => open,
              clk180 => open,
              clk270 => open,
              locked => cpu_clk_locked,
              psdone => open,
              status => open);

  locked <= vdu_clk_locked and cpu_clk_locked;
  cpu_clk <= cpu_clk_int;
  vdu_clk <= vdu_clk_out;

end;



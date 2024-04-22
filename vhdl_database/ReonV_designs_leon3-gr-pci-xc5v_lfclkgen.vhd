-------------------------------------------------------------------------------
-- Low-frequency clock generator for Virtex 4/5
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
-- pragma translate_off
library grlib;
use grlib.stdlib.all;
library unisim;
use unisim.BUFG;
use unisim.DCM;
-- pragma translate_on
library techmap;
use techmap.gencomp.all;

entity lfclkgen is
  generic (
      dv_div   : real;
      fx_mul   : integer;
      fx_div   : integer);
      
  port (
      resetin : in  std_logic;
      clkin   : in  std_logic;
      clk     : out std_logic;
      resetout: out std_logic);
end;

architecture struct of lfclkgen is

--  attribute CLKIN_PERIOD : string;
--  attribute CLKIN_PERIOD of brm_dcm_fx: label is "20";

component DCM
  generic (
      CLKDV_DIVIDE : real := 2.0;
      CLKFX_DIVIDE : integer := 1;
      CLKFX_MULTIPLY : integer := 4;
      CLKIN_DIVIDE_BY_2 : boolean := false;
      CLKIN_PERIOD : real := 10.0;
      CLKOUT_PHASE_SHIFT : string := "NONE";
      CLK_FEEDBACK : string := "1X";
      DESKEW_ADJUST : string := "SYSTEM_SYNCHRONOUS";
      DFS_FREQUENCY_MODE : string := "LOW";
      DLL_FREQUENCY_MODE : string := "LOW";
      DSS_MODE : string := "NONE";
      DUTY_CYCLE_CORRECTION : boolean := true;
      FACTORY_JF : bit_vector := X"C080";
      PHASE_SHIFT : integer := 0;
      STARTUP_WAIT : boolean := false 
  );
  port (
    CLKFB    : in  std_logic;
    CLKIN    : in  std_logic;
    DSSEN    : in  std_logic;
    PSCLK    : in  std_logic;
    PSEN     : in  std_logic;
    PSINCDEC : in  std_logic;
    RST      : in  std_logic;
    CLK0     : out std_logic;
    CLK90    : out std_logic;
    CLK180   : out std_logic;
    CLK270   : out std_logic;
    CLK2X    : out std_logic;
    CLK2X180 : out std_logic;
    CLKDV    : out std_logic;
    CLKFX    : out std_logic;
    CLKFX180 : out std_logic;
    LOCKED   : out std_logic;
    PSDONE   : out std_logic;
    STATUS   : out std_logic_vector (7 downto 0));
end component;

component BUFG port ( O : out std_logic; I : in std_logic); end component;

signal gnd, clk0, clk1,  clk_fb0, clk_fb1, clk_dv, clk_div, clk_fx,clk_fxo, rst0, lock0    : std_logic;
signal rst1 : std_logic_vector(3 downto 0);

begin
    process(clk_fxo, resetin)
    begin 
        if resetin = '0' then rst1 <= "1111";
        elsif rising_edge(clk_fxo) then rst1 <= rst1(2 downto 0) & not lock0; end if;
    end process;
    
    gnd <= '0'; 
    rst0 <= not resetin;
       
    bufg0 : BUFG port map (I => clk_dv, O => clk);
    bufg1 : BUFG port map (I => clk0, O => clk_fb0);
    bufg2 : BUFG port map (I => clk1, O => clk_fb1);
    bufg3 : BUFG port map (I => clk_fx, O => clk_fxo);
    
    brm_dcm_fx: DCM
        generic map (CLKFX_MULTIPLY => fx_mul, CLKFX_DIVIDE => fx_div)
        port map ( CLKIN => clkin, CLKFB => clk_fb0, DSSEN => gnd, PSCLK => gnd,
                   PSEN => gnd, PSINCDEC => gnd, RST => rst0, CLK0 => clk0,
                   LOCKED => lock0, CLKFX => clk_fx);

    brm_dcm_dv: DCM
        generic map (CLKDV_DIVIDE => dv_div)
        port map ( CLKIN => clk_fxo, CLKFB => clk_fb1, DSSEN => gnd, PSCLK => gnd,
                   PSEN => gnd, PSINCDEC => gnd, RST => rst1(2), CLK0 => clk1,
                   LOCKED => resetout, CLKDV => clk_dv);
  

end;


------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2014, Aeroflex Gaisler
--  Copyright (C) 2015 - 2017, Cobham Gaisler
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
-----------------------------------------------------------------------------
-- Entity: 	various
-- File:	clkgen_xilinx.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Author:	Richard Pender, Pender Electronic Design
-- Description:	Clock generators for Virtex and Virtex-2 fpgas
------------------------------------------------------------------------------

------------------------------------------------------------------
-- Virtex5 clock generator ---------------------------------------
------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
-- pragma translate_off
library grlib;
use grlib.stdlib.all;
library unisim;
use unisim.BUFG;
use unisim.DCM;
--use unisim.BUFGDLL;
use unisim.BUFGMUX;
-- pragma translate_on
library techmap;
use techmap.gencomp.all;

entity clkgen_virtex5 is
  generic (
    clk_mul  : integer := 1; 
    clk_div  : integer := 1;
    sdramen  : integer := 0;
    noclkfb  : integer := 0;
    pcien    : integer := 0;
    pcidll   : integer := 0;
    pcisysclk: integer := 0;
    freq     : integer := 25000;	-- clock frequency in KHz
    clk2xen  : integer := 0;
    clksel   : integer := 0);             -- enable clock select     
  port (
    clkin   : in  std_ulogic;
    pciclkin: in  std_ulogic;
    clk     : out std_ulogic;			-- main clock
    clkn    : out std_ulogic;			-- inverted main clock
    clk2x   : out std_ulogic;			-- double clock
    sdclk   : out std_ulogic;			-- SDRAM clock
    pciclk  : out std_ulogic;			-- PCI clock
    cgi     : in clkgen_in_type;
    cgo     : out clkgen_out_type;
    clk1xu  : out std_ulogic;			-- unscaled clock
    clk2xu  : out std_ulogic			-- unscaled 2X clock
  );
end; 

architecture struct of clkgen_virtex5 is 

  component BUFG port (O : out std_logic; I : in std_logic); end component;

  component BUFGMUX port ( O : out std_ulogic; I0 : in std_ulogic;
                         I1 : in std_ulogic; S : in std_ulogic);
  end component;  
  
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
--  component BUFGDLL port (O : out std_logic; I : in std_logic); end component;

constant VERSION : integer := 1;
--constant CLKIN_PERIOD_ST : string := "20.0";
constant FREQ_MHZ : integer := freq/1000;
  
--attribute CLKIN_PERIOD : string;
--attribute CLKIN_PERIOD of dll0: label is CLKIN_PERIOD_ST;
signal gnd, clk_i, clk_j, clk_k, clk_l, clk_m, lsdclk : std_logic;
signal clk_x, clk_n, clk_o, clk_p, clk_i2, clk_sd, clk_r: std_logic; 
signal dll0rst, dll0lock, dll1lock, dll2xlock : std_logic;
signal dll1rst, dll2xrst : std_logic_vector(0 to 3);
signal clk0B, clkint, pciclkint : std_logic;

begin

  gnd <= '0';
  clk <= clk_i when (CLK2XEN = 0) else clk_p;
  clkn <= clk_m; clk2x <= clk_i2;

  c0 : if (PCISYSCLK = 0) or (PCIEN = 0) generate
    clkint <= clkin;
  end generate;

  c2 : if PCIEN /= 0 generate
    pciclkint <= pciclkin;
    p3 : if PCISYSCLK = 1 generate clkint <= pciclkint; end generate;
    p0 : if PCIDLL = 1 generate
--      x1 : BUFGDLL port map (I => pciclkint, O => pciclk);
--pragma translate_off
      assert false report "PCIDLL = 1 currently not supported for virtex5_clkgen"
        severity failure;
--pragma translate_on
    end generate;
    p1 : if PCIDLL = 0 generate 
      x1 : BUFG port map (I => pciclkint, O => pciclk);
    end generate;
  end generate;

  c3 : if PCIEN = 0 generate 
    pciclk <= '0';
  end generate;

  clk1xu <= clk_k;
  clk2xu <= clk_x;
  bufg0 : BUFG port map (I => clk0B, O => clk_i);
  bufg1 : BUFG port map (I => clk_j, O => clk_k);
  bufg2 : BUFG port map (I => clk_l, O => clk_m);
  buf34gen : if (CLK2XEN /= 0) generate
    cs0 : if (clksel = 0) generate 
      bufg3 : BUFG port map (I => clk_n, O => clk_i2);
    end generate;
    cs1 : if (clksel /= 0) generate 
      bufg3 : BUFGMUX port map (S => cgi.clksel(0), I0 => clk_o, I1 => clk_n, O => clk_i2);
    end generate;
    bufg4 : BUFG port map (I => clk_o, O => clk_p);
  end generate;
  dll0rst <= not cgi.pllrst;

--   HMODE_dll0 : if (((FREQ_MHZ*clk_mul)/clk_div >= 140) or (FREQ_MHZ >= 120)) generate
--     dll0 : DCM 
--       generic map (CLKFX_MULTIPLY => clk_mul, CLKFX_DIVIDE => clk_div,
--                    DFS_FREQUENCY_MODE => "HIGH", DLL_FREQUENCY_MODE => "HIGH")
--       port map ( CLKIN => clkint, CLKFB => clk_k, DSSEN => gnd, PSCLK => gnd,
--                  PSEN => gnd, PSINCDEC => gnd, RST => dll0rst, CLK0 => clk_j,
--                  CLKFX => clk0B, CLK2X => clk_x, CLKFX180 => clk_l, LOCKED => dll0lock);
--   end generate;
--   LMODE_dll0 : if not (((FREQ_MHZ*clk_mul)/clk_div >= 140) or (FREQ_MHZ >= 120)) generate
    dll0 : DCM 
      generic map (CLKFX_MULTIPLY => clk_mul, CLKFX_DIVIDE => clk_div,
                   DFS_FREQUENCY_MODE => "LOW", DLL_FREQUENCY_MODE => "LOW")
      port map ( CLKIN => clkint, CLKFB => clk_k, DSSEN => gnd, PSCLK => gnd,
                 PSEN => gnd, PSINCDEC => gnd, RST => dll0rst, CLK0 => clk_j,
                 CLKFX => clk0B, CLK2X => clk_x, CLKFX180 => clk_l, LOCKED => dll0lock);
--  end generate;
  
  clk2xgen : if (CLK2XEN /= 0) generate
--     HMODE_dll2x : if ((FREQ_MHZ*clk_mul)/clk_div >= 120) generate
--       dll2x : DCM generic map (CLKFX_MULTIPLY => 2, CLKFX_DIVIDE => 2,
--                                DFS_FREQUENCY_MODE => "HIGH", DLL_FREQUENCY_MODE => "HIGH")
--       port map ( CLKIN => clk_i, CLKFB => clk_p, DSSEN => gnd, PSCLK => gnd,
--       PSEN => gnd, PSINCDEC => gnd, RST => dll2xrst(0), CLK0 => clk_o,
--                  CLK2X => clk_n,  LOCKED => dll2xlock);
--     end generate;
--     LMODE_dll2x : if not ((FREQ_MHZ*clk_mul)/clk_div >= 120) generate
      dll2x : DCM generic map (CLKFX_MULTIPLY => 2, CLKFX_DIVIDE => 2,
                               DFS_FREQUENCY_MODE => "LOW", DLL_FREQUENCY_MODE => "LOW")          
      port map ( CLKIN => clk_i, CLKFB => clk_p, DSSEN => gnd, PSCLK => gnd,
      PSEN => gnd, PSINCDEC => gnd, RST => dll2xrst(0), CLK0 => clk_o,
                 CLK2X => clk_n,  LOCKED => dll2xlock);
--    end generate;
    rstdel2x : process (clk_i, dll0lock)
    begin
      if dll0lock = '0' then dll2xrst <= (others => '1');
      elsif rising_edge(clk_i) then
	dll2xrst <= dll2xrst(1 to 3) & '0';
      end if;
    end process;      
  end generate;

  clk_sd1 : if (CLK2XEN = 0) generate
    clk_i2 <= clk_x;
    dll2xlock <= dll0lock;
    clk_sd <= clk_i;
  end generate;

  clk_sd2 : if (CLK2XEN = 1) generate clk_sd <= clk_p; end generate;  
  clk_sd3 : if (CLK2XEN = 2) generate clk_sd <= clk_i2; end generate;

  
  sd0 : if (SDRAMEN /= 0) and (NOCLKFB=0) generate
    cgo.clklock <= dll1lock;
--     HMODE_dll1 : if ((FREQ_MHZ*clk_mul)/clk_div >= (120-60*(CLK2XEN/2))) generate
--       dll1 : DCM generic map (CLKFX_MULTIPLY => 2, CLKFX_DIVIDE => 2,
--                               DFS_FREQUENCY_MODE => "HIGH", DLL_FREQUENCY_MODE => "HIGH",
--                               DESKEW_ADJUST => "SOURCE_SYNCHRONOUS")
--         port map ( CLKIN => clk_sd, CLKFB => cgi.pllref, DSSEN => gnd, PSCLK => gnd,
--                    PSEN => gnd, PSINCDEC => gnd, RST => dll1rst(0), CLK0 => lsdclk, --CLK2X => clk2x, 
--                    LOCKED => dll1lock);
--     end generate;
--     LMODE_dll1 : if not ((FREQ_MHZ*clk_mul)/clk_div >= (120-60*(CLK2XEN/2))) generate
      dll1 : DCM generic map (CLKFX_MULTIPLY => 2, CLKFX_DIVIDE => 2,
                              DFS_FREQUENCY_MODE => "LOW", DLL_FREQUENCY_MODE => "LOW",
                              DESKEW_ADJUST => "SOURCE_SYNCHRONOUS")
        port map ( CLKIN => clk_sd, CLKFB => cgi.pllref, DSSEN => gnd, PSCLK => gnd,
                   PSEN => gnd, PSINCDEC => gnd, RST => dll1rst(0), CLK0 => lsdclk, --CLK2X => clk2x, 
                   LOCKED => dll1lock);
--    end generate;
    bufgx : BUFG port map (I => lsdclk, O => sdclk);
    rstdel : process (clk_sd, dll2xlock)
    begin
      if dll2xlock = '0' then dll1rst <= (others => '1');
      elsif rising_edge(clk_sd) then
	dll1rst <= dll1rst(1 to 3) & '0';
      end if;
    end process;
  end generate;

  sd1 : if ((SDRAMEN = 0) or (NOCLKFB = 1)) and (CLK2XEN /= 2) generate
    sdclk <= clk_i;
    cgo.clklock <= dll0lock when (CLK2XEN = 0) else dll2xlock;
  end generate;

  sd1_2x : if ((SDRAMEN = 0) or (NOCLKFB = 1)) and (CLK2XEN = 2) generate
    sdclk <= clk_i2;
    cgo.clklock <= dll2xlock;
  end generate;  

  
  cgo.pcilock <= '1';

-- pragma translate_off
  bootmsg : report_version 
  generic map (
    "clkgen_virtex5" & ": virtex-5 sdram/pci clock generator, version " & tost(VERSION),
    "clkgen_virtex5" & ": Frequency " &  tost(freq) & " KHz, DCM divisor " & tost(clk_mul) & "/" & tost(clk_div));
-- pragma translate_on


end;

------------------------------------------------------------------
-- Virtex7 clock generator ---------------------------------------
------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
-- pragma translate_off
library grlib;
use grlib.stdlib.all;
library unisim;
use UNISIM.vcomponents.all;
-- pragma translate_on
library techmap;
use techmap.gencomp.all;

entity clkgen_virtex7 is
  generic (
    clk_mul  : integer := 1; 
    clk_div  : integer := 1;
    freq     : integer := 200000	-- clock frequency in KHz
    );
  port (
    clkin   : in  std_ulogic;
    clk     : out std_ulogic;     -- main clock
    clk90   : out std_ulogic;     -- main clock 90deg
    clkio   : out std_ulogic;     -- IO ref clock
    cgi     : in clkgen_in_type;
    cgo     : out clkgen_out_type
  );
end; 

architecture struct of clkgen_virtex7 is

component BUFG port (O : out std_logic; I : in std_logic); end component; 

----- component PLLE2_ADV -----
component PLLE2_ADV
  generic (
     BANDWIDTH : string := "OPTIMIZED";
     CLKFBOUT_MULT : integer := 5;
     CLKFBOUT_PHASE : real := 0.0;
     CLKIN1_PERIOD : real := 0.0;
     CLKIN2_PERIOD : real := 0.0;
     CLKOUT0_DIVIDE : integer := 1;
     CLKOUT0_DUTY_CYCLE : real := 0.5;
     CLKOUT0_PHASE : real := 0.0;
     CLKOUT1_DIVIDE : integer := 1;
     CLKOUT1_DUTY_CYCLE : real := 0.5;
     CLKOUT1_PHASE : real := 0.0;
     CLKOUT2_DIVIDE : integer := 1;
     CLKOUT2_DUTY_CYCLE : real := 0.5;
     CLKOUT2_PHASE : real := 0.0;
     CLKOUT3_DIVIDE : integer := 1;
     CLKOUT3_DUTY_CYCLE : real := 0.5;
     CLKOUT3_PHASE : real := 0.0;
     CLKOUT4_DIVIDE : integer := 1;
     CLKOUT4_DUTY_CYCLE : real := 0.5;
     CLKOUT4_PHASE : real := 0.0;
     CLKOUT5_DIVIDE : integer := 1;
     CLKOUT5_DUTY_CYCLE : real := 0.5;
     CLKOUT5_PHASE : real := 0.0;
     COMPENSATION : string := "ZHOLD";
     DIVCLK_DIVIDE : integer := 1;
     REF_JITTER1 : real := 0.0;
     REF_JITTER2 : real := 0.0;
     STARTUP_WAIT : string := "FALSE"
  );
  port (
     CLKFBOUT : out std_ulogic := '0';
     CLKOUT0 : out std_ulogic := '0';
     CLKOUT1 : out std_ulogic := '0';
     CLKOUT2 : out std_ulogic := '0';
     CLKOUT3 : out std_ulogic := '0';
     CLKOUT4 : out std_ulogic := '0';
     CLKOUT5 : out std_ulogic := '0';
     DO : out std_logic_vector (15 downto 0);
     DRDY : out std_ulogic := '0';
     LOCKED : out std_ulogic := '0';
     CLKFBIN : in std_ulogic;
     CLKIN1 : in std_ulogic;
     CLKIN2 : in std_ulogic;
     CLKINSEL : in std_ulogic;
     DADDR : in std_logic_vector(6 downto 0);
     DCLK : in std_ulogic;
     DEN : in std_ulogic;
     DI : in std_logic_vector(15 downto 0);
     DWE : in std_ulogic;
     PWRDWN : in std_ulogic;
     RST : in std_ulogic
  );
end component;
constant VERSION : integer := 1;
constant period : real := 1000000.0/real(freq);
constant clkio_div : integer := freq*clk_mul/200000;
signal CLKFBOUT : std_logic;
signal CLKFBIN : std_logic;
signal int_rst : std_logic;
signal clk_nobuf : std_logic;
signal clk90_nobuf : std_logic;
signal clkio_nobuf : std_logic;

begin

CLKFBIN <= CLKFBOUT;

int_rst <= not cgi.pllrst;

PLLE2_ADV_inst : PLLE2_ADV
generic map (
   BANDWIDTH          => "OPTIMIZED",  -- OPTIMIZED, HIGH, LOW
   CLKFBOUT_MULT      => clk_mul,   -- Multiply value for all CLKOUT, (2-64)
   CLKFBOUT_PHASE     => 0.0, -- Phase offset in degrees of CLKFB, (-360.000-360.000).
   -- CLKIN_PERIOD: Input clock period in nS to ps resolution (i.e. 33.333 is 30 MHz).
   CLKIN1_PERIOD      => period,
   CLKIN2_PERIOD      => 0.0,
   -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT (1-128)
   CLKOUT0_DIVIDE     => clk_div,
   CLKOUT1_DIVIDE     => clk_div,
   CLKOUT2_DIVIDE     => clkio_div,
   CLKOUT3_DIVIDE     => 1,
   CLKOUT4_DIVIDE     => 1,
   CLKOUT5_DIVIDE     => 1,
   -- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT outputs (0.001-0.999).
   CLKOUT0_DUTY_CYCLE => 0.5,
   CLKOUT1_DUTY_CYCLE => 0.5,
   CLKOUT2_DUTY_CYCLE => 0.5,
   CLKOUT3_DUTY_CYCLE => 0.5,
   CLKOUT4_DUTY_CYCLE => 0.5,
   CLKOUT5_DUTY_CYCLE => 0.5,
   -- CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for CLKOUT outputs (-360.000-360.000).
   CLKOUT0_PHASE      => 0.0,
   CLKOUT1_PHASE      => 90.0,
   CLKOUT2_PHASE      => 0.0,
   CLKOUT3_PHASE      => 0.0,
   CLKOUT4_PHASE      => 0.0,
   CLKOUT5_PHASE      => 0.0,
   COMPENSATION       => "ZHOLD", -- ZHOLD, BUF_IN, EXTERNAL, INTERNAL
   DIVCLK_DIVIDE      => 1, -- Master division value (1-56)
   -- REF_JITTER: Reference input jitter in UI (0.000-0.999).
   REF_JITTER1        => 0.0,
   REF_JITTER2        => 0.0,
   STARTUP_WAIT       => "TRUE" -- Delay DONE until PLL Locks, ("TRUE"/"FALSE")
  )
port map (
   -- Clock Outputs: 1-bit (each) output: User configurable clock outputs
   CLKOUT0           => clk_nobuf,
   CLKOUT1           => clk90_nobuf,
   CLKOUT2           => clkio_nobuf,
   CLKOUT3           => OPEN,
   CLKOUT4           => OPEN,
   CLKOUT5           => OPEN,
   -- DRP Ports: 16-bit (each) output: Dynamic reconfigration ports
   DO                => OPEN,
   DRDY              => OPEN,
   -- Feedback Clocks: 1-bit (each) output: Clock feedback ports
   CLKFBOUT          => CLKFBOUT,
   -- Status Ports: 1-bit (each) output: PLL status ports
   LOCKED            => cgo.clklock,
   -- Clock Inputs: 1-bit (each) input: Clock inputs
   CLKIN1            => clkin,
   CLKIN2            => '0',
   -- Con trol Ports: 1-bit (each) input: PLL control ports
   CLKINSEL          => '1',
   PWRDWN            => '0',
   RST               => int_rst, 
   -- DRP Ports: 7-bit (each) input: Dynamic reconfigration ports
   DADDR             => "0000000", 
   DCLK              => '0',
   DEN               => '0',
   DI                => "0000000000000000", 
   DWE               => '0',
   -- Feedback Clocks: 1-bit (each) input: Clock feedback ports
   CLKFBIN           => CLKFBIN
  );

  cgo.pcilock <= '0';

  bufgclk0 : BUFG port map (I => clk_nobuf, O => clk);
  bufgclk90 : BUFG port map (I => clk90_nobuf, O => clk90);
  bufgclkio : BUFG port map (I => clkio_nobuf, O => clkio);

-- pragma translate_off
  bootmsg : report_version 
  generic map (
    "clkgen_virtex7" & ": virtex-7 sdram/pci clock generator, version " & tost(VERSION),
    "clkgen_virtex7" & ": Frequency " &  tost(freq) & " KHz, DCM divisor " & tost(clk_mul) & "/" & tost(clk_div));
-- pragma translate_on

end;

library ieee;
use ieee.std_logic_1164.all;
-- pragma translate_off
library unisim;
use unisim.BUFGMUX;
-- pragma translate_on

entity clkand_unisim is
  port(
    i      :  in  std_ulogic;
    en     :  in  std_ulogic;
    o      :  out std_ulogic
  );
end entity;

architecture rtl of clkand_unisim is

component BUFGCE 
  port(
    O : out STD_ULOGIC;         
    CE: in STD_ULOGIC;
    I : in STD_ULOGIC
    );
end component;
  
begin
    buf : bufgce port map(I => i, CE => en, O => o);
end architecture;


library ieee;
use ieee.std_logic_1164.all;
-- pragma translate_off
library unisim;
use unisim.BUFGMUX;
-- pragma translate_on

entity clkmux_unisim is
  port(
    i0, i1  :  in  std_ulogic;
    sel     :  in  std_ulogic;
    o       :  out std_ulogic
  );
end entity;

architecture rtl of clkmux_unisim is
  component bufgmux is
  port(
    i0, i1  :  in  std_ulogic;
    s     :  in  std_ulogic;
    o       :  out std_ulogic);
  end component;
  signal sel0, sel1, cg0, cg1 : std_ulogic;  
begin
  buf : bufgmux port map(S => sel, I0 => i0, I1 => i1, O => o);
end architecture;





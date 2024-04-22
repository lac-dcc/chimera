library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;

Library UNISIM;
use UNISIM.vcomponents.all;

entity zpuino_debug_spartan6 is
  port (
    TCKIR: out std_logic;
    TCKDR: out std_logic;
    TDI: out std_logic;
    CAPTUREIR: out std_logic;
    UPDATEIR:  out std_logic;
    SHIFTIR:  out std_logic;
    CAPTUREDR: out std_logic;
    UPDATEDR:  out std_logic;
    SHIFTDR:  out std_logic;
    TLR:  out std_logic;

    TDO_IR:   in std_logic;
    TDO_DR:   in std_logic
  );
end entity;

architecture behave of zpuino_debug_spartan6 is

  signal TCK,SHIFT1,SHIFT2,TDI1,TDI2,TDO1,TDO2,SEL1,SEL2,UPDATE1,UPDATE2,CAPTURE1,CAPTURE2: std_logic;

begin

CAPTUREDR <= CAPTURE1 and SEL1;
CAPTUREIR <= CAPTURE2 and SEL2;

SHIFTDR <= SHIFT1 and SEL1;
SHIFTIR <= SHIFT2 and SEL2;

UPDATEDR <= UPDATE1 and SEL1;
UPDATEIR <= UPDATE2 and SEL2;

TCKDR <= TCK;
TCKIR <= TCK;


BSCAN_SPARTAN6_inst1 : BSCAN_SPARTAN6
generic map (
  JTAG_CHAIN => 1 -- Chain number.
)
port map (
  CAPTURE => CAPTURE1,
  DRCK => open,
  RESET => TLR,
  RUNTEST => open,
  SEL => SEL1,
  SHIFT => SHIFT1,
  TCK => open,
  TDI => open,
  TMS => open,
  UPDATE => UPDATE1,
  TDO => TDO_IR
);

BSCAN_SPARTAN6_inst2 : BSCAN_SPARTAN6
generic map (
  JTAG_CHAIN => 2 -- Chain number.
)
port map (
  CAPTURE => CAPTURE2, -- 1-bit Scan Data Register Capture instruction.
  DRCK => open, -- 1-bit Scan Clock instruction. DRCK is a gated version of TCTCK, it toggles during
  -- the CAPTUREDR and SHIFTDR states.
  RESET => open, -- 1-bit Scan register reset instruction.
  RUNTEST => open,--RUNTEST, -- 1-bit Asserted when TAP controller is in Run Test Idle state. Make sure is the
  -- same name as BSCAN primitive used in Spartan products.
  SEL => SEL2, -- 1-bit Scan mode Select instruction.
  SHIFT => SHIFT2, -- 1-bit Scan Chain Shift instruction.
  TCK => TCK, -- 1-bit Scan Clock. Fabric connection to TAP Clock pin.
  TDI => TDI, -- 1-bit Scan Chain Output. Mirror of TDI input pin to FPGA.
  TMS => open, -- 1-bit Test Mode Select. Fabric connection to TAP.
  UPDATE => UPDATE2, -- 1-bit Scan Register Update instruction.
  TDO => TDO_DR -- 1-bit Scan Chain Input.
);

end behave;

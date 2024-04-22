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

entity zpuino_debug_spartan3e is
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

architecture behave of zpuino_debug_spartan3e is

 -- signal DRCK1,DRCK2,CAPTURE,RESET,SHIFT,TDI,TDO1,TDO2,SEL1,SEL2,UPDATE: std_logic;

begin

--BSCAN_SPARTAN3_inst: BSCAN_SPARTAN3
--	port map (
--      CAPTURE => CAPTURE,
--			DRCK1 => DRCK1,
--			DRCK2 => DRCK2,
--			RESET => RESET,
--			SEL1  => SEL1,
--			SEL2  => SEL2,
--			SHIFT => SHIFT,
 -- 		TDI   => TDI,
--			UPDATE => UPDATE,
--			TDO1 => TDO1,
--			TDO2 => TDO2
--      );

--  CAPTUREIR <= CAPTURE and SEL1;
 -- CAPTUREDR <= CAPTURE and SEL2;

end behave;

--
--  DAC.vhd
--
--  Digital to analog convertor.
--
--        Copyright (C)2001 SEILEBOST
--                   All rights reserved.
--
-- $Id: DAC.vhd, v0.2 2001/11/02 00:00:00 SEILEBOST $
--
-- from  XAPP154.pdf & XAPP154.ZIP (XILINX APPLICATION)
-- 
-- DAC 8 Bits ( method : sigma delta)
-- 2^N clock to convert with N = width of input
-- Ex : Bus 8 bits => 256 CLOCK master to convert an value.
-- Theorem Shannon : 2 x Fmax x 256 =< 16 MHz => Fmax = 31250 Hz
-- band of sound : 0 -> 20000 Hz : Ok !!

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DAC is
    Port ( CLK_DAC : in std_logic;
           RST     : in std_logic;
           IN_DAC  : in std_logic_vector(7 downto 0);
           OUT_DAC : out std_logic );
end DAC;

architecture Behavioral of DAC is

signal DeltaAdder : std_logic_vector(9 downto 0);
signal SigmaAdder : std_logic_vector(9 downto 0);
signal SigmaLatch : std_logic_vector(9 downto 0);
signal DeltaB     : std_logic_vector(9 downto 0);

begin
 PROCESS(SigmaLatch, DeltaB)
 BEGIN
     DeltaB <= TRANSPORT ( SigmaLatch(9) & SigmaLatch(9) & "00000000");
 END PROCESS;

 PROCESS(IN_DAC, DeltaB, DeltaAdder)
 BEGIN      
      DeltaAdder <= IN_DAC + DeltaB;
 END PROCESS;

 PROCESS(DeltaAdder, SigmaLatch)
 BEGIN
      SigmaAdder <= DeltaAdder + SigmaLatch;
 END PROCESS;

 PROCESS(CLK_DAC, RST)
 BEGIN
      if (RST = '1') then
         SigmaLatch <= "0100000000";
         OUT_DAC    <= '1';
      elsif (CLK_DAC'event and CLK_DAC = '1') then
         SigmaLatch <= SigmaAdder;
         OUT_DAC    <= SigmaLatch(9);
      end if;
 END PROCESS;

end Behavioral;

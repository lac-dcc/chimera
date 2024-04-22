-----------------------------------------------------------------------------
--  LEON3 Demonstration design test bench
--  Copyright (C) 2012 Fredrik Ringhage, Gaisler Research
--  Modified by Jiri Gaisler, 2014-04-05
------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2013, Aeroflex Gaisler
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
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.config.all;

entity testbench is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS;      -- Enable disassembly to console
    dbguart   : integer := CFG_DUART;      -- Print UART on console
    pclow     : integer := CFG_PCLOW
  );
end;

architecture behav of testbench is

signal button          : std_logic_vector(3 downto 0) := (others => '0');
signal switch          : std_logic_vector(7 downto 0);    -- I/O port
signal led             : std_logic_vector(7 downto 0);    -- I/O port

signal processing_system7_0_MIO          : std_logic_vector(53 downto 0);
signal processing_system7_0_PS_SRSTB     : std_logic;
signal processing_system7_0_PS_CLK       : std_logic;
signal processing_system7_0_PS_PORB      : std_logic;
signal processing_system7_0_DDR_Clk      : std_logic;
signal processing_system7_0_DDR_Clk_n    : std_logic;
signal processing_system7_0_DDR_CKE      : std_logic;
signal processing_system7_0_DDR_CS_n     : std_logic;
signal processing_system7_0_DDR_RAS_n    : std_logic;
signal processing_system7_0_DDR_CAS_n    : std_logic;
signal processing_system7_0_DDR_WEB_pin  : std_logic;
signal processing_system7_0_DDR_BankAddr : std_logic_vector(2 downto 0);
signal processing_system7_0_DDR_Addr     : std_logic_vector(14 downto 0);
signal processing_system7_0_DDR_ODT      : std_logic;
signal processing_system7_0_DDR_DRSTB    : std_logic;
signal processing_system7_0_DDR_DQ       : std_logic_vector(31 downto 0);
signal processing_system7_0_DDR_DM       : std_logic_vector(3 downto 0);
signal processing_system7_0_DDR_DQS      : std_logic_vector(3 downto 0);
signal processing_system7_0_DDR_DQS_n    : std_logic_vector(3 downto 0);
signal processing_system7_0_DDR_VRN      : std_logic;
signal processing_system7_0_DDR_VRP      : std_logic;

component leon3mp is
  generic (
    fabtech : integer := CFG_FABTECH;
    memtech : integer := CFG_MEMTECH;
    padtech : integer := CFG_PADTECH;
    clktech : integer := CFG_CLKTECH;
    disas   : integer := CFG_DISAS;   -- Enable disassembly to console
    dbguart : integer := CFG_DUART;   -- Print UART on console
    pclow   : integer := CFG_PCLOW
  );
  port (
    processing_system7_0_MIO : inout std_logic_vector(53 downto 0);
    processing_system7_0_PS_SRSTB : inout std_logic;
    processing_system7_0_PS_CLK : inout std_logic;
    processing_system7_0_PS_PORB : inout std_logic;
    processing_system7_0_DDR_Clk : inout std_logic;
    processing_system7_0_DDR_Clk_n : inout std_logic;
    processing_system7_0_DDR_CKE : inout std_logic;
    processing_system7_0_DDR_CS_n : inout std_logic;
    processing_system7_0_DDR_RAS_n : inout std_logic;
    processing_system7_0_DDR_CAS_n : inout std_logic;
    processing_system7_0_DDR_WEB_pin : inout std_logic;
    processing_system7_0_DDR_BankAddr : inout std_logic_vector(2 downto 0);
    processing_system7_0_DDR_Addr : inout std_logic_vector(14 downto 0);
    processing_system7_0_DDR_ODT : inout std_logic;
    processing_system7_0_DDR_DRSTB : inout std_logic;
    processing_system7_0_DDR_DQ : inout std_logic_vector(31 downto 0);
    processing_system7_0_DDR_DM : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_DQS : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_DQS_n : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_VRN : inout std_logic;
    processing_system7_0_DDR_VRP : inout std_logic;
    button  : in    std_logic_vector(3 downto 0);
    switch  : inout std_logic_vector(7 downto 0);
    led     : out   std_logic_vector(7 downto 0)
   );
end component;

begin

  -- clock, reset and misc
  button <= (others => '0');
  switch <= (others => '0');

  cpu : leon3mp
      generic map (
       fabtech => fabtech,
       memtech => memtech,
       padtech => padtech,
       clktech => clktech,
       disas   => disas,
       dbguart => dbguart,
       pclow   => pclow
   )
      port map (
       processing_system7_0_MIO                  => processing_system7_0_MIO,
       processing_system7_0_PS_SRSTB             => processing_system7_0_PS_SRSTB,
       processing_system7_0_PS_CLK               => processing_system7_0_PS_CLK,
       processing_system7_0_PS_PORB              => processing_system7_0_PS_PORB,
       processing_system7_0_DDR_Clk              => processing_system7_0_DDR_Clk,
       processing_system7_0_DDR_Clk_n            => processing_system7_0_DDR_Clk_n,
       processing_system7_0_DDR_CKE              => processing_system7_0_DDR_CKE,
       processing_system7_0_DDR_CS_n             => processing_system7_0_DDR_CS_n,
       processing_system7_0_DDR_RAS_n            => processing_system7_0_DDR_RAS_n,
       processing_system7_0_DDR_CAS_n            => processing_system7_0_DDR_CAS_n,
       processing_system7_0_DDR_WEB_pin          => processing_system7_0_DDR_WEB_pin,
       processing_system7_0_DDR_BankAddr         => processing_system7_0_DDR_BankAddr,
       processing_system7_0_DDR_Addr             => processing_system7_0_DDR_Addr,
       processing_system7_0_DDR_ODT              => processing_system7_0_DDR_ODT,
       processing_system7_0_DDR_DRSTB            => processing_system7_0_DDR_DRSTB,
       processing_system7_0_DDR_DQ               => processing_system7_0_DDR_DQ,
       processing_system7_0_DDR_DM               => processing_system7_0_DDR_DM,
       processing_system7_0_DDR_DQS              => processing_system7_0_DDR_DQS,
       processing_system7_0_DDR_DQS_n            => processing_system7_0_DDR_DQS_n,
       processing_system7_0_DDR_VRN              => processing_system7_0_DDR_VRN,
       processing_system7_0_DDR_VRP              => processing_system7_0_DDR_VRP,
       button                                    => button,
       switch                                    => switch,
       led                                       => led
      );

   iuerr : process
   begin
     wait for 5000 ns;
     wait on led(1);
     assert (led(1) = '1') 
       report "*** IU in error mode, simulation halted ***"
         severity failure ;
   end process;

end ;


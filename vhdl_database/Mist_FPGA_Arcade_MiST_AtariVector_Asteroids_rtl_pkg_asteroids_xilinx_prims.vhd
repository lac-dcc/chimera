--
-- A simulation model of Asteroids Deluxe hardware
-- Copyright (c) MikeJ - May 2004
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- You are responsible for any legal issues arising from your use of this code.
--
-- The latest version of this file can be found at: www.fpgaarcade.com
--
-- Email support@fpgaarcade.com
--
-- Revision list
--
-- version 001 initial release
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

package pkg_asteroids_xilinx_prims is

  component RAMB4_S4
    --pragma translate_off
    --generic (
    --  INIT_00 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_01 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_02 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_03 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_04 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_05 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_06 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_07 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_08 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_09 : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_0A : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_0B : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_0C : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_0D : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_0E : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
    --  INIT_0F : std_logic_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000"
    --  );
    --pragma translate_on
    port (
      DO   : out std_logic_vector (3 downto 0);
      DI   : in  std_logic_vector (3 downto 0);
      ADDR : in  std_logic_vector (9 downto 0);
      WE   : in  std_logic;
      EN   : in  std_logic;
      RST  : in  std_logic;
      CLK  : in  std_logic
      );
  end component;

end;

package body pkg_asteroids_xilinx_prims is

end;

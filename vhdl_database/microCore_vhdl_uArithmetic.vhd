-- ---------------------------------------------------------------------
-- @file : uArithmetic.vhd
-- ---------------------------------------------------------------------
--
-- Last change: KS 02.04.2021 11:59:11
-- @project: microCore
-- @language: VHDL-93
-- @copyright (c): Klaus Schleisiek, All Rights Reserved.
-- @contributors:
--
-- @license: Do not use this file except in compliance with the License.
-- You may obtain a copy of the Public License at
-- https://github.com/microCore-VHDL/microCore/tree/master/documents
-- Software distributed under the License is distributed on an "AS IS"
-- basis, WITHOUT WARRANTY OF ANY KIND, either express or implied.
-- See the License for the specific language governing rights and
-- limitations under the License.
--
-- @brief: Application specific adder and multiplier should the
-- inferred one be too slow.
--
-- Version Author   Date       Changes
--  2300     ks    8-Mar-2021  Converted to NUMERIC_STD
--                             Former uAdd.vhd and uMult.vhd merged.
-- ---------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.architecture_pkg.ALL;
USE work.functions_pkg.ALL;

ENTITY uArithmetic IS PORT (
-- add
   cin          : IN  STD_LOGIC;
   ladd_x       : IN  UNSIGNED(data_width   DOWNTO 0);
   ladd_y       : IN  UNSIGNED(data_width   DOWNTO 0);
   ladd_out     : OUT UNSIGNED(data_width+1 DOWNTO 0);
-- multiply
   multiplicand : IN  UNSIGNED(data_width DOWNTO 0);
   multiplier   : IN  UNSIGNED(data_width DOWNTO 0);
   product      : OUT UNSIGNED(data_width*2+1 DOWNTO 0)
); END uArithmetic;

ARCHITECTURE inference OF uArithmetic IS

BEGIN

sim_arith: IF  SIMULATION  GENERATE

   ladd_out <= ('0' & ladd_x) + ('0' & ladd_y) + ("" & cin);

   product <= unsigned(signed(multiplicand) * signed(multiplier));

END GENERATE sim_arith; syn_arith: IF  NOT SIMULATION  GENERATE

   ladd_out <= ('0' & ladd_x) + ('0' & ladd_y) + ("" & cin);

   product <= unsigned(signed(multiplicand) * signed(multiplier));

END GENERATE syn_arith;

END inference;

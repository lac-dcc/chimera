-- ---------------------------------------------------------------------
-- @file : uProgmem.vhd
-- ---------------------------------------------------------------------
--
-- Last change: KS 10.04.2021 17:24:58
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
-- @brief: Definition of the internal program memory.
--         Here fpga specific single port memory IP can be included.
--
-- Version Author   Date       Changes
--   210     ks    8-Jun-2020  initial version
-- ---------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.functions_pkg.ALL;
USE work.architecture_pkg.ALL;

ENTITY uProgmem IS PORT (
   clk      : IN  STD_LOGIC;
   penable  : IN  STD_LOGIC;
   pwrite   : IN  STD_LOGIC;
   paddr    : IN  program_addr;
   pwdata   : IN  inst_bus;
   prdata   : OUT inst_bus
); END uProgmem;

ARCHITECTURE rtl OF uProgmem IS

BEGIN

internal_prog_mem: internal_ram
GENERIC MAP (inst_width, prog_size, "no_rw_check", MEM_file)
PORT MAP (
   clk     => clk,
   en      => penable,
   we      => pwrite,
   addr    => paddr,
   di      => pwdata,
   do      => prdata
);

END rtl;

-- ---------------------------------------------------------------------
-- @file : uDatacache_cell.vhd
-- ---------------------------------------------------------------------
--
-- Last change: KS 12.06.2023 23:37:58
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
-- @brief: Definition of the internal data memory.
--         Here fpga specific dual port memory IP can be included.
--
-- Version Author   Date       Changes
--   210     ks    8-Jun-2020  initial version
--  2300     ks    8-Mar-2021  Conversion to NUMERIC_STD
--  2400     ks   17-Jun-2022  byte addressing using byte_addr_width
-- ---------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.functions_pkg.ALL;
USE work.architecture_pkg.ALL;

ENTITY uDatacache IS PORT (
   uBus        : IN  uBus_port;
   rdata       : OUT data_bus;
   dma_mem     : IN  datamem_port;
   dma_rdata   : OUT data_bus
); END uDatacache;

ARCHITECTURE rtl OF uDatacache IS

ALIAS clk            : STD_LOGIC IS uBus.clk;
ALIAS clk_en         : STD_LOGIC IS uBus.clk_en;
ALIAS mem_en         : STD_LOGIC IS uBus.mem_en;
ALIAS bytes          : byte_type IS uBus.bytes;
ALIAS write          : STD_LOGIC IS uBus.write;
ALIAS addr           : data_addr IS uBus.addr;
ALIAS wdata          : data_bus  IS uBus.wdata;
ALIAS dma_enable     : STD_LOGIC IS dma_mem.enable;
ALIAS dma_bytes      : byte_type IS dma_mem.bytes;
ALIAS dma_write      : STD_LOGIC IS dma_mem.write;
ALIAS dma_addr       : data_addr IS dma_mem.addr;
ALIAS dma_wdata      : data_bus  IS dma_mem.wdata;

SIGNAL enable        : STD_LOGIC;

SIGNAL bytes_en      : byte_addr;
SIGNAL mem_wdata     : data_bus;
SIGNAL mem_rdata     : data_bus;

SIGNAL dma_bytes_en  : byte_addr;
SIGNAL dma_mem_wdata : data_bus;
SIGNAL dma_mem_rdata : data_bus;

BEGIN

enable <= clk_en AND mem_en;

make_sim_mem: IF  SIMULATION  GENERATE

   internal_data_mem: internal_dpram
   GENERIC MAP (data_width, cache_size, "no_rw_check", DMEM_file)
   PORT MAP (
      clk     => clk,
      ena     => enable,
      wea     => write,
      addra   => addr(cache_addr_width-1 DOWNTO 0),
      dia     => wdata,
      doa     => rdata,
   -- dma port
      enb     => dma_enable,
      web     => dma_write,
      addrb   => dma_addr(cache_addr_width-1 DOWNTO 0),
      dib     => dma_wdata,
      dob     => dma_rdata
   );

END GENERATE make_sim_mem; make_syn_mem: IF  NOT SIMULATION  GENERATE
-- instantiate FPGA specific IP for cell addressed memory here:

   internal_data_mem: internal_dpram
   GENERIC MAP (data_width, cache_size, "no_rw_check")
   PORT MAP (
      clk     => clk,
      ena     => enable,
      wea     => write,
      addra   => addr(cache_addr_width-1 DOWNTO 0),
      dia     => wdata,
      doa     => rdata,
   -- dma port
      enb     => dma_enable,
      web     => dma_write,
      addrb   => dma_addr(cache_addr_width-1 DOWNTO 0),
      dib     => dma_wdata,
      dob     => dma_rdata
   );

END GENERATE make_syn_mem;

END rtl;

-- append FPGA specific IP for byte or cell addressed memory here

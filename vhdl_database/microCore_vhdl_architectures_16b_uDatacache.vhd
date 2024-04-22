-- ---------------------------------------------------------------------
-- @file : uDatacache_16b.vhd
-- ---------------------------------------------------------------------
--
-- Last change: KS 06.07.2023 17:35:15
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
--  2400     ks   03-Nov-2022  byte addressing using byte_addr_width > 0
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

byte_access_proc : PROCESS(uBus, mem_rdata, dma_mem, dma_mem_rdata)
BEGIN

   mem_wdata <= wdata;
   rdata <= mem_rdata;
   bytes_en <= (OTHERS => '1');

   dma_mem_wdata <= dma_wdata;
   dma_rdata <= dma_mem_rdata;
   dma_bytes_en <= (OTHERS => '1');

-- 16 bit system
   IF  byte_addr_width = 1  THEN
      IF  bytes = 1  THEN        -- byte access
         mem_wdata <= wdata(7 DOWNTO 0) & wdata(7 DOWNTO  0);
         bytes_en <= "01";
         rdata <= resize(mem_rdata(07 DOWNTO 0), data_width);
         IF  addr(0) = '1'  THEN
            bytes_en <= "10";
            rdata <= resize(mem_rdata(15 DOWNTO 8), data_width);
         END IF;
         dma_mem_wdata <= dma_wdata(7 DOWNTO 0) & dma_wdata(7 DOWNTO  0);
         dma_bytes_en <= "01";
         dma_rdata <= resize(dma_mem_rdata(07 DOWNTO 0), data_width);
         IF  dma_addr(0) = '1'  THEN
            dma_bytes_en <= "10";
            dma_rdata <= resize(dma_mem_rdata(15 DOWNTO 8), data_width);
         END IF;
      END IF;
   END IF;

-- 32 bit system
   IF  byte_addr_width = 2  THEN
      IF  bytes = 1  THEN           -- byte access
         mem_wdata <= wdata(7 DOWNTO  0) & wdata(7 DOWNTO  0) & wdata(7 DOWNTO  0) & wdata(7 DOWNTO  0);
         CASE addr(1 DOWNTO 0) IS
         WHEN "00" => bytes_en <= "0001";
                      rdata <= resize(mem_rdata(07 DOWNTO 00), data_width);
         WHEN "01" => bytes_en <= "0010";
                      rdata <= resize(mem_rdata(15 DOWNTO 08), data_width);
         WHEN "10" => bytes_en <= "0100";
                      rdata <= resize(mem_rdata(23 DOWNTO 16), data_width);
         WHEN "11" => bytes_en <= "1000";
                      rdata <= resize(mem_rdata(31 DOWNTO 24), data_width);
         WHEN OTHERS => NULL;
         END CASE;
         dma_mem_wdata <= dma_wdata( 7 DOWNTO  0) & dma_wdata( 7 DOWNTO  0) & dma_wdata( 7 DOWNTO  0) & dma_wdata( 7 DOWNTO  0);
         CASE dma_addr(1 DOWNTO 0) IS
         WHEN "00" => dma_bytes_en <= "0001";
                      dma_rdata <= resize(dma_mem_rdata(07 DOWNTO 00), data_width);
         WHEN "01" => dma_bytes_en <= "0010";
                      dma_rdata <= resize(dma_mem_rdata(15 DOWNTO 08), data_width);
         WHEN "10" => dma_bytes_en <= "0100";
                      dma_rdata <= resize(dma_mem_rdata(23 DOWNTO 16), data_width);
         WHEN "11" => dma_bytes_en <= "1000";
                      dma_rdata <= resize(dma_mem_rdata(31 DOWNTO 24), data_width);
         WHEN OTHERS => NULL;
         END CASE;
      ELSIF  bytes = 2  THEN         -- word access
         mem_wdata <= wdata(15 DOWNTO 0) & wdata(15 DOWNTO  0);
         bytes_en <= "0011";
         rdata <= resize(mem_rdata(15 DOWNTO 0), data_width);
         IF  addr(1) = '1'  THEN
            bytes_en <= "1100";
            rdata <= resize(mem_rdata(31 DOWNTO 16), data_width);
         END IF;
         dma_mem_wdata <= dma_wdata(15 DOWNTO 0) & dma_wdata(15 DOWNTO  0);
         dma_bytes_en <= "0011";
         dma_rdata <= resize(dma_mem_rdata(15 DOWNTO 0), data_width);
         IF  dma_addr(1) = '1'  THEN
            dma_bytes_en <= "1100";
            dma_rdata <= resize(dma_mem_rdata(31 DOWNTO 16), data_width);
         END IF;
      END IF;
   END IF;

END PROCESS byte_access_proc;

make_sim_mem: IF  SIMULATION  GENERATE

   internal_data_mem: internal_dpbram
   GENERIC MAP (data_width, cache_size, byte_addr_width, "no_rw_check", DMEM_file)
   PORT MAP (
      clk     => clk,
      ena     => enable,
      wea     => write,
      bytea   => bytes_en,
      addra   => addr(cache_addr_width-1 DOWNTO byte_addr_width),
      dia     => mem_wdata,
      doa     => mem_rdata,
   -- dma port
      enb     => dma_enable,
      web     => dma_write,
      byteb   => dma_bytes_en,
      addrb   => dma_addr(cache_addr_width-1 DOWNTO byte_addr_width),
      dib     => dma_mem_wdata,
      dob     => dma_mem_rdata
   );

END GENERATE make_sim_mem; make_syn_mem: IF  NOT SIMULATION  GENERATE
-- instantiate FPGA specific IP for byte addressed memory here:

   internal_data_mem: internal_dpbram
   GENERIC MAP (data_width, cache_size, byte_addr_width, "rw_check")
   PORT MAP (
      clk     => clk,
      ena     => enable,
      wea     => write,
      bytea   => bytes_en,
      addra   => addr(cache_addr_width-1 DOWNTO byte_addr_width),
      dia     => mem_wdata,
      doa     => mem_rdata,
   -- dma port
      enb     => dma_enable,
      web     => dma_write,
      byteb   => dma_bytes_en,
      addrb   => dma_addr(cache_addr_width-1 DOWNTO byte_addr_width),
      dib     => dma_mem_wdata,
      dob     => dma_mem_rdata
   );

END GENERATE make_syn_mem;

END rtl;

-- append FPGA specific IP for byte or cell addressed memory here

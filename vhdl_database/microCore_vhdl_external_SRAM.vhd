-- ---------------------------------------------------------------------
-- @file : external_SRAM.vhd
-- ---------------------------------------------------------------------
--
-- Last change: KS 15.07.2023 19:35:08
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
-- @brief: Connecting external SRAM memories to microCore. Scaled
--         by the ram_... constants in architecture_pkg.vhd
--         This version can only be used if byte_addr_width = 0.
--
-- Version Author   Date       Changes
--   210     ks    8-Jun-2020  initial version
--  2300     ks    4-Mar-2021  converted to NUMERIC_STD
--  2310     ks   22-Mar-2021  Bugfix in data_mux_proc
-- ---------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.functions_pkg.ALL;
USE work.architecture_pkg.ALL;

ENTITY external_SRAM IS GENERIC (
   ram_addr_width : NATURAL;         -- addr width of the external SRAM
   ram_data_width : NATURAL;         -- data width of the external SRAM
   delay_cnt      : NATURAL          -- delay_cnt+1 extra clock cycles for each memory access
); PORT (
   uBus        : IN    uBus_port;
   ext_rdata   : OUT   data_bus;
   delay       : OUT   STD_LOGIC;
-- external SRAM
   ce_n        : OUT   STD_LOGIC;
   oe_n        : OUT   STD_LOGIC;
   we_n        : OUT   STD_LOGIC;
   addr        : OUT   UNSIGNED(ram_addr_width-1 DOWNTO 0);
   data        : INOUT UNSIGNED(ram_data_width-1 DOWNTO 0)
); END external_SRAM;

ARCHITECTURE rtl OF external_SRAM IS

ALIAS  reset           : STD_LOGIC IS uBus.reset;
ALIAS  clk             : STD_LOGIC IS uBus.clk;
ALIAS  clk_en          : STD_LOGIC IS uBus.clk_en;
ALIAS  ext_en          : STD_LOGIC IS uBus.ext_en;
ALIAS  write           : STD_LOGIC IS uBus.write;
ALIAS  wdata           : data_bus  IS uBus.wdata;

CONSTANT residue       : NATURAL := data_width MOD ram_data_width;
CONSTANT leader        : NATURAL := (ram_data_width - residue) MOD ram_data_width;

SIGNAL delay_ctr       : NATURAL RANGE 0 TO umax(delay_cnt, cycles-1);
SIGNAL ext_ce          : STD_LOGIC;
SIGNAL sub_addr        : UNSIGNED(ram_subbits-1 DOWNTO 0);
SIGNAL LSword          : UNSIGNED((ram_data_width * (ram_chunks-1))-1 DOWNTO 0);

-- defined in architecture_pkg.vhd
-- CONSTANT ram_data_width     : NATURAL :=  8; -- external memory word width
-- CONSTANT ram_chunks         : NATURAL := ceiling(data_width, ram_data_width);
-- CONSTANT ram_subbits        : NATURAL := log2(ram_chunks);

BEGIN

-- ---------------------------------------------------------------------
-- ram_data_width < data_width
-- ---------------------------------------------------------------------

if_wide_data: IF  ram_data_width < data_width  GENERATE

   delay <= '1' WHEN  ext_en = '1' AND (ext_ce = '0' OR delay_ctr /= 0 OR sub_addr /= ram_chunks-1)  ELSE '0';

   rdata_proc : PROCESS (data, LSword)
   BEGIN
      IF  residue = 0  THEN
         ext_rdata <= data & LSword;
      ELSE
         ext_rdata <= data(residue-1 DOWNTO 0) & LSword;
      END IF;
   END PROCESS rdata_proc;

   ce_n <= NOT ext_ce;
   addr <= resize(uBus.addr & sub_addr, addr'length);

   data_mux_proc: PROCESS (uBus, sub_addr, wdata, ext_ce)
   VARIABLE subaddr : NATURAL;
   VARIABLE maxdata : UNSIGNED((ram_data_width * ram_chunks)-1 DOWNTO 0);
   VARIABLE subdata : UNSIGNED(data'range);
   BEGIN
      subaddr := to_integer(sub_addr);
      maxdata := slice('0', leader) & wdata;
      subdata := maxdata((ram_data_width * (subaddr + 1))-1 DOWNTO ram_data_width * subaddr);
      data <= (OTHERS => 'Z');
      IF  uBus.write = '1' AND ext_ce = '1'  THEN
         data <= subdata;
      END IF;
   END PROCESS data_mux_proc;

   SRAM_proc: PROCESS (clk)
   BEGIN
      IF  reset = '1' AND ASYNC_RESET  THEN
         delay_ctr <= cycles - 1;
         ext_ce <= '0';
         we_n <= '1';
         oe_n <= '1';
      ELSIF  rising_edge(clk)  THEN
         IF  delay_ctr = 0  THEN
            IF  ext_ce = '0' AND ext_en = '1'  THEN
               delay_ctr <= delay_cnt;
               sub_addr <= (OTHERS => '0');
               ext_ce <= '1';
            END IF;
            IF  ext_ce = '1' AND sub_addr /= ram_chunks-1  THEN
               sub_addr <= sub_addr + 1;
               delay_ctr <= delay_cnt;
               LSword <= data & LSword(LSword'high DOWNTO ram_data_width);
               we_n <= '1';
            END IF;
            IF  clk_en = '1' AND sub_addr = ram_chunks-1 THEN
               sub_addr <= (OTHERS => '0');
               delay_ctr <= cycles - 1;
               ext_ce <= '0';
               we_n <= '1';
               oe_n <= '1';
            END IF;
         ELSIF  ext_en = '1'  THEN
            delay_ctr <= delay_ctr - 1;
            IF  delay_ctr = delay_cnt AND ext_ce = '1'  THEN
               IF  uBus.write = '1'  THEN
                  we_n <= '0';
               ELSE
                  oe_n <= '0';
               END IF;
            END IF;
         END IF;
         IF  reset = '1' AND NOT ASYNC_RESET  THEN
            delay_ctr <= cycles - 1;
            ext_ce <= '0';
            we_n <= '1';
            oe_n <= '1';
         END IF;
      END IF;
   END PROCESS SRAM_proc;

END GENERATE if_wide_data;

-- ---------------------------------------------------------------------
-- ram_data_width >= data_width
-- ---------------------------------------------------------------------

else_wide_data: IF  ram_data_width >= data_width  GENERATE

   delay <= '1' WHEN  ext_en = '1' AND (ext_ce = '0' OR delay_ctr /= 0)  ELSE '0';

   ce_n <= NOT ext_ce;
   addr <= resize(uBus.addr, addr'length);

   data_mux_proc: PROCESS (uBus, ext_ce, wdata)
   BEGIN
      data <= (OTHERS => 'Z');
      IF  uBus.write = '1' AND ext_ce = '1'  THEN
         data(data_width-1 DOWNTO 0) <= wdata;
         IF  residue /= 0  THEN
            data(ram_data_width-1 DOWNTO data_width) <= (OTHERS => '0');
         END IF;
      END IF;
   END PROCESS data_mux_proc;

   ext_rdata <= data(data_width-1 DOWNTO 0);

   SRAM_proc: PROCESS (clk)
   BEGIN
      IF  reset = '1' AND ASYNC_RESET  THEN
         delay_ctr <= 0;
         ext_ce <= '0';
         we_n <= '1';
         oe_n <= '1';
      ELSIF  rising_edge(clk)  THEN
         IF  delay_ctr = 0  THEN
            IF  ext_ce = '0' AND ext_en = '1'  THEN
               delay_ctr <= delay_cnt;
               ext_ce <= '1';
            END IF;
            IF  ext_ce = '1'  THEN
               delay_ctr <= delay_cnt;
               we_n <= '1';
            END IF;
            IF  clk_en = '1'  THEN
               delay_ctr <= cycles - 1;
               ext_ce <= '0';
               we_n <= '1';
               oe_n <= '1';
            END IF;
         ELSIF  ext_en = '1'  THEN
            delay_ctr <= delay_ctr - 1;
            IF  delay_ctr = delay_cnt AND ext_ce = '1'  THEN
               IF  uBus.write = '1'  THEN
                  we_n <= '0';
               ELSE
                  oe_n <= '0';
               END IF;
            END IF;
         END IF;
         IF  reset = '1' AND NOT ASYNC_RESET  THEN
            delay_ctr <= 0;
            ext_ce <= '0';
            we_n <= '1';
            oe_n <= '1';
         END IF;
      END IF;
   END PROCESS SRAM_proc;

END GENERATE else_wide_data;

END rtl;

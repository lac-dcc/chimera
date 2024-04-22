-------------------------------------------------------------------------------
--
--  SPI to AXI4-Lite Bridge, test controller entity declaration 
--
--  Description:  
--    TODO 
--
--  Author(s):
--    Guy Eschemann, guy@airhdl.com
--
-------------------------------------------------------------------------------
--
-- Copyright (c) 2022 Guy Eschemann
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--     http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
use std.textio.all;

library OSVVM;
context OSVVM.OsvvmContext;

library osvvm_spi;
context osvvm_spi.SpiContext;

entity tb_spi2axi_testctrl is
    generic(
        SPI_CPOL : natural range 0 to 1; -- SPI clock polarity
        SPI_CPHA : natural range 0 to 1 -- SPI clock phase
    );
    port(
        -- Record Interfaces
        SpiRec     : inout SpiRecType;
        Axi4MemRec : inout AddressBusRecType;
        -- Global Signal Interface
        Clk        : in    std_logic;
        nReset     : in    std_logic
    );
end entity;

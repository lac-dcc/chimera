------------------------------------------------------------------------------
-- Copyright [2014] [Ztachip Technologies Inc]
--
-- Author: Vuong Nguyen
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
------------------------------------------------------------------------------
----------
-- This module implements dual-port ram with byte-enable for Xilinx
----------

library std;
use std.standard.all;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ztachip_pkg.all;
Library xpm;
use xpm.vcomponents.all;

ENTITY DPRAM_BE IS
   GENERIC (
        numwords_a                      : NATURAL;
        numwords_b                      : NATURAL;
        widthad_a                       : NATURAL;
        widthad_b                       : NATURAL;
        width_a                         : NATURAL;
        width_b                         : NATURAL
    );
    PORT (
        address_a : IN STD_LOGIC_VECTOR (widthad_a-1 DOWNTO 0);
        byteena_a : IN STD_LOGIC_VECTOR (width_a/8-1 DOWNTO 0);
        clock0    : IN STD_LOGIC ;
        data_a    : IN STD_LOGIC_VECTOR (width_a-1 DOWNTO 0);
        q_b       : OUT STD_LOGIC_VECTOR (width_b-1 DOWNTO 0);
        wren_a    : IN STD_LOGIC ;
        address_b : IN STD_LOGIC_VECTOR (widthad_b-1 DOWNTO 0)
    );
END DPRAM_BE;

architecture dpram_be_behaviour of DPRAM_BE is

begin


xpm_memory_sdpram_inst : xpm_memory_sdpram
generic map (
    ADDR_WIDTH_A => widthad_a, -- DECIMAL
    ADDR_WIDTH_B => widthad_b, -- DECIMAL
    AUTO_SLEEP_TIME => 0, -- DECIMAL
    BYTE_WRITE_WIDTH_A => 8, -- DECIMAL
    CASCADE_HEIGHT => 0, -- DECIMAL
    CLOCKING_MODE => "common_clock", -- String
    ECC_MODE => "no_ecc", -- String
    MEMORY_INIT_FILE => "none", -- String
    MEMORY_INIT_PARAM => "0", -- String
    MEMORY_OPTIMIZATION => "true", -- String
    MEMORY_PRIMITIVE => "auto", -- String
    MEMORY_SIZE => numwords_a*width_a, -- DECIMAL
    MESSAGE_CONTROL => 0, -- DECIMAL
    READ_DATA_WIDTH_B => width_b, -- DECIMAL
    READ_LATENCY_B => 1, -- DECIMAL
    READ_RESET_VALUE_B => "0", -- String
    RST_MODE_A => "SYNC", -- String
    RST_MODE_B => "SYNC", -- String
    SIM_ASSERT_CHK => 0, -- DECIMAL; 0=disable simulation messages, 1=enable simulation messages
    USE_EMBEDDED_CONSTRAINT => 0, -- DECIMAL
    USE_MEM_INIT => 1, -- DECIMAL
    USE_MEM_INIT_MMI => 0, -- DECIMAL
    WAKEUP_TIME => "disable_sleep", -- String
    WRITE_DATA_WIDTH_A => width_a, -- DECIMAL
    WRITE_MODE_B => "no_change", -- String
    WRITE_PROTECT => 1 -- DECIMAL
)
port map (
    dbiterrb => open,     -- 1-bit output: Status signal to indicate double bit error occurrence
    doutb => q_b,         -- READ_DATA_WIDTH_B-bit output: Data output for port B read operations.
    sbiterrb => open,     -- 1-bit output: Status signal to indicate single bit error occurrence
    addra => address_a,   -- ADDR_WIDTH_A-bit input: Address for port A write operations.
    addrb => address_b,   -- ADDR_WIDTH_B-bit input: Address for port B read operations.
    clka => clock0,       -- 1-bit input: Clock signal for port A. Also clocks port B when
    clkb => clock0,       -- 1-bit input: Clock signal for port B when parameter CLOCKING_MODE is
                          -- "independent_clock". Unused when parameter CLOCKING_MODE is
                          -- "common_clock".
    dina => data_a,       -- WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
    ena => wren_a,        -- 1-bit input: Memory enable signal for port A. Must be high on clock
    enb => '1',           -- 1-bit input: Memory enable signal for port B. Must be high on clock
    injectdbiterra => '0', -- 1-bit input: Controls double bit error injection on input data when
                           -- ECC enabled (Error injection capability is not available in
                           -- "decode_only" mode).
    injectsbiterra => '0', -- 1-bit input: Controls single bit error injection on input data when
                           -- ECC enabled (Error injection capability is not available in
                           -- "decode_only" mode).
    regceb => '1',         -- 1-bit input: Clock Enable for the last register stage on the output
                           -- data path.
    rstb => '0',           -- 1-bit input: Reset signal for the final port B output register
                           -- stage. Synchronously resets output port doutb to the value specified
                           -- by parameter READ_RESET_VALUE_B.
    sleep => '0',          -- 1-bit input: sleep signal to enable the dynamic power saving feature.
    wea => byteena_a       -- WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A-bit input: Write enable vector
                           -- for port A input data port dina. 1 bit wide when word-wide writes
                           -- are used. In byte-wide write configurations, each bit controls the
                           -- writing one byte of dina to address addra. For example, to
                           -- synchronously write only bits [15-8] of dina when WRITE_DATA_WIDTH_A
                           -- is 32, wea would be 4'b0010.
);

end dpram_be_behaviour;

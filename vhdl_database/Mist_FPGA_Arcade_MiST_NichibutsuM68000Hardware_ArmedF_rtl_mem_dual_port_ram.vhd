--   __   __     __  __     __         __
--  /\ "-.\ \   /\ \/\ \   /\ \       /\ \
--  \ \ \-.  \  \ \ \_\ \  \ \ \____  \ \ \____
--   \ \_\\"\_\  \ \_____\  \ \_____\  \ \_____\
--    \/_/ \/_/   \/_____/   \/_____/   \/_____/
--   ______     ______       __     ______     ______     ______
--  /\  __ \   /\  == \     /\ \   /\  ___\   /\  ___\   /\__  _\
--  \ \ \/\ \  \ \  __<    _\_\ \  \ \  __\   \ \ \____  \/_/\ \/
--   \ \_____\  \ \_____\ /\_____\  \ \_____\  \ \_____\    \ \_\
--    \/_____/   \/_____/ \/_____/   \/_____/   \/_____/     \/_/
--
-- https://joshbassett.info
-- https://twitter.com/nullobject
-- https://github.com/nullobject
--
-- Copyright (c) 2020 Josh Bassett
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

-- 2022-05-24 Changed to use word count instead of address width
-- and renamed ports to match quartus IP naming

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

--use work.common.all;
use work.math.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

entity dual_port_ram is
  generic (
    LEN         : natural := 8192;
    DATA_WIDTH  : natural := 8
  );
  port (
    -- port A
    clock_a  : in std_logic;
    address_a : in unsigned(ilog2(LEN)-1 downto 0);
    data_a  : in std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
    q_a : out std_logic_vector(DATA_WIDTH-1 downto 0);
    wren_a   : in std_logic := '0';

    -- port B
    clock_b  : in std_logic;
    address_b : in unsigned(ilog2(LEN)-1 downto 0);
    data_b  : in std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
    q_b : out std_logic_vector(DATA_WIDTH-1 downto 0);
    wren_b   : in std_logic := '0'
  );
end dual_port_ram;

architecture arch of dual_port_ram is

begin
  altsyncram_component : altsyncram
  generic map (
    address_reg_b                 => "CLOCK1",
    clock_enable_input_a          => "BYPASS",
    clock_enable_input_b          => "BYPASS",
    clock_enable_output_a         => "BYPASS",
    clock_enable_output_b         => "BYPASS",
    indata_reg_b                  => "CLOCK1",
    intended_device_family        => "Cyclone V",
    lpm_type                      => "altsyncram",
    numwords_a                    => LEN,
    numwords_b                    => LEN,
    operation_mode                => "BIDIR_DUAL_PORT",
    outdata_aclr_a                => "NONE",
    outdata_aclr_b                => "NONE",
    outdata_reg_a                 => "UNREGISTERED",
    outdata_reg_b                 => "UNREGISTERED",
    power_up_uninitialized        => "FALSE",
    read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
    read_during_write_mode_port_b => "NEW_DATA_NO_NBE_READ",
    width_a                       => DATA_WIDTH,
    width_b                       => DATA_WIDTH,
    width_byteena_a               => 1,
    width_byteena_b               => 1,
    widthad_a                     => ilog2(LEN),
    widthad_b                     => ilog2(LEN),
    wrcontrol_wraddress_reg_b     => "CLOCK1"
  )
  port map (
    address_a => std_logic_vector(address_a),
    address_b => std_logic_vector(address_b),
    clock0    => clock_a,
    clock1    => clock_b,
    data_a    => data_a,
    data_b    => data_b,
    wren_a    => wren_a,
    wren_b    => wren_b,
    q_a       => q_a,
    q_b       => q_b
  );


end architecture arch;

------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.mem_function_pack.all;
use ahir.merge_functions.all;
use ahir.mem_component_pack.all;
use ahir.memory_subsystem_package.all;

library work;
use work.mem_test_component_pack.all;

entity UnorderedMemorySystemTB is
end entity;

architecture behave of UnorderedMemorySystemTB is

  constant num_loads: natural := 2;
  constant num_stores: natural := num_loads;
  constant data_width : natural := 8;
  constant addr_width : natural := 4;
  constant tag_width : natural := Ceil_Log2(num_loads);
  constant iteration_count : natural := (2**(addr_width-tag_width))-1;
  -- constant iteration_count : natural := 2;

  signal lr_addr_in : std_logic_vector((num_loads*addr_width)-1 downto 0);
  signal lr_req_in  : std_logic_vector(num_loads-1 downto 0) := (others => '0');
  signal lr_ack_out : std_logic_vector(num_loads-1 downto 0);
  signal lr_tag_in : std_logic_vector((num_loads*tag_width)-1 downto 0);
  signal lc_data_out : std_logic_vector((num_loads*data_width)-1 downto 0);
  signal lc_req_in  : std_logic_vector(num_loads-1 downto 0) := (others => '0');
  signal lc_ack_out : std_logic_vector(num_loads-1 downto 0);
  signal lc_tag_out : std_logic_vector((num_loads*tag_width)-1 downto 0);

  signal sr_addr_in : std_logic_vector((num_stores*addr_width)-1 downto 0);
  signal sr_data_in : std_logic_vector((num_stores*data_width)-1 downto 0);
  signal sr_req_in  : std_logic_vector(num_stores-1 downto 0) := (others => '0');
  signal sr_ack_out : std_logic_vector(num_stores-1 downto 0);
  signal sr_tag_in : std_logic_vector((num_stores*tag_width)-1 downto 0);
  signal sc_req_in  : std_logic_vector(num_stores-1 downto 0) := (others => '0');
  signal sc_ack_out : std_logic_vector(num_stores-1 downto 0);
  signal sc_tag_out : std_logic_vector((num_stores*tag_width)-1 downto 0);
  signal clock : std_logic := '0';  -- only rising edge is used to trigger activity.
  signal reset : std_logic := '1';               -- active high.
begin

  clock <= not clock after 5 ns;
  process
  begin
    wait on clock until clock = '1'; -- enough time for synch reset.
    reset <= '0';
    wait;
  end process;

  TbGen: for I in 0 to num_loads-1 generate
    TestBlock : Unordered_Mem_Test_Block generic map (
      name => "-TestBlock" & Convert_To_String(I),
      data_width => data_width,
      addr_width => addr_width,
      tag_width  => tag_width,
      iteration_count => iteration_count,
      block_id   => I)
      port map (
        lr_addr   => lr_addr_in((I+1)*addr_width-1 downto I*addr_width),
        lr_tag    => lr_tag_in((I+1)*tag_width-1 downto I*tag_width),
        lr_req    => lr_req_in(I),
        lr_ack    => lr_ack_out(I),
        lc_req    => lc_req_in(I),
        lc_ack    => lc_ack_out(I),
        lc_data   => lc_data_out((I+1)*data_width-1 downto I*data_width),
        lc_tag    => lc_tag_out((I+1)*tag_width-1 downto I*tag_width),
        sr_addr   => sr_addr_in((I+1)*addr_width-1 downto I*addr_width),
        sr_data   => sr_data_in((I+1)*data_width-1 downto I*data_width),
        sr_tag    => sr_tag_in((I+1)*tag_width-1 downto I*tag_width),
        sr_req    => sr_req_in(I),
        sr_ack    => sr_ack_out(I),
        sc_req    => sc_req_in(I),
        sc_ack    => sc_ack_out(I),
        sc_tag    => sc_tag_out((I+1)*tag_width-1 downto I*tag_width),
        clock => clock,
        reset => reset);
  end generate TbGen;

  memsys: UnorderedMemorySubsystem
    generic map (
      name => "-memsys",
      data_width => data_width,
      addr_width => addr_width,
      tag_width  => tag_width,
      num_loads  => num_loads,
      num_stores => num_stores,
      mux_degree => 2,
      demux_degree => 2,
	base_bank_addr_width => 10,
	base_bank_data_width => 7)
    port map (
        lr_addr_in   => lr_addr_in,
        lr_tag_in    => lr_tag_in,
        lr_req_in    => lr_req_in,
        lr_ack_out    => lr_ack_out,
        lc_req_in    => lc_req_in,
        lc_ack_out    => lc_ack_out,
        lc_data_out   => lc_data_out,
        lc_tag_out    => lc_tag_out,
        sr_addr_in   => sr_addr_in,
        sr_data_in   => sr_data_in,
        sr_tag_in    => sr_tag_in,
        sr_req_in    => sr_req_in,
        sr_ack_out    => sr_ack_out,
        sc_req_in    => sc_req_in,
        sc_ack_out   => sc_ack_out,
        sc_tag_out    => sc_tag_out,
        clock => clock,
        reset => reset);

end behave;

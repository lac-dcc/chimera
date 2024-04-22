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

-------------------------------------------------------------------------------
-- a simplified version of the memory subsystem to be used
-- when the number of storage locations is small..
--
-- this is equivalent to a num_loads read-port, num_stores write_port
-- register bank.
-------------------------------------------------------------------------------

entity register_bank is
  generic(name: string;
	  num_loads             : natural := 5;
          num_stores            : natural := 10;
          addr_width            : natural := 9;
          data_width            : natural := 5;
          tag_width             : natural := 7;
          num_registers         : natural := 1);
  port(
    ------------------------------------------------------------------------------
    -- load request ports
    ------------------------------------------------------------------------------
    lr_addr_in : in std_logic_vector((num_loads*addr_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on load request.
    lr_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lr_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag for request, will be returned on completion.
    lr_tag_in : in std_logic_vector((num_loads*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- load complete ports
    ---------------------------------------------------------------------------
    lc_data_out : out std_logic_vector((num_loads*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, user should latch data_out.
    lc_req_in  : in  std_logic_vector(num_loads-1 downto 0);
    lc_ack_out : out std_logic_vector(num_loads-1 downto 0);

    -- tag of completed request.
    lc_tag_out : out std_logic_vector((num_loads*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- store request ports
    ------------------------------------------------------------------------------
    sr_addr_in : in std_logic_vector((num_stores*addr_width)-1 downto 0);
    sr_data_in : in std_logic_vector((num_stores*data_width)-1 downto 0);

    -- req/ack pair:
    -- when both are asserted, time-stamp is set on store request.
    sr_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sr_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag for request, will be returned on completion.
    sr_tag_in : in std_logic_vector((num_stores*tag_width)-1 downto 0);

    ---------------------------------------------------------------------------
    -- store complete ports
    ---------------------------------------------------------------------------
    -- req/ack pair:
    -- when both are asserted, user assumes that store is done.
    sc_req_in  : in  std_logic_vector(num_stores-1 downto 0);
    sc_ack_out : out std_logic_vector(num_stores-1 downto 0);

    -- tag of completed request.
    sc_tag_out : out std_logic_vector((num_stores*tag_width)-1 downto 0);

    ------------------------------------------------------------------------------
    -- clock, reset
    ------------------------------------------------------------------------------
    clock : in std_logic;  -- only rising edge is used to trigger activity.
    reset : in std_logic               -- active high.
    );
end entity register_bank;


-- architecture: synchronous R/W.
--               on destination conflict, writer with lowest index wins.
architecture Default_arch of register_bank is
  type DataArray is array (natural range <>) of std_logic_vector(data_width-1 downto 0);
  type AddrArray is array (natural range <>) of std_logic_vector(addr_width-1 downto 0);

  signal register_array : DataArray(num_registers-1 downto 0) := (others => (others => '0'));

  signal lr_ack_flag: std_logic_vector(num_loads-1 downto 0);
  signal sr_ack_flag : std_logic_vector(num_stores-1 downto 0);
  
  signal lc_ack_flag : std_logic_vector(num_loads-1 downto 0);
  signal sc_ack_flag : std_logic_vector(num_stores-1 downto 0);

  signal lc_data_out_sig : std_logic_vector((num_loads*data_width)-1 downto 0);
  signal sc_tag_out_sig : std_logic_vector((num_stores*tag_width)-1 downto 0);
  signal lc_tag_out_sig : std_logic_vector((num_loads*tag_width)-1 downto 0);

  constant zero_addr : std_logic_vector(addr_width-1 downto 0) := (others => '0');
                                                                 
    
begin

  assert(2**addr_width >= num_registers) report "not enough address bits" severity failure;


  -- the read process. fully parallel reads.
  ReadGen: for R in 0 to num_loads-1 generate

    process(clock,lr_req_in,lc_ack_flag,reset,lr_addr_in)
      variable ack_var : std_logic;
      variable index : integer;
                                 
    begin
      ack_var := '0';
      index := 0;
      
      if(lr_req_in(R) = '1') then
        index := To_Integer(lr_addr_in(((R+1)*addr_width)-1 downto R*addr_width));
      end if;
      
      if(lr_req_in(R) = '1' and lc_ack_flag(R) = '0') then
        ack_var := '1';
      end if;
      
      lr_ack_out(R) <= ack_var;
      
      if(clock'event and clock = '1') then
        if(ack_var = '1') then
          assert (index < num_registers) report "index overflow." severity error;
          assert (index >= 0) report "index underflow" severity error;
          
          lc_data_out_sig(((R+1)*data_width)-1 downto R*data_width) <= register_array(index);
          lc_tag_out_sig(((R+1)*tag_width)-1 downto R*tag_width) <=
            lr_tag_in(((R+1)*tag_width)-1 downto R*tag_width);
          
        end if;
        
        if(reset = '1') then
          lc_ack_flag(R) <= '0';
        else
          if(ack_var = '1') then
            lc_ack_flag(R) <= '1';
          elsif lc_ack_flag(R) = '1' and lc_req_in(R) = '1' then
            lc_ack_flag(R) <= '0';
          end if;
        end if;
      end if;
    end process;
    
  end generate ReadGen;
  
  -- the write process
  -- for each register. loop across those who want to write in
  -- and find the lowest index which wins.
  process(clock,
	  reset,
          sr_req_in,
          sr_addr_in,
          sr_data_in,
          sr_tag_in,
          sc_req_in,
          sc_ack_flag,
	  sc_tag_out_sig,
          register_array)
    
    variable sc_ack_set, sc_ack_clear: std_logic_vector(num_stores-1 downto 0);
    variable sr_pending : std_logic_vector(num_registers-1 downto 0);
    
    variable sc_tag_out_var : std_logic_vector((num_stores*tag_width)-1 downto 0);
    variable register_array_var : DataArray(num_registers-1 downto 0);
    
  begin


    sc_ack_set := (others => '0');
    sc_ack_clear := (others => '0');
    sr_pending := (others => '0');

    sc_tag_out_var := sc_tag_out_sig;

    register_array_var := register_array;
    
    
    if(reset = '1') then
      sc_ack_clear := (others => '1');
    end if;
      
    -- for each register.
    for REG  in 0 to num_registers-1 loop
      
      -- writes: for each reg, lowest index succeeds.
      for W in 0 to num_stores-1 loop
        
        -- if W is a store request to this register
        -- and no j
        if(sr_pending(REG) = '0' and
           sr_req_in(W) = '1' and
           sc_ack_flag(W) = '0' and 
           (sr_addr_in(((W+1)*addr_width)-1 downto W*addr_width) = Natural_To_SLV(REG,addr_width)))
        then
          sr_pending(REG) := '1';
          sc_ack_set(W) := '1';
          register_array_var(REG) := sr_data_in(((W+1)*data_width)-1 downto W*data_width);
          sc_tag_out_var(((W+1)*tag_width)-1 downto W*tag_width) :=
            sr_tag_in(((W+1)*tag_width)-1 downto W*tag_width);
          
          exit;
        end if;
      end loop;  -- W
    end loop;  -- REG
    
    -- output latches and registers
    if(clock'event and clock = '1') then
      register_array <= register_array_var;
      sc_tag_out_sig <= sc_tag_out_var;
    end if;
  
    -- lc/sc ack clears.
    if(clock'event and clock = '1') then                
      for W in 0 to num_stores-1 loop
        
        -- if ack and req are both asserted, clear
        -- it unless asked to set it.
        if(sc_ack_flag(W) = '1' and sc_req_in(W) = '1') then
          sc_ack_clear(W) := '1';
        end if;
        
        -- set dominant!
        if(sc_ack_set(W) = '1') then
          sc_ack_flag(W) <= '1';
        elsif (sc_ack_clear(W) = '1') then
          sc_ack_flag(W) <= '0';
        end if;
      end loop;
    end if;      

    sr_ack_out <= sc_ack_set;
  end process;

  sc_ack_out <= sc_ack_flag;
  lc_ack_out <= lc_ack_flag;
  lc_data_out <= lc_data_out_sig;
  lc_tag_out <= lc_tag_out_sig;
  sc_tag_out <= sc_tag_out_sig;
  
end Default_arch;


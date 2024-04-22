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
package vc_system_package is -- 
  -- 
end package vc_system_package;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
library work;
use work.vc_system_package.all;
entity sum_mod is -- 
  port ( -- 
    a : in  std_logic_vector(9 downto 0);
    b : out  std_logic_vector(9 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    start : in std_logic;
    fin   : out std_logic;
    ms_storage_buffer_1_lr_req : out  std_logic_vector(0 downto 0);
    ms_storage_buffer_1_lr_ack : in   std_logic_vector(0 downto 0);
    ms_storage_buffer_1_lr_addr : out  std_logic_vector(0 downto 0);
    ms_storage_buffer_1_lr_tag :  out  std_logic_vector(0 downto 0);
    ms_storage_buffer_1_lc_req : out  std_logic_vector(0 downto 0);
    ms_storage_buffer_1_lc_ack : in   std_logic_vector(0 downto 0);
    ms_storage_buffer_1_lc_data : in   std_logic_vector(9 downto 0);
    ms_storage_buffer_1_lc_tag :  in  std_logic_vector(0 downto 0);
    ms_storage_scratch_3_lr_req : out  std_logic_vector(0 downto 0);
    ms_storage_scratch_3_lr_ack : in   std_logic_vector(0 downto 0);
    ms_storage_scratch_3_lr_addr : out  std_logic_vector(5 downto 0);
    ms_storage_scratch_3_lr_tag :  out  std_logic_vector(0 downto 0);
    ms_storage_scratch_3_lc_req : out  std_logic_vector(0 downto 0);
    ms_storage_scratch_3_lc_ack : in   std_logic_vector(0 downto 0);
    ms_storage_scratch_3_lc_data : in   std_logic_vector(9 downto 0);
    ms_storage_scratch_3_lc_tag :  in  std_logic_vector(0 downto 0);
    ms_storage_buffer_1_sr_req : out  std_logic_vector(0 downto 0);
    ms_storage_buffer_1_sr_ack : in   std_logic_vector(0 downto 0);
    ms_storage_buffer_1_sr_addr : out  std_logic_vector(0 downto 0);
    ms_storage_buffer_1_sr_data : out  std_logic_vector(9 downto 0);
    ms_storage_buffer_1_sr_tag :  out  std_logic_vector(0 downto 0);
    ms_storage_buffer_1_sc_req : out  std_logic_vector(0 downto 0);
    ms_storage_buffer_1_sc_ack : in   std_logic_vector(0 downto 0);
    ms_storage_buffer_1_sc_tag :  in  std_logic_vector(0 downto 0);
    ms_storage_scratch_3_sr_req : out  std_logic_vector(0 downto 0);
    ms_storage_scratch_3_sr_ack : in   std_logic_vector(0 downto 0);
    ms_storage_scratch_3_sr_addr : out  std_logic_vector(5 downto 0);
    ms_storage_scratch_3_sr_data : out  std_logic_vector(9 downto 0);
    ms_storage_scratch_3_sr_tag :  out  std_logic_vector(0 downto 0);
    ms_storage_scratch_3_sc_req : out  std_logic_vector(0 downto 0);
    ms_storage_scratch_3_sc_ack : in   std_logic_vector(0 downto 0);
    ms_storage_scratch_3_sc_tag :  in  std_logic_vector(0 downto 0);
    tag_in: in std_logic_vector(0 downto 0);
    tag_out: out std_logic_vector(0 downto 0)-- 
  );
  -- 
end entity sum_mod;
architecture Default of sum_mod is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  -- links between control-path and data-path
  signal assign_stmt_13Xsimple_obj_ref_12Xrr_cp_to_dp : boolean;
  signal assign_stmt_13Xsimple_obj_ref_12Xra_dp_to_cp : boolean;
  signal assign_stmt_13Xsimple_obj_ref_12Xcr_cp_to_dp : boolean;
  signal assign_stmt_13Xsimple_obj_ref_12Xca_dp_to_cp : boolean;
  signal assign_stmt_9Xsimple_obj_ref_7Xsrr_cp_to_dp : boolean;
  signal assign_stmt_9Xsimple_obj_ref_7Xsra_dp_to_cp : boolean;
  signal assign_stmt_9Xsimple_obj_ref_7Xscr_cp_to_dp : boolean;
  signal assign_stmt_9Xsimple_obj_ref_7Xsca_dp_to_cp : boolean;
  signal assign_stmt_17Xarray_obj_ref_16Xrr_cp_to_dp : boolean;
  signal assign_stmt_17Xarray_obj_ref_16Xra_dp_to_cp : boolean;
  signal assign_stmt_17Xarray_obj_ref_16Xcr_cp_to_dp : boolean;
  signal assign_stmt_17Xarray_obj_ref_16Xca_dp_to_cp : boolean;
  signal assign_stmt_13Xarray_obj_ref_11Xrr_cp_to_dp : boolean;
  signal assign_stmt_13Xarray_obj_ref_11Xra_dp_to_cp : boolean;
  signal assign_stmt_13Xarray_obj_ref_11Xcr_cp_to_dp : boolean;
  signal assign_stmt_13Xarray_obj_ref_11Xca_dp_to_cp : boolean;
  -- 
begin --  
  -- tag register
  process(clk) 
  begin -- 
    if clk'event and clk = '1' then -- 
      if start='1' then -- 
        tag_out <= tag_in; -- 
      end if; -- 
    end if; -- 
  end process;
  -- the control path
  always_true_symbol <= true; 
  cp_0: Block -- control-path 
    signal cp_0_start: Boolean;
    signal cp_1_symbol: Boolean;
    signal cp_2_symbol: Boolean;
    signal cp_3_symbol : Boolean;
    signal cp_13_symbol : Boolean;
    signal cp_36_symbol : Boolean;
    -- 
  begin -- 
    cp_0_start <=  true when start = '1' else false; -- control passed to control-path.
    cp_1_symbol  <= cp_0_start; -- transition $entry
    cp_3: Block -- assign_stmt_9 
      signal cp_3_start: Boolean;
      signal cp_4_symbol: Boolean;
      signal cp_5_symbol: Boolean;
      signal cp_6_symbol : Boolean;
      -- 
    begin -- 
      cp_3_start <= cp_1_symbol; -- control passed to block
      cp_4_symbol  <= cp_3_start; -- transition assign_stmt_9/$entry
      cp_6: Block -- assign_stmt_9/simple_obj_ref_7 
        signal cp_6_start: Boolean;
        signal cp_7_symbol: Boolean;
        signal cp_8_symbol: Boolean;
        signal cp_9_symbol : Boolean;
        signal cp_10_symbol : Boolean;
        signal cp_11_symbol : Boolean;
        signal cp_12_symbol : Boolean;
        -- 
      begin -- 
        cp_6_start <= cp_4_symbol; -- control passed to block
        cp_7_symbol  <= cp_6_start; -- transition assign_stmt_9/simple_obj_ref_7/$entry
        cp_9_symbol <= cp_7_symbol; -- transition assign_stmt_9/simple_obj_ref_7/srr
        assign_stmt_9Xsimple_obj_ref_7Xsrr_cp_to_dp <= cp_9_symbol; -- link to DP
        cp_10_symbol <= assign_stmt_9Xsimple_obj_ref_7Xsra_dp_to_cp; -- transition assign_stmt_9/simple_obj_ref_7/sra
        cp_11_symbol <= cp_10_symbol; -- transition assign_stmt_9/simple_obj_ref_7/scr
        assign_stmt_9Xsimple_obj_ref_7Xscr_cp_to_dp <= cp_11_symbol; -- link to DP
        cp_12_symbol <= assign_stmt_9Xsimple_obj_ref_7Xsca_dp_to_cp; -- transition assign_stmt_9/simple_obj_ref_7/sca
        cp_8_symbol <= cp_12_symbol; -- transition assign_stmt_9/simple_obj_ref_7/$exit
        cp_6_symbol <= cp_8_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_9/simple_obj_ref_7
      cp_5_symbol <= cp_6_symbol; -- transition assign_stmt_9/$exit
      cp_3_symbol <= cp_5_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_9
    cp_13: Block -- assign_stmt_13 
      signal cp_13_start: Boolean;
      signal cp_14_symbol: Boolean;
      signal cp_15_symbol: Boolean;
      signal cp_16_symbol : Boolean;
      signal cp_23_symbol : Boolean;
      -- 
    begin -- 
      cp_13_start <= cp_3_symbol; -- control passed to block
      cp_14_symbol  <= cp_13_start; -- transition assign_stmt_13/$entry
      cp_16: Block -- assign_stmt_13/simple_obj_ref_12 
        signal cp_16_start: Boolean;
        signal cp_17_symbol: Boolean;
        signal cp_18_symbol: Boolean;
        signal cp_19_symbol : Boolean;
        signal cp_20_symbol : Boolean;
        signal cp_21_symbol : Boolean;
        signal cp_22_symbol : Boolean;
        -- 
      begin -- 
        cp_16_start <= cp_14_symbol; -- control passed to block
        cp_17_symbol  <= cp_16_start; -- transition assign_stmt_13/simple_obj_ref_12/$entry
        cp_19_symbol <= cp_17_symbol; -- transition assign_stmt_13/simple_obj_ref_12/rr
        assign_stmt_13Xsimple_obj_ref_12Xrr_cp_to_dp <= cp_19_symbol; -- link to DP
        cp_20_symbol <= assign_stmt_13Xsimple_obj_ref_12Xra_dp_to_cp; -- transition assign_stmt_13/simple_obj_ref_12/ra
        cp_21_symbol <= cp_20_symbol; -- transition assign_stmt_13/simple_obj_ref_12/cr
        assign_stmt_13Xsimple_obj_ref_12Xcr_cp_to_dp <= cp_21_symbol; -- link to DP
        cp_22_symbol <= assign_stmt_13Xsimple_obj_ref_12Xca_dp_to_cp; -- transition assign_stmt_13/simple_obj_ref_12/ca
        cp_18_symbol <= cp_22_symbol; -- transition assign_stmt_13/simple_obj_ref_12/$exit
        cp_16_symbol <= cp_18_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_13/simple_obj_ref_12
      cp_23: Block -- assign_stmt_13/array_obj_ref_11 
        signal cp_23_start: Boolean;
        signal cp_24_symbol: Boolean;
        signal cp_25_symbol: Boolean;
        signal cp_26_symbol : Boolean;
        signal cp_32_symbol : Boolean;
        signal cp_33_symbol : Boolean;
        signal cp_34_symbol : Boolean;
        signal cp_35_symbol : Boolean;
        -- 
      begin -- 
        cp_23_start <= cp_16_symbol; -- control passed to block
        cp_24_symbol  <= cp_23_start; -- transition assign_stmt_13/array_obj_ref_11/$entry
        cp_26: Block -- assign_stmt_13/array_obj_ref_11/array_obj_ref_11_AddressGen 
          signal cp_26_start: Boolean;
          signal cp_27_symbol: Boolean;
          signal cp_28_symbol: Boolean;
          signal cp_29_symbol : Boolean;
          -- 
        begin -- 
          cp_26_start <= cp_24_symbol; -- control passed to block
          cp_27_symbol  <= cp_26_start; -- transition assign_stmt_13/array_obj_ref_11/array_obj_ref_11_AddressGen/$entry
          cp_29: Block -- assign_stmt_13/array_obj_ref_11/array_obj_ref_11_AddressGen/IndexGen 
            signal cp_29_start: Boolean;
            signal cp_30_symbol: Boolean;
            signal cp_31_symbol: Boolean;
            -- 
          begin -- 
            cp_29_start <= cp_27_symbol; -- control passed to block
            cp_30_symbol  <= cp_29_start; -- transition assign_stmt_13/array_obj_ref_11/array_obj_ref_11_AddressGen/IndexGen/$entry
            cp_31_symbol <= cp_30_symbol; -- transition assign_stmt_13/array_obj_ref_11/array_obj_ref_11_AddressGen/IndexGen/$exit
            cp_29_symbol <= cp_31_symbol; -- control passed from block 
            -- 
          end Block; -- assign_stmt_13/array_obj_ref_11/array_obj_ref_11_AddressGen/IndexGen
          cp_28_symbol <= cp_29_symbol; -- transition assign_stmt_13/array_obj_ref_11/array_obj_ref_11_AddressGen/$exit
          cp_26_symbol <= cp_28_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_13/array_obj_ref_11/array_obj_ref_11_AddressGen
        cp_32_symbol <= cp_26_symbol; -- transition assign_stmt_13/array_obj_ref_11/rr
        assign_stmt_13Xarray_obj_ref_11Xrr_cp_to_dp <= cp_32_symbol; -- link to DP
        cp_33_symbol <= assign_stmt_13Xarray_obj_ref_11Xra_dp_to_cp; -- transition assign_stmt_13/array_obj_ref_11/ra
        cp_34_symbol <= cp_33_symbol; -- transition assign_stmt_13/array_obj_ref_11/cr
        assign_stmt_13Xarray_obj_ref_11Xcr_cp_to_dp <= cp_34_symbol; -- link to DP
        cp_35_symbol <= assign_stmt_13Xarray_obj_ref_11Xca_dp_to_cp; -- transition assign_stmt_13/array_obj_ref_11/ca
        cp_25_symbol <= cp_35_symbol; -- transition assign_stmt_13/array_obj_ref_11/$exit
        cp_23_symbol <= cp_25_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_13/array_obj_ref_11
      cp_15_symbol <= cp_23_symbol; -- transition assign_stmt_13/$exit
      cp_13_symbol <= cp_15_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_13
    cp_36: Block -- assign_stmt_17 
      signal cp_36_start: Boolean;
      signal cp_37_symbol: Boolean;
      signal cp_38_symbol: Boolean;
      signal cp_39_symbol : Boolean;
      -- 
    begin -- 
      cp_36_start <= cp_13_symbol; -- control passed to block
      cp_37_symbol  <= cp_36_start; -- transition assign_stmt_17/$entry
      cp_39: Block -- assign_stmt_17/array_obj_ref_16 
        signal cp_39_start: Boolean;
        signal cp_40_symbol: Boolean;
        signal cp_41_symbol: Boolean;
        signal cp_42_symbol : Boolean;
        signal cp_48_symbol : Boolean;
        signal cp_49_symbol : Boolean;
        signal cp_50_symbol : Boolean;
        signal cp_51_symbol : Boolean;
        -- 
      begin -- 
        cp_39_start <= cp_37_symbol; -- control passed to block
        cp_40_symbol  <= cp_39_start; -- transition assign_stmt_17/array_obj_ref_16/$entry
        cp_42: Block -- assign_stmt_17/array_obj_ref_16/array_obj_ref_16_AddressGen 
          signal cp_42_start: Boolean;
          signal cp_43_symbol: Boolean;
          signal cp_44_symbol: Boolean;
          signal cp_45_symbol : Boolean;
          -- 
        begin -- 
          cp_42_start <= cp_40_symbol; -- control passed to block
          cp_43_symbol  <= cp_42_start; -- transition assign_stmt_17/array_obj_ref_16/array_obj_ref_16_AddressGen/$entry
          cp_45: Block -- assign_stmt_17/array_obj_ref_16/array_obj_ref_16_AddressGen/IndexGen 
            signal cp_45_start: Boolean;
            signal cp_46_symbol: Boolean;
            signal cp_47_symbol: Boolean;
            -- 
          begin -- 
            cp_45_start <= cp_43_symbol; -- control passed to block
            cp_46_symbol  <= cp_45_start; -- transition assign_stmt_17/array_obj_ref_16/array_obj_ref_16_AddressGen/IndexGen/$entry
            cp_47_symbol <= cp_46_symbol; -- transition assign_stmt_17/array_obj_ref_16/array_obj_ref_16_AddressGen/IndexGen/$exit
            cp_45_symbol <= cp_47_symbol; -- control passed from block 
            -- 
          end Block; -- assign_stmt_17/array_obj_ref_16/array_obj_ref_16_AddressGen/IndexGen
          cp_44_symbol <= cp_45_symbol; -- transition assign_stmt_17/array_obj_ref_16/array_obj_ref_16_AddressGen/$exit
          cp_42_symbol <= cp_44_symbol; -- control passed from block 
          -- 
        end Block; -- assign_stmt_17/array_obj_ref_16/array_obj_ref_16_AddressGen
        cp_48_symbol <= cp_42_symbol; -- transition assign_stmt_17/array_obj_ref_16/rr
        assign_stmt_17Xarray_obj_ref_16Xrr_cp_to_dp <= cp_48_symbol; -- link to DP
        cp_49_symbol <= assign_stmt_17Xarray_obj_ref_16Xra_dp_to_cp; -- transition assign_stmt_17/array_obj_ref_16/ra
        cp_50_symbol <= cp_49_symbol; -- transition assign_stmt_17/array_obj_ref_16/cr
        assign_stmt_17Xarray_obj_ref_16Xcr_cp_to_dp <= cp_50_symbol; -- link to DP
        cp_51_symbol <= assign_stmt_17Xarray_obj_ref_16Xca_dp_to_cp; -- transition assign_stmt_17/array_obj_ref_16/ca
        cp_41_symbol <= cp_51_symbol; -- transition assign_stmt_17/array_obj_ref_16/$exit
        cp_39_symbol <= cp_41_symbol; -- control passed from block 
        -- 
      end Block; -- assign_stmt_17/array_obj_ref_16
      cp_38_symbol <= cp_39_symbol; -- transition assign_stmt_17/$exit
      cp_36_symbol <= cp_38_symbol; -- control passed from block 
      -- 
    end Block; -- assign_stmt_17
    cp_2_symbol <= cp_36_symbol; -- transition $exit
    fin  <=  '1' when cp_2_symbol else '0'; -- fin symbol when control-path exits
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal array_obj_ref_11_wire_constant_write_ptr : std_logic_vector(5 downto 0);
    signal array_obj_ref_16_wire_constant_read_ptr : std_logic_vector(5 downto 0);
    signal expr_15_wire_constant : std_logic_vector(5 downto 0);
    signal simple_obj_ref_12_wire : std_logic_vector(9 downto 0);
    signal simple_obj_ref_12_wire_addr : std_logic_vector(0 downto 0);
    signal simple_obj_ref_7_wire_addr : std_logic_vector(0 downto 0);
    -- 
  begin -- 
    array_obj_ref_11_wire_constant_write_ptr <= "000000";
    array_obj_ref_16_wire_constant_read_ptr <= "000000";
    expr_15_wire_constant <= "000000";
    simple_obj_ref_12_wire_addr <= "0";
    simple_obj_ref_7_wire_addr <= "0";
    -- shared load operator group (0) : array_obj_ref_16_inst 
    LoadGroup0: Block -- 
      signal data_in: std_logic_vector(5 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_17Xarray_obj_ref_16Xrr_cp_to_dp;
      assign_stmt_17Xarray_obj_ref_16Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_17Xarray_obj_ref_16Xcr_cp_to_dp;
      assign_stmt_17Xarray_obj_ref_16Xca_dp_to_cp <= ackR(0);
      data_in <= array_obj_ref_16_wire_constant_read_ptr;
      b <= data_out(9 downto 0);
      LoadReq: LoadReqShared -- 
        generic map (addr_width => 6,  num_reqs => 1,  tag_length => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          mreq => ms_storage_scratch_3_lr_req(0),
          mack => ms_storage_scratch_3_lr_ack(0),
          maddr => ms_storage_scratch_3_lr_addr(5 downto 0),
          mtag => ms_storage_scratch_3_lr_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      LoadComplete: LoadCompleteShared -- 
        generic map ( data_width => 10,  num_reqs => 1,  tag_length => 1,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          mreq => ms_storage_scratch_3_lc_req(0),
          mack => ms_storage_scratch_3_lc_ack(0),
          mdata => ms_storage_scratch_3_lc_data(9 downto 0),
          mtag => ms_storage_scratch_3_lc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- load group 0
    -- shared load operator group (1) : simple_obj_ref_12_inst 
    LoadGroup1: Block -- 
      signal data_in: std_logic_vector(0 downto 0);
      signal data_out: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_13Xsimple_obj_ref_12Xrr_cp_to_dp;
      assign_stmt_13Xsimple_obj_ref_12Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_13Xsimple_obj_ref_12Xcr_cp_to_dp;
      assign_stmt_13Xsimple_obj_ref_12Xca_dp_to_cp <= ackR(0);
      data_in <= simple_obj_ref_12_wire_addr;
      simple_obj_ref_12_wire <= data_out(9 downto 0);
      LoadReq: LoadReqShared -- 
        generic map (addr_width => 1,  num_reqs => 1,  tag_length => 1,  no_arbitration => true)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          mreq => ms_storage_buffer_1_lr_req(0),
          mack => ms_storage_buffer_1_lr_ack(0),
          maddr => ms_storage_buffer_1_lr_addr(0 downto 0),
          mtag => ms_storage_buffer_1_lr_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      LoadComplete: LoadCompleteShared -- 
        generic map ( data_width => 10,  num_reqs => 1,  tag_length => 1,  no_arbitration => true)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          mreq => ms_storage_buffer_1_lc_req(0),
          mack => ms_storage_buffer_1_lc_ack(0),
          mdata => ms_storage_buffer_1_lc_data(9 downto 0),
          mtag => ms_storage_buffer_1_lc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- load group 1
    -- shared store operator group (0) : array_obj_ref_11_inst 
    StoreGroup0: Block -- 
      signal addr_in: std_logic_vector(5 downto 0);
      signal data_in: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_13Xarray_obj_ref_11Xrr_cp_to_dp;
      assign_stmt_13Xarray_obj_ref_11Xra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_13Xarray_obj_ref_11Xcr_cp_to_dp;
      assign_stmt_13Xarray_obj_ref_11Xca_dp_to_cp <= ackR(0);
      addr_in <= array_obj_ref_11_wire_constant_write_ptr;
      data_in <= simple_obj_ref_12_wire;
      StoreReq: StoreReqShared -- 
        generic map ( addr_width => 6,
        data_width => 10,
        num_reqs => 1,
        tag_length => 1,
        no_arbitration => true)
        port map (--
          reqL => reqL , 
          ackL => ackL , 
          addr => addr_in, 
          data => data_in, 
          mreq => ms_storage_scratch_3_sr_req(0),
          mack => ms_storage_scratch_3_sr_ack(0),
          maddr => ms_storage_scratch_3_sr_addr(5 downto 0),
          mdata => ms_storage_scratch_3_sr_data(9 downto 0),
          mtag => ms_storage_scratch_3_sr_tag(0 downto 0),
          clk => clk, reset => reset -- 
        );--
      StoreComplete: StoreCompleteShared -- 
        generic map ( -- 
          num_reqs => 1,
          tag_length => 1 -- 
        )
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          mreq => ms_storage_scratch_3_sc_req(0),
          mack => ms_storage_scratch_3_sc_ack(0),
          mtag => ms_storage_scratch_3_sc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- store group 0
    -- shared store operator group (1) : simple_obj_ref_7_inst 
    StoreGroup1: Block -- 
      signal addr_in: std_logic_vector(0 downto 0);
      signal data_in: std_logic_vector(9 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      -- 
    begin -- 
      reqL(0) <= assign_stmt_9Xsimple_obj_ref_7Xsrr_cp_to_dp;
      assign_stmt_9Xsimple_obj_ref_7Xsra_dp_to_cp <= ackL(0);
      reqR(0) <= assign_stmt_9Xsimple_obj_ref_7Xscr_cp_to_dp;
      assign_stmt_9Xsimple_obj_ref_7Xsca_dp_to_cp <= ackR(0);
      addr_in <= simple_obj_ref_7_wire_addr;
      data_in <= a;
      StoreReq: StoreReqShared -- 
        generic map ( addr_width => 1,
        data_width => 10,
        num_reqs => 1,
        tag_length => 1,
        no_arbitration => true)
        port map (--
          reqL => reqL , 
          ackL => ackL , 
          addr => addr_in, 
          data => data_in, 
          mreq => ms_storage_buffer_1_sr_req(0),
          mack => ms_storage_buffer_1_sr_ack(0),
          maddr => ms_storage_buffer_1_sr_addr(0 downto 0),
          mdata => ms_storage_buffer_1_sr_data(9 downto 0),
          mtag => ms_storage_buffer_1_sr_tag(0 downto 0),
          clk => clk, reset => reset -- 
        );--
      StoreComplete: StoreCompleteShared -- 
        generic map ( -- 
          num_reqs => 1,
          tag_length => 1 -- 
        )
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          mreq => ms_storage_buffer_1_sc_req(0),
          mack => ms_storage_buffer_1_sc_ack(0),
          mtag => ms_storage_buffer_1_sc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- store group 1
    -- 
  end Block; -- data_path
  -- 
end Default;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
library work;
use work.vc_system_package.all;
entity test_system is  -- system 
  port (-- 
    sum_mod_a : in  std_logic_vector(9 downto 0);
    sum_mod_b : out  std_logic_vector(9 downto 0);
    sum_mod_tag_in: in std_logic_vector(0 downto 0);
    sum_mod_tag_out: out std_logic_vector(0 downto 0);
    sum_mod_start : in std_logic;
    sum_mod_fin   : out std_logic;
    clk : in std_logic;
    reset : in std_logic); -- 
  -- 
end entity; 
architecture Default of test_system is -- system-architecture 
  -- interface signals to connect to memory space ms_storage_buffer_1
  signal ms_storage_buffer_1_lr_req :  std_logic_vector(0 downto 0);
  signal ms_storage_buffer_1_lr_ack : std_logic_vector(0 downto 0);
  signal ms_storage_buffer_1_lr_addr : std_logic_vector(0 downto 0);
  signal ms_storage_buffer_1_lr_tag : std_logic_vector(0 downto 0);
  signal ms_storage_buffer_1_lc_req : std_logic_vector(0 downto 0);
  signal ms_storage_buffer_1_lc_ack :  std_logic_vector(0 downto 0);
  signal ms_storage_buffer_1_lc_data : std_logic_vector(9 downto 0);
  signal ms_storage_buffer_1_lc_tag :  std_logic_vector(0 downto 0);
  signal ms_storage_buffer_1_sr_req :  std_logic_vector(0 downto 0);
  signal ms_storage_buffer_1_sr_ack : std_logic_vector(0 downto 0);
  signal ms_storage_buffer_1_sr_addr : std_logic_vector(0 downto 0);
  signal ms_storage_buffer_1_sr_data : std_logic_vector(9 downto 0);
  signal ms_storage_buffer_1_sr_tag : std_logic_vector(0 downto 0);
  signal ms_storage_buffer_1_sc_req : std_logic_vector(0 downto 0);
  signal ms_storage_buffer_1_sc_ack :  std_logic_vector(0 downto 0);
  signal ms_storage_buffer_1_sc_tag :  std_logic_vector(0 downto 0);
  -- interface signals to connect to memory space ms_storage_scratch_3
  signal ms_storage_scratch_3_lr_req :  std_logic_vector(0 downto 0);
  signal ms_storage_scratch_3_lr_ack : std_logic_vector(0 downto 0);
  signal ms_storage_scratch_3_lr_addr : std_logic_vector(5 downto 0);
  signal ms_storage_scratch_3_lr_tag : std_logic_vector(0 downto 0);
  signal ms_storage_scratch_3_lc_req : std_logic_vector(0 downto 0);
  signal ms_storage_scratch_3_lc_ack :  std_logic_vector(0 downto 0);
  signal ms_storage_scratch_3_lc_data : std_logic_vector(9 downto 0);
  signal ms_storage_scratch_3_lc_tag :  std_logic_vector(0 downto 0);
  signal ms_storage_scratch_3_sr_req :  std_logic_vector(0 downto 0);
  signal ms_storage_scratch_3_sr_ack : std_logic_vector(0 downto 0);
  signal ms_storage_scratch_3_sr_addr : std_logic_vector(5 downto 0);
  signal ms_storage_scratch_3_sr_data : std_logic_vector(9 downto 0);
  signal ms_storage_scratch_3_sr_tag : std_logic_vector(0 downto 0);
  signal ms_storage_scratch_3_sc_req : std_logic_vector(0 downto 0);
  signal ms_storage_scratch_3_sc_ack :  std_logic_vector(0 downto 0);
  signal ms_storage_scratch_3_sc_tag :  std_logic_vector(0 downto 0);
  -- declarations related to module sum_mod
  component sum_mod is -- 
    port ( -- 
      a : in  std_logic_vector(9 downto 0);
      b : out  std_logic_vector(9 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start : in std_logic;
      fin   : out std_logic;
      ms_storage_buffer_1_lr_req : out  std_logic_vector(0 downto 0);
      ms_storage_buffer_1_lr_ack : in   std_logic_vector(0 downto 0);
      ms_storage_buffer_1_lr_addr : out  std_logic_vector(0 downto 0);
      ms_storage_buffer_1_lr_tag :  out  std_logic_vector(0 downto 0);
      ms_storage_buffer_1_lc_req : out  std_logic_vector(0 downto 0);
      ms_storage_buffer_1_lc_ack : in   std_logic_vector(0 downto 0);
      ms_storage_buffer_1_lc_data : in   std_logic_vector(9 downto 0);
      ms_storage_buffer_1_lc_tag :  in  std_logic_vector(0 downto 0);
      ms_storage_scratch_3_lr_req : out  std_logic_vector(0 downto 0);
      ms_storage_scratch_3_lr_ack : in   std_logic_vector(0 downto 0);
      ms_storage_scratch_3_lr_addr : out  std_logic_vector(5 downto 0);
      ms_storage_scratch_3_lr_tag :  out  std_logic_vector(0 downto 0);
      ms_storage_scratch_3_lc_req : out  std_logic_vector(0 downto 0);
      ms_storage_scratch_3_lc_ack : in   std_logic_vector(0 downto 0);
      ms_storage_scratch_3_lc_data : in   std_logic_vector(9 downto 0);
      ms_storage_scratch_3_lc_tag :  in  std_logic_vector(0 downto 0);
      ms_storage_buffer_1_sr_req : out  std_logic_vector(0 downto 0);
      ms_storage_buffer_1_sr_ack : in   std_logic_vector(0 downto 0);
      ms_storage_buffer_1_sr_addr : out  std_logic_vector(0 downto 0);
      ms_storage_buffer_1_sr_data : out  std_logic_vector(9 downto 0);
      ms_storage_buffer_1_sr_tag :  out  std_logic_vector(0 downto 0);
      ms_storage_buffer_1_sc_req : out  std_logic_vector(0 downto 0);
      ms_storage_buffer_1_sc_ack : in   std_logic_vector(0 downto 0);
      ms_storage_buffer_1_sc_tag :  in  std_logic_vector(0 downto 0);
      ms_storage_scratch_3_sr_req : out  std_logic_vector(0 downto 0);
      ms_storage_scratch_3_sr_ack : in   std_logic_vector(0 downto 0);
      ms_storage_scratch_3_sr_addr : out  std_logic_vector(5 downto 0);
      ms_storage_scratch_3_sr_data : out  std_logic_vector(9 downto 0);
      ms_storage_scratch_3_sr_tag :  out  std_logic_vector(0 downto 0);
      ms_storage_scratch_3_sc_req : out  std_logic_vector(0 downto 0);
      ms_storage_scratch_3_sc_ack : in   std_logic_vector(0 downto 0);
      ms_storage_scratch_3_sc_tag :  in  std_logic_vector(0 downto 0);
      tag_in: in std_logic_vector(0 downto 0);
      tag_out: out std_logic_vector(0 downto 0)-- 
    );
    -- 
  end component;
  -- 
begin -- 
  -- module sum_mod
  sum_mod_instance:sum_mod-- 
    port map(-- 
      a => sum_mod_a,
      b => sum_mod_b,
      start => sum_mod_start,
      fin => sum_mod_fin,
      clk => clk,
      reset => reset,
      ms_storage_buffer_1_lr_req => ms_storage_buffer_1_lr_req(0 downto 0),
      ms_storage_buffer_1_lr_ack => ms_storage_buffer_1_lr_ack(0 downto 0),
      ms_storage_buffer_1_lr_addr => ms_storage_buffer_1_lr_addr(0 downto 0),
      ms_storage_buffer_1_lr_tag => ms_storage_buffer_1_lr_tag(0 downto 0),
      ms_storage_buffer_1_lc_req => ms_storage_buffer_1_lc_req(0 downto 0),
      ms_storage_buffer_1_lc_ack => ms_storage_buffer_1_lc_ack(0 downto 0),
      ms_storage_buffer_1_lc_data => ms_storage_buffer_1_lc_data(9 downto 0),
      ms_storage_buffer_1_lc_tag => ms_storage_buffer_1_lc_tag(0 downto 0),
      ms_storage_scratch_3_lr_req => ms_storage_scratch_3_lr_req(0 downto 0),
      ms_storage_scratch_3_lr_ack => ms_storage_scratch_3_lr_ack(0 downto 0),
      ms_storage_scratch_3_lr_addr => ms_storage_scratch_3_lr_addr(5 downto 0),
      ms_storage_scratch_3_lr_tag => ms_storage_scratch_3_lr_tag(0 downto 0),
      ms_storage_scratch_3_lc_req => ms_storage_scratch_3_lc_req(0 downto 0),
      ms_storage_scratch_3_lc_ack => ms_storage_scratch_3_lc_ack(0 downto 0),
      ms_storage_scratch_3_lc_data => ms_storage_scratch_3_lc_data(9 downto 0),
      ms_storage_scratch_3_lc_tag => ms_storage_scratch_3_lc_tag(0 downto 0),
      ms_storage_buffer_1_sr_req => ms_storage_buffer_1_sr_req(0 downto 0),
      ms_storage_buffer_1_sr_ack => ms_storage_buffer_1_sr_ack(0 downto 0),
      ms_storage_buffer_1_sr_addr => ms_storage_buffer_1_sr_addr(0 downto 0),
      ms_storage_buffer_1_sr_data => ms_storage_buffer_1_sr_data(9 downto 0),
      ms_storage_buffer_1_sr_tag => ms_storage_buffer_1_sr_tag(0 downto 0),
      ms_storage_buffer_1_sc_req => ms_storage_buffer_1_sc_req(0 downto 0),
      ms_storage_buffer_1_sc_ack => ms_storage_buffer_1_sc_ack(0 downto 0),
      ms_storage_buffer_1_sc_tag => ms_storage_buffer_1_sc_tag(0 downto 0),
      ms_storage_scratch_3_sr_req => ms_storage_scratch_3_sr_req(0 downto 0),
      ms_storage_scratch_3_sr_ack => ms_storage_scratch_3_sr_ack(0 downto 0),
      ms_storage_scratch_3_sr_addr => ms_storage_scratch_3_sr_addr(5 downto 0),
      ms_storage_scratch_3_sr_data => ms_storage_scratch_3_sr_data(9 downto 0),
      ms_storage_scratch_3_sr_tag => ms_storage_scratch_3_sr_tag(0 downto 0),
      ms_storage_scratch_3_sc_req => ms_storage_scratch_3_sc_req(0 downto 0),
      ms_storage_scratch_3_sc_ack => ms_storage_scratch_3_sc_ack(0 downto 0),
      ms_storage_scratch_3_sc_tag => ms_storage_scratch_3_sc_tag(0 downto 0),
      tag_in => sum_mod_tag_in,
      tag_out => sum_mod_tag_out-- 
    ); -- 
  RegisterBank_ms_storage_buffer_1: register_bank -- 
    generic map(-- 
      num_loads => 1,
      num_stores => 1,
      addr_width => 1,
      data_width => 10,
      tag_width => 1,
      num_registers => 1) -- 
    port map(-- 
      lr_addr_in => ms_storage_buffer_1_lr_addr,
      lr_req_in => ms_storage_buffer_1_lr_req,
      lr_ack_out => ms_storage_buffer_1_lr_ack,
      lr_tag_in => ms_storage_buffer_1_lr_tag,
      lc_req_in => ms_storage_buffer_1_lc_req,
      lc_ack_out => ms_storage_buffer_1_lc_ack,
      lc_data_out => ms_storage_buffer_1_lc_data,
      lc_tag_out => ms_storage_buffer_1_lc_tag,
      sr_addr_in => ms_storage_buffer_1_sr_addr,
      sr_data_in => ms_storage_buffer_1_sr_data,
      sr_req_in => ms_storage_buffer_1_sr_req,
      sr_ack_out => ms_storage_buffer_1_sr_ack,
      sr_tag_in => ms_storage_buffer_1_sr_tag,
      sc_req_in=> ms_storage_buffer_1_sc_req,
      sc_ack_out => ms_storage_buffer_1_sc_ack,
      sc_tag_out => ms_storage_buffer_1_sc_tag,
      clock => clk,
      reset => reset); -- 
  MemorySpace_ms_storage_scratch_3: memory_subsystem -- 
    generic map(-- 
      num_loads => 1,
      num_stores => 1,
      addr_width => 6,
      data_width => 10,
      tag_width => 1,
      number_of_banks => 2,
      mux_degree => 2,
      demux_degree => 2,
      base_bank_addr_width => 10,
      base_bank_data_width => 8
      ) -- 
    port map(-- 
      lr_addr_in => ms_storage_scratch_3_lr_addr,
      lr_req_in => ms_storage_scratch_3_lr_req,
      lr_ack_out => ms_storage_scratch_3_lr_ack,
      lr_tag_in => ms_storage_scratch_3_lr_tag,
      lc_req_in => ms_storage_scratch_3_lc_req,
      lc_ack_out => ms_storage_scratch_3_lc_ack,
      lc_data_out => ms_storage_scratch_3_lc_data,
      lc_tag_out => ms_storage_scratch_3_lc_tag,
      sr_addr_in => ms_storage_scratch_3_sr_addr,
      sr_data_in => ms_storage_scratch_3_sr_data,
      sr_req_in => ms_storage_scratch_3_sr_req,
      sr_ack_out => ms_storage_scratch_3_sr_ack,
      sr_tag_in => ms_storage_scratch_3_sr_tag,
      sc_req_in=> ms_storage_scratch_3_sc_req,
      sc_ack_out => ms_storage_scratch_3_sc_ack,
      sc_tag_out => ms_storage_scratch_3_sc_tag,
      clock => clk,
      reset => reset); -- 
  -- 
end Default;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
library work;
use work.vc_system_package.all;
entity test_system_Test_Bench is -- 
  -- 
end entity;
architecture Default of test_system_Test_Bench is -- 
  component test_system is -- 
    port (-- 
      sum_mod_a : in  std_logic_vector(9 downto 0);
      sum_mod_b : out  std_logic_vector(9 downto 0);
      sum_mod_tag_in: in std_logic_vector(0 downto 0);
      sum_mod_tag_out: out std_logic_vector(0 downto 0);
      sum_mod_start : in std_logic;
      sum_mod_fin   : out std_logic;
      clk : in std_logic;
      reset : in std_logic); -- 
    -- 
  end component;
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal sum_mod_a :  std_logic_vector(9 downto 0);
  signal sum_mod_b :   std_logic_vector(9 downto 0);
  signal sum_mod_tag_in: std_logic_vector(0 downto 0);
  signal sum_mod_tag_out: std_logic_vector(0 downto 0);
  signal sum_mod_start : std_logic := '0';
  signal sum_mod_fin   : std_logic := '0';
  -- 
begin --
  clk <= not clk after 5 ns;
  sum_mod_a <= (0 => '1', 9 => '1', others => '0');
  process
  begin
	wait until clk = '1';
	reset <= '0';
	sum_mod_start <= '1';
	wait until clk = '1';
	sum_mod_start <= '0';
	while sum_mod_fin /= '1' loop
		wait until clk = '1';
	end loop;
	wait;
  end process;

  test_system_instance: test_system -- 
    port map ( -- 
      sum_mod_a => sum_mod_a,
      sum_mod_b => sum_mod_b,
      sum_mod_tag_in => sum_mod_tag_in,
      sum_mod_tag_out => sum_mod_tag_out,
      sum_mod_start => sum_mod_start,
      sum_mod_fin  => sum_mod_fin ,
      clk => clk,
      reset => reset); -- 
  -- 
end Default;

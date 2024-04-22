-- (C) 2001-2021 Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files from any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License Subscription 
-- Agreement, Intel FPGA IP License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Intel and sold by 
-- Intel or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-------------------------------------------------------------------------
-------------------------------------------------------------------------
--
-- Revision Control Information
--
-- $Revision: #1 $
-- $Date: 2009/07/29 $
-- Author : Boon Hong Oh
--
-- Project : Atlantic II Sink Interface with ready_latency=0
--
-- Description : 
--
-- This interface is capable of handling single or multi channel streams as
-- well as blocks of data. The at_sink_sop and at_sink_eop must be fed as
-- described in the Atlantic II specification. The at_sink_error input is a 2-
-- bit signal that complies with the PFC error format (by Kent Orthner). The
-- error checking is extensively done, however the resulting information is
-- still mapped on the available 3 error states as shown below.
-- 00: no error
-- 01: missing sop
-- 10: missing eop
-- 11: unexpected eop
-- other types of errors also marked as 11. 
-- 
-- ALTERA Confidential and Proprietary
-- Copyright 2006 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.auk_dspip_lib_pkg_hpfir.all;
use work.auk_dspip_math_pkg_hpfir.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

entity auk_dspip_avalon_streaming_sink_hpfir is

  generic(
    WIDTH_g          : integer := 24;   -- DATA_PORT_COUNT * DATA_WIDTH
    DATA_WIDTH       : integer := 8;
    DATA_PORT_COUNT  : integer := 3;
    PACKET_SIZE_g    : natural := 2
    --FIFO_DEPTH_g     : natural := 8    --if PFC mode is selected, this generic
                                        --is used for passing the poly_factor.
    --MIN_DATA_COUNT_g : natural := 2;
    --PFC_MODE_g       : boolean := false;
    --SOP_EOP_CALC_g : boolean := false;  -- calculate sop and eop rather than
                                        -- reading value from fifo
    --FAMILY_g         : string  := "Stratix II";
    --MEM_TYPE_g       : string  := "Auto"
    );
  port(
    clk             : in  std_logic;
    reset_n         : in  std_logic;
    ----------------- DESIGN SIDE SIGNALS
    data            : out std_logic_vector(WIDTH_g-1 downto 0);
    data_valid      : out std_logic_vector(0 downto 0);
    
    sink_ready_ctrl : in  std_logic;    --the controller will tell
                                        --the interface whether
                                        --new input can be accepted.
    --sink_stall      : out std_logic;    --needs to stall the design
                                        --if no new data is coming
    packet_error    : out std_logic_vector (1 downto 0);  --this is for SOP and EOP check only.
                                        --when any of these doesn't behave as
                                        --expected, the error is flagged.
    --send_sop        : out std_logic;    -- transmit SOP signal to the design.
                                        -- It only transmits the legal SOP.
    --send_eop        : out std_logic;    -- transmit EOP signal to the design.
                                        -- It only transmits the legal EOP.    
    ----------------- ATLANTIC SIDE SIGNALS
    at_sink_ready   : out std_logic;    --it will be '1' whenever the
                                        --sink_ready_ctrl signal is high.
    at_sink_valid   : in  std_logic;
    at_sink_data    : in  std_logic_vector(WIDTH_g-1 downto 0);
    at_sink_sop     : in  std_logic := '0';
    at_sink_eop     : in  std_logic := '0';
    at_sink_error   : in  std_logic_vector(1 downto 0)  := "00" --it indicates
                                        --that there is an error in the packet.

    );

end auk_dspip_avalon_streaming_sink_hpfir;

-- hds interface_end
architecture rtl of auk_dspip_avalon_streaming_sink_hpfir is

  type STATE_TYPE_t is (start, stall, run1, st_err, end1);  -- stall,run_once,wait1,
  type OUT_STATE_TYPE_t is (normal, empty_and_not_ready, empty_and_ready);
  constant LOG2PACKET_SIZE_c : natural := log2_ceil_one(PACKET_SIZE_g);

  signal sink_state        : STATE_TYPE_t;
  signal sink_next_state   : STATE_TYPE_t;
  signal reset_count       : std_logic;
  signal count_enable      : std_logic;
  signal count             : unsigned(LOG2PACKET_SIZE_c -1 downto 0);
  signal count_finished    : boolean;
  signal at_sink_error_int : std_logic;
  signal packet_error_int  : std_logic_vector (1 downto 0);
  signal packet_error_s    : std_logic_vector(1 downto 0);

  signal at_sink_ready_s   : std_logic;
  --signal reset            : std_logic;
  signal max_reached : boolean;  -- flag to show counter has reached max value

--  component altera_avalon_sc_fifo is
--    generic(
--       SYMBOLS_PER_BEAT : integer := 1;
--       BITS_PER_SYMBOL : integer := 8;
--       FIFO_DEPTH : integer := 16;
--       CHANNEL_WIDTH : integer := 0;
--       ERROR_WIDTH : integer := 0; 
--       USE_PACKETS : integer := 0
--      );
--       port (
--         -- inputs:
--         signal clk : IN STD_LOGIC;
--         signal in_data : IN STD_LOGIC_VECTOR (DATA_WIDTH*DATA_PORT_COUNT-1 DOWNTO 0);
--         signal in_valid : IN STD_LOGIC;
--         signal in_startofpacket : IN STD_LOGIC;
--         signal in_endofpacket : IN STD_LOGIC;                  
--         signal out_ready : IN STD_LOGIC;
--         signal reset : IN STD_LOGIC;
--
--         signal in_empty : IN STD_LOGIC_VECTOR (log2_ceil_one(DATA_PORT_COUNT)-1 DOWNTO 0);
--         signal in_error : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
--         signal in_channel : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
--
--         signal csr_address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
--         signal csr_write : IN STD_LOGIC;
--         signal csr_read : IN STD_LOGIC;
--         signal csr_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
--
--         -- outputs:
--         signal in_ready : OUT STD_LOGIC;
--         signal out_data : OUT STD_LOGIC_VECTOR (DATA_WIDTH*DATA_PORT_COUNT-1 DOWNTO 0);
--         signal out_valid : OUT STD_LOGIC;
--
--         signal out_empty : OUT STD_LOGIC_VECTOR (log2_ceil_one(DATA_PORT_COUNT)-1 DOWNTO 0);
--         signal out_error : OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
--         signal out_channel : OUT STD_LOGIC_VECTOR (0 DOWNTO 0)
--       );
--    end component altera_avalon_sc_fifo;
begin

  valid_generate_single : if PACKET_SIZE_g = 1 generate
    signal packet_error0 : std_logic;
  begin
    at_sink_error_int <= at_sink_error(0) when at_sink_valid = '1' else
                         '0';
    
    packet_error_int  <= '0' & packet_error0;

    packet_error0 <= '0' when at_sink_error_int = '0' and sink_next_state /= st_err else
                     '1';

    sink_comb_update_1 : process (sink_state, at_sink_valid, at_sink_error_int, at_sink_ready_s)
    begin  -- process sink_comb_update_1
      case sink_state is
        when start =>
          --fifo_wrreq <= '0';
          if at_sink_error_int = '1' then
            sink_next_state <= st_err;
          else
            if at_sink_ready_s = '0' and at_sink_valid = '0' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '0' and at_sink_valid = '1' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '1' and at_sink_valid = '0' then
              sink_next_state <= stall;
            elsif at_sink_ready_s = '1' and at_sink_valid = '1' then
              sink_next_state <= run1;
            else
              sink_next_state <= st_err;
            end if;
          end if;
        when stall =>
          --fifo_wrreq <= '0';
          if at_sink_error_int = '1' then
            sink_next_state <= st_err;
          else
            if at_sink_ready_s = '0' and at_sink_valid = '0' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '0' and at_sink_valid = '1' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '1' and at_sink_valid = '0' then
              sink_next_state <= stall;
            elsif at_sink_ready_s = '1' and at_sink_valid = '1' then
              sink_next_state <= run1;
            else
              sink_next_state <= st_err;
            end if;
          end if;

        when run1 =>
          --fifo_wrreq <= '1';
          if at_sink_error_int = '1' then
            sink_next_state <= st_err;
          else
            if at_sink_ready_s = '0' and at_sink_valid = '0' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '0' and at_sink_valid = '1' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '1' and at_sink_valid = '0' then
              sink_next_state <= stall;
            elsif at_sink_ready_s = '1' and at_sink_valid = '1' then
              sink_next_state <= run1;
            else
              sink_next_state <= st_err;
            end if;
          end if;

        when st_err =>
          --fifo_wrreq <= '0';
          if at_sink_error_int = '1' then
            sink_next_state <= st_err;
          else
            if at_sink_ready_s = '0' and at_sink_valid = '0' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '0' and at_sink_valid = '1' then
              sink_next_state <= start;
            elsif at_sink_ready_s = '1' and at_sink_valid = '0' then
              sink_next_state <= stall;
            elsif at_sink_ready_s = '1' and at_sink_valid = '1' then
              sink_next_state <= run1;
            else
              sink_next_state <= st_err;
            end if;
          end if;

        when others =>
          sink_next_state <= st_err;
          --fifo_wrreq      <= '0';
      end case;
    end process sink_comb_update_1;
  end generate valid_generate_single;
  

  valid_generate_mult : if PACKET_SIZE_g > 1 generate
    
    at_sink_error_int <= at_sink_error(1) or at_sink_error(0) when at_sink_valid = '1' else
                         '0';

    count_enable <= '1' when (sink_next_state = run1 or sink_next_state = end1) else  --
                    --or sink_next_state = run_once) else
                    '0';
    reset_count <= '1' when sink_next_state = st_err else
                   '0';
    
    sink_comb_update_2 : process (sink_state, at_sink_ready_s, at_sink_valid,
                                  at_sink_error, at_sink_error_int, at_sink_sop,
                                  at_sink_eop, count, count_finished)
    begin  -- process sink_comb_update_2
      case sink_state is
        when start =>
          --fifo_wrreq <= '0';

          if at_sink_error_int = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= at_sink_error;
          else
            if at_sink_ready_s = '1' and at_sink_valid = '1' and at_sink_sop = '1' then
              sink_next_state  <= run1;
              packet_error_int <= "00";
            elsif (at_sink_ready_s = '1' and at_sink_valid = '1' and at_sink_sop = '0') then
              sink_next_state  <= st_err;
              packet_error_int <= "01";
            else
              sink_next_state  <= start;
              packet_error_int <= "00";
            end if;
          end if;
          
        when run1 =>
          --fifo_wrreq <= '1';

          if at_sink_error_int = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= at_sink_error;
          elsif at_sink_sop = '1' and at_sink_valid = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= "01";
          elsif (count_finished = false and at_sink_eop = '1' and at_sink_valid = '1') then
            sink_next_state  <= st_err;
            packet_error_int <= "11";
          else
            if at_sink_eop = '0' and count_finished = false and at_sink_valid = '1' and at_sink_ready_s = '1' then
              sink_next_state  <= run1;
              packet_error_int <= "00";
            elsif at_sink_eop = '1' and count_finished = true and at_sink_valid = '1' and at_sink_ready_s = '1' then
              sink_next_state  <= end1;
              packet_error_int <= "00";
            elsif (count_finished = true and at_sink_valid = '0' and at_sink_ready_s = '1') or
              (at_sink_valid = '0' and at_sink_ready_s = '1') then
              sink_next_state  <= stall;
              packet_error_int <= "00";
            elsif (count_finished = true and at_sink_ready_s = '0') or (at_sink_eop = '0' and at_sink_ready_s = '0') then
              sink_next_state  <= stall;  --wait1;
              packet_error_int <= "00";
            elsif (count_finished = true and at_sink_eop = '0' and at_sink_valid = '1' and at_sink_ready_s = '1') then
              sink_next_state  <= st_err;
              packet_error_int <= "10";
            else
              sink_next_state  <= st_err;
              packet_error_int <= "11";
            end if;
          end if;
        when stall =>
          --fifo_wrreq <= '0';

          if at_sink_error_int = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= at_sink_error;
          elsif at_sink_sop = '1' and at_sink_valid = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= "01";
          elsif (count_finished = false and at_sink_eop = '1' and at_sink_valid = '1') then
            sink_next_state  <= st_err;
            packet_error_int <= "11";
          else
            if at_sink_eop = '0' and count_finished = false and at_sink_valid = '1' and at_sink_ready_s = '1' then  --and at_sink_ready_int = '1' then
              sink_next_state  <= run1;
              packet_error_int <= "00";
            elsif at_sink_eop = '1' and count_finished = true and at_sink_valid = '1' and at_sink_ready_s = '1' then
              sink_next_state  <= end1;
              packet_error_int <= "00";
            elsif (count_finished = true and at_sink_valid = '0') or  -- and at_sink_ready_s = '1') or
              (at_sink_valid = '0' and at_sink_ready_s = '1') then
              sink_next_state  <= stall;
              packet_error_int <= "00";
            elsif (count_finished = true and at_sink_ready_s = '0') or (at_sink_eop = '0' and at_sink_ready_s = '0') then
              sink_next_state  <= stall;                              --wait1;
              packet_error_int <= "00";
            elsif (count_finished = true and at_sink_eop = '0' and at_sink_valid = '1' and at_sink_ready_s = '1') then
              sink_next_state  <= st_err;
              packet_error_int <= "10";
            else
              sink_next_state  <= st_err;
              packet_error_int <= "11";
            end if;
          end if;

        when end1 =>
          --fifo_wrreq <= '1';

          if at_sink_error_int = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= at_sink_error;
          else
            if at_sink_ready_s = '1' and at_sink_valid = '1' and at_sink_sop = '1' then
              sink_next_state  <= run1;
              packet_error_int <= "00";
            elsif (at_sink_valid = '1' and at_sink_sop = '0') then
              sink_next_state  <= st_err;
              packet_error_int <= "01";
            else
              sink_next_state  <= start;
              packet_error_int <= "00";
            end if;
          end if;
        when st_err =>
          --fifo_wrreq <= '0';
          if at_sink_error_int = '1' then
            sink_next_state  <= st_err;
            packet_error_int <= at_sink_error;
          else
            if at_sink_ready_s = '1' and at_sink_valid = '1' and at_sink_sop = '1' then
              sink_next_state  <= run1;
              packet_error_int <= "00";
            elsif (at_sink_ready_s = '1' and at_sink_valid = '1' and at_sink_sop = '0') then
              sink_next_state  <= st_err;
              packet_error_int <= "01";
            else
              sink_next_state  <= start;
              packet_error_int <= "00";
            end if;
          end if;
        when others => null;
      end case;
    end process sink_comb_update_2;
    

    counter : process (clk, reset_n)
    begin  -- process counter
      if reset_n = '0' then
        count <= (others => '0');
         max_reached <= false;
      elsif clk'event and clk = '1' then  -- rising clock edge
        if reset_count = '1' then
          count <= (others => '0');
        else
          if count_enable = '1' then
            if count = PACKET_SIZE_g-2 then
              max_reached <= true; 
            else
              max_reached <= false;
            end if;
            
            if max_reached = false then
              count <= count + 1;
            else
              count <= (others => '0');
            end if;
          end if;
        end if;
      end if;
    end process counter;

    count_finished <= max_reached;

  end generate valid_generate_mult;

  sink_input_update : process (clk, reset_n)
  begin  -- process
    if reset_n = '0' then
      sink_state <= start;
    elsif clk'event and clk = '1' then
      sink_state <= sink_next_state;
    end if;
  end process sink_input_update;

--   sink_output_update : process (clk, reset_n)
--   begin  -- process
--     if reset_n = '0' then
--       sink_out_state <= normal;
--     elsif clk'event and clk = '1' then
--       sink_out_state <= sink_out_next_state;
--     end if;
--   end process sink_output_update;

  error_register : process (clk, reset_n)
  begin  -- process
    if reset_n = '0' then
      packet_error_s <= "00";
    elsif clk'event and clk = '1' then
      packet_error_s <= packet_error_int;
    end if;
  end process;
  
  packet_error <= packet_error_s;
  
  -----------------------------------------------------------------------------
  -- This was included because the vho simulations of fifo produce 'X' in
  -- reset whcih means that for the FFT, alll outputs go to X when sop = X
  -----------------------------------------------------------------------------
 --gen_calc_sop: if SOP_EOP_CALC_g = true generate
--
--   -- generate sop and eop separate
--  out_cnt_p : process (clk, reset)
--  begin  -- process out_cnt_p
--    if reset = '1' then  
--      fifo_rdreq_d <= '0';
--      out_cnt <= 0;
--    elsif rising_edge(clk) then
--      fifo_rdreq_d <= fifo_rdreq;
--      if fifo_rdreq = '1' then  
--        if out_cnt < PACKET_SIZE_g - 1  then
--          out_cnt <= out_cnt + 1;
--          else
--            out_cnt <= 0;
--        end if;
--      end if;
--    end if;
--  end process out_cnt_p;
--   
--   send_sop_eop_p : process (clk, reset)
--   begin  -- process send_sop_eop_p
--     if reset = '1' then  
--       send_sop_s <= '0';
--       send_eop_s <= '0';
--     elsif rising_edge(clk) then 
--       if fifo_rdreq = '1' and sink_ready_ctrl = '1' then
--         send_sop_s <= '0';
--         send_eop_s <= '0';
--         if out_cnt = 0 then
--           send_sop_s <= '1';
--         end if;
--         if out_cnt = PACKET_SIZE_g - 1 then
--           send_eop_s <= '1';
--         end if;
--       end if;
--     end if;
--   end process send_sop_eop_p;
--    
--  end generate gen_calc_sop;
 
   

  --reset <= not reset_n;
  at_sink_ready <= at_sink_ready_s;
  at_sink_ready_s <= sink_ready_ctrl;
  data <= at_sink_data;
  data_valid(0) <= at_sink_valid;  
    
--  sink_scfifo : altera_avalon_sc_fifo
--      generic map (
--        SYMBOLS_PER_BEAT => DATA_PORT_COUNT,
--        BITS_PER_SYMBOL  => DATA_WIDTH,
--        FIFO_DEPTH       => FIFO_DEPTH_g,
--        CHANNEL_WIDTH    => 0,
--        ERROR_WIDTH      => 0,
--        USE_PACKETS      => 0)
--      port map (
--        clk => clk,
--        reset => reset,
--        in_ready => at_sink_ready_s,
--        in_data => at_sink_data,
--        in_valid => at_sink_valid,
--        in_startofpacket => '0',               
--        in_endofpacket => '0',
--        out_ready => sink_ready_ctrl,
--        out_data => data,
--        out_valid => data_valid(0),
--        in_empty => (others => '0'),
--        in_error => (others => '0'),
--        in_channel => (others => '0'),
--        csr_address => (others => '0'),
--        csr_write => '0',
--        csr_read => '0',
--        csr_writedata => (others => '0'),
--        out_empty => open,
--        out_error => open,
--        out_channel => open);

end rtl;

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
-- Author   :  Boon Hong Oh
--
-- Project      :  Avalon_streaming II Source Interface with ready_latency=0
--
-- Description : 
--
-- This interface is capable of handling single or multi channel streams as
-- well as blocks of data. The at_source_sop and at_source_eop are generated as
-- described in the Avalon_streaming II specification. The at_source_error output is a 2-
-- bit signal that complies with the PFC error format (by Kent Orthner). 
-- 
-- 00: no error
-- 01: missing sop
-- 10: missing eop
-- 11: unexpected eop
-- other types of errors also marked as 11. Any error signal is accompanied
-- by at_sink_eop flagged high. 
--
-- When packet_size is greater than one, this interface expects the main design
-- to supply the count of data starting from 1 to the packet_size. When it
-- receives the valid flag together with the data_count=1, it starts pumping
-- out data by flagging the at_source_sop and at_source_valid both high.
--
-- When the data_count=packet_size, the at_source_eop is flagged high together
-- with at_source_valid.  THERE IS NO ERROR CHECKING FOR THE data_count signal.
--
-- If the receiver is not ready to accept any data, the interface flags the source_
-- stall signal high to tell the design to stall. It is the designers
-- responsibility to use this signal properly. In some design, the stall signal
-- needs to stall all of the design so that no new data can be accepted (as in
-- FIR), in other cases (i.e. a FIFO built on a dual port RAM),the input can
-- still accept new data although it cannot send any output.
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

library altera_mf;
use altera_mf.altera_mf_components.all;

use work.auk_dspip_math_pkg_hpfir.all;

entity auk_dspip_avalon_streaming_source_hpfir is
  generic(
    WIDTH_g                 : integer := 8;   -- DATA_PORT_COUNT * DATA_WIDTH
    DATA_WIDTH              : integer := 8;
    DATA_PORT_COUNT         : integer := 1;
    PACKET_SIZE_g           : natural := 2;
    FIFO_DEPTH_g            : natural := 0; 
    HAVE_COUNTER_g          : boolean := false;
    COUNTER_LIMIT_g         : natural := 4;
    --MULTI_CHANNEL_g         : boolean := true;
    USE_PACKETS             : integer := 1;
    --FAMILY_g                : string  := "Stratix II";
    --MEM_TYPE_g              : string  := "Auto";
    ENABLE_BACKPRESSURE_g   : boolean := true
    );
  port(
    clk               : in  std_logic;
    reset_n           : in  std_logic;
    ----------------- DESIGN SIDE SIGNALS
    data_in           : in  std_logic_vector (WIDTH_g-1 downto 0);
    data_count        : in  std_logic_vector (log2_ceil_one(PACKET_SIZE_g)-1 downto 0) := (others => '0');
    source_valid_ctrl : in  std_logic;
    source_stall      : out std_logic;
    packet_error      : in  std_logic_vector (1 downto 0);
    ----------------- AVALON_STREAMING SIDE SIGNALS
    at_source_ready   : in  std_logic;
    at_source_valid   : out std_logic;
    at_source_data    : out std_logic_vector (WIDTH_g-1 downto 0);
    at_source_channel : out std_logic_vector (log2_ceil_one(PACKET_SIZE_g)-1 downto 0);
    at_source_error   : out std_logic_vector (1 downto 0);
    at_source_sop     : out std_logic;
    at_source_eop     : out std_logic
    );

-- Declarations

end auk_dspip_avalon_streaming_source_hpfir;

-- hds interface_end
architecture rtl of auk_dspip_avalon_streaming_source_hpfir is

  --constant FIFO_HINT_c          : string  := "RAM_BLOCK_TYPE="& MEM_TYPE_g;
  constant FIFO_DEPTH_c         : natural := FIFO_DEPTH_g;
  constant LOG2PACKET_SIZE_c    : natural := log2_ceil_one(PACKET_SIZE_g);
  constant MIN_DATA_COUNT_g     : natural := 2;
  type STATE_TYPE_t is (start, sop, run1, st_err, end1);  --wait1, stall,
  signal source_state           : STATE_TYPE_t;
  signal source_next_state      : STATE_TYPE_t;
  signal packet_error0          : std_logic;
  signal at_source_error_int    : std_logic_vector(1 downto 0);
  signal at_source_sop_int      : std_logic := '0';
  signal at_source_eop_int      : std_logic := '0';
  signal count_finished         : boolean := false;
  signal count_started          : boolean := false;
  signal at_source_valid_s      : std_logic;
  
  signal data_valid             : std_logic;
  signal data_out               : std_logic_vector(WIDTH_g-1 downto 0);
  signal fifo_count             : std_logic_vector(DATA_PORT_COUNT*log2_ceil(FIFO_DEPTH_g)-1 downto 0);
  signal fifo_empty             : std_logic_vector(DATA_PORT_COUNT-1 downto 0);  -- multichan, multiinout
  signal fifo_alm_empty         : std_logic_vector(DATA_PORT_COUNT-1 downto 0);
  signal fifo_alm_full          : std_logic_vector(DATA_PORT_COUNT-1 downto 0);
  signal fifo_full              : std_logic_vector(DATA_PORT_COUNT-1 downto 0); 
  signal clear_fifo             : std_logic;
  signal fifo_rdreq             : std_logic;
  signal fifo_rdreq_d           : std_logic;
  signal fifo_wrreq             : std_logic;
  signal fifo_empty_d           : std_logic;
  signal reset_design_int       : std_logic;   
  signal channel_out            : std_logic_vector(log2_ceil_one(PACKET_SIZE_g)-1 downto 0) := (others => '0');
  
  signal fifo_sop_in            : std_logic := '0';
  signal fifo_eop_in            : std_logic := '0';
  signal fifo_error_in          : std_logic_vector(1 downto 0);
  signal at_source_sop_s        : std_logic := '0';
  signal at_source_eop_s        : std_logic := '0'; 
  signal at_source_error_s      : std_logic_vector(1 downto 0);  
  signal in_ready               : std_logic;
  
  component altera_avalon_sc_fifo is
    generic(
       SYMBOLS_PER_BEAT : integer := 1;
       BITS_PER_SYMBOL : integer := 8;
       FIFO_DEPTH : integer := 16;
       CHANNEL_WIDTH : integer := 2;
       ERROR_WIDTH : integer := 2;
       --EMPTY_LATENCY : integer := 0;
       USE_PACKETS : integer := 0
      );
       port (
         -- inputs:
         signal clk : IN STD_LOGIC;
         signal in_channel : IN STD_LOGIC_VECTOR (log2_ceil_one(PACKET_SIZE_g)-1 DOWNTO 0);
         signal in_data : IN STD_LOGIC_VECTOR (DATA_WIDTH*DATA_PORT_COUNT-1 DOWNTO 0);
         signal in_error : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
         signal in_endofpacket : IN STD_LOGIC;
         signal in_startofpacket : IN STD_LOGIC;
         signal in_valid : IN STD_LOGIC;
         signal out_ready : IN STD_LOGIC;
         signal reset : IN STD_LOGIC;

         signal in_empty : IN STD_LOGIC_VECTOR (log2_ceil_one(DATA_PORT_COUNT)-1 DOWNTO 0);
         
         signal csr_address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
         signal csr_write : IN STD_LOGIC;
         signal csr_read : IN STD_LOGIC;
         signal csr_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

         -- outputs:
         signal in_ready : OUT STD_LOGIC;
         signal out_channel : OUT STD_LOGIC_VECTOR (log2_ceil_one(PACKET_SIZE_g)-1 DOWNTO 0);
         signal out_data : OUT STD_LOGIC_VECTOR (DATA_WIDTH*DATA_PORT_COUNT-1 DOWNTO 0);
         signal out_error : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
         signal out_endofpacket : OUT STD_LOGIC;
         signal out_startofpacket : OUT STD_LOGIC;
         signal out_valid : OUT STD_LOGIC;
         signal out_empty : OUT STD_LOGIC_VECTOR (log2_ceil_one(DATA_PORT_COUNT)-1 DOWNTO 0)
       );
    end component altera_avalon_sc_fifo;

begin
    single_channel : if USE_PACKETS = 0 generate
      at_source_sop_int      <= '0';
      at_source_eop_int      <= '0';
      packet_error0          <= packet_error(0);
      at_source_error_int(1) <= '0';
      at_source_error_int(0) <= packet_error0;  
    end generate single_channel;
    
    packet_multi : if USE_PACKETS = 1 generate
      packet_error0 <= packet_error(1) or packet_error(0);
    
      counter_no : if HAVE_COUNTER_g = false generate
        signal data_counter : unsigned(LOG2PACKET_SIZE_c-1 downto 0);
      begin
         count_finished <= true when data_counter = to_unsigned(PACKET_SIZE_g-1, LOG2PACKET_SIZE_c) else
                          false;
         data_counter  <= unsigned(data_count);
        
         count_started <= true when data_counter = 0 else
                         false;
      end generate counter_no;
    
      counter_yes : if HAVE_COUNTER_g = true generate
        signal data_counter : unsigned(log2_ceil(COUNTER_LIMIT_g)-1 downto 0);
      begin
        count_finished <= true when data_counter = to_unsigned(COUNTER_LIMIT_g-1, log2_ceil(COUNTER_LIMIT_g)) else
                          false;
        count_started <= true when data_counter = 0 else
                         false;
                       
        packet_counter : process (clk, reset_n)
        begin  -- process packet_counter
          if reset_n = '0' then
            data_counter <= (others => '0');
          elsif rising_edge(clk) then
            if source_state = start and source_next_state = sop then
              data_counter <= --(others => '0');  --
                              data_counter +1;
            elsif data_valid = '1' and at_source_ready = '1' and (data_counter < COUNTER_LIMIT_g-1) then
              data_counter <= data_counter +1;
            elsif count_finished = true then
              data_counter <= (others => '0');
            end if;
          end if;
        end process packet_counter;
      end generate counter_yes;
        
      source_comb_update : process (--at_source_ready,
                                    count_finished, count_started,
                                    packet_error, packet_error0, source_state, 
                                    --at_source_valid_s
				    in_ready,
                                    source_valid_ctrl)
                                    
      begin  -- process source_comb_update
        
        case source_state is
          when start =>
            if packet_error0 = '1' then
              source_next_state   <= st_err;
              at_source_error_int <= packet_error;
              at_source_sop_int   <= '0';
              at_source_eop_int   <= '1';
            else
              at_source_eop_int   <= '0';
              at_source_error_int <= "00";
              if source_valid_ctrl = '1' and count_started = true then  --and at_source_ready='1' then
                source_next_state <= sop;
                at_source_sop_int <= '1';
              else
                source_next_state <= start;
                at_source_sop_int <= '0';
              end if;
            end if;
            
          when sop =>     
            if packet_error0 = '1' then
              source_next_state   <= st_err;
              at_source_error_int <= packet_error;
              at_source_sop_int   <= '0';
              at_source_eop_int   <= '1';
            else
              at_source_error_int <= "00";
              at_source_eop_int   <= '0';
              --if source_valid_ctrl = '1' and at_source_ready = '1' and count_finished = false then
              if source_valid_ctrl = '1' and in_ready = '1' and count_finished = false then
                if PACKET_SIZE_g > 2 then
                  source_next_state <= run1;
                else
                  source_next_state <= end1;
                end if;
                at_source_sop_int <= '0';
              --elsif (at_source_ready = '1' and source_valid_ctrl = '1' and count_finished = true) or
              elsif (in_ready = '1' and source_valid_ctrl = '1' and count_finished = true) or
                (source_valid_ctrl = '0' and count_finished = true) then  --valid_ctrl_int = '1' and
                source_next_state   <= end1;
                at_source_error_int <= "00";
                at_source_eop_int   <= '1';
                at_source_sop_int   <= '0';
              else
                source_next_state <= sop;
                at_source_sop_int <= '1';
              end if;
            end if;
  
          when run1 =>
            at_source_sop_int <= '0';
  
            if packet_error0 = '1' then
              source_next_state   <= st_err;
              at_source_error_int <= packet_error;
              at_source_eop_int   <= '1';
            else
              --if (at_source_ready = '1' and source_valid_ctrl = '1' and count_finished = true) or
              if (in_ready = '1' and source_valid_ctrl = '1' and count_finished = true) or
                (source_valid_ctrl = '0' and count_finished = true) then  --valid_ctrl_int = '1' and
                source_next_state   <= end1;
                at_source_error_int <= "00";
                at_source_eop_int   <= '1';
              else
                source_next_state   <= run1;
                at_source_error_int <= "00";
                at_source_eop_int   <= '0';
              end if;
            end if;
            
          when end1 =>
  
            if packet_error0 = '1' then
              source_next_state   <= st_err;
              at_source_error_int <= packet_error;
              at_source_sop_int   <= '0';
              at_source_eop_int   <= '1';
            else
              at_source_error_int <= "00";
              --if source_valid_ctrl = '1' and count_started = true and at_source_ready = '1' then
              if source_valid_ctrl = '1' and count_started = true and in_ready = '1' then
                source_next_state <= sop;
                at_source_sop_int <= '1';
                at_source_eop_int <= '0';
              --elsif source_valid_ctrl = '1' and at_source_ready = '1' then
              elsif source_valid_ctrl = '1' and in_ready = '1' then
                source_next_state <= start;
                at_source_sop_int <= '0';
                at_source_eop_int <= '0';
              else
                source_next_state <= end1;
                at_source_sop_int <= '0';
                at_source_eop_int <= '1';
              end if;
            end if;
            
          when st_err =>
            at_source_sop_int <= '0';
            at_source_eop_int <= '0';
            if packet_error0 = '1' then
              source_next_state   <= st_err;
              at_source_error_int <= packet_error;
            else
              source_next_state   <= start;
              at_source_error_int <= "00";
            end if;
          when others =>
            source_next_state   <= st_err;
            at_source_sop_int   <= '0';
            at_source_eop_int   <= '1';
            at_source_error_int <= "11";
            
        end case;
      end process source_comb_update;
      
      source_state_update : process (clk, reset_n)
      begin  -- process
       if reset_n = '0' then
         source_state <= start;
       elsif clk'event and clk = '1' then
         source_state <= source_next_state;
       end if;
      end process source_state_update;
  end generate packet_multi;
    
      at_source_sop <= at_source_sop_s;
      at_source_eop <= at_source_eop_s;      
      at_source_error <= at_source_error_s;
          
      channel_info_exists : if USE_PACKETS = 1 generate
        at_source_channel <= channel_out;
      end generate channel_info_exists;    
      
      no_channel_info : if USE_PACKETS = 0 generate
        at_source_channel <= (others => '0');
      end generate no_channel_info;
     
      at_source_data <= data_out;
      at_source_valid <= data_valid;

      
  backpressure_support: if ENABLE_BACKPRESSURE_g = true generate
    reset_design_int   <= not reset_n;
    
    --source_stall <= not(in_ready);
    source_stall <= not(at_source_ready);
    
    fifo_sop_in <= '0' when USE_PACKETS = 0 else
                   at_source_sop_int;
    
    fifo_eop_in <= '0' when USE_PACKETS = 0 else
                   at_source_eop_int;
    
    fifo_error_in <= "00" when USE_PACKETS = 0 else
                     at_source_error_int;
    
    scfifo : altera_avalon_sc_fifo
      generic map (
        SYMBOLS_PER_BEAT => DATA_PORT_COUNT,
        BITS_PER_SYMBOL  => DATA_WIDTH,
        FIFO_DEPTH       => FIFO_DEPTH_c,
        CHANNEL_WIDTH    => log2_ceil_one(PACKET_SIZE_g),
        ERROR_WIDTH      => 2,
        --EMPTY_LATENCY    => 1,
        USE_PACKETS      => USE_PACKETS)
      port map (
        clk => clk,
        reset => reset_design_int,
        in_ready => in_ready,
        --in_data  => fifo_datain(((0*DATA_WIDTH)+DATA_WIDTH-1) downto (0*DATA_WIDTH)),
        in_data => data_in,
        in_valid => source_valid_ctrl,
        in_error => fifo_error_in,
        in_channel => data_count,
        in_startofpacket => fifo_sop_in,
        in_endofpacket => fifo_eop_in,

        in_empty => (others => '0'),
        csr_address => (others => '0'),
        csr_write => '0',
        csr_read => '0',
        csr_writedata => (others => '0'),
        out_ready => at_source_ready,
        --out_data => fifo_dataout(((0*DATA_WIDTH)+DATA_WIDTH-1) downto (0*DATA_WIDTH)),
        out_data => data_out,
        out_valid => data_valid,
        out_error => at_source_error_s,
        out_channel => channel_out,
        out_startofpacket => at_source_sop_s,
        out_endofpacket => at_source_eop_s,
        out_empty => open);  
     
end generate backpressure_support;


backpressure_no_support: if ENABLE_BACKPRESSURE_g = false generate
  in_ready <= '1';
  source_stall <= '0';
  
  output_registers : process (clk, reset_n)
  begin
    if reset_n = '0' then
      channel_out <= (others => '0');
      data_out <= (others => '0');
      data_valid <= '0';  
      at_source_error_s <= "00";
      at_source_sop_s <= '0';
      at_source_eop_s <= '0';
    elsif rising_edge(clk) then
      channel_out <= data_count;
      data_out <= data_in;
      data_valid <= source_valid_ctrl;  
      at_source_error_s <= at_source_error_int;
      at_source_sop_s <= at_source_sop_int;
      at_source_eop_s <= at_source_eop_int;
    end if;
  end process output_registers;
end generate backpressure_no_support;
  
end rtl;


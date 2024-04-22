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
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;                  
use aHiR_ieee_proposed.float_pkg.all;


package BaseComponents is

  -----------------------------------------------------------------------------
  -- control path components
  -----------------------------------------------------------------------------
  
  component place
    generic (
      capacity : integer := 1;
      marking : integer := 0;
      name : string);

    port (
      preds : in  BooleanArray;
      succs : in  BooleanArray;
      token : out boolean;
      clk   : in  std_logic;
      reset : in  std_logic); 
  end component;

  component place_with_bypass
    generic (
      capacity : integer := 1;
      marking : integer := 0;
      name : string );

    port (
      preds : in  BooleanArray;
      succs : in  BooleanArray;
      token : out boolean;
      clk   : in  std_logic;
      reset : in  std_logic); 
  end component;

  component transition
    generic (name: string);
    port (
      preds      : in BooleanArray;
      symbol_in  : in boolean;
      symbol_out : out boolean); 
  end component;

  component out_transition
    generic (name: string);
      port (preds      : in   BooleanArray;
              symbol_out : out  boolean);
  end component;

  component level_to_pulse 
    generic (name: string; forward_delay: integer; backward_delay: integer);
    port (clk   : in  std_logic;
          reset : in  std_logic;
          lreq: in std_logic;
          lack: out std_logic;
          preq: out boolean;
          pack: in boolean);
  end component;
  
  component control_delay_element 
    generic (name: string; delay_value: integer := 0);
    port (
      req   : in Boolean;
      ack   : out Boolean;
      clk   : in  std_logic;
      reset : in  std_logic);
  end component;

  component pipeline_interlock 
    port (name: string; trigger: in boolean;
          enable : in boolean;
          symbol_out : out  boolean;
          clk: in std_logic;
          reset: in std_logic);
  end component;

  component join is
     generic(number_of_predecessors: integer;
		place_capacity : integer := 1;
		bypass: boolean := true;
      		name : string );
     port (preds      : in   BooleanArray(number_of_predecessors-1 downto 0);
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
  end component;

  component join2 
    generic (bypass : boolean := true; name: string);
    port ( pred0, pred1      : in   Boolean;
           symbol_out : out  boolean;
           clk: in std_logic;
           reset: in std_logic);
  end component;

  component generic_join2 
    generic( marking_0: integer; marking_1: integer;
		  delay_0: integer; delay_1: integer;
		    capacity_0: integer; capacity_1: integer; 
			name : string);
    port ( pred_0, pred_1      : in   Boolean;
    		symbol_out : out  boolean;
		clk: in std_logic;
		reset: in std_logic);
  end component;

  component join3 
    generic (bypass : boolean := true; name: string);
    port ( pred0, pred1, pred2      : in   Boolean;
           symbol_out : out  boolean;
           clk: in std_logic;
           reset: in std_logic);
  end component;

  component join_with_input is
     generic(number_of_predecessors: integer;
		place_capacity : integer := 1;
		bypass: boolean := false;
      		name : string );
     port (preds      : in   BooleanArray(number_of_predecessors-1 downto 0);
    	symbol_in  : in   boolean;
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
  end component;
  
  component  generic_join 
   generic(number_of_predecessors: integer;
		name: string; place_capacities: IntegerArray; place_markings: IntegerArray; place_delays: IntegerArray);
   port ( preds      : in   BooleanArray(number_of_predecessors-1 downto 0);
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
  end component;
  
  component auto_run 
    generic (use_delay : boolean);
    port (clk   : in  std_logic;
    	reset : in  std_logic;
	start_req: out std_logic;
        start_ack: in std_logic;
        fin_req: out std_logic;
        fin_ack: in std_logic);
  end component;

  component loop_terminator 
      generic (name: string; max_iterations_in_flight : integer := 4);
      port(loop_body_exit: in boolean;
       loop_continue: in boolean;
       loop_terminate: in boolean;
       loop_back: out boolean;
       loop_exit: out boolean;
       clk: in std_logic;
       reset: in std_logic);
  end component;
  

  component marked_join is
     generic(number_of_predecessors: integer;
		number_of_marked_predecessors: integer;
		place_capacity : integer := 1;
		bypass: boolean := true;
      		name : string;
		marked_predecessor_bypass: BooleanArray);
     port (preds      : in   BooleanArray(number_of_predecessors-1 downto 0);
           marked_preds      : in   BooleanArray(number_of_marked_predecessors-1 downto 0);
           symbol_out : out  boolean;
           clk: in std_logic;
           reset: in std_logic);
  end component;

  component marked_join_with_input is
     generic(number_of_predecessors: integer;
		number_of_marked_predecessors: integer;
		place_capacity : integer := 1;
		bypass: boolean := false;
      		name : string);
     port (preds      : in   BooleanArray(number_of_predecessors-1 downto 0);
           marked_preds      : in   BooleanArray(number_of_marked_predecessors-1 downto 0);
           symbol_in : in boolean;
           symbol_out : out  boolean;
           clk: in std_logic;
           reset: in std_logic);
  end component;

  component phi_sequencer
    generic (place_capacity: integer; nreqs : integer; nenables : integer; name : string);
    port (
      selects : in BooleanArray(0 to nreqs-1); -- one out of nreqs..
      reqs : out BooleanArray(0 to nreqs-1); -- one out of nreqs
      ack  : in Boolean;
      enables: in BooleanArray(0 to nenables-1);   -- all need to arrive to reenable
      done : out Boolean;
      clk, reset: in std_logic);
  end component;

  component phi_sequencer_v2  is
    generic (place_capacity : integer; 
	      ntriggers : integer; 
	      name : string);
    port (
  	triggers : in BooleanArray(0 to ntriggers-1); 	    -- there are nreq triggers.
  	src_sample_starts : out BooleanArray(0 to ntriggers-1);   -- sample starts for sources.
	src_sample_completes: in BooleanArray(0 to ntriggers-1);  -- sample completes from sources.
  	src_update_starts : out BooleanArray(0 to ntriggers-1);   -- update starts for sources.
	src_update_completes: in BooleanArray(0 to ntriggers-1);  -- update completes from sources.
  	phi_sample_req  : in Boolean;			   	  -- incoming sample-req to phi.
	phi_sample_ack  : out Boolean;				  -- outgoing sample-ack from phi.
  	phi_update_req  : in Boolean;			   	  -- incoming update-req to phi.
	phi_update_ack  : out Boolean;				  -- outgoing update-ack from phi.
  	phi_mux_select_reqs    : out BooleanArray(0 to ntriggers-1);	  -- phi-select mux select reqs.
	phi_mux_ack: in Boolean;				  -- ack from mux signifying select complete.
  	clk, reset: in std_logic);
   end component;

   component conditional_fork is
       generic (name: string; place_capacity: integer := 1; 
			ntriggers: integer);
       port  (triggers: in BooleanArray(0 to ntriggers-1);
			in_transition: in Boolean;
			out_transitions: out BooleanArray(0 to ntriggers-1);
			clk: in std_logic; reset: in std_logic);
   end component;

  component transition_merge 
      generic (name: string);
      port (
	   preds      : in   BooleanArray;
          symbol_out : out  boolean);
  end component;
  
  component access_regulator_base 
    generic (name : string; num_slots: integer := 1);
    port (
      -- the req-ack pair being regulated.
      req   : in Boolean;
      ack   : out Boolean;
      -- the regulated versions of req/ack
      regulated_req : out Boolean;
      regulated_ack : in Boolean;
      -- transitions on the next two will
      -- open up a slot.
      release_req   : in Boolean;
      release_ack   : in Boolean;
      clk   : in  std_logic;
      reset : in  std_logic);
  end component;

  component access_regulator 
    generic (name: string; num_reqs : integer := 1; num_slots: integer := 1; pipeline_depth: integer := 1);
    port (
      -- the req-ack pair being regulated.
      req   : in BooleanArray(num_reqs-1 downto 0);
      ack   : out BooleanArray(num_reqs-1 downto 0);
      -- the regulated versions of req/ack
      regulated_req : out BooleanArray(num_reqs-1 downto 0);
      regulated_ack : in BooleanArray(num_reqs-1 downto 0);
      -- transitions on the next two will
      -- open up a slot.
      release_req   : in BooleanArray(num_reqs-1 downto 0);
      release_ack   : in BooleanArray(num_reqs-1 downto 0);
      clk   : in  std_logic;
      reset : in  std_logic);
   end component;

  -----------------------------------------------------------------------------
  -- miscellaneous
  -----------------------------------------------------------------------------

  component RigidRepeater
    generic(name: string;
	   data_width: integer := 32);
    port(clk: in std_logic;
         reset: in std_logic;
         data_in: in std_logic_vector(data_width-1 downto 0);
         req_in: in std_logic;
         ack_out: out std_logic;
         data_out: out std_logic_vector(data_width-1 downto 0);
         req_out : out std_logic;
         ack_in: in std_logic);
  end component RigidRepeater;
  

  -----------------------------------------------------------------------------
  -- operator base components
  -----------------------------------------------------------------------------
  component GenericCombinationalOperator 
  generic
    (
      name: string;
	   operator_id   : string;          -- operator id
      input1_is_int : Boolean := true; -- false means float
      input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      iwidth_1      : integer;    -- width of input1
      input2_is_int : Boolean := true; -- false means float
      input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      iwidth_2      : integer;    -- width of input2
      num_inputs    : integer := 2;    -- can be 1 or 2.
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      owidth        : integer;          -- width of output.
      constant_operand : std_logic_vector; -- constant operand.. (it is always the second operand)
      constant_width: integer;
      use_constant  : boolean := false
      );
  port (
    data_in       : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
    result      : out std_logic_vector(owidth-1 downto 0)
    );
  end component GenericCombinationalOperator;

  component UnsharedOperatorBase 
    generic
      (
        name: string;
	   operator_id   : string;          -- operator id
        input1_is_int : Boolean := true; -- false means float
        input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
        input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
        iwidth_1      : integer;    -- width of input1
        input2_is_int : Boolean := true; -- false means float
        input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
        input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
        iwidth_2      : integer;    -- width of input2
        num_inputs    : integer := 2;    -- can be 1 or 2.
        output_is_int : Boolean := true;  -- false means that the output is a float
        output_characteristic_width : integer := 0;
        output_mantissa_width       : integer := 0;
        owidth        : integer;          -- width of output.
        constant_operand : std_logic_vector; -- constant operand.. (it is always the second operand)
        constant_width: integer;
        use_constant  : boolean := false  -- if true, the second operand is
                                          -- assumed to be the generic
        );
    port (
      -- req -> ack follow pulse protocol
      reqL:  in Boolean;
      ackL : out Boolean;
      reqR : in Boolean;
      ackR:  out Boolean;
      -- operands.
      dataL      : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
      dataR      : out std_logic_vector(owidth-1 downto 0);
      clk, reset : in  std_logic);
  end component UnsharedOperatorBase;

  component SplitOperatorBase
    generic
      (
        name: string;
	   operator_id   : string;          -- operator id
        input1_is_int : Boolean := true; -- false means float
        input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
        input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
        iwidth_1      : integer;    -- width of input1
        input2_is_int : Boolean := true; -- false means float
        input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
        input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
        iwidth_2      : integer;    -- width of input2
        num_inputs    : integer := 2;    -- can be 1 or 2.
        output_is_int : Boolean := true;  -- false means that the output is a float
        output_characteristic_width : integer := 0;
        output_mantissa_width       : integer := 0;
        owidth        : integer;          -- width of output.
        constant_operand : std_logic_vector; -- constant operand.. (it is always the second operand)
        constant_width: integer;
        twidth        : integer;          -- tag width
        use_constant  : boolean := false  -- if true, the second operand is
                                           -- provided by the generic.
        );
    port (
      -- req/ack follow level protocol
      reqR: out std_logic;
      ackR: in std_logic;
      reqL: in std_logic;
      ackL : out  std_logic;
      -- tagL is passed out to tagR
      tagL       : in  std_logic_vector(twidth-1 downto 0);
      -- input array consists of m sets of 1 or 2 possibly concatenated
      -- operands.
      dataL      : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
      dataR      : out std_logic_vector(owidth-1 downto 0);
      -- tagR is received from tagL, concurrent
      -- with dataR
      tagR       : out std_logic_vector(twidth-1 downto 0);
      clk, reset : in  std_logic);
  end component SplitOperatorBase;


  component SplitOperatorShared
    generic
      (
        name : string;
        operator_id   : string;          -- operator id
        input1_is_int : Boolean := true; -- false means float
        input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
        input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
        iwidth_1      : integer;    -- width of input1
        input2_is_int : Boolean := true; -- false means float
        input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
        input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
        iwidth_2      : integer;    -- width of input2
        num_inputs    : integer := 2;    -- can be 1 or 2.
        output_is_int : Boolean := true;  -- false means that the output is a float
        output_characteristic_width : integer := 0;
        output_mantissa_width       : integer := 0;
        owidth        : integer;          -- width of output.
        constant_operand : std_logic_vector; -- constant operand.. (it is always the second operand)
        constant_width: integer;
        use_constant  : boolean := false;
        no_arbitration: boolean := false;
        min_clock_period: boolean := false;
        num_reqs : integer;  -- how many requesters?
	use_input_buffering: boolean;
        detailed_buffering_per_input: IntegerArray;
        detailed_buffering_per_output: IntegerArray;
	full_rate: boolean := false
        );

    port (
      -- req/ack follow level protocol
      reqL                     : in BooleanArray(num_reqs-1 downto 0);
      ackR                     : out BooleanArray(num_reqs-1 downto 0);
      ackL                     : out BooleanArray(num_reqs-1 downto 0);
      reqR                     : in  BooleanArray(num_reqs-1 downto 0);
      -- input data consists of concatenated pairs of ips
      dataL                    : in std_logic_vector(((iwidth_1 + iwidth_2)*num_reqs)-1 downto 0);
      -- output data consists of concatenated pairs of ops.
      dataR                    : out std_logic_vector((owidth*num_reqs)-1 downto 0);
      -- with dataR
      clk, reset              : in std_logic);
  end component SplitOperatorShared;


  component SplitOperatorSharedTB 
    generic
      ( name: string;
	   g_num_req: integer := 2;
        operator_id: string := "ApIntSle";
        verbose_mode: boolean := false;
        input_data_width: integer := 8;
        output_data_width: integer := 1;
        num_ips : integer := 2;
        tb_id : string
        );
  end component SplitOperatorSharedTB;

  -----------------------------------------------------------------------------
  -- register operator
  -----------------------------------------------------------------------------
  component RegisterBase 
      generic(name: string;
	   in_data_width: integer; out_data_width : integer);
      port(din: in std_logic_vector(in_data_width-1 downto 0);
           dout: out std_logic_vector(out_data_width-1 downto 0);
           req: in boolean;
           ack: out boolean;
           clk,reset: in std_logic);
  end component RegisterBase;

  component SynchResetRegisterSlv is
    generic(name: string; data_width: integer);
    port(din: in std_logic_vector(data_width-1 downto 0);
       dout: out std_logic_vector(data_width-1 downto 0);
       clk,reset: in std_logic);
  end component SynchResetRegisterSlv;

  component SynchResetRegisterUnsigned is
    generic(name: string; data_width: integer);
    port(din: in unsigned(data_width-1 downto 0);
       dout: out unsigned(data_width-1 downto 0);
       clk,reset: in std_logic);
  end component SynchResetRegisterUnsigned;


  -----------------------------------------------------------------------------
  -- queue, fifo, lifo
  -----------------------------------------------------------------------------
  component QueueBaseCore is
  generic(name : string := "Anon"; 
		queue_depth: integer := 3; 
		reverse_bypass_flag: boolean := false;
		data_width: integer := 32);
  port(clk: in std_logic;
       reset: in std_logic;
       empty, full: out std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
  end component QueueBaseCore;
  
  component QueueBase 
    generic(name : string; queue_depth: integer := 2; data_width: integer := 32; save_one_slot: Boolean := false);
    port(clk: in std_logic;
         reset: in std_logic;
         data_in: in std_logic_vector(data_width-1 downto 0);
         push_req: in std_logic;
         push_ack: out std_logic;
         data_out: out std_logic_vector(data_width-1 downto 0);
         pop_ack : out std_logic;
         pop_req: in std_logic);
  end component QueueBase;

  component QueueBaseSaveSlot
    generic(name : string; queue_depth: integer := 2; data_width: integer := 32);
    port(clk: in std_logic;
         reset: in std_logic;
         data_in: in std_logic_vector(data_width-1 downto 0);
         push_req: in std_logic;
         push_ack: out std_logic;
         data_out: out std_logic_vector(data_width-1 downto 0);
         pop_ack : out std_logic;
         pop_req: in std_logic);
  end component QueueBaseSaveSlot;

  component QueueWithBypass is
    generic(name : string; queue_depth: integer := 1; data_width: integer := 32);
    port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
  end component QueueWithBypass;

  component QueueBaseWithBypass
    generic(name : string; queue_depth: integer := 2; data_width: integer := 32);
    port(clk: in std_logic;
         reset: in std_logic;
         data_in: in std_logic_vector(data_width-1 downto 0);
         push_req: in std_logic;
         push_ack: out std_logic;
         data_out: out std_logic_vector(data_width-1 downto 0);
         pop_ack : out std_logic;
         pop_req: in std_logic);
  end component QueueBaseWithBypass;

  component QueueBaseWithEmptyFull
    generic(name : string; queue_depth: integer := 2; reverse_bypass_flag: boolean := false; data_width: integer := 32);
    port(clk: in std_logic;
         reset: in std_logic;
         empty, full: out std_logic;
         data_in: in std_logic_vector(data_width-1 downto 0);
         push_req: in std_logic;
         push_ack: out std_logic;
         data_out: out std_logic_vector(data_width-1 downto 0);
         pop_ack : out std_logic;
         pop_req: in std_logic);
  end component QueueBaseWithEmptyFull;

  component QueueEmptyFullLogic is
	port (clk, reset: in std_logic;
		read,write,eq_flag: in boolean;
		full, empty: out boolean);
  end component;


  --
  -- a special purpose queue which keeps a 1-bit data value.
  --
  component SingleBitQueueBase is
    generic(name : string; queue_depth: integer := 1; bypass_flag: boolean := false);
    port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(0 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(0 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
  end component SingleBitQueueBase;

  component SynchFifoWithDPRAM
    generic(name: string; queue_depth: integer := 3; data_width: integer := 72);
    port(clk: in std_logic;
         reset: in std_logic;
         data_in: in std_logic_vector(data_width-1 downto 0);
         push_req: in std_logic;
         push_ack : out std_logic;
         nearly_full: out std_logic;
         data_out: out std_logic_vector(data_width-1 downto 0);
         pop_ack : out std_logic;
         pop_req: in std_logic);
  end component SynchFifoWithDPRAM;

  component SynchLifo 
    generic(name : string; queue_depth: integer := 3; data_width: integer := 72);
    port(clk: in std_logic;
         reset: in std_logic;
         data_in: in std_logic_vector(data_width-1 downto 0);
         push_req: in std_logic;
         push_ack : out std_logic;
         nearly_full: out std_logic;
         data_out: out std_logic_vector(data_width-1 downto 0);
         pop_ack : out std_logic;
         pop_req: in std_logic);
  end component SynchLifo;
  
  component SynchToAsynchReadInterface 
    generic (
      name: string;
      data_width : integer);
    port (
      clk : in std_logic;
      reset  : in std_logic;
      synch_req : in std_logic;
      synch_ack : out std_logic;
      asynch_req : out std_logic;
      asynch_ack: in std_logic;
      synch_data: in std_logic_vector(data_width-1 downto 0);
      asynch_data : out std_logic_vector(data_width-1 downto 0));
    
  end component SynchToAsynchReadInterface;

  component ShiftRegisterQueue is
    generic(name : string ; queue_depth: integer := 1; data_width: integer := 32);
    port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
  end component;


  component ShiftRegisterSingleBitQueue is
    generic(name : string; queue_depth: integer; number_of_stages: integer; bypass_flag: boolean := false);
    port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(0 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(0 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
  end component ShiftRegisterSingleBitQueue;

  -----------------------------------------------------------------------------
  -- pipe
  -----------------------------------------------------------------------------
  component PipeBase 
    
    generic (name : string;
	     num_reads: integer;
             num_writes: integer;
             data_width: integer;
             lifo_mode: boolean := false;
             depth: integer := 1;
	     signal_mode: boolean := false;
 	     shift_register_mode: boolean := false;
	     save_slot: boolean := false;
	     bypass: boolean := false;
	     full_rate : boolean := false);
    port (
      read_req       : in  std_logic_vector(num_reads-1 downto 0);
      read_ack       : out std_logic_vector(num_reads-1 downto 0);
      read_data      : out std_logic_vector((num_reads*data_width)-1 downto 0);
      write_req       : in  std_logic_vector(num_writes-1 downto 0);
      write_ack       : out std_logic_vector(num_writes-1 downto 0);
      write_data      : in std_logic_vector((num_writes*data_width)-1 downto 0);
      clk, reset : in  std_logic);
    
  end component PipeBase;

  component PipelineRegister is
  generic (name : string;
           data_width: integer);
  port (
    read_req       : in  std_logic;
    read_ack       : out std_logic;
    read_data      : out std_logic_vector(data_width-1 downto 0);
    write_req       : in  std_logic;
    write_ack       : out std_logic;
    write_data      : in std_logic_vector((data_width-1) downto 0);
    clk, reset : in  std_logic);
   end component PipelineRegister;

  -----------------------------------------------------------------------------
  -- phi,branch,select
  -----------------------------------------------------------------------------

  component PhiBase 
    generic (
      name: string;
      num_reqs   : integer;
      data_width : integer;
      bypass_flag: boolean := false);
    port (
      req                 : in  BooleanArray(num_reqs-1 downto 0);
      ack                 : out Boolean;
      idata               : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
      odata               : out std_logic_vector(data_width-1 downto 0);
      clk, reset          : in std_logic);
  end component PhiBase;

  
  component PhiPipelined is
    generic (
      name       : string;
      num_reqs   : integer;
      buffering  : integer;
      data_width : integer);
    port (
      sample_req                 : in  BooleanArray(num_reqs-1 downto 0);
      sample_ack                 : out Boolean;
      update_req                 : in Boolean;
      update_ack                 : out Boolean;
      idata                      : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
      odata                      : out std_logic_vector(data_width-1 downto 0);
      clk, reset                 : in std_logic);
  end component;


  component BranchBase
    generic (
      name: string;
      condition_width : integer;
      bypass_flag: boolean := false);
    port (condition: in std_logic_vector(condition_width-1 downto 0);
          clk,reset: in std_logic;
          req: in Boolean;
          ack0: out Boolean;
          ack1: out Boolean);
  end component;

  component SelectBase 
    generic(name: string; data_width: integer; flow_through: boolean := false);
    port(x,y: in std_logic_vector(data_width-1 downto 0);
         sel: in std_logic_vector(0 downto 0);
         req: in boolean;
         z: out std_logic_vector(data_width-1 downto 0);
         ack: out boolean;
         clk,reset: in std_logic);
  end component SelectBase;

  component Slicebase 
    generic(name: string; in_data_width : integer; high_index: integer; low_index : integer; flow_through : boolean := false);
    port(din: in std_logic_vector(in_data_width-1 downto 0);
         dout: out std_logic_vector(high_index-low_index downto 0);
         req: in boolean;
         ack: out boolean;
         clk,reset: in std_logic);
  end component Slicebase;

  component SliceSplitProtocol is
    generic(name: string; 
	in_data_width : integer; 
	high_index: integer; 
	low_index : integer; 
	buffering : integer;
	flow_through: boolean := false; 
	full_rate: boolean := false
	);
    port(din: in std_logic_vector(in_data_width-1 downto 0);
       dout: out std_logic_vector(high_index-low_index downto 0);
       sample_req: in boolean;
       sample_ack: out boolean;
       update_req: in boolean;
       update_ack: out boolean;
       clk,reset: in std_logic);
  end component;

  -----------------------------------------------------------------------------
  -- mux/demux
  -----------------------------------------------------------------------------
  
  component InputMuxBase 
    generic ( name: string; iwidth: integer;
              owidth: integer;
              twidth: integer;
              nreqs: integer;
              no_arbitration: Boolean;
              registered_output: Boolean);
    port (
      -- req/ack follow pulse protocol
      reqL                 : in  BooleanArray(nreqs-1 downto 0);
      ackL                 : out BooleanArray(nreqs-1 downto 0);
      dataL                : in  std_logic_vector(iwidth-1 downto 0);
      -- output side req/ack level protocol
      reqR                 : out std_logic;
      ackR                 : in  std_logic;
      dataR                : out std_logic_vector(owidth-1 downto 0);
      -- tag specifies the requester index 
      tagR                : out std_logic_vector(twidth-1 downto 0);
      clk, reset          : in std_logic);
  end component InputMuxBase;

  component InputMuxBaseNoData 
    generic ( name: string; twidth: integer;
              nreqs: integer;
              no_arbitration: Boolean);
    port (
      -- req/ack follow pulse protocol
      reqL                 : in  BooleanArray(nreqs-1 downto 0);
      ackL                 : out BooleanArray(nreqs-1 downto 0);
      -- output side req/ack level protocol
      reqR                 : out std_logic;
      ackR                 : in  std_logic;
      -- tag specifies the requester index 
      tagR                : out std_logic_vector(twidth-1 downto 0);
      clk, reset          : in std_logic);
  end component InputMuxBaseNoData;



  component OutputDeMuxBaseNoData
    generic(name : string;
	    twidth: integer;
            nreqs: integer;
	    detailed_buffering_per_output: IntegerArray);
    port (
      -- req/ack follow level protocol
      reqL                 : in  std_logic;
      ackL                 : out std_logic;
      -- tag identifies index to which demux
      -- should happen
      tagL                 : in std_logic_vector(twidth-1 downto 0);
      -- reqR/ackR follow pulse protocol
      -- and are of length n
      reqR                : in BooleanArray(nreqs-1 downto 0);
      ackR                : out  BooleanArray(nreqs-1 downto 0);
      clk, reset          : in std_logic);
  end component OutputDeMuxBaseNoData;

  component OutputDeMuxBase
    generic(name: string; iwidth: integer;
            owidth: integer;
            twidth: integer;
            nreqs: integer;
            no_arbitration: Boolean;
            pipeline_flag : Boolean := true);
    port (
      -- req/ack follow level protocol
      reqL                 : in  std_logic;
      ackL                 : out std_logic;
      dataL                : in  std_logic_vector(iwidth-1 downto 0);
      -- tag identifies index to which demux
      -- should happen
      tagL                 : in std_logic_vector(twidth-1 downto 0);
      -- reqR/ackR follow pulse protocol
      -- and are of length n
      reqR                : in BooleanArray(nreqs-1 downto 0);
      ackR                : out  BooleanArray(nreqs-1 downto 0);
      -- dataR is array(n,m) 
      dataR               : out std_logic_vector(owidth-1 downto 0);
      clk, reset          : in std_logic);
  end component OutputDeMuxBase;
  

  component OutputDeMuxBaseWithBuffering
    generic(name : string;
            iwidth: integer;
            owidth: integer;
            twidth: integer;
            nreqs : integer;
            detailed_buffering_per_output: IntegerArray;
	    full_rate : boolean);
    port (
      -- req/ack follow level protocol
      reqL                 : in  std_logic;
      ackL                 : out std_logic;
      dataL                : in  std_logic_vector(iwidth-1 downto 0);
      -- tag identifies index to which demux
      -- should happen
      tagL                 : in std_logic_vector(twidth-1 downto 0);
      -- reqR/ackR follow pulse protocol
      -- and are of length n
      reqR                : in BooleanArray(nreqs-1 downto 0);
      ackR                : out  BooleanArray(nreqs-1 downto 0);
      -- dataR is array(n,m) 
      dataR               : out std_logic_vector(owidth-1 downto 0);
      clk, reset          : in std_logic);
  end component OutputDeMuxBaseWithBuffering;
  

  -----------------------------------------------------------------------------
  -- call arbiters
  -- there are four forms for the four possibilities of the
  -- called function (in-args+out-args, in-args, out-args, no args)
  -----------------------------------------------------------------------------
  component CallArbiter
    generic(name: string; num_reqs: integer;
            call_data_width: integer;
            return_data_width: integer;
            tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
      -- call port connected to the called module
      call_mreq   : out std_logic;
      call_mack   : in  std_logic;
      call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
      call_mtag   : out std_logic_vector(tag_length-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks : out std_logic_vector(num_reqs-1 downto 0);
      return_data : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
      -- return from function
      -- function to assert mreq arbiter to return mack
      -- ( NOTE: It has to be this way, the arbiter should
      -- accept the return value if it has room)
      return_mreq : in std_logic;
      return_mack : out std_logic;
      return_mdata : in  std_logic_vector(return_data_width-1 downto 0);
      return_mtag : in  std_logic_vector(tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiter;

  component CallArbiterNoInargs
    generic(name: string; num_reqs: integer;
            return_data_width: integer;
            tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      -- call port connected to the called module
      call_mreq   : out std_logic;
      call_mack   : in  std_logic;
      call_mtag   : out std_logic_vector(tag_length-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks : out std_logic_vector(num_reqs-1 downto 0);
      return_data : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
      -- return from function
      -- function to assert mreq arbiter to return mack
      -- ( NOTE: It has to be this way, the arbiter should
      -- accept the return value if it has room)
      return_mreq : in std_logic;
      return_mack : out std_logic;
      return_mdata : in  std_logic_vector(return_data_width-1 downto 0);
      return_mtag : in  std_logic_vector(tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterNoInargs;

  component CallArbiterNoOutargs
    generic(name: string; num_reqs: integer;
            call_data_width: integer;
            tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
      -- call port connected to the called module
      call_mreq   : out std_logic;
      call_mack   : in  std_logic;
      call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
      call_mtag   : out std_logic_vector(tag_length-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks : out std_logic_vector(num_reqs-1 downto 0);
      -- return from function
      -- function to assert mreq arbiter to return mack
      -- ( NOTE: It has to be this way, the arbiter should
      -- accept the return value if it has room)
      return_mreq : in std_logic;
      return_mack : out std_logic;
      return_mtag : in  std_logic_vector(tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterNoOutargs;



  component CallArbiterNoInargsNoOutargs
    generic(name: string; num_reqs: integer;
            tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      -- call port connected to the called module
      call_mreq   : out std_logic;
      call_mack   : in  std_logic;
      call_mtag   : out std_logic_vector(tag_length-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks : out std_logic_vector(num_reqs-1 downto 0);
      -- return from function
      -- function to assert mreq arbiter to return mack
      -- ( NOTE: It has to be this way, the arbiter should
      -- accept the return value if it has room)
      return_mreq : in std_logic;
      return_mack : out std_logic;
      return_mtag : in  std_logic_vector(tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterNoInargsNoOutargs;


  component CallArbiterUnitary
    generic(name: string; num_reqs: integer;
            call_data_width: integer;
            return_data_width: integer;
            caller_tag_length: integer;
            callee_tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
      call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks   : out std_logic_vector(num_reqs-1 downto 0);
      return_data   : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
      return_tag    : out  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- ports connected to the called module
      call_start   : out std_logic;
      call_fin   : in  std_logic;
      call_in_args  : out std_logic_vector(call_data_width-1 downto 0);
      call_in_tag   : out std_logic_vector(callee_tag_length-1 downto 0);
      -- from the called module
      call_out_args : in  std_logic_vector(return_data_width-1 downto 0);
      call_out_tag : in  std_logic_vector(callee_tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterUnitary;


  component CallArbiterUnitaryNoInargs
    generic(name: string; num_reqs: integer;
            return_data_width: integer;
            caller_tag_length: integer;
            callee_tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks   : out std_logic_vector(num_reqs-1 downto 0);
      return_data   : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
      return_tag    : out  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- ports connected to the called module
      call_start   : out std_logic;
      call_fin   : in  std_logic;
      call_in_tag   : out std_logic_vector(callee_tag_length-1 downto 0);
      -- from the called module
      call_out_args : in  std_logic_vector(return_data_width-1 downto 0);
      call_out_tag : in  std_logic_vector(callee_tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterUnitaryNoInargs;

  component CallArbiterUnitaryNoOutargs
    generic(name: string; num_reqs: integer;
            call_data_width: integer;
            caller_tag_length: integer;
            callee_tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
      call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks   : out std_logic_vector(num_reqs-1 downto 0);
      return_tag    : out  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- ports connected to the called module
      call_start   : out std_logic;
      call_fin   : in  std_logic;
      call_in_args  : out std_logic_vector(call_data_width-1 downto 0);
      call_in_tag   : out std_logic_vector(callee_tag_length-1 downto 0);
      -- from the called module
      call_out_tag : in  std_logic_vector(callee_tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterUnitaryNoOutargs;


  component CallArbiterUnitaryNoInargsNoOutargs
    generic(name: string; num_reqs: integer;
            caller_tag_length: integer;
            callee_tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks   : out std_logic_vector(num_reqs-1 downto 0);
      return_tag    : out  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- ports connected to the called module
      call_start   : out std_logic;
      call_fin   : in  std_logic;
      call_in_tag   : out std_logic_vector(callee_tag_length-1 downto 0);
      -- from the called module
      call_out_tag : in  std_logic_vector(callee_tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component CallArbiterUnitaryNoInargsNoOutargs;

  component CallMediator
    port (
      call_req: in std_logic;
      call_ack: out std_logic;
      enable_call_data: out std_logic;
      return_req: in std_logic;
      return_ack: out std_logic;
      enable_return_data: out std_logic;
      start: out std_logic;
      fin: in std_logic;
      clk: in std_logic;
      reset: in std_logic);
  end component CallMediator;

  -----------------------------------------------------------------------------
  --   NobodyLeftBehind..
  --   this is a small utility which ensures that there is no starvation
  --   in the system.. needs to be used as a filter between reqs and priority
  --   encoding.  currently used in split-call arbiters.
  -----------------------------------------------------------------------------
  component  NobodyLeftBehind 
     generic (name: string;  num_reqs : integer := 1);
     port (
       clk,reset : in std_logic;
       reqIn : in std_logic_vector(num_reqs-1 downto 0);
       ackOut: out std_logic_vector(num_reqs-1 downto 0);
       reqOut : out std_logic_vector(num_reqs-1 downto 0);
       ackIn : in std_logic_vector(num_reqs-1 downto 0));
  end component;

  -----------------------------------------------------------------------------
  -- split call arbiters..
  --   Modules will now have a split request-complete handshake
  --   (just like operators)
  -----------------------------------------------------------------------------
  component SplitCallArbiter
    generic(name: string; num_reqs: integer;
	  call_data_width: integer;
	  return_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
      call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- call port connected to the called module
      call_mreq   : out std_logic;
      call_mack   : in  std_logic;
      call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
      call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks : out std_logic_vector(num_reqs-1 downto 0);
      return_data : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
      return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- return from function
      return_mreq : out std_logic;
      return_mack : in std_logic;
      return_mdata : in  std_logic_vector(return_data_width-1 downto 0);
      return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component SplitCallArbiter;

  component SplitCallArbiterNoInargs
  generic(name: string; num_reqs: integer;
	  return_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    return_data : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
    return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- return from function
    return_mreq : out std_logic;
    return_mack : in std_logic;
    return_mdata : in  std_logic_vector(return_data_width-1 downto 0);
    return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
  end component SplitCallArbiterNoInargs;

  component SplitCallArbiterNoOutargs
    generic(name: string; num_reqs: integer;
	  call_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
    call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- return from function
    return_mreq : out std_logic;
    return_mack : in std_logic;
    return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
  end component SplitCallArbiterNoOutargs;



  component SplitCallArbiterNoInargsNoOutargs
    generic(name: string; num_reqs: integer;
            caller_tag_length: integer;
            callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- return from function
    return_mreq : out std_logic;
    return_mack : in std_logic;
    return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
  end component SplitCallArbiterNoInargsNoOutargs;


  -----------------------------------------------------------------------------
  -- IO ports
  -----------------------------------------------------------------------------
  component InputPort
    generic (name: string; num_reqs: integer;
             data_width: integer;
             no_arbitration: boolean);
    port (
      -- pulse interface with the data-path
      req        : in  BooleanArray(num_reqs-1 downto 0);
      ack        : out BooleanArray(num_reqs-1 downto 0);
      data       : out std_logic_vector((num_reqs*data_width)-1 downto 0);
      -- ready/ready interface with outside world
      oreq       : out std_logic;
      oack       : in  std_logic;
      odata      : in  std_logic_vector(data_width-1 downto 0);
      clk, reset : in  std_logic);
  end component;

  component InputPortNoData
    generic (name: string; num_reqs: integer;
             no_arbitration: boolean);
    port (
      -- pulse interface with the data-path
      req        : in  BooleanArray(num_reqs-1 downto 0);
      ack        : out BooleanArray(num_reqs-1 downto 0);
      -- ready/ready interface with outside world
      oreq       : out std_logic;
      oack       : in  std_logic;
      clk, reset : in  std_logic);
  end component;


  component InputPortLevel
    generic (name: string; num_reqs: integer; 
             data_width: integer;  
             no_arbitration: boolean);
    port (
      -- ready/ready interface with the requesters
      req       : in  std_logic_vector(num_reqs-1 downto 0);
      ack       : out std_logic_vector(num_reqs-1 downto 0);
      data      : out std_logic_vector((num_reqs*data_width)-1 downto 0);
      -- ready/ready interface with outside world
      oreq       : out std_logic;
      oack       : in  std_logic;
      odata      : in  std_logic_vector(data_width-1 downto 0);
      clk, reset : in  std_logic);
  end component InputPortLevel;


  component InputPortLevelNoData 
    generic (name: string; num_reqs: integer; 
             no_arbitration: boolean);
    port (
      -- ready/ready interface with the requesters
      req       : in  std_logic_vector(num_reqs-1 downto 0);
      ack       : out std_logic_vector(num_reqs-1 downto 0);
      -- ready/ready interface with outside world
      oreq       : out std_logic;
      oack       : in  std_logic;
      clk, reset : in  std_logic);
  end component;

  component InputPortSingleReader is
  generic (name : string;
	   data_width: integer);
  port (
    -- pulse interface with the data-path
    sample_req        : in  BooleanArray(0 downto 0); -- sacrificial.
    sample_ack        : out BooleanArray(0 downto 0); -- sacrificial.
    update_req        : in  BooleanArray(0 downto 0);
    update_ack        : out BooleanArray(0 downto 0);
    data              : out std_logic_vector((data_width-1) downto 0);
    -- ready/ready interface with outside world
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : in  std_logic_vector((data_width-1) downto 0);
    clk, reset : in  std_logic);
  end component;

  component OutputPort
    generic(name: string; num_reqs: integer;
            data_width: integer;
            no_arbitration: boolean);
    port (
      req        : in  BooleanArray(num_reqs-1 downto 0);
      ack        : out BooleanArray(num_reqs-1 downto 0);
      data       : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
      oreq       : out std_logic;
      oack       : in  std_logic;
      odata      : out std_logic_vector(data_width-1 downto 0);
      clk, reset : in  std_logic);
  end component;


  component OutputPortNoData
    generic(name: string; num_reqs: integer;
            no_arbitration: boolean);
    port (
      req        : in  BooleanArray(num_reqs-1 downto 0);
      ack        : out BooleanArray(num_reqs-1 downto 0);
      oreq       : out std_logic;
      oack       : in  std_logic;
      clk, reset : in  std_logic);
  end component;
  
  component OutputPortLevel
    generic(name: string; num_reqs: integer;
            data_width: integer;
            no_arbitration: boolean);
    port (
      req       : in  std_logic_vector(num_reqs-1 downto 0);
      ack       : out std_logic_vector(num_reqs-1 downto 0);
      data      : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
      oreq       : out std_logic;
      oack       : in  std_logic;
      odata      : out std_logic_vector(data_width-1 downto 0);
      clk, reset : in  std_logic);
  end component;

  component OutputPortLevelNoData 
    generic(name: string; num_reqs: integer;
            no_arbitration: boolean);
    port (
      req       : in  std_logic_vector(num_reqs-1 downto 0);
      ack       : out std_logic_vector(num_reqs-1 downto 0);
      oreq       : out std_logic;
      oack       : in  std_logic;
      clk, reset : in  std_logic);
  end component;

  component OutputPortSingleWriter is
  generic(name : string;
	  data_width: integer);
  port (
    sample_req        : in  BooleanArray(0 downto 0);
    sample_ack        : out BooleanArray(0 downto 0);
    update_req        : in  BooleanArray(0 downto 0); -- sacrificial
    update_ack        : out BooleanArray(0 downto 0); -- sacrificial
    data       : in  std_logic_vector((data_width-1) downto 0);
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : out std_logic_vector((data_width-1) downto 0);
    clk, reset : in  std_logic);
  end component;
  -----------------------------------------------------------------------------
  -- load/store
  -----------------------------------------------------------------------------
  component LoadReqShared
    generic
      (
	name: string; 	addr_width: integer;
      	num_reqs : integer; -- how many requesters?
	tag_length: integer;
	no_arbitration: Boolean;
	time_stamp_width: integer;
        min_clock_period: Boolean
        );
    port (
      -- req/ack follow pulse protocol
      reqL                     : in BooleanArray(num_reqs-1 downto 0);
      ackL                     : out BooleanArray(num_reqs-1 downto 0);
      -- concatenated address corresponding to access
      dataL                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
      -- address to memory
      maddr                   : out std_logic_vector(addr_width-1 downto 0);
      mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);
      mreq                    : out std_logic;
      mack                    : in std_logic;
      -- clock, reset (active high)
      clk, reset              : in std_logic);
  end component LoadReqShared;

  component StoreReqShared
    generic
      (
	name: string;
	addr_width: integer;
	data_width : integer;
	time_stamp_width: integer;
      	num_reqs : integer; -- how many requesters?
	tag_length: integer;
        min_clock_period : boolean;
	no_arbitration: Boolean
        );
    port (
      -- req/ack follow pulse protocol
      reqL                     : in BooleanArray(num_reqs-1 downto 0);
      ackL                     : out BooleanArray(num_reqs-1 downto 0);
      -- address corresponding to access
      addr                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
      data                    : in std_logic_vector((data_width*num_reqs)-1 downto 0);
      -- address to memory
      maddr                   : out std_logic_vector(addr_width-1 downto 0);
      mdata                   : out std_logic_vector(data_width-1 downto 0);
      mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);
      mreq                    : out std_logic;
      mack                    : in std_logic;
      -- clock, reset (active high)
      clk, reset              : in std_logic);
  end component StoreReqShared;


  component LoadCompleteShared
    generic
      (
        name : string;
        data_width: integer;
        tag_length:  integer;
        num_reqs : integer;
        no_arbitration: boolean;
        detailed_buffering_per_output : IntegerArray
        );
    port (
      -- req/ack follow level protocol
      reqR                     : in BooleanArray(num_reqs-1 downto 0);
      ackR                     : out BooleanArray(num_reqs-1 downto 0);
      dataR                    : out std_logic_vector((data_width*num_reqs)-1 downto 0);
      -- output data consists of concatenated pairs of ops.
      mdata                    : in std_logic_vector(data_width-1 downto 0);
      mreq                     : out std_logic;
      mack                     : in  std_logic;
      mtag                     : in std_logic_vector(tag_length-1 downto 0);
      -- with dataR
      clk, reset              : in std_logic);
  end component LoadCompleteShared;

  component StoreCompleteShared
    generic (name: string; 
	     num_reqs: integer;
             tag_length: integer;
	     detailed_buffering_per_output: IntegerArray);
    port (
      -- in requester array, pulse protocol
      -- more than one requester can be active
      -- at any time
      reqR : in BooleanArray(num_reqs-1 downto 0);
      -- out ack array, pulse protocol
      -- more than one ack can be sent back
      -- at any time.
      --
      -- Note: req -> ack delay can be 0
      ackR : out BooleanArray(num_reqs-1 downto 0);
      -- mreq goes out to memory as 
      -- a response to mack.
      mreq : out std_logic;
      mack : in  std_logic;
      -- mtag to distinguish the 
      -- requesters.
      mtag : in std_logic_vector(tag_length-1 downto 0);
      -- rising edge of clock is used
      clk : in std_logic;
      -- synchronous reset, active high
      reset : in std_logic);
  end component StoreCompleteShared;


  -----------------------------------------------------------------------------
  -- protocol translation, priority encoding
  -----------------------------------------------------------------------------
  component Pulse_To_Level_Translate_Entity 
    generic (name: string);
    port( rL : in boolean;
          rR : out std_logic;
          aL : out boolean;
          aR : in std_logic;
          clk : in std_logic;
          reset : in std_logic);
  end component;

  component Stall_To_Pulse_Translate_Entity is
    generic (name : string);
    port(
	stall_out : out std_logic;
        rR : in  boolean;
        valid_in : in std_logic;
        aR : out boolean;
        clk : in std_logic;
        reset : in std_logic);
  end component;

  component Sample_Pulse_To_Level_Translate_Entity 
    generic (name: string);
    port( rL : in boolean;
          rR : out std_logic;
          aL : out boolean;
          aR : in std_logic;
          clk : in std_logic;
          reset : in std_logic);
  end component;

  component Level_To_Pulse_Translate_Entity is
    generic (name: string);
    port( rL : out std_logic;
        rR : in  boolean;
        aL : in std_logic;
        aR : out boolean;
        clk : in std_logic;
        reset : in std_logic);
  end component;

  component Request_Priority_Encode_Entity
    generic (name:string; num_reqs : integer := 1);
    port (
      clk,reset : in std_logic;
      reqR : in std_logic_vector;
      ackR: out std_logic_vector;
      forward_enable: out std_logic_vector;
      req_s : out std_logic;
      ack_s : in std_logic);
  end component;

  -----------------------------------------------------------------------------
  -- BinaryEncoder: introduced because Xilinx ISE 13.1 barfs on To_Unsigned
  -----------------------------------------------------------------------------
  component BinaryEncoder
    generic (name: string; iwidth: integer := 3; owidth: integer := 3);
    port(din: in std_logic_vector(iwidth-1 downto 0);
         dout: out std_logic_vector(owidth-1 downto 0));
  end component;


  -----------------------------------------------------------------------------
  -- floating point operators (pipelined)
  -----------------------------------------------------------------------------
  
  component GenericFloatToFloat is
    generic (name: string;
	   tag_width : integer;
           in_exponent_width: integer;
           in_fraction_width : integer;
           out_exponent_width: integer;
           out_fraction_width : integer;
           round_style : round_type := float_round_style;  -- rounding option
           addguard       : NATURAL := float_guard_bits;  -- number of guard bits
           check_error : BOOLEAN    := float_check_error;  -- check for errors
           denormalize_in : BOOLEAN := float_denormalize;  -- Use IEEE extended FP           
           denormalize : BOOLEAN    := float_denormalize  -- Use IEEE extended FP           
           );
    port(
      INF: in std_logic_vector((in_exponent_width+in_fraction_width) downto 0);
      OUTF: out std_logic_vector((out_exponent_width+out_fraction_width) downto 0);
      clk,reset: in std_logic;
      tag_in: in std_logic_vector(tag_width-1 downto 0);
      tag_out: out std_logic_vector(tag_width-1 downto 0);
      env_rdy, accept_rdy: in std_logic;
      f2fi_rdy, f2fo_rdy: out std_logic);
  end component;

  component GenericFloatingPointAdderSubtractor
    generic (name: string;
	     tag_width : integer;
             exponent_width: integer;
             fraction_width : integer;
             round_style : round_type := float_round_style;  -- rounding option
             addguard       : NATURAL := float_guard_bits;  -- number of guard bits
             check_error : BOOLEAN    := float_check_error;  -- check for errors
             denormalize : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP           
             use_as_subtractor: BOOLEAN
      );
    port(
      INA, INB: in std_logic_vector((exponent_width+fraction_width) downto 0);
      OUTADD: out std_logic_vector((exponent_width+fraction_width) downto 0);
      clk,reset: in std_logic;
      tag_in: in std_logic_vector(tag_width-1 downto 0);
      tag_out: out std_logic_vector(tag_width-1 downto 0);
      env_rdy, accept_rdy: in std_logic;
      addi_rdy, addo_rdy: out std_logic);
  end component;

  component GenericFloatingPointMultiplier
    generic (name: string;
	     tag_width : integer;
             exponent_width: integer;
             fraction_width : integer;
             round_style : round_type := float_round_style;  -- rounding option
             addguard       : NATURAL := float_guard_bits;  -- number of guard bits
             check_error : BOOLEAN    := float_check_error;  -- check for errors
             denormalize : BOOLEAN    := float_denormalize  -- Use IEEE extended FP           
             );
    port(
      INA, INB: in std_logic_vector((exponent_width+fraction_width) downto 0);
      OUTMUL: out std_logic_vector((exponent_width+fraction_width) downto 0);
      clk,reset: in std_logic;
      tag_in: in std_logic_vector(tag_width-1 downto 0);
      tag_out: out std_logic_vector(tag_width-1 downto 0);
      env_rdy, accept_rdy: in std_logic;
      muli_rdy, mulo_rdy: out std_logic);
  end component;
  
  component SinglePrecisionMultiplier 
    generic (name: string;
	     tag_width : integer);
    port(
      INA, INB: in std_logic_vector(31 downto 0);
      OUTM: out std_logic_vector(31 downto 0);
      clk,reset: in std_logic;
      tag_in: in std_logic_vector(tag_width-1 downto 0);
      tag_out: out std_logic_vector(tag_width-1 downto 0);
      NaN, oflow, uflow: out std_logic := '0';
      env_rdy, accept_rdy: in std_logic;
      muli_rdy, mulo_rdy: out std_logic);
  end component;

  component DoublePrecisionMultiplier 
    generic (name: string;
	     tag_width : integer);
    port(
      INA, INB: in std_logic_vector(63 downto 0);   
      OUTM: out std_logic_vector(63 downto 0);
      clk,reset: in std_logic;
      tag_in: in std_logic_vector(tag_width-1 downto 0);
      tag_out: out std_logic_vector(tag_width-1 downto 0);
      NaN, oflow, uflow: out std_logic := '0';
      env_rdy, accept_rdy: in std_logic;
      muli_rdy, mulo_rdy: out std_logic);
  end component;

  component PipelinedFPOperator 
    generic (
      name : string;
      operator_id : string;
      exponent_width : integer := 8;
      fraction_width : integer := 23;
      no_arbitration: boolean := true;
      num_reqs : integer := 3; -- how many requesters?
      use_input_buffering: boolean;
      detailed_buffering_per_input : IntegerArray;
      detailed_buffering_per_output : IntegerArray;
      full_rate: boolean
      );
    port (
      -- req/ack follow level protocol
      reqL                     : in BooleanArray(num_reqs-1 downto 0);
      ackR                     : out BooleanArray(num_reqs-1 downto 0);
      ackL                     : out BooleanArray(num_reqs-1 downto 0);
      reqR                     : in  BooleanArray(num_reqs-1 downto 0);
      -- input data consists of concatenated pairs of ips
      dataL                    : in std_logic_vector((2*(exponent_width+fraction_width+1)*num_reqs)-1 downto 0);
      -- output data consists of concatenated pairs of ops.
      dataR                    : out std_logic_vector(((exponent_width+fraction_width+1)*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset              : in std_logic);
  end component;

  component GenericFloatingPointNormalizer is
    generic (name: string;
	     tag_width : integer := 8;
             exponent_width: integer := 11;
             fraction_width : integer := 52;
             round_style : round_type := float_round_style;  -- rounding option
             nguard       : NATURAL := float_guard_bits;  -- number of guard bits
             denormalize : BOOLEAN    := float_denormalize  -- Use IEEE extended FP           
             );
    port(
      fract  :in  unsigned(fraction_width+nguard+1 downto 0);
      expon  :in  signed(exponent_width+1 downto 0);
      sign   :in  std_ulogic;
      sticky :in  std_ulogic;
      tag_in :in  std_logic_vector(tag_width-1 downto 0);
      tag_out:out std_logic_vector(tag_width-1 downto 0);
      in_rdy :in  std_ulogic;
      out_rdy:out std_ulogic;
      stall  :in  std_ulogic;
      clk    :in  std_ulogic;
      reset  :in  std_ulogic;
      normalized_result :out UNRESOLVED_float (exponent_width downto -fraction_width)  -- result
     );
  end component;


  -----------------------------------------------------------------------------
  -- pipelined integer components..
  -----------------------------------------------------------------------------
  component UnsignedMultiplier 
    
    generic (
      name: string;
	     tag_width     : integer;
      operand_width : integer;
      chunk_width   : integer := 8);

    port (
      L, R       : in  unsigned(operand_width-1 downto 0);
      RESULT     : out unsigned((2*operand_width)-1 downto 0);
      clk, reset : in  std_logic;
      in_rdy     : in  std_logic;
      out_rdy    : out std_logic;
      stall      : in std_logic;
      tag_in     : in std_logic_vector(tag_width-1 downto 0);
      tag_out    : out std_logic_vector(tag_width-1 downto 0));
  end component;

  component UnsignedShifter 
  
  generic (
    name: string;
	     shift_right_flag   : boolean;
    tag_width     : integer;
    operand_width : integer;
    shift_amount_width: integer);

  port (
    L       : in  unsigned(operand_width-1 downto 0);
    R       : in  unsigned(shift_amount_width-1 downto 0);
    RESULT     : out unsigned(operand_width-1 downto 0);
    clk, reset : in  std_logic;
    in_rdy     : in  std_logic;
    out_rdy    : out std_logic;
    stall      : in std_logic;
    tag_in     : in std_logic_vector(tag_width-1 downto 0);
    tag_out    : out std_logic_vector(tag_width-1 downto 0));
   end component;

  component UnsignedAdderSubtractor 
  
  generic (
    name: string;
	     tag_width          : integer;
    operand_width      : integer;
    chunk_width        : integer
	);

  port (
    L            : in  unsigned(operand_width-1 downto 0);
    R            : in  unsigned(operand_width-1 downto 0);
    RESULT       : out unsigned(operand_width-1 downto 0);
    subtract_op  : in std_logic;
    clk, reset   : in  std_logic;
    in_rdy       : in  std_logic;
    out_rdy      : out std_logic;
    stall        : in std_logic;
    tag_in       : in std_logic_vector(tag_width-1 downto 0);
    tag_out      : out std_logic_vector(tag_width-1 downto 0));
  end component;



  component GuardInterface is
	generic (name: string;
	     nreqs: integer; delay_flag: boolean);
	port (reqL: in BooleanArray(nreqs-1 downto 0);
	      ackL: out BooleanArray(nreqs-1 downto 0); 
	      reqR: out BooleanArray(nreqs-1 downto 0);
	      ackR: in BooleanArray(nreqs-1 downto 0); 
	      guards: in std_logic_vector(nreqs-1 downto 0); 
	      clk: in std_logic; reset: in std_logic);
  end component;

  component SplitGuardInterfaceBase is
	generic (name: string;
	     buffering:integer);
	port (sr_in: in Boolean;
	      sa_out: out Boolean;
	      sr_out: out Boolean;
	      sa_in: in Boolean;
	      cr_in: in Boolean;
	      ca_out: out Boolean;
	      cr_out: out Boolean;
	      ca_in: in Boolean;
	      guard_interface: in std_logic;
	      clk: in std_logic;
	      reset: in std_logic);
  end component;

  component SplitSampleGuardInterfaceBase is
	generic (name: string;
	     buffering:integer);
	port (sr_in: in Boolean;
	      sa_out: out Boolean;
	      sr_out: out Boolean;
	      sa_in: in Boolean;
	      cr_in: in Boolean;
	      ca_out: out Boolean;
	      cr_out: out Boolean;
	      ca_in: in Boolean;
	      guard_interface: in std_logic;
	      clk: in std_logic;
	      reset: in std_logic);
  end component;

  component SplitUpdateGuardInterfaceBase is
	generic (name: string;
	     buffering:integer);
	port (sr_in: in Boolean;
	      sa_out: out Boolean;
	      sr_out: out Boolean;
	      sa_in: in Boolean;
	      cr_in: in Boolean;
	      ca_out: out Boolean;
	      cr_out: out Boolean;
	      ca_in: in Boolean;
	      guard_interface: in std_logic;
	      clk: in std_logic;
	      reset: in std_logic);
  end component;

  component SgiSampleFsm is
	generic (name: string);
	port (sr_in: in Boolean;
		sr_in_q: out Boolean;
		push_req: out std_logic;
		push_ack: in std_logic;
		clk, reset: in std_logic);
  end component;

  component SgiUpdateFsm is
	generic (name: string);
	port (cr_in: in Boolean;
		cr_out: out Boolean;
		ca_in: in Boolean;
		ca_out: out Boolean;
		pop_req: out std_logic;
		pop_ack: in std_logic;
		pop_data: in std_logic_vector(0 downto 0);
		clk, reset: in std_logic);
  end component;

  component SplitGuardInterface is
	generic (name: string;
	     		nreqs: integer; buffering: IntegerArray; use_guards: BooleanArray;
			sample_only: Boolean; update_only: Boolean);
	port (sr_in: in BooleanArray(nreqs-1 downto 0);
	      sa_out: out BooleanArray(nreqs-1 downto 0); 
	      sr_out: out BooleanArray(nreqs-1 downto 0);
	      sa_in: in BooleanArray(nreqs-1 downto 0); 
	      cr_in: in BooleanArray(nreqs-1 downto 0);
	      ca_out: out BooleanArray(nreqs-1 downto 0); 
	      cr_out: out BooleanArray(nreqs-1 downto 0);
	      ca_in: in BooleanArray(nreqs-1 downto 0); 
	      guards: in std_logic_vector(nreqs-1 downto 0);
	      clk: in std_logic;
	      reset: in std_logic);
  end component;

  
  -----------------------------------------------------------------------------
  -- temporary stuff.
  -----------------------------------------------------------------------------
  component tmpSplitCallArbiter
    generic(num_reqs: integer;
	  call_data_width: integer;
	  return_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
    port ( -- ready/ready handshake on all ports
      -- ports for the caller
      call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
      call_acks   : out std_logic_vector(num_reqs-1 downto 0);
      call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
      call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- call port connected to the called module
      call_mreq   : out std_logic;
      call_mack   : in  std_logic;
      call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
      call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
      -- similarly for return, initiated by the caller
      return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
      return_acks : out std_logic_vector(num_reqs-1 downto 0);
      return_data : out std_logic_vector((num_reqs*return_data_width)-1 downto 0);
      return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
      -- return from function
      return_mreq : out std_logic;
      return_mack : in std_logic;
      return_mdata : in  std_logic_vector(return_data_width-1 downto 0);
      return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
      clk: in std_logic;
      reset: in std_logic);
  end component tmpSplitCallArbiter;

  component tmpSplitCallArbiterNoOutargs
    generic(num_reqs: integer;
	  call_data_width: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
    call_mtag   : out std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    return_tag  : out std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- return from function
    return_mreq : out std_logic;
    return_mack : in std_logic;
    return_mtag : in  std_logic_vector(callee_tag_length+caller_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
  end component tmpSplitCallArbiterNoOutargs;

  ----------------------------------------------------------------------------------------
  -- components with per-input buffering
  ----------------------------------------------------------------------------------------

  component UnsharedOperatorWithBuffering 
    generic
    (
      name   : string;
      operator_id   : string;          -- operator id
      input1_is_int : Boolean := true; -- false means float
      input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      iwidth_1      : integer;    -- width of input1
      input2_is_int : Boolean := true; -- false means float
      input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      iwidth_2      : integer;    -- width of input2
      num_inputs    : integer := 2;    -- can be 1 or 2.
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      owidth        : integer;          -- width of output.
      constant_operand : std_logic_vector; -- constant operand.. (it is always the second operand)
      constant_width : integer;
      buffering      : integer;
      use_constant  : boolean := false;
      flow_through : boolean := false;
      full_rate: boolean := false
      );
    port (
      -- req -> ack follow pulse protocol
      reqL:  in Boolean;
      ackL : out Boolean;
      reqR : in Boolean;
      ackR:  out Boolean;
      -- operands.
      dataL      : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
      dataR      : out std_logic_vector(owidth-1 downto 0);
      clk, reset : in  std_logic);
  end component;

  component BinaryLogicalOperator 
  generic
    (
      name  : string;
      operator_id         : string;            -- operator id
      input_width         : integer;           -- input width
      output_width        : integer;           -- the width of the output.
      input_1_buffer_depth: integer;           -- buffering at input 1.
      input_2_buffer_depth: integer;           -- buffering at input 2.
      output_buffer_depth : integer;           -- buffering at output.
	-- both should never be constants.
      input_1_is_constant : boolean := false;
      input_2_is_constant : boolean := false;
      flow_through : boolean := false
      );
  port (
    -- input operands.
    sample_req : in BooleanArray(1 downto 0);  -- sample reqs, one per input.
    sample_ack : out BooleanArray(1 downto 0); -- sample acks, one per output.
    data_in      : in  std_logic_vector((2*input_width)-1 downto 0);
    -- result.
    update_req : in Boolean;  -- req for output update.
    update_ack : out Boolean; -- ack for output update.
    data_out      : out std_logic_vector(output_width-1 downto 0);
    -- clock, reset.
    clk, reset : in  std_logic);
  end component;


  component BinarySharedOperator is
    generic
    (
      name : string;
      operator_id   : string := "ApIntAdd";          -- operator id
      input_1_is_int : Boolean := true; -- false means float
      input_1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_1_width      : integer := 4;    -- width of input1
      input_1_is_constant : BooleanArray;   -- constant case needs to be handled a bit differently..
      input_2_is_int : Boolean := true; -- false means float
      input_2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input_2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      input_2_width      : integer := 0;    -- width of input2
      input_2_is_constant : BooleanArray;  -- constant case needs to be handled a bit differently..
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer := 4;          -- width of output.
      num_reqs : integer := 3; -- how many requesters?
      input_buffering: integer := 2;
      detailed_buffering_per_output : IntegerArray
    );
  port (
    -- input side.
    sample_req_1                     : in BooleanArray(num_reqs-1 downto 0);
    sample_req_2                     : in BooleanArray(num_reqs-1 downto 0);
    sample_ack_1                     : out BooleanArray(num_reqs-1 downto 0);
    sample_ack_2                     : out BooleanArray(num_reqs-1 downto 0);
    -- output side.
    update_ack                       : out BooleanArray(num_reqs-1 downto 0);
    update_req                       : in  BooleanArray(num_reqs-1 downto 0);
    -- input data consists of concatenated pairs of ips
    data_in_1                    : in std_logic_vector((input_1_width*num_reqs)-1 downto 0);
    data_in_2                    : in std_logic_vector((input_2_width*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    data_out                    : out std_logic_vector((output_width*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset              : in std_logic);
  end component;


  component LoadReqSharedWithInputBuffers is
    generic
    (
	name : string;
	addr_width: integer := 8;
      	num_reqs : integer := 1; -- how many requesters?
	tag_length: integer := 1;
	no_arbitration: Boolean := false;
        min_clock_period: Boolean := true;
        input_buffering: IntegerArray;
	time_stamp_width: integer := 0
    );
    port (
    -- req/ack follow pulse protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    -- concatenated address corresponding to access
    dataL                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
    -- address to memory
    maddr                   : out std_logic_vector((addr_width)-1 downto 0);
    mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);

    mreq                    : out std_logic;
    mack                    : in std_logic;
    -- clock, reset (active high)
    clk, reset              : in std_logic);
  end component;

  component SelectSplitProtocol is
    generic(name: string; 
	  data_width: integer; 
	  buffering: integer; 
	  flow_through: boolean := false; 
          full_rate: boolean := false);
    port(x,y: in std_logic_vector(data_width-1 downto 0);
       sel: in std_logic_vector(0 downto 0);
       z : out std_logic_vector(data_width-1 downto 0);
       sample_req: in boolean;
       sample_ack: out boolean;
       update_req: in boolean;
       update_ack: out boolean;
       clk,reset: in std_logic);
  end component;

  component StoreReqSharedWithInputBuffers
    generic
    (
	name : string;
	addr_width: integer;
	data_width : integer;
	time_stamp_width : integer;
      	num_reqs : integer; -- how many requesters?
	tag_length: integer;
	no_arbitration: Boolean := false;
        min_clock_period: Boolean := true;
        input_buffering: IntegerArray
    );
    port (
    -- req/ack follow pulse protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    -- address corresponding to access
    addr                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
    data                    : in std_logic_vector((data_width*num_reqs)-1 downto 0);
    -- address to memory
    maddr                   : out std_logic_vector(addr_width-1 downto 0);
    mdata                   : out std_logic_vector(data_width-1 downto 0);
    mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);
    mreq                    : out std_logic;
    mack                    : in std_logic;
    -- clock, reset (active high)
    clk, reset              : in std_logic);
  end component;

  component UnarySharedOperator is
    generic
    (
      name : string;
      operator_id   : string := "ApIntNot";          -- operator id
      input_is_int : Boolean := true; -- false means float
      input_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_width      : integer := 4;    -- width of input1
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer := 4;          -- width of output.
      num_reqs : integer := 3; -- how many requesters?
      detailed_buffering_per_output : IntegerArray
    );
  port (
    -- input side.
    sample_req                     : in BooleanArray(num_reqs-1 downto 0);
    sample_ack                     : out BooleanArray(num_reqs-1 downto 0);
    -- output side.
    update_ack                     : out BooleanArray(num_reqs-1 downto 0);
    update_req                     : in  BooleanArray(num_reqs-1 downto 0);
    -- input data consists of concatenated pairs of ips
    data_in                     : in std_logic_vector((input_width*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    data_out                    : out std_logic_vector((output_width*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset                  : in std_logic);
  end component;

  component UnaryUnsharedOperator 
    generic
    (
      name          : string;          -- instance name.
      operator_id   : string;          -- operator id
      input_is_int : Boolean := true; -- false means float
      input_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_width        : integer;    -- width of input1
      input_is_constant  : boolean; 
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer;          -- width of output.
      output_buffering : integer := 2
      );
    port (
    -- req -> ack follow pulse protocol
    sample_req:  in Boolean;
    sample_ack:  out Boolean;
    update_req:  in Boolean;
    update_ack:  out Boolean;
    -- operands.
    dataL      : in  std_logic_vector(input_width - 1 downto 0);
    dataR      : out std_logic_vector(output_width-1 downto 0);
    clk, reset : in  std_logic);
  end component;

  -------------------------------------------------------------------------------------
  -- full-rate versions of I/O ports
  -------------------------------------------------------------------------------------
  component InputPortRevised 
    generic(name : string;
	   num_reqs: integer;
	   data_width: integer;
           output_buffering: IntegerArray;
	   nonblocking_read_flag: boolean := false;
	   no_arbitration: boolean := false);
    port (
    -- pulse interface with the data-path
    sample_req        : in  BooleanArray(num_reqs-1 downto 0); -- sacrificial
    sample_ack        : out BooleanArray(num_reqs-1 downto 0); -- sacrificial
    update_req        : in  BooleanArray(num_reqs-1 downto 0);
    update_ack        : out BooleanArray(num_reqs-1 downto 0);
    data       : out std_logic_vector((num_reqs*data_width)-1 downto 0);
    -- ready/ready interface with outside world
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : in  std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
  end component;

  component OutputPortRevised 
    generic(name : string;
	  num_reqs: integer;
	  data_width: integer;
	  no_arbitration: boolean := false;
	  full_rate: boolean;
	  input_buffering : IntegerArray);
    port (
    sample_req        : in  BooleanArray(num_reqs-1 downto 0);
    sample_ack        : out BooleanArray(num_reqs-1 downto 0);
    update_req        : in  BooleanArray(num_reqs-1 downto 0); -- sacrificial
    update_ack        : out BooleanArray(num_reqs-1 downto 0); -- sacrificial
    data       : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : out std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
  end component;

  component InputPort_P2P is
    generic (name : string;
	   data_width: integer;
	   queue_depth: integer;
	   bypass_flag: boolean := false;
	   barrier_flag: boolean := false;
	   nonblocking_read_flag: boolean := false);
    port (
    -- pulse interface with the data-path
     sample_req        : in  Boolean; -- sacrificial.
     sample_ack        : out Boolean; -- sacrificial.
     update_req        : in  Boolean;
     update_ack        : out Boolean;
     data              : out std_logic_vector(data_width-1 downto 0);
    -- ready/ready interface with outside world
     oreq       : out std_logic;
     oack       : in  std_logic;
     odata      : in  std_logic_vector(data_width-1 downto 0);
     clk, reset : in  std_logic);
  end component;

  ---------------------------------------------------------------------------------
  -- some useful miscellaneous stuff
  ---------------------------------------------------------------------------------
  component InputMuxWithBuffering 
    generic (name: string;
	   iwidth: integer := 10;
	   owidth: integer := 10;
	   twidth: integer := 3;
	   nreqs: integer := 1;
	   buffering: IntegerArray;
	   no_arbitration: Boolean := false;
	   full_rate: boolean;
	   registered_output: Boolean := true);
    port (
    -- req/ack follow pulse protocol
    reqL                 : in  BooleanArray(nreqs-1 downto 0);
    ackL                 : out BooleanArray(nreqs-1 downto 0);
    dataL                : in  std_logic_vector(iwidth-1 downto 0);
    -- output side req/ack level protocol
    reqR                 : out std_logic;
    ackR                 : in  std_logic;
    dataR                : out std_logic_vector(owidth-1 downto 0);
    -- tag specifies the requester index 
    tagR                : out std_logic_vector(twidth-1 downto 0);
    clk, reset          : in std_logic);
  end component InputMuxWithBuffering;

  component FullRateRepeater is
    generic(name : string;  data_width: integer := 32);
    port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
  end component FullRateRepeater;

  component NullRepeater is
    generic(name : string;  data_width: integer := 32);
    port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
  end component NullRepeater;

  component LevelRepeater is
    generic(name: string; g_data_width: integer := 32; g_depth: integer := 1);
    port(clk: in std_logic;
       reset: in std_logic;
       enable: in std_logic;
       data_in: in std_logic_vector(g_data_width-1 downto 0);
       valid_in: in std_logic;
       data_out: out std_logic_vector(g_data_width-1 downto 0);
       valid_out : out std_logic;
       stall: in std_logic);
  end component;

  component SquashLevelRepeater is
    generic(name: string; g_data_width: integer := 32; g_depth : integer := 1);
    port(clk: in std_logic;
       		reset: in std_logic;
		enable: in std_logic;
       		data_in: in std_logic_vector(g_data_width-1 downto 0);
       		data_out: out std_logic_vector(g_data_width-1 downto 0);
       		stall_vector: in std_logic_vector(1 to g_depth));
  end component SquashLevelRepeater;

  component ValidPropagator is
    generic(name: string; g_depth : integer := 1);
    port(clk: in std_logic;
       		reset: in std_logic;
       		stall_in: in std_logic;
       		valid_in: in std_logic;
       		valid_out : out std_logic;
       		stall_vector: out std_logic_vector(1 to  g_depth));
  end component ValidPropagator;

  component InterlockBuffer 
    generic (name: string; buffer_size: integer := 2; 
		in_data_width : integer := 32;
		out_data_width : integer := 32;
		flow_through: boolean := false;
		cut_through: boolean  := false;
		bypass_flag : boolean := false); 
    port ( write_req: in boolean;
        write_ack: out boolean;
        write_data: in std_logic_vector(in_data_width-1 downto 0);
        read_req: in boolean;
        read_ack: out boolean;
        read_data: out std_logic_vector(out_data_width-1 downto 0);
        clk : in std_logic;
        reset: in std_logic);
  end component InterlockBuffer;
 
  component InterlockBufferSimplified is
    generic (name: string; buffer_size: integer := 2; data_width : integer := 32);
    port (write_req: in boolean;
        write_ack: out boolean;
        write_data: in std_logic_vector(data_width-1 downto 0);
        read_req: in boolean;
        read_ack: out boolean;
        read_data: out std_logic_vector(data_width-1 downto 0);
        clk : in std_logic;
        reset: in std_logic);
  end component InterlockBufferSimplified;


  component ReceiveBuffer  is
    generic (name: string; buffer_size: integer ; data_width : integer ;
	   		full_rate : boolean );
    port ( write_req: in boolean;
         write_ack: out boolean;
         write_data: in std_logic_vector(data_width-1 downto 0);
         read_req: in std_logic;
         read_ack: out std_logic;
         read_data: out std_logic_vector(data_width-1 downto 0);
         clk : in std_logic;
         reset: in std_logic);
  end component;

  component PulseToLevel 
   port( rL : in boolean;
        rR : out std_logic;
        aL : out boolean;
        aR : in std_logic;
        clk : in std_logic;
        reset : in std_logic);
  end component;

  component PulseToLevelHalfInterlockBuffer 
    generic (name : string; data_width: integer; buffer_size : integer);
    port( sample_req : in boolean;
        sample_ack : out boolean;
        has_room : out std_logic;
        write_enable : in  std_logic;
        write_data : in std_logic_vector(data_width-1 downto 0);
        update_req : in boolean;
        update_ack : out boolean;
        read_data : out std_logic_vector(data_width-1 downto 0);
        clk : in std_logic;
        reset : in std_logic);
  end component;

  component PulseLevelPulseInterlockBuffer 
  generic (name : string; data_width: integer; buffer_size : integer);
  port( write_req : in boolean;
        write_ack : out boolean;
        write_data : in std_logic_vector(data_width-1 downto 0);
        update_req : in boolean;
        update_ack : out boolean;
        has_data    : out std_logic;
        read_enable : in std_logic;
        read_data : out std_logic_vector(data_width-1 downto 0);
        clk : in std_logic;
        reset : in std_logic);
  end component;


  component LevelMux 
    generic(name: string; num_reqs: integer;
	  data_width: integer;
	  no_arbitration: boolean := true);
    port (
    write_req       : in  std_logic_vector(num_reqs-1 downto 0);
    write_ack       : out std_logic_vector(num_reqs-1 downto 0);
    write_data      : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    read_req        : in  std_logic;
    read_ack        : out std_logic;
    read_data       : out std_logic_vector(data_width-1 downto 0);
    clk, reset      : in  std_logic);
  end component;

  component CounterBase generic(name: string; data_width : integer);
	port(clk, reset: in std_logic; count_out: out std_logic_vector(data_width-1 downto 0));
  end component;

  component UnloadBuffer 
    generic (name: string; buffer_size: integer; data_width : integer; 
				bypass_flag: boolean := false; nonblocking_read_flag: boolean := false;
					use_unload_register: boolean := true);
    port (write_req: in std_logic;
          write_ack: out std_logic;
          write_data: in std_logic_vector(data_width-1 downto 0);
          unload_req: in boolean;
          unload_ack: out boolean;
          read_data: out std_logic_vector(data_width-1 downto 0);
	  has_data: out std_logic;
          clk : in std_logic;
          reset: in std_logic);
  end component UnloadBuffer;
  component UnloadBufferDeep is
    generic (name: string; buffer_size: integer ; data_width : integer ; nonblocking_read_flag : boolean := false);
    port ( write_req: in std_logic;
        write_ack: out std_logic;
        write_data: in std_logic_vector(data_width-1 downto 0);
        unload_req: in boolean;
        unload_ack: out boolean;
        read_data: out std_logic_vector(data_width-1 downto 0);
	has_data: out std_logic;
        clk : in std_logic;
        reset: in std_logic);
  end component UnloadBufferDeep;
  component UnloadBufferOptimized is
    generic (name: string; buffer_size: integer ; data_width : integer ; nonblocking_read_flag : boolean := false);
    port ( write_req: in std_logic;
        write_ack: out std_logic;
        write_data: in std_logic_vector(data_width-1 downto 0);
        unload_req: in boolean;
        unload_ack: out boolean;
        read_data: out std_logic_vector(data_width-1 downto 0);
	has_data: out std_logic;
        clk : in std_logic;
        reset: in std_logic);
  end component UnloadBufferOptimized;
  component UnloadBufferRevised is
    generic (name: string; 
		buffer_size: integer ; 
		data_width : integer ; 
		bypass_flag: boolean := false);
    port ( write_req: in std_logic;
        write_ack: out std_logic;
        write_data: in std_logic_vector(data_width-1 downto 0);
        unload_req: in boolean;
        unload_ack: out boolean;
        read_data: out std_logic_vector(data_width-1 downto 0);
	has_data: out std_logic;
        clk : in std_logic;
        reset: in std_logic);
  end component;

  component UnloadRegister is
    generic (name: string; 
		data_width : integer ; 
		bypass_flag: boolean := false;
		nonblocking_read_flag : boolean := false);
    port ( write_req: in std_logic;
           write_ack: out std_logic;
           write_data: in std_logic_vector(data_width-1 downto 0);
           unload_req: in boolean;
           unload_ack: out boolean;
           read_data: out std_logic_vector(data_width-1 downto 0);
           clk : in std_logic;
           reset: in std_logic);
  end component UnloadRegister;

  component UnloadFsm is
  generic (name: string; data_width: integer);
  port ( 
	 write_req: in std_logic;
         write_ack: out std_logic;
         unload_req: in boolean;
         unload_ack: out boolean;
	 data_in :  in std_logic_vector(data_width-1 downto 0);
	 data_out :  out std_logic_vector(data_width-1 downto 0);
         clk : in std_logic;
         reset: in std_logic);
  end component;

  -----------------------------------------------------------------------------------------
  --  System Ports
  -----------------------------------------------------------------------------------------
  component SystemInPort 
   generic (name : string;
	    num_reads: integer;
	    in_data_width: integer;
            out_data_width : integer; 
	    full_rate: boolean := false); 
   port (read_req : in std_logic_vector(num_reads-1 downto 0);
         read_ack : out std_logic_vector(num_reads-1 downto 0);
         read_data: out std_logic_vector((num_reads*out_data_width)-1 downto 0);
         in_data  : in std_logic_vector(in_data_width-1 downto 0);
	 clk : in std_logic;
	 reset : in std_logic);
  end component;

  component SystemOutPort 
   generic (name : string;
	    num_writes: integer;
	    in_data_width: integer;
            out_data_width : integer;
	    full_rate: boolean := false); 
   port (write_req : in std_logic_vector(num_writes-1 downto 0);
         write_ack : out std_logic_vector(num_writes-1 downto 0);
         write_data: in std_logic_vector((num_writes*in_data_width)-1 downto 0);
         out_data  : out std_logic_vector(out_data_width-1 downto 0);
	 clk : in std_logic;
	 reset : in std_logic);
  end component;
 
  component SignalBase is
   generic (name : string;
	    volatile_flag: boolean := false;
	    num_writes: integer;
            data_width : integer); 
   port (
         read_data  : out std_logic_vector(data_width-1 downto 0);
	 write_req : in std_logic_vector(num_writes-1 downto 0);
         write_ack : out std_logic_vector(num_writes-1 downto 0);
         write_data: in std_logic_vector((num_writes*data_width)-1 downto 0);
	 clk : in std_logic;
	 reset : in std_logic);
  end component;

  ----------------------------------------------------------------------------------------------
  -- glue
  ----------------------------------------------------------------------------------------------
  component PipeJoin is
   generic (name : string; data_width_0, data_width_1: integer);
   port (
    write_req_0   : in std_logic;
    write_ack_0   : out std_logic;
    write_data_0   : in std_logic_vector(data_width_0-1 downto 0);
    write_req_1   : in std_logic;
    write_ack_1   : out std_logic;
    write_data_1   : in std_logic_vector(data_width_1-1 downto 0);
    read_req      : in  std_logic;
    read_ack       : out std_logic;
    read_data     : out std_logic_vector((data_width_1 + data_width_0)-1 downto 0);
    clk, reset : in  std_logic);
  end component;

  component PipeMerge is
    generic (name : string; data_width_0, data_width_1: integer);
    port (
      write_req_0   : in std_logic;
      write_ack_0   : out std_logic;
      write_data_0   : in std_logic_vector(data_width_0-1 downto 0);
      write_req_1   : in std_logic;
      write_ack_1   : out std_logic;
      write_data_1   : in std_logic_vector(data_width_1-1 downto 0);
      read_req      : in  std_logic;
      read_ack       : out std_logic;
      read_data     : out std_logic_vector((data_width_1 + data_width_0)-1 downto 0);
      clk, reset : in  std_logic);
  end component;
 
  component PipeMux is
   generic (name : string; data_width: integer);
   port (
    write_req_0   : in std_logic;
    write_ack_0   : out std_logic;
    write_data_0   : in std_logic_vector(data_width-1 downto 0);
    write_req_1   : in std_logic;
    write_ack_1   : out std_logic;
    write_data_1   : in std_logic_vector(data_width-1 downto 0);
    read_req      : in  std_logic;
    read_ack       : out std_logic;
    read_data     : out std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
  end component;

  component PipeSizeMonitor is
   generic (name : string; depth: integer);
   port (
    write_req   : in  std_logic;
    write_ack   : in  std_logic;
    read_req    : in  std_logic;
    read_ack    : in  std_logic;
    has_data    : out Boolean;
    clk, reset  : in  std_logic);
  end component;

  component BypassRegister is
	generic (data_width: integer; bypass: boolean);
	port (clk, reset: in std_logic; 
		enable: in boolean; 
		din: in std_logic_vector(data_width-1 downto 0);
		q: out std_logic_vector(data_width-1 downto 0));
  end component;

  component SingleCycleStartFinFsm is
	port (clk, reset, start_req, fin_req : in std_logic;
		enable, start_ack, fin_ack: out std_logic) ;
  end component SingleCycleStartFinFsm;

  component ram_1024x32_Operator is -- 
  port ( -- 
    sample_req: in boolean;
    sample_ack: out boolean;
    update_req: in boolean;
    update_ack: out boolean;
    enable : in  std_logic_vector(0 downto 0);
    read_write_bar : in  std_logic_vector(0 downto 0);
    addr : in  std_logic_vector(9 downto 0);
    din : in  std_logic_vector(31 downto 0);
    dout : out  std_logic_vector(31 downto 0);
    clk, reset: in std_logic
    -- 
  );
  -- 
  end component ram_1024x32_Operator;
  component dpram_1w_1r_1024x32_Operator is -- 
  port ( -- 
    sample_req: in boolean;
    sample_ack: out boolean;
    update_req: in boolean;
    update_ack: out boolean;
    read_enable : in  std_logic_vector(0 downto 0);
    write_enable : in  std_logic_vector(0 downto 0);
    read_addr : in  std_logic_vector(9 downto 0);
    write_addr : in  std_logic_vector(9 downto 0);
    write_data : in  std_logic_vector(31 downto 0);
    read_data : out  std_logic_vector(31 downto 0);
    clk, reset: in std_logic
    -- 
  );
  -- 
  end component dpram_1w_1r_1024x32_Operator;

  component module_clock_gate is
	port (reset, start_req, start_ack, fin_req, fin_ack, clock_in: in std_logic;
		clock_out : out std_logic);
  end component module_clock_gate;

  component signal_clock_gate is
	port (reset, clock_in, clock_enable: in std_logic; clock_out : out std_logic);
  end component signal_clock_gate;

  component clock_gater is
	port (clock_in, clock_enable: in std_logic; clock_out : out std_logic);
  end component clock_gater;

end BaseComponents;

// This program was cloned from: https://github.com/SpinalHDL/VexRiscvSoftcoreContest2018
// License: Apache License 2.0

// Generator : SpinalHDL v1.2.2    git head : f4f5b5b5de7c2862912612d6af8086d2075fb357
// Date      : 21/11/2018, 19:47:35
// Component : Up5kPerf


`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b10
`define EnvCtrlEnum_defaultEncoding_EBREAK 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10
`define AluBitwiseCtrlEnum_defaultEncoding_SRC1 2'b11

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define fsm_enumDefinition_defaultEncoding_type [2:0]
`define fsm_enumDefinition_defaultEncoding_boot 3'b000
`define fsm_enumDefinition_defaultEncoding_fsm_SETUP 3'b001
`define fsm_enumDefinition_defaultEncoding_fsm_IDLE 3'b010
`define fsm_enumDefinition_defaultEncoding_fsm_CMD 3'b011
`define fsm_enumDefinition_defaultEncoding_fsm_PAYLOAD 3'b100

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

module StreamFifoLowLatency (
      input   io_push_valid,
      output  io_push_ready,
      input   io_push_payload_error,
      input  [31:0] io_push_payload_inst,
      output reg  io_pop_valid,
      input   io_pop_ready,
      output reg  io_pop_payload_error,
      output reg [31:0] io_pop_payload_inst,
      input   io_flush,
      output [1:0] io_occupancy,
      input   io_clk,
      input   GLOBAL_BUFFER_OUTPUT);
  wire [32:0] _zz_3_;
  wire [0:0] _zz_4_;
  wire [32:0] _zz_5_;
  reg  _zz_1_;
  reg  pushPtr_willIncrement;
  reg  pushPtr_willClear;
  reg [0:0] pushPtr_valueNext;
  reg [0:0] pushPtr_value;
  wire  pushPtr_willOverflowIfInc;
  wire  pushPtr_willOverflow;
  reg  popPtr_willIncrement;
  reg  popPtr_willClear;
  reg [0:0] popPtr_valueNext;
  reg [0:0] popPtr_value;
  wire  popPtr_willOverflowIfInc;
  wire  popPtr_willOverflow;
  wire  ptrMatch;
  reg  risingOccupancy;
  wire  empty;
  wire  full;
  wire  pushing;
  wire  popping;
  wire [32:0] _zz_2_;
  wire [0:0] ptrDif;
  reg [32:0] ram [0:1];
  assign _zz_4_ = _zz_2_[0 : 0];
  assign _zz_5_ = {io_push_payload_inst,io_push_payload_error};
  always @ (posedge io_clk) begin
    if(_zz_1_) begin
      ram[pushPtr_value] <= _zz_5_;
    end
  end

  assign _zz_3_ = ram[popPtr_value];
  always @ (*) begin
    _zz_1_ = 1'b0;
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      _zz_1_ = 1'b1;
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
      popPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = (pushPtr_value == (1'b1));
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    pushPtr_valueNext = (pushPtr_value + pushPtr_willIncrement);
    if(pushPtr_willClear)begin
      pushPtr_valueNext = (1'b0);
    end
  end

  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = (popPtr_value == (1'b1));
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @ (*) begin
    popPtr_valueNext = (popPtr_value + popPtr_willIncrement);
    if(popPtr_willClear)begin
      popPtr_valueNext = (1'b0);
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if((! empty))begin
      io_pop_valid = 1'b1;
      io_pop_payload_error = _zz_4_[0];
      io_pop_payload_inst = _zz_2_[32 : 1];
    end else begin
      io_pop_valid = io_push_valid;
      io_pop_payload_error = io_push_payload_error;
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign _zz_2_ = _zz_3_;
  assign ptrDif = (pushPtr_value - popPtr_value);
  assign io_occupancy = {(risingOccupancy && ptrMatch),ptrDif};
  always @ (posedge io_clk) begin
    if(GLOBAL_BUFFER_OUTPUT) begin
      pushPtr_value <= (1'b0);
      popPtr_value <= (1'b0);
      risingOccupancy <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

endmodule

module StreamArbiter (
      input   io_inputs_0_0,
      output  io_inputs_0_ready,
      input   io_inputs_0_0_wr,
      input  [15:0] io_inputs_0_0_address,
      input  [31:0] io_inputs_0_0_data,
      input  [3:0] io_inputs_0_0_mask,
      input   io_inputs_1_1,
      output  io_inputs_1_ready,
      input   io_inputs_1_1_wr,
      input  [15:0] io_inputs_1_1_address,
      input  [31:0] io_inputs_1_1_data,
      input  [3:0] io_inputs_1_1_mask,
      output  io_output_valid,
      input   io_output_ready,
      output  io_output_payload_wr,
      output [15:0] io_output_payload_address,
      output [31:0] io_output_payload_data,
      output [3:0] io_output_payload_mask,
      output [0:0] io_chosen,
      output [1:0] io_chosenOH,
      input   io_clk,
      input   GLOBAL_BUFFER_OUTPUT);
  wire [1:0] _zz_3_;
  wire [1:0] _zz_4_;
  reg  locked;
  wire  maskProposal_0;
  wire  maskProposal_1;
  reg  maskLocked_0;
  reg  maskLocked_1;
  wire  maskRouted_0;
  wire  maskRouted_1;
  wire [1:0] _zz_1_;
  wire  _zz_2_;
  assign _zz_3_ = (_zz_1_ & (~ _zz_4_));
  assign _zz_4_ = (_zz_1_ - (2'b01));
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_1_ = {io_inputs_1_1,io_inputs_0_0};
  assign maskProposal_0 = io_inputs_0_0;
  assign maskProposal_1 = _zz_3_[1];
  assign io_output_valid = ((io_inputs_0_0 && maskRouted_0) || (io_inputs_1_1 && maskRouted_1));
  assign io_output_payload_wr = (maskRouted_0 ? io_inputs_0_0_wr : io_inputs_1_1_wr);
  assign io_output_payload_address = (maskRouted_0 ? io_inputs_0_0_address : io_inputs_1_1_address);
  assign io_output_payload_data = (maskRouted_0 ? io_inputs_0_0_data : io_inputs_1_1_data);
  assign io_output_payload_mask = (maskRouted_0 ? io_inputs_0_0_mask : io_inputs_1_1_mask);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_2_ = io_chosenOH[1];
  assign io_chosen = _zz_2_;
  always @ (posedge io_clk) begin
    if(GLOBAL_BUFFER_OUTPUT) begin
      locked <= 1'b0;
    end else begin
      if(io_output_valid)begin
        locked <= 1'b1;
      end
      if((io_output_valid && io_output_ready))begin
        locked <= 1'b0;
      end
    end
  end

  always @ (posedge io_clk) begin
    if(io_output_valid)begin
      maskLocked_0 <= maskRouted_0;
      maskLocked_1 <= maskRouted_1;
    end
  end

endmodule


//StreamArbiter_1_ remplaced by StreamArbiter

module StreamArbiter_2_ (
      input   io_inputs_0_0,
      output  io_inputs_0_ready,
      input   io_inputs_0_0_wr,
      input  [19:0] io_inputs_0_0_address,
      input  [31:0] io_inputs_0_0_data,
      input  [3:0] io_inputs_0_0_mask,
      input   io_inputs_1_1,
      output  io_inputs_1_ready,
      input   io_inputs_1_1_wr,
      input  [19:0] io_inputs_1_1_address,
      input  [31:0] io_inputs_1_1_data,
      input  [3:0] io_inputs_1_1_mask,
      output  io_output_valid,
      input   io_output_ready,
      output  io_output_payload_wr,
      output [19:0] io_output_payload_address,
      output [31:0] io_output_payload_data,
      output [3:0] io_output_payload_mask,
      output [0:0] io_chosen,
      output [1:0] io_chosenOH,
      input   io_clk,
      input   GLOBAL_BUFFER_OUTPUT);
  wire [1:0] _zz_3_;
  wire [1:0] _zz_4_;
  reg  locked;
  wire  maskProposal_0;
  wire  maskProposal_1;
  reg  maskLocked_0;
  reg  maskLocked_1;
  wire  maskRouted_0;
  wire  maskRouted_1;
  wire [1:0] _zz_1_;
  wire  _zz_2_;
  assign _zz_3_ = (_zz_1_ & (~ _zz_4_));
  assign _zz_4_ = (_zz_1_ - (2'b01));
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_1_ = {io_inputs_1_1,io_inputs_0_0};
  assign maskProposal_0 = io_inputs_0_0;
  assign maskProposal_1 = _zz_3_[1];
  assign io_output_valid = ((io_inputs_0_0 && maskRouted_0) || (io_inputs_1_1 && maskRouted_1));
  assign io_output_payload_wr = (maskRouted_0 ? io_inputs_0_0_wr : io_inputs_1_1_wr);
  assign io_output_payload_address = (maskRouted_0 ? io_inputs_0_0_address : io_inputs_1_1_address);
  assign io_output_payload_data = (maskRouted_0 ? io_inputs_0_0_data : io_inputs_1_1_data);
  assign io_output_payload_mask = (maskRouted_0 ? io_inputs_0_0_mask : io_inputs_1_1_mask);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_2_ = io_chosenOH[1];
  assign io_chosen = _zz_2_;
  always @ (posedge io_clk) begin
    if(GLOBAL_BUFFER_OUTPUT) begin
      locked <= 1'b0;
    end else begin
      if(io_output_valid)begin
        locked <= 1'b1;
      end
      if((io_output_valid && io_output_ready))begin
        locked <= 1'b0;
      end
    end
  end

  always @ (posedge io_clk) begin
    if(io_output_valid)begin
      maskLocked_0 <= maskRouted_0;
      maskLocked_1 <= maskRouted_1;
    end
  end

endmodule

module BufferCC (
      input   io_dataIn,
      output  io_dataOut,
      input   io_clk);
  reg  buffers_0;
  reg  buffers_1;
  assign io_dataOut = buffers_1;
  always @ (posedge io_clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end

endmodule

module Spram (
      input   io_bus_cmd_valid,
      output  io_bus_cmd_ready,
      input   io_bus_cmd_payload_wr,
      input  [15:0] io_bus_cmd_payload_address,
      input  [31:0] io_bus_cmd_payload_data,
      input  [3:0] io_bus_cmd_payload_mask,
      output  io_bus_rsp_valid,
      output [31:0] io_bus_rsp_payload_data,
      input   io_clk,
      input   GLOBAL_BUFFER_OUTPUT);
  wire [15:0] _zz_1_;
  wire [13:0] _zz_2_;
  wire [3:0] _zz_3_;
  wire  _zz_4_;
  wire  _zz_5_;
  wire  _zz_6_;
  wire [15:0] _zz_7_;
  wire [13:0] _zz_8_;
  wire [3:0] _zz_9_;
  wire  _zz_10_;
  wire  _zz_11_;
  wire  _zz_12_;
  wire [15:0] _zz_13_;
  wire [15:0] _zz_14_;
  wire  cmd_valid;
  wire  cmd_payload_wr;
  wire [15:0] cmd_payload_address;
  wire [31:0] cmd_payload_data;
  wire [3:0] cmd_payload_mask;
  reg  rspPending;
  reg  rspTarget;
  wire [31:0] readData;
  SB_SPRAM256KA mems_0 ( 
    .DATAIN(_zz_1_),
    .ADDRESS(_zz_2_),
    .MASKWREN(_zz_3_),
    .WREN(cmd_payload_wr),
    .CHIPSELECT(cmd_valid),
    .CLOCK(io_clk),
    .DATAOUT(_zz_13_),
    .STANDBY(_zz_4_),
    .SLEEP(_zz_5_),
    .POWEROFF(_zz_6_) 
  );
  SB_SPRAM256KA mems_1 ( 
    .DATAIN(_zz_7_),
    .ADDRESS(_zz_8_),
    .MASKWREN(_zz_9_),
    .WREN(cmd_payload_wr),
    .CHIPSELECT(cmd_valid),
    .CLOCK(io_clk),
    .DATAOUT(_zz_14_),
    .STANDBY(_zz_10_),
    .SLEEP(_zz_11_),
    .POWEROFF(_zz_12_) 
  );
  assign io_bus_cmd_ready = 1'b1;
  assign cmd_valid = io_bus_cmd_valid;
  assign cmd_payload_wr = io_bus_cmd_payload_wr;
  assign cmd_payload_address = io_bus_cmd_payload_address;
  assign cmd_payload_data = io_bus_cmd_payload_data;
  assign cmd_payload_mask = io_bus_cmd_payload_mask;
  assign _zz_1_ = cmd_payload_data[15 : 0];
  assign _zz_3_ = {{{cmd_payload_mask[1],cmd_payload_mask[1]},cmd_payload_mask[0]},cmd_payload_mask[0]};
  assign _zz_7_ = cmd_payload_data[31 : 16];
  assign _zz_9_ = {{{cmd_payload_mask[3],cmd_payload_mask[3]},cmd_payload_mask[2]},cmd_payload_mask[2]};
  assign _zz_2_ = (cmd_payload_address >>> 2);
  assign _zz_4_ = 1'b0;
  assign _zz_5_ = 1'b0;
  assign _zz_6_ = 1'b1;
  assign _zz_8_ = (cmd_payload_address >>> 2);
  assign _zz_10_ = 1'b0;
  assign _zz_11_ = 1'b0;
  assign _zz_12_ = 1'b1;
  assign readData = {_zz_14_,_zz_13_};
  assign io_bus_rsp_valid = (rspPending && rspTarget);
  assign io_bus_rsp_payload_data = readData;
  always @ (posedge io_clk) begin
    if(GLOBAL_BUFFER_OUTPUT) begin
      rspPending <= 1'b0;
    end else begin
      rspPending <= (cmd_valid && (! cmd_payload_wr));
    end
  end

  always @ (posedge io_clk) begin
    rspTarget <= io_bus_cmd_valid;
  end

endmodule


//Spram_1_ remplaced by Spram

module Peripherals (
      input   io_bus_cmd_valid,
      output  io_bus_cmd_ready,
      input   io_bus_cmd_payload_wr,
      input  [5:0] io_bus_cmd_payload_address,
      input  [31:0] io_bus_cmd_payload_data,
      input  [3:0] io_bus_cmd_payload_mask,
      output  io_bus_rsp_valid,
      output [31:0] io_bus_rsp_payload_data,
      output  io_mTimeInterrupt,
      output [2:0] io_leds,
      output  io_serialTx,
      input   io_clk,
      input   GLOBAL_BUFFER_OUTPUT);
  wire [0:0] _zz_5_;
  wire [3:0] _zz_6_;
  wire [0:0] _zz_7_;
  wire [7:0] _zz_8_;
  wire [31:0] _zz_9_;
  wire  mapper_readAtCmd_valid;
  reg [31:0] mapper_readAtCmd_payload;
  reg  mapper_readAtCmd_m2sPipe_valid;
  reg [31:0] mapper_readAtCmd_m2sPipe_payload;
  wire  mapper_askWrite;
  wire  mapper_askRead;
  wire  mapper_doWrite;
  wire  mapper_doRead;
  reg [2:0] _zz_1_;
  reg  serialTx_counter_willIncrement;
  wire  serialTx_counter_willClear;
  reg [3:0] serialTx_counter_valueNext;
  reg [3:0] serialTx_counter_value;
  wire  serialTx_counter_willOverflowIfInc;
  wire  serialTx_counter_willOverflow;
  reg [7:0] serialTx_buffer;
  wire [11:0] serialTx_bitstream;
  wire  serialTx_busy;
  reg  _zz_2_;
  wire  serialTx_timer_willIncrement;
  wire  serialTx_timer_willClear;
  reg [7:0] serialTx_timer_valueNext;
  reg [7:0] serialTx_timer_value;
  wire  serialTx_timer_willOverflowIfInc;
  wire  serialTx_timer_willOverflow;
  reg  _zz_3_;
  reg [31:0] timer_counter;
  reg [31:0] timer_cmp;
  reg  timer_interrupt;
  reg  _zz_4_;
  assign _zz_5_ = serialTx_counter_willIncrement;
  assign _zz_6_ = {3'd0, _zz_5_};
  assign _zz_7_ = serialTx_timer_willIncrement;
  assign _zz_8_ = {7'd0, _zz_7_};
  assign _zz_9_ = (timer_counter - timer_cmp);
  assign io_bus_cmd_ready = 1'b1;
  assign mapper_askWrite = (io_bus_cmd_valid && io_bus_cmd_payload_wr);
  assign mapper_askRead = (io_bus_cmd_valid && (! io_bus_cmd_payload_wr));
  assign mapper_doWrite = (mapper_askWrite && io_bus_cmd_ready);
  assign mapper_doRead = (mapper_askRead && io_bus_cmd_ready);
  assign io_bus_rsp_valid = mapper_readAtCmd_m2sPipe_valid;
  assign io_bus_rsp_payload_data = mapper_readAtCmd_m2sPipe_payload;
  assign mapper_readAtCmd_valid = mapper_doRead;
  always @ (*) begin
    mapper_readAtCmd_payload = (32'b00000000000000000000000000000000);
    _zz_3_ = 1'b0;
    _zz_4_ = 1'b0;
    case(io_bus_cmd_payload_address)
      6'b000100 : begin
        mapper_readAtCmd_payload[2 : 0] = _zz_1_;
      end
      6'b000000 : begin
        if(mapper_doWrite)begin
          _zz_3_ = 1'b1;
        end
        mapper_readAtCmd_payload[0 : 0] = serialTx_busy;
      end
      6'b011000 : begin
        if(mapper_doWrite)begin
          _zz_4_ = 1'b1;
        end
      end
      6'b010000 : begin
        mapper_readAtCmd_payload[31 : 0] = timer_counter;
      end
      default : begin
      end
    endcase
  end

  assign io_leds = _zz_1_;
  always @ (*) begin
    serialTx_counter_willIncrement = 1'b0;
    if(((serialTx_counter_value != (4'b0000)) && serialTx_timer_willOverflowIfInc))begin
      serialTx_counter_willIncrement = 1'b1;
    end
    if(_zz_3_)begin
      serialTx_counter_willIncrement = 1'b1;
    end
  end

  assign serialTx_counter_willClear = 1'b0;
  assign serialTx_counter_willOverflowIfInc = (serialTx_counter_value == (4'b1011));
  assign serialTx_counter_willOverflow = (serialTx_counter_willOverflowIfInc && serialTx_counter_willIncrement);
  always @ (*) begin
    if(serialTx_counter_willOverflow)begin
      serialTx_counter_valueNext = (4'b0000);
    end else begin
      serialTx_counter_valueNext = (serialTx_counter_value + _zz_6_);
    end
    if(serialTx_counter_willClear)begin
      serialTx_counter_valueNext = (4'b0000);
    end
  end

  assign serialTx_bitstream = {serialTx_buffer,(4'b0111)};
  assign serialTx_busy = (serialTx_counter_value != (4'b0000));
  assign io_serialTx = _zz_2_;
  assign serialTx_timer_willClear = 1'b0;
  assign serialTx_timer_willOverflowIfInc = (serialTx_timer_value == (8'b11101001));
  assign serialTx_timer_willOverflow = (serialTx_timer_willOverflowIfInc && serialTx_timer_willIncrement);
  always @ (*) begin
    if(serialTx_timer_willOverflow)begin
      serialTx_timer_valueNext = (8'b00000000);
    end else begin
      serialTx_timer_valueNext = (serialTx_timer_value + _zz_8_);
    end
    if(serialTx_timer_willClear)begin
      serialTx_timer_valueNext = (8'b00000000);
    end
  end

  assign serialTx_timer_willIncrement = 1'b1;
  assign io_mTimeInterrupt = timer_interrupt;
  always @ (posedge io_clk) begin
    if(GLOBAL_BUFFER_OUTPUT) begin
      mapper_readAtCmd_m2sPipe_valid <= 1'b0;
      _zz_1_ <= (3'b000);
      serialTx_counter_value <= (4'b0000);
      _zz_2_ <= 1'b1;
      serialTx_timer_value <= (8'b00000000);
      timer_counter <= (32'b00000000000000000000000000000000);
      timer_cmp <= (32'b00000000000000000000000000000000);
      timer_interrupt <= 1'b0;
    end else begin
      mapper_readAtCmd_m2sPipe_valid <= mapper_readAtCmd_valid;
      serialTx_counter_value <= serialTx_counter_valueNext;
      _zz_2_ <= serialTx_bitstream[serialTx_counter_value];
      serialTx_timer_value <= serialTx_timer_valueNext;
      if((! _zz_9_[31]))begin
        timer_interrupt <= 1'b1;
      end
      if(_zz_4_)begin
        timer_interrupt <= 1'b0;
      end
      timer_counter <= (timer_counter + (32'b00000000000000000000000000000001));
      case(io_bus_cmd_payload_address)
        6'b000100 : begin
          if(mapper_doWrite)begin
            _zz_1_ <= io_bus_cmd_payload_data[2 : 0];
          end
        end
        6'b000000 : begin
        end
        6'b011000 : begin
          if(mapper_doWrite)begin
            timer_cmp <= io_bus_cmd_payload_data[31 : 0];
          end
        end
        6'b010000 : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge io_clk) begin
    if(mapper_readAtCmd_valid)begin
      mapper_readAtCmd_m2sPipe_payload <= mapper_readAtCmd_payload;
    end
    case(io_bus_cmd_payload_address)
      6'b000100 : begin
      end
      6'b000000 : begin
        if(mapper_doWrite)begin
          serialTx_buffer <= io_bus_cmd_payload_data[7 : 0];
        end
      end
      6'b011000 : begin
      end
      6'b010000 : begin
      end
      default : begin
      end
    endcase
  end

endmodule

module FlashXpi (
      input   io_bus_cmd_valid,
      output reg  io_bus_cmd_ready,
      input   io_bus_cmd_payload_wr,
      input  [18:0] io_bus_cmd_payload_address,
      input  [31:0] io_bus_cmd_payload_data,
      input  [3:0] io_bus_cmd_payload_mask,
      output  io_bus_rsp_valid,
      output [31:0] io_bus_rsp_payload_data,
      output reg [0:0] io_flash_ss,
      output reg  io_flash_sclk,
      output reg  io_flash_mosi,
      input   io_flash_miso,
      input   io_clk,
      input   GLOBAL_BUFFER_OUTPUT);
  reg  _zz_3_;
  reg  _zz_4_;
  wire [0:0] _zz_5_;
  wire [4:0] _zz_6_;
  wire [5:0] _zz_7_;
  wire [3:0] _zz_8_;
  wire [23:0] _zz_9_;
  wire [5:0] _zz_10_;
  reg  buffer_fill;
  reg [31:0] buffer_buffer;
  reg  buffer_counter_willIncrement;
  wire  buffer_counter_willClear;
  reg [4:0] buffer_counter_valueNext;
  reg [4:0] buffer_counter_value;
  wire  buffer_counter_willOverflowIfInc;
  wire  buffer_counter_willOverflow;
  reg  buffer_done;
  wire  fsm_wantExit;
  reg [6:0] fsm_counter;
  reg `fsm_enumDefinition_defaultEncoding_type fsm_stateReg;
  reg `fsm_enumDefinition_defaultEncoding_type fsm_stateNext;
  wire [15:0] _zz_1_;
  wire [39:0] _zz_2_;
  assign _zz_5_ = buffer_counter_willIncrement;
  assign _zz_6_ = {4'd0, _zz_5_};
  assign _zz_7_ = (fsm_counter >>> 1);
  assign _zz_8_ = _zz_7_[3:0];
  assign _zz_9_ = {5'd0, io_bus_cmd_payload_address};
  assign _zz_10_ = (fsm_counter >>> 1);
  always @(*) begin
    case(_zz_8_)
      4'b0000 : begin
        _zz_3_ = _zz_1_[15];
      end
      4'b0001 : begin
        _zz_3_ = _zz_1_[14];
      end
      4'b0010 : begin
        _zz_3_ = _zz_1_[13];
      end
      4'b0011 : begin
        _zz_3_ = _zz_1_[12];
      end
      4'b0100 : begin
        _zz_3_ = _zz_1_[11];
      end
      4'b0101 : begin
        _zz_3_ = _zz_1_[10];
      end
      4'b0110 : begin
        _zz_3_ = _zz_1_[9];
      end
      4'b0111 : begin
        _zz_3_ = _zz_1_[8];
      end
      4'b1000 : begin
        _zz_3_ = _zz_1_[7];
      end
      4'b1001 : begin
        _zz_3_ = _zz_1_[6];
      end
      4'b1010 : begin
        _zz_3_ = _zz_1_[5];
      end
      4'b1011 : begin
        _zz_3_ = _zz_1_[4];
      end
      4'b1100 : begin
        _zz_3_ = _zz_1_[3];
      end
      4'b1101 : begin
        _zz_3_ = _zz_1_[2];
      end
      4'b1110 : begin
        _zz_3_ = _zz_1_[1];
      end
      default : begin
        _zz_3_ = _zz_1_[0];
      end
    endcase
  end

  always @(*) begin
    case(_zz_10_)
      6'b000000 : begin
        _zz_4_ = _zz_2_[39];
      end
      6'b000001 : begin
        _zz_4_ = _zz_2_[38];
      end
      6'b000010 : begin
        _zz_4_ = _zz_2_[37];
      end
      6'b000011 : begin
        _zz_4_ = _zz_2_[36];
      end
      6'b000100 : begin
        _zz_4_ = _zz_2_[35];
      end
      6'b000101 : begin
        _zz_4_ = _zz_2_[34];
      end
      6'b000110 : begin
        _zz_4_ = _zz_2_[33];
      end
      6'b000111 : begin
        _zz_4_ = _zz_2_[32];
      end
      6'b001000 : begin
        _zz_4_ = _zz_2_[31];
      end
      6'b001001 : begin
        _zz_4_ = _zz_2_[30];
      end
      6'b001010 : begin
        _zz_4_ = _zz_2_[29];
      end
      6'b001011 : begin
        _zz_4_ = _zz_2_[28];
      end
      6'b001100 : begin
        _zz_4_ = _zz_2_[27];
      end
      6'b001101 : begin
        _zz_4_ = _zz_2_[26];
      end
      6'b001110 : begin
        _zz_4_ = _zz_2_[25];
      end
      6'b001111 : begin
        _zz_4_ = _zz_2_[24];
      end
      6'b010000 : begin
        _zz_4_ = _zz_2_[23];
      end
      6'b010001 : begin
        _zz_4_ = _zz_2_[22];
      end
      6'b010010 : begin
        _zz_4_ = _zz_2_[21];
      end
      6'b010011 : begin
        _zz_4_ = _zz_2_[20];
      end
      6'b010100 : begin
        _zz_4_ = _zz_2_[19];
      end
      6'b010101 : begin
        _zz_4_ = _zz_2_[18];
      end
      6'b010110 : begin
        _zz_4_ = _zz_2_[17];
      end
      6'b010111 : begin
        _zz_4_ = _zz_2_[16];
      end
      6'b011000 : begin
        _zz_4_ = _zz_2_[15];
      end
      6'b011001 : begin
        _zz_4_ = _zz_2_[14];
      end
      6'b011010 : begin
        _zz_4_ = _zz_2_[13];
      end
      6'b011011 : begin
        _zz_4_ = _zz_2_[12];
      end
      6'b011100 : begin
        _zz_4_ = _zz_2_[11];
      end
      6'b011101 : begin
        _zz_4_ = _zz_2_[10];
      end
      6'b011110 : begin
        _zz_4_ = _zz_2_[9];
      end
      6'b011111 : begin
        _zz_4_ = _zz_2_[8];
      end
      6'b100000 : begin
        _zz_4_ = _zz_2_[7];
      end
      6'b100001 : begin
        _zz_4_ = _zz_2_[6];
      end
      6'b100010 : begin
        _zz_4_ = _zz_2_[5];
      end
      6'b100011 : begin
        _zz_4_ = _zz_2_[4];
      end
      6'b100100 : begin
        _zz_4_ = _zz_2_[3];
      end
      6'b100101 : begin
        _zz_4_ = _zz_2_[2];
      end
      6'b100110 : begin
        _zz_4_ = _zz_2_[1];
      end
      default : begin
        _zz_4_ = _zz_2_[0];
      end
    endcase
  end

  always @ (*) begin
    io_bus_cmd_ready = 1'b0;
    io_flash_ss[0] = 1'b1;
    io_flash_sclk = 1'b0;
    io_flash_mosi = 1'b0;
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_defaultEncoding_fsm_SETUP : begin
        io_flash_ss[0] = 1'b0;
        io_flash_sclk = fsm_counter[0];
        io_flash_mosi = _zz_3_;
        if((fsm_counter == (7'b0011111)))begin
          fsm_stateNext = `fsm_enumDefinition_defaultEncoding_fsm_IDLE;
        end
      end
      `fsm_enumDefinition_defaultEncoding_fsm_IDLE : begin
        if(io_bus_cmd_valid)begin
          fsm_stateNext = `fsm_enumDefinition_defaultEncoding_fsm_CMD;
        end
      end
      `fsm_enumDefinition_defaultEncoding_fsm_CMD : begin
        io_flash_ss[0] = 1'b0;
        io_flash_sclk = fsm_counter[0];
        io_flash_mosi = _zz_4_;
        if((fsm_counter == (7'b1001111)))begin
          io_bus_cmd_ready = 1'b1;
          fsm_stateNext = `fsm_enumDefinition_defaultEncoding_fsm_PAYLOAD;
        end
      end
      `fsm_enumDefinition_defaultEncoding_fsm_PAYLOAD : begin
        io_flash_ss[0] = 1'b0;
        io_flash_sclk = fsm_counter[0];
        if((fsm_counter == (7'b0111111)))begin
          fsm_stateNext = `fsm_enumDefinition_defaultEncoding_fsm_IDLE;
        end
      end
      default : begin
        fsm_stateNext = `fsm_enumDefinition_defaultEncoding_fsm_SETUP;
      end
    endcase
  end

  always @ (*) begin
    buffer_counter_willIncrement = 1'b0;
    if(buffer_fill)begin
      buffer_counter_willIncrement = 1'b1;
    end
  end

  assign buffer_counter_willClear = 1'b0;
  assign buffer_counter_willOverflowIfInc = (buffer_counter_value == (5'b11111));
  assign buffer_counter_willOverflow = (buffer_counter_willOverflowIfInc && buffer_counter_willIncrement);
  always @ (*) begin
    buffer_counter_valueNext = (buffer_counter_value + _zz_6_);
    if(buffer_counter_willClear)begin
      buffer_counter_valueNext = (5'b00000);
    end
  end

  assign io_bus_rsp_valid = buffer_done;
  assign io_bus_rsp_payload_data = {buffer_buffer[7 : 0],{buffer_buffer[15 : 8],{buffer_buffer[23 : 16],buffer_buffer[31 : 24]}}};
  assign fsm_wantExit = 1'b0;
  assign _zz_1_ = (16'b1000000110000011);
  assign _zz_2_ = {{(8'b00001011),_zz_9_},(8'b00000000)};
  always @ (posedge io_clk) begin
    if(GLOBAL_BUFFER_OUTPUT) begin
      buffer_fill <= 1'b0;
      buffer_counter_value <= (5'b00000);
      buffer_done <= 1'b0;
      fsm_stateReg <= `fsm_enumDefinition_defaultEncoding_boot;
    end else begin
      buffer_fill <= 1'b0;
      buffer_counter_value <= buffer_counter_valueNext;
      buffer_done <= buffer_counter_willOverflow;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        `fsm_enumDefinition_defaultEncoding_fsm_SETUP : begin
        end
        `fsm_enumDefinition_defaultEncoding_fsm_IDLE : begin
        end
        `fsm_enumDefinition_defaultEncoding_fsm_CMD : begin
        end
        `fsm_enumDefinition_defaultEncoding_fsm_PAYLOAD : begin
          if((fsm_counter[0 : 0] == (1'b1)))begin
            buffer_fill <= 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge io_clk) begin
    if(buffer_fill)begin
      buffer_buffer <= {buffer_buffer[30 : 0],io_flash_miso};
    end
    fsm_counter <= (fsm_counter + (7'b0000001));
    if(((! (fsm_stateReg == `fsm_enumDefinition_defaultEncoding_fsm_SETUP)) && (fsm_stateNext == `fsm_enumDefinition_defaultEncoding_fsm_SETUP)))begin
      fsm_counter <= (7'b0000000);
    end
    if(((! (fsm_stateReg == `fsm_enumDefinition_defaultEncoding_fsm_CMD)) && (fsm_stateNext == `fsm_enumDefinition_defaultEncoding_fsm_CMD)))begin
      fsm_counter <= (7'b0000000);
    end
    if(((! (fsm_stateReg == `fsm_enumDefinition_defaultEncoding_fsm_PAYLOAD)) && (fsm_stateNext == `fsm_enumDefinition_defaultEncoding_fsm_PAYLOAD)))begin
      fsm_counter <= (7'b0000000);
    end
  end

endmodule

module VexRiscv (
      output  iBus_cmd_valid,
      input   iBus_cmd_ready,
      output [31:0] iBus_cmd_payload_pc,
      input   iBus_rsp_valid,
      input   iBus_rsp_payload_error,
      input  [31:0] iBus_rsp_payload_inst,
      input   timerInterrupt,
      input   externalInterrupt,
      output  dBus_cmd_valid,
      input   dBus_cmd_ready,
      output  dBus_cmd_payload_wr,
      output [31:0] dBus_cmd_payload_address,
      output [31:0] dBus_cmd_payload_data,
      output [1:0] dBus_cmd_payload_size,
      input   dBus_rsp_ready,
      input   dBus_rsp_error,
      input  [31:0] dBus_rsp_data,
      input   io_clk,
      input   GLOBAL_BUFFER_OUTPUT);
  wire  _zz_188_;
  wire  _zz_189_;
  reg [55:0] _zz_190_;
  reg [31:0] _zz_191_;
  reg [31:0] _zz_192_;
  reg [3:0] _zz_193_;
  wire  _zz_194_;
  wire  _zz_195_;
  wire  _zz_196_;
  wire [31:0] _zz_197_;
  wire [1:0] _zz_198_;
  wire  _zz_199_;
  wire  _zz_200_;
  wire  _zz_201_;
  wire  _zz_202_;
  wire  _zz_203_;
  wire  _zz_204_;
  wire [1:0] _zz_205_;
  wire [1:0] _zz_206_;
  wire  _zz_207_;
  wire [1:0] _zz_208_;
  wire [1:0] _zz_209_;
  wire [1:0] _zz_210_;
  wire [1:0] _zz_211_;
  wire [2:0] _zz_212_;
  wire [31:0] _zz_213_;
  wire [7:0] _zz_214_;
  wire [21:0] _zz_215_;
  wire [29:0] _zz_216_;
  wire [7:0] _zz_217_;
  wire [1:0] _zz_218_;
  wire [0:0] _zz_219_;
  wire [1:0] _zz_220_;
  wire [0:0] _zz_221_;
  wire [1:0] _zz_222_;
  wire [1:0] _zz_223_;
  wire [0:0] _zz_224_;
  wire [1:0] _zz_225_;
  wire [0:0] _zz_226_;
  wire [1:0] _zz_227_;
  wire [2:0] _zz_228_;
  wire [0:0] _zz_229_;
  wire [2:0] _zz_230_;
  wire [0:0] _zz_231_;
  wire [2:0] _zz_232_;
  wire [0:0] _zz_233_;
  wire [2:0] _zz_234_;
  wire [2:0] _zz_235_;
  wire [0:0] _zz_236_;
  wire [2:0] _zz_237_;
  wire [0:0] _zz_238_;
  wire [2:0] _zz_239_;
  wire [2:0] _zz_240_;
  wire [0:0] _zz_241_;
  wire [0:0] _zz_242_;
  wire [0:0] _zz_243_;
  wire [0:0] _zz_244_;
  wire [0:0] _zz_245_;
  wire [0:0] _zz_246_;
  wire [0:0] _zz_247_;
  wire [0:0] _zz_248_;
  wire [0:0] _zz_249_;
  wire [0:0] _zz_250_;
  wire [0:0] _zz_251_;
  wire [0:0] _zz_252_;
  wire [0:0] _zz_253_;
  wire [0:0] _zz_254_;
  wire [51:0] _zz_255_;
  wire [51:0] _zz_256_;
  wire [51:0] _zz_257_;
  wire [32:0] _zz_258_;
  wire [51:0] _zz_259_;
  wire [49:0] _zz_260_;
  wire [51:0] _zz_261_;
  wire [49:0] _zz_262_;
  wire [51:0] _zz_263_;
  wire [65:0] _zz_264_;
  wire [65:0] _zz_265_;
  wire [31:0] _zz_266_;
  wire [31:0] _zz_267_;
  wire [0:0] _zz_268_;
  wire [5:0] _zz_269_;
  wire [32:0] _zz_270_;
  wire [32:0] _zz_271_;
  wire [31:0] _zz_272_;
  wire [31:0] _zz_273_;
  wire [32:0] _zz_274_;
  wire [32:0] _zz_275_;
  wire [32:0] _zz_276_;
  wire [0:0] _zz_277_;
  wire [32:0] _zz_278_;
  wire [0:0] _zz_279_;
  wire [32:0] _zz_280_;
  wire [0:0] _zz_281_;
  wire [31:0] _zz_282_;
  wire [0:0] _zz_283_;
  wire [2:0] _zz_284_;
  wire [4:0] _zz_285_;
  wire [11:0] _zz_286_;
  wire [11:0] _zz_287_;
  wire [31:0] _zz_288_;
  wire [31:0] _zz_289_;
  wire [32:0] _zz_290_;
  wire [31:0] _zz_291_;
  wire [32:0] _zz_292_;
  wire [19:0] _zz_293_;
  wire [11:0] _zz_294_;
  wire [11:0] _zz_295_;
  wire [0:0] _zz_296_;
  wire [0:0] _zz_297_;
  wire [0:0] _zz_298_;
  wire [0:0] _zz_299_;
  wire [0:0] _zz_300_;
  wire [0:0] _zz_301_;
  wire [55:0] _zz_302_;
  wire  _zz_303_;
  wire  _zz_304_;
  wire [7:0] _zz_305_;
  wire [31:0] _zz_306_;
  wire [31:0] _zz_307_;
  wire [0:0] _zz_308_;
  wire [1:0] _zz_309_;
  wire  _zz_310_;
  wire  _zz_311_;
  wire [0:0] _zz_312_;
  wire [1:0] _zz_313_;
  wire [0:0] _zz_314_;
  wire [0:0] _zz_315_;
  wire  _zz_316_;
  wire [0:0] _zz_317_;
  wire [22:0] _zz_318_;
  wire [31:0] _zz_319_;
  wire [31:0] _zz_320_;
  wire  _zz_321_;
  wire  _zz_322_;
  wire [31:0] _zz_323_;
  wire [31:0] _zz_324_;
  wire [31:0] _zz_325_;
  wire [31:0] _zz_326_;
  wire  _zz_327_;
  wire  _zz_328_;
  wire [31:0] _zz_329_;
  wire [31:0] _zz_330_;
  wire  _zz_331_;
  wire [2:0] _zz_332_;
  wire [2:0] _zz_333_;
  wire  _zz_334_;
  wire [0:0] _zz_335_;
  wire [20:0] _zz_336_;
  wire [31:0] _zz_337_;
  wire [31:0] _zz_338_;
  wire [31:0] _zz_339_;
  wire [31:0] _zz_340_;
  wire [31:0] _zz_341_;
  wire  _zz_342_;
  wire [0:0] _zz_343_;
  wire [0:0] _zz_344_;
  wire [0:0] _zz_345_;
  wire [0:0] _zz_346_;
  wire [1:0] _zz_347_;
  wire [1:0] _zz_348_;
  wire  _zz_349_;
  wire [0:0] _zz_350_;
  wire [18:0] _zz_351_;
  wire [31:0] _zz_352_;
  wire [31:0] _zz_353_;
  wire [31:0] _zz_354_;
  wire [31:0] _zz_355_;
  wire [0:0] _zz_356_;
  wire [0:0] _zz_357_;
  wire [1:0] _zz_358_;
  wire [1:0] _zz_359_;
  wire  _zz_360_;
  wire [0:0] _zz_361_;
  wire [15:0] _zz_362_;
  wire [31:0] _zz_363_;
  wire [31:0] _zz_364_;
  wire [31:0] _zz_365_;
  wire [31:0] _zz_366_;
  wire [31:0] _zz_367_;
  wire [31:0] _zz_368_;
  wire  _zz_369_;
  wire  _zz_370_;
  wire [5:0] _zz_371_;
  wire [5:0] _zz_372_;
  wire  _zz_373_;
  wire [0:0] _zz_374_;
  wire [12:0] _zz_375_;
  wire [31:0] _zz_376_;
  wire [31:0] _zz_377_;
  wire  _zz_378_;
  wire [0:0] _zz_379_;
  wire [2:0] _zz_380_;
  wire  _zz_381_;
  wire [0:0] _zz_382_;
  wire [0:0] _zz_383_;
  wire [0:0] _zz_384_;
  wire [3:0] _zz_385_;
  wire [0:0] _zz_386_;
  wire [0:0] _zz_387_;
  wire  _zz_388_;
  wire [0:0] _zz_389_;
  wire [9:0] _zz_390_;
  wire [31:0] _zz_391_;
  wire [31:0] _zz_392_;
  wire [31:0] _zz_393_;
  wire  _zz_394_;
  wire [0:0] _zz_395_;
  wire [0:0] _zz_396_;
  wire [31:0] _zz_397_;
  wire [31:0] _zz_398_;
  wire [31:0] _zz_399_;
  wire [31:0] _zz_400_;
  wire [31:0] _zz_401_;
  wire  _zz_402_;
  wire [0:0] _zz_403_;
  wire [1:0] _zz_404_;
  wire [31:0] _zz_405_;
  wire [31:0] _zz_406_;
  wire [0:0] _zz_407_;
  wire [2:0] _zz_408_;
  wire [0:0] _zz_409_;
  wire [0:0] _zz_410_;
  wire  _zz_411_;
  wire [0:0] _zz_412_;
  wire [7:0] _zz_413_;
  wire [31:0] _zz_414_;
  wire [31:0] _zz_415_;
  wire [31:0] _zz_416_;
  wire [31:0] _zz_417_;
  wire [31:0] _zz_418_;
  wire [31:0] _zz_419_;
  wire [31:0] _zz_420_;
  wire [31:0] _zz_421_;
  wire  _zz_422_;
  wire  _zz_423_;
  wire [31:0] _zz_424_;
  wire [31:0] _zz_425_;
  wire  _zz_426_;
  wire [0:0] _zz_427_;
  wire [0:0] _zz_428_;
  wire [31:0] _zz_429_;
  wire [31:0] _zz_430_;
  wire [0:0] _zz_431_;
  wire [0:0] _zz_432_;
  wire  _zz_433_;
  wire [0:0] _zz_434_;
  wire [5:0] _zz_435_;
  wire [31:0] _zz_436_;
  wire [31:0] _zz_437_;
  wire [31:0] _zz_438_;
  wire [31:0] _zz_439_;
  wire [31:0] _zz_440_;
  wire [31:0] _zz_441_;
  wire [31:0] _zz_442_;
  wire [31:0] _zz_443_;
  wire [31:0] _zz_444_;
  wire [0:0] _zz_445_;
  wire [0:0] _zz_446_;
  wire [1:0] _zz_447_;
  wire [1:0] _zz_448_;
  wire  _zz_449_;
  wire [0:0] _zz_450_;
  wire [3:0] _zz_451_;
  wire [31:0] _zz_452_;
  wire [31:0] _zz_453_;
  wire [31:0] _zz_454_;
  wire  _zz_455_;
  wire  _zz_456_;
  wire  _zz_457_;
  wire [1:0] _zz_458_;
  wire [1:0] _zz_459_;
  wire  _zz_460_;
  wire [0:0] _zz_461_;
  wire [0:0] _zz_462_;
  wire [31:0] _zz_463_;
  wire [31:0] _zz_464_;
  wire [31:0] _zz_465_;
  wire [31:0] _zz_466_;
  wire [31:0] _zz_467_;
  wire  _zz_468_;
  wire  _zz_469_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_1_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_2_;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_3_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_4_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_5_;
  wire [31:0] execute_NEXT_PC2;
  wire [51:0] memory_MUL_LOW;
  wire [1:0] memory_MEMORY_ADDRESS_LOW;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_6_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_7_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_8_;
  wire  decode_BYPASSABLE_EXECUTE_STAGE;
  wire [3:0] execute_FAST_DIV_VALUE;
  wire [33:0] execute_MUL_LH;
  wire  execute_BRANCH_DO;
  wire [31:0] execute_SRC_ADD;
  wire  execute_TARGET_MISSMATCH2;
  wire [31:0] execute_SHIFT_RIGHT;
  wire  decode_CSR_WRITE_OPCODE;
  wire  decode_IS_CSR;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_9_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_10_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_11_;
  wire  decode_IS_DIV;
  wire  execute_BYPASSABLE_MEMORY_STAGE;
  wire  decode_BYPASSABLE_MEMORY_STAGE;
  wire  execute_PREDICTION_CONTEXT_hazard;
  wire  execute_PREDICTION_CONTEXT_hit;
  wire [21:0] execute_PREDICTION_CONTEXT_line_source;
  wire [1:0] execute_PREDICTION_CONTEXT_line_branchWish;
  wire [31:0] execute_PREDICTION_CONTEXT_line_target;
  wire  decode_PREDICTION_CONTEXT_hazard;
  wire  decode_PREDICTION_CONTEXT_hit;
  wire [21:0] decode_PREDICTION_CONTEXT_line_source;
  wire [1:0] decode_PREDICTION_CONTEXT_line_branchWish;
  wire [31:0] decode_PREDICTION_CONTEXT_line_target;
  wire [31:0] execute_MUL_LL;
  wire [31:0] memory_REGFILE_WRITE_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire  memory_IS_MUL;
  wire  execute_IS_MUL;
  wire  decode_IS_MUL;
  wire  decode_IS_RS2_SIGNED;
  wire [33:0] memory_MUL_HH;
  wire [33:0] execute_MUL_HH;
  wire [31:0] decode_SRC1;
  wire [33:0] execute_MUL_HL;
  wire  decode_SRC_LESS_UNSIGNED;
  wire [31:0] writeBack_FORMAL_PC_NEXT;
  wire [31:0] memory_FORMAL_PC_NEXT;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_CSR_READ_OPCODE;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_12_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_13_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_14_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_15_;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_16_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_17_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_18_;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_19_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_20_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_21_;
  wire  execute_MEMORY_ENABLE;
  wire  decode_MEMORY_ENABLE;
  wire  decode_IS_RS1_SIGNED;
  wire [31:0] decode_SRC2;
  wire  execute_IS_FENCEI;
  reg [31:0] _zz_22_;
  wire  decode_IS_FENCEI;
  wire [31:0] memory_NEXT_PC2;
  wire [31:0] memory_PC;
  wire [31:0] memory_BRANCH_CALC;
  wire  memory_TARGET_MISSMATCH2;
  wire  memory_BRANCH_DO;
  wire [31:0] execute_BRANCH_CALC;
  wire  _zz_23_;
  wire [31:0] _zz_24_;
  wire [31:0] _zz_25_;
  wire [31:0] execute_PC;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_26_;
  wire  _zz_27_;
  wire  decode_RS2_USE;
  wire  decode_RS1_USE;
  wire  execute_REGFILE_WRITE_VALID;
  wire  execute_BYPASSABLE_EXECUTE_STAGE;
  wire  memory_REGFILE_WRITE_VALID;
  wire  memory_BYPASSABLE_MEMORY_STAGE;
  wire  writeBack_REGFILE_WRITE_VALID;
  reg [31:0] decode_RS2;
  reg [31:0] decode_RS1;
  wire [31:0] memory_SHIFT_RIGHT;
  wire `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_28_;
  wire [31:0] _zz_29_;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_30_;
  wire  _zz_31_;
  wire [31:0] _zz_32_;
  wire  execute_SRC_USE_SUB_LESS;
  wire [31:0] _zz_33_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire [31:0] _zz_34_;
  wire [31:0] _zz_35_;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_36_;
  wire [31:0] _zz_37_;
  wire [31:0] _zz_38_;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_39_;
  wire [31:0] _zz_40_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_41_;
  wire [31:0] _zz_42_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_43_;
  wire [3:0] memory_FAST_DIV_VALUE;
  wire  memory_FAST_DIV_VALID;
  reg  _zz_44_;
  wire  execute_FAST_DIV_VALID;
  wire [3:0] _zz_45_;
  wire  _zz_46_;
  wire  execute_IS_RS1_SIGNED;
  wire [31:0] execute_RS1;
  wire  execute_IS_DIV;
  wire  execute_IS_RS2_SIGNED;
  wire [31:0] execute_RS2;
  reg [31:0] _zz_47_;
  wire  memory_IS_DIV;
  wire  writeBack_IS_MUL;
  wire [33:0] writeBack_MUL_HH;
  wire [51:0] writeBack_MUL_LOW;
  wire [33:0] memory_MUL_HL;
  wire [33:0] memory_MUL_LH;
  wire [31:0] memory_MUL_LL;
  wire [51:0] _zz_48_;
  wire [33:0] _zz_49_;
  wire [33:0] _zz_50_;
  wire [33:0] _zz_51_;
  wire [31:0] _zz_52_;
  wire [31:0] execute_SRC2;
  wire [31:0] _zz_53_;
  wire  _zz_54_;
  reg  _zz_55_;
  wire [31:0] _zz_56_;
  wire [31:0] _zz_57_;
  wire [31:0] decode_INSTRUCTION_ANTICIPATED;
  reg  decode_REGFILE_WRITE_VALID;
  wire  _zz_58_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_59_;
  wire  _zz_60_;
  wire  _zz_61_;
  wire  _zz_62_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_63_;
  wire  _zz_64_;
  wire  _zz_65_;
  wire  _zz_66_;
  wire  _zz_67_;
  wire  _zz_68_;
  wire  _zz_69_;
  wire  _zz_70_;
  wire  _zz_71_;
  wire  _zz_72_;
  wire  _zz_73_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_74_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_75_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_76_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_77_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_78_;
  reg [31:0] _zz_79_;
  wire [31:0] execute_SRC1;
  wire  execute_CSR_READ_OPCODE;
  wire  execute_CSR_WRITE_OPCODE;
  wire  execute_IS_CSR;
  wire [31:0] execute_INSTRUCTION;
  wire `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_80_;
  wire `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_81_;
  wire  _zz_82_;
  wire  _zz_83_;
  wire `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_84_;
  reg [31:0] _zz_85_;
  wire [1:0] writeBack_MEMORY_ADDRESS_LOW;
  wire [31:0] writeBack_MEMORY_READ_DATA;
  wire [31:0] writeBack_REGFILE_WRITE_DATA;
  wire  writeBack_ALIGNEMENT_FAULT;
  wire  writeBack_MEMORY_ENABLE;
  wire [31:0] _zz_86_;
  wire [1:0] _zz_87_;
  wire [31:0] memory_RS2;
  wire [31:0] memory_SRC_ADD;
  wire [31:0] memory_INSTRUCTION;
  wire  memory_ALIGNEMENT_FAULT;
  wire  memory_MEMORY_ENABLE;
  wire  _zz_88_;
  wire  memory_PREDICTION_CONTEXT_hazard;
  wire  memory_PREDICTION_CONTEXT_hit;
  wire [21:0] memory_PREDICTION_CONTEXT_line_source;
  wire [1:0] memory_PREDICTION_CONTEXT_line_branchWish;
  wire [31:0] memory_PREDICTION_CONTEXT_line_target;
  wire  _zz_89_;
  wire  _zz_90_;
  wire [21:0] _zz_91_;
  wire [1:0] _zz_92_;
  wire [31:0] _zz_93_;
  reg  _zz_94_;
  reg [31:0] _zz_95_;
  wire [31:0] _zz_96_;
  wire [31:0] _zz_97_;
  wire [31:0] _zz_98_;
  wire [31:0] _zz_99_;
  wire [31:0] writeBack_PC /* verilator public */ ;
  wire [31:0] writeBack_INSTRUCTION /* verilator public */ ;
  wire [31:0] decode_PC /* verilator public */ ;
  wire [31:0] decode_INSTRUCTION /* verilator public */ ;
  wire  decode_arbitration_haltItself /* verilator public */ ;
  reg  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  reg  decode_arbitration_flushAll /* verilator public */ ;
  wire  decode_arbitration_redoIt;
  wire  decode_arbitration_isValid /* verilator public */ ;
  wire  decode_arbitration_isStuck;
  wire  decode_arbitration_isStuckByOthers;
  wire  decode_arbitration_isFlushed;
  wire  decode_arbitration_isMoving;
  wire  decode_arbitration_isFiring;
  reg  execute_arbitration_haltItself;
  reg  execute_arbitration_haltByOther;
  reg  execute_arbitration_removeIt;
  reg  execute_arbitration_flushAll;
  wire  execute_arbitration_redoIt;
  reg  execute_arbitration_isValid;
  wire  execute_arbitration_isStuck;
  wire  execute_arbitration_isStuckByOthers;
  wire  execute_arbitration_isFlushed;
  wire  execute_arbitration_isMoving;
  wire  execute_arbitration_isFiring;
  reg  memory_arbitration_haltItself;
  wire  memory_arbitration_haltByOther;
  reg  memory_arbitration_removeIt;
  reg  memory_arbitration_flushAll;
  wire  memory_arbitration_redoIt;
  reg  memory_arbitration_isValid;
  wire  memory_arbitration_isStuck;
  wire  memory_arbitration_isStuckByOthers;
  wire  memory_arbitration_isFlushed;
  wire  memory_arbitration_isMoving;
  wire  memory_arbitration_isFiring;
  reg  writeBack_arbitration_haltItself;
  wire  writeBack_arbitration_haltByOther;
  reg  writeBack_arbitration_removeIt;
  wire  writeBack_arbitration_flushAll;
  wire  writeBack_arbitration_redoIt;
  reg  writeBack_arbitration_isValid /* verilator public */ ;
  wire  writeBack_arbitration_isStuck;
  wire  writeBack_arbitration_isStuckByOthers;
  wire  writeBack_arbitration_isFlushed;
  wire  writeBack_arbitration_isMoving;
  wire  writeBack_arbitration_isFiring /* verilator public */ ;
  reg  _zz_100_;
  wire  _zz_101_;
  wire [31:0] _zz_102_;
  reg  writeBack_exception_agregat_valid;
  wire [3:0] writeBack_exception_agregat_payload_code;
  wire [31:0] writeBack_exception_agregat_payload_badAddr;
  reg  _zz_103_;
  reg [31:0] _zz_104_;
  wire  contextSwitching;
  reg [1:0] CsrPlugin_privilege;
  reg  execute_exception_agregat_valid;
  reg [3:0] execute_exception_agregat_payload_code;
  wire [31:0] execute_exception_agregat_payload_badAddr;
  wire  _zz_105_;
  wire [31:0] _zz_106_;
  wire  memory_exception_agregat_valid;
  wire [3:0] memory_exception_agregat_payload_code;
  wire [31:0] memory_exception_agregat_payload_badAddr;
  wire  IBusSimplePlugin_jump_pcLoad_valid;
  wire [31:0] IBusSimplePlugin_jump_pcLoad_payload;
  wire [1:0] _zz_107_;
  wire  IBusSimplePlugin_fetchPc_preOutput_valid;
  wire  IBusSimplePlugin_fetchPc_preOutput_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_preOutput_payload;
  wire  _zz_108_;
  wire  IBusSimplePlugin_fetchPc_output_valid;
  wire  IBusSimplePlugin_fetchPc_output_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_output_payload;
  wire  IBusSimplePlugin_fetchPc_predictionPcLoad_valid;
  wire [31:0] IBusSimplePlugin_fetchPc_predictionPcLoad_payload;
  reg [31:0] IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusSimplePlugin_fetchPc_inc;
  wire  IBusSimplePlugin_fetchPc_propagatePc;
  reg [31:0] IBusSimplePlugin_fetchPc_pc;
  reg  IBusSimplePlugin_fetchPc_samplePcNext;
  reg  _zz_109_;
  wire  IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire  IBusSimplePlugin_iBusRsp_stages_0_inputSample;
  wire  IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  reg  IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire  IBusSimplePlugin_iBusRsp_stages_1_inputSample;
  wire  IBusSimplePlugin_iBusRsp_stages_2_input_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_2_output_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_2_output_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_2_halt;
  wire  IBusSimplePlugin_iBusRsp_stages_2_inputSample;
  wire  _zz_110_;
  wire  _zz_111_;
  wire  _zz_112_;
  wire  _zz_113_;
  reg  _zz_114_;
  reg [31:0] _zz_115_;
  wire  _zz_116_;
  reg  _zz_117_;
  reg [31:0] _zz_118_;
  reg  IBusSimplePlugin_iBusRsp_readyForError;
  wire  IBusSimplePlugin_iBusRsp_inputBeforeStage_valid;
  wire  IBusSimplePlugin_iBusRsp_inputBeforeStage_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_pc;
  wire  IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_raw;
  wire  IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_isRvc;
  wire  IBusSimplePlugin_injector_decodeInput_valid;
  wire  IBusSimplePlugin_injector_decodeInput_ready;
  wire [31:0] IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire  IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire  IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg  _zz_119_;
  reg [31:0] _zz_120_;
  reg  _zz_121_;
  reg [31:0] _zz_122_;
  reg  _zz_123_;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg  IBusSimplePlugin_injector_nextPcCalc_0;
  reg  IBusSimplePlugin_injector_nextPcCalc_1;
  reg  IBusSimplePlugin_injector_nextPcCalc_2;
  reg  IBusSimplePlugin_injector_nextPcCalc_3;
  reg  IBusSimplePlugin_injector_decodeRemoved;
  reg [31:0] IBusSimplePlugin_injector_formal_rawInDecode;
  reg  IBusSimplePlugin_predictor_historyWrite_valid;
  wire [7:0] IBusSimplePlugin_predictor_historyWrite_payload_address;
  wire [21:0] IBusSimplePlugin_predictor_historyWrite_payload_data_source;
  reg [1:0] IBusSimplePlugin_predictor_historyWrite_payload_data_branchWish;
  wire [31:0] IBusSimplePlugin_predictor_historyWrite_payload_data_target;
  wire [29:0] _zz_124_;
  wire  _zz_125_;
  wire [21:0] IBusSimplePlugin_predictor_line_source;
  wire [1:0] IBusSimplePlugin_predictor_line_branchWish;
  wire [31:0] IBusSimplePlugin_predictor_line_target;
  wire [55:0] _zz_126_;
  wire  IBusSimplePlugin_predictor_hit;
  reg  IBusSimplePlugin_predictor_historyWriteLast_valid;
  reg [7:0] IBusSimplePlugin_predictor_historyWriteLast_payload_address;
  reg [21:0] IBusSimplePlugin_predictor_historyWriteLast_payload_data_source;
  reg [1:0] IBusSimplePlugin_predictor_historyWriteLast_payload_data_branchWish;
  reg [31:0] IBusSimplePlugin_predictor_historyWriteLast_payload_data_target;
  wire  IBusSimplePlugin_predictor_hazard;
  wire  IBusSimplePlugin_predictor_fetchContext_hazard;
  wire  IBusSimplePlugin_predictor_fetchContext_hit;
  wire [21:0] IBusSimplePlugin_predictor_fetchContext_line_source;
  wire [1:0] IBusSimplePlugin_predictor_fetchContext_line_branchWish;
  wire [31:0] IBusSimplePlugin_predictor_fetchContext_line_target;
  reg  IBusSimplePlugin_predictor_fetchContext_regNextWhen_hazard;
  reg  IBusSimplePlugin_predictor_fetchContext_regNextWhen_hit;
  reg [21:0] IBusSimplePlugin_predictor_fetchContext_regNextWhen_line_source;
  reg [1:0] IBusSimplePlugin_predictor_fetchContext_regNextWhen_line_branchWish;
  reg [31:0] IBusSimplePlugin_predictor_fetchContext_regNextWhen_line_target;
  reg  IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_hazard;
  reg  IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_hit;
  reg [21:0] IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_line_source;
  reg [1:0] IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_line_branchWish;
  reg [31:0] IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_line_target;
  wire  IBusSimplePlugin_predictor_injectorContext_hazard;
  wire  IBusSimplePlugin_predictor_injectorContext_hit;
  wire [21:0] IBusSimplePlugin_predictor_injectorContext_line_source;
  wire [1:0] IBusSimplePlugin_predictor_injectorContext_line_branchWish;
  wire [31:0] IBusSimplePlugin_predictor_injectorContext_line_target;
  wire  IBusSimplePlugin_cmd_valid;
  wire  IBusSimplePlugin_cmd_ready;
  wire [31:0] IBusSimplePlugin_cmd_payload_pc;
  reg [2:0] IBusSimplePlugin_pendingCmd;
  wire [2:0] IBusSimplePlugin_pendingCmdNext;
  wire  IBusSimplePlugin_cmdFork_pendingFull;
  reg  IBusSimplePlugin_cmdFork_cmdKeep;
  reg  IBusSimplePlugin_cmdFork_cmdFired;
  reg [2:0] IBusSimplePlugin_rspJoin_discardCounter;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_valid;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_ready;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error;
  wire [31:0] IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst;
  wire [31:0] IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg  IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire [31:0] IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire  IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire  IBusSimplePlugin_rspJoin_issueDetected;
  wire  IBusSimplePlugin_rspJoin_join_valid;
  wire  IBusSimplePlugin_rspJoin_join_ready;
  wire [31:0] IBusSimplePlugin_rspJoin_join_payload_pc;
  wire  IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire  IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire  _zz_127_;
  wire  memory_DBusSimplePlugin_cmdSent;
  reg [31:0] _zz_128_;
  reg [3:0] _zz_129_;
  wire [3:0] memory_DBusSimplePlugin_formalMask;
  reg [31:0] writeBack_DBusSimplePlugin_rspShifted;
  wire  _zz_130_;
  reg [31:0] _zz_131_;
  wire  _zz_132_;
  reg [31:0] _zz_133_;
  reg [31:0] writeBack_DBusSimplePlugin_rspFormated;
  wire [1:0] CsrPlugin_misa_base;
  wire [25:0] CsrPlugin_misa_extensions;
  reg [1:0] CsrPlugin_mtvec_mode;
  reg [29:0] CsrPlugin_mtvec_base;
  reg [31:0] CsrPlugin_mepc;
  reg  CsrPlugin_mstatus_MIE;
  reg  CsrPlugin_mstatus_MPIE;
  reg [1:0] CsrPlugin_mstatus_MPP;
  reg  CsrPlugin_mip_MEIP;
  reg  CsrPlugin_mip_MTIP;
  reg  CsrPlugin_mip_MSIP;
  reg  CsrPlugin_mie_MEIE;
  reg  CsrPlugin_mie_MTIE;
  reg  CsrPlugin_mie_MSIE;
  reg [31:0] CsrPlugin_mscratch;
  reg  CsrPlugin_mcause_interrupt;
  reg [3:0] CsrPlugin_mcause_exceptionCode;
  reg [31:0] CsrPlugin_mtval;
  reg [63:0] CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg [63:0] CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire [31:0] CsrPlugin_medeleg;
  wire [31:0] CsrPlugin_mideleg;
  wire  _zz_134_;
  wire  _zz_135_;
  wire  _zz_136_;
  wire  CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  wire  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg [3:0] CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg [31:0] CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  reg  CsrPlugin_interrupt;
  reg [3:0] CsrPlugin_interruptCode /* verilator public */ ;
  reg [1:0] CsrPlugin_interruptTargetPrivilege;
  wire  CsrPlugin_exception;
  wire  CsrPlugin_lastStageWasWfi;
  reg  CsrPlugin_pipelineLiberator_done;
  wire  CsrPlugin_interruptJump /* verilator public */ ;
  reg  CsrPlugin_hadException;
  reg [1:0] CsrPlugin_targetPrivilege;
  reg [3:0] CsrPlugin_trapCause;
  wire  execute_CsrPlugin_blockedBySideEffects;
  reg  execute_CsrPlugin_illegalAccess;
  reg  execute_CsrPlugin_illegalInstruction;
  reg [31:0] execute_CsrPlugin_readData;
  wire  execute_CsrPlugin_writeInstruction;
  wire  execute_CsrPlugin_readInstruction;
  wire  execute_CsrPlugin_writeEnable;
  wire  execute_CsrPlugin_readEnable;
  reg [31:0] execute_CsrPlugin_writeData;
  wire [11:0] execute_CsrPlugin_csrAddress;
  wire [28:0] _zz_137_;
  wire  _zz_138_;
  wire  _zz_139_;
  wire  _zz_140_;
  wire  _zz_141_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_142_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_143_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_144_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_145_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_146_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_147_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_148_;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress1;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress2;
  wire [31:0] decode_RegFilePlugin_rs1Data;
  wire [31:0] decode_RegFilePlugin_rs2Data;
  reg  writeBack_RegFilePlugin_regFileWrite_valid /* verilator public */ ;
  wire [4:0] writeBack_RegFilePlugin_regFileWrite_payload_address /* verilator public */ ;
  wire [31:0] writeBack_RegFilePlugin_regFileWrite_payload_data /* verilator public */ ;
  reg  _zz_149_;
  reg  execute_MulPlugin_aSigned;
  reg  execute_MulPlugin_bSigned;
  wire [31:0] execute_MulPlugin_a;
  wire [31:0] execute_MulPlugin_b;
  wire [15:0] execute_MulPlugin_aULow;
  wire [15:0] execute_MulPlugin_bULow;
  wire [16:0] execute_MulPlugin_aSLow;
  wire [16:0] execute_MulPlugin_bSLow;
  wire [16:0] execute_MulPlugin_aHigh;
  wire [16:0] execute_MulPlugin_bHigh;
  wire [65:0] writeBack_MulPlugin_result;
  reg [32:0] memory_MulDivIterativePlugin_rs1;
  reg [31:0] memory_MulDivIterativePlugin_rs2;
  reg [64:0] memory_MulDivIterativePlugin_accumulator;
  reg  memory_MulDivIterativePlugin_div_needRevert;
  reg  memory_MulDivIterativePlugin_div_counter_willIncrement;
  reg  memory_MulDivIterativePlugin_div_counter_willClear;
  reg [5:0] memory_MulDivIterativePlugin_div_counter_valueNext;
  reg [5:0] memory_MulDivIterativePlugin_div_counter_value;
  wire  memory_MulDivIterativePlugin_div_counter_willOverflowIfInc;
  wire  memory_MulDivIterativePlugin_div_counter_willOverflow;
  reg  memory_MulDivIterativePlugin_div_done;
  reg [31:0] memory_MulDivIterativePlugin_div_result;
  wire [31:0] _zz_150_;
  wire [32:0] _zz_151_;
  wire [32:0] _zz_152_;
  wire [31:0] _zz_153_;
  wire  _zz_154_;
  wire  _zz_155_;
  reg [32:0] _zz_156_;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_157_;
  reg [31:0] _zz_158_;
  wire  _zz_159_;
  reg [19:0] _zz_160_;
  wire  _zz_161_;
  reg [19:0] _zz_162_;
  reg [31:0] _zz_163_;
  (* keep *) wire [31:0] execute_SrcPlugin_add;
  (* keep *) wire [31:0] execute_SrcPlugin_sub;
  wire  execute_SrcPlugin_less;
  wire [4:0] execute_FullBarrelShifterPlugin_amplitude;
  reg [31:0] _zz_164_;
  wire [31:0] execute_FullBarrelShifterPlugin_reversed;
  reg [31:0] _zz_165_;
  reg  _zz_166_;
  reg  _zz_167_;
  wire  _zz_168_;
  reg  _zz_169_;
  reg [4:0] _zz_170_;
  reg [31:0] _zz_171_;
  wire  _zz_172_;
  wire  _zz_173_;
  wire  _zz_174_;
  wire  _zz_175_;
  wire  _zz_176_;
  wire  _zz_177_;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_178_;
  reg  _zz_179_;
  reg  _zz_180_;
  wire [31:0] execute_BranchPlugin_branch_src1;
  wire  _zz_181_;
  reg [10:0] _zz_182_;
  wire  _zz_183_;
  reg [19:0] _zz_184_;
  wire  _zz_185_;
  reg [18:0] _zz_186_;
  reg [31:0] _zz_187_;
  wire [31:0] execute_BranchPlugin_branch_src2;
  wire [31:0] execute_BranchPlugin_branchAdder;
  wire  memory_BranchPlugin_predictionMissmatch;
  reg [31:0] decode_to_execute_SRC2;
  reg  decode_to_execute_IS_RS1_SIGNED;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg  execute_to_memory_MEMORY_ENABLE;
  reg  memory_to_writeBack_MEMORY_ENABLE;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg [31:0] decode_to_execute_RS2;
  reg [31:0] execute_to_memory_RS2;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg [31:0] execute_to_memory_FORMAL_PC_NEXT;
  reg [31:0] memory_to_writeBack_FORMAL_PC_NEXT;
  reg [31:0] execute_to_memory_BRANCH_CALC;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg [33:0] execute_to_memory_MUL_HL;
  reg [31:0] decode_to_execute_SRC1;
  reg  execute_to_memory_FAST_DIV_VALID;
  reg [33:0] execute_to_memory_MUL_HH;
  reg [33:0] memory_to_writeBack_MUL_HH;
  reg  memory_to_writeBack_ALIGNEMENT_FAULT;
  reg  decode_to_execute_IS_RS2_SIGNED;
  reg [31:0] decode_to_execute_PC;
  reg [31:0] execute_to_memory_PC;
  reg [31:0] memory_to_writeBack_PC;
  reg  decode_to_execute_IS_MUL;
  reg  execute_to_memory_IS_MUL;
  reg  memory_to_writeBack_IS_MUL;
  reg  decode_to_execute_IS_FENCEI;
  reg [31:0] execute_to_memory_REGFILE_WRITE_DATA;
  reg [31:0] memory_to_writeBack_REGFILE_WRITE_DATA;
  reg [31:0] execute_to_memory_MUL_LL;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  execute_to_memory_REGFILE_WRITE_VALID;
  reg  memory_to_writeBack_REGFILE_WRITE_VALID;
  reg  decode_to_execute_PREDICTION_CONTEXT_hazard;
  reg  decode_to_execute_PREDICTION_CONTEXT_hit;
  reg [21:0] decode_to_execute_PREDICTION_CONTEXT_line_source;
  reg [1:0] decode_to_execute_PREDICTION_CONTEXT_line_branchWish;
  reg [31:0] decode_to_execute_PREDICTION_CONTEXT_line_target;
  reg  execute_to_memory_PREDICTION_CONTEXT_hazard;
  reg  execute_to_memory_PREDICTION_CONTEXT_hit;
  reg [21:0] execute_to_memory_PREDICTION_CONTEXT_line_source;
  reg [1:0] execute_to_memory_PREDICTION_CONTEXT_line_branchWish;
  reg [31:0] execute_to_memory_PREDICTION_CONTEXT_line_target;
  reg  decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg  execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg  decode_to_execute_IS_DIV;
  reg  execute_to_memory_IS_DIV;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg  decode_to_execute_IS_CSR;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg [31:0] execute_to_memory_SHIFT_RIGHT;
  reg  execute_to_memory_TARGET_MISSMATCH2;
  reg [31:0] execute_to_memory_SRC_ADD;
  reg [31:0] decode_to_execute_RS1;
  reg  execute_to_memory_BRANCH_DO;
  reg [33:0] execute_to_memory_MUL_LH;
  reg [3:0] execute_to_memory_FAST_DIV_VALUE;
  reg  decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg [31:0] execute_to_memory_INSTRUCTION;
  reg [31:0] memory_to_writeBack_INSTRUCTION;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg [1:0] memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg [51:0] memory_to_writeBack_MUL_LOW;
  reg [31:0] execute_to_memory_NEXT_PC2;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg [55:0] IBusSimplePlugin_predictor_history [0:255];
  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign _zz_199_ = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_200_ = (! memory_MulDivIterativePlugin_div_done);
  assign _zz_201_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_202_ = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_203_ = (IBusSimplePlugin_fetchPc_preOutput_valid && IBusSimplePlugin_fetchPc_preOutput_ready);
  assign _zz_204_ = (! memory_arbitration_isStuck);
  assign _zz_205_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_206_ = writeBack_INSTRUCTION[29 : 28];
  assign _zz_207_ = execute_INSTRUCTION[13];
  assign _zz_208_ = execute_INSTRUCTION[13 : 12];
  assign _zz_209_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_210_ = (_zz_107_ & (~ _zz_211_));
  assign _zz_211_ = (_zz_107_ - (2'b01));
  assign _zz_212_ = {IBusSimplePlugin_fetchPc_inc,(2'b00)};
  assign _zz_213_ = {29'd0, _zz_212_};
  assign _zz_214_ = _zz_124_[7:0];
  assign _zz_215_ = (IBusSimplePlugin_iBusRsp_stages_1_input_payload >>> 10);
  assign _zz_216_ = (IBusSimplePlugin_iBusRsp_stages_1_input_payload >>> 2);
  assign _zz_217_ = _zz_216_[7:0];
  assign _zz_218_ = (memory_PREDICTION_CONTEXT_line_branchWish + _zz_220_);
  assign _zz_219_ = (memory_PREDICTION_CONTEXT_line_branchWish == (2'b10));
  assign _zz_220_ = {1'd0, _zz_219_};
  assign _zz_221_ = (memory_PREDICTION_CONTEXT_line_branchWish == (2'b01));
  assign _zz_222_ = {1'd0, _zz_221_};
  assign _zz_223_ = (memory_PREDICTION_CONTEXT_line_branchWish - _zz_225_);
  assign _zz_224_ = memory_PREDICTION_CONTEXT_line_branchWish[1];
  assign _zz_225_ = {1'd0, _zz_224_};
  assign _zz_226_ = (! memory_PREDICTION_CONTEXT_line_branchWish[1]);
  assign _zz_227_ = {1'd0, _zz_226_};
  assign _zz_228_ = (IBusSimplePlugin_pendingCmd + _zz_230_);
  assign _zz_229_ = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign _zz_230_ = {2'd0, _zz_229_};
  assign _zz_231_ = iBus_rsp_valid;
  assign _zz_232_ = {2'd0, _zz_231_};
  assign _zz_233_ = (iBus_rsp_valid && (IBusSimplePlugin_rspJoin_discardCounter != (3'b000)));
  assign _zz_234_ = {2'd0, _zz_233_};
  assign _zz_235_ = (IBusSimplePlugin_pendingCmd + _zz_237_);
  assign _zz_236_ = IBusSimplePlugin_cmd_valid;
  assign _zz_237_ = {2'd0, _zz_236_};
  assign _zz_238_ = iBus_rsp_valid;
  assign _zz_239_ = {2'd0, _zz_238_};
  assign _zz_240_ = (writeBack_INSTRUCTION[5] ? (3'b110) : (3'b100));
  assign _zz_241_ = _zz_137_[10 : 10];
  assign _zz_242_ = _zz_137_[11 : 11];
  assign _zz_243_ = _zz_137_[12 : 12];
  assign _zz_244_ = _zz_137_[13 : 13];
  assign _zz_245_ = _zz_137_[15 : 15];
  assign _zz_246_ = _zz_137_[16 : 16];
  assign _zz_247_ = _zz_137_[17 : 17];
  assign _zz_248_ = _zz_137_[18 : 18];
  assign _zz_249_ = _zz_137_[19 : 19];
  assign _zz_250_ = _zz_137_[20 : 20];
  assign _zz_251_ = _zz_137_[23 : 23];
  assign _zz_252_ = _zz_137_[24 : 24];
  assign _zz_253_ = _zz_137_[25 : 25];
  assign _zz_254_ = _zz_137_[28 : 28];
  assign _zz_255_ = ($signed(_zz_256_) + $signed(_zz_261_));
  assign _zz_256_ = ($signed(_zz_257_) + $signed(_zz_259_));
  assign _zz_257_ = (52'b0000000000000000000000000000000000000000000000000000);
  assign _zz_258_ = {1'b0,memory_MUL_LL};
  assign _zz_259_ = {{19{_zz_258_[32]}}, _zz_258_};
  assign _zz_260_ = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_261_ = {{2{_zz_260_[49]}}, _zz_260_};
  assign _zz_262_ = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_263_ = {{2{_zz_262_[49]}}, _zz_262_};
  assign _zz_264_ = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_265_ = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_266_ = writeBack_MUL_LOW[31 : 0];
  assign _zz_267_ = writeBack_MulPlugin_result[63 : 32];
  assign _zz_268_ = memory_MulDivIterativePlugin_div_counter_willIncrement;
  assign _zz_269_ = {5'd0, _zz_268_};
  assign _zz_270_ = {1'd0, memory_MulDivIterativePlugin_rs2};
  assign _zz_271_ = {_zz_150_,(! _zz_152_[32])};
  assign _zz_272_ = _zz_152_[31:0];
  assign _zz_273_ = _zz_151_[31:0];
  assign _zz_274_ = _zz_275_;
  assign _zz_275_ = _zz_276_;
  assign _zz_276_ = ({1'b0,(memory_MulDivIterativePlugin_div_needRevert ? (~ _zz_153_) : _zz_153_)} + _zz_278_);
  assign _zz_277_ = memory_MulDivIterativePlugin_div_needRevert;
  assign _zz_278_ = {32'd0, _zz_277_};
  assign _zz_279_ = _zz_155_;
  assign _zz_280_ = {32'd0, _zz_279_};
  assign _zz_281_ = _zz_154_;
  assign _zz_282_ = {31'd0, _zz_281_};
  assign _zz_283_ = execute_SRC_LESS;
  assign _zz_284_ = (3'b100);
  assign _zz_285_ = decode_INSTRUCTION[19 : 15];
  assign _zz_286_ = decode_INSTRUCTION[31 : 20];
  assign _zz_287_ = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_288_ = (execute_SRC1 + execute_SRC2);
  assign _zz_289_ = (execute_SRC1 - execute_SRC2);
  assign _zz_290_ = ($signed(_zz_292_) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_291_ = _zz_290_[31 : 0];
  assign _zz_292_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_293_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_294_ = execute_INSTRUCTION[31 : 20];
  assign _zz_295_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_296_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_297_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_298_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_299_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_300_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_301_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_302_ = {IBusSimplePlugin_predictor_historyWrite_payload_data_target,{IBusSimplePlugin_predictor_historyWrite_payload_data_branchWish,IBusSimplePlugin_predictor_historyWrite_payload_data_source}};
  assign _zz_303_ = 1'b1;
  assign _zz_304_ = 1'b1;
  assign _zz_305_ = {execute_RS1[3 : 0],execute_RS2[3 : 0]};
  assign _zz_306_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000000));
  assign _zz_307_ = (32'b00000000000000000000000001000000);
  assign _zz_308_ = (_zz_319_ == _zz_320_);
  assign _zz_309_ = {_zz_321_,_zz_322_};
  assign _zz_310_ = ((decode_INSTRUCTION & _zz_323_) == (32'b00000000000000000101000000010000));
  assign _zz_311_ = ((decode_INSTRUCTION & _zz_324_) == (32'b00000000000000000101000000100000));
  assign _zz_312_ = (_zz_325_ == _zz_326_);
  assign _zz_313_ = {_zz_327_,_zz_328_};
  assign _zz_314_ = (_zz_329_ == _zz_330_);
  assign _zz_315_ = (1'b0);
  assign _zz_316_ = (_zz_331_ != (1'b0));
  assign _zz_317_ = (_zz_332_ != _zz_333_);
  assign _zz_318_ = {_zz_334_,{_zz_335_,_zz_336_}};
  assign _zz_319_ = (decode_INSTRUCTION & (32'b00000000000000000100000000100000));
  assign _zz_320_ = (32'b00000000000000000100000000100000);
  assign _zz_321_ = ((decode_INSTRUCTION & _zz_337_) == (32'b00000000000000000000000000010000));
  assign _zz_322_ = ((decode_INSTRUCTION & _zz_338_) == (32'b00000000000000000000000000100000));
  assign _zz_323_ = (32'b00000000000000000111000000110100);
  assign _zz_324_ = (32'b00000010000000000111000001100100);
  assign _zz_325_ = (decode_INSTRUCTION & (32'b01000000000000000011000001010100));
  assign _zz_326_ = (32'b01000000000000000001000000010000);
  assign _zz_327_ = ((decode_INSTRUCTION & _zz_339_) == (32'b00000000000000000001000000010000));
  assign _zz_328_ = ((decode_INSTRUCTION & _zz_340_) == (32'b00000000000000000001000000010000));
  assign _zz_329_ = (decode_INSTRUCTION & (32'b00000000000000000000000001001000));
  assign _zz_330_ = (32'b00000000000000000000000000001000);
  assign _zz_331_ = ((decode_INSTRUCTION & _zz_341_) == (32'b00000000000000000000000000000000));
  assign _zz_332_ = {_zz_342_,{_zz_343_,_zz_344_}};
  assign _zz_333_ = (3'b000);
  assign _zz_334_ = ({_zz_345_,_zz_346_} != (2'b00));
  assign _zz_335_ = (_zz_347_ != _zz_348_);
  assign _zz_336_ = {_zz_349_,{_zz_350_,_zz_351_}};
  assign _zz_337_ = (32'b00000000000000000000000000110000);
  assign _zz_338_ = (32'b00000010000000000000000000100000);
  assign _zz_339_ = (32'b00000000000000000111000000110100);
  assign _zz_340_ = (32'b00000010000000000111000001010100);
  assign _zz_341_ = (32'b00000000000000000000000001011000);
  assign _zz_342_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001000100)) == (32'b00000000000000000000000001000000));
  assign _zz_343_ = ((decode_INSTRUCTION & _zz_352_) == (32'b01000000000000000000000000110000));
  assign _zz_344_ = ((decode_INSTRUCTION & _zz_353_) == (32'b00000000000000000010000000010000));
  assign _zz_345_ = _zz_139_;
  assign _zz_346_ = _zz_141_;
  assign _zz_347_ = {(_zz_354_ == _zz_355_),_zz_141_};
  assign _zz_348_ = (2'b00);
  assign _zz_349_ = (_zz_140_ != (1'b0));
  assign _zz_350_ = ({_zz_356_,_zz_357_} != (2'b00));
  assign _zz_351_ = {(_zz_358_ != _zz_359_),{_zz_360_,{_zz_361_,_zz_362_}}};
  assign _zz_352_ = (32'b01000000000000000000000000110000);
  assign _zz_353_ = (32'b00000000000000000010000000010100);
  assign _zz_354_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_355_ = (32'b00000000000000000000000000000100);
  assign _zz_356_ = ((decode_INSTRUCTION & _zz_363_) == (32'b00000000000000000010000000000000));
  assign _zz_357_ = ((decode_INSTRUCTION & _zz_364_) == (32'b00000000000000000001000000000000));
  assign _zz_358_ = {(_zz_365_ == _zz_366_),(_zz_367_ == _zz_368_)};
  assign _zz_359_ = (2'b00);
  assign _zz_360_ = ({_zz_369_,_zz_370_} != (2'b00));
  assign _zz_361_ = (_zz_140_ != (1'b0));
  assign _zz_362_ = {(_zz_371_ != _zz_372_),{_zz_373_,{_zz_374_,_zz_375_}}};
  assign _zz_363_ = (32'b00000000000000000010000000010000);
  assign _zz_364_ = (32'b00000000000000000101000000000000);
  assign _zz_365_ = (decode_INSTRUCTION & (32'b00000000000000000000000000110100));
  assign _zz_366_ = (32'b00000000000000000000000000100000);
  assign _zz_367_ = (decode_INSTRUCTION & (32'b00000000000000000000000001100100));
  assign _zz_368_ = (32'b00000000000000000000000000100000);
  assign _zz_369_ = ((decode_INSTRUCTION & (32'b00000000000000000001000001010000)) == (32'b00000000000000000001000001010000));
  assign _zz_370_ = ((decode_INSTRUCTION & (32'b00000000000000000010000001010000)) == (32'b00000000000000000010000001010000));
  assign _zz_371_ = {(_zz_376_ == _zz_377_),{_zz_378_,{_zz_379_,_zz_380_}}};
  assign _zz_372_ = (6'b000000);
  assign _zz_373_ = ({_zz_381_,{_zz_382_,_zz_383_}} != (3'b000));
  assign _zz_374_ = ({_zz_384_,_zz_385_} != (5'b00000));
  assign _zz_375_ = {(_zz_386_ != _zz_387_),{_zz_388_,{_zz_389_,_zz_390_}}};
  assign _zz_376_ = (decode_INSTRUCTION & (32'b00000000000000000000000001001000));
  assign _zz_377_ = (32'b00000000000000000000000001001000);
  assign _zz_378_ = ((decode_INSTRUCTION & _zz_391_) == (32'b00000000000000000001000000010000));
  assign _zz_379_ = (_zz_392_ == _zz_393_);
  assign _zz_380_ = {_zz_394_,{_zz_395_,_zz_396_}};
  assign _zz_381_ = ((decode_INSTRUCTION & _zz_397_) == (32'b00000000000000000000000001000000));
  assign _zz_382_ = (_zz_398_ == _zz_399_);
  assign _zz_383_ = (_zz_400_ == _zz_401_);
  assign _zz_384_ = _zz_138_;
  assign _zz_385_ = {_zz_402_,{_zz_403_,_zz_404_}};
  assign _zz_386_ = (_zz_405_ == _zz_406_);
  assign _zz_387_ = (1'b0);
  assign _zz_388_ = ({_zz_407_,_zz_408_} != (4'b0000));
  assign _zz_389_ = (_zz_409_ != _zz_410_);
  assign _zz_390_ = {_zz_411_,{_zz_412_,_zz_413_}};
  assign _zz_391_ = (32'b00000000000000000001000000010000);
  assign _zz_392_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_393_ = (32'b00000000000000000010000000010000);
  assign _zz_394_ = ((decode_INSTRUCTION & _zz_414_) == (32'b00000000000000000000000000000100));
  assign _zz_395_ = (_zz_415_ == _zz_416_);
  assign _zz_396_ = (_zz_417_ == _zz_418_);
  assign _zz_397_ = (32'b00000000000000000000000001010000);
  assign _zz_398_ = (decode_INSTRUCTION & (32'b00000000000000000000000000110000));
  assign _zz_399_ = (32'b00000000000000000000000000000000);
  assign _zz_400_ = (decode_INSTRUCTION & (32'b00000000010000000011000001000000));
  assign _zz_401_ = (32'b00000000000000000000000001000000);
  assign _zz_402_ = ((decode_INSTRUCTION & _zz_419_) == (32'b00000000000000000010000000010000));
  assign _zz_403_ = (_zz_420_ == _zz_421_);
  assign _zz_404_ = {_zz_422_,_zz_423_};
  assign _zz_405_ = (decode_INSTRUCTION & (32'b00000010000000000100000001100100));
  assign _zz_406_ = (32'b00000010000000000100000000100000);
  assign _zz_407_ = (_zz_424_ == _zz_425_);
  assign _zz_408_ = {_zz_426_,{_zz_427_,_zz_428_}};
  assign _zz_409_ = (_zz_429_ == _zz_430_);
  assign _zz_410_ = (1'b0);
  assign _zz_411_ = (_zz_139_ != (1'b0));
  assign _zz_412_ = (_zz_431_ != _zz_432_);
  assign _zz_413_ = {_zz_433_,{_zz_434_,_zz_435_}};
  assign _zz_414_ = (32'b00000000000000000001000000000100);
  assign _zz_415_ = (decode_INSTRUCTION & (32'b00000000000000000000000001010000));
  assign _zz_416_ = (32'b00000000000000000000000000010000);
  assign _zz_417_ = (decode_INSTRUCTION & (32'b00000000000000000000000000101000));
  assign _zz_418_ = (32'b00000000000000000000000000000000);
  assign _zz_419_ = (32'b00000000000000000010000000110000);
  assign _zz_420_ = (decode_INSTRUCTION & (32'b00000000000000000001000000110000));
  assign _zz_421_ = (32'b00000000000000000000000000010000);
  assign _zz_422_ = ((decode_INSTRUCTION & _zz_436_) == (32'b00000000000000000010000000100000));
  assign _zz_423_ = ((decode_INSTRUCTION & _zz_437_) == (32'b00000000000000000000000000100000));
  assign _zz_424_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_425_ = (32'b00000000000000000000000000000000);
  assign _zz_426_ = ((decode_INSTRUCTION & _zz_438_) == (32'b00000000000000000000000000000000));
  assign _zz_427_ = (_zz_439_ == _zz_440_);
  assign _zz_428_ = (_zz_441_ == _zz_442_);
  assign _zz_429_ = (decode_INSTRUCTION & (32'b00000010000000000100000001110100));
  assign _zz_430_ = (32'b00000010000000000000000000110000);
  assign _zz_431_ = (_zz_443_ == _zz_444_);
  assign _zz_432_ = (1'b0);
  assign _zz_433_ = ({_zz_445_,_zz_446_} != (2'b00));
  assign _zz_434_ = (_zz_447_ != _zz_448_);
  assign _zz_435_ = {_zz_449_,{_zz_450_,_zz_451_}};
  assign _zz_436_ = (32'b00000010000000000010000001100000);
  assign _zz_437_ = (32'b00000010000000000011000000100000);
  assign _zz_438_ = (32'b00000000000000000000000000011000);
  assign _zz_439_ = (decode_INSTRUCTION & (32'b00000000000000000110000000000100));
  assign _zz_440_ = (32'b00000000000000000010000000000000);
  assign _zz_441_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000100));
  assign _zz_442_ = (32'b00000000000000000001000000000000);
  assign _zz_443_ = (decode_INSTRUCTION & (32'b00000000000000000000000001011000));
  assign _zz_444_ = (32'b00000000000000000000000001000000);
  assign _zz_445_ = _zz_138_;
  assign _zz_446_ = ((decode_INSTRUCTION & _zz_452_) == (32'b00000000000000000000000000100000));
  assign _zz_447_ = {_zz_138_,(_zz_453_ == _zz_454_)};
  assign _zz_448_ = (2'b00);
  assign _zz_449_ = ({_zz_455_,_zz_456_} != (2'b00));
  assign _zz_450_ = (_zz_457_ != (1'b0));
  assign _zz_451_ = {(_zz_458_ != _zz_459_),{_zz_460_,{_zz_461_,_zz_462_}}};
  assign _zz_452_ = (32'b00000000000000000000000001110000);
  assign _zz_453_ = (decode_INSTRUCTION & (32'b00000000000000000000000000100000));
  assign _zz_454_ = (32'b00000000000000000000000000000000);
  assign _zz_455_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001100100)) == (32'b00000000000000000000000000100100));
  assign _zz_456_ = ((decode_INSTRUCTION & (32'b00000000000000000100000000010100)) == (32'b00000000000000000100000000010000));
  assign _zz_457_ = ((decode_INSTRUCTION & (32'b00000000000000000110000000010100)) == (32'b00000000000000000010000000010000));
  assign _zz_458_ = {((decode_INSTRUCTION & _zz_463_) == (32'b00000000000000000001000000000000)),_zz_138_};
  assign _zz_459_ = (2'b00);
  assign _zz_460_ = ({_zz_138_,(_zz_464_ == _zz_465_)} != (2'b00));
  assign _zz_461_ = ((_zz_466_ == _zz_467_) != (1'b0));
  assign _zz_462_ = ({_zz_468_,_zz_469_} != (2'b00));
  assign _zz_463_ = (32'b00000000000000000001000000000000);
  assign _zz_464_ = (decode_INSTRUCTION & (32'b00000000000000000011000000000000));
  assign _zz_465_ = (32'b00000000000000000010000000000000);
  assign _zz_466_ = (decode_INSTRUCTION & (32'b00010000000000000011000001010000));
  assign _zz_467_ = (32'b00000000000000000000000001010000);
  assign _zz_468_ = ((decode_INSTRUCTION & (32'b00010000000100000011000001010000)) == (32'b00000000000100000000000001010000));
  assign _zz_469_ = ((decode_INSTRUCTION & (32'b00010000010000000011000001010000)) == (32'b00010000000000000000000001010000));
  always @ (posedge io_clk) begin
    if(_zz_94_) begin
      IBusSimplePlugin_predictor_history[IBusSimplePlugin_predictor_historyWrite_payload_address] <= _zz_302_;
    end
  end

  always @ (posedge io_clk) begin
    if(_zz_125_) begin
      _zz_190_ <= IBusSimplePlugin_predictor_history[_zz_214_];
    end
  end

  always @ (posedge io_clk) begin
    if(_zz_55_) begin
      RegFilePlugin_regFile[writeBack_RegFilePlugin_regFileWrite_payload_address] <= writeBack_RegFilePlugin_regFileWrite_payload_data;
    end
  end

  always @ (posedge io_clk) begin
    if(_zz_303_) begin
      _zz_191_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge io_clk) begin
    if(_zz_304_) begin
      _zz_192_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c ( 
    .io_push_valid(_zz_188_),
    .io_push_ready(_zz_194_),
    .io_push_payload_error(iBus_rsp_payload_error),
    .io_push_payload_inst(iBus_rsp_payload_inst),
    .io_pop_valid(_zz_195_),
    .io_pop_ready(IBusSimplePlugin_rspJoin_rspBufferOutput_ready),
    .io_pop_payload_error(_zz_196_),
    .io_pop_payload_inst(_zz_197_),
    .io_flush(_zz_189_),
    .io_occupancy(_zz_198_),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(GLOBAL_BUFFER_OUTPUT) 
  );
  always @(*) begin
    case(_zz_305_)
      8'b00000000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00000001 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00000010 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00000011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00000100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00000101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00000110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00000111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00001000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00001001 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00001010 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00001011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00001100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00001101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00001110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00001111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00010000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00010001 : begin
        _zz_193_ = (4'b0001);
      end
      8'b00010010 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00010011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00010100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00010101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00010110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00010111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00011000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00011001 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00011010 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00011011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00011100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00011101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00011110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00011111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00100000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00100001 : begin
        _zz_193_ = (4'b0010);
      end
      8'b00100010 : begin
        _zz_193_ = (4'b0001);
      end
      8'b00100011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00100100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00100101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00100110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00100111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00101000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00101001 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00101010 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00101011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00101100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00101101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00101110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00101111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00110000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00110001 : begin
        _zz_193_ = (4'b0011);
      end
      8'b00110010 : begin
        _zz_193_ = (4'b0001);
      end
      8'b00110011 : begin
        _zz_193_ = (4'b0001);
      end
      8'b00110100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00110101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00110110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00110111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00111000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00111001 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00111010 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00111011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00111100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00111101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00111110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b00111111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01000000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01000001 : begin
        _zz_193_ = (4'b0100);
      end
      8'b01000010 : begin
        _zz_193_ = (4'b0010);
      end
      8'b01000011 : begin
        _zz_193_ = (4'b0001);
      end
      8'b01000100 : begin
        _zz_193_ = (4'b0001);
      end
      8'b01000101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01000110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01000111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01001000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01001001 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01001010 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01001011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01001100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01001101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01001110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01001111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01010000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01010001 : begin
        _zz_193_ = (4'b0101);
      end
      8'b01010010 : begin
        _zz_193_ = (4'b0010);
      end
      8'b01010011 : begin
        _zz_193_ = (4'b0001);
      end
      8'b01010100 : begin
        _zz_193_ = (4'b0001);
      end
      8'b01010101 : begin
        _zz_193_ = (4'b0001);
      end
      8'b01010110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01010111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01011000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01011001 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01011010 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01011011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01011100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01011101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01011110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01011111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01100000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01100001 : begin
        _zz_193_ = (4'b0110);
      end
      8'b01100010 : begin
        _zz_193_ = (4'b0011);
      end
      8'b01100011 : begin
        _zz_193_ = (4'b0010);
      end
      8'b01100100 : begin
        _zz_193_ = (4'b0001);
      end
      8'b01100101 : begin
        _zz_193_ = (4'b0001);
      end
      8'b01100110 : begin
        _zz_193_ = (4'b0001);
      end
      8'b01100111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01101000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01101001 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01101010 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01101011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01101100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01101101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01101110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01101111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01110000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01110001 : begin
        _zz_193_ = (4'b0111);
      end
      8'b01110010 : begin
        _zz_193_ = (4'b0011);
      end
      8'b01110011 : begin
        _zz_193_ = (4'b0010);
      end
      8'b01110100 : begin
        _zz_193_ = (4'b0001);
      end
      8'b01110101 : begin
        _zz_193_ = (4'b0001);
      end
      8'b01110110 : begin
        _zz_193_ = (4'b0001);
      end
      8'b01110111 : begin
        _zz_193_ = (4'b0001);
      end
      8'b01111000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01111001 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01111010 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01111011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01111100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01111101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01111110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b01111111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10000000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10000001 : begin
        _zz_193_ = (4'b1000);
      end
      8'b10000010 : begin
        _zz_193_ = (4'b0100);
      end
      8'b10000011 : begin
        _zz_193_ = (4'b0010);
      end
      8'b10000100 : begin
        _zz_193_ = (4'b0010);
      end
      8'b10000101 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10000110 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10000111 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10001000 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10001001 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10001010 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10001011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10001100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10001101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10001110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10001111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10010000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10010001 : begin
        _zz_193_ = (4'b1001);
      end
      8'b10010010 : begin
        _zz_193_ = (4'b0100);
      end
      8'b10010011 : begin
        _zz_193_ = (4'b0011);
      end
      8'b10010100 : begin
        _zz_193_ = (4'b0010);
      end
      8'b10010101 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10010110 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10010111 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10011000 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10011001 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10011010 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10011011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10011100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10011101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10011110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10011111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10100000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10100001 : begin
        _zz_193_ = (4'b1010);
      end
      8'b10100010 : begin
        _zz_193_ = (4'b0101);
      end
      8'b10100011 : begin
        _zz_193_ = (4'b0011);
      end
      8'b10100100 : begin
        _zz_193_ = (4'b0010);
      end
      8'b10100101 : begin
        _zz_193_ = (4'b0010);
      end
      8'b10100110 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10100111 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10101000 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10101001 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10101010 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10101011 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10101100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10101101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10101110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10101111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10110000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10110001 : begin
        _zz_193_ = (4'b1011);
      end
      8'b10110010 : begin
        _zz_193_ = (4'b0101);
      end
      8'b10110011 : begin
        _zz_193_ = (4'b0011);
      end
      8'b10110100 : begin
        _zz_193_ = (4'b0010);
      end
      8'b10110101 : begin
        _zz_193_ = (4'b0010);
      end
      8'b10110110 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10110111 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10111000 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10111001 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10111010 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10111011 : begin
        _zz_193_ = (4'b0001);
      end
      8'b10111100 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10111101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10111110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b10111111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b11000000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b11000001 : begin
        _zz_193_ = (4'b1100);
      end
      8'b11000010 : begin
        _zz_193_ = (4'b0110);
      end
      8'b11000011 : begin
        _zz_193_ = (4'b0100);
      end
      8'b11000100 : begin
        _zz_193_ = (4'b0011);
      end
      8'b11000101 : begin
        _zz_193_ = (4'b0010);
      end
      8'b11000110 : begin
        _zz_193_ = (4'b0010);
      end
      8'b11000111 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11001000 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11001001 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11001010 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11001011 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11001100 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11001101 : begin
        _zz_193_ = (4'b0000);
      end
      8'b11001110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b11001111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b11010000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b11010001 : begin
        _zz_193_ = (4'b1101);
      end
      8'b11010010 : begin
        _zz_193_ = (4'b0110);
      end
      8'b11010011 : begin
        _zz_193_ = (4'b0100);
      end
      8'b11010100 : begin
        _zz_193_ = (4'b0011);
      end
      8'b11010101 : begin
        _zz_193_ = (4'b0010);
      end
      8'b11010110 : begin
        _zz_193_ = (4'b0010);
      end
      8'b11010111 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11011000 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11011001 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11011010 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11011011 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11011100 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11011101 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11011110 : begin
        _zz_193_ = (4'b0000);
      end
      8'b11011111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b11100000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b11100001 : begin
        _zz_193_ = (4'b1110);
      end
      8'b11100010 : begin
        _zz_193_ = (4'b0111);
      end
      8'b11100011 : begin
        _zz_193_ = (4'b0100);
      end
      8'b11100100 : begin
        _zz_193_ = (4'b0011);
      end
      8'b11100101 : begin
        _zz_193_ = (4'b0010);
      end
      8'b11100110 : begin
        _zz_193_ = (4'b0010);
      end
      8'b11100111 : begin
        _zz_193_ = (4'b0010);
      end
      8'b11101000 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11101001 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11101010 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11101011 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11101100 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11101101 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11101110 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11101111 : begin
        _zz_193_ = (4'b0000);
      end
      8'b11110000 : begin
        _zz_193_ = (4'b0000);
      end
      8'b11110001 : begin
        _zz_193_ = (4'b1111);
      end
      8'b11110010 : begin
        _zz_193_ = (4'b0111);
      end
      8'b11110011 : begin
        _zz_193_ = (4'b0101);
      end
      8'b11110100 : begin
        _zz_193_ = (4'b0011);
      end
      8'b11110101 : begin
        _zz_193_ = (4'b0011);
      end
      8'b11110110 : begin
        _zz_193_ = (4'b0010);
      end
      8'b11110111 : begin
        _zz_193_ = (4'b0010);
      end
      8'b11111000 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11111001 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11111010 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11111011 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11111100 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11111101 : begin
        _zz_193_ = (4'b0001);
      end
      8'b11111110 : begin
        _zz_193_ = (4'b0001);
      end
      default : begin
        _zz_193_ = (4'b0001);
      end
    endcase
  end

  assign _zz_1_ = _zz_2_;
  assign decode_SHIFT_CTRL = _zz_3_;
  assign _zz_4_ = _zz_5_;
  assign execute_NEXT_PC2 = _zz_24_;
  assign memory_MUL_LOW = _zz_48_;
  assign memory_MEMORY_ADDRESS_LOW = _zz_87_;
  assign decode_ALU_CTRL = _zz_6_;
  assign _zz_7_ = _zz_8_;
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_70_;
  assign execute_FAST_DIV_VALUE = _zz_45_;
  assign execute_MUL_LH = _zz_51_;
  assign execute_BRANCH_DO = _zz_27_;
  assign execute_SRC_ADD = _zz_32_;
  assign execute_TARGET_MISSMATCH2 = _zz_23_;
  assign execute_SHIFT_RIGHT = _zz_29_;
  assign decode_CSR_WRITE_OPCODE = _zz_83_;
  assign decode_IS_CSR = _zz_67_;
  assign decode_ALU_BITWISE_CTRL = _zz_9_;
  assign _zz_10_ = _zz_11_;
  assign decode_IS_DIV = _zz_71_;
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_58_;
  assign execute_PREDICTION_CONTEXT_hazard = decode_to_execute_PREDICTION_CONTEXT_hazard;
  assign execute_PREDICTION_CONTEXT_hit = decode_to_execute_PREDICTION_CONTEXT_hit;
  assign execute_PREDICTION_CONTEXT_line_source = decode_to_execute_PREDICTION_CONTEXT_line_source;
  assign execute_PREDICTION_CONTEXT_line_branchWish = decode_to_execute_PREDICTION_CONTEXT_line_branchWish;
  assign execute_PREDICTION_CONTEXT_line_target = decode_to_execute_PREDICTION_CONTEXT_line_target;
  assign decode_PREDICTION_CONTEXT_hazard = _zz_89_;
  assign decode_PREDICTION_CONTEXT_hit = _zz_90_;
  assign decode_PREDICTION_CONTEXT_line_source = _zz_91_;
  assign decode_PREDICTION_CONTEXT_line_branchWish = _zz_92_;
  assign decode_PREDICTION_CONTEXT_line_target = _zz_93_;
  assign execute_MUL_LL = _zz_52_;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_42_;
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_73_;
  assign decode_IS_RS2_SIGNED = _zz_68_;
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = _zz_49_;
  assign decode_SRC1 = _zz_40_;
  assign execute_MUL_HL = _zz_50_;
  assign decode_SRC_LESS_UNSIGNED = _zz_65_;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = _zz_96_;
  assign decode_SRC_USE_SUB_LESS = _zz_62_;
  assign decode_CSR_READ_OPCODE = _zz_82_;
  assign _zz_12_ = _zz_13_;
  assign _zz_14_ = _zz_15_;
  assign decode_ENV_CTRL = _zz_16_;
  assign _zz_17_ = _zz_18_;
  assign decode_BRANCH_CTRL = _zz_19_;
  assign _zz_20_ = _zz_21_;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign decode_MEMORY_ENABLE = _zz_61_;
  assign decode_IS_RS1_SIGNED = _zz_64_;
  assign decode_SRC2 = _zz_37_;
  assign execute_IS_FENCEI = decode_to_execute_IS_FENCEI;
  always @ (*) begin
    _zz_22_ = decode_INSTRUCTION;
    if(decode_IS_FENCEI)begin
      _zz_22_[12] = 1'b0;
      _zz_22_[22] = 1'b1;
    end
  end

  assign decode_IS_FENCEI = _zz_60_;
  assign memory_NEXT_PC2 = execute_to_memory_NEXT_PC2;
  assign memory_PC = execute_to_memory_PC;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_TARGET_MISSMATCH2 = execute_to_memory_TARGET_MISSMATCH2;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_BRANCH_CALC = _zz_25_;
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_CTRL = _zz_26_;
  assign decode_RS2_USE = _zz_66_;
  assign decode_RS1_USE = _zz_72_;
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = _zz_56_;
    decode_RS1 = _zz_57_;
    if(_zz_169_)begin
      if((_zz_170_ == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_171_;
      end
      if((_zz_170_ == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_171_;
      end
    end
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if(1'b1)begin
        if(_zz_172_)begin
          decode_RS1 = _zz_85_;
        end
        if(_zz_173_)begin
          decode_RS2 = _zz_85_;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_174_)begin
          decode_RS1 = _zz_47_;
        end
        if(_zz_175_)begin
          decode_RS2 = _zz_47_;
        end
      end
    end
    if((execute_arbitration_isValid && execute_REGFILE_WRITE_VALID))begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_176_)begin
          decode_RS1 = _zz_79_;
        end
        if(_zz_177_)begin
          decode_RS2 = _zz_79_;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  assign memory_SHIFT_CTRL = _zz_28_;
  assign execute_SHIFT_CTRL = _zz_30_;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign _zz_34_ = decode_PC;
  assign _zz_35_ = decode_RS2;
  assign decode_SRC2_CTRL = _zz_36_;
  assign _zz_38_ = decode_RS1;
  assign decode_SRC1_CTRL = _zz_39_;
  assign execute_SRC_ADD_SUB = _zz_33_;
  assign execute_SRC_LESS = _zz_31_;
  assign execute_ALU_CTRL = _zz_41_;
  assign execute_ALU_BITWISE_CTRL = _zz_43_;
  assign memory_FAST_DIV_VALUE = execute_to_memory_FAST_DIV_VALUE;
  assign memory_FAST_DIV_VALID = execute_to_memory_FAST_DIV_VALID;
  always @ (*) begin
    _zz_44_ = execute_IS_DIV;
    if(execute_FAST_DIV_VALID)begin
      _zz_44_ = 1'b0;
    end
  end

  assign execute_FAST_DIV_VALID = _zz_46_;
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign execute_RS2 = decode_to_execute_RS2;
  always @ (*) begin
    _zz_47_ = memory_REGFILE_WRITE_DATA;
    memory_arbitration_haltItself = 1'b0;
    if(((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! memory_ALIGNEMENT_FAULT)) && (! memory_DBusSimplePlugin_cmdSent)))begin
      memory_arbitration_haltItself = 1'b1;
    end
    memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b0;
    if(_zz_199_)begin
      if(_zz_200_)begin
        memory_arbitration_haltItself = 1'b1;
        memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b1;
      end
      _zz_47_ = memory_MulDivIterativePlugin_div_result;
    end
    if(memory_FAST_DIV_VALID)begin
      _zz_47_ = {(28'b0000000000000000000000000000),memory_FAST_DIV_VALUE};
    end
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_47_ = _zz_165_;
      end
      `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
        _zz_47_ = memory_SHIFT_RIGHT;
      end
      default : begin
      end
    endcase
  end

  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign _zz_53_ = writeBack_INSTRUCTION;
  assign _zz_54_ = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_55_ = 1'b0;
    if(writeBack_RegFilePlugin_regFileWrite_valid)begin
      _zz_55_ = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = _zz_99_;
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_69_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_79_ = execute_REGFILE_WRITE_DATA;
    execute_arbitration_haltItself = 1'b0;
    if((execute_arbitration_isValid && execute_IS_CSR))begin
      _zz_79_ = execute_CsrPlugin_readData;
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign memory_ENV_CTRL = _zz_80_;
  assign execute_ENV_CTRL = _zz_81_;
  assign writeBack_ENV_CTRL = _zz_84_;
  always @ (*) begin
    _zz_85_ = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_85_ = writeBack_DBusSimplePlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_209_)
        2'b00 : begin
          _zz_85_ = _zz_266_;
        end
        default : begin
          _zz_85_ = _zz_267_;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = _zz_86_;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign writeBack_ALIGNEMENT_FAULT = memory_to_writeBack_ALIGNEMENT_FAULT;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign memory_RS2 = execute_to_memory_RS2;
  assign memory_SRC_ADD = execute_to_memory_SRC_ADD;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_ALIGNEMENT_FAULT = _zz_88_;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign memory_PREDICTION_CONTEXT_hazard = execute_to_memory_PREDICTION_CONTEXT_hazard;
  assign memory_PREDICTION_CONTEXT_hit = execute_to_memory_PREDICTION_CONTEXT_hit;
  assign memory_PREDICTION_CONTEXT_line_source = execute_to_memory_PREDICTION_CONTEXT_line_source;
  assign memory_PREDICTION_CONTEXT_line_branchWish = execute_to_memory_PREDICTION_CONTEXT_line_branchWish;
  assign memory_PREDICTION_CONTEXT_line_target = execute_to_memory_PREDICTION_CONTEXT_line_target;
  always @ (*) begin
    _zz_94_ = 1'b0;
    if(IBusSimplePlugin_predictor_historyWrite_valid)begin
      _zz_94_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_95_ = memory_FORMAL_PC_NEXT;
    if(_zz_105_)begin
      _zz_95_ = _zz_106_;
    end
  end

  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_PC = _zz_98_;
  assign decode_INSTRUCTION = _zz_97_;
  assign decode_arbitration_haltItself = 1'b0;
  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if((CsrPlugin_interrupt && decode_arbitration_isValid))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(({(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))} != (2'b00)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if((decode_arbitration_isValid && (_zz_166_ || _zz_167_)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_flushAll = 1'b0;
    execute_arbitration_removeIt = 1'b0;
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(execute_exception_agregat_valid)begin
      decode_arbitration_flushAll = 1'b1;
      execute_arbitration_removeIt = 1'b1;
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_redoIt = 1'b0;
  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(((execute_arbitration_isValid && execute_IS_FENCEI) && ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00))))begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushAll = 1'b0;
    if(memory_exception_agregat_valid)begin
      execute_arbitration_flushAll = 1'b1;
    end
    if(_zz_105_)begin
      execute_arbitration_flushAll = 1'b1;
    end
  end

  assign execute_arbitration_redoIt = 1'b0;
  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_exception_agregat_valid)begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    memory_arbitration_flushAll = 1'b0;
    writeBack_arbitration_removeIt = 1'b0;
    _zz_103_ = 1'b0;
    _zz_104_ = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(writeBack_exception_agregat_valid)begin
      memory_arbitration_flushAll = 1'b1;
      writeBack_arbitration_removeIt = 1'b1;
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b1;
    end
    if(_zz_201_)begin
      _zz_103_ = 1'b1;
      _zz_104_ = {CsrPlugin_mtvec_base,(2'b00)};
      memory_arbitration_flushAll = 1'b1;
    end
    if(_zz_202_)begin
      _zz_104_ = CsrPlugin_mepc;
      _zz_103_ = 1'b1;
      memory_arbitration_flushAll = 1'b1;
    end
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_redoIt = 1'b0;
  always @ (*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if((((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_INSTRUCTION[5])) && (! dBus_rsp_ready)))begin
      writeBack_arbitration_haltItself = 1'b1;
    end
  end

  assign writeBack_arbitration_haltByOther = 1'b0;
  assign writeBack_arbitration_flushAll = 1'b0;
  assign writeBack_arbitration_redoIt = 1'b0;
  always @ (*) begin
    _zz_100_ = 1'b0;
    if((((CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode || CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute) || CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory) || CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack))begin
      _zz_100_ = 1'b1;
    end
  end

  assign _zz_101_ = 1'b0;
  assign IBusSimplePlugin_jump_pcLoad_valid = (_zz_103_ || _zz_105_);
  assign _zz_107_ = {_zz_105_,_zz_103_};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_210_[0] ? _zz_104_ : _zz_106_);
  assign _zz_108_ = (! _zz_100_);
  assign IBusSimplePlugin_fetchPc_output_valid = (IBusSimplePlugin_fetchPc_preOutput_valid && _zz_108_);
  assign IBusSimplePlugin_fetchPc_preOutput_ready = (IBusSimplePlugin_fetchPc_output_ready && _zz_108_);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_preOutput_payload;
  assign IBusSimplePlugin_fetchPc_propagatePc = 1'b0;
  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_213_);
    IBusSimplePlugin_fetchPc_samplePcNext = 1'b0;
    if(IBusSimplePlugin_fetchPc_propagatePc)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    if(IBusSimplePlugin_fetchPc_predictionPcLoad_valid)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_fetchPc_predictionPcLoad_payload;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    if(_zz_203_)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
    IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
  end

  assign IBusSimplePlugin_fetchPc_preOutput_valid = _zz_109_;
  assign IBusSimplePlugin_fetchPc_preOutput_payload = IBusSimplePlugin_fetchPc_pc;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_inputSample = 1'b1;
  assign IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
  assign _zz_110_ = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_110_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_110_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
    if(((IBusSimplePlugin_cmd_valid && (! IBusSimplePlugin_cmd_ready)) || (IBusSimplePlugin_cmdFork_pendingFull && (! IBusSimplePlugin_cmdFork_cmdFired))))begin
      IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_111_ = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_111_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_111_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_2_halt = 1'b0;
  assign _zz_112_ = (! IBusSimplePlugin_iBusRsp_stages_2_halt);
  assign IBusSimplePlugin_iBusRsp_stages_2_input_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_ready && _zz_112_);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_valid = (IBusSimplePlugin_iBusRsp_stages_2_input_valid && _zz_112_);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_payload = IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = ((1'b0 && (! _zz_113_)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_113_ = _zz_114_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_113_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = _zz_115_;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_116_)) || IBusSimplePlugin_iBusRsp_stages_2_input_ready);
  assign _zz_116_ = _zz_117_;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_valid = _zz_116_;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_payload = _zz_118_;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_iBusRsp_inputBeforeStage_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_119_;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_120_;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_121_;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_122_;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_123_;
  assign _zz_99_ = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_raw);
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = (IBusSimplePlugin_injector_decodeInput_valid && (! IBusSimplePlugin_injector_decodeRemoved));
  assign _zz_98_ = IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign _zz_97_ = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign _zz_96_ = (decode_PC + (32'b00000000000000000000000000000100));
  assign _zz_124_ = (IBusSimplePlugin_iBusRsp_stages_0_input_payload >>> 2);
  assign _zz_125_ = (IBusSimplePlugin_iBusRsp_stages_0_output_ready || (IBusSimplePlugin_jump_pcLoad_valid || _zz_101_));
  assign _zz_126_ = _zz_190_;
  assign IBusSimplePlugin_predictor_line_source = _zz_126_[21 : 0];
  assign IBusSimplePlugin_predictor_line_branchWish = _zz_126_[23 : 22];
  assign IBusSimplePlugin_predictor_line_target = _zz_126_[55 : 24];
  assign IBusSimplePlugin_predictor_hit = ((IBusSimplePlugin_predictor_line_source == _zz_215_) && 1'b1);
  assign IBusSimplePlugin_predictor_hazard = (IBusSimplePlugin_predictor_historyWriteLast_valid && (IBusSimplePlugin_predictor_historyWriteLast_payload_address == _zz_217_));
  assign IBusSimplePlugin_fetchPc_predictionPcLoad_valid = (((IBusSimplePlugin_predictor_line_branchWish[1] && IBusSimplePlugin_predictor_hit) && (! IBusSimplePlugin_predictor_hazard)) && (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_iBusRsp_stages_1_output_ready));
  assign IBusSimplePlugin_fetchPc_predictionPcLoad_payload = IBusSimplePlugin_predictor_line_target;
  assign IBusSimplePlugin_predictor_fetchContext_hazard = IBusSimplePlugin_predictor_hazard;
  assign IBusSimplePlugin_predictor_fetchContext_hit = IBusSimplePlugin_predictor_hit;
  assign IBusSimplePlugin_predictor_fetchContext_line_source = IBusSimplePlugin_predictor_line_source;
  assign IBusSimplePlugin_predictor_fetchContext_line_branchWish = IBusSimplePlugin_predictor_line_branchWish;
  assign IBusSimplePlugin_predictor_fetchContext_line_target = IBusSimplePlugin_predictor_line_target;
  assign IBusSimplePlugin_predictor_injectorContext_hazard = IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_hazard;
  assign IBusSimplePlugin_predictor_injectorContext_hit = IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_hit;
  assign IBusSimplePlugin_predictor_injectorContext_line_source = IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_line_source;
  assign IBusSimplePlugin_predictor_injectorContext_line_branchWish = IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_line_branchWish;
  assign IBusSimplePlugin_predictor_injectorContext_line_target = IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_line_target;
  assign _zz_89_ = IBusSimplePlugin_predictor_injectorContext_hazard;
  assign _zz_90_ = IBusSimplePlugin_predictor_injectorContext_hit;
  assign _zz_91_ = IBusSimplePlugin_predictor_injectorContext_line_source;
  assign _zz_92_ = IBusSimplePlugin_predictor_injectorContext_line_branchWish;
  assign _zz_93_ = IBusSimplePlugin_predictor_injectorContext_line_target;
  always @ (*) begin
    IBusSimplePlugin_predictor_historyWrite_valid = 1'b0;
    if((! memory_BranchPlugin_predictionMissmatch))begin
      IBusSimplePlugin_predictor_historyWrite_valid = memory_PREDICTION_CONTEXT_hit;
      IBusSimplePlugin_predictor_historyWrite_payload_data_branchWish = (_zz_218_ - _zz_222_);
    end else begin
      if(memory_PREDICTION_CONTEXT_hit)begin
        IBusSimplePlugin_predictor_historyWrite_valid = 1'b1;
        IBusSimplePlugin_predictor_historyWrite_payload_data_branchWish = (_zz_223_ + _zz_227_);
      end else begin
        IBusSimplePlugin_predictor_historyWrite_valid = 1'b1;
        IBusSimplePlugin_predictor_historyWrite_payload_data_branchWish = (2'b10);
      end
    end
    if((memory_PREDICTION_CONTEXT_hazard || (! memory_arbitration_isFiring)))begin
      IBusSimplePlugin_predictor_historyWrite_valid = 1'b0;
    end
  end

  assign IBusSimplePlugin_predictor_historyWrite_payload_address = _zz_102_[9 : 2];
  assign IBusSimplePlugin_predictor_historyWrite_payload_data_source = (_zz_102_ >>> 10);
  assign IBusSimplePlugin_predictor_historyWrite_payload_data_target = memory_BRANCH_CALC;
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pendingCmdNext = (_zz_228_ - _zz_232_);
  assign IBusSimplePlugin_cmdFork_pendingFull = (IBusSimplePlugin_pendingCmd == (3'b111));
  assign IBusSimplePlugin_cmd_valid = (((IBusSimplePlugin_iBusRsp_stages_1_input_valid || IBusSimplePlugin_cmdFork_cmdKeep) && (! IBusSimplePlugin_cmdFork_pendingFull)) && (! IBusSimplePlugin_cmdFork_cmdFired));
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_1_input_payload[31 : 2],(2'b00)};
  assign _zz_188_ = (iBus_rsp_valid && (! (IBusSimplePlugin_rspJoin_discardCounter != (3'b000))));
  assign _zz_189_ = (IBusSimplePlugin_jump_pcLoad_valid || _zz_101_);
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_valid = _zz_195_;
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error = _zz_196_;
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst = _zz_197_;
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBufferOutput_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst;
  assign IBusSimplePlugin_rspJoin_issueDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_2_output_valid && IBusSimplePlugin_rspJoin_rspBufferOutput_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_2_output_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_127_ = (! IBusSimplePlugin_rspJoin_issueDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_inputBeforeStage_ready && _zz_127_);
  assign IBusSimplePlugin_iBusRsp_inputBeforeStage_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_127_);
  assign IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_raw = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign memory_DBusSimplePlugin_cmdSent = 1'b0;
  assign _zz_88_ = (((dBus_cmd_payload_size == (2'b10)) && (dBus_cmd_payload_address[1 : 0] != (2'b00))) || ((dBus_cmd_payload_size == (2'b01)) && (dBus_cmd_payload_address[0 : 0] != (1'b0))));
  assign dBus_cmd_valid = (((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_arbitration_isStuckByOthers)) && (! memory_arbitration_isFlushed)) && (! memory_ALIGNEMENT_FAULT)) && (! memory_DBusSimplePlugin_cmdSent));
  assign dBus_cmd_payload_wr = memory_INSTRUCTION[5];
  assign dBus_cmd_payload_address = memory_SRC_ADD;
  assign dBus_cmd_payload_size = memory_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_128_ = {{{memory_RS2[7 : 0],memory_RS2[7 : 0]},memory_RS2[7 : 0]},memory_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_128_ = {memory_RS2[15 : 0],memory_RS2[15 : 0]};
      end
      default : begin
        _zz_128_ = memory_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_128_;
  assign _zz_87_ = dBus_cmd_payload_address[1 : 0];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_129_ = (4'b0001);
      end
      2'b01 : begin
        _zz_129_ = (4'b0011);
      end
      default : begin
        _zz_129_ = (4'b1111);
      end
    endcase
  end

  assign memory_DBusSimplePlugin_formalMask = (_zz_129_ <<< dBus_cmd_payload_address[1 : 0]);
  assign _zz_86_ = dBus_rsp_data;
  assign writeBack_exception_agregat_payload_code = {1'd0, _zz_240_};
  always @ (*) begin
    writeBack_exception_agregat_valid = writeBack_ALIGNEMENT_FAULT;
    if((! ((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && 1'b1)))begin
      writeBack_exception_agregat_valid = 1'b0;
    end
  end

  assign writeBack_exception_agregat_payload_badAddr = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_130_ = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_131_[31] = _zz_130_;
    _zz_131_[30] = _zz_130_;
    _zz_131_[29] = _zz_130_;
    _zz_131_[28] = _zz_130_;
    _zz_131_[27] = _zz_130_;
    _zz_131_[26] = _zz_130_;
    _zz_131_[25] = _zz_130_;
    _zz_131_[24] = _zz_130_;
    _zz_131_[23] = _zz_130_;
    _zz_131_[22] = _zz_130_;
    _zz_131_[21] = _zz_130_;
    _zz_131_[20] = _zz_130_;
    _zz_131_[19] = _zz_130_;
    _zz_131_[18] = _zz_130_;
    _zz_131_[17] = _zz_130_;
    _zz_131_[16] = _zz_130_;
    _zz_131_[15] = _zz_130_;
    _zz_131_[14] = _zz_130_;
    _zz_131_[13] = _zz_130_;
    _zz_131_[12] = _zz_130_;
    _zz_131_[11] = _zz_130_;
    _zz_131_[10] = _zz_130_;
    _zz_131_[9] = _zz_130_;
    _zz_131_[8] = _zz_130_;
    _zz_131_[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_132_ = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_133_[31] = _zz_132_;
    _zz_133_[30] = _zz_132_;
    _zz_133_[29] = _zz_132_;
    _zz_133_[28] = _zz_132_;
    _zz_133_[27] = _zz_132_;
    _zz_133_[26] = _zz_132_;
    _zz_133_[25] = _zz_132_;
    _zz_133_[24] = _zz_132_;
    _zz_133_[23] = _zz_132_;
    _zz_133_[22] = _zz_132_;
    _zz_133_[21] = _zz_132_;
    _zz_133_[20] = _zz_132_;
    _zz_133_[19] = _zz_132_;
    _zz_133_[18] = _zz_132_;
    _zz_133_[17] = _zz_132_;
    _zz_133_[16] = _zz_132_;
    _zz_133_[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_205_)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_131_;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_133_;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = (26'b00000000000000000000000000);
  assign CsrPlugin_medeleg = (32'b00000000000000000000000000000000);
  assign CsrPlugin_mideleg = (32'b00000000000000000000000000000000);
  assign _zz_134_ = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_135_ = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_136_ = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode = 1'b0;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = CsrPlugin_privilege;
  assign CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(memory_exception_agregat_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_interrupt = 1'b0;
    CsrPlugin_interruptCode = (4'bxxxx);
    CsrPlugin_interruptTargetPrivilege = (2'bxx);
    if(CsrPlugin_mstatus_MIE)begin
      if(((_zz_134_ || _zz_135_) || _zz_136_))begin
        CsrPlugin_interrupt = 1'b1;
      end
      if(_zz_134_)begin
        CsrPlugin_interruptCode = (4'b0111);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if(_zz_135_)begin
        CsrPlugin_interruptCode = (4'b0011);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if(_zz_136_)begin
        CsrPlugin_interruptCode = (4'b1011);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
    end
    if((! 1'b1))begin
      CsrPlugin_interrupt = 1'b0;
    end
  end

  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && 1'b1);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = ((! ((execute_arbitration_isValid || memory_arbitration_isValid) || writeBack_arbitration_isValid)) && IBusSimplePlugin_injector_nextPcCalc_3);
    if(((CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute || CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory) || CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack))begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = (CsrPlugin_interrupt && CsrPlugin_pipelineLiberator_done);
  always @ (*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interruptTargetPrivilege;
    if(CsrPlugin_hadException)begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @ (*) begin
    CsrPlugin_trapCause = CsrPlugin_interruptCode;
    if(CsrPlugin_hadException)begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  assign contextSwitching = _zz_103_;
  assign _zz_83_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_82_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b001100000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[12 : 11] = CsrPlugin_mstatus_MPP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mstatus_MPIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mstatus_MIE;
      end
      12'b001101000001 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mepc;
      end
      12'b001100000101 : begin
        if(execute_CSR_WRITE_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b001101000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mip_MEIP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mip_MTIP;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mip_MSIP;
      end
      12'b001101000011 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mtval;
      end
      12'b001101000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mscratch;
      end
      12'b001100000001 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[31 : 30] = CsrPlugin_misa_base;
        execute_CsrPlugin_readData[25 : 0] = CsrPlugin_misa_extensions;
      end
      12'b001100000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mie_MEIE;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mie_MTIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mie_MSIE;
      end
      12'b001101000010 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[31 : 31] = CsrPlugin_mcause_interrupt;
        execute_CsrPlugin_readData[3 : 0] = CsrPlugin_mcause_exceptionCode;
      end
      default : begin
      end
    endcase
    if((CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]))begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((execute_INSTRUCTION[29 : 28] != CsrPlugin_privilege))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_exception_agregat_valid = 1'b0;
    execute_exception_agregat_payload_code = (4'bxxxx);
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL)))begin
      execute_exception_agregat_valid = 1'b1;
      execute_exception_agregat_payload_code = (4'b1011);
    end
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_EBREAK)))begin
      execute_exception_agregat_valid = 1'b1;
      execute_exception_agregat_payload_code = (4'b0011);
    end
  end

  assign execute_exception_agregat_payload_badAddr = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  always @ (*) begin
    case(_zz_207_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readData & (~ execute_SRC1)) : (execute_CsrPlugin_readData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_138_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_139_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000010100)) == (32'b00000000000000000000000000000100));
  assign _zz_140_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000000000)) == (32'b00000000000000000000000000000000));
  assign _zz_141_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_137_ = {({(_zz_306_ == _zz_307_),{_zz_138_,{_zz_308_,_zz_309_}}} != (5'b00000)),{({_zz_310_,_zz_311_} != (2'b00)),{({_zz_312_,_zz_313_} != (3'b000)),{(_zz_314_ != _zz_315_),{_zz_316_,{_zz_317_,_zz_318_}}}}}};
  assign _zz_142_ = _zz_137_[1 : 0];
  assign _zz_78_ = _zz_142_;
  assign _zz_143_ = _zz_137_[3 : 2];
  assign _zz_77_ = _zz_143_;
  assign _zz_144_ = _zz_137_[5 : 4];
  assign _zz_76_ = _zz_144_;
  assign _zz_145_ = _zz_137_[7 : 6];
  assign _zz_75_ = _zz_145_;
  assign _zz_146_ = _zz_137_[9 : 8];
  assign _zz_74_ = _zz_146_;
  assign _zz_73_ = _zz_241_[0];
  assign _zz_72_ = _zz_242_[0];
  assign _zz_71_ = _zz_243_[0];
  assign _zz_70_ = _zz_244_[0];
  assign _zz_69_ = _zz_245_[0];
  assign _zz_68_ = _zz_246_[0];
  assign _zz_67_ = _zz_247_[0];
  assign _zz_66_ = _zz_248_[0];
  assign _zz_65_ = _zz_249_[0];
  assign _zz_64_ = _zz_250_[0];
  assign _zz_147_ = _zz_137_[22 : 21];
  assign _zz_63_ = _zz_147_;
  assign _zz_62_ = _zz_251_[0];
  assign _zz_61_ = _zz_252_[0];
  assign _zz_60_ = _zz_253_[0];
  assign _zz_148_ = _zz_137_[27 : 26];
  assign _zz_59_ = _zz_148_;
  assign _zz_58_ = _zz_254_[0];
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_191_;
  assign decode_RegFilePlugin_rs2Data = _zz_192_;
  assign _zz_57_ = decode_RegFilePlugin_rs1Data;
  assign _zz_56_ = decode_RegFilePlugin_rs2Data;
  always @ (*) begin
    writeBack_RegFilePlugin_regFileWrite_valid = (_zz_54_ && writeBack_arbitration_isFiring);
    if(_zz_149_)begin
      writeBack_RegFilePlugin_regFileWrite_valid = 1'b1;
    end
  end

  assign writeBack_RegFilePlugin_regFileWrite_payload_address = _zz_53_[11 : 7];
  assign writeBack_RegFilePlugin_regFileWrite_payload_data = _zz_85_;
  assign execute_MulPlugin_a = execute_SRC1;
  assign execute_MulPlugin_b = execute_SRC2;
  always @ (*) begin
    case(_zz_208_)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign _zz_52_ = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign _zz_51_ = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign _zz_50_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign _zz_49_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign _zz_48_ = ($signed(_zz_255_) + $signed(_zz_263_));
  assign writeBack_MulPlugin_result = ($signed(_zz_264_) + $signed(_zz_265_));
  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willClear = 1'b0;
    if(_zz_204_)begin
      memory_MulDivIterativePlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_div_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_div_counter_value == (6'b100001));
  assign memory_MulDivIterativePlugin_div_counter_willOverflow = (memory_MulDivIterativePlugin_div_counter_willOverflowIfInc && memory_MulDivIterativePlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_MulDivIterativePlugin_div_counter_willOverflow)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (6'b000000);
    end else begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (memory_MulDivIterativePlugin_div_counter_value + _zz_269_);
    end
    if(memory_MulDivIterativePlugin_div_counter_willClear)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (6'b000000);
    end
  end

  assign _zz_150_ = memory_MulDivIterativePlugin_rs1[31 : 0];
  assign _zz_151_ = {memory_MulDivIterativePlugin_accumulator[31 : 0],_zz_150_[31]};
  assign _zz_152_ = (_zz_151_ - _zz_270_);
  assign _zz_153_ = (memory_INSTRUCTION[13] ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_rs1[31 : 0]);
  assign _zz_154_ = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_155_ = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_156_[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_156_[31 : 0] = execute_RS1;
  end

  assign _zz_46_ = ((((((execute_IS_DIV && (execute_INSTRUCTION[13 : 12] == (2'b00))) && (! execute_RS1[31])) && (! execute_RS2[31])) && (execute_RS1 < (32'b00000000000000000000000000010000))) && (execute_RS2 < (32'b00000000000000000000000000010000))) && (execute_RS2 != (32'b00000000000000000000000000000000)));
  assign _zz_45_ = _zz_193_;
  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = execute_SRC1;
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_157_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_157_ = {31'd0, _zz_283_};
      end
      default : begin
        _zz_157_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_42_ = _zz_157_;
  always @ (*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_158_ = _zz_38_;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_158_ = {29'd0, _zz_284_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_158_ = {decode_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_158_ = {27'd0, _zz_285_};
      end
    endcase
  end

  assign _zz_40_ = _zz_158_;
  assign _zz_159_ = _zz_286_[11];
  always @ (*) begin
    _zz_160_[19] = _zz_159_;
    _zz_160_[18] = _zz_159_;
    _zz_160_[17] = _zz_159_;
    _zz_160_[16] = _zz_159_;
    _zz_160_[15] = _zz_159_;
    _zz_160_[14] = _zz_159_;
    _zz_160_[13] = _zz_159_;
    _zz_160_[12] = _zz_159_;
    _zz_160_[11] = _zz_159_;
    _zz_160_[10] = _zz_159_;
    _zz_160_[9] = _zz_159_;
    _zz_160_[8] = _zz_159_;
    _zz_160_[7] = _zz_159_;
    _zz_160_[6] = _zz_159_;
    _zz_160_[5] = _zz_159_;
    _zz_160_[4] = _zz_159_;
    _zz_160_[3] = _zz_159_;
    _zz_160_[2] = _zz_159_;
    _zz_160_[1] = _zz_159_;
    _zz_160_[0] = _zz_159_;
  end

  assign _zz_161_ = _zz_287_[11];
  always @ (*) begin
    _zz_162_[19] = _zz_161_;
    _zz_162_[18] = _zz_161_;
    _zz_162_[17] = _zz_161_;
    _zz_162_[16] = _zz_161_;
    _zz_162_[15] = _zz_161_;
    _zz_162_[14] = _zz_161_;
    _zz_162_[13] = _zz_161_;
    _zz_162_[12] = _zz_161_;
    _zz_162_[11] = _zz_161_;
    _zz_162_[10] = _zz_161_;
    _zz_162_[9] = _zz_161_;
    _zz_162_[8] = _zz_161_;
    _zz_162_[7] = _zz_161_;
    _zz_162_[6] = _zz_161_;
    _zz_162_[5] = _zz_161_;
    _zz_162_[4] = _zz_161_;
    _zz_162_[3] = _zz_161_;
    _zz_162_[2] = _zz_161_;
    _zz_162_[1] = _zz_161_;
    _zz_162_[0] = _zz_161_;
  end

  always @ (*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_163_ = _zz_35_;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_163_ = {_zz_160_,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_163_ = {_zz_162_,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_163_ = _zz_34_;
      end
    endcase
  end

  assign _zz_37_ = _zz_163_;
  assign execute_SrcPlugin_add = _zz_288_;
  assign execute_SrcPlugin_sub = _zz_289_;
  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_sub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_33_ = (execute_SRC_USE_SUB_LESS ? execute_SrcPlugin_sub : execute_SrcPlugin_add);
  assign _zz_32_ = execute_SrcPlugin_add;
  assign _zz_31_ = execute_SrcPlugin_less;
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_164_[0] = execute_SRC1[31];
    _zz_164_[1] = execute_SRC1[30];
    _zz_164_[2] = execute_SRC1[29];
    _zz_164_[3] = execute_SRC1[28];
    _zz_164_[4] = execute_SRC1[27];
    _zz_164_[5] = execute_SRC1[26];
    _zz_164_[6] = execute_SRC1[25];
    _zz_164_[7] = execute_SRC1[24];
    _zz_164_[8] = execute_SRC1[23];
    _zz_164_[9] = execute_SRC1[22];
    _zz_164_[10] = execute_SRC1[21];
    _zz_164_[11] = execute_SRC1[20];
    _zz_164_[12] = execute_SRC1[19];
    _zz_164_[13] = execute_SRC1[18];
    _zz_164_[14] = execute_SRC1[17];
    _zz_164_[15] = execute_SRC1[16];
    _zz_164_[16] = execute_SRC1[15];
    _zz_164_[17] = execute_SRC1[14];
    _zz_164_[18] = execute_SRC1[13];
    _zz_164_[19] = execute_SRC1[12];
    _zz_164_[20] = execute_SRC1[11];
    _zz_164_[21] = execute_SRC1[10];
    _zz_164_[22] = execute_SRC1[9];
    _zz_164_[23] = execute_SRC1[8];
    _zz_164_[24] = execute_SRC1[7];
    _zz_164_[25] = execute_SRC1[6];
    _zz_164_[26] = execute_SRC1[5];
    _zz_164_[27] = execute_SRC1[4];
    _zz_164_[28] = execute_SRC1[3];
    _zz_164_[29] = execute_SRC1[2];
    _zz_164_[30] = execute_SRC1[1];
    _zz_164_[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_164_ : execute_SRC1);
  assign _zz_29_ = _zz_291_;
  always @ (*) begin
    _zz_165_[0] = memory_SHIFT_RIGHT[31];
    _zz_165_[1] = memory_SHIFT_RIGHT[30];
    _zz_165_[2] = memory_SHIFT_RIGHT[29];
    _zz_165_[3] = memory_SHIFT_RIGHT[28];
    _zz_165_[4] = memory_SHIFT_RIGHT[27];
    _zz_165_[5] = memory_SHIFT_RIGHT[26];
    _zz_165_[6] = memory_SHIFT_RIGHT[25];
    _zz_165_[7] = memory_SHIFT_RIGHT[24];
    _zz_165_[8] = memory_SHIFT_RIGHT[23];
    _zz_165_[9] = memory_SHIFT_RIGHT[22];
    _zz_165_[10] = memory_SHIFT_RIGHT[21];
    _zz_165_[11] = memory_SHIFT_RIGHT[20];
    _zz_165_[12] = memory_SHIFT_RIGHT[19];
    _zz_165_[13] = memory_SHIFT_RIGHT[18];
    _zz_165_[14] = memory_SHIFT_RIGHT[17];
    _zz_165_[15] = memory_SHIFT_RIGHT[16];
    _zz_165_[16] = memory_SHIFT_RIGHT[15];
    _zz_165_[17] = memory_SHIFT_RIGHT[14];
    _zz_165_[18] = memory_SHIFT_RIGHT[13];
    _zz_165_[19] = memory_SHIFT_RIGHT[12];
    _zz_165_[20] = memory_SHIFT_RIGHT[11];
    _zz_165_[21] = memory_SHIFT_RIGHT[10];
    _zz_165_[22] = memory_SHIFT_RIGHT[9];
    _zz_165_[23] = memory_SHIFT_RIGHT[8];
    _zz_165_[24] = memory_SHIFT_RIGHT[7];
    _zz_165_[25] = memory_SHIFT_RIGHT[6];
    _zz_165_[26] = memory_SHIFT_RIGHT[5];
    _zz_165_[27] = memory_SHIFT_RIGHT[4];
    _zz_165_[28] = memory_SHIFT_RIGHT[3];
    _zz_165_[29] = memory_SHIFT_RIGHT[2];
    _zz_165_[30] = memory_SHIFT_RIGHT[1];
    _zz_165_[31] = memory_SHIFT_RIGHT[0];
  end

  always @ (*) begin
    _zz_166_ = 1'b0;
    _zz_167_ = 1'b0;
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! 1'b1)))begin
        if(_zz_172_)begin
          _zz_166_ = 1'b1;
        end
        if(_zz_173_)begin
          _zz_167_ = 1'b1;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE)))begin
        if(_zz_174_)begin
          _zz_166_ = 1'b1;
        end
        if(_zz_175_)begin
          _zz_167_ = 1'b1;
        end
      end
    end
    if((execute_arbitration_isValid && execute_REGFILE_WRITE_VALID))begin
      if((1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE)))begin
        if(_zz_176_)begin
          _zz_166_ = 1'b1;
        end
        if(_zz_177_)begin
          _zz_167_ = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_166_ = 1'b0;
    end
    if((! decode_RS2_USE))begin
      _zz_167_ = 1'b0;
    end
  end

  assign _zz_168_ = (_zz_54_ && writeBack_arbitration_isFiring);
  assign _zz_172_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_173_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_174_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_175_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_176_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_177_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_178_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_178_ == (3'b000))) begin
        _zz_179_ = execute_BranchPlugin_eq;
    end else if((_zz_178_ == (3'b001))) begin
        _zz_179_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_178_ & (3'b101)) == (3'b101)))) begin
        _zz_179_ = (! execute_SRC_LESS);
    end else begin
        _zz_179_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_180_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_180_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_180_ = 1'b1;
      end
      default : begin
        _zz_180_ = _zz_179_;
      end
    endcase
  end

  assign _zz_27_ = _zz_180_;
  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_181_ = _zz_293_[19];
  always @ (*) begin
    _zz_182_[10] = _zz_181_;
    _zz_182_[9] = _zz_181_;
    _zz_182_[8] = _zz_181_;
    _zz_182_[7] = _zz_181_;
    _zz_182_[6] = _zz_181_;
    _zz_182_[5] = _zz_181_;
    _zz_182_[4] = _zz_181_;
    _zz_182_[3] = _zz_181_;
    _zz_182_[2] = _zz_181_;
    _zz_182_[1] = _zz_181_;
    _zz_182_[0] = _zz_181_;
  end

  assign _zz_183_ = _zz_294_[11];
  always @ (*) begin
    _zz_184_[19] = _zz_183_;
    _zz_184_[18] = _zz_183_;
    _zz_184_[17] = _zz_183_;
    _zz_184_[16] = _zz_183_;
    _zz_184_[15] = _zz_183_;
    _zz_184_[14] = _zz_183_;
    _zz_184_[13] = _zz_183_;
    _zz_184_[12] = _zz_183_;
    _zz_184_[11] = _zz_183_;
    _zz_184_[10] = _zz_183_;
    _zz_184_[9] = _zz_183_;
    _zz_184_[8] = _zz_183_;
    _zz_184_[7] = _zz_183_;
    _zz_184_[6] = _zz_183_;
    _zz_184_[5] = _zz_183_;
    _zz_184_[4] = _zz_183_;
    _zz_184_[3] = _zz_183_;
    _zz_184_[2] = _zz_183_;
    _zz_184_[1] = _zz_183_;
    _zz_184_[0] = _zz_183_;
  end

  assign _zz_185_ = _zz_295_[11];
  always @ (*) begin
    _zz_186_[18] = _zz_185_;
    _zz_186_[17] = _zz_185_;
    _zz_186_[16] = _zz_185_;
    _zz_186_[15] = _zz_185_;
    _zz_186_[14] = _zz_185_;
    _zz_186_[13] = _zz_185_;
    _zz_186_[12] = _zz_185_;
    _zz_186_[11] = _zz_185_;
    _zz_186_[10] = _zz_185_;
    _zz_186_[9] = _zz_185_;
    _zz_186_[8] = _zz_185_;
    _zz_186_[7] = _zz_185_;
    _zz_186_[6] = _zz_185_;
    _zz_186_[5] = _zz_185_;
    _zz_186_[4] = _zz_185_;
    _zz_186_[3] = _zz_185_;
    _zz_186_[2] = _zz_185_;
    _zz_186_[1] = _zz_185_;
    _zz_186_[0] = _zz_185_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_187_ = {{_zz_182_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_187_ = {_zz_184_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_187_ = {{_zz_186_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_187_;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_25_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign _zz_24_ = (execute_PC + (32'b00000000000000000000000000000100));
  assign _zz_23_ = (decode_PC != execute_BRANCH_CALC);
  assign memory_BranchPlugin_predictionMissmatch = ((((memory_PREDICTION_CONTEXT_hit && (! memory_PREDICTION_CONTEXT_hazard)) && memory_PREDICTION_CONTEXT_line_branchWish[1]) != memory_BRANCH_DO) || (memory_BRANCH_DO && memory_TARGET_MISSMATCH2));
  assign _zz_102_ = memory_PC;
  assign _zz_105_ = ((memory_arbitration_isValid && (! memory_arbitration_isStuckByOthers)) && memory_BranchPlugin_predictionMissmatch);
  assign _zz_106_ = (memory_BRANCH_DO ? memory_BRANCH_CALC : memory_NEXT_PC2);
  assign memory_exception_agregat_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && memory_BRANCH_CALC[1]);
  assign memory_exception_agregat_payload_code = (4'b0000);
  assign memory_exception_agregat_payload_badAddr = memory_BRANCH_CALC;
  assign _zz_21_ = decode_BRANCH_CTRL;
  assign _zz_19_ = _zz_74_;
  assign _zz_26_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_18_ = decode_ENV_CTRL;
  assign _zz_15_ = execute_ENV_CTRL;
  assign _zz_13_ = memory_ENV_CTRL;
  assign _zz_16_ = _zz_78_;
  assign _zz_81_ = decode_to_execute_ENV_CTRL;
  assign _zz_80_ = execute_to_memory_ENV_CTRL;
  assign _zz_84_ = memory_to_writeBack_ENV_CTRL;
  assign _zz_39_ = _zz_63_;
  assign _zz_11_ = decode_ALU_BITWISE_CTRL;
  assign _zz_9_ = _zz_77_;
  assign _zz_43_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_36_ = _zz_75_;
  assign _zz_8_ = decode_ALU_CTRL;
  assign _zz_6_ = _zz_76_;
  assign _zz_41_ = decode_to_execute_ALU_CTRL;
  assign _zz_5_ = decode_SHIFT_CTRL;
  assign _zz_2_ = execute_SHIFT_CTRL;
  assign _zz_3_ = _zz_59_;
  assign _zz_30_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_28_ = execute_to_memory_SHIFT_CTRL;
  assign decode_arbitration_isFlushed = (((decode_arbitration_flushAll || execute_arbitration_flushAll) || memory_arbitration_flushAll) || writeBack_arbitration_flushAll);
  assign execute_arbitration_isFlushed = ((execute_arbitration_flushAll || memory_arbitration_flushAll) || writeBack_arbitration_flushAll);
  assign memory_arbitration_isFlushed = (memory_arbitration_flushAll || writeBack_arbitration_flushAll);
  assign writeBack_arbitration_isFlushed = writeBack_arbitration_flushAll;
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (posedge io_clk) begin
    if(GLOBAL_BUFFER_OUTPUT) begin
      CsrPlugin_privilege <= (2'b11);
      IBusSimplePlugin_fetchPc_pcReg <= (32'b00000000000010100000000000000000);
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      _zz_109_ <= 1'b0;
      _zz_114_ <= 1'b0;
      _zz_117_ <= 1'b0;
      _zz_119_ <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_3 <= 1'b0;
      IBusSimplePlugin_injector_decodeRemoved <= 1'b0;
      IBusSimplePlugin_pendingCmd <= (3'b000);
      IBusSimplePlugin_cmdFork_cmdKeep <= 1'b0;
      IBusSimplePlugin_cmdFork_cmdFired <= 1'b0;
      IBusSimplePlugin_rspJoin_discardCounter <= (3'b000);
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= (2'b11);
      CsrPlugin_mip_MEIP <= 1'b0;
      CsrPlugin_mip_MTIP <= 1'b0;
      CsrPlugin_mip_MSIP <= 1'b0;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      _zz_149_ <= 1'b1;
      memory_MulDivIterativePlugin_div_counter_value <= (6'b000000);
      _zz_169_ <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      memory_to_writeBack_REGFILE_WRITE_DATA <= (32'b00000000000000000000000000000000);
      memory_to_writeBack_INSTRUCTION <= (32'b00000000000000000000000000000000);
    end else begin
      if(IBusSimplePlugin_fetchPc_propagatePc)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_predictionPcLoad_valid)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_jump_pcLoad_valid)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(_zz_203_)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_samplePcNext)begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      _zz_109_ <= 1'b1;
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        _zz_114_ <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_stages_0_output_ready)begin
        _zz_114_ <= IBusSimplePlugin_iBusRsp_stages_0_output_valid;
      end
      if(IBusSimplePlugin_iBusRsp_stages_1_output_ready)begin
        _zz_117_ <= IBusSimplePlugin_iBusRsp_stages_1_output_valid;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        _zz_117_ <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_inputBeforeStage_ready)begin
        _zz_119_ <= IBusSimplePlugin_iBusRsp_inputBeforeStage_valid;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        _zz_119_ <= 1'b0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_iBusRsp_stages_1_input_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_iBusRsp_stages_2_input_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        IBusSimplePlugin_injector_nextPcCalc_0 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_injector_decodeInput_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_0 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        IBusSimplePlugin_injector_nextPcCalc_0 <= 1'b0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        IBusSimplePlugin_injector_nextPcCalc_1 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_1 <= IBusSimplePlugin_injector_nextPcCalc_0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        IBusSimplePlugin_injector_nextPcCalc_1 <= 1'b0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        IBusSimplePlugin_injector_nextPcCalc_2 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_2 <= IBusSimplePlugin_injector_nextPcCalc_1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        IBusSimplePlugin_injector_nextPcCalc_2 <= 1'b0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        IBusSimplePlugin_injector_nextPcCalc_3 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_3 <= IBusSimplePlugin_injector_nextPcCalc_2;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        IBusSimplePlugin_injector_nextPcCalc_3 <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b0;
      end
      IBusSimplePlugin_pendingCmd <= IBusSimplePlugin_pendingCmdNext;
      if(IBusSimplePlugin_cmd_valid)begin
        IBusSimplePlugin_cmdFork_cmdKeep <= 1'b1;
      end
      if(IBusSimplePlugin_cmd_ready)begin
        IBusSimplePlugin_cmdFork_cmdKeep <= 1'b0;
      end
      if((IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready))begin
        IBusSimplePlugin_cmdFork_cmdFired <= 1'b1;
      end
      if(IBusSimplePlugin_iBusRsp_stages_1_input_ready)begin
        IBusSimplePlugin_cmdFork_cmdFired <= 1'b0;
      end
      IBusSimplePlugin_rspJoin_discardCounter <= (IBusSimplePlugin_rspJoin_discardCounter - _zz_234_);
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_101_))begin
        IBusSimplePlugin_rspJoin_discardCounter <= (_zz_235_ - _zz_239_);
      end
      CsrPlugin_mip_MEIP <= externalInterrupt;
      CsrPlugin_mip_MTIP <= timerInterrupt;
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if((! memory_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if((! writeBack_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_201_)begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(_zz_202_)begin
        case(_zz_206_)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MPIE <= 1'b1;
            CsrPlugin_privilege <= CsrPlugin_mstatus_MPP;
          end
          default : begin
          end
        endcase
      end
      _zz_149_ <= 1'b0;
      memory_MulDivIterativePlugin_div_counter_value <= memory_MulDivIterativePlugin_div_counter_valueNext;
      _zz_169_ <= _zz_168_;
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_47_;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
      end
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(execute_CsrPlugin_csrAddress)
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_296_[0];
            CsrPlugin_mstatus_MIE <= _zz_297_[0];
          end
        end
        12'b001101000001 : begin
        end
        12'b001100000101 : begin
        end
        12'b001101000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mip_MSIP <= _zz_298_[0];
          end
        end
        12'b001101000011 : begin
        end
        12'b001101000000 : begin
        end
        12'b001100000001 : begin
        end
        12'b001100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mie_MEIE <= _zz_299_[0];
            CsrPlugin_mie_MTIE <= _zz_300_[0];
            CsrPlugin_mie_MSIE <= _zz_301_[0];
          end
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge io_clk) begin
    if(IBusSimplePlugin_iBusRsp_stages_0_output_ready)begin
      _zz_115_ <= IBusSimplePlugin_iBusRsp_stages_0_output_payload;
    end
    if(IBusSimplePlugin_iBusRsp_stages_1_output_ready)begin
      _zz_118_ <= IBusSimplePlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusSimplePlugin_iBusRsp_inputBeforeStage_ready)begin
      _zz_120_ <= IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_pc;
      _zz_121_ <= IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_error;
      _zz_122_ <= IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_raw;
      _zz_123_ <= IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_iBusRsp_inputBeforeStage_payload_rsp_raw;
    end
    if(IBusSimplePlugin_iBusRsp_stages_0_output_ready)begin
      IBusSimplePlugin_predictor_historyWriteLast_valid <= IBusSimplePlugin_predictor_historyWrite_valid;
      IBusSimplePlugin_predictor_historyWriteLast_payload_address <= IBusSimplePlugin_predictor_historyWrite_payload_address;
      IBusSimplePlugin_predictor_historyWriteLast_payload_data_source <= IBusSimplePlugin_predictor_historyWrite_payload_data_source;
      IBusSimplePlugin_predictor_historyWriteLast_payload_data_branchWish <= IBusSimplePlugin_predictor_historyWrite_payload_data_branchWish;
      IBusSimplePlugin_predictor_historyWriteLast_payload_data_target <= IBusSimplePlugin_predictor_historyWrite_payload_data_target;
    end
    if(IBusSimplePlugin_iBusRsp_stages_1_output_ready)begin
      IBusSimplePlugin_predictor_fetchContext_regNextWhen_hazard <= IBusSimplePlugin_predictor_fetchContext_hazard;
      IBusSimplePlugin_predictor_fetchContext_regNextWhen_hit <= IBusSimplePlugin_predictor_fetchContext_hit;
      IBusSimplePlugin_predictor_fetchContext_regNextWhen_line_source <= IBusSimplePlugin_predictor_fetchContext_line_source;
      IBusSimplePlugin_predictor_fetchContext_regNextWhen_line_branchWish <= IBusSimplePlugin_predictor_fetchContext_line_branchWish;
      IBusSimplePlugin_predictor_fetchContext_regNextWhen_line_target <= IBusSimplePlugin_predictor_fetchContext_line_target;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_hazard <= IBusSimplePlugin_predictor_fetchContext_regNextWhen_hazard;
      IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_hit <= IBusSimplePlugin_predictor_fetchContext_regNextWhen_hit;
      IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_line_source <= IBusSimplePlugin_predictor_fetchContext_regNextWhen_line_source;
      IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_line_branchWish <= IBusSimplePlugin_predictor_fetchContext_regNextWhen_line_branchWish;
      IBusSimplePlugin_predictor_fetchContext_regNextWhen_delay_1_line_target <= IBusSimplePlugin_predictor_fetchContext_regNextWhen_line_target;
    end
    if(!(! (((dBus_rsp_ready && writeBack_MEMORY_ENABLE) && writeBack_arbitration_isValid) && writeBack_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow memory stage stall when read happend");
    end
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    end
    if(execute_exception_agregat_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= execute_exception_agregat_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= execute_exception_agregat_payload_badAddr;
    end
    if(memory_exception_agregat_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= memory_exception_agregat_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= memory_exception_agregat_payload_badAddr;
    end
    if(writeBack_exception_agregat_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= writeBack_exception_agregat_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= writeBack_exception_agregat_payload_badAddr;
    end
    if((CsrPlugin_exception || CsrPlugin_interruptJump))begin
      case(CsrPlugin_privilege)
        2'b11 : begin
          CsrPlugin_mepc <= writeBack_PC;
        end
        default : begin
        end
      endcase
    end
    if(_zz_201_)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
        end
        default : begin
        end
      endcase
    end
    if((memory_MulDivIterativePlugin_div_counter_value == (6'b100000)))begin
      memory_MulDivIterativePlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_MulDivIterativePlugin_div_done <= 1'b0;
    end
    if(_zz_199_)begin
      if(_zz_200_)begin
        memory_MulDivIterativePlugin_rs1[31 : 0] <= _zz_271_[31:0];
        memory_MulDivIterativePlugin_accumulator[31 : 0] <= ((! _zz_152_[32]) ? _zz_272_ : _zz_273_);
        if((memory_MulDivIterativePlugin_div_counter_value == (6'b100000)))begin
          memory_MulDivIterativePlugin_div_result <= _zz_274_[31:0];
        end
      end
    end
    if(_zz_204_)begin
      memory_MulDivIterativePlugin_accumulator <= (65'b00000000000000000000000000000000000000000000000000000000000000000);
      memory_MulDivIterativePlugin_rs1 <= ((_zz_155_ ? (~ _zz_156_) : _zz_156_) + _zz_280_);
      memory_MulDivIterativePlugin_rs2 <= ((_zz_154_ ? (~ execute_RS2) : execute_RS2) + _zz_282_);
      memory_MulDivIterativePlugin_div_needRevert <= ((_zz_155_ ^ (_zz_154_ && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == (32'b00000000000000000000000000000000)) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    if(_zz_168_)begin
      _zz_170_ <= _zz_53_[11 : 7];
      _zz_171_ <= _zz_85_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_20_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= _zz_35_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_RS2 <= execute_RS2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_17_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_14_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_12_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_95_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FAST_DIV_VALID <= execute_FAST_DIV_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ALIGNEMENT_FAULT <= memory_ALIGNEMENT_FAULT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= _zz_34_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= execute_PC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_FENCEI <= decode_IS_FENCEI;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_79_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_CONTEXT_hazard <= decode_PREDICTION_CONTEXT_hazard;
      decode_to_execute_PREDICTION_CONTEXT_hit <= decode_PREDICTION_CONTEXT_hit;
      decode_to_execute_PREDICTION_CONTEXT_line_source <= decode_PREDICTION_CONTEXT_line_source;
      decode_to_execute_PREDICTION_CONTEXT_line_branchWish <= decode_PREDICTION_CONTEXT_line_branchWish;
      decode_to_execute_PREDICTION_CONTEXT_line_target <= decode_PREDICTION_CONTEXT_line_target;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PREDICTION_CONTEXT_hazard <= execute_PREDICTION_CONTEXT_hazard;
      execute_to_memory_PREDICTION_CONTEXT_hit <= execute_PREDICTION_CONTEXT_hit;
      execute_to_memory_PREDICTION_CONTEXT_line_source <= execute_PREDICTION_CONTEXT_line_source;
      execute_to_memory_PREDICTION_CONTEXT_line_branchWish <= execute_PREDICTION_CONTEXT_line_branchWish;
      execute_to_memory_PREDICTION_CONTEXT_line_target <= execute_PREDICTION_CONTEXT_line_target;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= _zz_44_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_10_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_TARGET_MISSMATCH2 <= execute_TARGET_MISSMATCH2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SRC_ADD <= execute_SRC_ADD;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= _zz_38_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FAST_DIV_VALUE <= execute_FAST_DIV_VALUE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= _zz_22_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_7_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_NEXT_PC2 <= execute_NEXT_PC2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_4_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_1_;
    end
    case(execute_CsrPlugin_csrAddress)
      12'b001100000000 : begin
      end
      12'b001101000001 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mepc <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b001100000101 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mtvec_base <= execute_CsrPlugin_writeData[31 : 2];
          CsrPlugin_mtvec_mode <= execute_CsrPlugin_writeData[1 : 0];
        end
      end
      12'b001101000100 : begin
      end
      12'b001101000011 : begin
      end
      12'b001101000000 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mscratch <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b001100000001 : begin
      end
      12'b001100000100 : begin
      end
      12'b001101000010 : begin
      end
      default : begin
      end
    endcase
  end

endmodule

module SimpleBusDecoder (
      input   io_input_cmd_valid,
      output reg  io_input_cmd_ready,
      input   io_input_cmd_payload_wr,
      input  [19:0] io_input_cmd_payload_address,
      input  [31:0] io_input_cmd_payload_data,
      input  [3:0] io_input_cmd_payload_mask,
      output  io_input_rsp_valid,
      output [31:0] io_input_rsp_payload_data,
      output reg  io_outputs_0_cmd_valid,
      input   io_outputs_0_cmd_ready,
      output  io_outputs_0_cmd_payload_wr,
      output [19:0] io_outputs_0_cmd_payload_address,
      output [31:0] io_outputs_0_cmd_payload_data,
      output [3:0] io_outputs_0_cmd_payload_mask,
      input   io_outputs_0_rsp_valid,
      input  [31:0] io_outputs_0_rsp_0_data,
      output reg  io_outputs_1_cmd_valid,
      input   io_outputs_1_cmd_ready,
      output  io_outputs_1_cmd_payload_wr,
      output [19:0] io_outputs_1_cmd_payload_address,
      output [31:0] io_outputs_1_cmd_payload_data,
      output [3:0] io_outputs_1_cmd_payload_mask,
      input   io_outputs_1_rsp_valid,
      input  [31:0] io_outputs_1_rsp_1_data,
      input   io_clk,
      input   GLOBAL_BUFFER_OUTPUT);
  reg [31:0] _zz_3_;
  wire [19:0] _zz_4_;
  wire [1:0] _zz_5_;
  wire [0:0] _zz_6_;
  wire [1:0] _zz_7_;
  wire [0:0] _zz_8_;
  wire [1:0] _zz_9_;
  wire [0:0] _zz_10_;
  wire  logic_hits_0;
  wire  logic_hits_1;
  wire  _zz_1_;
  wire  _zz_2_;
  wire  logic_noHit;
  reg [1:0] logic_rspPendingCounter;
  reg  logic_rspHits_0;
  reg  logic_rspHits_1;
  wire  logic_rspPending;
  wire  logic_rspNoHit;
  wire  logic_cmdWait;
  assign _zz_4_ = (20'b11110000000000000000);
  assign _zz_5_ = (logic_rspPendingCounter + _zz_7_);
  assign _zz_6_ = ((io_input_cmd_valid && io_input_cmd_ready) && (! io_input_cmd_payload_wr));
  assign _zz_7_ = {1'd0, _zz_6_};
  assign _zz_8_ = io_input_rsp_valid;
  assign _zz_9_ = {1'd0, _zz_8_};
  assign _zz_10_ = logic_rspHits_1;
  always @(*) begin
    case(_zz_10_)
      1'b0 : begin
        _zz_3_ = io_outputs_0_rsp_0_data;
      end
      default : begin
        _zz_3_ = io_outputs_1_rsp_1_data;
      end
    endcase
  end

  assign logic_hits_0 = ((io_input_cmd_payload_address & _zz_4_) == (20'b00000000000000000000));
  always @ (*) begin
    io_outputs_0_cmd_valid = (io_input_cmd_valid && logic_hits_0);
    io_outputs_1_cmd_valid = (io_input_cmd_valid && logic_hits_1);
    io_input_cmd_ready = (((logic_hits_0 && io_outputs_0_cmd_ready) || (logic_hits_1 && io_outputs_1_cmd_ready)) || logic_noHit);
    if(logic_cmdWait)begin
      io_input_cmd_ready = 1'b0;
      io_outputs_0_cmd_valid = 1'b0;
      io_outputs_1_cmd_valid = 1'b0;
    end
  end

  assign _zz_1_ = io_input_cmd_payload_wr;
  assign io_outputs_0_cmd_payload_wr = _zz_1_;
  assign io_outputs_0_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_0_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_0_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_1 = (! logic_hits_0);
  assign _zz_2_ = io_input_cmd_payload_wr;
  assign io_outputs_1_cmd_payload_wr = _zz_2_;
  assign io_outputs_1_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_1_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_1_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_noHit = 1'b0;
  assign logic_rspPending = (logic_rspPendingCounter != (2'b00));
  assign logic_rspNoHit = 1'b0;
  assign io_input_rsp_valid = ((io_outputs_0_rsp_valid || io_outputs_1_rsp_valid) || (logic_rspPending && logic_rspNoHit));
  assign io_input_rsp_payload_data = _zz_3_;
  assign logic_cmdWait = (((io_input_cmd_valid && logic_rspPending) && ((logic_hits_0 != logic_rspHits_0) || (logic_hits_1 != logic_rspHits_1))) || (logic_rspPendingCounter == (2'b11)));
  always @ (posedge io_clk) begin
    if(GLOBAL_BUFFER_OUTPUT) begin
      logic_rspPendingCounter <= (2'b00);
    end else begin
      logic_rspPendingCounter <= (_zz_5_ - _zz_9_);
    end
  end

  always @ (posedge io_clk) begin
    if((io_input_cmd_valid && io_input_cmd_ready))begin
      logic_rspHits_0 <= logic_hits_0;
      logic_rspHits_1 <= logic_hits_1;
    end
  end

endmodule

module SimpleBusDecoder_1_ (
      input   io_input_cmd_valid,
      output reg  io_input_cmd_ready,
      input   io_input_cmd_payload_wr,
      input  [19:0] io_input_cmd_payload_address,
      input  [31:0] io_input_cmd_payload_data,
      input  [3:0] io_input_cmd_payload_mask,
      output  io_input_rsp_valid,
      output [31:0] io_input_rsp_payload_data,
      output reg  io_outputs_0_cmd_valid,
      input   io_outputs_0_cmd_ready,
      output  io_outputs_0_cmd_payload_wr,
      output [19:0] io_outputs_0_cmd_payload_address,
      output [31:0] io_outputs_0_cmd_payload_data,
      output [3:0] io_outputs_0_cmd_payload_mask,
      input   io_outputs_0_rsp_valid,
      input  [31:0] io_outputs_0_rsp_0_data,
      output reg  io_outputs_1_cmd_valid,
      input   io_outputs_1_cmd_ready,
      output  io_outputs_1_cmd_payload_wr,
      output [19:0] io_outputs_1_cmd_payload_address,
      output [31:0] io_outputs_1_cmd_payload_data,
      output [3:0] io_outputs_1_cmd_payload_mask,
      input   io_outputs_1_rsp_valid,
      input  [31:0] io_outputs_1_rsp_1_data,
      input   io_clk,
      input   GLOBAL_BUFFER_OUTPUT);
  reg [31:0] _zz_3_;
  wire [19:0] _zz_4_;
  wire [1:0] _zz_5_;
  wire [0:0] _zz_6_;
  wire [1:0] _zz_7_;
  wire [0:0] _zz_8_;
  wire [1:0] _zz_9_;
  wire [0:0] _zz_10_;
  wire  logic_hits_0;
  wire  logic_hits_1;
  wire  _zz_1_;
  wire  _zz_2_;
  wire  logic_noHit;
  reg [1:0] logic_rspPendingCounter;
  reg  logic_rspHits_0;
  reg  logic_rspHits_1;
  wire  logic_rspPending;
  wire  logic_rspNoHit;
  wire  logic_cmdWait;
  assign _zz_4_ = (20'b11110000000000000000);
  assign _zz_5_ = (logic_rspPendingCounter + _zz_7_);
  assign _zz_6_ = ((io_input_cmd_valid && io_input_cmd_ready) && (! io_input_cmd_payload_wr));
  assign _zz_7_ = {1'd0, _zz_6_};
  assign _zz_8_ = io_input_rsp_valid;
  assign _zz_9_ = {1'd0, _zz_8_};
  assign _zz_10_ = logic_rspHits_1;
  always @(*) begin
    case(_zz_10_)
      1'b0 : begin
        _zz_3_ = io_outputs_0_rsp_0_data;
      end
      default : begin
        _zz_3_ = io_outputs_1_rsp_1_data;
      end
    endcase
  end

  assign logic_hits_0 = ((io_input_cmd_payload_address & _zz_4_) == (20'b00010000000000000000));
  always @ (*) begin
    io_outputs_0_cmd_valid = (io_input_cmd_valid && logic_hits_0);
    io_outputs_1_cmd_valid = (io_input_cmd_valid && logic_hits_1);
    io_input_cmd_ready = (((logic_hits_0 && io_outputs_0_cmd_ready) || (logic_hits_1 && io_outputs_1_cmd_ready)) || logic_noHit);
    if(logic_cmdWait)begin
      io_input_cmd_ready = 1'b0;
      io_outputs_0_cmd_valid = 1'b0;
      io_outputs_1_cmd_valid = 1'b0;
    end
  end

  assign _zz_1_ = io_input_cmd_payload_wr;
  assign io_outputs_0_cmd_payload_wr = _zz_1_;
  assign io_outputs_0_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_0_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_0_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_1 = (! logic_hits_0);
  assign _zz_2_ = io_input_cmd_payload_wr;
  assign io_outputs_1_cmd_payload_wr = _zz_2_;
  assign io_outputs_1_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_1_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_1_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_noHit = 1'b0;
  assign logic_rspPending = (logic_rspPendingCounter != (2'b00));
  assign logic_rspNoHit = 1'b0;
  assign io_input_rsp_valid = ((io_outputs_0_rsp_valid || io_outputs_1_rsp_valid) || (logic_rspPending && logic_rspNoHit));
  assign io_input_rsp_payload_data = _zz_3_;
  assign logic_cmdWait = (((io_input_cmd_valid && logic_rspPending) && ((logic_hits_0 != logic_rspHits_0) || (logic_hits_1 != logic_rspHits_1))) || (logic_rspPendingCounter == (2'b11)));
  always @ (posedge io_clk) begin
    if(GLOBAL_BUFFER_OUTPUT) begin
      logic_rspPendingCounter <= (2'b00);
    end else begin
      logic_rspPendingCounter <= (_zz_5_ - _zz_9_);
    end
  end

  always @ (posedge io_clk) begin
    if((io_input_cmd_valid && io_input_cmd_ready))begin
      logic_rspHits_0 <= logic_hits_0;
      logic_rspHits_1 <= logic_hits_1;
    end
  end

endmodule

module SimpleBusDecoder_2_ (
      input   io_input_cmd_valid,
      output reg  io_input_cmd_ready,
      input   io_input_cmd_payload_wr,
      input  [19:0] io_input_cmd_payload_address,
      input  [31:0] io_input_cmd_payload_data,
      input  [3:0] io_input_cmd_payload_mask,
      output  io_input_rsp_valid,
      output [31:0] io_input_rsp_payload_data,
      output reg  io_outputs_0_cmd_valid,
      input   io_outputs_0_cmd_ready,
      output  io_outputs_0_cmd_payload_wr,
      output [19:0] io_outputs_0_cmd_payload_address,
      output [31:0] io_outputs_0_cmd_payload_data,
      output [3:0] io_outputs_0_cmd_payload_mask,
      input   io_outputs_0_rsp_valid,
      input  [31:0] io_outputs_0_rsp_0_data,
      output reg  io_outputs_1_cmd_valid,
      input   io_outputs_1_cmd_ready,
      output  io_outputs_1_cmd_payload_wr,
      output [19:0] io_outputs_1_cmd_payload_address,
      output [31:0] io_outputs_1_cmd_payload_data,
      output [3:0] io_outputs_1_cmd_payload_mask,
      input   io_outputs_1_rsp_valid,
      input  [31:0] io_outputs_1_rsp_1_data,
      output reg  io_outputs_2_cmd_valid,
      input   io_outputs_2_cmd_ready,
      output  io_outputs_2_cmd_payload_wr,
      output [19:0] io_outputs_2_cmd_payload_address,
      output [31:0] io_outputs_2_cmd_payload_data,
      output [3:0] io_outputs_2_cmd_payload_mask,
      input   io_outputs_2_rsp_valid,
      input  [31:0] io_outputs_2_rsp_2_data,
      output reg  io_outputs_3_cmd_valid,
      input   io_outputs_3_cmd_ready,
      output  io_outputs_3_cmd_payload_wr,
      output [19:0] io_outputs_3_cmd_payload_address,
      output [31:0] io_outputs_3_cmd_payload_data,
      output [3:0] io_outputs_3_cmd_payload_mask,
      input   io_outputs_3_rsp_valid,
      input  [31:0] io_outputs_3_rsp_3_data,
      input   io_clk,
      input   GLOBAL_BUFFER_OUTPUT);
  reg [31:0] _zz_7_;
  wire [19:0] _zz_8_;
  wire [19:0] _zz_9_;
  wire [19:0] _zz_10_;
  wire [19:0] _zz_11_;
  wire [1:0] _zz_12_;
  wire [0:0] _zz_13_;
  wire [1:0] _zz_14_;
  wire [0:0] _zz_15_;
  wire [1:0] _zz_16_;
  wire [1:0] _zz_17_;
  wire  logic_hits_0;
  wire  logic_hits_1;
  wire  logic_hits_2;
  wire  logic_hits_3;
  wire  _zz_1_;
  wire  _zz_2_;
  wire  _zz_3_;
  wire  _zz_4_;
  wire  logic_noHit;
  reg [1:0] logic_rspPendingCounter;
  reg  logic_rspHits_0;
  reg  logic_rspHits_1;
  reg  logic_rspHits_2;
  reg  logic_rspHits_3;
  wire  logic_rspPending;
  wire  logic_rspNoHit;
  wire  _zz_5_;
  wire  _zz_6_;
  wire  logic_cmdWait;
  assign _zz_8_ = (20'b11110000000000000000);
  assign _zz_9_ = (20'b11110000000000000000);
  assign _zz_10_ = (20'b11111111111100000000);
  assign _zz_11_ = (20'b10000000000000000000);
  assign _zz_12_ = (logic_rspPendingCounter + _zz_14_);
  assign _zz_13_ = ((io_input_cmd_valid && io_input_cmd_ready) && (! io_input_cmd_payload_wr));
  assign _zz_14_ = {1'd0, _zz_13_};
  assign _zz_15_ = io_input_rsp_valid;
  assign _zz_16_ = {1'd0, _zz_15_};
  assign _zz_17_ = {_zz_6_,_zz_5_};
  always @(*) begin
    case(_zz_17_)
      2'b00 : begin
        _zz_7_ = io_outputs_0_rsp_0_data;
      end
      2'b01 : begin
        _zz_7_ = io_outputs_1_rsp_1_data;
      end
      2'b10 : begin
        _zz_7_ = io_outputs_2_rsp_2_data;
      end
      default : begin
        _zz_7_ = io_outputs_3_rsp_3_data;
      end
    endcase
  end

  assign logic_hits_0 = ((io_input_cmd_payload_address & _zz_8_) == (20'b00010000000000000000));
  always @ (*) begin
    io_outputs_0_cmd_valid = (io_input_cmd_valid && logic_hits_0);
    io_outputs_1_cmd_valid = (io_input_cmd_valid && logic_hits_1);
    io_outputs_2_cmd_valid = (io_input_cmd_valid && logic_hits_2);
    io_outputs_3_cmd_valid = (io_input_cmd_valid && logic_hits_3);
    io_input_cmd_ready = (((((logic_hits_0 && io_outputs_0_cmd_ready) || (logic_hits_1 && io_outputs_1_cmd_ready)) || (logic_hits_2 && io_outputs_2_cmd_ready)) || (logic_hits_3 && io_outputs_3_cmd_ready)) || logic_noHit);
    if(logic_cmdWait)begin
      io_input_cmd_ready = 1'b0;
      io_outputs_0_cmd_valid = 1'b0;
      io_outputs_1_cmd_valid = 1'b0;
      io_outputs_2_cmd_valid = 1'b0;
      io_outputs_3_cmd_valid = 1'b0;
    end
  end

  assign _zz_1_ = io_input_cmd_payload_wr;
  assign io_outputs_0_cmd_payload_wr = _zz_1_;
  assign io_outputs_0_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_0_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_0_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_1 = ((io_input_cmd_payload_address & _zz_9_) == (20'b00000000000000000000));
  assign _zz_2_ = io_input_cmd_payload_wr;
  assign io_outputs_1_cmd_payload_wr = _zz_2_;
  assign io_outputs_1_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_1_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_1_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_2 = ((io_input_cmd_payload_address & _zz_10_) == (20'b01110000000000000000));
  assign _zz_3_ = io_input_cmd_payload_wr;
  assign io_outputs_2_cmd_payload_wr = _zz_3_;
  assign io_outputs_2_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_2_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_2_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_3 = ((io_input_cmd_payload_address & _zz_11_) == (20'b10000000000000000000));
  assign _zz_4_ = io_input_cmd_payload_wr;
  assign io_outputs_3_cmd_payload_wr = _zz_4_;
  assign io_outputs_3_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_3_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_3_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_noHit = (! (((logic_hits_0 || logic_hits_1) || logic_hits_2) || logic_hits_3));
  assign logic_rspPending = (logic_rspPendingCounter != (2'b00));
  assign logic_rspNoHit = (! (((logic_rspHits_0 || logic_rspHits_1) || logic_rspHits_2) || logic_rspHits_3));
  assign io_input_rsp_valid = ((((io_outputs_0_rsp_valid || io_outputs_1_rsp_valid) || io_outputs_2_rsp_valid) || io_outputs_3_rsp_valid) || (logic_rspPending && logic_rspNoHit));
  assign _zz_5_ = (logic_rspHits_1 || logic_rspHits_3);
  assign _zz_6_ = (logic_rspHits_2 || logic_rspHits_3);
  assign io_input_rsp_payload_data = _zz_7_;
  assign logic_cmdWait = (((io_input_cmd_valid && logic_rspPending) && ((((logic_hits_0 != logic_rspHits_0) || (logic_hits_1 != logic_rspHits_1)) || (logic_hits_2 != logic_rspHits_2)) || (logic_hits_3 != logic_rspHits_3))) || (logic_rspPendingCounter == (2'b11)));
  always @ (posedge io_clk) begin
    if(GLOBAL_BUFFER_OUTPUT) begin
      logic_rspPendingCounter <= (2'b00);
    end else begin
      logic_rspPendingCounter <= (_zz_12_ - _zz_16_);
    end
  end

  always @ (posedge io_clk) begin
    if((io_input_cmd_valid && io_input_cmd_ready))begin
      logic_rspHits_0 <= logic_hits_0;
      logic_rspHits_1 <= logic_hits_1;
      logic_rspHits_2 <= logic_hits_2;
      logic_rspHits_3 <= logic_hits_3;
    end
  end

endmodule

module SimpleBusArbiter (
      input   io_inputs_0_cmd_valid,
      output  io_inputs_0_cmd_ready,
      input   io_inputs_0_cmd_payload_wr,
      input  [15:0] io_inputs_0_cmd_payload_address,
      input  [31:0] io_inputs_0_cmd_payload_data,
      input  [3:0] io_inputs_0_cmd_payload_mask,
      output  io_inputs_0_rsp_valid,
      output [31:0] io_inputs_0_rsp_payload_data,
      input   io_inputs_1_cmd_valid,
      output  io_inputs_1_cmd_ready,
      input   io_inputs_1_cmd_payload_wr,
      input  [15:0] io_inputs_1_cmd_payload_address,
      input  [31:0] io_inputs_1_cmd_payload_data,
      input  [3:0] io_inputs_1_cmd_payload_mask,
      output  io_inputs_1_rsp_valid,
      output [31:0] io_inputs_1_rsp_payload_data,
      output  io_output_cmd_valid,
      input   io_output_cmd_ready,
      output  io_output_cmd_payload_wr,
      output [15:0] io_output_cmd_payload_address,
      output [31:0] io_output_cmd_payload_data,
      output [3:0] io_output_cmd_payload_mask,
      input   io_output_rsp_valid,
      input  [31:0] io_output_rsp_payload_data,
      input   io_clk,
      input   GLOBAL_BUFFER_OUTPUT);
  wire  _zz_2_;
  wire  _zz_3_;
  wire  _zz_4_;
  wire  _zz_5_;
  wire  _zz_6_;
  wire [15:0] _zz_7_;
  wire [31:0] _zz_8_;
  wire [3:0] _zz_9_;
  wire [0:0] _zz_10_;
  wire [1:0] _zz_11_;
  wire  _zz_12_;
  wire [1:0] logic_rspRouteOh;
  reg  logic_rsp_pending;
  reg [1:0] logic_rsp_target;
  wire  _zz_1_;
  assign _zz_12_ = ((io_output_cmd_valid && io_output_cmd_ready) && (! io_output_cmd_payload_wr));
  StreamArbiter logic_arbiter ( 
    .io_inputs_0_0(io_inputs_0_cmd_valid),
    .io_inputs_0_ready(_zz_3_),
    .io_inputs_0_0_wr(io_inputs_0_cmd_payload_wr),
    .io_inputs_0_0_address(io_inputs_0_cmd_payload_address),
    .io_inputs_0_0_data(io_inputs_0_cmd_payload_data),
    .io_inputs_0_0_mask(io_inputs_0_cmd_payload_mask),
    .io_inputs_1_1(io_inputs_1_cmd_valid),
    .io_inputs_1_ready(_zz_4_),
    .io_inputs_1_1_wr(io_inputs_1_cmd_payload_wr),
    .io_inputs_1_1_address(io_inputs_1_cmd_payload_address),
    .io_inputs_1_1_data(io_inputs_1_cmd_payload_data),
    .io_inputs_1_1_mask(io_inputs_1_cmd_payload_mask),
    .io_output_valid(_zz_5_),
    .io_output_ready(_zz_2_),
    .io_output_payload_wr(_zz_6_),
    .io_output_payload_address(_zz_7_),
    .io_output_payload_data(_zz_8_),
    .io_output_payload_mask(_zz_9_),
    .io_chosen(_zz_10_),
    .io_chosenOH(_zz_11_),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(GLOBAL_BUFFER_OUTPUT) 
  );
  assign io_inputs_0_cmd_ready = _zz_3_;
  assign io_inputs_1_cmd_ready = _zz_4_;
  assign logic_rspRouteOh = logic_rsp_target;
  assign _zz_1_ = (! (logic_rsp_pending && (! io_output_rsp_valid)));
  assign _zz_2_ = (io_output_cmd_ready && _zz_1_);
  assign io_output_cmd_valid = (_zz_5_ && _zz_1_);
  assign io_output_cmd_payload_wr = _zz_6_;
  assign io_output_cmd_payload_address = _zz_7_;
  assign io_output_cmd_payload_data = _zz_8_;
  assign io_output_cmd_payload_mask = _zz_9_;
  assign io_inputs_0_rsp_valid = (io_output_rsp_valid && logic_rspRouteOh[0]);
  assign io_inputs_0_rsp_payload_data = io_output_rsp_payload_data;
  assign io_inputs_1_rsp_valid = (io_output_rsp_valid && logic_rspRouteOh[1]);
  assign io_inputs_1_rsp_payload_data = io_output_rsp_payload_data;
  always @ (posedge io_clk) begin
    if(GLOBAL_BUFFER_OUTPUT) begin
      logic_rsp_pending <= 1'b0;
    end else begin
      if(io_output_rsp_valid)begin
        logic_rsp_pending <= 1'b0;
      end
      if(_zz_12_)begin
        logic_rsp_pending <= 1'b1;
      end
    end
  end

  always @ (posedge io_clk) begin
    if(_zz_12_)begin
      logic_rsp_target <= _zz_11_;
    end
  end

endmodule


//SimpleBusArbiter_1_ remplaced by SimpleBusArbiter

module SimpleBusArbiter_2_ (
      input   io_inputs_0_cmd_valid,
      output  io_inputs_0_cmd_ready,
      input   io_inputs_0_cmd_payload_wr,
      input  [5:0] io_inputs_0_cmd_payload_address,
      input  [31:0] io_inputs_0_cmd_payload_data,
      input  [3:0] io_inputs_0_cmd_payload_mask,
      output  io_inputs_0_rsp_valid,
      output [31:0] io_inputs_0_rsp_payload_data,
      output  io_output_cmd_valid,
      input   io_output_cmd_ready,
      output  io_output_cmd_payload_wr,
      output [5:0] io_output_cmd_payload_address,
      output [31:0] io_output_cmd_payload_data,
      output [3:0] io_output_cmd_payload_mask,
      input   io_output_rsp_valid,
      input  [31:0] io_output_rsp_payload_data);
  assign io_output_cmd_valid = io_inputs_0_cmd_valid;
  assign io_output_cmd_payload_wr = io_inputs_0_cmd_payload_wr;
  assign io_output_cmd_payload_address = io_inputs_0_cmd_payload_address;
  assign io_output_cmd_payload_data = io_inputs_0_cmd_payload_data;
  assign io_output_cmd_payload_mask = io_inputs_0_cmd_payload_mask;
  assign io_inputs_0_cmd_ready = io_output_cmd_ready;
  assign io_inputs_0_rsp_valid = io_output_rsp_valid;
  assign io_inputs_0_rsp_payload_data = io_output_rsp_payload_data;
endmodule

module SimpleBusArbiter_3_ (
      input   io_inputs_0_cmd_valid,
      output  io_inputs_0_cmd_ready,
      input   io_inputs_0_cmd_payload_wr,
      input  [18:0] io_inputs_0_cmd_payload_address,
      input  [31:0] io_inputs_0_cmd_payload_data,
      input  [3:0] io_inputs_0_cmd_payload_mask,
      output  io_inputs_0_rsp_valid,
      output [31:0] io_inputs_0_rsp_payload_data,
      output  io_output_cmd_valid,
      input   io_output_cmd_ready,
      output  io_output_cmd_payload_wr,
      output [18:0] io_output_cmd_payload_address,
      output [31:0] io_output_cmd_payload_data,
      output [3:0] io_output_cmd_payload_mask,
      input   io_output_rsp_valid,
      input  [31:0] io_output_rsp_payload_data);
  assign io_output_cmd_valid = io_inputs_0_cmd_valid;
  assign io_output_cmd_payload_wr = io_inputs_0_cmd_payload_wr;
  assign io_output_cmd_payload_address = io_inputs_0_cmd_payload_address;
  assign io_output_cmd_payload_data = io_inputs_0_cmd_payload_data;
  assign io_output_cmd_payload_mask = io_inputs_0_cmd_payload_mask;
  assign io_inputs_0_cmd_ready = io_output_cmd_ready;
  assign io_inputs_0_rsp_valid = io_output_rsp_valid;
  assign io_inputs_0_rsp_payload_data = io_output_rsp_payload_data;
endmodule

module SimpleBusArbiter_4_ (
      input   io_inputs_0_cmd_valid,
      output  io_inputs_0_cmd_ready,
      input   io_inputs_0_cmd_payload_wr,
      input  [19:0] io_inputs_0_cmd_payload_address,
      input  [31:0] io_inputs_0_cmd_payload_data,
      input  [3:0] io_inputs_0_cmd_payload_mask,
      output  io_inputs_0_rsp_valid,
      output [31:0] io_inputs_0_rsp_payload_data,
      input   io_inputs_1_cmd_valid,
      output  io_inputs_1_cmd_ready,
      input   io_inputs_1_cmd_payload_wr,
      input  [19:0] io_inputs_1_cmd_payload_address,
      input  [31:0] io_inputs_1_cmd_payload_data,
      input  [3:0] io_inputs_1_cmd_payload_mask,
      output  io_inputs_1_rsp_valid,
      output [31:0] io_inputs_1_rsp_payload_data,
      output  io_output_cmd_valid,
      input   io_output_cmd_ready,
      output  io_output_cmd_payload_wr,
      output [19:0] io_output_cmd_payload_address,
      output [31:0] io_output_cmd_payload_data,
      output [3:0] io_output_cmd_payload_mask,
      input   io_output_rsp_valid,
      input  [31:0] io_output_rsp_payload_data,
      input   io_clk,
      input   GLOBAL_BUFFER_OUTPUT);
  wire  _zz_2_;
  wire  _zz_3_;
  wire  _zz_4_;
  wire  _zz_5_;
  wire  _zz_6_;
  wire [19:0] _zz_7_;
  wire [31:0] _zz_8_;
  wire [3:0] _zz_9_;
  wire [0:0] _zz_10_;
  wire [1:0] _zz_11_;
  wire  _zz_12_;
  wire [1:0] logic_rspRouteOh;
  reg  logic_rsp_pending;
  reg [1:0] logic_rsp_target;
  wire  _zz_1_;
  assign _zz_12_ = ((io_output_cmd_valid && io_output_cmd_ready) && (! io_output_cmd_payload_wr));
  StreamArbiter_2_ logic_arbiter ( 
    .io_inputs_0_0(io_inputs_0_cmd_valid),
    .io_inputs_0_ready(_zz_3_),
    .io_inputs_0_0_wr(io_inputs_0_cmd_payload_wr),
    .io_inputs_0_0_address(io_inputs_0_cmd_payload_address),
    .io_inputs_0_0_data(io_inputs_0_cmd_payload_data),
    .io_inputs_0_0_mask(io_inputs_0_cmd_payload_mask),
    .io_inputs_1_1(io_inputs_1_cmd_valid),
    .io_inputs_1_ready(_zz_4_),
    .io_inputs_1_1_wr(io_inputs_1_cmd_payload_wr),
    .io_inputs_1_1_address(io_inputs_1_cmd_payload_address),
    .io_inputs_1_1_data(io_inputs_1_cmd_payload_data),
    .io_inputs_1_1_mask(io_inputs_1_cmd_payload_mask),
    .io_output_valid(_zz_5_),
    .io_output_ready(_zz_2_),
    .io_output_payload_wr(_zz_6_),
    .io_output_payload_address(_zz_7_),
    .io_output_payload_data(_zz_8_),
    .io_output_payload_mask(_zz_9_),
    .io_chosen(_zz_10_),
    .io_chosenOH(_zz_11_),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(GLOBAL_BUFFER_OUTPUT) 
  );
  assign io_inputs_0_cmd_ready = _zz_3_;
  assign io_inputs_1_cmd_ready = _zz_4_;
  assign logic_rspRouteOh = logic_rsp_target;
  assign _zz_1_ = (! (logic_rsp_pending && (! io_output_rsp_valid)));
  assign _zz_2_ = (io_output_cmd_ready && _zz_1_);
  assign io_output_cmd_valid = (_zz_5_ && _zz_1_);
  assign io_output_cmd_payload_wr = _zz_6_;
  assign io_output_cmd_payload_address = _zz_7_;
  assign io_output_cmd_payload_data = _zz_8_;
  assign io_output_cmd_payload_mask = _zz_9_;
  assign io_inputs_0_rsp_valid = (io_output_rsp_valid && logic_rspRouteOh[0]);
  assign io_inputs_0_rsp_payload_data = io_output_rsp_payload_data;
  assign io_inputs_1_rsp_valid = (io_output_rsp_valid && logic_rspRouteOh[1]);
  assign io_inputs_1_rsp_payload_data = io_output_rsp_payload_data;
  always @ (posedge io_clk) begin
    if(GLOBAL_BUFFER_OUTPUT) begin
      logic_rsp_pending <= 1'b0;
    end else begin
      if(io_output_rsp_valid)begin
        logic_rsp_pending <= 1'b0;
      end
      if(_zz_12_)begin
        logic_rsp_pending <= 1'b1;
      end
    end
  end

  always @ (posedge io_clk) begin
    if(_zz_12_)begin
      logic_rsp_target <= _zz_11_;
    end
  end

endmodule

module Up5kPerf (
      input   io_clk,
      input   io_reset,
      output [2:0] io_leds,
      output  io_serialTx,
      output [0:0] io_flash_ss,
      output  io_flash_sclk,
      output  io_flash_mosi,
      input   io_flash_miso);
  wire  _zz_15_;
  wire  _zz_16_;
  wire  _zz_17_;
  wire [15:0] _zz_18_;
  wire [15:0] _zz_19_;
  wire [15:0] _zz_20_;
  wire [15:0] _zz_21_;
  wire [5:0] _zz_22_;
  wire [18:0] _zz_23_;
  wire  _zz_24_;
  wire  _zz_25_;
  wire  _zz_26_;
  wire  _zz_27_;
  wire [31:0] _zz_28_;
  wire  _zz_29_;
  wire  _zz_30_;
  wire [31:0] _zz_31_;
  wire  _zz_32_;
  wire  _zz_33_;
  wire [31:0] _zz_34_;
  wire  _zz_35_;
  wire [2:0] _zz_36_;
  wire  _zz_37_;
  wire  _zz_38_;
  wire  _zz_39_;
  wire [31:0] _zz_40_;
  wire  _zz_41_;
  wire  _zz_42_;
  wire [0:0] _zz_43_;
  wire  _zz_44_;
  wire [31:0] _zz_45_;
  wire  _zz_46_;
  wire  _zz_47_;
  wire [31:0] _zz_48_;
  wire [31:0] _zz_49_;
  wire [1:0] _zz_50_;
  wire  _zz_51_;
  wire  _zz_52_;
  wire [31:0] _zz_53_;
  wire  _zz_54_;
  wire  _zz_55_;
  wire [19:0] _zz_56_;
  wire [31:0] _zz_57_;
  wire [3:0] _zz_58_;
  wire  _zz_59_;
  wire  _zz_60_;
  wire [19:0] _zz_61_;
  wire [31:0] _zz_62_;
  wire [3:0] _zz_63_;
  wire  _zz_64_;
  wire  _zz_65_;
  wire [31:0] _zz_66_;
  wire  _zz_67_;
  wire  _zz_68_;
  wire [19:0] _zz_69_;
  wire [31:0] _zz_70_;
  wire [3:0] _zz_71_;
  wire  _zz_72_;
  wire  _zz_73_;
  wire [19:0] _zz_74_;
  wire [31:0] _zz_75_;
  wire [3:0] _zz_76_;
  wire  _zz_77_;
  wire  _zz_78_;
  wire [31:0] _zz_79_;
  wire  _zz_80_;
  wire  _zz_81_;
  wire [19:0] _zz_82_;
  wire [31:0] _zz_83_;
  wire [3:0] _zz_84_;
  wire  _zz_85_;
  wire  _zz_86_;
  wire [19:0] _zz_87_;
  wire [31:0] _zz_88_;
  wire [3:0] _zz_89_;
  wire  _zz_90_;
  wire  _zz_91_;
  wire [19:0] _zz_92_;
  wire [31:0] _zz_93_;
  wire [3:0] _zz_94_;
  wire  _zz_95_;
  wire  _zz_96_;
  wire [19:0] _zz_97_;
  wire [31:0] _zz_98_;
  wire [3:0] _zz_99_;
  wire  _zz_100_;
  wire  _zz_101_;
  wire [31:0] _zz_102_;
  wire  _zz_103_;
  wire  _zz_104_;
  wire [31:0] _zz_105_;
  wire  _zz_106_;
  wire  _zz_107_;
  wire [15:0] _zz_108_;
  wire [31:0] _zz_109_;
  wire [3:0] _zz_110_;
  wire  _zz_111_;
  wire  _zz_112_;
  wire [31:0] _zz_113_;
  wire  _zz_114_;
  wire  _zz_115_;
  wire [31:0] _zz_116_;
  wire  _zz_117_;
  wire  _zz_118_;
  wire [15:0] _zz_119_;
  wire [31:0] _zz_120_;
  wire [3:0] _zz_121_;
  wire  _zz_122_;
  wire  _zz_123_;
  wire [31:0] _zz_124_;
  wire  _zz_125_;
  wire  _zz_126_;
  wire [5:0] _zz_127_;
  wire [31:0] _zz_128_;
  wire [3:0] _zz_129_;
  wire  _zz_130_;
  wire  _zz_131_;
  wire [31:0] _zz_132_;
  wire  _zz_133_;
  wire  _zz_134_;
  wire [18:0] _zz_135_;
  wire [31:0] _zz_136_;
  wire [3:0] _zz_137_;
  wire  _zz_138_;
  wire  _zz_139_;
  wire [31:0] _zz_140_;
  wire  _zz_141_;
  wire  _zz_142_;
  wire [31:0] _zz_143_;
  wire  _zz_144_;
  wire  _zz_145_;
  wire [19:0] _zz_146_;
  wire [31:0] _zz_147_;
  wire [3:0] _zz_148_;
  wire  _zz_149_;
  wire  _zz_150_;
  wire  _zz_151_;
  reg  resetCtrl_resetUnbuffered;
  reg [5:0] resetCtrl_resetCounter = (6'b000000);
  wire [5:0] _zz_1_;
  reg  resetCtrl_systemResetBuffered;
  wire  system_dBus_cmd_valid;
  wire  system_dBus_cmd_ready;
  wire  system_dBus_cmd_payload_wr;
  wire [19:0] system_dBus_cmd_payload_address;
  wire [31:0] system_dBus_cmd_payload_data;
  wire [3:0] system_dBus_cmd_payload_mask;
  wire  system_dBus_rsp_valid;
  wire [31:0] system_dBus_rsp_payload_data;
  wire  system_iBus_cmd_valid;
  wire  system_iBus_cmd_ready;
  wire  system_iBus_cmd_payload_wr;
  wire [19:0] system_iBus_cmd_payload_address;
  wire [31:0] system_iBus_cmd_payload_data;
  wire [3:0] system_iBus_cmd_payload_mask;
  wire  system_iBus_rsp_valid;
  wire [31:0] system_iBus_rsp_payload_data;
  wire  system_slowBus_cmd_valid;
  wire  system_slowBus_cmd_ready;
  wire  system_slowBus_cmd_payload_wr;
  wire [19:0] system_slowBus_cmd_payload_address;
  wire [31:0] system_slowBus_cmd_payload_data;
  wire [3:0] system_slowBus_cmd_payload_mask;
  wire  system_slowBus_rsp_valid;
  wire [31:0] system_slowBus_rsp_payload_data;
  reg [0:0] system_flashXip_io_flash_ss_regNext;
  reg  system_flashXip_io_flash_sclk_regNext;
  reg  system_flashXip_io_flash_mosi_regNext;
  reg [3:0] _zz_2_;
  reg  system_slowBus_decoder_io_input_rsp_m2sPipe_valid;
  reg [31:0] system_slowBus_decoder_io_input_rsp_m2sPipe_payload_data;
  wire  system_dBus_decoder_io_outputs_1_cmd_halfPipe_valid;
  wire  system_dBus_decoder_io_outputs_1_cmd_halfPipe_ready;
  wire  system_dBus_decoder_io_outputs_1_cmd_halfPipe_payload_wr;
  wire [19:0] system_dBus_decoder_io_outputs_1_cmd_halfPipe_payload_address;
  wire [31:0] system_dBus_decoder_io_outputs_1_cmd_halfPipe_payload_data;
  wire [3:0] system_dBus_decoder_io_outputs_1_cmd_halfPipe_payload_mask;
  reg  _zz_3_;
  reg  _zz_4_;
  reg  _zz_5_;
  reg [19:0] _zz_6_;
  reg [31:0] _zz_7_;
  reg [3:0] _zz_8_;
  wire  system_iBus_decoder_io_outputs_1_cmd_halfPipe_valid;
  wire  system_iBus_decoder_io_outputs_1_cmd_halfPipe_ready;
  wire  system_iBus_decoder_io_outputs_1_cmd_halfPipe_payload_wr;
  wire [19:0] system_iBus_decoder_io_outputs_1_cmd_halfPipe_payload_address;
  wire [31:0] system_iBus_decoder_io_outputs_1_cmd_halfPipe_payload_data;
  wire [3:0] system_iBus_decoder_io_outputs_1_cmd_halfPipe_payload_mask;
  reg  _zz_9_;
  reg  _zz_10_;
  reg  _zz_11_;
  reg [19:0] _zz_12_;
  reg [31:0] _zz_13_;
  reg [3:0] _zz_14_;
  assign _zz_149_ = (resetCtrl_resetCounter != _zz_1_);
  assign _zz_150_ = (! _zz_3_);
  assign _zz_151_ = (! _zz_9_);
  BufferCC bufferCC_1_ ( 
    .io_dataIn(io_reset),
    .io_dataOut(_zz_24_),
    .io_clk(io_clk) 
  );
  SB_GB resetCtrl_systemResetBuffered_SB_GB ( 
    .USER_SIGNAL_TO_GLOBAL_BUFFER(resetCtrl_systemResetBuffered),
    .GLOBAL_BUFFER_OUTPUT(_zz_25_) 
  );
  Spram system_iRam ( 
    .io_bus_cmd_valid(_zz_117_),
    .io_bus_cmd_ready(_zz_26_),
    .io_bus_cmd_payload_wr(_zz_118_),
    .io_bus_cmd_payload_address(_zz_119_),
    .io_bus_cmd_payload_data(_zz_120_),
    .io_bus_cmd_payload_mask(_zz_121_),
    .io_bus_rsp_valid(_zz_27_),
    .io_bus_rsp_payload_data(_zz_28_),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(_zz_25_) 
  );
  Spram system_dRam ( 
    .io_bus_cmd_valid(_zz_106_),
    .io_bus_cmd_ready(_zz_29_),
    .io_bus_cmd_payload_wr(_zz_107_),
    .io_bus_cmd_payload_address(_zz_108_),
    .io_bus_cmd_payload_data(_zz_109_),
    .io_bus_cmd_payload_mask(_zz_110_),
    .io_bus_rsp_valid(_zz_30_),
    .io_bus_rsp_payload_data(_zz_31_),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(_zz_25_) 
  );
  Peripherals system_peripherals ( 
    .io_bus_cmd_valid(_zz_125_),
    .io_bus_cmd_ready(_zz_32_),
    .io_bus_cmd_payload_wr(_zz_126_),
    .io_bus_cmd_payload_address(_zz_127_),
    .io_bus_cmd_payload_data(_zz_128_),
    .io_bus_cmd_payload_mask(_zz_129_),
    .io_bus_rsp_valid(_zz_33_),
    .io_bus_rsp_payload_data(_zz_34_),
    .io_mTimeInterrupt(_zz_35_),
    .io_leds(_zz_36_),
    .io_serialTx(_zz_37_),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(_zz_25_) 
  );
  FlashXpi system_flashXip ( 
    .io_bus_cmd_valid(_zz_133_),
    .io_bus_cmd_ready(_zz_38_),
    .io_bus_cmd_payload_wr(_zz_134_),
    .io_bus_cmd_payload_address(_zz_135_),
    .io_bus_cmd_payload_data(_zz_136_),
    .io_bus_cmd_payload_mask(_zz_137_),
    .io_bus_rsp_valid(_zz_39_),
    .io_bus_rsp_payload_data(_zz_40_),
    .io_flash_ss(_zz_43_),
    .io_flash_sclk(_zz_41_),
    .io_flash_mosi(_zz_42_),
    .io_flash_miso(io_flash_miso),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(_zz_25_) 
  );
  VexRiscv system_cpu ( 
    .iBus_cmd_valid(_zz_44_),
    .iBus_cmd_ready(system_iBus_cmd_ready),
    .iBus_cmd_payload_pc(_zz_45_),
    .iBus_rsp_valid(system_iBus_rsp_valid),
    .iBus_rsp_payload_error(_zz_15_),
    .iBus_rsp_payload_inst(system_iBus_rsp_payload_data),
    .timerInterrupt(_zz_35_),
    .externalInterrupt(_zz_16_),
    .dBus_cmd_valid(_zz_46_),
    .dBus_cmd_ready(system_dBus_cmd_ready),
    .dBus_cmd_payload_wr(_zz_47_),
    .dBus_cmd_payload_address(_zz_48_),
    .dBus_cmd_payload_data(_zz_49_),
    .dBus_cmd_payload_size(_zz_50_),
    .dBus_rsp_ready(system_dBus_rsp_valid),
    .dBus_rsp_error(_zz_17_),
    .dBus_rsp_data(system_dBus_rsp_payload_data),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(_zz_25_) 
  );
  SimpleBusDecoder system_dBus_decoder ( 
    .io_input_cmd_valid(system_dBus_cmd_valid),
    .io_input_cmd_ready(_zz_51_),
    .io_input_cmd_payload_wr(system_dBus_cmd_payload_wr),
    .io_input_cmd_payload_address(system_dBus_cmd_payload_address),
    .io_input_cmd_payload_data(system_dBus_cmd_payload_data),
    .io_input_cmd_payload_mask(system_dBus_cmd_payload_mask),
    .io_input_rsp_valid(_zz_52_),
    .io_input_rsp_payload_data(_zz_53_),
    .io_outputs_0_cmd_valid(_zz_54_),
    .io_outputs_0_cmd_ready(_zz_100_),
    .io_outputs_0_cmd_payload_wr(_zz_55_),
    .io_outputs_0_cmd_payload_address(_zz_56_),
    .io_outputs_0_cmd_payload_data(_zz_57_),
    .io_outputs_0_cmd_payload_mask(_zz_58_),
    .io_outputs_0_rsp_valid(_zz_101_),
    .io_outputs_0_rsp_0_data(_zz_102_),
    .io_outputs_1_cmd_valid(_zz_59_),
    .io_outputs_1_cmd_ready(_zz_4_),
    .io_outputs_1_cmd_payload_wr(_zz_60_),
    .io_outputs_1_cmd_payload_address(_zz_61_),
    .io_outputs_1_cmd_payload_data(_zz_62_),
    .io_outputs_1_cmd_payload_mask(_zz_63_),
    .io_outputs_1_rsp_valid(_zz_139_),
    .io_outputs_1_rsp_1_data(_zz_140_),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(_zz_25_) 
  );
  SimpleBusDecoder_1_ system_iBus_decoder ( 
    .io_input_cmd_valid(system_iBus_cmd_valid),
    .io_input_cmd_ready(_zz_64_),
    .io_input_cmd_payload_wr(system_iBus_cmd_payload_wr),
    .io_input_cmd_payload_address(system_iBus_cmd_payload_address),
    .io_input_cmd_payload_data(system_iBus_cmd_payload_data),
    .io_input_cmd_payload_mask(system_iBus_cmd_payload_mask),
    .io_input_rsp_valid(_zz_65_),
    .io_input_rsp_payload_data(_zz_66_),
    .io_outputs_0_cmd_valid(_zz_67_),
    .io_outputs_0_cmd_ready(_zz_111_),
    .io_outputs_0_cmd_payload_wr(_zz_68_),
    .io_outputs_0_cmd_payload_address(_zz_69_),
    .io_outputs_0_cmd_payload_data(_zz_70_),
    .io_outputs_0_cmd_payload_mask(_zz_71_),
    .io_outputs_0_rsp_valid(_zz_112_),
    .io_outputs_0_rsp_0_data(_zz_113_),
    .io_outputs_1_cmd_valid(_zz_72_),
    .io_outputs_1_cmd_ready(_zz_10_),
    .io_outputs_1_cmd_payload_wr(_zz_73_),
    .io_outputs_1_cmd_payload_address(_zz_74_),
    .io_outputs_1_cmd_payload_data(_zz_75_),
    .io_outputs_1_cmd_payload_mask(_zz_76_),
    .io_outputs_1_rsp_valid(_zz_142_),
    .io_outputs_1_rsp_1_data(_zz_143_),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(_zz_25_) 
  );
  SimpleBusDecoder_2_ system_slowBus_decoder ( 
    .io_input_cmd_valid(system_slowBus_cmd_valid),
    .io_input_cmd_ready(_zz_77_),
    .io_input_cmd_payload_wr(system_slowBus_cmd_payload_wr),
    .io_input_cmd_payload_address(system_slowBus_cmd_payload_address),
    .io_input_cmd_payload_data(system_slowBus_cmd_payload_data),
    .io_input_cmd_payload_mask(system_slowBus_cmd_payload_mask),
    .io_input_rsp_valid(_zz_78_),
    .io_input_rsp_payload_data(_zz_79_),
    .io_outputs_0_cmd_valid(_zz_80_),
    .io_outputs_0_cmd_ready(_zz_114_),
    .io_outputs_0_cmd_payload_wr(_zz_81_),
    .io_outputs_0_cmd_payload_address(_zz_82_),
    .io_outputs_0_cmd_payload_data(_zz_83_),
    .io_outputs_0_cmd_payload_mask(_zz_84_),
    .io_outputs_0_rsp_valid(_zz_115_),
    .io_outputs_0_rsp_0_data(_zz_116_),
    .io_outputs_1_cmd_valid(_zz_85_),
    .io_outputs_1_cmd_ready(_zz_103_),
    .io_outputs_1_cmd_payload_wr(_zz_86_),
    .io_outputs_1_cmd_payload_address(_zz_87_),
    .io_outputs_1_cmd_payload_data(_zz_88_),
    .io_outputs_1_cmd_payload_mask(_zz_89_),
    .io_outputs_1_rsp_valid(_zz_104_),
    .io_outputs_1_rsp_1_data(_zz_105_),
    .io_outputs_2_cmd_valid(_zz_90_),
    .io_outputs_2_cmd_ready(_zz_122_),
    .io_outputs_2_cmd_payload_wr(_zz_91_),
    .io_outputs_2_cmd_payload_address(_zz_92_),
    .io_outputs_2_cmd_payload_data(_zz_93_),
    .io_outputs_2_cmd_payload_mask(_zz_94_),
    .io_outputs_2_rsp_valid(_zz_123_),
    .io_outputs_2_rsp_2_data(_zz_124_),
    .io_outputs_3_cmd_valid(_zz_95_),
    .io_outputs_3_cmd_ready(_zz_130_),
    .io_outputs_3_cmd_payload_wr(_zz_96_),
    .io_outputs_3_cmd_payload_address(_zz_97_),
    .io_outputs_3_cmd_payload_data(_zz_98_),
    .io_outputs_3_cmd_payload_mask(_zz_99_),
    .io_outputs_3_rsp_valid(_zz_131_),
    .io_outputs_3_rsp_3_data(_zz_132_),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(_zz_25_) 
  );
  SimpleBusArbiter system_dRam_io_bus_arbiter ( 
    .io_inputs_0_cmd_valid(_zz_54_),
    .io_inputs_0_cmd_ready(_zz_100_),
    .io_inputs_0_cmd_payload_wr(_zz_55_),
    .io_inputs_0_cmd_payload_address(_zz_18_),
    .io_inputs_0_cmd_payload_data(_zz_57_),
    .io_inputs_0_cmd_payload_mask(_zz_58_),
    .io_inputs_0_rsp_valid(_zz_101_),
    .io_inputs_0_rsp_payload_data(_zz_102_),
    .io_inputs_1_cmd_valid(_zz_85_),
    .io_inputs_1_cmd_ready(_zz_103_),
    .io_inputs_1_cmd_payload_wr(_zz_86_),
    .io_inputs_1_cmd_payload_address(_zz_19_),
    .io_inputs_1_cmd_payload_data(_zz_88_),
    .io_inputs_1_cmd_payload_mask(_zz_89_),
    .io_inputs_1_rsp_valid(_zz_104_),
    .io_inputs_1_rsp_payload_data(_zz_105_),
    .io_output_cmd_valid(_zz_106_),
    .io_output_cmd_ready(_zz_29_),
    .io_output_cmd_payload_wr(_zz_107_),
    .io_output_cmd_payload_address(_zz_108_),
    .io_output_cmd_payload_data(_zz_109_),
    .io_output_cmd_payload_mask(_zz_110_),
    .io_output_rsp_valid(_zz_30_),
    .io_output_rsp_payload_data(_zz_31_),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(_zz_25_) 
  );
  SimpleBusArbiter system_iRam_io_bus_arbiter ( 
    .io_inputs_0_cmd_valid(_zz_67_),
    .io_inputs_0_cmd_ready(_zz_111_),
    .io_inputs_0_cmd_payload_wr(_zz_68_),
    .io_inputs_0_cmd_payload_address(_zz_20_),
    .io_inputs_0_cmd_payload_data(_zz_70_),
    .io_inputs_0_cmd_payload_mask(_zz_71_),
    .io_inputs_0_rsp_valid(_zz_112_),
    .io_inputs_0_rsp_payload_data(_zz_113_),
    .io_inputs_1_cmd_valid(_zz_80_),
    .io_inputs_1_cmd_ready(_zz_114_),
    .io_inputs_1_cmd_payload_wr(_zz_81_),
    .io_inputs_1_cmd_payload_address(_zz_21_),
    .io_inputs_1_cmd_payload_data(_zz_83_),
    .io_inputs_1_cmd_payload_mask(_zz_84_),
    .io_inputs_1_rsp_valid(_zz_115_),
    .io_inputs_1_rsp_payload_data(_zz_116_),
    .io_output_cmd_valid(_zz_117_),
    .io_output_cmd_ready(_zz_26_),
    .io_output_cmd_payload_wr(_zz_118_),
    .io_output_cmd_payload_address(_zz_119_),
    .io_output_cmd_payload_data(_zz_120_),
    .io_output_cmd_payload_mask(_zz_121_),
    .io_output_rsp_valid(_zz_27_),
    .io_output_rsp_payload_data(_zz_28_),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(_zz_25_) 
  );
  SimpleBusArbiter_2_ system_peripherals_io_bus_arbiter ( 
    .io_inputs_0_cmd_valid(_zz_90_),
    .io_inputs_0_cmd_ready(_zz_122_),
    .io_inputs_0_cmd_payload_wr(_zz_91_),
    .io_inputs_0_cmd_payload_address(_zz_22_),
    .io_inputs_0_cmd_payload_data(_zz_93_),
    .io_inputs_0_cmd_payload_mask(_zz_94_),
    .io_inputs_0_rsp_valid(_zz_123_),
    .io_inputs_0_rsp_payload_data(_zz_124_),
    .io_output_cmd_valid(_zz_125_),
    .io_output_cmd_ready(_zz_32_),
    .io_output_cmd_payload_wr(_zz_126_),
    .io_output_cmd_payload_address(_zz_127_),
    .io_output_cmd_payload_data(_zz_128_),
    .io_output_cmd_payload_mask(_zz_129_),
    .io_output_rsp_valid(_zz_33_),
    .io_output_rsp_payload_data(_zz_34_) 
  );
  SimpleBusArbiter_3_ system_flashXip_io_bus_arbiter ( 
    .io_inputs_0_cmd_valid(_zz_95_),
    .io_inputs_0_cmd_ready(_zz_130_),
    .io_inputs_0_cmd_payload_wr(_zz_96_),
    .io_inputs_0_cmd_payload_address(_zz_23_),
    .io_inputs_0_cmd_payload_data(_zz_98_),
    .io_inputs_0_cmd_payload_mask(_zz_99_),
    .io_inputs_0_rsp_valid(_zz_131_),
    .io_inputs_0_rsp_payload_data(_zz_132_),
    .io_output_cmd_valid(_zz_133_),
    .io_output_cmd_ready(_zz_38_),
    .io_output_cmd_payload_wr(_zz_134_),
    .io_output_cmd_payload_address(_zz_135_),
    .io_output_cmd_payload_data(_zz_136_),
    .io_output_cmd_payload_mask(_zz_137_),
    .io_output_rsp_valid(_zz_39_),
    .io_output_rsp_payload_data(_zz_40_) 
  );
  SimpleBusArbiter_4_ system_slowBus_arbiter ( 
    .io_inputs_0_cmd_valid(system_dBus_decoder_io_outputs_1_cmd_halfPipe_valid),
    .io_inputs_0_cmd_ready(_zz_138_),
    .io_inputs_0_cmd_payload_wr(system_dBus_decoder_io_outputs_1_cmd_halfPipe_payload_wr),
    .io_inputs_0_cmd_payload_address(system_dBus_decoder_io_outputs_1_cmd_halfPipe_payload_address),
    .io_inputs_0_cmd_payload_data(system_dBus_decoder_io_outputs_1_cmd_halfPipe_payload_data),
    .io_inputs_0_cmd_payload_mask(system_dBus_decoder_io_outputs_1_cmd_halfPipe_payload_mask),
    .io_inputs_0_rsp_valid(_zz_139_),
    .io_inputs_0_rsp_payload_data(_zz_140_),
    .io_inputs_1_cmd_valid(system_iBus_decoder_io_outputs_1_cmd_halfPipe_valid),
    .io_inputs_1_cmd_ready(_zz_141_),
    .io_inputs_1_cmd_payload_wr(system_iBus_decoder_io_outputs_1_cmd_halfPipe_payload_wr),
    .io_inputs_1_cmd_payload_address(system_iBus_decoder_io_outputs_1_cmd_halfPipe_payload_address),
    .io_inputs_1_cmd_payload_data(system_iBus_decoder_io_outputs_1_cmd_halfPipe_payload_data),
    .io_inputs_1_cmd_payload_mask(system_iBus_decoder_io_outputs_1_cmd_halfPipe_payload_mask),
    .io_inputs_1_rsp_valid(_zz_142_),
    .io_inputs_1_rsp_payload_data(_zz_143_),
    .io_output_cmd_valid(_zz_144_),
    .io_output_cmd_ready(system_slowBus_cmd_ready),
    .io_output_cmd_payload_wr(_zz_145_),
    .io_output_cmd_payload_address(_zz_146_),
    .io_output_cmd_payload_data(_zz_147_),
    .io_output_cmd_payload_mask(_zz_148_),
    .io_output_rsp_valid(system_slowBus_rsp_valid),
    .io_output_rsp_payload_data(system_slowBus_rsp_payload_data),
    .io_clk(io_clk),
    .GLOBAL_BUFFER_OUTPUT(_zz_25_) 
  );
  always @ (*) begin
    resetCtrl_resetUnbuffered = 1'b0;
    if(_zz_149_)begin
      resetCtrl_resetUnbuffered = 1'b1;
    end
  end

  assign _zz_1_[5 : 0] = (6'b111111);
  assign io_serialTx = _zz_37_;
  assign io_leds = _zz_36_;
  assign io_flash_ss = system_flashXip_io_flash_ss_regNext;
  assign io_flash_sclk = system_flashXip_io_flash_sclk_regNext;
  assign io_flash_mosi = system_flashXip_io_flash_mosi_regNext;
  assign _zz_15_ = 1'b0;
  assign system_iBus_cmd_valid = _zz_44_;
  assign system_iBus_cmd_payload_wr = 1'b0;
  assign system_iBus_cmd_payload_address = _zz_45_[19:0];
  assign system_iBus_cmd_payload_data = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
  assign system_iBus_cmd_payload_mask = (4'bxxxx);
  always @ (*) begin
    case(_zz_50_)
      2'b00 : begin
        _zz_2_ = (4'b0001);
      end
      2'b01 : begin
        _zz_2_ = (4'b0011);
      end
      default : begin
        _zz_2_ = (4'b1111);
      end
    endcase
  end

  assign system_dBus_cmd_valid = _zz_46_;
  assign system_dBus_cmd_payload_wr = _zz_47_;
  assign system_dBus_cmd_payload_address = _zz_48_[19:0];
  assign system_dBus_cmd_payload_data = _zz_49_;
  assign system_dBus_cmd_payload_mask = (_zz_2_ <<< _zz_48_[1 : 0]);
  assign _zz_16_ = 1'b0;
  assign system_dBus_cmd_ready = _zz_51_;
  assign system_dBus_rsp_valid = _zz_52_;
  assign system_dBus_rsp_payload_data = _zz_53_;
  assign system_iBus_cmd_ready = _zz_64_;
  assign system_iBus_rsp_valid = _zz_65_;
  assign system_iBus_rsp_payload_data = _zz_66_;
  assign system_slowBus_cmd_ready = _zz_77_;
  assign system_slowBus_rsp_valid = system_slowBus_decoder_io_input_rsp_m2sPipe_valid;
  assign system_slowBus_rsp_payload_data = system_slowBus_decoder_io_input_rsp_m2sPipe_payload_data;
  assign system_slowBus_cmd_valid = _zz_144_;
  assign system_slowBus_cmd_payload_wr = _zz_145_;
  assign system_slowBus_cmd_payload_address = _zz_146_;
  assign system_slowBus_cmd_payload_data = _zz_147_;
  assign system_slowBus_cmd_payload_mask = _zz_148_;
  assign _zz_18_ = _zz_56_[15:0];
  assign system_dBus_decoder_io_outputs_1_cmd_halfPipe_valid = _zz_3_;
  assign system_dBus_decoder_io_outputs_1_cmd_halfPipe_payload_wr = _zz_5_;
  assign system_dBus_decoder_io_outputs_1_cmd_halfPipe_payload_address = _zz_6_;
  assign system_dBus_decoder_io_outputs_1_cmd_halfPipe_payload_data = _zz_7_;
  assign system_dBus_decoder_io_outputs_1_cmd_halfPipe_payload_mask = _zz_8_;
  assign system_dBus_decoder_io_outputs_1_cmd_halfPipe_ready = _zz_138_;
  assign _zz_20_ = _zz_69_[15:0];
  assign system_iBus_decoder_io_outputs_1_cmd_halfPipe_valid = _zz_9_;
  assign system_iBus_decoder_io_outputs_1_cmd_halfPipe_payload_wr = _zz_11_;
  assign system_iBus_decoder_io_outputs_1_cmd_halfPipe_payload_address = _zz_12_;
  assign system_iBus_decoder_io_outputs_1_cmd_halfPipe_payload_data = _zz_13_;
  assign system_iBus_decoder_io_outputs_1_cmd_halfPipe_payload_mask = _zz_14_;
  assign system_iBus_decoder_io_outputs_1_cmd_halfPipe_ready = _zz_141_;
  assign _zz_21_ = _zz_82_[15:0];
  assign _zz_19_ = _zz_87_[15:0];
  assign _zz_22_ = _zz_92_[5:0];
  assign _zz_23_ = _zz_97_[18:0];
  always @ (posedge io_clk) begin
    if(_zz_149_)begin
      resetCtrl_resetCounter <= (resetCtrl_resetCounter + (6'b000001));
    end
    if(_zz_24_)begin
      resetCtrl_resetCounter <= (6'b000000);
    end
  end

  always @ (posedge io_clk) begin
    resetCtrl_systemResetBuffered <= resetCtrl_resetUnbuffered;
  end

  always @ (posedge io_clk) begin
    if(_zz_25_) begin
      system_flashXip_io_flash_ss_regNext <= (1'b1);
      system_flashXip_io_flash_sclk_regNext <= 1'b0;
      system_slowBus_decoder_io_input_rsp_m2sPipe_valid <= 1'b0;
      _zz_3_ <= 1'b0;
      _zz_4_ <= 1'b1;
      _zz_9_ <= 1'b0;
      _zz_10_ <= 1'b1;
    end else begin
      system_flashXip_io_flash_ss_regNext <= _zz_43_;
      system_flashXip_io_flash_sclk_regNext <= _zz_41_;
      system_slowBus_decoder_io_input_rsp_m2sPipe_valid <= _zz_78_;
      if(_zz_150_)begin
        _zz_3_ <= _zz_59_;
        _zz_4_ <= (! _zz_59_);
      end else begin
        _zz_3_ <= (! system_dBus_decoder_io_outputs_1_cmd_halfPipe_ready);
        _zz_4_ <= system_dBus_decoder_io_outputs_1_cmd_halfPipe_ready;
      end
      if(_zz_151_)begin
        _zz_9_ <= _zz_72_;
        _zz_10_ <= (! _zz_72_);
      end else begin
        _zz_9_ <= (! system_iBus_decoder_io_outputs_1_cmd_halfPipe_ready);
        _zz_10_ <= system_iBus_decoder_io_outputs_1_cmd_halfPipe_ready;
      end
    end
  end

  always @ (posedge io_clk) begin
    system_flashXip_io_flash_mosi_regNext <= _zz_42_;
    if(_zz_78_)begin
      system_slowBus_decoder_io_input_rsp_m2sPipe_payload_data <= _zz_79_;
    end
    if(_zz_150_)begin
      _zz_5_ <= _zz_60_;
      _zz_6_ <= _zz_61_;
      _zz_7_ <= _zz_62_;
      _zz_8_ <= _zz_63_;
    end
    if(_zz_151_)begin
      _zz_11_ <= _zz_73_;
      _zz_12_ <= _zz_74_;
      _zz_13_ <= _zz_75_;
      _zz_14_ <= _zz_76_;
    end
  end

endmodule


// Generator : SpinalHDL v1.4.0    git head : ecb5a80b713566f417ea3ea061f9969e73770a7f
// Date      : 06/11/2020, 15:10:38
// Component : ExampleTop


`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define EnvCtrlEnum_defaultEncoding_type [0:0]
`define EnvCtrlEnum_defaultEncoding_NONE 1'b0
`define EnvCtrlEnum_defaultEncoding_XRET 1'b1

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define UartStopType_defaultEncoding_type [0:0]
`define UartStopType_defaultEncoding_ONE 1'b0
`define UartStopType_defaultEncoding_TWO 1'b1

`define UartParityType_defaultEncoding_type [1:0]
`define UartParityType_defaultEncoding_NONE 2'b00
`define UartParityType_defaultEncoding_EVEN 2'b01
`define UartParityType_defaultEncoding_ODD 2'b10

`define UartCtrlTxState_defaultEncoding_type [2:0]
`define UartCtrlTxState_defaultEncoding_IDLE 3'b000
`define UartCtrlTxState_defaultEncoding_START 3'b001
`define UartCtrlTxState_defaultEncoding_DATA 3'b010
`define UartCtrlTxState_defaultEncoding_PARITY 3'b011
`define UartCtrlTxState_defaultEncoding_STOP 3'b100

`define UartCtrlRxState_defaultEncoding_type [2:0]
`define UartCtrlRxState_defaultEncoding_IDLE 3'b000
`define UartCtrlRxState_defaultEncoding_START 3'b001
`define UartCtrlRxState_defaultEncoding_DATA 3'b010
`define UartCtrlRxState_defaultEncoding_PARITY 3'b011
`define UartCtrlRxState_defaultEncoding_STOP 3'b100


module BufferCC (
  input               io_initial,
  input               io_dataIn,
  output              io_dataOut,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  reg                 buffers_0;
  reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      buffers_0 <= io_initial;
      buffers_1 <= io_initial;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module StreamFifoLowLatency (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_error,
  input      [31:0]   io_push_payload_inst,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg          io_pop_payload_error,
  output reg [31:0]   io_pop_payload_inst,
  input               io_flush,
  output     [0:0]    io_occupancy,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire                _zz_StreamFifoLowLatency_4_;
  wire       [0:0]    _zz_StreamFifoLowLatency_5_;
  reg                 _zz_StreamFifoLowLatency_1_;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire       [32:0]   _zz_StreamFifoLowLatency_2_;
  reg        [32:0]   _zz_StreamFifoLowLatency_3_;

  assign _zz_StreamFifoLowLatency_4_ = (! empty);
  assign _zz_StreamFifoLowLatency_5_ = _zz_StreamFifoLowLatency_2_[0 : 0];
  always @ (*) begin
    _zz_StreamFifoLowLatency_1_ = 1'b0;
    if(pushing)begin
      _zz_StreamFifoLowLatency_1_ = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if(_zz_StreamFifoLowLatency_4_)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_StreamFifoLowLatency_2_ = _zz_StreamFifoLowLatency_3_;
  always @ (*) begin
    if(_zz_StreamFifoLowLatency_4_)begin
      io_pop_payload_error = _zz_StreamFifoLowLatency_5_[0];
    end else begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @ (*) begin
    if(_zz_StreamFifoLowLatency_4_)begin
      io_pop_payload_inst = _zz_StreamFifoLowLatency_2_[32 : 1];
    end else begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign io_occupancy = (risingOccupancy && ptrMatch);
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge clk_cpu) begin
    if(_zz_StreamFifoLowLatency_1_)begin
      _zz_StreamFifoLowLatency_3_ <= {io_push_payload_inst,io_push_payload_error};
    end
  end


endmodule

module UartCtrlTx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_defaultEncoding_type io_configFrame_stop,
  input      `UartParityType_defaultEncoding_type io_configFrame_parity,
  input               io_samplingTick,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  input               io_cts,
  output              io_txd,
  input               io_break,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire                _zz_UartCtrlTx_2_;
  wire       [0:0]    _zz_UartCtrlTx_3_;
  wire       [2:0]    _zz_UartCtrlTx_4_;
  wire       [0:0]    _zz_UartCtrlTx_5_;
  wire       [2:0]    _zz_UartCtrlTx_6_;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        `UartCtrlTxState_defaultEncoding_type stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  reg                 _zz_UartCtrlTx_1_;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_UartCtrlTx_2_ = (tickCounter_value == io_configFrame_dataLength);
  assign _zz_UartCtrlTx_3_ = clockDivider_counter_willIncrement;
  assign _zz_UartCtrlTx_4_ = {2'd0, _zz_UartCtrlTx_3_};
  assign _zz_UartCtrlTx_5_ = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? (1'b0) : (1'b1));
  assign _zz_UartCtrlTx_6_ = {2'd0, _zz_UartCtrlTx_5_};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlTxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlTxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlTxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlTxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @ (*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick)begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == (3'b111));
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @ (*) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_UartCtrlTx_4_);
    if(clockDivider_counter_willClear)begin
      clockDivider_counter_valueNext = (3'b000);
    end
  end

  always @ (*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        stateMachine_txd = 1'b0;
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_counter_willOverflow)begin
          if(_zz_UartCtrlTx_2_)begin
            io_write_ready = 1'b1;
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign io_txd = _zz_UartCtrlTx_1_;
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      clockDivider_counter_value <= (3'b000);
      stateMachine_state <= `UartCtrlTxState_defaultEncoding_IDLE;
      _zz_UartCtrlTx_1_ <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        `UartCtrlTxState_defaultEncoding_IDLE : begin
          if(((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow))begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_START;
          end
        end
        `UartCtrlTxState_defaultEncoding_START : begin
          if(clockDivider_counter_willOverflow)begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_DATA;
          end
        end
        `UartCtrlTxState_defaultEncoding_DATA : begin
          if(clockDivider_counter_willOverflow)begin
            if(_zz_UartCtrlTx_2_)begin
              if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
              end else begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlTxState_defaultEncoding_PARITY : begin
          if(clockDivider_counter_willOverflow)begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow)begin
            if((tickCounter_value == _zz_UartCtrlTx_6_))begin
              stateMachine_state <= (io_write_valid ? `UartCtrlTxState_defaultEncoding_START : `UartCtrlTxState_defaultEncoding_IDLE);
            end
          end
        end
      endcase
      _zz_UartCtrlTx_1_ <= (stateMachine_txd && (! io_break));
    end
  end

  always @ (posedge clk_cpu) begin
    if(clockDivider_counter_willOverflow)begin
      tickCounter_value <= (tickCounter_value + (3'b001));
    end
    if(clockDivider_counter_willOverflow)begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        if(clockDivider_counter_willOverflow)begin
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
          tickCounter_value <= (3'b000);
        end
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_counter_willOverflow)begin
          if(_zz_UartCtrlTx_2_)begin
            tickCounter_value <= (3'b000);
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        if(clockDivider_counter_willOverflow)begin
          tickCounter_value <= (3'b000);
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlRx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_defaultEncoding_type io_configFrame_stop,
  input      `UartParityType_defaultEncoding_type io_configFrame_parity,
  input               io_samplingTick,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  input               io_rxd,
  output              io_rts,
  output reg          io_error,
  output              io_break,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire                _zz_UartCtrlRx_2_;
  wire                io_rxd_buffercc_io_dataOut;
  wire                _zz_UartCtrlRx_3_;
  wire                _zz_UartCtrlRx_4_;
  wire                _zz_UartCtrlRx_5_;
  wire                _zz_UartCtrlRx_6_;
  wire       [0:0]    _zz_UartCtrlRx_7_;
  wire       [2:0]    _zz_UartCtrlRx_8_;
  wire                _zz_UartCtrlRx_9_;
  wire                _zz_UartCtrlRx_10_;
  wire                _zz_UartCtrlRx_11_;
  wire                _zz_UartCtrlRx_12_;
  wire                _zz_UartCtrlRx_13_;
  wire                _zz_UartCtrlRx_14_;
  wire                _zz_UartCtrlRx_15_;
  reg                 _zz_UartCtrlRx_1_;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_samples_3;
  reg                 sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  reg        `UartCtrlRxState_defaultEncoding_type stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_UartCtrlRx_3_ = (stateMachine_parity == sampler_value);
  assign _zz_UartCtrlRx_4_ = (! sampler_value);
  assign _zz_UartCtrlRx_5_ = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign _zz_UartCtrlRx_6_ = (bitCounter_value == io_configFrame_dataLength);
  assign _zz_UartCtrlRx_7_ = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? (1'b0) : (1'b1));
  assign _zz_UartCtrlRx_8_ = {2'd0, _zz_UartCtrlRx_7_};
  assign _zz_UartCtrlRx_9_ = ((((1'b0 || ((_zz_UartCtrlRx_14_ && sampler_samples_1) && sampler_samples_2)) || (((_zz_UartCtrlRx_15_ && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_UartCtrlRx_10_ = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_UartCtrlRx_11_ = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_UartCtrlRx_12_ = (1'b1 && sampler_samples_1);
  assign _zz_UartCtrlRx_13_ = 1'b1;
  assign _zz_UartCtrlRx_14_ = (1'b1 && sampler_samples_0);
  assign _zz_UartCtrlRx_15_ = 1'b1;
  BufferCC io_rxd_buffercc ( 
    .io_initial        (_zz_UartCtrlRx_2_           ), //i
    .io_dataIn         (io_rxd                      ), //i
    .io_dataOut        (io_rxd_buffercc_io_dataOut  ), //o
    .clk_cpu           (clk_cpu                     ), //i
    .clk_cpu_reset_    (clk_cpu_reset_              )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlRxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlRxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlRxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlRxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @ (*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlRxState_defaultEncoding_START : begin
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick)begin
          if(! _zz_UartCtrlRx_3_) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick)begin
          if(_zz_UartCtrlRx_4_)begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_UartCtrlRx_1_;
  assign _zz_UartCtrlRx_2_ = 1'b0;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @ (*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick)begin
      if((bitTimer_counter == (3'b000)))begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign break_valid = (break_counter == 7'h68);
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign io_read_payload = stateMachine_shifter;
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      _zz_UartCtrlRx_1_ <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_UartCtrlRx_1_ <= (! io_read_ready);
      if(io_samplingTick)begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick)begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick)begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick)begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_UartCtrlRx_9_ || _zz_UartCtrlRx_10_) || (_zz_UartCtrlRx_11_ && sampler_samples_4)) || ((_zz_UartCtrlRx_12_ && sampler_samples_2) && sampler_samples_4)) || (((_zz_UartCtrlRx_13_ && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      if(sampler_value)begin
        break_counter <= 7'h0;
      end else begin
        if((io_samplingTick && (! break_valid)))begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        `UartCtrlRxState_defaultEncoding_IDLE : begin
          if(_zz_UartCtrlRx_5_)begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_START;
          end
        end
        `UartCtrlRxState_defaultEncoding_START : begin
          if(bitTimer_tick)begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_DATA;
            if((sampler_value == 1'b1))begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_DATA : begin
          if(bitTimer_tick)begin
            if(_zz_UartCtrlRx_6_)begin
              if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_PARITY : begin
          if(bitTimer_tick)begin
            if(_zz_UartCtrlRx_3_)begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick)begin
            if(_zz_UartCtrlRx_4_)begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end else begin
              if((bitCounter_value == _zz_UartCtrlRx_8_))begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @ (posedge clk_cpu) begin
    if(sampler_tick)begin
      bitTimer_counter <= (bitTimer_counter - (3'b001));
    end
    if(bitTimer_tick)begin
      bitCounter_value <= (bitCounter_value + (3'b001));
    end
    if(bitTimer_tick)begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
        if(_zz_UartCtrlRx_5_)begin
          bitTimer_counter <= (3'b010);
        end
      end
      `UartCtrlRxState_defaultEncoding_START : begin
        if(bitTimer_tick)begin
          bitCounter_value <= (3'b000);
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
        end
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
        if(bitTimer_tick)begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(_zz_UartCtrlRx_6_)begin
            bitCounter_value <= (3'b000);
          end
        end
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick)begin
          bitCounter_value <= (3'b000);
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module CCMasterArbiter (
  input               io_iBus_cmd_valid,
  output reg          io_iBus_cmd_ready,
  input      [31:0]   io_iBus_cmd_payload_pc,
  output              io_iBus_rsp_valid,
  output              io_iBus_rsp_payload_error,
  output     [31:0]   io_iBus_rsp_payload_inst,
  input               io_dBus_cmd_valid,
  output reg          io_dBus_cmd_ready,
  input               io_dBus_cmd_payload_wr,
  input      [31:0]   io_dBus_cmd_payload_address,
  input      [31:0]   io_dBus_cmd_payload_data,
  input      [1:0]    io_dBus_cmd_payload_size,
  output              io_dBus_rsp_ready,
  output              io_dBus_rsp_error,
  output     [31:0]   io_dBus_rsp_data,
  output reg          io_masterBus_cmd_valid,
  input               io_masterBus_cmd_ready,
  output              io_masterBus_cmd_payload_write,
  output     [31:0]   io_masterBus_cmd_payload_address,
  output     [31:0]   io_masterBus_cmd_payload_data,
  output     [3:0]    io_masterBus_cmd_payload_mask,
  input               io_masterBus_rsp_valid,
  input      [31:0]   io_masterBus_rsp_payload_data,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire                _zz_CCMasterArbiter_2_;
  reg        [3:0]    _zz_CCMasterArbiter_1_;
  reg                 rspPending;
  reg                 rspTarget;

  assign _zz_CCMasterArbiter_2_ = (rspPending && (! io_masterBus_rsp_valid));
  always @ (*) begin
    io_masterBus_cmd_valid = (io_iBus_cmd_valid || io_dBus_cmd_valid);
    if(_zz_CCMasterArbiter_2_)begin
      io_masterBus_cmd_valid = 1'b0;
    end
  end

  assign io_masterBus_cmd_payload_write = (io_dBus_cmd_valid && io_dBus_cmd_payload_wr);
  assign io_masterBus_cmd_payload_address = (io_dBus_cmd_valid ? io_dBus_cmd_payload_address : io_iBus_cmd_payload_pc);
  assign io_masterBus_cmd_payload_data = io_dBus_cmd_payload_data;
  always @ (*) begin
    case(io_dBus_cmd_payload_size)
      2'b00 : begin
        _zz_CCMasterArbiter_1_ = (4'b0001);
      end
      2'b01 : begin
        _zz_CCMasterArbiter_1_ = (4'b0011);
      end
      default : begin
        _zz_CCMasterArbiter_1_ = (4'b1111);
      end
    endcase
  end

  assign io_masterBus_cmd_payload_mask = (_zz_CCMasterArbiter_1_ <<< io_dBus_cmd_payload_address[1 : 0]);
  always @ (*) begin
    io_iBus_cmd_ready = (io_masterBus_cmd_ready && (! io_dBus_cmd_valid));
    if(_zz_CCMasterArbiter_2_)begin
      io_iBus_cmd_ready = 1'b0;
    end
  end

  always @ (*) begin
    io_dBus_cmd_ready = io_masterBus_cmd_ready;
    if(_zz_CCMasterArbiter_2_)begin
      io_dBus_cmd_ready = 1'b0;
    end
  end

  assign io_iBus_rsp_valid = (io_masterBus_rsp_valid && (! rspTarget));
  assign io_iBus_rsp_payload_inst = io_masterBus_rsp_payload_data;
  assign io_iBus_rsp_payload_error = 1'b0;
  assign io_dBus_rsp_ready = (io_masterBus_rsp_valid && rspTarget);
  assign io_dBus_rsp_data = io_masterBus_rsp_payload_data;
  assign io_dBus_rsp_error = 1'b0;
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      rspPending <= 1'b0;
      rspTarget <= 1'b0;
    end else begin
      if(io_masterBus_rsp_valid)begin
        rspPending <= 1'b0;
      end
      if(((io_masterBus_cmd_valid && io_masterBus_cmd_ready) && (! io_masterBus_cmd_payload_write)))begin
        rspTarget <= io_dBus_cmd_valid;
        rspPending <= 1'b1;
      end
    end
  end


endmodule

module VexRiscv (
  output              iBus_cmd_valid,
  input               iBus_cmd_ready,
  output     [31:0]   iBus_cmd_payload_pc,
  input               iBus_rsp_valid,
  input               iBus_rsp_payload_error,
  input      [31:0]   iBus_rsp_payload_inst,
  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt,
  output              dBus_cmd_valid,
  input               dBus_cmd_ready,
  output              dBus_cmd_payload_wr,
  output     [31:0]   dBus_cmd_payload_address,
  output     [31:0]   dBus_cmd_payload_data,
  output     [1:0]    dBus_cmd_payload_size,
  input               dBus_rsp_ready,
  input               dBus_rsp_error,
  input      [31:0]   dBus_rsp_data,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire                _zz_VexRiscv_161_;
  wire                _zz_VexRiscv_162_;
  reg        [31:0]   _zz_VexRiscv_163_;
  reg        [31:0]   _zz_VexRiscv_164_;
  reg        [31:0]   _zz_VexRiscv_165_;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire                _zz_VexRiscv_166_;
  wire                _zz_VexRiscv_167_;
  wire                _zz_VexRiscv_168_;
  wire                _zz_VexRiscv_169_;
  wire                _zz_VexRiscv_170_;
  wire                _zz_VexRiscv_171_;
  wire                _zz_VexRiscv_172_;
  wire       [1:0]    _zz_VexRiscv_173_;
  wire                _zz_VexRiscv_174_;
  wire       [1:0]    _zz_VexRiscv_175_;
  wire                _zz_VexRiscv_176_;
  wire                _zz_VexRiscv_177_;
  wire                _zz_VexRiscv_178_;
  wire                _zz_VexRiscv_179_;
  wire                _zz_VexRiscv_180_;
  wire                _zz_VexRiscv_181_;
  wire                _zz_VexRiscv_182_;
  wire                _zz_VexRiscv_183_;
  wire                _zz_VexRiscv_184_;
  wire                _zz_VexRiscv_185_;
  wire                _zz_VexRiscv_186_;
  wire       [4:0]    _zz_VexRiscv_187_;
  wire       [1:0]    _zz_VexRiscv_188_;
  wire       [1:0]    _zz_VexRiscv_189_;
  wire       [1:0]    _zz_VexRiscv_190_;
  wire                _zz_VexRiscv_191_;
  wire       [1:0]    _zz_VexRiscv_192_;
  wire       [0:0]    _zz_VexRiscv_193_;
  wire       [32:0]   _zz_VexRiscv_194_;
  wire       [31:0]   _zz_VexRiscv_195_;
  wire       [32:0]   _zz_VexRiscv_196_;
  wire       [0:0]    _zz_VexRiscv_197_;
  wire       [0:0]    _zz_VexRiscv_198_;
  wire       [0:0]    _zz_VexRiscv_199_;
  wire       [2:0]    _zz_VexRiscv_200_;
  wire       [31:0]   _zz_VexRiscv_201_;
  wire       [0:0]    _zz_VexRiscv_202_;
  wire       [0:0]    _zz_VexRiscv_203_;
  wire       [51:0]   _zz_VexRiscv_204_;
  wire       [51:0]   _zz_VexRiscv_205_;
  wire       [51:0]   _zz_VexRiscv_206_;
  wire       [32:0]   _zz_VexRiscv_207_;
  wire       [51:0]   _zz_VexRiscv_208_;
  wire       [49:0]   _zz_VexRiscv_209_;
  wire       [51:0]   _zz_VexRiscv_210_;
  wire       [49:0]   _zz_VexRiscv_211_;
  wire       [51:0]   _zz_VexRiscv_212_;
  wire       [0:0]    _zz_VexRiscv_213_;
  wire       [0:0]    _zz_VexRiscv_214_;
  wire       [0:0]    _zz_VexRiscv_215_;
  wire       [0:0]    _zz_VexRiscv_216_;
  wire       [0:0]    _zz_VexRiscv_217_;
  wire       [0:0]    _zz_VexRiscv_218_;
  wire       [2:0]    _zz_VexRiscv_219_;
  wire       [2:0]    _zz_VexRiscv_220_;
  wire       [31:0]   _zz_VexRiscv_221_;
  wire       [2:0]    _zz_VexRiscv_222_;
  wire       [31:0]   _zz_VexRiscv_223_;
  wire       [31:0]   _zz_VexRiscv_224_;
  wire       [11:0]   _zz_VexRiscv_225_;
  wire       [11:0]   _zz_VexRiscv_226_;
  wire       [11:0]   _zz_VexRiscv_227_;
  wire       [31:0]   _zz_VexRiscv_228_;
  wire       [19:0]   _zz_VexRiscv_229_;
  wire       [11:0]   _zz_VexRiscv_230_;
  wire       [2:0]    _zz_VexRiscv_231_;
  wire       [0:0]    _zz_VexRiscv_232_;
  wire       [2:0]    _zz_VexRiscv_233_;
  wire       [0:0]    _zz_VexRiscv_234_;
  wire       [2:0]    _zz_VexRiscv_235_;
  wire       [0:0]    _zz_VexRiscv_236_;
  wire       [2:0]    _zz_VexRiscv_237_;
  wire       [0:0]    _zz_VexRiscv_238_;
  wire       [65:0]   _zz_VexRiscv_239_;
  wire       [65:0]   _zz_VexRiscv_240_;
  wire       [31:0]   _zz_VexRiscv_241_;
  wire       [31:0]   _zz_VexRiscv_242_;
  wire       [2:0]    _zz_VexRiscv_243_;
  wire       [4:0]    _zz_VexRiscv_244_;
  wire       [11:0]   _zz_VexRiscv_245_;
  wire       [11:0]   _zz_VexRiscv_246_;
  wire       [31:0]   _zz_VexRiscv_247_;
  wire       [31:0]   _zz_VexRiscv_248_;
  wire       [31:0]   _zz_VexRiscv_249_;
  wire       [31:0]   _zz_VexRiscv_250_;
  wire       [31:0]   _zz_VexRiscv_251_;
  wire       [31:0]   _zz_VexRiscv_252_;
  wire       [31:0]   _zz_VexRiscv_253_;
  wire       [11:0]   _zz_VexRiscv_254_;
  wire       [19:0]   _zz_VexRiscv_255_;
  wire       [11:0]   _zz_VexRiscv_256_;
  wire       [2:0]    _zz_VexRiscv_257_;
  wire       [0:0]    _zz_VexRiscv_258_;
  wire       [0:0]    _zz_VexRiscv_259_;
  wire       [0:0]    _zz_VexRiscv_260_;
  wire       [0:0]    _zz_VexRiscv_261_;
  wire       [0:0]    _zz_VexRiscv_262_;
  wire       [0:0]    _zz_VexRiscv_263_;
  wire                _zz_VexRiscv_264_;
  wire                _zz_VexRiscv_265_;
  wire       [1:0]    _zz_VexRiscv_266_;
  wire                _zz_VexRiscv_267_;
  wire                _zz_VexRiscv_268_;
  wire       [6:0]    _zz_VexRiscv_269_;
  wire       [4:0]    _zz_VexRiscv_270_;
  wire                _zz_VexRiscv_271_;
  wire       [4:0]    _zz_VexRiscv_272_;
  wire       [0:0]    _zz_VexRiscv_273_;
  wire       [7:0]    _zz_VexRiscv_274_;
  wire                _zz_VexRiscv_275_;
  wire       [0:0]    _zz_VexRiscv_276_;
  wire       [0:0]    _zz_VexRiscv_277_;
  wire       [31:0]   _zz_VexRiscv_278_;
  wire       [31:0]   _zz_VexRiscv_279_;
  wire       [31:0]   _zz_VexRiscv_280_;
  wire       [0:0]    _zz_VexRiscv_281_;
  wire       [4:0]    _zz_VexRiscv_282_;
  wire       [4:0]    _zz_VexRiscv_283_;
  wire       [4:0]    _zz_VexRiscv_284_;
  wire                _zz_VexRiscv_285_;
  wire       [0:0]    _zz_VexRiscv_286_;
  wire       [19:0]   _zz_VexRiscv_287_;
  wire       [31:0]   _zz_VexRiscv_288_;
  wire       [31:0]   _zz_VexRiscv_289_;
  wire                _zz_VexRiscv_290_;
  wire       [0:0]    _zz_VexRiscv_291_;
  wire       [1:0]    _zz_VexRiscv_292_;
  wire                _zz_VexRiscv_293_;
  wire       [0:0]    _zz_VexRiscv_294_;
  wire       [1:0]    _zz_VexRiscv_295_;
  wire       [31:0]   _zz_VexRiscv_296_;
  wire       [31:0]   _zz_VexRiscv_297_;
  wire                _zz_VexRiscv_298_;
  wire       [0:0]    _zz_VexRiscv_299_;
  wire       [0:0]    _zz_VexRiscv_300_;
  wire                _zz_VexRiscv_301_;
  wire       [0:0]    _zz_VexRiscv_302_;
  wire       [16:0]   _zz_VexRiscv_303_;
  wire       [31:0]   _zz_VexRiscv_304_;
  wire       [31:0]   _zz_VexRiscv_305_;
  wire       [31:0]   _zz_VexRiscv_306_;
  wire                _zz_VexRiscv_307_;
  wire                _zz_VexRiscv_308_;
  wire       [31:0]   _zz_VexRiscv_309_;
  wire       [31:0]   _zz_VexRiscv_310_;
  wire       [31:0]   _zz_VexRiscv_311_;
  wire                _zz_VexRiscv_312_;
  wire                _zz_VexRiscv_313_;
  wire       [31:0]   _zz_VexRiscv_314_;
  wire       [0:0]    _zz_VexRiscv_315_;
  wire       [2:0]    _zz_VexRiscv_316_;
  wire       [1:0]    _zz_VexRiscv_317_;
  wire       [1:0]    _zz_VexRiscv_318_;
  wire                _zz_VexRiscv_319_;
  wire       [0:0]    _zz_VexRiscv_320_;
  wire       [14:0]   _zz_VexRiscv_321_;
  wire       [31:0]   _zz_VexRiscv_322_;
  wire       [31:0]   _zz_VexRiscv_323_;
  wire       [31:0]   _zz_VexRiscv_324_;
  wire       [31:0]   _zz_VexRiscv_325_;
  wire       [31:0]   _zz_VexRiscv_326_;
  wire       [31:0]   _zz_VexRiscv_327_;
  wire       [0:0]    _zz_VexRiscv_328_;
  wire       [0:0]    _zz_VexRiscv_329_;
  wire                _zz_VexRiscv_330_;
  wire                _zz_VexRiscv_331_;
  wire       [0:0]    _zz_VexRiscv_332_;
  wire       [0:0]    _zz_VexRiscv_333_;
  wire       [0:0]    _zz_VexRiscv_334_;
  wire       [0:0]    _zz_VexRiscv_335_;
  wire                _zz_VexRiscv_336_;
  wire       [0:0]    _zz_VexRiscv_337_;
  wire       [12:0]   _zz_VexRiscv_338_;
  wire       [31:0]   _zz_VexRiscv_339_;
  wire       [31:0]   _zz_VexRiscv_340_;
  wire       [31:0]   _zz_VexRiscv_341_;
  wire       [31:0]   _zz_VexRiscv_342_;
  wire       [31:0]   _zz_VexRiscv_343_;
  wire       [31:0]   _zz_VexRiscv_344_;
  wire       [31:0]   _zz_VexRiscv_345_;
  wire       [31:0]   _zz_VexRiscv_346_;
  wire       [31:0]   _zz_VexRiscv_347_;
  wire       [31:0]   _zz_VexRiscv_348_;
  wire       [0:0]    _zz_VexRiscv_349_;
  wire       [0:0]    _zz_VexRiscv_350_;
  wire       [1:0]    _zz_VexRiscv_351_;
  wire       [1:0]    _zz_VexRiscv_352_;
  wire                _zz_VexRiscv_353_;
  wire       [0:0]    _zz_VexRiscv_354_;
  wire       [10:0]   _zz_VexRiscv_355_;
  wire       [31:0]   _zz_VexRiscv_356_;
  wire       [31:0]   _zz_VexRiscv_357_;
  wire       [31:0]   _zz_VexRiscv_358_;
  wire       [31:0]   _zz_VexRiscv_359_;
  wire                _zz_VexRiscv_360_;
  wire                _zz_VexRiscv_361_;
  wire       [2:0]    _zz_VexRiscv_362_;
  wire       [2:0]    _zz_VexRiscv_363_;
  wire                _zz_VexRiscv_364_;
  wire       [0:0]    _zz_VexRiscv_365_;
  wire       [7:0]    _zz_VexRiscv_366_;
  wire       [31:0]   _zz_VexRiscv_367_;
  wire       [31:0]   _zz_VexRiscv_368_;
  wire                _zz_VexRiscv_369_;
  wire                _zz_VexRiscv_370_;
  wire                _zz_VexRiscv_371_;
  wire       [0:0]    _zz_VexRiscv_372_;
  wire       [1:0]    _zz_VexRiscv_373_;
  wire                _zz_VexRiscv_374_;
  wire       [0:0]    _zz_VexRiscv_375_;
  wire       [0:0]    _zz_VexRiscv_376_;
  wire                _zz_VexRiscv_377_;
  wire       [0:0]    _zz_VexRiscv_378_;
  wire       [4:0]    _zz_VexRiscv_379_;
  wire       [31:0]   _zz_VexRiscv_380_;
  wire       [31:0]   _zz_VexRiscv_381_;
  wire       [31:0]   _zz_VexRiscv_382_;
  wire       [31:0]   _zz_VexRiscv_383_;
  wire       [31:0]   _zz_VexRiscv_384_;
  wire                _zz_VexRiscv_385_;
  wire       [31:0]   _zz_VexRiscv_386_;
  wire       [31:0]   _zz_VexRiscv_387_;
  wire       [31:0]   _zz_VexRiscv_388_;
  wire       [0:0]    _zz_VexRiscv_389_;
  wire       [0:0]    _zz_VexRiscv_390_;
  wire       [1:0]    _zz_VexRiscv_391_;
  wire       [1:0]    _zz_VexRiscv_392_;
  wire                _zz_VexRiscv_393_;
  wire       [0:0]    _zz_VexRiscv_394_;
  wire       [2:0]    _zz_VexRiscv_395_;
  wire       [31:0]   _zz_VexRiscv_396_;
  wire       [31:0]   _zz_VexRiscv_397_;
  wire       [31:0]   _zz_VexRiscv_398_;
  wire       [31:0]   _zz_VexRiscv_399_;
  wire                _zz_VexRiscv_400_;
  wire                _zz_VexRiscv_401_;
  wire       [2:0]    _zz_VexRiscv_402_;
  wire       [2:0]    _zz_VexRiscv_403_;
  wire                _zz_VexRiscv_404_;
  wire                _zz_VexRiscv_405_;
  wire       [31:0]   _zz_VexRiscv_406_;
  wire       [31:0]   _zz_VexRiscv_407_;
  wire       [31:0]   _zz_VexRiscv_408_;
  wire       [31:0]   _zz_VexRiscv_409_;
  wire       [31:0]   _zz_VexRiscv_410_;
  wire       [31:0]   _zz_VexRiscv_411_;
  wire       [31:0]   _zz_VexRiscv_412_;
  wire       [31:0]   _zz_VexRiscv_413_;
  wire       [31:0]   _zz_VexRiscv_414_;
  wire       [31:0]   _zz_VexRiscv_415_;
  wire                _zz_VexRiscv_416_;
  wire                _zz_VexRiscv_417_;
  wire                _zz_VexRiscv_418_;
  wire                decode_IS_CSR;
  wire                decode_CSR_WRITE_OPCODE;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_1_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_2_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_3_;
  wire       [31:0]   memory_PC;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       [31:0]   execute_BRANCH_CALC;
  wire       [31:0]   decode_SRC2;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_4_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_5_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_6_;
  wire                decode_CSR_READ_OPCODE;
  wire       [33:0]   execute_MUL_HL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_7_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_8_;
  wire                execute_BRANCH_DO;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_9_;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_10_;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_11_;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_12_;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_13_;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_14_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_15_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_16_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_17_;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_18_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_19_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_20_;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [31:0]   execute_MUL_LL;
  wire                decode_MEMORY_ENABLE;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire                decode_MEMORY_STORE;
  wire       [31:0]   decode_SRC1;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire       [51:0]   memory_MUL_LOW;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire                execute_IS_RVC;
  wire       [31:0]   execute_PC;
  wire                execute_BRANCH_COND_RESULT;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_21_;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_VexRiscv_22_;
  wire       `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_23_;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_24_;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_VexRiscv_25_;
  wire       [31:0]   _zz_VexRiscv_26_;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_VexRiscv_27_;
  wire       [31:0]   _zz_VexRiscv_28_;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_VexRiscv_29_;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  (* syn_keep , keep *) wire       [31:0]   execute_RS1 /* synthesis syn_keep = 1 */ ;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_30_;
  wire       [31:0]   execute_SRC2;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_31_;
  wire       [31:0]   _zz_VexRiscv_32_;
  wire                _zz_VexRiscv_33_;
  reg                 _zz_VexRiscv_34_;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_35_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_36_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_37_;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_VexRiscv_38_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_39_;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_VexRiscv_40_;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_41_;
  reg        [31:0]   _zz_VexRiscv_42_;
  wire       [31:0]   execute_SRC1;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_43_;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_44_;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_45_;
  wire                writeBack_MEMORY_STORE;
  reg        [31:0]   _zz_VexRiscv_46_;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  (* syn_keep , keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_47_;
  reg        [31:0]   _zz_VexRiscv_48_;
  reg        [31:0]   _zz_VexRiscv_49_;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire                decode_IS_RVC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  wire                decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  wire                decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  wire                execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  wire                execute_arbitration_flushIt;
  wire                execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusSimplePlugin_fetcherHalt;
  reg                 IBusSimplePlugin_incomingInstruction;
  wire                IBusSimplePlugin_predictionJumpInterface_valid;
  (* syn_keep , keep *) wire       [31:0]   IBusSimplePlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  wire                IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  wire                IBusSimplePlugin_decodePrediction_rsp_wasWrong;
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  wire                CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  wire                CsrPlugin_forceMachineWire;
  wire                CsrPlugin_allowInterrupts;
  wire                CsrPlugin_allowException;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [2:0]    _zz_VexRiscv_50_;
  wire       [2:0]    _zz_VexRiscv_51_;
  wire                _zz_VexRiscv_52_;
  wire                _zz_VexRiscv_53_;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  reg                 IBusSimplePlugin_decodePc_flushed;
  reg        [31:0]   IBusSimplePlugin_decodePc_pcReg /* verilator public */ ;
  wire       [31:0]   IBusSimplePlugin_decodePc_pcPlus;
  wire                IBusSimplePlugin_decodePc_injectedDecode;
  wire                IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_2_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_2_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_2_halt;
  wire                _zz_VexRiscv_54_;
  wire                _zz_VexRiscv_55_;
  wire                _zz_VexRiscv_56_;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_VexRiscv_57_;
  wire                _zz_VexRiscv_58_;
  reg                 _zz_VexRiscv_59_;
  wire                _zz_VexRiscv_60_;
  reg                 _zz_VexRiscv_61_;
  reg        [31:0]   _zz_VexRiscv_62_;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_input_valid;
  wire                IBusSimplePlugin_decompressor_input_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_pc;
  wire                IBusSimplePlugin_decompressor_input_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_input_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_output_valid;
  wire                IBusSimplePlugin_decompressor_output_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_pc;
  wire                IBusSimplePlugin_decompressor_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_output_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_flushNext;
  wire                IBusSimplePlugin_decompressor_consumeCurrent;
  reg                 IBusSimplePlugin_decompressor_bufferValid;
  reg        [15:0]   IBusSimplePlugin_decompressor_bufferData;
  wire                IBusSimplePlugin_decompressor_isInputLowRvc;
  wire                IBusSimplePlugin_decompressor_isInputHighRvc;
  reg                 IBusSimplePlugin_decompressor_throw2BytesReg;
  wire                IBusSimplePlugin_decompressor_throw2Bytes;
  wire                IBusSimplePlugin_decompressor_unaligned;
  wire       [31:0]   IBusSimplePlugin_decompressor_raw;
  wire                IBusSimplePlugin_decompressor_isRvc;
  wire       [15:0]   _zz_VexRiscv_63_;
  reg        [31:0]   IBusSimplePlugin_decompressor_decompressed;
  wire       [4:0]    _zz_VexRiscv_64_;
  wire       [4:0]    _zz_VexRiscv_65_;
  wire       [11:0]   _zz_VexRiscv_66_;
  wire                _zz_VexRiscv_67_;
  reg        [11:0]   _zz_VexRiscv_68_;
  wire                _zz_VexRiscv_69_;
  reg        [9:0]    _zz_VexRiscv_70_;
  wire       [20:0]   _zz_VexRiscv_71_;
  wire                _zz_VexRiscv_72_;
  reg        [14:0]   _zz_VexRiscv_73_;
  wire                _zz_VexRiscv_74_;
  reg        [2:0]    _zz_VexRiscv_75_;
  wire                _zz_VexRiscv_76_;
  reg        [9:0]    _zz_VexRiscv_77_;
  wire       [20:0]   _zz_VexRiscv_78_;
  wire                _zz_VexRiscv_79_;
  reg        [4:0]    _zz_VexRiscv_80_;
  wire       [12:0]   _zz_VexRiscv_81_;
  wire       [4:0]    _zz_VexRiscv_82_;
  wire       [4:0]    _zz_VexRiscv_83_;
  wire       [4:0]    _zz_VexRiscv_84_;
  wire                _zz_VexRiscv_85_;
  reg        [2:0]    _zz_VexRiscv_86_;
  reg        [2:0]    _zz_VexRiscv_87_;
  wire                _zz_VexRiscv_88_;
  reg        [6:0]    _zz_VexRiscv_89_;
  wire                IBusSimplePlugin_decompressor_bufferFill;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_VexRiscv_90_;
  reg        [31:0]   _zz_VexRiscv_91_;
  reg                 _zz_VexRiscv_92_;
  reg        [31:0]   _zz_VexRiscv_93_;
  reg                 _zz_VexRiscv_94_;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                _zz_VexRiscv_95_;
  reg        [18:0]   _zz_VexRiscv_96_;
  wire                _zz_VexRiscv_97_;
  reg        [10:0]   _zz_VexRiscv_98_;
  wire                _zz_VexRiscv_99_;
  reg        [18:0]   _zz_VexRiscv_100_;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire                IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                _zz_VexRiscv_101_;
  wire                _zz_VexRiscv_102_;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_VexRiscv_103_;
  reg        [3:0]    _zz_VexRiscv_104_;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire                _zz_VexRiscv_105_;
  reg        [31:0]   _zz_VexRiscv_106_;
  wire                _zz_VexRiscv_107_;
  reg        [31:0]   _zz_VexRiscv_108_;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  wire       [1:0]    CsrPlugin_mtvec_mode;
  wire       [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg        [31:0]   CsrPlugin_mscratch;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg        [63:0]   CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire                _zz_VexRiscv_109_;
  wire                _zz_VexRiscv_110_;
  wire                _zz_VexRiscv_111_;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException;
  wire       [1:0]    CsrPlugin_targetPrivilege;
  wire       [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  reg                 execute_CsrPlugin_wfiWake;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire       [31:0]   execute_CsrPlugin_readData;
  wire                execute_CsrPlugin_writeInstruction;
  wire                execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  reg        [31:0]   execute_CsrPlugin_writeData;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  wire       [25:0]   _zz_VexRiscv_112_;
  wire                _zz_VexRiscv_113_;
  wire                _zz_VexRiscv_114_;
  wire                _zz_VexRiscv_115_;
  wire                _zz_VexRiscv_116_;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_117_;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_VexRiscv_118_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_119_;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_VexRiscv_120_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_121_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_122_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_123_;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  wire       [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  wire       [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_VexRiscv_124_;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_VexRiscv_125_;
  reg                 execute_MulPlugin_aSigned;
  reg                 execute_MulPlugin_bSigned;
  wire       [31:0]   execute_MulPlugin_a;
  wire       [31:0]   execute_MulPlugin_b;
  wire       [15:0]   execute_MulPlugin_aULow;
  wire       [15:0]   execute_MulPlugin_bULow;
  wire       [16:0]   execute_MulPlugin_aSLow;
  wire       [16:0]   execute_MulPlugin_bSLow;
  wire       [16:0]   execute_MulPlugin_aHigh;
  wire       [16:0]   execute_MulPlugin_bHigh;
  wire       [65:0]   writeBack_MulPlugin_result;
  reg        [31:0]   _zz_VexRiscv_126_;
  wire                _zz_VexRiscv_127_;
  reg        [19:0]   _zz_VexRiscv_128_;
  wire                _zz_VexRiscv_129_;
  reg        [19:0]   _zz_VexRiscv_130_;
  reg        [31:0]   _zz_VexRiscv_131_;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_VexRiscv_132_;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_VexRiscv_133_;
  reg                 _zz_VexRiscv_134_;
  reg                 _zz_VexRiscv_135_;
  reg                 _zz_VexRiscv_136_;
  reg        [4:0]    _zz_VexRiscv_137_;
  reg        [31:0]   _zz_VexRiscv_138_;
  wire                _zz_VexRiscv_139_;
  wire                _zz_VexRiscv_140_;
  wire                _zz_VexRiscv_141_;
  wire                _zz_VexRiscv_142_;
  wire                _zz_VexRiscv_143_;
  wire                _zz_VexRiscv_144_;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_VexRiscv_145_;
  reg                 _zz_VexRiscv_146_;
  reg                 _zz_VexRiscv_147_;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_VexRiscv_148_;
  reg        [19:0]   _zz_VexRiscv_149_;
  wire                _zz_VexRiscv_150_;
  reg        [10:0]   _zz_VexRiscv_151_;
  wire                _zz_VexRiscv_152_;
  reg        [18:0]   _zz_VexRiscv_153_;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg        [31:0]   decode_to_execute_SRC1;
  reg                 decode_to_execute_MEMORY_STORE;
  reg                 execute_to_memory_MEMORY_STORE;
  reg                 memory_to_writeBack_MEMORY_STORE;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  reg        [33:0]   execute_to_memory_MUL_LH;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  reg        [31:0]   execute_to_memory_MUL_LL;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg                 execute_to_memory_BRANCH_DO;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg        [33:0]   execute_to_memory_MUL_HL;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg                 decode_to_execute_IS_MUL;
  reg                 execute_to_memory_IS_MUL;
  reg                 memory_to_writeBack_IS_MUL;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        [31:0]   decode_to_execute_SRC2;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg                 decode_to_execute_IS_RVC;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg        [33:0]   execute_to_memory_MUL_HH;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  reg        [31:0]   decode_to_execute_RS2;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  reg        [31:0]   decode_to_execute_RS1;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_IS_CSR;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_832;
  reg                 execute_CsrPlugin_csr_834;
  reg                 execute_CsrPlugin_csr_3072;
  reg                 execute_CsrPlugin_csr_3200;
  reg        [31:0]   _zz_VexRiscv_154_;
  reg        [31:0]   _zz_VexRiscv_155_;
  reg        [31:0]   _zz_VexRiscv_156_;
  reg        [31:0]   _zz_VexRiscv_157_;
  reg        [31:0]   _zz_VexRiscv_158_;
  reg        [31:0]   _zz_VexRiscv_159_;
  reg        [31:0]   _zz_VexRiscv_160_;
  `ifndef SYNTHESIS
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_VexRiscv_1__string;
  reg [39:0] _zz_VexRiscv_2__string;
  reg [39:0] _zz_VexRiscv_3__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_VexRiscv_4__string;
  reg [63:0] _zz_VexRiscv_5__string;
  reg [63:0] _zz_VexRiscv_6__string;
  reg [31:0] _zz_VexRiscv_7__string;
  reg [31:0] _zz_VexRiscv_8__string;
  reg [71:0] _zz_VexRiscv_9__string;
  reg [71:0] _zz_VexRiscv_10__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_VexRiscv_11__string;
  reg [71:0] _zz_VexRiscv_12__string;
  reg [71:0] _zz_VexRiscv_13__string;
  reg [31:0] _zz_VexRiscv_14__string;
  reg [31:0] _zz_VexRiscv_15__string;
  reg [31:0] _zz_VexRiscv_16__string;
  reg [31:0] _zz_VexRiscv_17__string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_VexRiscv_18__string;
  reg [31:0] _zz_VexRiscv_19__string;
  reg [31:0] _zz_VexRiscv_20__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_VexRiscv_21__string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_VexRiscv_23__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_VexRiscv_24__string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_VexRiscv_27__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_VexRiscv_29__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_VexRiscv_30__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_VexRiscv_31__string;
  reg [39:0] _zz_VexRiscv_35__string;
  reg [63:0] _zz_VexRiscv_36__string;
  reg [31:0] _zz_VexRiscv_37__string;
  reg [23:0] _zz_VexRiscv_38__string;
  reg [31:0] _zz_VexRiscv_39__string;
  reg [95:0] _zz_VexRiscv_40__string;
  reg [71:0] _zz_VexRiscv_41__string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_VexRiscv_43__string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_VexRiscv_44__string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_VexRiscv_45__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_VexRiscv_47__string;
  reg [71:0] _zz_VexRiscv_117__string;
  reg [95:0] _zz_VexRiscv_118__string;
  reg [31:0] _zz_VexRiscv_119__string;
  reg [23:0] _zz_VexRiscv_120__string;
  reg [31:0] _zz_VexRiscv_121__string;
  reg [63:0] _zz_VexRiscv_122__string;
  reg [39:0] _zz_VexRiscv_123__string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_VexRiscv_166_ = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_167_ = 1'b1;
  assign _zz_VexRiscv_168_ = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_169_ = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_170_ = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_VexRiscv_171_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_VexRiscv_172_ = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_VexRiscv_173_ = writeBack_INSTRUCTION[29 : 28];
  assign _zz_VexRiscv_174_ = (IBusSimplePlugin_jump_pcLoad_valid && ((! decode_arbitration_isStuck) || decode_arbitration_removeIt));
  assign _zz_VexRiscv_175_ = execute_INSTRUCTION[13 : 12];
  assign _zz_VexRiscv_176_ = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_177_ = (1'b0 || (! 1'b1));
  assign _zz_VexRiscv_178_ = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_179_ = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_VexRiscv_180_ = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_181_ = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_VexRiscv_182_ = (IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid);
  assign _zz_VexRiscv_183_ = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < (2'b11)));
  assign _zz_VexRiscv_184_ = ((_zz_VexRiscv_109_ && 1'b1) && (! 1'b0));
  assign _zz_VexRiscv_185_ = ((_zz_VexRiscv_110_ && 1'b1) && (! 1'b0));
  assign _zz_VexRiscv_186_ = ((_zz_VexRiscv_111_ && 1'b1) && (! 1'b0));
  assign _zz_VexRiscv_187_ = {_zz_VexRiscv_63_[1 : 0],_zz_VexRiscv_63_[15 : 13]};
  assign _zz_VexRiscv_188_ = _zz_VexRiscv_63_[6 : 5];
  assign _zz_VexRiscv_189_ = _zz_VexRiscv_63_[11 : 10];
  assign _zz_VexRiscv_190_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_VexRiscv_191_ = execute_INSTRUCTION[13];
  assign _zz_VexRiscv_192_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_VexRiscv_193_ = _zz_VexRiscv_112_[6 : 6];
  assign _zz_VexRiscv_194_ = ($signed(_zz_VexRiscv_196_) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_VexRiscv_195_ = _zz_VexRiscv_194_[31 : 0];
  assign _zz_VexRiscv_196_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_VexRiscv_197_ = _zz_VexRiscv_112_[14 : 14];
  assign _zz_VexRiscv_198_ = _zz_VexRiscv_112_[7 : 7];
  assign _zz_VexRiscv_199_ = _zz_VexRiscv_112_[8 : 8];
  assign _zz_VexRiscv_200_ = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_VexRiscv_201_ = {29'd0, _zz_VexRiscv_200_};
  assign _zz_VexRiscv_202_ = _zz_VexRiscv_112_[21 : 21];
  assign _zz_VexRiscv_203_ = _zz_VexRiscv_112_[18 : 18];
  assign _zz_VexRiscv_204_ = ($signed(_zz_VexRiscv_205_) + $signed(_zz_VexRiscv_210_));
  assign _zz_VexRiscv_205_ = ($signed(_zz_VexRiscv_206_) + $signed(_zz_VexRiscv_208_));
  assign _zz_VexRiscv_206_ = 52'h0;
  assign _zz_VexRiscv_207_ = {1'b0,memory_MUL_LL};
  assign _zz_VexRiscv_208_ = {{19{_zz_VexRiscv_207_[32]}}, _zz_VexRiscv_207_};
  assign _zz_VexRiscv_209_ = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_VexRiscv_210_ = {{2{_zz_VexRiscv_209_[49]}}, _zz_VexRiscv_209_};
  assign _zz_VexRiscv_211_ = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_VexRiscv_212_ = {{2{_zz_VexRiscv_211_[49]}}, _zz_VexRiscv_211_};
  assign _zz_VexRiscv_213_ = _zz_VexRiscv_112_[22 : 22];
  assign _zz_VexRiscv_214_ = _zz_VexRiscv_112_[1 : 1];
  assign _zz_VexRiscv_215_ = _zz_VexRiscv_112_[9 : 9];
  assign _zz_VexRiscv_216_ = _zz_VexRiscv_112_[10 : 10];
  assign _zz_VexRiscv_217_ = _zz_VexRiscv_112_[0 : 0];
  assign _zz_VexRiscv_218_ = _zz_VexRiscv_112_[23 : 23];
  assign _zz_VexRiscv_219_ = (_zz_VexRiscv_50_ - (3'b001));
  assign _zz_VexRiscv_220_ = {IBusSimplePlugin_fetchPc_inc,(2'b00)};
  assign _zz_VexRiscv_221_ = {29'd0, _zz_VexRiscv_220_};
  assign _zz_VexRiscv_222_ = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_VexRiscv_223_ = {29'd0, _zz_VexRiscv_222_};
  assign _zz_VexRiscv_224_ = {{_zz_VexRiscv_73_,_zz_VexRiscv_63_[6 : 2]},12'h0};
  assign _zz_VexRiscv_225_ = {{{(4'b0000),_zz_VexRiscv_63_[8 : 7]},_zz_VexRiscv_63_[12 : 9]},(2'b00)};
  assign _zz_VexRiscv_226_ = {{{(4'b0000),_zz_VexRiscv_63_[8 : 7]},_zz_VexRiscv_63_[12 : 9]},(2'b00)};
  assign _zz_VexRiscv_227_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_VexRiscv_228_ = {{_zz_VexRiscv_96_,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_VexRiscv_229_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_VexRiscv_230_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_VexRiscv_231_ = (IBusSimplePlugin_pending_value + _zz_VexRiscv_233_);
  assign _zz_VexRiscv_232_ = IBusSimplePlugin_pending_inc;
  assign _zz_VexRiscv_233_ = {2'd0, _zz_VexRiscv_232_};
  assign _zz_VexRiscv_234_ = IBusSimplePlugin_pending_dec;
  assign _zz_VexRiscv_235_ = {2'd0, _zz_VexRiscv_234_};
  assign _zz_VexRiscv_236_ = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != (3'b000)));
  assign _zz_VexRiscv_237_ = {2'd0, _zz_VexRiscv_236_};
  assign _zz_VexRiscv_238_ = execute_SRC_LESS;
  assign _zz_VexRiscv_239_ = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_VexRiscv_240_ = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_VexRiscv_241_ = writeBack_MUL_LOW[31 : 0];
  assign _zz_VexRiscv_242_ = writeBack_MulPlugin_result[63 : 32];
  assign _zz_VexRiscv_243_ = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_VexRiscv_244_ = decode_INSTRUCTION[19 : 15];
  assign _zz_VexRiscv_245_ = decode_INSTRUCTION[31 : 20];
  assign _zz_VexRiscv_246_ = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_VexRiscv_247_ = ($signed(_zz_VexRiscv_248_) + $signed(_zz_VexRiscv_251_));
  assign _zz_VexRiscv_248_ = ($signed(_zz_VexRiscv_249_) + $signed(_zz_VexRiscv_250_));
  assign _zz_VexRiscv_249_ = execute_SRC1;
  assign _zz_VexRiscv_250_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_VexRiscv_251_ = (execute_SRC_USE_SUB_LESS ? _zz_VexRiscv_252_ : _zz_VexRiscv_253_);
  assign _zz_VexRiscv_252_ = 32'h00000001;
  assign _zz_VexRiscv_253_ = 32'h0;
  assign _zz_VexRiscv_254_ = execute_INSTRUCTION[31 : 20];
  assign _zz_VexRiscv_255_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_VexRiscv_256_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_VexRiscv_257_ = (execute_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_VexRiscv_258_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_VexRiscv_259_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_VexRiscv_260_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_VexRiscv_261_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_VexRiscv_262_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_VexRiscv_263_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_VexRiscv_264_ = 1'b1;
  assign _zz_VexRiscv_265_ = 1'b1;
  assign _zz_VexRiscv_266_ = {_zz_VexRiscv_53_,_zz_VexRiscv_52_};
  assign _zz_VexRiscv_267_ = (_zz_VexRiscv_63_[11 : 10] == (2'b01));
  assign _zz_VexRiscv_268_ = ((_zz_VexRiscv_63_[11 : 10] == (2'b11)) && (_zz_VexRiscv_63_[6 : 5] == (2'b00)));
  assign _zz_VexRiscv_269_ = 7'h0;
  assign _zz_VexRiscv_270_ = _zz_VexRiscv_63_[6 : 2];
  assign _zz_VexRiscv_271_ = _zz_VexRiscv_63_[12];
  assign _zz_VexRiscv_272_ = _zz_VexRiscv_63_[11 : 7];
  assign _zz_VexRiscv_273_ = decode_INSTRUCTION[31];
  assign _zz_VexRiscv_274_ = decode_INSTRUCTION[19 : 12];
  assign _zz_VexRiscv_275_ = decode_INSTRUCTION[20];
  assign _zz_VexRiscv_276_ = decode_INSTRUCTION[31];
  assign _zz_VexRiscv_277_ = decode_INSTRUCTION[7];
  assign _zz_VexRiscv_278_ = 32'h00001000;
  assign _zz_VexRiscv_279_ = (decode_INSTRUCTION & 32'h00003000);
  assign _zz_VexRiscv_280_ = 32'h00002000;
  assign _zz_VexRiscv_281_ = _zz_VexRiscv_116_;
  assign _zz_VexRiscv_282_ = {(_zz_VexRiscv_288_ == _zz_VexRiscv_289_),{_zz_VexRiscv_290_,{_zz_VexRiscv_291_,_zz_VexRiscv_292_}}};
  assign _zz_VexRiscv_283_ = {_zz_VexRiscv_115_,{_zz_VexRiscv_293_,{_zz_VexRiscv_294_,_zz_VexRiscv_295_}}};
  assign _zz_VexRiscv_284_ = 5'h0;
  assign _zz_VexRiscv_285_ = ((_zz_VexRiscv_296_ == _zz_VexRiscv_297_) != (1'b0));
  assign _zz_VexRiscv_286_ = (_zz_VexRiscv_298_ != (1'b0));
  assign _zz_VexRiscv_287_ = {(_zz_VexRiscv_299_ != _zz_VexRiscv_300_),{_zz_VexRiscv_301_,{_zz_VexRiscv_302_,_zz_VexRiscv_303_}}};
  assign _zz_VexRiscv_288_ = (decode_INSTRUCTION & 32'h00001010);
  assign _zz_VexRiscv_289_ = 32'h00001010;
  assign _zz_VexRiscv_290_ = ((decode_INSTRUCTION & _zz_VexRiscv_304_) == 32'h00002010);
  assign _zz_VexRiscv_291_ = (_zz_VexRiscv_305_ == _zz_VexRiscv_306_);
  assign _zz_VexRiscv_292_ = {_zz_VexRiscv_307_,_zz_VexRiscv_308_};
  assign _zz_VexRiscv_293_ = ((decode_INSTRUCTION & _zz_VexRiscv_309_) == 32'h00002010);
  assign _zz_VexRiscv_294_ = (_zz_VexRiscv_310_ == _zz_VexRiscv_311_);
  assign _zz_VexRiscv_295_ = {_zz_VexRiscv_312_,_zz_VexRiscv_313_};
  assign _zz_VexRiscv_296_ = (decode_INSTRUCTION & 32'h00000020);
  assign _zz_VexRiscv_297_ = 32'h00000020;
  assign _zz_VexRiscv_298_ = ((decode_INSTRUCTION & _zz_VexRiscv_314_) == 32'h00004000);
  assign _zz_VexRiscv_299_ = _zz_VexRiscv_114_;
  assign _zz_VexRiscv_300_ = (1'b0);
  assign _zz_VexRiscv_301_ = ({_zz_VexRiscv_315_,_zz_VexRiscv_316_} != (4'b0000));
  assign _zz_VexRiscv_302_ = (_zz_VexRiscv_317_ != _zz_VexRiscv_318_);
  assign _zz_VexRiscv_303_ = {_zz_VexRiscv_319_,{_zz_VexRiscv_320_,_zz_VexRiscv_321_}};
  assign _zz_VexRiscv_304_ = 32'h00002010;
  assign _zz_VexRiscv_305_ = (decode_INSTRUCTION & 32'h00000050);
  assign _zz_VexRiscv_306_ = 32'h00000010;
  assign _zz_VexRiscv_307_ = ((decode_INSTRUCTION & _zz_VexRiscv_322_) == 32'h00000004);
  assign _zz_VexRiscv_308_ = ((decode_INSTRUCTION & _zz_VexRiscv_323_) == 32'h0);
  assign _zz_VexRiscv_309_ = 32'h00002030;
  assign _zz_VexRiscv_310_ = (decode_INSTRUCTION & 32'h00001030);
  assign _zz_VexRiscv_311_ = 32'h00000010;
  assign _zz_VexRiscv_312_ = ((decode_INSTRUCTION & _zz_VexRiscv_324_) == 32'h00002020);
  assign _zz_VexRiscv_313_ = ((decode_INSTRUCTION & _zz_VexRiscv_325_) == 32'h00000020);
  assign _zz_VexRiscv_314_ = 32'h00004004;
  assign _zz_VexRiscv_315_ = (_zz_VexRiscv_326_ == _zz_VexRiscv_327_);
  assign _zz_VexRiscv_316_ = {_zz_VexRiscv_115_,{_zz_VexRiscv_328_,_zz_VexRiscv_329_}};
  assign _zz_VexRiscv_317_ = {_zz_VexRiscv_330_,_zz_VexRiscv_331_};
  assign _zz_VexRiscv_318_ = (2'b00);
  assign _zz_VexRiscv_319_ = ({_zz_VexRiscv_332_,_zz_VexRiscv_333_} != (2'b00));
  assign _zz_VexRiscv_320_ = (_zz_VexRiscv_334_ != _zz_VexRiscv_335_);
  assign _zz_VexRiscv_321_ = {_zz_VexRiscv_336_,{_zz_VexRiscv_337_,_zz_VexRiscv_338_}};
  assign _zz_VexRiscv_322_ = 32'h0000000c;
  assign _zz_VexRiscv_323_ = 32'h00000028;
  assign _zz_VexRiscv_324_ = 32'h02002060;
  assign _zz_VexRiscv_325_ = 32'h02003020;
  assign _zz_VexRiscv_326_ = (decode_INSTRUCTION & 32'h00000040);
  assign _zz_VexRiscv_327_ = 32'h00000040;
  assign _zz_VexRiscv_328_ = (_zz_VexRiscv_339_ == _zz_VexRiscv_340_);
  assign _zz_VexRiscv_329_ = (_zz_VexRiscv_341_ == _zz_VexRiscv_342_);
  assign _zz_VexRiscv_330_ = ((decode_INSTRUCTION & _zz_VexRiscv_343_) == 32'h00000040);
  assign _zz_VexRiscv_331_ = ((decode_INSTRUCTION & _zz_VexRiscv_344_) == 32'h00000040);
  assign _zz_VexRiscv_332_ = _zz_VexRiscv_116_;
  assign _zz_VexRiscv_333_ = (_zz_VexRiscv_345_ == _zz_VexRiscv_346_);
  assign _zz_VexRiscv_334_ = (_zz_VexRiscv_347_ == _zz_VexRiscv_348_);
  assign _zz_VexRiscv_335_ = (1'b0);
  assign _zz_VexRiscv_336_ = ({_zz_VexRiscv_349_,_zz_VexRiscv_350_} != (2'b00));
  assign _zz_VexRiscv_337_ = (_zz_VexRiscv_351_ != _zz_VexRiscv_352_);
  assign _zz_VexRiscv_338_ = {_zz_VexRiscv_353_,{_zz_VexRiscv_354_,_zz_VexRiscv_355_}};
  assign _zz_VexRiscv_339_ = (decode_INSTRUCTION & 32'h00000030);
  assign _zz_VexRiscv_340_ = 32'h00000010;
  assign _zz_VexRiscv_341_ = (decode_INSTRUCTION & 32'h02000020);
  assign _zz_VexRiscv_342_ = 32'h00000020;
  assign _zz_VexRiscv_343_ = 32'h00000050;
  assign _zz_VexRiscv_344_ = 32'h00003040;
  assign _zz_VexRiscv_345_ = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz_VexRiscv_346_ = 32'h00000004;
  assign _zz_VexRiscv_347_ = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_VexRiscv_348_ = 32'h00000040;
  assign _zz_VexRiscv_349_ = ((decode_INSTRUCTION & _zz_VexRiscv_356_) == 32'h00002000);
  assign _zz_VexRiscv_350_ = ((decode_INSTRUCTION & _zz_VexRiscv_357_) == 32'h00001000);
  assign _zz_VexRiscv_351_ = {_zz_VexRiscv_115_,(_zz_VexRiscv_358_ == _zz_VexRiscv_359_)};
  assign _zz_VexRiscv_352_ = (2'b00);
  assign _zz_VexRiscv_353_ = ({_zz_VexRiscv_115_,_zz_VexRiscv_360_} != (2'b00));
  assign _zz_VexRiscv_354_ = (_zz_VexRiscv_361_ != (1'b0));
  assign _zz_VexRiscv_355_ = {(_zz_VexRiscv_362_ != _zz_VexRiscv_363_),{_zz_VexRiscv_364_,{_zz_VexRiscv_365_,_zz_VexRiscv_366_}}};
  assign _zz_VexRiscv_356_ = 32'h00002010;
  assign _zz_VexRiscv_357_ = 32'h00005000;
  assign _zz_VexRiscv_358_ = (decode_INSTRUCTION & 32'h00000070);
  assign _zz_VexRiscv_359_ = 32'h00000020;
  assign _zz_VexRiscv_360_ = ((decode_INSTRUCTION & 32'h00000020) == 32'h0);
  assign _zz_VexRiscv_361_ = ((decode_INSTRUCTION & 32'h00003050) == 32'h00000050);
  assign _zz_VexRiscv_362_ = {(_zz_VexRiscv_367_ == _zz_VexRiscv_368_),{_zz_VexRiscv_369_,_zz_VexRiscv_370_}};
  assign _zz_VexRiscv_363_ = (3'b000);
  assign _zz_VexRiscv_364_ = ({_zz_VexRiscv_371_,{_zz_VexRiscv_372_,_zz_VexRiscv_373_}} != (4'b0000));
  assign _zz_VexRiscv_365_ = (_zz_VexRiscv_374_ != (1'b0));
  assign _zz_VexRiscv_366_ = {(_zz_VexRiscv_375_ != _zz_VexRiscv_376_),{_zz_VexRiscv_377_,{_zz_VexRiscv_378_,_zz_VexRiscv_379_}}};
  assign _zz_VexRiscv_367_ = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_VexRiscv_368_ = 32'h00000040;
  assign _zz_VexRiscv_369_ = ((decode_INSTRUCTION & _zz_VexRiscv_380_) == 32'h00002010);
  assign _zz_VexRiscv_370_ = ((decode_INSTRUCTION & _zz_VexRiscv_381_) == 32'h40000030);
  assign _zz_VexRiscv_371_ = ((decode_INSTRUCTION & _zz_VexRiscv_382_) == 32'h0);
  assign _zz_VexRiscv_372_ = (_zz_VexRiscv_383_ == _zz_VexRiscv_384_);
  assign _zz_VexRiscv_373_ = {_zz_VexRiscv_114_,_zz_VexRiscv_385_};
  assign _zz_VexRiscv_374_ = ((decode_INSTRUCTION & _zz_VexRiscv_386_) == 32'h0);
  assign _zz_VexRiscv_375_ = (_zz_VexRiscv_387_ == _zz_VexRiscv_388_);
  assign _zz_VexRiscv_376_ = (1'b0);
  assign _zz_VexRiscv_377_ = ({_zz_VexRiscv_389_,_zz_VexRiscv_390_} != (2'b00));
  assign _zz_VexRiscv_378_ = (_zz_VexRiscv_391_ != _zz_VexRiscv_392_);
  assign _zz_VexRiscv_379_ = {_zz_VexRiscv_393_,{_zz_VexRiscv_394_,_zz_VexRiscv_395_}};
  assign _zz_VexRiscv_380_ = 32'h00002014;
  assign _zz_VexRiscv_381_ = 32'h40000034;
  assign _zz_VexRiscv_382_ = 32'h00000044;
  assign _zz_VexRiscv_383_ = (decode_INSTRUCTION & 32'h00000018);
  assign _zz_VexRiscv_384_ = 32'h0;
  assign _zz_VexRiscv_385_ = ((decode_INSTRUCTION & 32'h00005004) == 32'h00001000);
  assign _zz_VexRiscv_386_ = 32'h00000058;
  assign _zz_VexRiscv_387_ = (decode_INSTRUCTION & 32'h02000074);
  assign _zz_VexRiscv_388_ = 32'h02000030;
  assign _zz_VexRiscv_389_ = ((decode_INSTRUCTION & _zz_VexRiscv_396_) == 32'h00001050);
  assign _zz_VexRiscv_390_ = ((decode_INSTRUCTION & _zz_VexRiscv_397_) == 32'h00002050);
  assign _zz_VexRiscv_391_ = {(_zz_VexRiscv_398_ == _zz_VexRiscv_399_),_zz_VexRiscv_113_};
  assign _zz_VexRiscv_392_ = (2'b00);
  assign _zz_VexRiscv_393_ = ({_zz_VexRiscv_400_,_zz_VexRiscv_113_} != (2'b00));
  assign _zz_VexRiscv_394_ = (_zz_VexRiscv_401_ != (1'b0));
  assign _zz_VexRiscv_395_ = {(_zz_VexRiscv_402_ != _zz_VexRiscv_403_),{_zz_VexRiscv_404_,_zz_VexRiscv_405_}};
  assign _zz_VexRiscv_396_ = 32'h00001050;
  assign _zz_VexRiscv_397_ = 32'h00002050;
  assign _zz_VexRiscv_398_ = (decode_INSTRUCTION & 32'h00000014);
  assign _zz_VexRiscv_399_ = 32'h00000004;
  assign _zz_VexRiscv_400_ = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz_VexRiscv_401_ = ((decode_INSTRUCTION & 32'h00007054) == 32'h00005010);
  assign _zz_VexRiscv_402_ = {((decode_INSTRUCTION & _zz_VexRiscv_406_) == 32'h40001010),{(_zz_VexRiscv_407_ == _zz_VexRiscv_408_),(_zz_VexRiscv_409_ == _zz_VexRiscv_410_)}};
  assign _zz_VexRiscv_403_ = (3'b000);
  assign _zz_VexRiscv_404_ = ({(_zz_VexRiscv_411_ == _zz_VexRiscv_412_),(_zz_VexRiscv_413_ == _zz_VexRiscv_414_)} != (2'b00));
  assign _zz_VexRiscv_405_ = (((decode_INSTRUCTION & _zz_VexRiscv_415_) == 32'h00000024) != (1'b0));
  assign _zz_VexRiscv_406_ = 32'h40003054;
  assign _zz_VexRiscv_407_ = (decode_INSTRUCTION & 32'h00007034);
  assign _zz_VexRiscv_408_ = 32'h00001010;
  assign _zz_VexRiscv_409_ = (decode_INSTRUCTION & 32'h02007054);
  assign _zz_VexRiscv_410_ = 32'h00001010;
  assign _zz_VexRiscv_411_ = (decode_INSTRUCTION & 32'h00000034);
  assign _zz_VexRiscv_412_ = 32'h00000020;
  assign _zz_VexRiscv_413_ = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_VexRiscv_414_ = 32'h00000020;
  assign _zz_VexRiscv_415_ = 32'h00000064;
  assign _zz_VexRiscv_416_ = execute_INSTRUCTION[31];
  assign _zz_VexRiscv_417_ = execute_INSTRUCTION[31];
  assign _zz_VexRiscv_418_ = execute_INSTRUCTION[7];
  always @ (posedge clk_cpu) begin
    if(_zz_VexRiscv_264_) begin
      _zz_VexRiscv_163_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk_cpu) begin
    if(_zz_VexRiscv_265_) begin
      _zz_VexRiscv_164_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge clk_cpu) begin
    if(_zz_VexRiscv_34_) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c ( 
    .io_push_valid            (iBus_rsp_valid                                                  ), //i
    .io_push_ready            (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready              ), //o
    .io_push_payload_error    (iBus_rsp_payload_error                                          ), //i
    .io_push_payload_inst     (iBus_rsp_payload_inst[31:0]                                     ), //i
    .io_pop_valid             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid               ), //o
    .io_pop_ready             (_zz_VexRiscv_161_                                               ), //i
    .io_pop_payload_error     (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error       ), //o
    .io_pop_payload_inst      (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]  ), //o
    .io_flush                 (_zz_VexRiscv_162_                                               ), //i
    .io_occupancy             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy               ), //o
    .clk_cpu                  (clk_cpu                                                         ), //i
    .clk_cpu_reset_           (clk_cpu_reset_                                                  )  //i
  );
  always @(*) begin
    case(_zz_VexRiscv_266_)
      2'b00 : begin
        _zz_VexRiscv_165_ = CsrPlugin_jumpInterface_payload;
      end
      2'b01 : begin
        _zz_VexRiscv_165_ = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_VexRiscv_165_ = IBusSimplePlugin_predictionJumpInterface_payload;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_1_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_1__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_1__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_1__string = "AND_1";
      default : _zz_VexRiscv_1__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_2_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_2__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_2__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_2__string = "AND_1";
      default : _zz_VexRiscv_2__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_3_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_3__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_3__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_3__string = "AND_1";
      default : _zz_VexRiscv_3__string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_4_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_4__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_4__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_4__string = "BITWISE ";
      default : _zz_VexRiscv_4__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_5_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_5__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_5__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_5__string = "BITWISE ";
      default : _zz_VexRiscv_5__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_6_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_6__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_6__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_6__string = "BITWISE ";
      default : _zz_VexRiscv_6__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_7_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_7__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_7__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_7__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_7__string = "JALR";
      default : _zz_VexRiscv_7__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_8_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_8__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_8__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_8__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_8__string = "JALR";
      default : _zz_VexRiscv_8__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_9_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_9__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_9__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_9__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_9__string = "SRA_1    ";
      default : _zz_VexRiscv_9__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_10_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_10__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_10__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_10__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_10__string = "SRA_1    ";
      default : _zz_VexRiscv_10__string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_11_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_11__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_11__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_11__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_11__string = "SRA_1    ";
      default : _zz_VexRiscv_11__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_12_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_12__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_12__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_12__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_12__string = "SRA_1    ";
      default : _zz_VexRiscv_12__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_13_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_13__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_13__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_13__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_13__string = "SRA_1    ";
      default : _zz_VexRiscv_13__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_14_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_14__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_14__string = "XRET";
      default : _zz_VexRiscv_14__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_15_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_15__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_15__string = "XRET";
      default : _zz_VexRiscv_15__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_16_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_16__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_16__string = "XRET";
      default : _zz_VexRiscv_16__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_17_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_17__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_17__string = "XRET";
      default : _zz_VexRiscv_17__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_18_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_18__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_18__string = "XRET";
      default : _zz_VexRiscv_18__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_19_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_19__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_19__string = "XRET";
      default : _zz_VexRiscv_19__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_20_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_20__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_20__string = "XRET";
      default : _zz_VexRiscv_20__string = "????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_21_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_21__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_21__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_21__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_21__string = "JALR";
      default : _zz_VexRiscv_21__string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_23_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_23__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_23__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_23__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_23__string = "SRA_1    ";
      default : _zz_VexRiscv_23__string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_24_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_24__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_24__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_24__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_24__string = "SRA_1    ";
      default : _zz_VexRiscv_24__string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_27_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_27__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_VexRiscv_27__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_VexRiscv_27__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_VexRiscv_27__string = "PC ";
      default : _zz_VexRiscv_27__string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_29_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_29__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_VexRiscv_29__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_VexRiscv_29__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_VexRiscv_29__string = "URS1        ";
      default : _zz_VexRiscv_29__string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_30_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_30__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_30__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_30__string = "BITWISE ";
      default : _zz_VexRiscv_30__string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_31_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_31__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_31__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_31__string = "AND_1";
      default : _zz_VexRiscv_31__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_35_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_35__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_35__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_35__string = "AND_1";
      default : _zz_VexRiscv_35__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_36_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_36__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_36__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_36__string = "BITWISE ";
      default : _zz_VexRiscv_36__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_37_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_37__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_37__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_37__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_37__string = "JALR";
      default : _zz_VexRiscv_37__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_38_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_38__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_VexRiscv_38__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_VexRiscv_38__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_VexRiscv_38__string = "PC ";
      default : _zz_VexRiscv_38__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_39_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_39__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_39__string = "XRET";
      default : _zz_VexRiscv_39__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_40_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_40__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_VexRiscv_40__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_VexRiscv_40__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_VexRiscv_40__string = "URS1        ";
      default : _zz_VexRiscv_40__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_41_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_41__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_41__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_41__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_41__string = "SRA_1    ";
      default : _zz_VexRiscv_41__string = "?????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_43_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_43__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_43__string = "XRET";
      default : _zz_VexRiscv_43__string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_44_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_44__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_44__string = "XRET";
      default : _zz_VexRiscv_44__string = "????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_45_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_45__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_45__string = "XRET";
      default : _zz_VexRiscv_45__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_47_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_47__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_47__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_47__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_47__string = "JALR";
      default : _zz_VexRiscv_47__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_117_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_117__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_117__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_117__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_117__string = "SRA_1    ";
      default : _zz_VexRiscv_117__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_118_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_118__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_VexRiscv_118__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_VexRiscv_118__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_VexRiscv_118__string = "URS1        ";
      default : _zz_VexRiscv_118__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_119_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_119__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_119__string = "XRET";
      default : _zz_VexRiscv_119__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_120_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_120__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_VexRiscv_120__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_VexRiscv_120__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_VexRiscv_120__string = "PC ";
      default : _zz_VexRiscv_120__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_121_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_121__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_121__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_121__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_121__string = "JALR";
      default : _zz_VexRiscv_121__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_122_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_122__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_122__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_122__string = "BITWISE ";
      default : _zz_VexRiscv_122__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_123_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_123__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_123__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_123__string = "AND_1";
      default : _zz_VexRiscv_123__string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  `endif

  assign decode_IS_CSR = _zz_VexRiscv_193_[0];
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign decode_ALU_BITWISE_CTRL = _zz_VexRiscv_1_;
  assign _zz_VexRiscv_2_ = _zz_VexRiscv_3_;
  assign memory_PC = execute_to_memory_PC;
  assign execute_SHIFT_RIGHT = _zz_VexRiscv_195_;
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign decode_SRC2 = _zz_VexRiscv_131_;
  assign decode_SRC_LESS_UNSIGNED = _zz_VexRiscv_197_[0];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_VexRiscv_198_[0];
  assign decode_ALU_CTRL = _zz_VexRiscv_4_;
  assign _zz_VexRiscv_5_ = _zz_VexRiscv_6_;
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign _zz_VexRiscv_7_ = _zz_VexRiscv_8_;
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign _zz_VexRiscv_9_ = _zz_VexRiscv_10_;
  assign decode_SHIFT_CTRL = _zz_VexRiscv_11_;
  assign _zz_VexRiscv_12_ = _zz_VexRiscv_13_;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_VexRiscv_125_;
  assign _zz_VexRiscv_14_ = _zz_VexRiscv_15_;
  assign _zz_VexRiscv_16_ = _zz_VexRiscv_17_;
  assign decode_ENV_CTRL = _zz_VexRiscv_18_;
  assign _zz_VexRiscv_19_ = _zz_VexRiscv_20_;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign decode_MEMORY_ENABLE = _zz_VexRiscv_199_[0];
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + _zz_VexRiscv_201_);
  assign decode_MEMORY_STORE = _zz_VexRiscv_202_[0];
  assign decode_SRC1 = _zz_VexRiscv_126_;
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_VexRiscv_203_[0];
  assign memory_MUL_LOW = ($signed(_zz_VexRiscv_204_) + $signed(_zz_VexRiscv_212_));
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_VexRiscv_213_[0];
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_IS_RVC = decode_to_execute_IS_RVC;
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_COND_RESULT = _zz_VexRiscv_147_;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_BRANCH_CTRL = _zz_VexRiscv_21_;
  assign decode_RS2_USE = _zz_VexRiscv_214_[0];
  assign decode_RS1_USE = _zz_VexRiscv_215_[0];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(_zz_VexRiscv_136_)begin
      if((_zz_VexRiscv_137_ == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_VexRiscv_138_;
      end
    end
    if(_zz_VexRiscv_166_)begin
      if(_zz_VexRiscv_167_)begin
        if(_zz_VexRiscv_140_)begin
          decode_RS2 = _zz_VexRiscv_46_;
        end
      end
    end
    if(_zz_VexRiscv_168_)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_VexRiscv_142_)begin
          decode_RS2 = _zz_VexRiscv_22_;
        end
      end
    end
    if(_zz_VexRiscv_169_)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_VexRiscv_144_)begin
          decode_RS2 = _zz_VexRiscv_42_;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(_zz_VexRiscv_136_)begin
      if((_zz_VexRiscv_137_ == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_VexRiscv_138_;
      end
    end
    if(_zz_VexRiscv_166_)begin
      if(_zz_VexRiscv_167_)begin
        if(_zz_VexRiscv_139_)begin
          decode_RS1 = _zz_VexRiscv_46_;
        end
      end
    end
    if(_zz_VexRiscv_168_)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_VexRiscv_141_)begin
          decode_RS1 = _zz_VexRiscv_22_;
        end
      end
    end
    if(_zz_VexRiscv_169_)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_VexRiscv_143_)begin
          decode_RS1 = _zz_VexRiscv_42_;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @ (*) begin
    _zz_VexRiscv_22_ = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid)begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_VexRiscv_22_ = _zz_VexRiscv_133_;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_VexRiscv_22_ = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
  end

  assign memory_SHIFT_CTRL = _zz_VexRiscv_23_;
  assign execute_SHIFT_CTRL = _zz_VexRiscv_24_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_VexRiscv_25_ = decode_PC;
  assign _zz_VexRiscv_26_ = decode_RS2;
  assign decode_SRC2_CTRL = _zz_VexRiscv_27_;
  assign _zz_VexRiscv_28_ = decode_RS1;
  assign decode_SRC1_CTRL = _zz_VexRiscv_29_;
  assign decode_SRC_USE_SUB_LESS = _zz_VexRiscv_216_[0];
  assign decode_SRC_ADD_ZERO = _zz_VexRiscv_217_[0];
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_VexRiscv_30_;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_ALU_BITWISE_CTRL = _zz_VexRiscv_31_;
  assign _zz_VexRiscv_32_ = writeBack_INSTRUCTION;
  assign _zz_VexRiscv_33_ = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_VexRiscv_34_ = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_VexRiscv_34_ = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_decompressor_output_payload_rsp_inst);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_VexRiscv_218_[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_42_ = execute_REGFILE_WRITE_DATA;
    if(_zz_VexRiscv_170_)begin
      _zz_VexRiscv_42_ = execute_CsrPlugin_readData;
    end
  end

  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_VexRiscv_43_;
  assign execute_ENV_CTRL = _zz_VexRiscv_44_;
  assign writeBack_ENV_CTRL = _zz_VexRiscv_45_;
  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @ (*) begin
    _zz_VexRiscv_46_ = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_VexRiscv_46_ = writeBack_DBusSimplePlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_VexRiscv_192_)
        2'b00 : begin
          _zz_VexRiscv_46_ = _zz_VexRiscv_241_;
        end
        default : begin
          _zz_VexRiscv_46_ = _zz_VexRiscv_242_;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  assign decode_BRANCH_CTRL = _zz_VexRiscv_47_;
  always @ (*) begin
    _zz_VexRiscv_48_ = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_VexRiscv_48_ = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_49_ = decode_FORMAL_PC_NEXT;
    if(IBusSimplePlugin_predictionJumpInterface_valid)begin
      _zz_VexRiscv_49_ = IBusSimplePlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_decodePc_pcReg;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign decode_IS_RVC = IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_arbitration_haltItself = 1'b0;
  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(CsrPlugin_pipelineLiberator_active)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != (3'b000)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if((decode_arbitration_isValid && (_zz_VexRiscv_134_ || _zz_VexRiscv_135_)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @ (*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusSimplePlugin_predictionJumpInterface_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_VexRiscv_102_)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_VexRiscv_170_)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushIt = 1'b0;
  assign execute_arbitration_flushNext = 1'b0;
  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(_zz_VexRiscv_171_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_VexRiscv_172_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(_zz_VexRiscv_171_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_VexRiscv_172_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_1_input_valid || IBusSimplePlugin_iBusRsp_stages_2_input_valid))begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_inWfi = 1'b0;
  assign CsrPlugin_thirdPartyWake = 1'b0;
  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_VexRiscv_171_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_VexRiscv_172_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'h0;
    if(_zz_VexRiscv_171_)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,(2'b00)};
    end
    if(_zz_VexRiscv_172_)begin
      case(_zz_VexRiscv_173_)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  assign CsrPlugin_forceMachineWire = 1'b0;
  assign CsrPlugin_allowInterrupts = 1'b1;
  assign CsrPlugin_allowException = 1'b1;
  assign IBusSimplePlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != (4'b0000));
  assign IBusSimplePlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,IBusSimplePlugin_predictionJumpInterface_valid}} != (3'b000));
  assign _zz_VexRiscv_50_ = {IBusSimplePlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid}};
  assign _zz_VexRiscv_51_ = (_zz_VexRiscv_50_ & (~ _zz_VexRiscv_219_));
  assign _zz_VexRiscv_52_ = _zz_VexRiscv_51_[1];
  assign _zz_VexRiscv_53_ = _zz_VexRiscv_51_[2];
  assign IBusSimplePlugin_jump_pcLoad_payload = _zz_VexRiscv_165_;
  always @ (*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready)begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_VexRiscv_221_);
    if(IBusSimplePlugin_fetchPc_inc)begin
      IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  always @ (*) begin
    IBusSimplePlugin_decodePc_flushed = 1'b0;
    if(_zz_VexRiscv_174_)begin
      IBusSimplePlugin_decodePc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_decodePc_pcPlus = (IBusSimplePlugin_decodePc_pcReg + _zz_VexRiscv_223_);
  assign IBusSimplePlugin_decodePc_injectedDecode = 1'b0;
  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
  assign _zz_VexRiscv_54_ = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_VexRiscv_54_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_VexRiscv_54_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_1_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready))))begin
      IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_VexRiscv_55_ = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_VexRiscv_55_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_VexRiscv_55_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_2_halt = 1'b0;
  assign _zz_VexRiscv_56_ = (! IBusSimplePlugin_iBusRsp_stages_2_halt);
  assign IBusSimplePlugin_iBusRsp_stages_2_input_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_ready && _zz_VexRiscv_56_);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_valid = (IBusSimplePlugin_iBusRsp_stages_2_input_valid && _zz_VexRiscv_56_);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_payload = IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_VexRiscv_57_;
  assign _zz_VexRiscv_57_ = ((1'b0 && (! _zz_VexRiscv_58_)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_VexRiscv_58_ = _zz_VexRiscv_59_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_VexRiscv_58_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_VexRiscv_60_)) || IBusSimplePlugin_iBusRsp_stages_2_input_ready);
  assign _zz_VexRiscv_60_ = _zz_VexRiscv_61_;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_valid = _zz_VexRiscv_60_;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_payload = _zz_VexRiscv_62_;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_decompressor_input_valid = (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_iBusRsp_redoFetch));
  assign IBusSimplePlugin_decompressor_input_payload_pc = IBusSimplePlugin_iBusRsp_output_payload_pc;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_error = IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_inst = IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  assign IBusSimplePlugin_decompressor_input_payload_isRvc = IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  assign IBusSimplePlugin_iBusRsp_output_ready = IBusSimplePlugin_decompressor_input_ready;
  assign IBusSimplePlugin_decompressor_flushNext = 1'b0;
  assign IBusSimplePlugin_decompressor_consumeCurrent = 1'b0;
  assign IBusSimplePlugin_decompressor_isInputLowRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[1 : 0] != (2'b11));
  assign IBusSimplePlugin_decompressor_isInputHighRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[17 : 16] != (2'b11));
  assign IBusSimplePlugin_decompressor_throw2Bytes = (IBusSimplePlugin_decompressor_throw2BytesReg || IBusSimplePlugin_decompressor_input_payload_pc[1]);
  assign IBusSimplePlugin_decompressor_unaligned = (IBusSimplePlugin_decompressor_throw2Bytes || IBusSimplePlugin_decompressor_bufferValid);
  assign IBusSimplePlugin_decompressor_raw = (IBusSimplePlugin_decompressor_bufferValid ? {IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0],IBusSimplePlugin_decompressor_bufferData} : {IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16],(IBusSimplePlugin_decompressor_throw2Bytes ? IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16] : IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0])});
  assign IBusSimplePlugin_decompressor_isRvc = (IBusSimplePlugin_decompressor_raw[1 : 0] != (2'b11));
  assign _zz_VexRiscv_63_ = IBusSimplePlugin_decompressor_raw[15 : 0];
  always @ (*) begin
    IBusSimplePlugin_decompressor_decompressed = 32'h0;
    case(_zz_VexRiscv_187_)
      5'b00000 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{{(2'b00),_zz_VexRiscv_63_[10 : 7]},_zz_VexRiscv_63_[12 : 11]},_zz_VexRiscv_63_[5]},_zz_VexRiscv_63_[6]},(2'b00)},5'h02},(3'b000)},_zz_VexRiscv_65_},7'h13};
      end
      5'b00010 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_VexRiscv_66_,_zz_VexRiscv_64_},(3'b010)},_zz_VexRiscv_65_},7'h03};
      end
      5'b00110 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_VexRiscv_66_[11 : 5],_zz_VexRiscv_65_},_zz_VexRiscv_64_},(3'b010)},_zz_VexRiscv_66_[4 : 0]},7'h23};
      end
      5'b01000 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_VexRiscv_68_,_zz_VexRiscv_63_[11 : 7]},(3'b000)},_zz_VexRiscv_63_[11 : 7]},7'h13};
      end
      5'b01001 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_VexRiscv_71_[20],_zz_VexRiscv_71_[10 : 1]},_zz_VexRiscv_71_[11]},_zz_VexRiscv_71_[19 : 12]},_zz_VexRiscv_83_},7'h6f};
      end
      5'b01010 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_VexRiscv_68_,5'h0},(3'b000)},_zz_VexRiscv_63_[11 : 7]},7'h13};
      end
      5'b01011 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_VexRiscv_63_[11 : 7] == 5'h02) ? {{{{{{{{{_zz_VexRiscv_75_,_zz_VexRiscv_63_[4 : 3]},_zz_VexRiscv_63_[5]},_zz_VexRiscv_63_[2]},_zz_VexRiscv_63_[6]},(4'b0000)},_zz_VexRiscv_63_[11 : 7]},(3'b000)},_zz_VexRiscv_63_[11 : 7]},7'h13} : {{_zz_VexRiscv_224_[31 : 12],_zz_VexRiscv_63_[11 : 7]},7'h37});
      end
      5'b01100 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{((_zz_VexRiscv_63_[11 : 10] == (2'b10)) ? _zz_VexRiscv_89_ : {{(1'b0),(_zz_VexRiscv_267_ || _zz_VexRiscv_268_)},5'h0}),(((! _zz_VexRiscv_63_[11]) || _zz_VexRiscv_85_) ? _zz_VexRiscv_63_[6 : 2] : _zz_VexRiscv_65_)},_zz_VexRiscv_64_},_zz_VexRiscv_87_},_zz_VexRiscv_64_},(_zz_VexRiscv_85_ ? 7'h13 : 7'h33)};
      end
      5'b01101 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_VexRiscv_78_[20],_zz_VexRiscv_78_[10 : 1]},_zz_VexRiscv_78_[11]},_zz_VexRiscv_78_[19 : 12]},_zz_VexRiscv_82_},7'h6f};
      end
      5'b01110 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_VexRiscv_81_[12],_zz_VexRiscv_81_[10 : 5]},_zz_VexRiscv_82_},_zz_VexRiscv_64_},(3'b000)},_zz_VexRiscv_81_[4 : 1]},_zz_VexRiscv_81_[11]},7'h63};
      end
      5'b01111 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_VexRiscv_81_[12],_zz_VexRiscv_81_[10 : 5]},_zz_VexRiscv_82_},_zz_VexRiscv_64_},(3'b001)},_zz_VexRiscv_81_[4 : 1]},_zz_VexRiscv_81_[11]},7'h63};
      end
      5'b10000 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{7'h0,_zz_VexRiscv_63_[6 : 2]},_zz_VexRiscv_63_[11 : 7]},(3'b001)},_zz_VexRiscv_63_[11 : 7]},7'h13};
      end
      5'b10010 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{(4'b0000),_zz_VexRiscv_63_[3 : 2]},_zz_VexRiscv_63_[12]},_zz_VexRiscv_63_[6 : 4]},(2'b00)},_zz_VexRiscv_84_},(3'b010)},_zz_VexRiscv_63_[11 : 7]},7'h03};
      end
      5'b10100 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_VexRiscv_63_[12 : 2] == 11'h400) ? 32'h00100073 : ((_zz_VexRiscv_63_[6 : 2] == 5'h0) ? {{{{12'h0,_zz_VexRiscv_63_[11 : 7]},(3'b000)},(_zz_VexRiscv_63_[12] ? _zz_VexRiscv_83_ : _zz_VexRiscv_82_)},7'h67} : {{{{{_zz_VexRiscv_269_,_zz_VexRiscv_270_},(_zz_VexRiscv_271_ ? _zz_VexRiscv_272_ : _zz_VexRiscv_82_)},(3'b000)},_zz_VexRiscv_63_[11 : 7]},7'h33}));
      end
      5'b10110 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_VexRiscv_225_[11 : 5],_zz_VexRiscv_63_[6 : 2]},_zz_VexRiscv_84_},(3'b010)},_zz_VexRiscv_226_[4 : 0]},7'h23};
      end
      default : begin
      end
    endcase
  end

  assign _zz_VexRiscv_64_ = {(2'b01),_zz_VexRiscv_63_[9 : 7]};
  assign _zz_VexRiscv_65_ = {(2'b01),_zz_VexRiscv_63_[4 : 2]};
  assign _zz_VexRiscv_66_ = {{{{5'h0,_zz_VexRiscv_63_[5]},_zz_VexRiscv_63_[12 : 10]},_zz_VexRiscv_63_[6]},(2'b00)};
  assign _zz_VexRiscv_67_ = _zz_VexRiscv_63_[12];
  always @ (*) begin
    _zz_VexRiscv_68_[11] = _zz_VexRiscv_67_;
    _zz_VexRiscv_68_[10] = _zz_VexRiscv_67_;
    _zz_VexRiscv_68_[9] = _zz_VexRiscv_67_;
    _zz_VexRiscv_68_[8] = _zz_VexRiscv_67_;
    _zz_VexRiscv_68_[7] = _zz_VexRiscv_67_;
    _zz_VexRiscv_68_[6] = _zz_VexRiscv_67_;
    _zz_VexRiscv_68_[5] = _zz_VexRiscv_67_;
    _zz_VexRiscv_68_[4 : 0] = _zz_VexRiscv_63_[6 : 2];
  end

  assign _zz_VexRiscv_69_ = _zz_VexRiscv_63_[12];
  always @ (*) begin
    _zz_VexRiscv_70_[9] = _zz_VexRiscv_69_;
    _zz_VexRiscv_70_[8] = _zz_VexRiscv_69_;
    _zz_VexRiscv_70_[7] = _zz_VexRiscv_69_;
    _zz_VexRiscv_70_[6] = _zz_VexRiscv_69_;
    _zz_VexRiscv_70_[5] = _zz_VexRiscv_69_;
    _zz_VexRiscv_70_[4] = _zz_VexRiscv_69_;
    _zz_VexRiscv_70_[3] = _zz_VexRiscv_69_;
    _zz_VexRiscv_70_[2] = _zz_VexRiscv_69_;
    _zz_VexRiscv_70_[1] = _zz_VexRiscv_69_;
    _zz_VexRiscv_70_[0] = _zz_VexRiscv_69_;
  end

  assign _zz_VexRiscv_71_ = {{{{{{{{_zz_VexRiscv_70_,_zz_VexRiscv_63_[8]},_zz_VexRiscv_63_[10 : 9]},_zz_VexRiscv_63_[6]},_zz_VexRiscv_63_[7]},_zz_VexRiscv_63_[2]},_zz_VexRiscv_63_[11]},_zz_VexRiscv_63_[5 : 3]},(1'b0)};
  assign _zz_VexRiscv_72_ = _zz_VexRiscv_63_[12];
  always @ (*) begin
    _zz_VexRiscv_73_[14] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[13] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[12] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[11] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[10] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[9] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[8] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[7] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[6] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[5] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[4] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[3] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[2] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[1] = _zz_VexRiscv_72_;
    _zz_VexRiscv_73_[0] = _zz_VexRiscv_72_;
  end

  assign _zz_VexRiscv_74_ = _zz_VexRiscv_63_[12];
  always @ (*) begin
    _zz_VexRiscv_75_[2] = _zz_VexRiscv_74_;
    _zz_VexRiscv_75_[1] = _zz_VexRiscv_74_;
    _zz_VexRiscv_75_[0] = _zz_VexRiscv_74_;
  end

  assign _zz_VexRiscv_76_ = _zz_VexRiscv_63_[12];
  always @ (*) begin
    _zz_VexRiscv_77_[9] = _zz_VexRiscv_76_;
    _zz_VexRiscv_77_[8] = _zz_VexRiscv_76_;
    _zz_VexRiscv_77_[7] = _zz_VexRiscv_76_;
    _zz_VexRiscv_77_[6] = _zz_VexRiscv_76_;
    _zz_VexRiscv_77_[5] = _zz_VexRiscv_76_;
    _zz_VexRiscv_77_[4] = _zz_VexRiscv_76_;
    _zz_VexRiscv_77_[3] = _zz_VexRiscv_76_;
    _zz_VexRiscv_77_[2] = _zz_VexRiscv_76_;
    _zz_VexRiscv_77_[1] = _zz_VexRiscv_76_;
    _zz_VexRiscv_77_[0] = _zz_VexRiscv_76_;
  end

  assign _zz_VexRiscv_78_ = {{{{{{{{_zz_VexRiscv_77_,_zz_VexRiscv_63_[8]},_zz_VexRiscv_63_[10 : 9]},_zz_VexRiscv_63_[6]},_zz_VexRiscv_63_[7]},_zz_VexRiscv_63_[2]},_zz_VexRiscv_63_[11]},_zz_VexRiscv_63_[5 : 3]},(1'b0)};
  assign _zz_VexRiscv_79_ = _zz_VexRiscv_63_[12];
  always @ (*) begin
    _zz_VexRiscv_80_[4] = _zz_VexRiscv_79_;
    _zz_VexRiscv_80_[3] = _zz_VexRiscv_79_;
    _zz_VexRiscv_80_[2] = _zz_VexRiscv_79_;
    _zz_VexRiscv_80_[1] = _zz_VexRiscv_79_;
    _zz_VexRiscv_80_[0] = _zz_VexRiscv_79_;
  end

  assign _zz_VexRiscv_81_ = {{{{{_zz_VexRiscv_80_,_zz_VexRiscv_63_[6 : 5]},_zz_VexRiscv_63_[2]},_zz_VexRiscv_63_[11 : 10]},_zz_VexRiscv_63_[4 : 3]},(1'b0)};
  assign _zz_VexRiscv_82_ = 5'h0;
  assign _zz_VexRiscv_83_ = 5'h01;
  assign _zz_VexRiscv_84_ = 5'h02;
  assign _zz_VexRiscv_85_ = (_zz_VexRiscv_63_[11 : 10] != (2'b11));
  always @ (*) begin
    case(_zz_VexRiscv_188_)
      2'b00 : begin
        _zz_VexRiscv_86_ = (3'b000);
      end
      2'b01 : begin
        _zz_VexRiscv_86_ = (3'b100);
      end
      2'b10 : begin
        _zz_VexRiscv_86_ = (3'b110);
      end
      default : begin
        _zz_VexRiscv_86_ = (3'b111);
      end
    endcase
  end

  always @ (*) begin
    case(_zz_VexRiscv_189_)
      2'b00 : begin
        _zz_VexRiscv_87_ = (3'b101);
      end
      2'b01 : begin
        _zz_VexRiscv_87_ = (3'b101);
      end
      2'b10 : begin
        _zz_VexRiscv_87_ = (3'b111);
      end
      default : begin
        _zz_VexRiscv_87_ = _zz_VexRiscv_86_;
      end
    endcase
  end

  assign _zz_VexRiscv_88_ = _zz_VexRiscv_63_[12];
  always @ (*) begin
    _zz_VexRiscv_89_[6] = _zz_VexRiscv_88_;
    _zz_VexRiscv_89_[5] = _zz_VexRiscv_88_;
    _zz_VexRiscv_89_[4] = _zz_VexRiscv_88_;
    _zz_VexRiscv_89_[3] = _zz_VexRiscv_88_;
    _zz_VexRiscv_89_[2] = _zz_VexRiscv_88_;
    _zz_VexRiscv_89_[1] = _zz_VexRiscv_88_;
    _zz_VexRiscv_89_[0] = _zz_VexRiscv_88_;
  end

  assign IBusSimplePlugin_decompressor_output_valid = (IBusSimplePlugin_decompressor_input_valid && (! ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_bufferValid)) && (! IBusSimplePlugin_decompressor_isInputHighRvc))));
  assign IBusSimplePlugin_decompressor_output_payload_pc = IBusSimplePlugin_decompressor_input_payload_pc;
  assign IBusSimplePlugin_decompressor_output_payload_isRvc = IBusSimplePlugin_decompressor_isRvc;
  assign IBusSimplePlugin_decompressor_output_payload_rsp_inst = (IBusSimplePlugin_decompressor_isRvc ? IBusSimplePlugin_decompressor_decompressed : IBusSimplePlugin_decompressor_raw);
  assign IBusSimplePlugin_decompressor_input_ready = (IBusSimplePlugin_decompressor_output_ready && (((! IBusSimplePlugin_iBusRsp_stages_2_input_valid) || IBusSimplePlugin_decompressor_flushNext) || ((! (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc)) && (! (((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc)))));
  assign IBusSimplePlugin_decompressor_bufferFill = (((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && (! IBusSimplePlugin_decompressor_isInputHighRvc)) || (IBusSimplePlugin_decompressor_bufferValid && (! IBusSimplePlugin_decompressor_isInputHighRvc))) || ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_isRvc)) && (! IBusSimplePlugin_decompressor_isInputHighRvc)));
  assign IBusSimplePlugin_decompressor_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_VexRiscv_90_;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_VexRiscv_91_;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_VexRiscv_92_;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_VexRiscv_93_;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_VexRiscv_94_;
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_0;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
  assign _zz_VexRiscv_95_ = _zz_VexRiscv_227_[11];
  always @ (*) begin
    _zz_VexRiscv_96_[18] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[17] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[16] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[15] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[14] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[13] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[12] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[11] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[10] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[9] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[8] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[7] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[6] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[5] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[4] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[3] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[2] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[1] = _zz_VexRiscv_95_;
    _zz_VexRiscv_96_[0] = _zz_VexRiscv_95_;
  end

  assign IBusSimplePlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_VexRiscv_228_[31]));
  assign IBusSimplePlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusSimplePlugin_decodePrediction_cmd_hadBranch);
  assign _zz_VexRiscv_97_ = _zz_VexRiscv_229_[19];
  always @ (*) begin
    _zz_VexRiscv_98_[10] = _zz_VexRiscv_97_;
    _zz_VexRiscv_98_[9] = _zz_VexRiscv_97_;
    _zz_VexRiscv_98_[8] = _zz_VexRiscv_97_;
    _zz_VexRiscv_98_[7] = _zz_VexRiscv_97_;
    _zz_VexRiscv_98_[6] = _zz_VexRiscv_97_;
    _zz_VexRiscv_98_[5] = _zz_VexRiscv_97_;
    _zz_VexRiscv_98_[4] = _zz_VexRiscv_97_;
    _zz_VexRiscv_98_[3] = _zz_VexRiscv_97_;
    _zz_VexRiscv_98_[2] = _zz_VexRiscv_97_;
    _zz_VexRiscv_98_[1] = _zz_VexRiscv_97_;
    _zz_VexRiscv_98_[0] = _zz_VexRiscv_97_;
  end

  assign _zz_VexRiscv_99_ = _zz_VexRiscv_230_[11];
  always @ (*) begin
    _zz_VexRiscv_100_[18] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[17] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[16] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[15] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[14] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[13] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[12] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[11] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[10] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[9] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[8] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[7] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[6] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[5] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[4] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[3] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[2] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[1] = _zz_VexRiscv_99_;
    _zz_VexRiscv_100_[0] = _zz_VexRiscv_99_;
  end

  assign IBusSimplePlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_VexRiscv_98_,{{{_zz_VexRiscv_273_,_zz_VexRiscv_274_},_zz_VexRiscv_275_},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_VexRiscv_100_,{{{_zz_VexRiscv_276_,_zz_VexRiscv_277_},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_VexRiscv_231_ - _zz_VexRiscv_235_);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && (IBusSimplePlugin_pending_value != (3'b111)));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && IBusSimplePlugin_cmdFork_canEmit);
  assign IBusSimplePlugin_pending_inc = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_1_input_payload[31 : 2],(2'b00)};
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != (3'b000)) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == (3'b000)));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign _zz_VexRiscv_161_ = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign IBusSimplePlugin_pending_dec = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && _zz_VexRiscv_161_);
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBuffer_output_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_2_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_2_output_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_VexRiscv_101_ = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_VexRiscv_101_);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_VexRiscv_101_);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_VexRiscv_102_ = 1'b0;
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_VexRiscv_102_));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_VexRiscv_103_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_VexRiscv_103_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_VexRiscv_103_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_VexRiscv_103_;
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_VexRiscv_104_ = (4'b0001);
      end
      2'b01 : begin
        _zz_VexRiscv_104_ = (4'b0011);
      end
      default : begin
        _zz_VexRiscv_104_ = (4'b1111);
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_VexRiscv_104_ <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
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

  assign _zz_VexRiscv_105_ = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_VexRiscv_106_[31] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[30] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[29] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[28] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[27] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[26] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[25] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[24] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[23] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[22] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[21] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[20] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[19] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[18] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[17] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[16] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[15] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[14] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[13] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[12] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[11] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[10] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[9] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[8] = _zz_VexRiscv_105_;
    _zz_VexRiscv_106_[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_VexRiscv_107_ = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_VexRiscv_108_[31] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[30] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[29] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[28] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[27] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[26] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[25] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[24] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[23] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[22] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[21] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[20] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[19] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[18] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[17] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[16] = _zz_VexRiscv_107_;
    _zz_VexRiscv_108_[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_VexRiscv_190_)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_VexRiscv_106_;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_VexRiscv_108_;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_privilege = (2'b11);
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = (2'b11);
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = 26'h0;
  assign CsrPlugin_mtvec_mode = (2'b00);
  assign CsrPlugin_mtvec_base = 30'h00000008;
  assign _zz_VexRiscv_109_ = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_VexRiscv_110_ = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_VexRiscv_111_ = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exception = 1'b0;
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  assign CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
  assign CsrPlugin_trapCause = CsrPlugin_interrupt_code;
  always @ (*) begin
    CsrPlugin_xtvec_mode = (2'bxx);
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = 30'h0;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_832)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3072)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3200)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
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
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_VexRiscv_191_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_VexRiscv_113_ = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_VexRiscv_114_ = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_VexRiscv_115_ = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_VexRiscv_116_ = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_VexRiscv_112_ = {(((decode_INSTRUCTION & _zz_VexRiscv_278_) == 32'h00001000) != (1'b0)),{((_zz_VexRiscv_279_ == _zz_VexRiscv_280_) != (1'b0)),{({_zz_VexRiscv_281_,_zz_VexRiscv_282_} != 6'h0),{(_zz_VexRiscv_283_ != _zz_VexRiscv_284_),{_zz_VexRiscv_285_,{_zz_VexRiscv_286_,_zz_VexRiscv_287_}}}}}};
  assign _zz_VexRiscv_117_ = _zz_VexRiscv_112_[3 : 2];
  assign _zz_VexRiscv_41_ = _zz_VexRiscv_117_;
  assign _zz_VexRiscv_118_ = _zz_VexRiscv_112_[5 : 4];
  assign _zz_VexRiscv_40_ = _zz_VexRiscv_118_;
  assign _zz_VexRiscv_119_ = _zz_VexRiscv_112_[11 : 11];
  assign _zz_VexRiscv_39_ = _zz_VexRiscv_119_;
  assign _zz_VexRiscv_120_ = _zz_VexRiscv_112_[13 : 12];
  assign _zz_VexRiscv_38_ = _zz_VexRiscv_120_;
  assign _zz_VexRiscv_121_ = _zz_VexRiscv_112_[16 : 15];
  assign _zz_VexRiscv_37_ = _zz_VexRiscv_121_;
  assign _zz_VexRiscv_122_ = _zz_VexRiscv_112_[20 : 19];
  assign _zz_VexRiscv_36_ = _zz_VexRiscv_122_;
  assign _zz_VexRiscv_123_ = _zz_VexRiscv_112_[25 : 24];
  assign _zz_VexRiscv_35_ = _zz_VexRiscv_123_;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_VexRiscv_163_;
  assign decode_RegFilePlugin_rs2Data = _zz_VexRiscv_164_;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_VexRiscv_33_ && writeBack_arbitration_isFiring);
    if(_zz_VexRiscv_124_)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  assign lastStageRegFileWrite_payload_address = _zz_VexRiscv_32_[11 : 7];
  assign lastStageRegFileWrite_payload_data = _zz_VexRiscv_46_;
  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_VexRiscv_125_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_VexRiscv_125_ = {31'd0, _zz_VexRiscv_238_};
      end
      default : begin
        _zz_VexRiscv_125_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  always @ (*) begin
    case(_zz_VexRiscv_175_)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_VexRiscv_175_)
      2'b01 : begin
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
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
  assign writeBack_MulPlugin_result = ($signed(_zz_VexRiscv_239_) + $signed(_zz_VexRiscv_240_));
  always @ (*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_VexRiscv_126_ = _zz_VexRiscv_28_;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_VexRiscv_126_ = {29'd0, _zz_VexRiscv_243_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_VexRiscv_126_ = {decode_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_VexRiscv_126_ = {27'd0, _zz_VexRiscv_244_};
      end
    endcase
  end

  assign _zz_VexRiscv_127_ = _zz_VexRiscv_245_[11];
  always @ (*) begin
    _zz_VexRiscv_128_[19] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[18] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[17] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[16] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[15] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[14] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[13] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[12] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[11] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[10] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[9] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[8] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[7] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[6] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[5] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[4] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[3] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[2] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[1] = _zz_VexRiscv_127_;
    _zz_VexRiscv_128_[0] = _zz_VexRiscv_127_;
  end

  assign _zz_VexRiscv_129_ = _zz_VexRiscv_246_[11];
  always @ (*) begin
    _zz_VexRiscv_130_[19] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[18] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[17] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[16] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[15] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[14] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[13] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[12] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[11] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[10] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[9] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[8] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[7] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[6] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[5] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[4] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[3] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[2] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[1] = _zz_VexRiscv_129_;
    _zz_VexRiscv_130_[0] = _zz_VexRiscv_129_;
  end

  always @ (*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_VexRiscv_131_ = _zz_VexRiscv_26_;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_VexRiscv_131_ = {_zz_VexRiscv_128_,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_VexRiscv_131_ = {_zz_VexRiscv_130_,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_VexRiscv_131_ = _zz_VexRiscv_25_;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_VexRiscv_247_;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_VexRiscv_132_[0] = execute_SRC1[31];
    _zz_VexRiscv_132_[1] = execute_SRC1[30];
    _zz_VexRiscv_132_[2] = execute_SRC1[29];
    _zz_VexRiscv_132_[3] = execute_SRC1[28];
    _zz_VexRiscv_132_[4] = execute_SRC1[27];
    _zz_VexRiscv_132_[5] = execute_SRC1[26];
    _zz_VexRiscv_132_[6] = execute_SRC1[25];
    _zz_VexRiscv_132_[7] = execute_SRC1[24];
    _zz_VexRiscv_132_[8] = execute_SRC1[23];
    _zz_VexRiscv_132_[9] = execute_SRC1[22];
    _zz_VexRiscv_132_[10] = execute_SRC1[21];
    _zz_VexRiscv_132_[11] = execute_SRC1[20];
    _zz_VexRiscv_132_[12] = execute_SRC1[19];
    _zz_VexRiscv_132_[13] = execute_SRC1[18];
    _zz_VexRiscv_132_[14] = execute_SRC1[17];
    _zz_VexRiscv_132_[15] = execute_SRC1[16];
    _zz_VexRiscv_132_[16] = execute_SRC1[15];
    _zz_VexRiscv_132_[17] = execute_SRC1[14];
    _zz_VexRiscv_132_[18] = execute_SRC1[13];
    _zz_VexRiscv_132_[19] = execute_SRC1[12];
    _zz_VexRiscv_132_[20] = execute_SRC1[11];
    _zz_VexRiscv_132_[21] = execute_SRC1[10];
    _zz_VexRiscv_132_[22] = execute_SRC1[9];
    _zz_VexRiscv_132_[23] = execute_SRC1[8];
    _zz_VexRiscv_132_[24] = execute_SRC1[7];
    _zz_VexRiscv_132_[25] = execute_SRC1[6];
    _zz_VexRiscv_132_[26] = execute_SRC1[5];
    _zz_VexRiscv_132_[27] = execute_SRC1[4];
    _zz_VexRiscv_132_[28] = execute_SRC1[3];
    _zz_VexRiscv_132_[29] = execute_SRC1[2];
    _zz_VexRiscv_132_[30] = execute_SRC1[1];
    _zz_VexRiscv_132_[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_VexRiscv_132_ : execute_SRC1);
  always @ (*) begin
    _zz_VexRiscv_133_[0] = memory_SHIFT_RIGHT[31];
    _zz_VexRiscv_133_[1] = memory_SHIFT_RIGHT[30];
    _zz_VexRiscv_133_[2] = memory_SHIFT_RIGHT[29];
    _zz_VexRiscv_133_[3] = memory_SHIFT_RIGHT[28];
    _zz_VexRiscv_133_[4] = memory_SHIFT_RIGHT[27];
    _zz_VexRiscv_133_[5] = memory_SHIFT_RIGHT[26];
    _zz_VexRiscv_133_[6] = memory_SHIFT_RIGHT[25];
    _zz_VexRiscv_133_[7] = memory_SHIFT_RIGHT[24];
    _zz_VexRiscv_133_[8] = memory_SHIFT_RIGHT[23];
    _zz_VexRiscv_133_[9] = memory_SHIFT_RIGHT[22];
    _zz_VexRiscv_133_[10] = memory_SHIFT_RIGHT[21];
    _zz_VexRiscv_133_[11] = memory_SHIFT_RIGHT[20];
    _zz_VexRiscv_133_[12] = memory_SHIFT_RIGHT[19];
    _zz_VexRiscv_133_[13] = memory_SHIFT_RIGHT[18];
    _zz_VexRiscv_133_[14] = memory_SHIFT_RIGHT[17];
    _zz_VexRiscv_133_[15] = memory_SHIFT_RIGHT[16];
    _zz_VexRiscv_133_[16] = memory_SHIFT_RIGHT[15];
    _zz_VexRiscv_133_[17] = memory_SHIFT_RIGHT[14];
    _zz_VexRiscv_133_[18] = memory_SHIFT_RIGHT[13];
    _zz_VexRiscv_133_[19] = memory_SHIFT_RIGHT[12];
    _zz_VexRiscv_133_[20] = memory_SHIFT_RIGHT[11];
    _zz_VexRiscv_133_[21] = memory_SHIFT_RIGHT[10];
    _zz_VexRiscv_133_[22] = memory_SHIFT_RIGHT[9];
    _zz_VexRiscv_133_[23] = memory_SHIFT_RIGHT[8];
    _zz_VexRiscv_133_[24] = memory_SHIFT_RIGHT[7];
    _zz_VexRiscv_133_[25] = memory_SHIFT_RIGHT[6];
    _zz_VexRiscv_133_[26] = memory_SHIFT_RIGHT[5];
    _zz_VexRiscv_133_[27] = memory_SHIFT_RIGHT[4];
    _zz_VexRiscv_133_[28] = memory_SHIFT_RIGHT[3];
    _zz_VexRiscv_133_[29] = memory_SHIFT_RIGHT[2];
    _zz_VexRiscv_133_[30] = memory_SHIFT_RIGHT[1];
    _zz_VexRiscv_133_[31] = memory_SHIFT_RIGHT[0];
  end

  always @ (*) begin
    _zz_VexRiscv_134_ = 1'b0;
    if(_zz_VexRiscv_176_)begin
      if(_zz_VexRiscv_177_)begin
        if(_zz_VexRiscv_139_)begin
          _zz_VexRiscv_134_ = 1'b1;
        end
      end
    end
    if(_zz_VexRiscv_178_)begin
      if(_zz_VexRiscv_179_)begin
        if(_zz_VexRiscv_141_)begin
          _zz_VexRiscv_134_ = 1'b1;
        end
      end
    end
    if(_zz_VexRiscv_180_)begin
      if(_zz_VexRiscv_181_)begin
        if(_zz_VexRiscv_143_)begin
          _zz_VexRiscv_134_ = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_VexRiscv_134_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_135_ = 1'b0;
    if(_zz_VexRiscv_176_)begin
      if(_zz_VexRiscv_177_)begin
        if(_zz_VexRiscv_140_)begin
          _zz_VexRiscv_135_ = 1'b1;
        end
      end
    end
    if(_zz_VexRiscv_178_)begin
      if(_zz_VexRiscv_179_)begin
        if(_zz_VexRiscv_142_)begin
          _zz_VexRiscv_135_ = 1'b1;
        end
      end
    end
    if(_zz_VexRiscv_180_)begin
      if(_zz_VexRiscv_181_)begin
        if(_zz_VexRiscv_144_)begin
          _zz_VexRiscv_135_ = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_VexRiscv_135_ = 1'b0;
    end
  end

  assign _zz_VexRiscv_139_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_VexRiscv_140_ = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_VexRiscv_141_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_VexRiscv_142_ = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_VexRiscv_143_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_VexRiscv_144_ = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_VexRiscv_145_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_VexRiscv_145_ == (3'b000))) begin
        _zz_VexRiscv_146_ = execute_BranchPlugin_eq;
    end else if((_zz_VexRiscv_145_ == (3'b001))) begin
        _zz_VexRiscv_146_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_VexRiscv_145_ & (3'b101)) == (3'b101)))) begin
        _zz_VexRiscv_146_ = (! execute_SRC_LESS);
    end else begin
        _zz_VexRiscv_146_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_VexRiscv_147_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_VexRiscv_147_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_VexRiscv_147_ = 1'b1;
      end
      default : begin
        _zz_VexRiscv_147_ = _zz_VexRiscv_146_;
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = 1'b0;
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_VexRiscv_148_ = _zz_VexRiscv_254_[11];
  always @ (*) begin
    _zz_VexRiscv_149_[19] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[18] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[17] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[16] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[15] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[14] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[13] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[12] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[11] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[10] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[9] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[8] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[7] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[6] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[5] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[4] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[3] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[2] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[1] = _zz_VexRiscv_148_;
    _zz_VexRiscv_149_[0] = _zz_VexRiscv_148_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_VexRiscv_149_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_VexRiscv_151_,{{{_zz_VexRiscv_416_,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_VexRiscv_153_,{{{_zz_VexRiscv_417_,_zz_VexRiscv_418_},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_VexRiscv_257_};
        end
      end
    endcase
  end

  assign _zz_VexRiscv_150_ = _zz_VexRiscv_255_[19];
  always @ (*) begin
    _zz_VexRiscv_151_[10] = _zz_VexRiscv_150_;
    _zz_VexRiscv_151_[9] = _zz_VexRiscv_150_;
    _zz_VexRiscv_151_[8] = _zz_VexRiscv_150_;
    _zz_VexRiscv_151_[7] = _zz_VexRiscv_150_;
    _zz_VexRiscv_151_[6] = _zz_VexRiscv_150_;
    _zz_VexRiscv_151_[5] = _zz_VexRiscv_150_;
    _zz_VexRiscv_151_[4] = _zz_VexRiscv_150_;
    _zz_VexRiscv_151_[3] = _zz_VexRiscv_150_;
    _zz_VexRiscv_151_[2] = _zz_VexRiscv_150_;
    _zz_VexRiscv_151_[1] = _zz_VexRiscv_150_;
    _zz_VexRiscv_151_[0] = _zz_VexRiscv_150_;
  end

  assign _zz_VexRiscv_152_ = _zz_VexRiscv_256_[11];
  always @ (*) begin
    _zz_VexRiscv_153_[18] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[17] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[16] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[15] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[14] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[13] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[12] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[11] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[10] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[9] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[8] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[7] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[6] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[5] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[4] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[3] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[2] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[1] = _zz_VexRiscv_152_;
    _zz_VexRiscv_153_[0] = _zz_VexRiscv_152_;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign IBusSimplePlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  assign _zz_VexRiscv_29_ = _zz_VexRiscv_40_;
  assign _zz_VexRiscv_20_ = decode_ENV_CTRL;
  assign _zz_VexRiscv_17_ = execute_ENV_CTRL;
  assign _zz_VexRiscv_15_ = memory_ENV_CTRL;
  assign _zz_VexRiscv_18_ = _zz_VexRiscv_39_;
  assign _zz_VexRiscv_44_ = decode_to_execute_ENV_CTRL;
  assign _zz_VexRiscv_43_ = execute_to_memory_ENV_CTRL;
  assign _zz_VexRiscv_45_ = memory_to_writeBack_ENV_CTRL;
  assign _zz_VexRiscv_13_ = decode_SHIFT_CTRL;
  assign _zz_VexRiscv_10_ = execute_SHIFT_CTRL;
  assign _zz_VexRiscv_11_ = _zz_VexRiscv_41_;
  assign _zz_VexRiscv_24_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_VexRiscv_23_ = execute_to_memory_SHIFT_CTRL;
  assign _zz_VexRiscv_8_ = decode_BRANCH_CTRL;
  assign _zz_VexRiscv_47_ = _zz_VexRiscv_37_;
  assign _zz_VexRiscv_21_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_VexRiscv_6_ = decode_ALU_CTRL;
  assign _zz_VexRiscv_4_ = _zz_VexRiscv_36_;
  assign _zz_VexRiscv_30_ = decode_to_execute_ALU_CTRL;
  assign _zz_VexRiscv_3_ = decode_ALU_BITWISE_CTRL;
  assign _zz_VexRiscv_1_ = _zz_VexRiscv_35_;
  assign _zz_VexRiscv_31_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_VexRiscv_27_ = _zz_VexRiscv_38_;
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != (3'b000)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != (4'b0000)));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != (2'b00)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != (3'b000)));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != (1'b0)) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != (2'b00)));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != (1'b0)));
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
  always @ (*) begin
    _zz_VexRiscv_154_ = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_VexRiscv_154_[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_VexRiscv_154_[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_VexRiscv_154_[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_155_ = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_VexRiscv_155_[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_VexRiscv_155_[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_VexRiscv_155_[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_156_ = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_VexRiscv_156_[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_VexRiscv_156_[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_VexRiscv_156_[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_157_ = 32'h0;
    if(execute_CsrPlugin_csr_832)begin
      _zz_VexRiscv_157_[31 : 0] = CsrPlugin_mscratch;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_158_ = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_VexRiscv_158_[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_VexRiscv_158_[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_159_ = 32'h0;
    if(execute_CsrPlugin_csr_3072)begin
      _zz_VexRiscv_159_[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @ (*) begin
    _zz_VexRiscv_160_ = 32'h0;
    if(execute_CsrPlugin_csr_3200)begin
      _zz_VexRiscv_160_[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  assign execute_CsrPlugin_readData = (((_zz_VexRiscv_154_ | _zz_VexRiscv_155_) | (_zz_VexRiscv_156_ | _zz_VexRiscv_157_)) | ((_zz_VexRiscv_158_ | _zz_VexRiscv_159_) | _zz_VexRiscv_160_));
  assign _zz_VexRiscv_162_ = 1'b0;
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      IBusSimplePlugin_fetchPc_pcReg <= 32'h0;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      IBusSimplePlugin_decodePc_pcReg <= 32'h0;
      _zz_VexRiscv_59_ <= 1'b0;
      _zz_VexRiscv_61_ <= 1'b0;
      IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
      _zz_VexRiscv_90_ <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_pending_value <= (3'b000);
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (3'b000);
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= (2'b11);
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      _zz_VexRiscv_124_ <= 1'b1;
      _zz_VexRiscv_136_ <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      memory_to_writeBack_REGFILE_WRITE_DATA <= 32'h0;
      memory_to_writeBack_INSTRUCTION <= 32'h0;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction)begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if((IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate)))begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if((decode_arbitration_isFiring && (! IBusSimplePlugin_decodePc_injectedDecode)))begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_decodePc_pcPlus;
      end
      if(_zz_VexRiscv_174_)begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_jump_pcLoad_payload;
      end
      if(IBusSimplePlugin_iBusRsp_flush)begin
        _zz_VexRiscv_59_ <= 1'b0;
      end
      if(_zz_VexRiscv_57_)begin
        _zz_VexRiscv_59_ <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusSimplePlugin_iBusRsp_flush)begin
        _zz_VexRiscv_61_ <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_stages_1_output_ready)begin
        _zz_VexRiscv_61_ <= (IBusSimplePlugin_iBusRsp_stages_1_output_valid && (! IBusSimplePlugin_iBusRsp_flush));
      end
      if((IBusSimplePlugin_decompressor_output_valid && IBusSimplePlugin_decompressor_output_ready))begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= ((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc) || (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc));
      end
      if((IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid))begin
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(_zz_VexRiscv_182_)begin
        if(IBusSimplePlugin_decompressor_bufferFill)begin
          IBusSimplePlugin_decompressor_bufferValid <= 1'b1;
        end
      end
      if((IBusSimplePlugin_externalFlush || IBusSimplePlugin_decompressor_consumeCurrent))begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        _zz_VexRiscv_90_ <= 1'b0;
      end
      if(IBusSimplePlugin_decompressor_output_ready)begin
        _zz_VexRiscv_90_ <= (IBusSimplePlugin_decompressor_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if((! 1'b0))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_VexRiscv_237_);
      if(IBusSimplePlugin_iBusRsp_flush)begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= IBusSimplePlugin_pending_next;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_VexRiscv_183_)begin
        if(_zz_VexRiscv_184_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_VexRiscv_185_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_VexRiscv_186_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active)begin
        if((! execute_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if((! memory_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if((! writeBack_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt))begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump)begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_VexRiscv_171_)begin
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
      if(_zz_VexRiscv_172_)begin
        case(_zz_VexRiscv_173_)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_VexRiscv_111_,{_zz_VexRiscv_110_,_zz_VexRiscv_109_}} != (3'b000)) || CsrPlugin_thirdPartyWake);
      _zz_VexRiscv_124_ <= 1'b0;
      _zz_VexRiscv_136_ <= (_zz_VexRiscv_33_ && writeBack_arbitration_isFiring);
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_VexRiscv_22_;
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
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_VexRiscv_258_[0];
          CsrPlugin_mstatus_MIE <= _zz_VexRiscv_259_[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_VexRiscv_261_[0];
          CsrPlugin_mie_MTIE <= _zz_VexRiscv_262_[0];
          CsrPlugin_mie_MSIE <= _zz_VexRiscv_263_[0];
        end
      end
    end
  end

  always @ (posedge clk_cpu) begin
    if(IBusSimplePlugin_iBusRsp_stages_1_output_ready)begin
      _zz_VexRiscv_62_ <= IBusSimplePlugin_iBusRsp_stages_1_output_payload;
    end
    if(_zz_VexRiscv_182_)begin
      IBusSimplePlugin_decompressor_bufferData <= IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16];
    end
    if(IBusSimplePlugin_decompressor_output_ready)begin
      _zz_VexRiscv_91_ <= IBusSimplePlugin_decompressor_output_payload_pc;
      _zz_VexRiscv_92_ <= IBusSimplePlugin_decompressor_output_payload_rsp_error;
      _zz_VexRiscv_93_ <= IBusSimplePlugin_decompressor_output_payload_rsp_inst;
      _zz_VexRiscv_94_ <= IBusSimplePlugin_decompressor_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_decompressor_raw;
    end
    `ifndef SYNTHESIS
      `ifdef FORMAL
        assert((! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck)))
      `else
        if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
          $display("FAILURE DBusSimplePlugin doesn't allow memory stage stall when read happend");
          $finish;
        end
      `endif
    `endif
    `ifndef SYNTHESIS
      `ifdef FORMAL
        assert((! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck)))
      `else
        if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck))) begin
          $display("FAILURE DBusSimplePlugin doesn't allow writeback stage stall when read happend");
          $finish;
        end
      `endif
    `endif
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(_zz_VexRiscv_183_)begin
      if(_zz_VexRiscv_184_)begin
        CsrPlugin_interrupt_code <= (4'b0111);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_VexRiscv_185_)begin
        CsrPlugin_interrupt_code <= (4'b0011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_VexRiscv_186_)begin
        CsrPlugin_interrupt_code <= (4'b1011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
    end
    if(_zz_VexRiscv_171_)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= decode_PC;
        end
        default : begin
        end
      endcase
    end
    _zz_VexRiscv_137_ <= _zz_VexRiscv_32_[11 : 7];
    _zz_VexRiscv_138_ <= _zz_VexRiscv_46_;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_STORE <= memory_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_VexRiscv_49_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_VexRiscv_48_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
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
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_VexRiscv_19_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_VexRiscv_16_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_VexRiscv_14_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_VexRiscv_42_;
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
      decode_to_execute_SHIFT_CTRL <= _zz_VexRiscv_12_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_VexRiscv_9_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_VexRiscv_7_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_VexRiscv_5_;
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
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RVC <= decode_IS_RVC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= _zz_VexRiscv_26_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= _zz_VexRiscv_25_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= execute_PC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_VexRiscv_2_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= _zz_VexRiscv_28_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_832 <= (decode_INSTRUCTION[31 : 20] == 12'h340);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3072 <= (decode_INSTRUCTION[31 : 20] == 12'hc00);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3200 <= (decode_INSTRUCTION[31 : 20] == 12'hc80);
    end
    if(execute_CsrPlugin_csr_836)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mip_MSIP <= _zz_VexRiscv_260_[0];
      end
    end
    if(execute_CsrPlugin_csr_832)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mscratch <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end


endmodule

module CCPipelinedMemoryBusRam (
  input               io_bus_cmd_valid,
  output              io_bus_cmd_ready,
  input               io_bus_cmd_payload_write,
  input      [31:0]   io_bus_cmd_payload_address,
  input      [31:0]   io_bus_cmd_payload_data,
  input      [3:0]    io_bus_cmd_payload_mask,
  output              io_bus_rsp_valid,
  output     [31:0]   io_bus_rsp_payload_data,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  reg        [31:0]   _zz_CCPipelinedMemoryBusRam_4_;
  wire       [10:0]   _zz_CCPipelinedMemoryBusRam_5_;
  reg                 _zz_CCPipelinedMemoryBusRam_1_;
  wire       [29:0]   _zz_CCPipelinedMemoryBusRam_2_;
  wire       [31:0]   _zz_CCPipelinedMemoryBusRam_3_;
  reg [7:0] ram_symbol0 [0:2047];
  reg [7:0] ram_symbol1 [0:2047];
  reg [7:0] ram_symbol2 [0:2047];
  reg [7:0] ram_symbol3 [0:2047];
  reg [7:0] _zz_CCPipelinedMemoryBusRam_6_;
  reg [7:0] _zz_CCPipelinedMemoryBusRam_7_;
  reg [7:0] _zz_CCPipelinedMemoryBusRam_8_;
  reg [7:0] _zz_CCPipelinedMemoryBusRam_9_;

  assign _zz_CCPipelinedMemoryBusRam_5_ = _zz_CCPipelinedMemoryBusRam_2_[10:0];
  initial begin
    $readmemb("ExampleTop.v_toplevel_cpu_u_cpu_u_cpu_ram_ram_symbol0.bin",ram_symbol0);
    $readmemb("ExampleTop.v_toplevel_cpu_u_cpu_u_cpu_ram_ram_symbol1.bin",ram_symbol1);
    $readmemb("ExampleTop.v_toplevel_cpu_u_cpu_u_cpu_ram_ram_symbol2.bin",ram_symbol2);
    $readmemb("ExampleTop.v_toplevel_cpu_u_cpu_u_cpu_ram_ram_symbol3.bin",ram_symbol3);
  end
  always @ (*) begin
    _zz_CCPipelinedMemoryBusRam_4_ = {_zz_CCPipelinedMemoryBusRam_9_, _zz_CCPipelinedMemoryBusRam_8_, _zz_CCPipelinedMemoryBusRam_7_, _zz_CCPipelinedMemoryBusRam_6_};
  end
  always @ (posedge clk_cpu) begin
    if(io_bus_cmd_valid) begin
      _zz_CCPipelinedMemoryBusRam_6_ <= ram_symbol0[_zz_CCPipelinedMemoryBusRam_5_];
      _zz_CCPipelinedMemoryBusRam_7_ <= ram_symbol1[_zz_CCPipelinedMemoryBusRam_5_];
      _zz_CCPipelinedMemoryBusRam_8_ <= ram_symbol2[_zz_CCPipelinedMemoryBusRam_5_];
      _zz_CCPipelinedMemoryBusRam_9_ <= ram_symbol3[_zz_CCPipelinedMemoryBusRam_5_];
    end
  end

  always @ (posedge clk_cpu) begin
    if(io_bus_cmd_payload_mask[0] && io_bus_cmd_valid && io_bus_cmd_payload_write ) begin
      ram_symbol0[_zz_CCPipelinedMemoryBusRam_5_] <= _zz_CCPipelinedMemoryBusRam_3_[7 : 0];
    end
    if(io_bus_cmd_payload_mask[1] && io_bus_cmd_valid && io_bus_cmd_payload_write ) begin
      ram_symbol1[_zz_CCPipelinedMemoryBusRam_5_] <= _zz_CCPipelinedMemoryBusRam_3_[15 : 8];
    end
    if(io_bus_cmd_payload_mask[2] && io_bus_cmd_valid && io_bus_cmd_payload_write ) begin
      ram_symbol2[_zz_CCPipelinedMemoryBusRam_5_] <= _zz_CCPipelinedMemoryBusRam_3_[23 : 16];
    end
    if(io_bus_cmd_payload_mask[3] && io_bus_cmd_valid && io_bus_cmd_payload_write ) begin
      ram_symbol3[_zz_CCPipelinedMemoryBusRam_5_] <= _zz_CCPipelinedMemoryBusRam_3_[31 : 24];
    end
  end

  assign io_bus_rsp_valid = _zz_CCPipelinedMemoryBusRam_1_;
  assign _zz_CCPipelinedMemoryBusRam_2_ = (io_bus_cmd_payload_address >>> 2);
  assign _zz_CCPipelinedMemoryBusRam_3_ = io_bus_cmd_payload_data;
  assign io_bus_rsp_payload_data = _zz_CCPipelinedMemoryBusRam_4_;
  assign io_bus_cmd_ready = 1'b1;
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      _zz_CCPipelinedMemoryBusRam_1_ <= 1'b0;
    end else begin
      _zz_CCPipelinedMemoryBusRam_1_ <= ((io_bus_cmd_valid && io_bus_cmd_ready) && (! io_bus_cmd_payload_write));
    end
  end


endmodule

module PipelinedMemoryBusToApbBridge (
  input               io_pipelinedMemoryBus_cmd_valid,
  output              io_pipelinedMemoryBus_cmd_ready,
  input               io_pipelinedMemoryBus_cmd_payload_write,
  input      [31:0]   io_pipelinedMemoryBus_cmd_payload_address,
  input      [31:0]   io_pipelinedMemoryBus_cmd_payload_data,
  input      [3:0]    io_pipelinedMemoryBus_cmd_payload_mask,
  output              io_pipelinedMemoryBus_rsp_valid,
  output     [31:0]   io_pipelinedMemoryBus_rsp_payload_data,
  output     [19:0]   io_apb_PADDR,
  output     [0:0]    io_apb_PSEL,
  output              io_apb_PENABLE,
  input               io_apb_PREADY,
  output              io_apb_PWRITE,
  output     [31:0]   io_apb_PWDATA,
  input      [31:0]   io_apb_PRDATA,
  input               io_apb_PSLVERROR,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire                _zz_PipelinedMemoryBusToApbBridge_1_;
  wire                _zz_PipelinedMemoryBusToApbBridge_2_;
  wire                pipelinedMemoryBusStage_cmd_valid;
  reg                 pipelinedMemoryBusStage_cmd_ready;
  wire                pipelinedMemoryBusStage_cmd_payload_write;
  wire       [31:0]   pipelinedMemoryBusStage_cmd_payload_address;
  wire       [31:0]   pipelinedMemoryBusStage_cmd_payload_data;
  wire       [3:0]    pipelinedMemoryBusStage_cmd_payload_mask;
  reg                 pipelinedMemoryBusStage_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusStage_rsp_payload_data;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_valid;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_ready;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_payload_write;
  wire       [31:0]   io_pipelinedMemoryBus_cmd_halfPipe_payload_address;
  wire       [31:0]   io_pipelinedMemoryBus_cmd_halfPipe_payload_data;
  wire       [3:0]    io_pipelinedMemoryBus_cmd_halfPipe_payload_mask;
  reg                 io_pipelinedMemoryBus_cmd_halfPipe_regs_valid;
  reg                 io_pipelinedMemoryBus_cmd_halfPipe_regs_ready;
  reg                 io_pipelinedMemoryBus_cmd_halfPipe_regs_payload_write;
  reg        [31:0]   io_pipelinedMemoryBus_cmd_halfPipe_regs_payload_address;
  reg        [31:0]   io_pipelinedMemoryBus_cmd_halfPipe_regs_payload_data;
  reg        [3:0]    io_pipelinedMemoryBus_cmd_halfPipe_regs_payload_mask;
  reg                 pipelinedMemoryBusStage_rsp_regNext_valid;
  reg        [31:0]   pipelinedMemoryBusStage_rsp_regNext_payload_data;
  reg                 state;

  assign _zz_PipelinedMemoryBusToApbBridge_1_ = (! state);
  assign _zz_PipelinedMemoryBusToApbBridge_2_ = (! io_pipelinedMemoryBus_cmd_halfPipe_regs_valid);
  assign io_pipelinedMemoryBus_cmd_halfPipe_valid = io_pipelinedMemoryBus_cmd_halfPipe_regs_valid;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_write = io_pipelinedMemoryBus_cmd_halfPipe_regs_payload_write;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_address = io_pipelinedMemoryBus_cmd_halfPipe_regs_payload_address;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_data = io_pipelinedMemoryBus_cmd_halfPipe_regs_payload_data;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_mask = io_pipelinedMemoryBus_cmd_halfPipe_regs_payload_mask;
  assign io_pipelinedMemoryBus_cmd_ready = io_pipelinedMemoryBus_cmd_halfPipe_regs_ready;
  assign pipelinedMemoryBusStage_cmd_valid = io_pipelinedMemoryBus_cmd_halfPipe_valid;
  assign io_pipelinedMemoryBus_cmd_halfPipe_ready = pipelinedMemoryBusStage_cmd_ready;
  assign pipelinedMemoryBusStage_cmd_payload_write = io_pipelinedMemoryBus_cmd_halfPipe_payload_write;
  assign pipelinedMemoryBusStage_cmd_payload_address = io_pipelinedMemoryBus_cmd_halfPipe_payload_address;
  assign pipelinedMemoryBusStage_cmd_payload_data = io_pipelinedMemoryBus_cmd_halfPipe_payload_data;
  assign pipelinedMemoryBusStage_cmd_payload_mask = io_pipelinedMemoryBus_cmd_halfPipe_payload_mask;
  assign io_pipelinedMemoryBus_rsp_valid = pipelinedMemoryBusStage_rsp_regNext_valid;
  assign io_pipelinedMemoryBus_rsp_payload_data = pipelinedMemoryBusStage_rsp_regNext_payload_data;
  always @ (*) begin
    pipelinedMemoryBusStage_cmd_ready = 1'b0;
    if(! _zz_PipelinedMemoryBusToApbBridge_1_) begin
      if(io_apb_PREADY)begin
        pipelinedMemoryBusStage_cmd_ready = 1'b1;
      end
    end
  end

  assign io_apb_PSEL[0] = pipelinedMemoryBusStage_cmd_valid;
  assign io_apb_PENABLE = state;
  assign io_apb_PWRITE = pipelinedMemoryBusStage_cmd_payload_write;
  assign io_apb_PADDR = pipelinedMemoryBusStage_cmd_payload_address[19:0];
  assign io_apb_PWDATA = pipelinedMemoryBusStage_cmd_payload_data;
  always @ (*) begin
    pipelinedMemoryBusStage_rsp_valid = 1'b0;
    if(! _zz_PipelinedMemoryBusToApbBridge_1_) begin
      if(io_apb_PREADY)begin
        pipelinedMemoryBusStage_rsp_valid = (! pipelinedMemoryBusStage_cmd_payload_write);
      end
    end
  end

  assign pipelinedMemoryBusStage_rsp_payload_data = io_apb_PRDATA;
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      io_pipelinedMemoryBus_cmd_halfPipe_regs_valid <= 1'b0;
      io_pipelinedMemoryBus_cmd_halfPipe_regs_ready <= 1'b1;
      pipelinedMemoryBusStage_rsp_regNext_valid <= 1'b0;
      state <= 1'b0;
    end else begin
      if(_zz_PipelinedMemoryBusToApbBridge_2_)begin
        io_pipelinedMemoryBus_cmd_halfPipe_regs_valid <= io_pipelinedMemoryBus_cmd_valid;
        io_pipelinedMemoryBus_cmd_halfPipe_regs_ready <= (! io_pipelinedMemoryBus_cmd_valid);
      end else begin
        io_pipelinedMemoryBus_cmd_halfPipe_regs_valid <= (! io_pipelinedMemoryBus_cmd_halfPipe_ready);
        io_pipelinedMemoryBus_cmd_halfPipe_regs_ready <= io_pipelinedMemoryBus_cmd_halfPipe_ready;
      end
      pipelinedMemoryBusStage_rsp_regNext_valid <= pipelinedMemoryBusStage_rsp_valid;
      if(_zz_PipelinedMemoryBusToApbBridge_1_)begin
        state <= pipelinedMemoryBusStage_cmd_valid;
      end else begin
        if(io_apb_PREADY)begin
          state <= 1'b0;
        end
      end
    end
  end

  always @ (posedge clk_cpu) begin
    if(_zz_PipelinedMemoryBusToApbBridge_2_)begin
      io_pipelinedMemoryBus_cmd_halfPipe_regs_payload_write <= io_pipelinedMemoryBus_cmd_payload_write;
      io_pipelinedMemoryBus_cmd_halfPipe_regs_payload_address <= io_pipelinedMemoryBus_cmd_payload_address;
      io_pipelinedMemoryBus_cmd_halfPipe_regs_payload_data <= io_pipelinedMemoryBus_cmd_payload_data;
      io_pipelinedMemoryBus_cmd_halfPipe_regs_payload_mask <= io_pipelinedMemoryBus_cmd_payload_mask;
    end
    pipelinedMemoryBusStage_rsp_regNext_payload_data <= pipelinedMemoryBusStage_rsp_payload_data;
  end


endmodule

module Prescaler (
  input               io_clear,
  input      [7:0]    io_limit,
  output              io_overflow,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  reg        [7:0]    counter;

  assign io_overflow = (counter == io_limit);
  always @ (posedge clk_cpu) begin
    counter <= (counter + 8'h01);
    if((io_clear || io_overflow))begin
      counter <= 8'h0;
    end
  end


endmodule

module Timer (
  input               io_tick,
  input               io_clear,
  input      [15:0]   io_limit,
  output              io_full,
  output     [15:0]   io_value,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire       [0:0]    _zz_Timer_1_;
  wire       [15:0]   _zz_Timer_2_;
  reg        [15:0]   counter;
  wire                limitHit;
  reg                 inhibitFull;

  assign _zz_Timer_1_ = (! limitHit);
  assign _zz_Timer_2_ = {15'd0, _zz_Timer_1_};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      inhibitFull <= 1'b0;
    end else begin
      if(io_tick)begin
        inhibitFull <= limitHit;
      end
      if(io_clear)begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @ (posedge clk_cpu) begin
    if(io_tick)begin
      counter <= (counter + _zz_Timer_2_);
    end
    if(io_clear)begin
      counter <= 16'h0;
    end
  end


endmodule

module Timer_1_ (
  input               io_tick,
  input               io_clear,
  input      [15:0]   io_limit,
  output              io_full,
  output     [15:0]   io_value,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire       [0:0]    _zz_Timer_1__1_;
  wire       [15:0]   _zz_Timer_1__2_;
  reg        [15:0]   counter;
  wire                limitHit;
  reg                 inhibitFull;

  assign _zz_Timer_1__1_ = (! limitHit);
  assign _zz_Timer_1__2_ = {15'd0, _zz_Timer_1__1_};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      inhibitFull <= 1'b0;
    end else begin
      if(io_tick)begin
        inhibitFull <= limitHit;
      end
      if(io_clear)begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @ (posedge clk_cpu) begin
    if(io_tick)begin
      counter <= (counter + _zz_Timer_1__2_);
    end
    if(io_clear)begin
      counter <= 16'h0;
    end
  end


endmodule

module InterruptCtrl (
  input      [1:0]    io_inputs,
  input      [1:0]    io_clears,
  input      [1:0]    io_masks,
  output     [1:0]    io_pendings,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  reg        [1:0]    pendings;

  assign io_pendings = (pendings & io_masks);
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      pendings <= (2'b00);
    end else begin
      pendings <= ((pendings & (~ io_clears)) | io_inputs);
    end
  end


endmodule

module BufferCC_1_ (
  input      [2:0]    io_dataIn,
  output     [2:0]    io_dataOut,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  reg        [2:0]    buffers_0;
  reg        [2:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge clk_cpu) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module UartCtrl (
  input      [2:0]    io_config_frame_dataLength,
  input      `UartStopType_defaultEncoding_type io_config_frame_stop,
  input      `UartParityType_defaultEncoding_type io_config_frame_parity,
  input      [19:0]   io_config_clockDivider,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_readError,
  input               io_writeBreak,
  output              io_readBreak,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire                _zz_UartCtrl_1_;
  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 io_write_thrown_valid;
  wire                io_write_thrown_ready;
  wire       [7:0]    io_write_thrown_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx ( 
    .io_configFrame_dataLength    (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop          (io_config_frame_stop             ), //i
    .io_configFrame_parity        (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick              (clockDivider_tick                ), //i
    .io_write_valid               (io_write_thrown_valid            ), //i
    .io_write_ready               (tx_io_write_ready                ), //o
    .io_write_payload             (io_write_thrown_payload[7:0]     ), //i
    .io_cts                       (_zz_UartCtrl_1_                  ), //i
    .io_txd                       (tx_io_txd                        ), //o
    .io_break                     (io_writeBreak                    ), //i
    .clk_cpu                      (clk_cpu                          ), //i
    .clk_cpu_reset_               (clk_cpu_reset_                   )  //i
  );
  UartCtrlRx rx ( 
    .io_configFrame_dataLength    (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop          (io_config_frame_stop             ), //i
    .io_configFrame_parity        (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick              (clockDivider_tick                ), //i
    .io_read_valid                (rx_io_read_valid                 ), //o
    .io_read_ready                (io_read_ready                    ), //i
    .io_read_payload              (rx_io_read_payload[7:0]          ), //o
    .io_rxd                       (io_uart_rxd                      ), //i
    .io_rts                       (rx_io_rts                        ), //o
    .io_error                     (rx_io_error                      ), //o
    .io_break                     (rx_io_break                      ), //o
    .clk_cpu                      (clk_cpu                          ), //i
    .clk_cpu_reset_               (clk_cpu_reset_                   )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      `UartStopType_defaultEncoding_ONE : io_config_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      `UartParityType_defaultEncoding_NONE : io_config_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_config_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h0);
  always @ (*) begin
    io_write_thrown_valid = io_write_valid;
    if(rx_io_break)begin
      io_write_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    io_write_ready = io_write_thrown_ready;
    if(rx_io_break)begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_thrown_payload = io_write_payload;
  assign io_write_thrown_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign _zz_UartCtrl_1_ = 1'b0;
  assign io_readBreak = rx_io_break;
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      clockDivider_counter <= 20'h0;
    end else begin
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick)begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  input               io_flush,
  output reg [7:0]    io_occupancy,
  output reg [7:0]    io_availability,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  reg        [7:0]    _zz_StreamFifo_3_;
  wire       [0:0]    _zz_StreamFifo_4_;
  wire       [7:0]    _zz_StreamFifo_5_;
  wire       [0:0]    _zz_StreamFifo_6_;
  wire       [7:0]    _zz_StreamFifo_7_;
  wire       [7:0]    _zz_StreamFifo_8_;
  wire       [7:0]    _zz_StreamFifo_9_;
  wire       [7:0]    _zz_StreamFifo_10_;
  wire       [7:0]    _zz_StreamFifo_11_;
  wire                _zz_StreamFifo_12_;
  reg                 _zz_StreamFifo_1_;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [7:0]    logic_pushPtr_valueNext;
  reg        [7:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [7:0]    logic_popPtr_valueNext;
  reg        [7:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_StreamFifo_2_;
  wire       [7:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:254];

  assign _zz_StreamFifo_4_ = logic_pushPtr_willIncrement;
  assign _zz_StreamFifo_5_ = {7'd0, _zz_StreamFifo_4_};
  assign _zz_StreamFifo_6_ = logic_popPtr_willIncrement;
  assign _zz_StreamFifo_7_ = {7'd0, _zz_StreamFifo_6_};
  assign _zz_StreamFifo_8_ = (8'hff + logic_ptrDif);
  assign _zz_StreamFifo_9_ = (8'hff + _zz_StreamFifo_10_);
  assign _zz_StreamFifo_10_ = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_StreamFifo_11_ = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_StreamFifo_12_ = 1'b1;
  always @ (posedge clk_cpu) begin
    if(_zz_StreamFifo_12_) begin
      _zz_StreamFifo_3_ <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @ (posedge clk_cpu) begin
    if(_zz_StreamFifo_1_) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @ (*) begin
    _zz_StreamFifo_1_ = 1'b0;
    if(logic_pushing)begin
      _zz_StreamFifo_1_ = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing)begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 8'hfe);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @ (*) begin
    if(logic_pushPtr_willOverflow)begin
      logic_pushPtr_valueNext = 8'h0;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_StreamFifo_5_);
    end
    if(logic_pushPtr_willClear)begin
      logic_pushPtr_valueNext = 8'h0;
    end
  end

  always @ (*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping)begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 8'hfe);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @ (*) begin
    if(logic_popPtr_willOverflow)begin
      logic_popPtr_valueNext = 8'h0;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_StreamFifo_7_);
    end
    if(logic_popPtr_willClear)begin
      logic_popPtr_valueNext = 8'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_StreamFifo_2_ && (! logic_full))));
  assign io_pop_payload = _zz_StreamFifo_3_;
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  always @ (*) begin
    if(logic_ptrMatch)begin
      io_occupancy = (logic_risingOccupancy ? 8'hff : 8'h0);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_StreamFifo_8_);
    end
  end

  always @ (*) begin
    if(logic_ptrMatch)begin
      io_availability = (logic_risingOccupancy ? 8'h0 : 8'hff);
    end else begin
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_StreamFifo_9_ : _zz_StreamFifo_11_);
    end
  end

  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      logic_pushPtr_value <= 8'h0;
      logic_popPtr_value <= 8'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_StreamFifo_2_ <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_StreamFifo_2_ <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if((logic_pushing != logic_popping))begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush)begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module StreamFifo_1_ (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  input               io_flush,
  output     [5:0]    io_occupancy,
  output     [5:0]    io_availability,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  reg        [7:0]    _zz_StreamFifo_1__3_;
  wire       [0:0]    _zz_StreamFifo_1__4_;
  wire       [4:0]    _zz_StreamFifo_1__5_;
  wire       [0:0]    _zz_StreamFifo_1__6_;
  wire       [4:0]    _zz_StreamFifo_1__7_;
  wire       [4:0]    _zz_StreamFifo_1__8_;
  wire                _zz_StreamFifo_1__9_;
  reg                 _zz_StreamFifo_1__1_;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [4:0]    logic_pushPtr_valueNext;
  reg        [4:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [4:0]    logic_popPtr_valueNext;
  reg        [4:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_StreamFifo_1__2_;
  wire       [4:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:31];

  assign _zz_StreamFifo_1__4_ = logic_pushPtr_willIncrement;
  assign _zz_StreamFifo_1__5_ = {4'd0, _zz_StreamFifo_1__4_};
  assign _zz_StreamFifo_1__6_ = logic_popPtr_willIncrement;
  assign _zz_StreamFifo_1__7_ = {4'd0, _zz_StreamFifo_1__6_};
  assign _zz_StreamFifo_1__8_ = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_StreamFifo_1__9_ = 1'b1;
  always @ (posedge clk_cpu) begin
    if(_zz_StreamFifo_1__9_) begin
      _zz_StreamFifo_1__3_ <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @ (posedge clk_cpu) begin
    if(_zz_StreamFifo_1__1_) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @ (*) begin
    _zz_StreamFifo_1__1_ = 1'b0;
    if(logic_pushing)begin
      _zz_StreamFifo_1__1_ = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing)begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 5'h1f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @ (*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_StreamFifo_1__5_);
    if(logic_pushPtr_willClear)begin
      logic_pushPtr_valueNext = 5'h0;
    end
  end

  always @ (*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping)begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 5'h1f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @ (*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_StreamFifo_1__7_);
    if(logic_popPtr_willClear)begin
      logic_popPtr_valueNext = 5'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_StreamFifo_1__2_ && (! logic_full))));
  assign io_pop_payload = _zz_StreamFifo_1__3_;
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_StreamFifo_1__8_};
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      logic_pushPtr_value <= 5'h0;
      logic_popPtr_value <= 5'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_StreamFifo_1__2_ <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_StreamFifo_1__2_ <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if((logic_pushing != logic_popping))begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush)begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module CpuComplex (
  output     [19:0]   io_apb_PADDR,
  output     [0:0]    io_apb_PSEL,
  output              io_apb_PENABLE,
  input               io_apb_PREADY,
  output              io_apb_PWRITE,
  output     [31:0]   io_apb_PWDATA,
  input      [31:0]   io_apb_PRDATA,
  input               io_apb_PSLVERROR,
  input               io_externalInterrupt,
  input               io_timerInterrupt,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire                _zz_CpuComplex_3_;
  reg                 _zz_CpuComplex_4_;
  reg                 _zz_CpuComplex_5_;
  reg        [31:0]   _zz_CpuComplex_6_;
  wire                mainBusArbiter_io_iBus_cmd_ready;
  wire                mainBusArbiter_io_iBus_rsp_valid;
  wire                mainBusArbiter_io_iBus_rsp_payload_error;
  wire       [31:0]   mainBusArbiter_io_iBus_rsp_payload_inst;
  wire                mainBusArbiter_io_dBus_cmd_ready;
  wire                mainBusArbiter_io_dBus_rsp_ready;
  wire                mainBusArbiter_io_dBus_rsp_error;
  wire       [31:0]   mainBusArbiter_io_dBus_rsp_data;
  wire                mainBusArbiter_io_masterBus_cmd_valid;
  wire                mainBusArbiter_io_masterBus_cmd_payload_write;
  wire       [31:0]   mainBusArbiter_io_masterBus_cmd_payload_address;
  wire       [31:0]   mainBusArbiter_io_masterBus_cmd_payload_data;
  wire       [3:0]    mainBusArbiter_io_masterBus_cmd_payload_mask;
  wire                cpu_iBus_cmd_valid;
  wire       [31:0]   cpu_iBus_cmd_payload_pc;
  wire                cpu_dBus_cmd_valid;
  wire                cpu_dBus_cmd_payload_wr;
  wire       [31:0]   cpu_dBus_cmd_payload_address;
  wire       [31:0]   cpu_dBus_cmd_payload_data;
  wire       [1:0]    cpu_dBus_cmd_payload_size;
  wire                ram_io_bus_cmd_ready;
  wire                ram_io_bus_rsp_valid;
  wire       [31:0]   ram_io_bus_rsp_payload_data;
  wire                apbBridge_io_pipelinedMemoryBus_cmd_ready;
  wire                apbBridge_io_pipelinedMemoryBus_rsp_valid;
  wire       [31:0]   apbBridge_io_pipelinedMemoryBus_rsp_payload_data;
  wire       [19:0]   apbBridge_io_apb_PADDR;
  wire       [0:0]    apbBridge_io_apb_PSEL;
  wire                apbBridge_io_apb_PENABLE;
  wire                apbBridge_io_apb_PWRITE;
  wire       [31:0]   apbBridge_io_apb_PWDATA;
  wire                _zz_CpuComplex_7_;
  wire                _zz_CpuComplex_8_;
  wire                cpu_dBus_cmd_halfPipe_valid;
  wire                cpu_dBus_cmd_halfPipe_ready;
  wire                cpu_dBus_cmd_halfPipe_payload_wr;
  wire       [31:0]   cpu_dBus_cmd_halfPipe_payload_address;
  wire       [31:0]   cpu_dBus_cmd_halfPipe_payload_data;
  wire       [1:0]    cpu_dBus_cmd_halfPipe_payload_size;
  reg                 cpu_dBus_cmd_halfPipe_regs_valid;
  reg                 cpu_dBus_cmd_halfPipe_regs_ready;
  reg                 cpu_dBus_cmd_halfPipe_regs_payload_wr;
  reg        [31:0]   cpu_dBus_cmd_halfPipe_regs_payload_address;
  reg        [31:0]   cpu_dBus_cmd_halfPipe_regs_payload_data;
  reg        [1:0]    cpu_dBus_cmd_halfPipe_regs_payload_size;
  wire                mainBusDecoder_logic_masterPipelined_cmd_valid;
  reg                 mainBusDecoder_logic_masterPipelined_cmd_ready;
  wire                mainBusDecoder_logic_masterPipelined_cmd_payload_write;
  wire       [31:0]   mainBusDecoder_logic_masterPipelined_cmd_payload_address;
  wire       [31:0]   mainBusDecoder_logic_masterPipelined_cmd_payload_data;
  wire       [3:0]    mainBusDecoder_logic_masterPipelined_cmd_payload_mask;
  wire                mainBusDecoder_logic_masterPipelined_rsp_valid;
  wire       [31:0]   mainBusDecoder_logic_masterPipelined_rsp_payload_data;
  wire                mainBusDecoder_logic_hits_0;
  wire                _zz_CpuComplex_1_;
  wire                mainBusDecoder_logic_hits_1;
  wire                _zz_CpuComplex_2_;
  wire                mainBusDecoder_logic_noHit;
  reg                 mainBusDecoder_logic_rspPending;
  reg                 mainBusDecoder_logic_rspNoHit;
  reg        [0:0]    mainBusDecoder_logic_rspSourceId;

  assign _zz_CpuComplex_7_ = (mainBusDecoder_logic_rspPending && (! mainBusDecoder_logic_masterPipelined_rsp_valid));
  assign _zz_CpuComplex_8_ = (! cpu_dBus_cmd_halfPipe_regs_valid);
  CCMasterArbiter mainBusArbiter ( 
    .io_iBus_cmd_valid                   (cpu_iBus_cmd_valid                                           ), //i
    .io_iBus_cmd_ready                   (mainBusArbiter_io_iBus_cmd_ready                             ), //o
    .io_iBus_cmd_payload_pc              (cpu_iBus_cmd_payload_pc[31:0]                                ), //i
    .io_iBus_rsp_valid                   (mainBusArbiter_io_iBus_rsp_valid                             ), //o
    .io_iBus_rsp_payload_error           (mainBusArbiter_io_iBus_rsp_payload_error                     ), //o
    .io_iBus_rsp_payload_inst            (mainBusArbiter_io_iBus_rsp_payload_inst[31:0]                ), //o
    .io_dBus_cmd_valid                   (cpu_dBus_cmd_halfPipe_valid                                  ), //i
    .io_dBus_cmd_ready                   (mainBusArbiter_io_dBus_cmd_ready                             ), //o
    .io_dBus_cmd_payload_wr              (cpu_dBus_cmd_halfPipe_payload_wr                             ), //i
    .io_dBus_cmd_payload_address         (cpu_dBus_cmd_halfPipe_payload_address[31:0]                  ), //i
    .io_dBus_cmd_payload_data            (cpu_dBus_cmd_halfPipe_payload_data[31:0]                     ), //i
    .io_dBus_cmd_payload_size            (cpu_dBus_cmd_halfPipe_payload_size[1:0]                      ), //i
    .io_dBus_rsp_ready                   (mainBusArbiter_io_dBus_rsp_ready                             ), //o
    .io_dBus_rsp_error                   (mainBusArbiter_io_dBus_rsp_error                             ), //o
    .io_dBus_rsp_data                    (mainBusArbiter_io_dBus_rsp_data[31:0]                        ), //o
    .io_masterBus_cmd_valid              (mainBusArbiter_io_masterBus_cmd_valid                        ), //o
    .io_masterBus_cmd_ready              (mainBusDecoder_logic_masterPipelined_cmd_ready               ), //i
    .io_masterBus_cmd_payload_write      (mainBusArbiter_io_masterBus_cmd_payload_write                ), //o
    .io_masterBus_cmd_payload_address    (mainBusArbiter_io_masterBus_cmd_payload_address[31:0]        ), //o
    .io_masterBus_cmd_payload_data       (mainBusArbiter_io_masterBus_cmd_payload_data[31:0]           ), //o
    .io_masterBus_cmd_payload_mask       (mainBusArbiter_io_masterBus_cmd_payload_mask[3:0]            ), //o
    .io_masterBus_rsp_valid              (mainBusDecoder_logic_masterPipelined_rsp_valid               ), //i
    .io_masterBus_rsp_payload_data       (mainBusDecoder_logic_masterPipelined_rsp_payload_data[31:0]  ), //i
    .clk_cpu                             (clk_cpu                                                      ), //i
    .clk_cpu_reset_                      (clk_cpu_reset_                                               )  //i
  );
  VexRiscv cpu ( 
    .iBus_cmd_valid              (cpu_iBus_cmd_valid                             ), //o
    .iBus_cmd_ready              (mainBusArbiter_io_iBus_cmd_ready               ), //i
    .iBus_cmd_payload_pc         (cpu_iBus_cmd_payload_pc[31:0]                  ), //o
    .iBus_rsp_valid              (mainBusArbiter_io_iBus_rsp_valid               ), //i
    .iBus_rsp_payload_error      (mainBusArbiter_io_iBus_rsp_payload_error       ), //i
    .iBus_rsp_payload_inst       (mainBusArbiter_io_iBus_rsp_payload_inst[31:0]  ), //i
    .timerInterrupt              (io_timerInterrupt                              ), //i
    .externalInterrupt           (io_externalInterrupt                           ), //i
    .softwareInterrupt           (_zz_CpuComplex_3_                              ), //i
    .dBus_cmd_valid              (cpu_dBus_cmd_valid                             ), //o
    .dBus_cmd_ready              (cpu_dBus_cmd_halfPipe_regs_ready               ), //i
    .dBus_cmd_payload_wr         (cpu_dBus_cmd_payload_wr                        ), //o
    .dBus_cmd_payload_address    (cpu_dBus_cmd_payload_address[31:0]             ), //o
    .dBus_cmd_payload_data       (cpu_dBus_cmd_payload_data[31:0]                ), //o
    .dBus_cmd_payload_size       (cpu_dBus_cmd_payload_size[1:0]                 ), //o
    .dBus_rsp_ready              (mainBusArbiter_io_dBus_rsp_ready               ), //i
    .dBus_rsp_error              (mainBusArbiter_io_dBus_rsp_error               ), //i
    .dBus_rsp_data               (mainBusArbiter_io_dBus_rsp_data[31:0]          ), //i
    .clk_cpu                     (clk_cpu                                        ), //i
    .clk_cpu_reset_              (clk_cpu_reset_                                 )  //i
  );
  CCPipelinedMemoryBusRam ram ( 
    .io_bus_cmd_valid              (_zz_CpuComplex_4_                                               ), //i
    .io_bus_cmd_ready              (ram_io_bus_cmd_ready                                            ), //o
    .io_bus_cmd_payload_write      (_zz_CpuComplex_1_                                               ), //i
    .io_bus_cmd_payload_address    (mainBusDecoder_logic_masterPipelined_cmd_payload_address[31:0]  ), //i
    .io_bus_cmd_payload_data       (mainBusDecoder_logic_masterPipelined_cmd_payload_data[31:0]     ), //i
    .io_bus_cmd_payload_mask       (mainBusDecoder_logic_masterPipelined_cmd_payload_mask[3:0]      ), //i
    .io_bus_rsp_valid              (ram_io_bus_rsp_valid                                            ), //o
    .io_bus_rsp_payload_data       (ram_io_bus_rsp_payload_data[31:0]                               ), //o
    .clk_cpu                       (clk_cpu                                                         ), //i
    .clk_cpu_reset_                (clk_cpu_reset_                                                  )  //i
  );
  PipelinedMemoryBusToApbBridge apbBridge ( 
    .io_pipelinedMemoryBus_cmd_valid              (_zz_CpuComplex_5_                                               ), //i
    .io_pipelinedMemoryBus_cmd_ready              (apbBridge_io_pipelinedMemoryBus_cmd_ready                       ), //o
    .io_pipelinedMemoryBus_cmd_payload_write      (_zz_CpuComplex_2_                                               ), //i
    .io_pipelinedMemoryBus_cmd_payload_address    (mainBusDecoder_logic_masterPipelined_cmd_payload_address[31:0]  ), //i
    .io_pipelinedMemoryBus_cmd_payload_data       (mainBusDecoder_logic_masterPipelined_cmd_payload_data[31:0]     ), //i
    .io_pipelinedMemoryBus_cmd_payload_mask       (mainBusDecoder_logic_masterPipelined_cmd_payload_mask[3:0]      ), //i
    .io_pipelinedMemoryBus_rsp_valid              (apbBridge_io_pipelinedMemoryBus_rsp_valid                       ), //o
    .io_pipelinedMemoryBus_rsp_payload_data       (apbBridge_io_pipelinedMemoryBus_rsp_payload_data[31:0]          ), //o
    .io_apb_PADDR                                 (apbBridge_io_apb_PADDR[19:0]                                    ), //o
    .io_apb_PSEL                                  (apbBridge_io_apb_PSEL                                           ), //o
    .io_apb_PENABLE                               (apbBridge_io_apb_PENABLE                                        ), //o
    .io_apb_PREADY                                (io_apb_PREADY                                                   ), //i
    .io_apb_PWRITE                                (apbBridge_io_apb_PWRITE                                         ), //o
    .io_apb_PWDATA                                (apbBridge_io_apb_PWDATA[31:0]                                   ), //o
    .io_apb_PRDATA                                (io_apb_PRDATA[31:0]                                             ), //i
    .io_apb_PSLVERROR                             (io_apb_PSLVERROR                                                ), //i
    .clk_cpu                                      (clk_cpu                                                         ), //i
    .clk_cpu_reset_                               (clk_cpu_reset_                                                  )  //i
  );
  always @(*) begin
    case(mainBusDecoder_logic_rspSourceId)
      1'b0 : begin
        _zz_CpuComplex_6_ = ram_io_bus_rsp_payload_data;
      end
      default : begin
        _zz_CpuComplex_6_ = apbBridge_io_pipelinedMemoryBus_rsp_payload_data;
      end
    endcase
  end

  assign cpu_dBus_cmd_halfPipe_valid = cpu_dBus_cmd_halfPipe_regs_valid;
  assign cpu_dBus_cmd_halfPipe_payload_wr = cpu_dBus_cmd_halfPipe_regs_payload_wr;
  assign cpu_dBus_cmd_halfPipe_payload_address = cpu_dBus_cmd_halfPipe_regs_payload_address;
  assign cpu_dBus_cmd_halfPipe_payload_data = cpu_dBus_cmd_halfPipe_regs_payload_data;
  assign cpu_dBus_cmd_halfPipe_payload_size = cpu_dBus_cmd_halfPipe_regs_payload_size;
  assign cpu_dBus_cmd_halfPipe_ready = mainBusArbiter_io_dBus_cmd_ready;
  assign io_apb_PADDR = apbBridge_io_apb_PADDR;
  assign io_apb_PSEL = apbBridge_io_apb_PSEL;
  assign io_apb_PENABLE = apbBridge_io_apb_PENABLE;
  assign io_apb_PWRITE = apbBridge_io_apb_PWRITE;
  assign io_apb_PWDATA = apbBridge_io_apb_PWDATA;
  assign mainBusDecoder_logic_masterPipelined_cmd_valid = mainBusArbiter_io_masterBus_cmd_valid;
  assign mainBusDecoder_logic_masterPipelined_cmd_payload_write = mainBusArbiter_io_masterBus_cmd_payload_write;
  assign mainBusDecoder_logic_masterPipelined_cmd_payload_address = mainBusArbiter_io_masterBus_cmd_payload_address;
  assign mainBusDecoder_logic_masterPipelined_cmd_payload_data = mainBusArbiter_io_masterBus_cmd_payload_data;
  assign mainBusDecoder_logic_masterPipelined_cmd_payload_mask = mainBusArbiter_io_masterBus_cmd_payload_mask;
  assign mainBusDecoder_logic_hits_0 = ((mainBusDecoder_logic_masterPipelined_cmd_payload_address & (~ 32'h00001fff)) == 32'h0);
  always @ (*) begin
    _zz_CpuComplex_4_ = (mainBusDecoder_logic_masterPipelined_cmd_valid && mainBusDecoder_logic_hits_0);
    if(_zz_CpuComplex_7_)begin
      _zz_CpuComplex_4_ = 1'b0;
    end
  end

  assign _zz_CpuComplex_1_ = mainBusDecoder_logic_masterPipelined_cmd_payload_write;
  assign mainBusDecoder_logic_hits_1 = ((mainBusDecoder_logic_masterPipelined_cmd_payload_address & (~ 32'h000fffff)) == 32'h80000000);
  always @ (*) begin
    _zz_CpuComplex_5_ = (mainBusDecoder_logic_masterPipelined_cmd_valid && mainBusDecoder_logic_hits_1);
    if(_zz_CpuComplex_7_)begin
      _zz_CpuComplex_5_ = 1'b0;
    end
  end

  assign _zz_CpuComplex_2_ = mainBusDecoder_logic_masterPipelined_cmd_payload_write;
  assign mainBusDecoder_logic_noHit = (! ({mainBusDecoder_logic_hits_1,mainBusDecoder_logic_hits_0} != (2'b00)));
  always @ (*) begin
    mainBusDecoder_logic_masterPipelined_cmd_ready = (({(mainBusDecoder_logic_hits_1 && apbBridge_io_pipelinedMemoryBus_cmd_ready),(mainBusDecoder_logic_hits_0 && ram_io_bus_cmd_ready)} != (2'b00)) || mainBusDecoder_logic_noHit);
    if(_zz_CpuComplex_7_)begin
      mainBusDecoder_logic_masterPipelined_cmd_ready = 1'b0;
    end
  end

  assign mainBusDecoder_logic_masterPipelined_rsp_valid = (({apbBridge_io_pipelinedMemoryBus_rsp_valid,ram_io_bus_rsp_valid} != (2'b00)) || (mainBusDecoder_logic_rspPending && mainBusDecoder_logic_rspNoHit));
  assign mainBusDecoder_logic_masterPipelined_rsp_payload_data = _zz_CpuComplex_6_;
  assign _zz_CpuComplex_3_ = 1'b0;
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      cpu_dBus_cmd_halfPipe_regs_valid <= 1'b0;
      cpu_dBus_cmd_halfPipe_regs_ready <= 1'b1;
      mainBusDecoder_logic_rspPending <= 1'b0;
      mainBusDecoder_logic_rspNoHit <= 1'b0;
    end else begin
      if(_zz_CpuComplex_8_)begin
        cpu_dBus_cmd_halfPipe_regs_valid <= cpu_dBus_cmd_valid;
        cpu_dBus_cmd_halfPipe_regs_ready <= (! cpu_dBus_cmd_valid);
      end else begin
        cpu_dBus_cmd_halfPipe_regs_valid <= (! cpu_dBus_cmd_halfPipe_ready);
        cpu_dBus_cmd_halfPipe_regs_ready <= cpu_dBus_cmd_halfPipe_ready;
      end
      if(mainBusDecoder_logic_masterPipelined_rsp_valid)begin
        mainBusDecoder_logic_rspPending <= 1'b0;
      end
      if(((mainBusDecoder_logic_masterPipelined_cmd_valid && mainBusDecoder_logic_masterPipelined_cmd_ready) && (! mainBusDecoder_logic_masterPipelined_cmd_payload_write)))begin
        mainBusDecoder_logic_rspPending <= 1'b1;
      end
      mainBusDecoder_logic_rspNoHit <= 1'b0;
      if(mainBusDecoder_logic_noHit)begin
        mainBusDecoder_logic_rspNoHit <= 1'b1;
      end
    end
  end

  always @ (posedge clk_cpu) begin
    if(_zz_CpuComplex_8_)begin
      cpu_dBus_cmd_halfPipe_regs_payload_wr <= cpu_dBus_cmd_payload_wr;
      cpu_dBus_cmd_halfPipe_regs_payload_address <= cpu_dBus_cmd_payload_address;
      cpu_dBus_cmd_halfPipe_regs_payload_data <= cpu_dBus_cmd_payload_data;
      cpu_dBus_cmd_halfPipe_regs_payload_size <= cpu_dBus_cmd_payload_size;
    end
    if((mainBusDecoder_logic_masterPipelined_cmd_valid && mainBusDecoder_logic_masterPipelined_cmd_ready))begin
      mainBusDecoder_logic_rspSourceId <= mainBusDecoder_logic_hits_1;
    end
  end


endmodule

module CCApb3Timer (
  input      [7:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_apb_PSLVERROR,
  output              io_interrupt,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire                _zz_CCApb3Timer_7_;
  wire                _zz_CCApb3Timer_8_;
  wire                _zz_CCApb3Timer_9_;
  wire                _zz_CCApb3Timer_10_;
  reg        [1:0]    _zz_CCApb3Timer_11_;
  reg        [1:0]    _zz_CCApb3Timer_12_;
  wire                prescaler_1__io_overflow;
  wire                timerA_io_full;
  wire       [15:0]   timerA_io_value;
  wire                timerB_io_full;
  wire       [15:0]   timerB_io_value;
  wire       [1:0]    interruptCtrl_1__io_pendings;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [7:0]    _zz_CCApb3Timer_1_;
  reg                 _zz_CCApb3Timer_2_;
  reg        [1:0]    timerABridge_ticksEnable;
  reg        [0:0]    timerABridge_clearsEnable;
  reg                 timerABridge_busClearing;
  reg        [15:0]   timerA_io_limit_driver;
  reg                 _zz_CCApb3Timer_3_;
  reg                 _zz_CCApb3Timer_4_;
  reg        [1:0]    timerBBridge_ticksEnable;
  reg        [0:0]    timerBBridge_clearsEnable;
  reg                 timerBBridge_busClearing;
  reg        [15:0]   timerB_io_limit_driver;
  reg                 _zz_CCApb3Timer_5_;
  reg                 _zz_CCApb3Timer_6_;
  reg        [1:0]    interruptCtrl_1__io_masks_driver;

  Prescaler prescaler_1_ ( 
    .io_clear          (_zz_CCApb3Timer_2_        ), //i
    .io_limit          (_zz_CCApb3Timer_1_[7:0]   ), //i
    .io_overflow       (prescaler_1__io_overflow  ), //o
    .clk_cpu           (clk_cpu                   ), //i
    .clk_cpu_reset_    (clk_cpu_reset_            )  //i
  );
  Timer timerA ( 
    .io_tick           (_zz_CCApb3Timer_7_            ), //i
    .io_clear          (_zz_CCApb3Timer_8_            ), //i
    .io_limit          (timerA_io_limit_driver[15:0]  ), //i
    .io_full           (timerA_io_full                ), //o
    .io_value          (timerA_io_value[15:0]         ), //o
    .clk_cpu           (clk_cpu                       ), //i
    .clk_cpu_reset_    (clk_cpu_reset_                )  //i
  );
  Timer_1_ timerB ( 
    .io_tick           (_zz_CCApb3Timer_9_            ), //i
    .io_clear          (_zz_CCApb3Timer_10_           ), //i
    .io_limit          (timerB_io_limit_driver[15:0]  ), //i
    .io_full           (timerB_io_full                ), //o
    .io_value          (timerB_io_value[15:0]         ), //o
    .clk_cpu           (clk_cpu                       ), //i
    .clk_cpu_reset_    (clk_cpu_reset_                )  //i
  );
  InterruptCtrl interruptCtrl_1_ ( 
    .io_inputs         (_zz_CCApb3Timer_11_[1:0]               ), //i
    .io_clears         (_zz_CCApb3Timer_12_[1:0]               ), //i
    .io_masks          (interruptCtrl_1__io_masks_driver[1:0]  ), //i
    .io_pendings       (interruptCtrl_1__io_pendings[1:0]      ), //o
    .clk_cpu           (clk_cpu                                ), //i
    .clk_cpu_reset_    (clk_cpu_reset_                         )  //i
  );
  assign io_apb_PREADY = 1'b1;
  always @ (*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'b00000000 : begin
        io_apb_PRDATA[7 : 0] = _zz_CCApb3Timer_1_;
      end
      8'b01000000 : begin
        io_apb_PRDATA[1 : 0] = timerABridge_ticksEnable;
        io_apb_PRDATA[16 : 16] = timerABridge_clearsEnable;
      end
      8'b01000100 : begin
        io_apb_PRDATA[15 : 0] = timerA_io_limit_driver;
      end
      8'b01001000 : begin
        io_apb_PRDATA[15 : 0] = timerA_io_value;
      end
      8'b01010000 : begin
        io_apb_PRDATA[1 : 0] = timerBBridge_ticksEnable;
        io_apb_PRDATA[16 : 16] = timerBBridge_clearsEnable;
      end
      8'b01010100 : begin
        io_apb_PRDATA[15 : 0] = timerB_io_limit_driver;
      end
      8'b01011000 : begin
        io_apb_PRDATA[15 : 0] = timerB_io_value;
      end
      8'b00010000 : begin
        io_apb_PRDATA[1 : 0] = interruptCtrl_1__io_pendings;
      end
      8'b00010100 : begin
        io_apb_PRDATA[1 : 0] = interruptCtrl_1__io_masks_driver;
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PSLVERROR = 1'b0;
  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @ (*) begin
    _zz_CCApb3Timer_2_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
        if(busCtrl_doWrite)begin
          _zz_CCApb3Timer_2_ = 1'b1;
        end
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    timerABridge_busClearing = 1'b0;
    if(_zz_CCApb3Timer_3_)begin
      timerABridge_busClearing = 1'b1;
    end
    if(_zz_CCApb3Timer_4_)begin
      timerABridge_busClearing = 1'b1;
    end
  end

  always @ (*) begin
    _zz_CCApb3Timer_3_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
        if(busCtrl_doWrite)begin
          _zz_CCApb3Timer_3_ = 1'b1;
        end
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_CCApb3Timer_4_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
        if(busCtrl_doWrite)begin
          _zz_CCApb3Timer_4_ = 1'b1;
        end
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_CCApb3Timer_8_ = (((timerABridge_clearsEnable & timerA_io_full) != (1'b0)) || timerABridge_busClearing);
  assign _zz_CCApb3Timer_7_ = ((timerABridge_ticksEnable & {prescaler_1__io_overflow,1'b1}) != (2'b00));
  always @ (*) begin
    timerBBridge_busClearing = 1'b0;
    if(_zz_CCApb3Timer_5_)begin
      timerBBridge_busClearing = 1'b1;
    end
    if(_zz_CCApb3Timer_6_)begin
      timerBBridge_busClearing = 1'b1;
    end
  end

  always @ (*) begin
    _zz_CCApb3Timer_5_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
        if(busCtrl_doWrite)begin
          _zz_CCApb3Timer_5_ = 1'b1;
        end
      end
      8'b01011000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_CCApb3Timer_6_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
        if(busCtrl_doWrite)begin
          _zz_CCApb3Timer_6_ = 1'b1;
        end
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_CCApb3Timer_10_ = (((timerBBridge_clearsEnable & timerB_io_full) != (1'b0)) || timerBBridge_busClearing);
  assign _zz_CCApb3Timer_9_ = ((timerBBridge_ticksEnable & {prescaler_1__io_overflow,1'b1}) != (2'b00));
  always @ (*) begin
    _zz_CCApb3Timer_12_ = (2'b00);
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00010000 : begin
        if(busCtrl_doWrite)begin
          _zz_CCApb3Timer_12_ = io_apb_PWDATA[1 : 0];
        end
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_CCApb3Timer_11_[0] = timerA_io_full;
    _zz_CCApb3Timer_11_[1] = timerB_io_full;
  end

  assign io_interrupt = (interruptCtrl_1__io_pendings != (2'b00));
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      timerABridge_ticksEnable <= (2'b00);
      timerABridge_clearsEnable <= (1'b0);
      timerBBridge_ticksEnable <= (2'b00);
      timerBBridge_clearsEnable <= (1'b0);
      interruptCtrl_1__io_masks_driver <= (2'b00);
    end else begin
      case(io_apb_PADDR)
        8'b00000000 : begin
        end
        8'b01000000 : begin
          if(busCtrl_doWrite)begin
            timerABridge_ticksEnable <= io_apb_PWDATA[1 : 0];
            timerABridge_clearsEnable <= io_apb_PWDATA[16 : 16];
          end
        end
        8'b01000100 : begin
        end
        8'b01001000 : begin
        end
        8'b01010000 : begin
          if(busCtrl_doWrite)begin
            timerBBridge_ticksEnable <= io_apb_PWDATA[1 : 0];
            timerBBridge_clearsEnable <= io_apb_PWDATA[16 : 16];
          end
        end
        8'b01010100 : begin
        end
        8'b01011000 : begin
        end
        8'b00010000 : begin
        end
        8'b00010100 : begin
          if(busCtrl_doWrite)begin
            interruptCtrl_1__io_masks_driver <= io_apb_PWDATA[1 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge clk_cpu) begin
    case(io_apb_PADDR)
      8'b00000000 : begin
        if(busCtrl_doWrite)begin
          _zz_CCApb3Timer_1_ <= io_apb_PWDATA[7 : 0];
        end
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
        if(busCtrl_doWrite)begin
          timerA_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
        if(busCtrl_doWrite)begin
          timerB_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      8'b01011000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module Apb3Gpio (
  input      [3:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_apb_PSLVERROR,
  input      [2:0]    io_gpio_read,
  output     [2:0]    io_gpio_write,
  output     [2:0]    io_gpio_writeEnable,
  output     [2:0]    io_value,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire       [2:0]    io_gpio_read_buffercc_io_dataOut;
  wire                ctrl_askWrite;
  wire                ctrl_askRead;
  wire                ctrl_doWrite;
  wire                ctrl_doRead;
  reg        [2:0]    io_gpio_write_driver;
  reg        [2:0]    io_gpio_writeEnable_driver;

  BufferCC_1_ io_gpio_read_buffercc ( 
    .io_dataIn         (io_gpio_read[2:0]                      ), //i
    .io_dataOut        (io_gpio_read_buffercc_io_dataOut[2:0]  ), //o
    .clk_cpu           (clk_cpu                                ), //i
    .clk_cpu_reset_    (clk_cpu_reset_                         )  //i
  );
  assign io_value = io_gpio_read_buffercc_io_dataOut;
  assign io_apb_PREADY = 1'b1;
  always @ (*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      4'b0000 : begin
        io_apb_PRDATA[2 : 0] = io_value;
      end
      4'b0100 : begin
        io_apb_PRDATA[2 : 0] = io_gpio_write_driver;
      end
      4'b1000 : begin
        io_apb_PRDATA[2 : 0] = io_gpio_writeEnable_driver;
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PSLVERROR = 1'b0;
  assign ctrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign ctrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign ctrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign ctrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign io_gpio_write = io_gpio_write_driver;
  assign io_gpio_writeEnable = io_gpio_writeEnable_driver;
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      io_gpio_writeEnable_driver <= (3'b000);
    end else begin
      case(io_apb_PADDR)
        4'b0000 : begin
        end
        4'b0100 : begin
        end
        4'b1000 : begin
          if(ctrl_doWrite)begin
            io_gpio_writeEnable_driver <= io_apb_PWDATA[2 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge clk_cpu) begin
    case(io_apb_PADDR)
      4'b0000 : begin
      end
      4'b0100 : begin
        if(ctrl_doWrite)begin
          io_gpio_write_driver <= io_apb_PWDATA[2 : 0];
        end
      end
      4'b1000 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module Apb3UartCtrl (
  input      [4:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_interrupt,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire                _zz_Apb3UartCtrl_9_;
  reg                 _zz_Apb3UartCtrl_10_;
  wire                _zz_Apb3UartCtrl_11_;
  wire                uartCtrl_1__io_write_ready;
  wire                uartCtrl_1__io_read_valid;
  wire       [7:0]    uartCtrl_1__io_read_payload;
  wire                uartCtrl_1__io_uart_txd;
  wire                uartCtrl_1__io_readError;
  wire                uartCtrl_1__io_readBreak;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload;
  wire       [7:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy;
  wire       [7:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_availability;
  wire                uartCtrl_1__io_read_queueWithOccupancy_io_push_ready;
  wire                uartCtrl_1__io_read_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    uartCtrl_1__io_read_queueWithOccupancy_io_pop_payload;
  wire       [5:0]    uartCtrl_1__io_read_queueWithOccupancy_io_occupancy;
  wire       [5:0]    uartCtrl_1__io_read_queueWithOccupancy_io_availability;
  wire       [0:0]    _zz_Apb3UartCtrl_12_;
  wire       [0:0]    _zz_Apb3UartCtrl_13_;
  wire       [0:0]    _zz_Apb3UartCtrl_14_;
  wire       [0:0]    _zz_Apb3UartCtrl_15_;
  wire       [0:0]    _zz_Apb3UartCtrl_16_;
  wire       [0:0]    _zz_Apb3UartCtrl_17_;
  wire       [0:0]    _zz_Apb3UartCtrl_18_;
  wire       [0:0]    _zz_Apb3UartCtrl_19_;
  wire       [0:0]    _zz_Apb3UartCtrl_20_;
  wire       [0:0]    _zz_Apb3UartCtrl_21_;
  wire       [19:0]   _zz_Apb3UartCtrl_22_;
  wire       [19:0]   _zz_Apb3UartCtrl_23_;
  wire       [0:0]    _zz_Apb3UartCtrl_24_;
  wire       [0:0]    _zz_Apb3UartCtrl_25_;
  wire       [7:0]    _zz_Apb3UartCtrl_26_;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [2:0]    bridge_uartConfigReg_frame_dataLength;
  reg        `UartStopType_defaultEncoding_type bridge_uartConfigReg_frame_stop;
  reg        `UartParityType_defaultEncoding_type bridge_uartConfigReg_frame_parity;
  reg        [19:0]   bridge_uartConfigReg_clockDivider;
  reg                 _zz_Apb3UartCtrl_1_;
  wire                bridge_write_streamUnbuffered_valid;
  wire                bridge_write_streamUnbuffered_ready;
  wire       [7:0]    bridge_write_streamUnbuffered_payload;
  reg                 bridge_read_streamBreaked_valid;
  reg                 bridge_read_streamBreaked_ready;
  wire       [7:0]    bridge_read_streamBreaked_payload;
  reg                 bridge_interruptCtrl_writeIntEnable;
  reg                 bridge_interruptCtrl_readIntEnable;
  wire                bridge_interruptCtrl_readInt;
  wire                bridge_interruptCtrl_writeInt;
  wire                bridge_interruptCtrl_interrupt;
  reg                 bridge_misc_readError;
  reg                 _zz_Apb3UartCtrl_2_;
  reg                 bridge_misc_readOverflowError;
  reg                 _zz_Apb3UartCtrl_3_;
  reg                 bridge_misc_breakDetected;
  reg                 uartCtrl_1__io_readBreak_regNext;
  reg                 _zz_Apb3UartCtrl_4_;
  reg                 bridge_misc_doBreak;
  reg                 _zz_Apb3UartCtrl_5_;
  reg                 _zz_Apb3UartCtrl_6_;
  wire       `UartParityType_defaultEncoding_type _zz_Apb3UartCtrl_7_;
  wire       `UartStopType_defaultEncoding_type _zz_Apb3UartCtrl_8_;
  `ifndef SYNTHESIS
  reg [23:0] bridge_uartConfigReg_frame_stop_string;
  reg [31:0] bridge_uartConfigReg_frame_parity_string;
  reg [31:0] _zz_Apb3UartCtrl_7__string;
  reg [23:0] _zz_Apb3UartCtrl_8__string;
  `endif


  assign _zz_Apb3UartCtrl_12_ = io_apb_PWDATA[0 : 0];
  assign _zz_Apb3UartCtrl_13_ = (1'b0);
  assign _zz_Apb3UartCtrl_14_ = io_apb_PWDATA[1 : 1];
  assign _zz_Apb3UartCtrl_15_ = (1'b0);
  assign _zz_Apb3UartCtrl_16_ = io_apb_PWDATA[9 : 9];
  assign _zz_Apb3UartCtrl_17_ = (1'b0);
  assign _zz_Apb3UartCtrl_18_ = io_apb_PWDATA[10 : 10];
  assign _zz_Apb3UartCtrl_19_ = (1'b1);
  assign _zz_Apb3UartCtrl_20_ = io_apb_PWDATA[11 : 11];
  assign _zz_Apb3UartCtrl_21_ = (1'b0);
  assign _zz_Apb3UartCtrl_22_ = io_apb_PWDATA[19 : 0];
  assign _zz_Apb3UartCtrl_23_ = _zz_Apb3UartCtrl_22_;
  assign _zz_Apb3UartCtrl_24_ = io_apb_PWDATA[0 : 0];
  assign _zz_Apb3UartCtrl_25_ = io_apb_PWDATA[1 : 1];
  assign _zz_Apb3UartCtrl_26_ = (8'hff - bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy);
  UartCtrl uartCtrl_1_ ( 
    .io_config_frame_dataLength    (bridge_uartConfigReg_frame_dataLength[2:0]                            ), //i
    .io_config_frame_stop          (bridge_uartConfigReg_frame_stop                                       ), //i
    .io_config_frame_parity        (bridge_uartConfigReg_frame_parity[1:0]                                ), //i
    .io_config_clockDivider        (bridge_uartConfigReg_clockDivider[19:0]                               ), //i
    .io_write_valid                (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid         ), //i
    .io_write_ready                (uartCtrl_1__io_write_ready                                            ), //o
    .io_write_payload              (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0]  ), //i
    .io_read_valid                 (uartCtrl_1__io_read_valid                                             ), //o
    .io_read_ready                 (uartCtrl_1__io_read_queueWithOccupancy_io_push_ready                  ), //i
    .io_read_payload               (uartCtrl_1__io_read_payload[7:0]                                      ), //o
    .io_uart_txd                   (uartCtrl_1__io_uart_txd                                               ), //o
    .io_uart_rxd                   (io_uart_rxd                                                           ), //i
    .io_readError                  (uartCtrl_1__io_readError                                              ), //o
    .io_writeBreak                 (bridge_misc_doBreak                                                   ), //i
    .io_readBreak                  (uartCtrl_1__io_readBreak                                              ), //o
    .clk_cpu                       (clk_cpu                                                               ), //i
    .clk_cpu_reset_                (clk_cpu_reset_                                                        )  //i
  );
  StreamFifo bridge_write_streamUnbuffered_queueWithOccupancy ( 
    .io_push_valid      (bridge_write_streamUnbuffered_valid                                    ), //i
    .io_push_ready      (bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready         ), //o
    .io_push_payload    (bridge_write_streamUnbuffered_payload[7:0]                             ), //i
    .io_pop_valid       (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid          ), //o
    .io_pop_ready       (uartCtrl_1__io_write_ready                                             ), //i
    .io_pop_payload     (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0]   ), //o
    .io_flush           (_zz_Apb3UartCtrl_9_                                                    ), //i
    .io_occupancy       (bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy[7:0]     ), //o
    .io_availability    (bridge_write_streamUnbuffered_queueWithOccupancy_io_availability[7:0]  ), //o
    .clk_cpu            (clk_cpu                                                                ), //i
    .clk_cpu_reset_     (clk_cpu_reset_                                                         )  //i
  );
  StreamFifo_1_ uartCtrl_1__io_read_queueWithOccupancy ( 
    .io_push_valid      (uartCtrl_1__io_read_valid                                    ), //i
    .io_push_ready      (uartCtrl_1__io_read_queueWithOccupancy_io_push_ready         ), //o
    .io_push_payload    (uartCtrl_1__io_read_payload[7:0]                             ), //i
    .io_pop_valid       (uartCtrl_1__io_read_queueWithOccupancy_io_pop_valid          ), //o
    .io_pop_ready       (_zz_Apb3UartCtrl_10_                                         ), //i
    .io_pop_payload     (uartCtrl_1__io_read_queueWithOccupancy_io_pop_payload[7:0]   ), //o
    .io_flush           (_zz_Apb3UartCtrl_11_                                         ), //i
    .io_occupancy       (uartCtrl_1__io_read_queueWithOccupancy_io_occupancy[5:0]     ), //o
    .io_availability    (uartCtrl_1__io_read_queueWithOccupancy_io_availability[5:0]  ), //o
    .clk_cpu            (clk_cpu                                                      ), //i
    .clk_cpu_reset_     (clk_cpu_reset_                                               )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_uartConfigReg_frame_stop)
      `UartStopType_defaultEncoding_ONE : bridge_uartConfigReg_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : bridge_uartConfigReg_frame_stop_string = "TWO";
      default : bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(bridge_uartConfigReg_frame_parity)
      `UartParityType_defaultEncoding_NONE : bridge_uartConfigReg_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : bridge_uartConfigReg_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_Apb3UartCtrl_7_)
      `UartParityType_defaultEncoding_NONE : _zz_Apb3UartCtrl_7__string = "NONE";
      `UartParityType_defaultEncoding_EVEN : _zz_Apb3UartCtrl_7__string = "EVEN";
      `UartParityType_defaultEncoding_ODD : _zz_Apb3UartCtrl_7__string = "ODD ";
      default : _zz_Apb3UartCtrl_7__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_Apb3UartCtrl_8_)
      `UartStopType_defaultEncoding_ONE : _zz_Apb3UartCtrl_8__string = "ONE";
      `UartStopType_defaultEncoding_TWO : _zz_Apb3UartCtrl_8__string = "TWO";
      default : _zz_Apb3UartCtrl_8__string = "???";
    endcase
  end
  `endif

  assign io_uart_txd = uartCtrl_1__io_uart_txd;
  assign io_apb_PREADY = 1'b1;
  always @ (*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
        io_apb_PRDATA[16 : 16] = (bridge_read_streamBreaked_valid ^ 1'b0);
        io_apb_PRDATA[7 : 0] = bridge_read_streamBreaked_payload;
      end
      5'b00100 : begin
        io_apb_PRDATA[23 : 16] = _zz_Apb3UartCtrl_26_;
        io_apb_PRDATA[15 : 15] = bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
        io_apb_PRDATA[29 : 24] = uartCtrl_1__io_read_queueWithOccupancy_io_occupancy;
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_writeIntEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_readIntEnable;
        io_apb_PRDATA[8 : 8] = bridge_interruptCtrl_writeInt;
        io_apb_PRDATA[9 : 9] = bridge_interruptCtrl_readInt;
      end
      5'b10000 : begin
        io_apb_PRDATA[0 : 0] = bridge_misc_readError;
        io_apb_PRDATA[1 : 1] = bridge_misc_readOverflowError;
        io_apb_PRDATA[8 : 8] = uartCtrl_1__io_readBreak;
        io_apb_PRDATA[9 : 9] = bridge_misc_breakDetected;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @ (*) begin
    _zz_Apb3UartCtrl_1_ = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
        if(busCtrl_doWrite)begin
          _zz_Apb3UartCtrl_1_ = 1'b1;
        end
      end
      5'b00100 : begin
      end
      5'b10000 : begin
      end
      default : begin
      end
    endcase
  end

  assign bridge_write_streamUnbuffered_valid = _zz_Apb3UartCtrl_1_;
  assign bridge_write_streamUnbuffered_payload = io_apb_PWDATA[7 : 0];
  assign bridge_write_streamUnbuffered_ready = bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  always @ (*) begin
    bridge_read_streamBreaked_valid = uartCtrl_1__io_read_queueWithOccupancy_io_pop_valid;
    if(uartCtrl_1__io_readBreak)begin
      bridge_read_streamBreaked_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_Apb3UartCtrl_10_ = bridge_read_streamBreaked_ready;
    if(uartCtrl_1__io_readBreak)begin
      _zz_Apb3UartCtrl_10_ = 1'b1;
    end
  end

  assign bridge_read_streamBreaked_payload = uartCtrl_1__io_read_queueWithOccupancy_io_pop_payload;
  always @ (*) begin
    bridge_read_streamBreaked_ready = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
        if(busCtrl_doRead)begin
          bridge_read_streamBreaked_ready = 1'b1;
        end
      end
      5'b00100 : begin
      end
      5'b10000 : begin
      end
      default : begin
      end
    endcase
  end

  assign bridge_interruptCtrl_readInt = (bridge_interruptCtrl_readIntEnable && bridge_read_streamBreaked_valid);
  assign bridge_interruptCtrl_writeInt = (bridge_interruptCtrl_writeIntEnable && (! bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid));
  assign bridge_interruptCtrl_interrupt = (bridge_interruptCtrl_readInt || bridge_interruptCtrl_writeInt);
  always @ (*) begin
    _zz_Apb3UartCtrl_2_ = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_Apb3UartCtrl_2_ = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_Apb3UartCtrl_3_ = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_Apb3UartCtrl_3_ = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_Apb3UartCtrl_4_ = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_Apb3UartCtrl_4_ = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_Apb3UartCtrl_5_ = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_Apb3UartCtrl_5_ = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_Apb3UartCtrl_6_ = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_Apb3UartCtrl_6_ = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign io_interrupt = bridge_interruptCtrl_interrupt;
  assign _zz_Apb3UartCtrl_7_ = io_apb_PWDATA[9 : 8];
  assign _zz_Apb3UartCtrl_8_ = io_apb_PWDATA[16 : 16];
  assign _zz_Apb3UartCtrl_9_ = 1'b0;
  assign _zz_Apb3UartCtrl_11_ = 1'b0;
  always @ (posedge clk_cpu) begin
    if(!clk_cpu_reset_) begin
      bridge_uartConfigReg_clockDivider <= 20'h0;
      bridge_uartConfigReg_clockDivider <= 20'h00035;
      bridge_interruptCtrl_writeIntEnable <= 1'b0;
      bridge_interruptCtrl_readIntEnable <= 1'b0;
      bridge_misc_readError <= 1'b0;
      bridge_misc_readOverflowError <= 1'b0;
      bridge_misc_breakDetected <= 1'b0;
      bridge_misc_doBreak <= 1'b0;
    end else begin
      if(_zz_Apb3UartCtrl_2_)begin
        if(_zz_Apb3UartCtrl_12_[0])begin
          bridge_misc_readError <= _zz_Apb3UartCtrl_13_[0];
        end
      end
      if(uartCtrl_1__io_readError)begin
        bridge_misc_readError <= 1'b1;
      end
      if(_zz_Apb3UartCtrl_3_)begin
        if(_zz_Apb3UartCtrl_14_[0])begin
          bridge_misc_readOverflowError <= _zz_Apb3UartCtrl_15_[0];
        end
      end
      if((uartCtrl_1__io_read_valid && (! uartCtrl_1__io_read_queueWithOccupancy_io_push_ready)))begin
        bridge_misc_readOverflowError <= 1'b1;
      end
      if((uartCtrl_1__io_readBreak && (! uartCtrl_1__io_readBreak_regNext)))begin
        bridge_misc_breakDetected <= 1'b1;
      end
      if(_zz_Apb3UartCtrl_4_)begin
        if(_zz_Apb3UartCtrl_16_[0])begin
          bridge_misc_breakDetected <= _zz_Apb3UartCtrl_17_[0];
        end
      end
      if(_zz_Apb3UartCtrl_5_)begin
        if(_zz_Apb3UartCtrl_18_[0])begin
          bridge_misc_doBreak <= _zz_Apb3UartCtrl_19_[0];
        end
      end
      if(_zz_Apb3UartCtrl_6_)begin
        if(_zz_Apb3UartCtrl_20_[0])begin
          bridge_misc_doBreak <= _zz_Apb3UartCtrl_21_[0];
        end
      end
      case(io_apb_PADDR)
        5'b01000 : begin
          if(busCtrl_doWrite)begin
            bridge_uartConfigReg_clockDivider[19 : 0] <= _zz_Apb3UartCtrl_23_;
          end
        end
        5'b01100 : begin
        end
        5'b00000 : begin
        end
        5'b00100 : begin
          if(busCtrl_doWrite)begin
            bridge_interruptCtrl_writeIntEnable <= _zz_Apb3UartCtrl_24_[0];
            bridge_interruptCtrl_readIntEnable <= _zz_Apb3UartCtrl_25_[0];
          end
        end
        5'b10000 : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge clk_cpu) begin
    uartCtrl_1__io_readBreak_regNext <= uartCtrl_1__io_readBreak;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
        if(busCtrl_doWrite)begin
          bridge_uartConfigReg_frame_dataLength <= io_apb_PWDATA[2 : 0];
          bridge_uartConfigReg_frame_parity <= _zz_Apb3UartCtrl_7_;
          bridge_uartConfigReg_frame_stop <= _zz_Apb3UartCtrl_8_;
        end
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module Apb3Decoder (
  input      [19:0]   io_input_PADDR,
  input      [0:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output reg          io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output reg          io_input_PSLVERROR,
  output     [19:0]   io_output_PADDR,
  output reg [2:0]    io_output_PSEL,
  output              io_output_PENABLE,
  input               io_output_PREADY,
  output              io_output_PWRITE,
  output     [31:0]   io_output_PWDATA,
  input      [31:0]   io_output_PRDATA,
  input               io_output_PSLVERROR 
);
  wire                _zz_Apb3Decoder_1_;

  assign _zz_Apb3Decoder_1_ = (io_input_PSEL[0] && (io_output_PSEL == (3'b000)));
  assign io_output_PADDR = io_input_PADDR;
  assign io_output_PENABLE = io_input_PENABLE;
  assign io_output_PWRITE = io_input_PWRITE;
  assign io_output_PWDATA = io_input_PWDATA;
  always @ (*) begin
    io_output_PSEL[0] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h0) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h10000) && io_input_PSEL[0]);
    io_output_PSEL[2] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h20000) && io_input_PSEL[0]);
  end

  always @ (*) begin
    io_input_PREADY = io_output_PREADY;
    if(_zz_Apb3Decoder_1_)begin
      io_input_PREADY = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
  always @ (*) begin
    io_input_PSLVERROR = io_output_PSLVERROR;
    if(_zz_Apb3Decoder_1_)begin
      io_input_PSLVERROR = 1'b1;
    end
  end


endmodule

module Apb3Router (
  input      [19:0]   io_input_PADDR,
  input      [2:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output              io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output              io_input_PSLVERROR,
  output     [19:0]   io_outputs_0_PADDR,
  output     [0:0]    io_outputs_0_PSEL,
  output              io_outputs_0_PENABLE,
  input               io_outputs_0_PREADY,
  output              io_outputs_0_PWRITE,
  output     [31:0]   io_outputs_0_PWDATA,
  input      [31:0]   io_outputs_0_PRDATA,
  input               io_outputs_0_PSLVERROR,
  output     [19:0]   io_outputs_1_PADDR,
  output     [0:0]    io_outputs_1_PSEL,
  output              io_outputs_1_PENABLE,
  input               io_outputs_1_PREADY,
  output              io_outputs_1_PWRITE,
  output     [31:0]   io_outputs_1_PWDATA,
  input      [31:0]   io_outputs_1_PRDATA,
  input               io_outputs_1_PSLVERROR,
  output     [19:0]   io_outputs_2_PADDR,
  output     [0:0]    io_outputs_2_PSEL,
  output              io_outputs_2_PENABLE,
  input               io_outputs_2_PREADY,
  output              io_outputs_2_PWRITE,
  output     [31:0]   io_outputs_2_PWDATA,
  input      [31:0]   io_outputs_2_PRDATA,
  input               io_outputs_2_PSLVERROR,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  reg                 _zz_Apb3Router_3_;
  reg        [31:0]   _zz_Apb3Router_4_;
  reg                 _zz_Apb3Router_5_;
  wire                _zz_Apb3Router_1_;
  wire                _zz_Apb3Router_2_;
  reg        [1:0]    selIndex;

  always @(*) begin
    case(selIndex)
      2'b00 : begin
        _zz_Apb3Router_3_ = io_outputs_0_PREADY;
        _zz_Apb3Router_4_ = io_outputs_0_PRDATA;
        _zz_Apb3Router_5_ = io_outputs_0_PSLVERROR;
      end
      2'b01 : begin
        _zz_Apb3Router_3_ = io_outputs_1_PREADY;
        _zz_Apb3Router_4_ = io_outputs_1_PRDATA;
        _zz_Apb3Router_5_ = io_outputs_1_PSLVERROR;
      end
      default : begin
        _zz_Apb3Router_3_ = io_outputs_2_PREADY;
        _zz_Apb3Router_4_ = io_outputs_2_PRDATA;
        _zz_Apb3Router_5_ = io_outputs_2_PSLVERROR;
      end
    endcase
  end

  assign io_outputs_0_PADDR = io_input_PADDR;
  assign io_outputs_0_PENABLE = io_input_PENABLE;
  assign io_outputs_0_PSEL[0] = io_input_PSEL[0];
  assign io_outputs_0_PWRITE = io_input_PWRITE;
  assign io_outputs_0_PWDATA = io_input_PWDATA;
  assign io_outputs_1_PADDR = io_input_PADDR;
  assign io_outputs_1_PENABLE = io_input_PENABLE;
  assign io_outputs_1_PSEL[0] = io_input_PSEL[1];
  assign io_outputs_1_PWRITE = io_input_PWRITE;
  assign io_outputs_1_PWDATA = io_input_PWDATA;
  assign io_outputs_2_PADDR = io_input_PADDR;
  assign io_outputs_2_PENABLE = io_input_PENABLE;
  assign io_outputs_2_PSEL[0] = io_input_PSEL[2];
  assign io_outputs_2_PWRITE = io_input_PWRITE;
  assign io_outputs_2_PWDATA = io_input_PWDATA;
  assign _zz_Apb3Router_1_ = io_input_PSEL[1];
  assign _zz_Apb3Router_2_ = io_input_PSEL[2];
  assign io_input_PREADY = _zz_Apb3Router_3_;
  assign io_input_PRDATA = _zz_Apb3Router_4_;
  assign io_input_PSLVERROR = _zz_Apb3Router_5_;
  always @ (posedge clk_cpu) begin
    selIndex <= {_zz_Apb3Router_2_,_zz_Apb3Router_1_};
  end


endmodule

module CpuTop (
  output              io_led_red,
  output              io_led_green,
  output              io_led_blue,
  output              io_uart_txd,
  input               io_uart_rxd,
  input               clk_cpu,
  input               clk_cpu_reset_ 
);
  wire                _zz_CpuTop_1_;
  wire       [7:0]    _zz_CpuTop_2_;
  wire       [3:0]    _zz_CpuTop_3_;
  reg        [2:0]    _zz_CpuTop_4_;
  wire       [4:0]    _zz_CpuTop_5_;
  wire                _zz_CpuTop_6_;
  wire       [19:0]   u_cpu_io_apb_PADDR;
  wire       [0:0]    u_cpu_io_apb_PSEL;
  wire                u_cpu_io_apb_PENABLE;
  wire                u_cpu_io_apb_PWRITE;
  wire       [31:0]   u_cpu_io_apb_PWDATA;
  wire                u_timer_io_apb_PREADY;
  wire       [31:0]   u_timer_io_apb_PRDATA;
  wire                u_timer_io_apb_PSLVERROR;
  wire                u_timer_io_interrupt;
  wire                u_led_ctrl_io_apb_PREADY;
  wire       [31:0]   u_led_ctrl_io_apb_PRDATA;
  wire                u_led_ctrl_io_apb_PSLVERROR;
  wire       [2:0]    u_led_ctrl_io_gpio_write;
  wire       [2:0]    u_led_ctrl_io_gpio_writeEnable;
  wire       [2:0]    u_led_ctrl_io_value;
  wire                u_uart_io_apb_PREADY;
  wire       [31:0]   u_uart_io_apb_PRDATA;
  wire                u_uart_io_uart_txd;
  wire                u_uart_io_interrupt;
  wire                io_apb_decoder_io_input_PREADY;
  wire       [31:0]   io_apb_decoder_io_input_PRDATA;
  wire                io_apb_decoder_io_input_PSLVERROR;
  wire       [19:0]   io_apb_decoder_io_output_PADDR;
  wire       [2:0]    io_apb_decoder_io_output_PSEL;
  wire                io_apb_decoder_io_output_PENABLE;
  wire                io_apb_decoder_io_output_PWRITE;
  wire       [31:0]   io_apb_decoder_io_output_PWDATA;
  wire                apb3Router_1__io_input_PREADY;
  wire       [31:0]   apb3Router_1__io_input_PRDATA;
  wire                apb3Router_1__io_input_PSLVERROR;
  wire       [19:0]   apb3Router_1__io_outputs_0_PADDR;
  wire       [0:0]    apb3Router_1__io_outputs_0_PSEL;
  wire                apb3Router_1__io_outputs_0_PENABLE;
  wire                apb3Router_1__io_outputs_0_PWRITE;
  wire       [31:0]   apb3Router_1__io_outputs_0_PWDATA;
  wire       [19:0]   apb3Router_1__io_outputs_1_PADDR;
  wire       [0:0]    apb3Router_1__io_outputs_1_PSEL;
  wire                apb3Router_1__io_outputs_1_PENABLE;
  wire                apb3Router_1__io_outputs_1_PWRITE;
  wire       [31:0]   apb3Router_1__io_outputs_1_PWDATA;
  wire       [19:0]   apb3Router_1__io_outputs_2_PADDR;
  wire       [0:0]    apb3Router_1__io_outputs_2_PSEL;
  wire                apb3Router_1__io_outputs_2_PENABLE;
  wire                apb3Router_1__io_outputs_2_PWRITE;
  wire       [31:0]   apb3Router_1__io_outputs_2_PWDATA;

  CpuComplex u_cpu ( 
    .io_apb_PADDR            (u_cpu_io_apb_PADDR[19:0]              ), //o
    .io_apb_PSEL             (u_cpu_io_apb_PSEL                     ), //o
    .io_apb_PENABLE          (u_cpu_io_apb_PENABLE                  ), //o
    .io_apb_PREADY           (io_apb_decoder_io_input_PREADY        ), //i
    .io_apb_PWRITE           (u_cpu_io_apb_PWRITE                   ), //o
    .io_apb_PWDATA           (u_cpu_io_apb_PWDATA[31:0]             ), //o
    .io_apb_PRDATA           (io_apb_decoder_io_input_PRDATA[31:0]  ), //i
    .io_apb_PSLVERROR        (io_apb_decoder_io_input_PSLVERROR     ), //i
    .io_externalInterrupt    (_zz_CpuTop_1_                         ), //i
    .io_timerInterrupt       (u_timer_io_interrupt                  ), //i
    .clk_cpu                 (clk_cpu                               ), //i
    .clk_cpu_reset_          (clk_cpu_reset_                        )  //i
  );
  CCApb3Timer u_timer ( 
    .io_apb_PADDR        (_zz_CpuTop_2_[7:0]                       ), //i
    .io_apb_PSEL         (apb3Router_1__io_outputs_0_PSEL          ), //i
    .io_apb_PENABLE      (apb3Router_1__io_outputs_0_PENABLE       ), //i
    .io_apb_PREADY       (u_timer_io_apb_PREADY                    ), //o
    .io_apb_PWRITE       (apb3Router_1__io_outputs_0_PWRITE        ), //i
    .io_apb_PWDATA       (apb3Router_1__io_outputs_0_PWDATA[31:0]  ), //i
    .io_apb_PRDATA       (u_timer_io_apb_PRDATA[31:0]              ), //o
    .io_apb_PSLVERROR    (u_timer_io_apb_PSLVERROR                 ), //o
    .io_interrupt        (u_timer_io_interrupt                     ), //o
    .clk_cpu             (clk_cpu                                  ), //i
    .clk_cpu_reset_      (clk_cpu_reset_                           )  //i
  );
  Apb3Gpio u_led_ctrl ( 
    .io_apb_PADDR           (_zz_CpuTop_3_[3:0]                       ), //i
    .io_apb_PSEL            (apb3Router_1__io_outputs_1_PSEL          ), //i
    .io_apb_PENABLE         (apb3Router_1__io_outputs_1_PENABLE       ), //i
    .io_apb_PREADY          (u_led_ctrl_io_apb_PREADY                 ), //o
    .io_apb_PWRITE          (apb3Router_1__io_outputs_1_PWRITE        ), //i
    .io_apb_PWDATA          (apb3Router_1__io_outputs_1_PWDATA[31:0]  ), //i
    .io_apb_PRDATA          (u_led_ctrl_io_apb_PRDATA[31:0]           ), //o
    .io_apb_PSLVERROR       (u_led_ctrl_io_apb_PSLVERROR              ), //o
    .io_gpio_read           (_zz_CpuTop_4_[2:0]                       ), //i
    .io_gpio_write          (u_led_ctrl_io_gpio_write[2:0]            ), //o
    .io_gpio_writeEnable    (u_led_ctrl_io_gpio_writeEnable[2:0]      ), //o
    .io_value               (u_led_ctrl_io_value[2:0]                 ), //o
    .clk_cpu                (clk_cpu                                  ), //i
    .clk_cpu_reset_         (clk_cpu_reset_                           )  //i
  );
  Apb3UartCtrl u_uart ( 
    .io_apb_PADDR      (_zz_CpuTop_5_[4:0]                       ), //i
    .io_apb_PSEL       (apb3Router_1__io_outputs_2_PSEL          ), //i
    .io_apb_PENABLE    (apb3Router_1__io_outputs_2_PENABLE       ), //i
    .io_apb_PREADY     (u_uart_io_apb_PREADY                     ), //o
    .io_apb_PWRITE     (apb3Router_1__io_outputs_2_PWRITE        ), //i
    .io_apb_PWDATA     (apb3Router_1__io_outputs_2_PWDATA[31:0]  ), //i
    .io_apb_PRDATA     (u_uart_io_apb_PRDATA[31:0]               ), //o
    .io_uart_txd       (u_uart_io_uart_txd                       ), //o
    .io_uart_rxd       (io_uart_rxd                              ), //i
    .io_interrupt      (u_uart_io_interrupt                      ), //o
    .clk_cpu           (clk_cpu                                  ), //i
    .clk_cpu_reset_    (clk_cpu_reset_                           )  //i
  );
  Apb3Decoder io_apb_decoder ( 
    .io_input_PADDR         (u_cpu_io_apb_PADDR[19:0]               ), //i
    .io_input_PSEL          (u_cpu_io_apb_PSEL                      ), //i
    .io_input_PENABLE       (u_cpu_io_apb_PENABLE                   ), //i
    .io_input_PREADY        (io_apb_decoder_io_input_PREADY         ), //o
    .io_input_PWRITE        (u_cpu_io_apb_PWRITE                    ), //i
    .io_input_PWDATA        (u_cpu_io_apb_PWDATA[31:0]              ), //i
    .io_input_PRDATA        (io_apb_decoder_io_input_PRDATA[31:0]   ), //o
    .io_input_PSLVERROR     (io_apb_decoder_io_input_PSLVERROR      ), //o
    .io_output_PADDR        (io_apb_decoder_io_output_PADDR[19:0]   ), //o
    .io_output_PSEL         (io_apb_decoder_io_output_PSEL[2:0]     ), //o
    .io_output_PENABLE      (io_apb_decoder_io_output_PENABLE       ), //o
    .io_output_PREADY       (apb3Router_1__io_input_PREADY          ), //i
    .io_output_PWRITE       (io_apb_decoder_io_output_PWRITE        ), //o
    .io_output_PWDATA       (io_apb_decoder_io_output_PWDATA[31:0]  ), //o
    .io_output_PRDATA       (apb3Router_1__io_input_PRDATA[31:0]    ), //i
    .io_output_PSLVERROR    (apb3Router_1__io_input_PSLVERROR       )  //i
  );
  Apb3Router apb3Router_1_ ( 
    .io_input_PADDR            (io_apb_decoder_io_output_PADDR[19:0]     ), //i
    .io_input_PSEL             (io_apb_decoder_io_output_PSEL[2:0]       ), //i
    .io_input_PENABLE          (io_apb_decoder_io_output_PENABLE         ), //i
    .io_input_PREADY           (apb3Router_1__io_input_PREADY            ), //o
    .io_input_PWRITE           (io_apb_decoder_io_output_PWRITE          ), //i
    .io_input_PWDATA           (io_apb_decoder_io_output_PWDATA[31:0]    ), //i
    .io_input_PRDATA           (apb3Router_1__io_input_PRDATA[31:0]      ), //o
    .io_input_PSLVERROR        (apb3Router_1__io_input_PSLVERROR         ), //o
    .io_outputs_0_PADDR        (apb3Router_1__io_outputs_0_PADDR[19:0]   ), //o
    .io_outputs_0_PSEL         (apb3Router_1__io_outputs_0_PSEL          ), //o
    .io_outputs_0_PENABLE      (apb3Router_1__io_outputs_0_PENABLE       ), //o
    .io_outputs_0_PREADY       (u_timer_io_apb_PREADY                    ), //i
    .io_outputs_0_PWRITE       (apb3Router_1__io_outputs_0_PWRITE        ), //o
    .io_outputs_0_PWDATA       (apb3Router_1__io_outputs_0_PWDATA[31:0]  ), //o
    .io_outputs_0_PRDATA       (u_timer_io_apb_PRDATA[31:0]              ), //i
    .io_outputs_0_PSLVERROR    (u_timer_io_apb_PSLVERROR                 ), //i
    .io_outputs_1_PADDR        (apb3Router_1__io_outputs_1_PADDR[19:0]   ), //o
    .io_outputs_1_PSEL         (apb3Router_1__io_outputs_1_PSEL          ), //o
    .io_outputs_1_PENABLE      (apb3Router_1__io_outputs_1_PENABLE       ), //o
    .io_outputs_1_PREADY       (u_led_ctrl_io_apb_PREADY                 ), //i
    .io_outputs_1_PWRITE       (apb3Router_1__io_outputs_1_PWRITE        ), //o
    .io_outputs_1_PWDATA       (apb3Router_1__io_outputs_1_PWDATA[31:0]  ), //o
    .io_outputs_1_PRDATA       (u_led_ctrl_io_apb_PRDATA[31:0]           ), //i
    .io_outputs_1_PSLVERROR    (u_led_ctrl_io_apb_PSLVERROR              ), //i
    .io_outputs_2_PADDR        (apb3Router_1__io_outputs_2_PADDR[19:0]   ), //o
    .io_outputs_2_PSEL         (apb3Router_1__io_outputs_2_PSEL          ), //o
    .io_outputs_2_PENABLE      (apb3Router_1__io_outputs_2_PENABLE       ), //o
    .io_outputs_2_PREADY       (u_uart_io_apb_PREADY                     ), //i
    .io_outputs_2_PWRITE       (apb3Router_1__io_outputs_2_PWRITE        ), //o
    .io_outputs_2_PWDATA       (apb3Router_1__io_outputs_2_PWDATA[31:0]  ), //o
    .io_outputs_2_PRDATA       (u_uart_io_apb_PRDATA[31:0]               ), //i
    .io_outputs_2_PSLVERROR    (_zz_CpuTop_6_                            ), //i
    .clk_cpu                   (clk_cpu                                  ), //i
    .clk_cpu_reset_            (clk_cpu_reset_                           )  //i
  );
  assign _zz_CpuTop_1_ = 1'b0;
  assign io_led_red = u_led_ctrl_io_gpio_write[0];
  assign io_led_green = u_led_ctrl_io_gpio_write[1];
  assign io_led_blue = u_led_ctrl_io_gpio_write[2];
  always @ (*) begin
    _zz_CpuTop_4_[0] = io_led_red;
    _zz_CpuTop_4_[1] = io_led_green;
    _zz_CpuTop_4_[2] = io_led_blue;
  end

  assign io_uart_txd = u_uart_io_uart_txd;
  assign _zz_CpuTop_2_ = apb3Router_1__io_outputs_0_PADDR[7:0];
  assign _zz_CpuTop_3_ = apb3Router_1__io_outputs_1_PADDR[3:0];
  assign _zz_CpuTop_5_ = apb3Router_1__io_outputs_2_PADDR[4:0];
  assign _zz_CpuTop_6_ = 1'b0;

endmodule

module ExampleTop (
  input               osc_clk_in,
  input               button,
  output              led_red,
  output              led_green,
  output              led_blue,
  output              uart_txd,
  input               uart_rxd 
);
  wire                cpu_u_cpu_io_led_red;
  wire                cpu_u_cpu_io_led_green;
  wire                cpu_u_cpu_io_led_blue;
  wire                cpu_u_cpu_io_uart_txd;
  wire                _zz_ExampleTop_2_;
  wire                clk_cpu;
  wire                clk_cpu_reset_;
  reg                 clk_cpu_reset_gen_reset_unbuffered_;
  reg        [4:0]    clk_cpu_reset_gen_reset_cntr = 5'h0;
  wire       [4:0]    _zz_ExampleTop_1_;
  reg                 clk_cpu_reset_gen_reset_unbuffered__regNext;

  assign _zz_ExampleTop_2_ = (clk_cpu_reset_gen_reset_cntr != _zz_ExampleTop_1_);
  CpuTop cpu_u_cpu ( 
    .io_led_red        (cpu_u_cpu_io_led_red    ), //o
    .io_led_green      (cpu_u_cpu_io_led_green  ), //o
    .io_led_blue       (cpu_u_cpu_io_led_blue   ), //o
    .io_uart_txd       (cpu_u_cpu_io_uart_txd   ), //o
    .io_uart_rxd       (uart_rxd                ), //i
    .clk_cpu           (clk_cpu                 ), //i
    .clk_cpu_reset_    (clk_cpu_reset_          )  //i
  );
  assign clk_cpu = osc_clk_in;
  always @ (*) begin
    clk_cpu_reset_gen_reset_unbuffered_ = 1'b1;
    if(_zz_ExampleTop_2_)begin
      clk_cpu_reset_gen_reset_unbuffered_ = 1'b0;
    end
  end

  assign _zz_ExampleTop_1_[4 : 0] = 5'h1f;
  assign clk_cpu_reset_ = clk_cpu_reset_gen_reset_unbuffered__regNext;
  assign uart_txd = cpu_u_cpu_io_uart_txd;
  assign led_red = cpu_u_cpu_io_led_red;
  assign led_green = cpu_u_cpu_io_led_green;
  assign led_blue = cpu_u_cpu_io_led_blue;
  always @ (posedge clk_cpu) begin
    if(_zz_ExampleTop_2_)begin
      clk_cpu_reset_gen_reset_cntr <= (clk_cpu_reset_gen_reset_cntr + 5'h01);
    end
  end

  always @ (posedge clk_cpu) begin
    clk_cpu_reset_gen_reset_unbuffered__regNext <= clk_cpu_reset_gen_reset_unbuffered_;
  end


endmodule

// This program was cloned from: https://github.com/chonwhite/leshi
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

`timescale 1ns/1ps

module CpuStage3 (
  output reg  [7:0]    led,
  input  wire          clk,
  input  wire          reset
);

  wire       [15:0]   _zz_fetcher_mem_port0;
  wire                fetch_up_isReady;
  wire                fetch_up_isValid;
  wire                decode_down_isValid;
  wire                decode_up_isValid;
  wire                fetch_down_isValid;
  reg                 execute_up_decoder_IS_DELAY;
  reg                 execute_up_decoder_IS_LED;
  reg                 execute_up_decoder_IS_JUMP;
  reg                 execute_up_is_add;
  reg        [15:0]   execute_up_INSTRUCTION;
  wire                execute_down_isReady;
  reg        [15:0]   decode_up_INSTRUCTION;
  wire                decode_down_isReady;
  wire                fetch_down_isReady;
  reg                 execute_down_valid;
  reg                 execute_up_valid;
  reg                 decode_down_valid;
  reg                 decode_up_valid;
  reg                 fetch_down_valid;
  reg                 fetch_up_ready;
  wire                fetch_up_cancel;
  reg                 fetch_down_ready;
  reg                 decode_up_ready;
  wire                decode_up_cancel;
  reg                 decode_down_ready;
  reg                 execute_up_ready;
  reg                 _zz_execute_haltRequest_CPU_l66;
  wire                execute_down_decoder_IS_DELAY;
  wire                execute_down_decoder_IS_LED;
  wire                execute_down_decoder_IS_JUMP;
  wire       [15:0]   execute_down_INSTRUCTION;
  wire                execute_down_is_add;
  wire                execute_up_isValid;
  wire                decode_down_decoder_IS_DELAY;
  wire                decode_down_decoder_IS_LED;
  wire                decode_down_decoder_IS_JUMP;
  wire                decode_down_is_add;
  wire       [15:0]   decode_down_INSTRUCTION;
  wire       [15:0]   fetch_down_INSTRUCTION;
  wire       [7:0]    fetch_down_PC;
  wire                fetch_up_isFiring;
  wire                fetch_up_valid;
  wire       [7:0]    fetch_up_PC;
  reg        [7:0]    fetcher_pcReg;
  wire       [7:0]    decoder_opcode;
  reg        [7:0]    alu_regfile;
  reg                 alu_flush;
  wire                fetch_throwWhen_CPU_l45;
  wire                decode_throwWhen_CPU_l45;
  reg        [7:0]    alu_delayCounter;
  wire                when_CPU_l63;
  wire                execute_haltRequest_CPU_l66;
  wire                when_CtrlLink_l158;
  wire                when_CtrlLink_l162;
  wire                when_CtrlLink_l158_1;
  wire                when_CtrlLink_l162_1;
  wire                when_CtrlLink_l151;
  wire                when_StageLink_l67;
  wire                when_StageLink_l67_1;
  reg [15:0] fetcher_mem [0:255];

  assign _zz_fetcher_mem_port0 = fetcher_mem[fetch_down_PC];
  always @(*) begin
    _zz_execute_haltRequest_CPU_l66 = 1'b0;
    if(execute_up_isValid) begin
      if(execute_down_decoder_IS_DELAY) begin
        if(!when_CPU_l63) begin
          _zz_execute_haltRequest_CPU_l66 = 1'b1;
        end
      end
    end
  end

  assign fetch_up_PC = fetcher_pcReg;
  assign fetch_up_valid = 1'b1;
  assign fetch_down_INSTRUCTION = _zz_fetcher_mem_port0;
  assign decoder_opcode = decode_down_INSTRUCTION[7 : 0];
  assign decode_down_is_add = (decoder_opcode == 8'h01);
  assign decode_down_decoder_IS_JUMP = (decoder_opcode == 8'h02);
  assign decode_down_decoder_IS_LED = (decoder_opcode == 8'h03);
  assign decode_down_decoder_IS_DELAY = (decoder_opcode == 8'h04);
  always @(*) begin
    alu_flush = 1'b0;
    if(execute_up_isValid) begin
      if(execute_down_decoder_IS_JUMP) begin
        alu_flush = 1'b1;
      end
    end
  end

  assign fetch_throwWhen_CPU_l45 = alu_flush;
  assign decode_throwWhen_CPU_l45 = alu_flush;
  assign when_CPU_l63 = (alu_delayCounter == execute_down_INSTRUCTION[15 : 8]);
  assign execute_haltRequest_CPU_l66 = _zz_execute_haltRequest_CPU_l66;
  assign decode_up_cancel = (|decode_throwWhen_CPU_l45);
  assign fetch_up_cancel = (|fetch_throwWhen_CPU_l45);
  always @(*) begin
    fetch_down_valid = fetch_up_valid;
    if(when_CtrlLink_l158) begin
      fetch_down_valid = 1'b0;
    end
  end

  always @(*) begin
    fetch_up_ready = fetch_down_isReady;
    if(when_CtrlLink_l162) begin
      fetch_up_ready = 1'b1;
    end
  end

  assign when_CtrlLink_l158 = (|fetch_throwWhen_CPU_l45);
  assign when_CtrlLink_l162 = (|fetch_throwWhen_CPU_l45);
  assign fetch_down_PC = fetch_up_PC;
  always @(*) begin
    decode_down_valid = decode_up_valid;
    if(when_CtrlLink_l158_1) begin
      decode_down_valid = 1'b0;
    end
  end

  always @(*) begin
    decode_up_ready = decode_down_isReady;
    if(when_CtrlLink_l162_1) begin
      decode_up_ready = 1'b1;
    end
  end

  assign when_CtrlLink_l158_1 = (|decode_throwWhen_CPU_l45);
  assign when_CtrlLink_l162_1 = (|decode_throwWhen_CPU_l45);
  assign decode_down_INSTRUCTION = decode_up_INSTRUCTION;
  always @(*) begin
    execute_down_valid = execute_up_valid;
    if(when_CtrlLink_l151) begin
      execute_down_valid = 1'b0;
    end
  end

  always @(*) begin
    execute_up_ready = execute_down_isReady;
    if(when_CtrlLink_l151) begin
      execute_up_ready = 1'b0;
    end
  end

  assign when_CtrlLink_l151 = (|execute_haltRequest_CPU_l66);
  assign execute_down_INSTRUCTION = execute_up_INSTRUCTION;
  assign execute_down_is_add = execute_up_is_add;
  assign execute_down_decoder_IS_JUMP = execute_up_decoder_IS_JUMP;
  assign execute_down_decoder_IS_LED = execute_up_decoder_IS_LED;
  assign execute_down_decoder_IS_DELAY = execute_up_decoder_IS_DELAY;
  always @(*) begin
    fetch_down_ready = decode_up_ready;
    if(when_StageLink_l67) begin
      fetch_down_ready = 1'b1;
    end
  end

  assign when_StageLink_l67 = (! decode_up_isValid);
  always @(*) begin
    decode_down_ready = execute_up_ready;
    if(when_StageLink_l67_1) begin
      decode_down_ready = 1'b1;
    end
  end

  assign when_StageLink_l67_1 = (! execute_up_isValid);
  assign fetch_up_isFiring = ((fetch_up_isValid && fetch_up_isReady) && (! fetch_up_cancel));
  assign fetch_up_isValid = fetch_up_valid;
  assign fetch_up_isReady = fetch_up_ready;
  assign fetch_down_isValid = fetch_down_valid;
  assign fetch_down_isReady = fetch_down_ready;
  assign decode_up_isValid = decode_up_valid;
  assign decode_down_isValid = decode_down_valid;
  assign decode_down_isReady = decode_down_ready;
  assign execute_up_isValid = execute_up_valid;
  assign execute_down_isReady = 1'b1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      led <= 8'h00;
      fetcher_pcReg <= 8'h00;
      alu_regfile <= 8'h00;
      alu_delayCounter <= 8'h00;
      decode_up_valid <= 1'b0;
      execute_up_valid <= 1'b0;
    end else begin
      if(fetch_up_isFiring) begin
        fetcher_pcReg <= (fetch_down_PC + 8'h01);
      end
      if(execute_up_isValid) begin
        if(execute_down_is_add) begin
          alu_regfile <= (alu_regfile + execute_down_INSTRUCTION[15 : 8]);
        end
        if(execute_down_decoder_IS_JUMP) begin
          fetcher_pcReg <= execute_down_INSTRUCTION[15 : 8];
        end
        if(execute_down_decoder_IS_LED) begin
          led <= alu_regfile;
        end
        if(execute_down_decoder_IS_DELAY) begin
          alu_delayCounter <= (alu_delayCounter + 8'h01);
          if(when_CPU_l63) begin
            alu_delayCounter <= 8'h00;
          end
        end
      end
      if(fetch_down_isReady) begin
        decode_up_valid <= fetch_down_isValid;
      end
      if(decode_down_isReady) begin
        execute_up_valid <= decode_down_isValid;
      end
    end
  end

  always @(posedge clk) begin
    if(fetch_down_isReady) begin
      decode_up_INSTRUCTION <= fetch_down_INSTRUCTION;
    end
    if(decode_down_isReady) begin
      execute_up_INSTRUCTION <= decode_down_INSTRUCTION;
      execute_up_is_add <= decode_down_is_add;
      execute_up_decoder_IS_JUMP <= decode_down_decoder_IS_JUMP;
      execute_up_decoder_IS_LED <= decode_down_decoder_IS_LED;
      execute_up_decoder_IS_DELAY <= decode_down_decoder_IS_DELAY;
    end
  end


endmodule


module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  // assign uio_out = 0;
  assign uio_oe  = 0;
  wire reset;

  // Logic to derive reset signal
  assign reset = ~rst_n;



  CpuStage3 cpu_stage3_inst (
    .led(uio_out),
    .clk(clk),
    .reset(reset)
  );

    

endmodule

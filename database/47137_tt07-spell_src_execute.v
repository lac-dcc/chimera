// This program was cloned from: https://github.com/urish/tt07-spell
// License: Apache License 2.0

// SPDX-FileCopyrightText: © 2021 Uri Shaked <uri@wokwi.com>
// SPDX-License-Identifier: MIT

`default_nettype none

module spell_execute (
    input wire [7:0] opcode,
    input wire [7:0] pc,
    input wire [4:0] sp,
    input wire [7:0] stack_top,
    input wire [7:0] stack_belowtop,
    input wire [7:0] memory_input,
    input wire out_of_order_exec,
    output reg [7:0] next_pc,
    output reg [4:0] next_sp,
    output reg [1:0] stack_write_count,
    output reg [7:0] set_stack_top,
    output reg [7:0] set_stack_belowtop,
    output reg memory_write_en,
    output reg memory_write_type_data,
    output reg [7:0] memory_write_data,
    output reg [7:0] memory_write_addr,
    output reg [7:0] delay_amount,
    output reg sleep,
    output reg stop
);

  always @(*) begin
    next_pc = out_of_order_exec ? pc : pc + 8'd1;
    next_sp = sp;
    stack_write_count = 2'd0;
    set_stack_top = 8'dx;
    set_stack_belowtop = 8'dx;
    memory_write_en = 1'b0;
    memory_write_type_data = 1'b0;
    memory_write_addr = 8'dx;
    memory_write_data = 8'dx;
    sleep = 0;
    stop = 0;
    delay_amount = 0;

    case (opcode)
      "+": begin
        set_stack_top = stack_belowtop + stack_top;
        stack_write_count = 1;
        next_sp = sp - 1;
      end
      "-": begin
        set_stack_top = stack_belowtop - stack_top;
        stack_write_count = 1;
        next_sp = sp - 1;
      end
      "&": begin
        set_stack_top = stack_belowtop & stack_top;
        stack_write_count = 1;
        next_sp = sp - 1;
      end
      "^": begin
        set_stack_top = stack_belowtop ^ stack_top;
        stack_write_count = 1;
        next_sp = sp - 1;
      end
      "|": begin
        set_stack_top = stack_belowtop | stack_top;
        stack_write_count = 1;
        next_sp = sp - 1;
      end
      ">": begin
        set_stack_top = {1'b0, stack_top[7:1]};
        stack_write_count = 1;
      end
      "<": begin
        set_stack_top = {stack_top[6:0], 1'b0};
        stack_write_count = 1;
      end
      "=": begin
        next_pc = stack_top;
        next_sp = sp - 1;
      end
      "@": begin
        if (stack_belowtop != 8'd0) begin
          next_pc = stack_top;
          next_sp = sp - 1;
          set_stack_top = stack_belowtop - 1;
          stack_write_count = 1;
        end else begin
          next_sp = sp - 2;
        end
      end
      ",": begin
        delay_amount = stack_top;
        next_sp = sp - 1;
      end
      "2": begin
        set_stack_top = stack_top;
        stack_write_count = 1;
        next_sp = sp + 1;
      end
      "!": begin
        memory_write_en = 1'b1;
        memory_write_type_data = 1'b0;
        memory_write_addr = stack_top;
        memory_write_data = stack_belowtop;
        next_sp = sp - 2;
      end
      "?", "r": begin
        set_stack_top = memory_input;
        stack_write_count = 1;
      end
      "w": begin
        memory_write_en = 1'b1;
        memory_write_type_data = 1'b1;
        memory_write_addr = stack_top;
        memory_write_data = stack_belowtop;
        next_sp = sp - 2;
      end
      "x": begin
        set_stack_top = stack_belowtop;
        set_stack_belowtop = stack_top;
        stack_write_count = 2;
      end
      "z":   sleep = 1'b1;
      8'hff: stop = 1'b1;
      default: begin
        set_stack_top = opcode;
        stack_write_count = 1;
        next_sp = sp + 1;
      end
    endcase
  end
endmodule

// This program was cloned from: https://github.com/urish/tt07-spell
// License: Apache License 2.0

// SPDX-FileCopyrightText: © 2024 Uri Shaked <uri@wokwi.com>
// SPDX-License-Identifier: MIT

`default_nettype none

module tt_um_urish_spell (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  localparam StateFetch = 3'd0;
  localparam StateFetchData = 3'd1;
  localparam StateExecute = 3'd2;
  localparam StateStore = 3'd3;
  localparam StateDelay = 3'd4;
  localparam StateSleep = 3'd5;
  localparam StateStop = 3'd6;

  localparam REG_PC = 2'd0;
  localparam REG_SP = 2'd1;
  localparam REG_EXEC = 2'd2;
  localparam REG_STACK_TOP = 2'd3;

  wire o_sleep = state == StateSleep;
  wire o_stop = state == StateStop || state == StateSleep;
  wire o_wait_delay = state == StateDelay;
  reg o_shift_out;
  wire o_cs;
  wire o_clk;
  wire o_mosi;
  assign uo_out = {o_mosi, o_clk, o_cs, 1'b0, o_shift_out, o_wait_delay, o_stop, o_sleep};

  wire i_run = ui_in[0];
  wire i_step = ui_in[1];
  wire i_load = ui_in[2];
  wire i_dump = ui_in[3];
  wire i_shift_in = ui_in[4];
  wire [1:0] i_reg_sel = ui_in[6:5];
  wire i_miso = ui_in[7];

  reg past_i_run;
  reg [2:0] state;
  reg [7:0] pc;
  reg [4:0] sp;
  reg [7:0] opcode;
  reg [7:0] memory_input;
  reg [7:0] stack[31:0];

  wire [7:0] next_pc;
  wire [4:0] next_sp;
  wire [1:0] stack_write_count;
  wire [7:0] set_stack_top;
  wire [7:0] set_stack_belowtop;
  wire memory_write_en;
  wire memory_write_type_data;
  wire [7:0] memory_write_addr;
  wire [7:0] memory_write_data;
  wire [7:0] delay_amount;
  wire sleep;
  wire stop;

  // shift register for loading data / dumping debug info
  reg [7:0] shift_reg;

  // Out of order execution
  reg single_step;
  reg out_of_order_exec;

  wire [4:0] stack_top_index = sp - 1;
  wire [7:0] stack_top = stack[stack_top_index];

  // Memory related registers
  reg mem_select;
  reg mem_type_data;
  reg [7:0] mem_addr;
  reg [7:0] mem_write_value;
  reg mem_write_en;
  wire [7:0] mem_read_value;
  wire mem_data_ready;

  // Delay related registers
  reg [23:0] cycles_per_ms;
  reg [23:0] delay_cycles;
  reg [7:0] delay_counter;

  // Debug stuff
  reg [63:0] reg_name;
  reg [63:0] state_name;

  // To avoid linter warnings about unused wires
  wire _unused_ok = &{1'b0, ena, ui_in[7], state_name, reg_name, 1'b0};

  always @(*) begin
    case (state)
      StateFetch: state_name = "Fetch";
      StateFetchData: state_name = "FetchDat";
      StateExecute: state_name = "Execute";
      StateStore: state_name = "Store";
      StateDelay: state_name = "Delay";
      StateSleep: state_name = "Sleep";
      StateStop: state_name = "Stop";
      default: state_name = "Invalid";
    endcase
  end

  always @(*) begin
    case (i_reg_sel)
      REG_PC: reg_name = "PC";
      REG_SP: reg_name = "SP";
      REG_EXEC: reg_name = "Exec";
      REG_STACK_TOP: reg_name = "StackTop";
    endcase
  end

  spell_execute exec (
      .opcode(opcode),
      .pc(pc),
      .sp(sp),
      .stack_top(stack_top),
      .stack_belowtop(stack[sp-2]),
      .memory_input(memory_input),
      .next_pc(next_pc),
      .next_sp(next_sp),
      .out_of_order_exec(out_of_order_exec),
      .stack_write_count(stack_write_count),
      .set_stack_top(set_stack_top),
      .set_stack_belowtop(set_stack_belowtop),
      .memory_write_en(memory_write_en),
      .memory_write_type_data(memory_write_type_data),
      .memory_write_addr(memory_write_addr),
      .memory_write_data(memory_write_data),
      .delay_amount(delay_amount),
      .sleep(sleep),
      .stop(stop)
  );

  spell_mem mem (
      .rst_n(rst_n),
      .clk(clk),
      .select(mem_select),
      .addr(mem_addr),
      .data_in(mem_write_value),
      .memory_type_data(mem_type_data),
      .write(mem_write_en),
      .data_out(mem_read_value),
      .data_ready(mem_data_ready),
      // SPI mem
      .spi_cs(o_cs),
      .spi_clk(o_clk),
      .spi_mosi(o_mosi),
      .spi_miso(i_miso),
      // IO
      .io_in(uio_in),
      .io_out(uio_out),
      .io_oe(uio_oe)
  );

  function is_data_opcode(input [7:0] opcode_to_test);
    is_data_opcode = (opcode_to_test == "?" || opcode_to_test == "r");
  endfunction

  integer j;

  // Main logic
  always @(posedge clk) begin
    if (~rst_n) begin
      state <= StateSleep;
      pc    <= 0;
      sp    <= 0;
      for (j = 0; j < 32; j++) stack[j] <= 0;
      opcode <= 0;
      mem_select <= 0;
      mem_write_en <= 0;
      single_step <= 0;
      out_of_order_exec <= 0;
      cycles_per_ms <= 24'd10000;  /* we assume a 10MHz clock */
      delay_cycles <= 0;
      shift_reg <= 0;
      o_shift_out <= 0;
      past_i_run <= 0;
    end else begin
      shift_reg   <= {shift_reg[6:0], i_shift_in};
      o_shift_out <= shift_reg[7];
      past_i_run  <= i_run;

      if (i_load) begin
        case (i_reg_sel)
          REG_PC: pc <= shift_reg;
          REG_SP: sp <= shift_reg[4:0];
          REG_EXEC: begin
            opcode <= shift_reg;
            state <= is_data_opcode(shift_reg) ? StateFetchData : StateExecute;
            single_step <= 1;
            out_of_order_exec <= 1;
          end
          REG_STACK_TOP: begin
            stack[sp] <= shift_reg;
            sp <= sp + 1;
          end
        endcase
      end

      if (i_dump) begin
        case (i_reg_sel)
          REG_PC: shift_reg <= pc;
          REG_SP: shift_reg <= {3'b000, sp};
          REG_EXEC: shift_reg <= opcode;
          REG_STACK_TOP: shift_reg <= stack[sp-1];
        endcase
      end

      if (i_run && !past_i_run && (state == StateSleep || state == StateStop)) begin
        single_step <= i_step;
        out_of_order_exec <= 0;
        state <= StateFetch;
      end

      case (state)
        StateFetch: begin
          // Read next instruction from code memory
          mem_select <= 1;
          mem_type_data <= 0;
          mem_addr <= pc;
          mem_write_en <= 0;
          if (mem_select && mem_data_ready) begin
            mem_select <= 0;
            opcode <= mem_read_value;
            state <= is_data_opcode(mem_read_value) ? StateFetchData : StateExecute;
          end
        end
        StateFetchData: begin
          // Read data for instruction from either code or data memory
          mem_select <= 1;
          mem_type_data <= (opcode == "r") ? 1'b1 : 1'b0;
          mem_addr <= stack_top;
          mem_write_en <= 0;
          if (mem_select && mem_data_ready) begin
            mem_select <= 0;
            memory_input <= mem_read_value;
            state <= StateExecute;
          end
        end
        StateExecute: begin
          // Execute a single instruction
          pc <= next_pc;
          sp <= next_sp;
          mem_type_data <= memory_write_type_data;
          mem_addr <= memory_write_addr;
          mem_write_value <= memory_write_data;
          if (stack_write_count == 1 || stack_write_count == 2) begin
            stack[next_sp-1] <= set_stack_top;
          end
          if (stack_write_count == 2) begin
            stack[next_sp-2] <= set_stack_belowtop;
          end
          if (memory_write_en) begin
            state <= StateStore;
          end else if (stop || single_step) begin
            state <= StateStop;
          end else if (sleep) begin
            state <= StateSleep;
          end else if (delay_amount != 8'b0 && cycles_per_ms != 24'b0) begin
            delay_counter <= delay_amount - 1;
            delay_cycles <= 0;
            state <= StateDelay;
          end else begin
            state <= StateFetch;
          end
        end
        StateStore: begin
          // Store data from instruction into either code or data memory
          mem_select   <= 1;
          mem_write_en <= 1;
          if (mem_data_ready) begin
            mem_select <= 0;
            mem_write_en <= 0;
            state <= single_step ? StateSleep : StateFetch;
          end
        end
        StateSleep: begin
          // The only way to leave this state is via external intervention.
        end
        StateStop: begin
          // The only way to leave this state is via external intervention.
        end
        StateDelay: begin
          if (delay_cycles + 1 >= cycles_per_ms) begin
            delay_counter <= delay_counter - 1;
            delay_cycles  <= 0;
            if (delay_counter == 0) begin
              state <= single_step ? StateSleep : StateFetch;
            end
          end else begin
            delay_cycles <= delay_cycles + 1;
          end
        end
        default: state <= 3'bx;
      endcase
    end
  end

`ifdef FORMAL
  reg f_init = 1;
  always @(posedge clk) begin
    if (f_init) assume (~rst_n);
    if (rst_n) begin
      assert (!sleep || !stop);
      assert(
        state == StateFetch ||
        state == StateFetchData ||
        state == StateExecute ||
        state == StateStore ||
        state == StateDelay ||
        state == StateSleep ||
        state == StateStop
      );
      if (state == StateDelay) begin
        assume (cycles_per_ms > 0);
        assert (delay_counter != 8'hff);
        assert (delay_cycles < cycles_per_ms);
      end
      if (state != StateFetch && state != StateFetchData && state != StateStore) begin
        assert (!mem_select);
      end
      if (state != StateStore) begin
        assert (!mem_write_en);
      end
    end
    f_init <= 0;
  end
`endif  /* FORMAL */

endmodule

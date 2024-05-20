// This program was cloned from: https://github.com/buncram/cram-soc
// License: CERN Open Hardware Licence Version 2 - Weakly Reciprocal

// SPDX-FileCopyrightText: 2022 Lawrie Griffiths
// SPDX-License-Identifier: BSD-2-Clause

// `default_nettype none
module pio_machine (
  input         clk,
  input         reset,
  input         en,
  input [15:0]  div_int,
  input [7:0]   div_frac,
  input [31:0]  din,
  input [15:0]  imm_instr,
  input [15:0]  curr_instr,
  input [31:0]  input_pins,
  input [7:0]   irq_flags_in,
  input         imm,
  input         empty,
  input         full,
  input         restart,
  input         clkdiv_restart,

  // Configuration
  input [1:0]   mindex,
  input [4:0]   pend,
  input [4:0]   wrap_target,
  input [4:0]   jmp_pin,
  input         sideset_enable_bit,
  input         side_pindir,
  input [4:0]   pins_out_base,
  input [5:0]   pins_out_count,
  input [4:0]   pins_set_base,
  input [2:0]   pins_set_count,
  input [4:0]   pins_in_base,
  input [4:0]   pins_side_base,
  input [2:0]   pins_side_count,
  input         out_shift_dir,
  input         in_shift_dir,
  input         auto_pull,
  input         auto_push,
  input [4:0]   isr_threshold,
  input [4:0]   osr_threshold,
  input         status_sel,
  input [3:0]   status_n,
  input [2:0]   tx_level,
  input [2:0]   rx_level,
  input [3:0]   tx_level_joined,
  input [3:0]   rx_level_joined,

  // Output
  output [4:0]  pc,
  output reg    push, // Send data to RX FIFO
  output reg    pull, // Get data from TX FIFO
  output reg    exec_stalled,
  output wire [31:0] dout,
  output reg [31:0] output_pins,
  output reg [31:0] output_pins_stb,
  output reg [31:0] pin_directions,
  output reg [7:0]  irq_flags_out,
  output reg [7:0]  irq_flags_stb,

  output reg    dbg_txstall,
  output reg    dbg_rxstall
);

  // Strobes to implement instructions (combinatorial)
  reg         jmp;
  reg         setx;
  reg         sety;
  reg         decx;
  reg         decy;
  reg         set_shift_in;
  reg         set_shift_out;
  reg         do_in_shift;
  reg         do_out_shift;
  reg         set_set_pins;
  reg         set_set_dirs;
  reg         set_out_pins;
  reg         set_out_dirs;
  reg         set_side_pins;
  reg         set_side_dirs;
  reg         exec;
  reg         waiting;
  reg         waiting1;
  reg         auto;

  reg [5:0]   bit_count;
  reg [4:0]   new_pc;
  reg [31:0]  new_x;
  reg [31:0]  new_y;
  reg [31:0]  new_pins;
  reg [15:0]  new_exec;
  reg [31:0]  new_set_pins;
  reg [31:0]  new_set_dirs;
  reg [31:0]  new_out_pins;
  reg [31:0]  new_out_dirs;
  reg [31:0]  isr_val;
  reg [31:0]  pull_val;

  reg         exec1;
  reg [15:0]  exec_instr;

  // Expand OSR explicitly to full width of osr_threshold, and handle 0 encoding 32
  wire [5:0]  osr_threshold_wide = (osr_threshold == 0) ? 6'd32 : {1'b0, osr_threshold};
  // Expand ISR explicitly to full width of isr_threshold, and handle 0 encoding 32
  wire [5:0]  isr_threshold_wide = (isr_threshold == 0) ? 6'd32 : {1'b0, isr_threshold};

  // Divided clock enable signal
  wire        penable;

  // Output from modules
  wire [31:0] x;
  wire [31:0] y;
  wire [31:0] in_shift;
  wire [31:0] out_shift;
  wire [2:0]  op;
  wire [2:0]  op1;
  wire [4:0]  op2;
  wire [4:0]  delay;
  wire [4:0]  side_set;
  wire        sideset_enabled;

  // Names of operands
  wire        blocking = op1[0];
  wire        if_full = op1[1];
  wire        if_empty = op1[1];
  wire [2:0]  destination = op1;
  wire [2:0]  source = op1;
  wire [2:0]  condition = op1;
  wire [1:0]  source2 = op1[1:0];
  wire        polarity = op1[2];
  wire [4:0]  index = op2;
  wire [4:0]  address = op2;
  wire [4:0]  data = op2;
  wire [1:0]  irq_rel = op2[4] ? mindex + op2[1:0] : op2[1:0];
  wire [2:0]  irq_index = {op2[2], irq_rel};
  wire [2:0]  mov_source = op2[2:0];
  wire [1:0]  mov_op = op2[4:3];

  // IRQ waiting - indicates to listen to the IRQ scoreboard instead of the locally generated wait signal
  reg         irq_waiting;      // registered
  reg         irq_waiting_next; // combinational

  // Miscellaneous signals
  wire [31:0] null_src = 0; // NULL source
  wire [5:0]  isr_count, isr_count_autopush, osr_count, osr_count_lookahead;

  // Input pins rotate with pins_in_base
  wire [63:0] in_pins64 = {input_pins, input_pins};
  wire [63:0] in_pins64_rot = in_pins64 >> pins_in_base;
  wire [31:0] in_pins = in_pins64_rot[31:0];

  reg [4:0]   delay_cnt = 0;

  // States
  wire stalling;
  reg  imm_stalled;
  wire imm_until_resolved;
  wire [15:0] instr;
  wire enabled  = (exec1 && penable) || imm_until_resolved || (en && penable); // Instruction execution enabled
  wire delaying = delay_cnt > 0;

  // Function to reverse the order of bits in a word
  function [31:0] reverse (
    input [31:0] in
  );

    integer i;
    for(i=0;i<32;i=i+1) begin
      reverse[i] = in[31-i];
    end
  endfunction

  // Function to apply selected bit operation to a word
  function [31:0] bit_op (
    input [31:0] in,
    input [1:0] op
  );

    case (op)
      0: bit_op = in;
      1: bit_op = ~in;
      2: bit_op = reverse(in);
      3: bit_op = in; // Reserved
    endcase
  endfunction

  // Tasks to set registers
  task set_x (
    input [31:0] val
  );
    begin
      setx = 1;
      new_x = val;
    end
  endtask

  task set_y (
    input [31:0] val
  );
    begin
      sety = 1;
      new_y = val;
    end
  endtask

  task set_exec (
    input [15:0] val
  );
    begin
      exec = 1;
      new_exec = val;
    end
  endtask

  task set_pc (
    input [31:0] val
  );
    begin
      jmp = 1;
      new_pc = val;
    end
  endtask

  task set_isr (
    input [31:0] val
  );
    begin
      set_shift_in = 1;
      isr_val = val;
    end
  endtask

  task set_osr (
    input [31:0] val
  );
    begin
      set_shift_out = 1;
      pull_val = val;
    end
  endtask

  task do_shift_in (
    input [31:0] val
  );
    begin
      do_in_shift = 1;
      isr_val = val;
    end
  endtask

  task pins_set (
    input [31:0] val
  );
    begin
      set_set_pins = 1;
      new_set_pins = val;
    end
  endtask

  task dirs_set (
    input [31:0] val
  );
    begin
      set_set_dirs = 1;
      new_set_dirs = val;
    end
  endtask

  task pins_out (
    input [31:0] val
  );
    begin
      set_out_pins = 1;
      new_out_pins = val;
    end
  endtask

  task dirs_out (
    input [31:0] val
  );
    begin
      set_out_dirs = 1;
      new_out_dirs = val;
    end
  endtask

  // this must be paired with a set_isr() task otherwise what are you pushing?
  task do_push();
    begin
      push = 1;
      // dout = push_dout; // dout is wired directly to the ISR now. Sharing dout here causes inconsistency between verilator and XSIM results (XSIM delays an extra cycle compared to verilator)
    end
  endtask

  task do_pull ();
    begin
      pull = 1;
      set_shift_out = 1;
      pull_val = din;
    end
  endtask

  // Instructions
  localparam JMP  = 0;
  localparam WAIT = 1;
  localparam IN   = 2;
  localparam OUT  = 3;
  localparam PUSH = 4;
  localparam PULL = 4;
  localparam MOV  = 5;
  localparam IRQ  = 6;
  localparam SET  = 7;

  // Count down if delay
  always @(posedge clk) begin
    if (reset || restart) begin
      delay_cnt <= 0;
      exec1 <= 0;
      waiting1 <= 0;
    end else if (en & penable) begin
      exec1 <= exec; // Do execution on next cycle after exec set
      waiting1 <= waiting;
      exec_instr <= new_exec;
      if (delaying) delay_cnt <= delay_cnt - 1;
      else if (!waiting && !exec && delay > 0) delay_cnt <= delay;
    end
    if (reset || restart || (imm_until_resolved && (op != IRQ))) begin
      irq_waiting <= 0;
    end else begin
      if (en & penable) begin
        irq_waiting <= irq_waiting_next;
      end
    end
    if (reset || restart) begin
      imm_stalled <= 0;
    end else begin
      if (imm && waiting) begin
        imm_stalled <= 1;
      end else if (!waiting) begin
        imm_stalled <= 0;
      end
    end
  end
  assign imm_until_resolved = imm || imm_stalled;
  assign instr = imm_until_resolved ? imm_instr :  curr_instr;

  integer i;
  wire [2:0] pins_side_count_real;
  // trim out the enable bit for computing the number of bits to apply on side-set
  assign pins_side_count_real =
    sideset_enable_bit ?
      (pins_side_count > 0) ? pins_side_count - 1 : 0
      : pins_side_count;

  always @(posedge clk) begin
    if (reset || restart) begin
      if (reset) begin
        // these are *not* affected by restart
        pin_directions <= 32'h00000000;
        output_pins <= 32'h00000000;
      end
      output_pins_stb <= 32'h00000000;
    end else if (enabled && !delaying) begin
      output_pins_stb <= 32'h00000000;
      // compute the actual pin values now
      if (set_set_pins)
        for (i=0;i<5;i=i+1)
          if (pins_set_count > i) begin
            output_pins[(pins_set_base+i) & 5'h1f] <= new_set_pins[i];
            output_pins_stb[(pins_set_base+i) & 5'h1f] <= 1;
          end
      if (set_set_dirs)
        for (i=0;i<5;i=i+1)
          if (pins_set_count > i) begin
            pin_directions[(pins_set_base+i) & 5'h1f] <= new_set_dirs[i];
            output_pins_stb[(pins_set_base+i) & 5'h1f] <= 1;
          end
      if (set_out_pins)
        for (i=0;i<32;i=i+1)
          if (pins_out_count > i) begin
            output_pins[(pins_out_base+i) & 5'h1f] <= new_out_pins[i];
            output_pins_stb[(pins_out_base+i) & 5'h1f] <= 1;
          end
      if (set_out_dirs)
        for (i=0;i<32;i=i+1)
          if (pins_out_count > i) begin
            pin_directions[(pins_out_base+i) & 5'h1f] <= new_out_dirs[i];
            output_pins_stb[(pins_out_base+i) & 5'h1f] <= 1;
          end

      // sideset should override out (so it is last in order)
      if (sideset_enabled) begin
        if (!side_pindir) begin
          for (i=0;i<5;i=i+1)
            if (pins_side_count_real > i) begin
              output_pins[(pins_side_base+i) & 5'h1f] <= side_set[i];
              output_pins_stb[(pins_side_base+i) & 5'h1f] <= 1;
            end
        end else begin
          for (i=0;i<5;i=i+1)
            if (pins_side_count_real > i) begin
              pin_directions[(pins_side_base+i) & 5'h1f] <= side_set[i];
              output_pins_stb[(pins_side_base+i) & 5'h1f] <= 1;
            end
        end
      end
    end
  end

  // Execute the current instruction
  always @* begin
    isr_val = '0; //philip,faye: add to avoid latch
    irq_waiting_next = 0; //philip,faye: add to avoid latch
    jmp  = 0;
    pull = 0;
    push = 0;
    set_shift_in = 0;
    set_shift_out = 0;
    do_in_shift = 0;
    do_out_shift = 0;
    decx = 0;
    decy = 0;
    setx = 0;
    sety = 0;
    exec = 0;
    waiting = 0;
    auto = 0;
    new_pc = 0;
    new_x = 0;
    new_y = 0;
    new_pins = 0;
    new_exec = 0;
    new_set_pins = 0;
    new_set_dirs = 0;
    new_out_pins = 0;
    new_out_dirs = 0;
    pull_val = 0;
    bit_count = 0;
    set_set_pins = 0;
    set_set_dirs = 0;
    set_out_pins = 0;
    set_out_dirs = 0;
    irq_flags_out = 0;
    irq_flags_stb = 0;
    dbg_txstall = 0;
    dbg_rxstall = 0;
    if (enabled && !delaying) begin
      // pull on every cycle iff autopull and our count indicates we could use more data
      if (auto_pull && (osr_count >= osr_threshold_wide)) begin
        if (!empty) begin
          do_pull();
          auto = 1;
        end
      end

      irq_waiting_next = 0;
      case (op)
        JMP:  begin
                new_pc[4:0] = address;
                case (condition) // Condition
                  0: jmp = 1;
                  1: jmp = (x == 0);
                  2: begin jmp = (x != 0); decx = 1; end
                  3: jmp = (y == 0);
                  4: begin jmp = (y != 0); decy = 1; end
                  5: jmp = (x != y);
                  6: jmp = ((input_pins >> jmp_pin) & 1);
                  7: jmp = (osr_count < osr_threshold_wide);
                endcase
              end
        WAIT: case (source2) // Source
                0: waiting = input_pins[index] != polarity;
                1: waiting = input_pins[(pins_in_base + index) & 5'h1f] != polarity;
                2: begin
                  // clear wait on irq in case of restart assert
                   waiting = (irq_flags_in[irq_index] != polarity) && !restart;
                   if (polarity && irq_flags_in[irq_index]) begin
                      irq_flags_out[irq_index] = 0;  // auto clear when polarity is 1
                      irq_flags_stb[irq_index] = penable || imm;
                   end
                end
              endcase
        IN:   begin
                if (auto_push && isr_count_autopush >= isr_threshold_wide) begin // Auto push
                  if (full) begin
                    dbg_rxstall = 1;
                  end else begin
                    do_push();
                    set_isr(0);
                  end
                  waiting = full;
                  auto = 1;
                end
                case (source) // Source
                  0: do_shift_in(in_pins);
                  1: do_shift_in(x);
                  2: do_shift_in(y);
                  3: do_shift_in(null_src);
                  6: do_shift_in(in_shift);
                  7: do_shift_in(out_shift);
                endcase
              end
        OUT:  begin
                if (!auto_pull) begin
                  // if no auto-pull, OUT always runs; no stalling, no pulling
                  case (destination) // Destination
                    0: begin do_out_shift = 1; pins_out(out_shift); end                                    // PINS
                    1: begin do_out_shift = 1; set_x(out_shift); end                                       // X
                    2: begin do_out_shift = 1; set_y(out_shift); end                                       // Y
                    3: begin do_out_shift = 1; end                                                         // NULL
                    4: begin do_out_shift = 1; dirs_out(out_shift); end                                    // PINDIRS
                    5: begin do_out_shift = 1; set_pc(out_shift);          ; end                           // PC
                    6: begin do_out_shift = 1; set_isr(out_shift); bit_count = op2; end                    // ISR
                    7: begin do_out_shift = 1; set_exec(out_shift[15:0]); end                              // EXEC
                  endcase
                end else begin
                  // auto-pull case
                  if (osr_count >= osr_threshold_wide) begin
                    if (empty) begin
                      dbg_txstall = 1;
                    end else begin
                      do_pull();
                    end
                    // OUT can stall in this case
                    waiting = 1;
                    auto = 1;
                    if (destination == 7) begin // happens when we're stalled on an OUT EXEC that is running an OUT EXEC!
                      set_exec(exec_instr); // keep recirculating the stuck exec instruction
                    end
                  end else begin
                    // Look-ahead PULL on OUT for the next value, if the FIFO is not empty...
                    if (auto_pull && (osr_count_lookahead >= osr_threshold_wide)) begin
                      if (!empty) begin
                        do_pull();
                      end
                    end
                    case (destination) // Destination
                      0: begin do_out_shift = 1; pins_out(out_shift); end                                    // PINS
                      1: begin do_out_shift = 1; set_x(out_shift); end                                       // X
                      2: begin do_out_shift = 1; set_y(out_shift); end                                       // Y
                      3: begin do_out_shift = 1; end                                                         // NULL
                      4: begin do_out_shift = 1; dirs_out(out_shift); end                                    // PINDIRS
                      5: begin do_out_shift = 1; set_pc(out_shift);          ; end                           // PC
                      6: begin do_out_shift = 1; set_isr(out_shift); bit_count = op2; end                    // ISR
                      7: begin do_out_shift = 1; set_exec(out_shift[15:0]); end                              // EXEC
                    endcase
                  end
                end
              end
        PUSH: if (!op1[2]) begin
                // if auto-push and PUSH in the same instruction, just one PUSH happens.
                if (!if_full || (isr_count >= isr_threshold_wide)) begin
                  if (blocking) begin
                    if (full) begin
                      dbg_rxstall = 1;
                    end else begin
                      do_push();
                      set_isr(0);
                    end
                    waiting = blocking && full;
                  end else begin
                    if (full) begin
                      dbg_rxstall = 1;
                    end
                    // disregard the full signal, just do the push and maybe lose data
                    do_push();
                    set_isr(0);
                  end
                end
              end else begin // PULL. If PULL and auto-pull, do a pull "as usual"
                if (!if_empty || (osr_count >= osr_threshold_wide)) begin
                  if (blocking) begin // Blocking
                    if (!empty) begin // don't affect state until we're not empty.
                        do_pull();
                    end
                    waiting = blocking && empty;
                  end else begin
                    if (empty) begin // Copy X to OSR
                      set_osr(x);
                    end else begin // Pull value if available
                      do_pull();
                    end
                  end
                end
              end
        MOV:  case (destination)  // Destination
                0: case (mov_source) // PINS
                     0: pins_out(bit_op(in_pins, mov_op));   // PINS
                     1: pins_out(bit_op(x, mov_op));         // X
                     2: pins_out(bit_op(y, mov_op));         // Y
                     3: pins_out(bit_op(null_src, mov_op));  // NULL
                     5: pins_out(status_sel ? (rx_level_joined < status_n ? 32'hffffffff : 32'h0) : (tx_level_joined < status_n ? 32'hffffffff : 32'h0)); // STATUS
                     6: pins_out(bit_op(in_shift, mov_op));  // ISR
                     7: pins_out(bit_op(out_shift, mov_op)); // OSR
                   endcase
                1: case (mov_source) // X
                     0: set_x(bit_op(in_pins, mov_op));      // PINS
                     2: set_x(bit_op(y, mov_op));            // Y
                     3: set_x(bit_op(null_src, mov_op));     // NULL
                     5: set_x(status_sel ? (rx_level_joined < status_n ? 32'hffffffff : 32'h0) : (tx_level_joined < status_n ? 32'hffffffff : 32'h0)); // STATUS
                     6: set_x(bit_op(in_shift, mov_op));     // ISR
                     7: set_x(bit_op(out_shift, mov_op));    // OSR
                   endcase
                2: case (mov_source) // Y
                     0: set_y(bit_op(in_pins, mov_op));      // PINS
                     1: set_y(bit_op(x, mov_op));            // X
                     3: set_y(bit_op(null_src, mov_op));     // NULL
                     5: set_y(status_sel ? (rx_level_joined < status_n ? 32'hffffffff : 32'h0) : (tx_level_joined < status_n ? 32'hffffffff : 32'h0)); // STATUS
                     6: set_y(bit_op(in_shift, mov_op));     // ISR
                     7: set_y(bit_op(out_shift, mov_op));    // OSR
                   endcase
                4: case (mov_source) // EXEC
                     0: set_exec(bit_op(in_pins, mov_op));   // PINS
                     1: set_exec(bit_op(x, mov_op));         // X
                     2: set_exec(bit_op(y, mov_op));         // Y
                     3: set_exec(bit_op(null_src, mov_op));  // NULL
                     5: set_exec(status_sel ? (rx_level_joined < status_n ? 32'hffffffff : 32'h0) : (tx_level_joined < status_n ? 32'hffffffff : 32'h0)); // STATUS
                     6: set_exec(bit_op(in_shift, mov_op));  // ISR
                     7: set_exec(bit_op(out_shift, mov_op)); // OSR
                   endcase
                5: case (mov_source) // PC
                     0: set_pc(bit_op(in_pins, mov_op));     // PINS
                     1: set_pc(bit_op(x, mov_op));           // X
                     2: set_pc(bit_op(y, mov_op));           // Y
                     3: set_pc(bit_op(null_src, mov_op));    // NULL
                     5: set_pc(status_sel ? (rx_level_joined < status_n ? 32'hffffffff : 32'h0) : (tx_level_joined < status_n ? 32'hffffffff : 32'h0)); // STATUS
                     6: set_pc(bit_op(in_shift, mov_op));    // ISR
                     7: set_pc(bit_op(out_shift, mov_op));   // OSR
                   endcase
                6: case (mov_source) // ISR
                     0: set_isr(bit_op(in_pins, mov_op));    // PINS
                     1: set_isr(bit_op(x, mov_op));          // X
                     2: set_isr(bit_op(y, mov_op));          // Y
                     3: set_isr(bit_op(null_src, mov_op));   // NULL
                     5: set_isr(status_sel ? (rx_level_joined < status_n ? 32'hffffffff : 32'h0) : (tx_level_joined < status_n ? 32'hffffffff : 32'h0)); // STATUS
                     6: set_isr(bit_op(in_shift, mov_op));   // ISR
                     7: set_isr(bit_op(out_shift, mov_op));  // OSR
                   endcase
                7: case (mov_source) // OSR
                     0: set_osr(bit_op(in_pins, mov_op));    // PINS
                     1: set_osr(bit_op(x, mov_op));          // X
                     2: set_osr(bit_op(y, mov_op));          // Y
                     3: set_osr(bit_op(null_src, mov_op));   // NULL
                     5: set_osr(status_sel ? (rx_level_joined < status_n ? 32'hffffffff : 32'h0) : (tx_level_joined < status_n ? 32'hffffffff : 32'h0)); // STATUS
                     6: set_osr(bit_op(in_shift, mov_op));   // ISR
                     7: set_osr(bit_op(out_shift, mov_op));  // OSR
                   endcase
              endcase
        IRQ:  begin
                if (op1[1]) begin
                  irq_flags_out[irq_index] = 0;              // CLEAR
                  irq_flags_stb[irq_index] = penable || imm;
                end else begin                               // SET
                  irq_flags_out[irq_index] = 1;
                  irq_flags_stb[irq_index] = (penable || imm) && !irq_waiting;
                  waiting = !restart && blocking && // stop waiting if restart is specified
                    (!irq_waiting || imm_until_resolved) && (irq_flags_out[irq_index] != 0) || // if not currently waiting or we're doing an imm IRQ, consult the flags_out, because flags_in takes a cycle to set
                    irq_waiting && (irq_flags_in[irq_index] != 0); // If wait set, wait for irq cleared
                  // always set waiting on the first cycle, and then after that we watch the in flags for the reset condition
                  // the restart flag will also reset the flag, but this is handle in the actual synchronous block
                  irq_waiting_next = !irq_waiting || (irq_flags_in[irq_index] != 0);
                end
              end
        SET:  case (destination) // Destination
                0: pins_set(data);                           // PINS
                1: set_x({27'b0, data});                     // X
                2: set_y({27'b0, data});                     // Y
                4: dirs_set(data);                           // PINDIRS
              endcase
      endcase
    end
  end

  // Clock divider
  pio_divider clk_divider (
    .clk(clk),
    .reset(reset | clkdiv_restart),
    .div_int(div_int),
    .div_frac(div_frac),
    .penable(penable)
  );

  // Instruction decoder
  pio_decoder decode (
    .instr(exec1 & !imm_until_resolved ? exec_instr : instr),
    .sideset_bits(pins_side_count),
    .sideset_enable_bit(sideset_enable_bit),
    .sideset_enabled(sideset_enabled),
    .op(op),
    .op1(op1),
    .op2(op2),
    .delay(delay),
    .side_set(side_set)
  );

  // Synchronous modules
  // PC
  assign stalling = (
    waiting
    || delaying
    || (
      exec1 && !restart
      && !( // exec-of-exec case that side-effects the PC: not the case that....
           (((op == OUT || op == MOV) // the instruction is either an OUT or MOV
            && (destination == 5)) // with a destination of the PC
            || (op == JMP) // or the instruction is a JMP
           ) && !waiting1  // and the decoded instruction is actually valid (not waiting for the out exec to arrive)
          )
      )
    );
  always @(posedge clk) begin
    if (en & penable) begin
      exec_stalled <= imm_until_resolved;
    end
  end
  pio_pc pc_reg (
    .clk(clk),
    .penable(en & penable),
    .reset(reset),
    .din(new_pc[4:0]),
    .jmp(jmp),
    .stalled(stalling),
    .pend(pend),
    .wrap_target(wrap_target),
    .imm(imm_until_resolved),
    .dout(pc)
  );

  // X
  pio_scratch scratch_x (
    .clk(clk),
    .penable(enabled),
    .reset(reset),
    .stalled(delaying),
    .din(new_x),
    .set(setx),
    .dec(decx),
    .dout(x)
  );

  // Y
  pio_scratch scratch_y (
    .clk(clk),
    .penable(enabled),
    .reset(reset),
    .stalled(delaying),
    .din(new_y),
    .set(sety),
    .dec(decy),
    .dout(y)
  );

  // ISR
  pio_isr shift_in (
    .clk(clk),
    .penable(enabled),
    .reset(reset | restart),
    .stalled(waiting ||delaying),
    .dir(in_shift_dir),
    .shift(op2),
    .set(set_shift_in),
    .do_shift(do_in_shift),
    .din(isr_val),
    .dout(in_shift),
    .push_dout(dout),
    .bit_count(bit_count),
    .shift_count_autopush(isr_count_autopush),
    .shift_count(isr_count)
  );

  // OSR
  pio_osr shift_out (
    .clk(clk),
    .penable(enabled),
    .reset(reset),
    .restart(restart),
    // during auto-pull, we always wait a cycle. But we still want the FIFO to load!
    .stalled((waiting && !auto) || delaying),
    .dir(out_shift_dir),
    .shift(op2),
    .set(set_shift_out),
    .do_shift(do_out_shift),
    .din(pull ? din : pull_val),
    .dout(out_shift),
    .shift_count_lookahead(osr_count_lookahead),
    .shift_count(osr_count)
  );

endmodule

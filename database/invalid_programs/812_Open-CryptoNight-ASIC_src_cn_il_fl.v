// This program was cloned from: https://github.com/altASIC/Open-CryptoNight-ASIC
// License: Apache License 2.0

`timescale 1 ns / 1 ns // timescale for following modules

module cn_il_fl (
   clk,
   reset_n,

   // Control
   ctrl_start,
   ctrl_mode,
   sts_running,
   sts_finished,

   // Buffer RAM access
   // reg_cs,
   reg_address,
   reg_write,
   reg_wrdata,
   reg_rddata,

   // Access to table RAM
   table_address,
   table_write,
   table_read,
   table_rddata,
   table_wrdata,

   // AES cipher round
   cipher_StateIn,
   cipher_Roundkey,
   cipher_StateOut,
   last_cipher_iteration,

   // Computed A and B values
   initial_a,
   initial_b,

   // Test
   mode_speedup
   );

parameter ADDR_WIDTH = 17;
parameter UNROLL = 1;

input   clk;
input   reset_n;

//  ctrl interface
input       ctrl_start;
input [1:0] ctrl_mode;

wire ctrl_mode_setup = ctrl_mode == 2;
wire ctrl_mode_il = ctrl_mode == 1;
wire ctrl_mode_fl = ctrl_mode == 0;

output   sts_running;
output   sts_finished;

//  registers memory map interface
input   [7:0] reg_address;
input   reg_write;
input      [127:0] reg_wrdata;
output     [127:0] reg_rddata;

// CN memory map interface
output [ADDR_WIDTH - 1:0] table_address;
output table_write;
output table_read;
input  [127:0] table_rddata;
output [127:0] table_wrdata;

// AES cipher round
output last_cipher_iteration;
output [127:0] cipher_StateIn;
output [128*UNROLL-1:0] cipher_Roundkey;
input  [127:0] cipher_StateOut;

output reg [127:0] initial_a;
output reg [127:0] initial_b;

input mode_speedup;

`include "cn.vh"

// --------------------------------------------------------------------------
// signals
// --------------------------------------------------------------------------

reg  [3:0] pointer_k;
reg  [3:0] real_k;
// reg  [3 + 1:0] round_key_address;
wire [128*UNROLL-1:0] round_key;
// reg  reg_cs_round_key;
wire [127:0] reg_rddata_round_key;

//  encode block memory signals
wire [2:0] pointer_b;
reg  [2:0] real_b;
wire [127:0] z_sram_dout;
// reg  reg_cs_buffer;
reg  [1:0] phase_onehot;
wire [127:0] reg_rddata_block;

wire    il_ram_wr;
wire    fl_ram_wr;
reg     [2:0] Z_sram_address;

//  'z' memory signals
wire    [127:0] buffer_sram_dout;
wire    [127:0] reg_rddata_z;
reg     [7:0] buffer_sram_address;

//  data and address holder for posponed write
reg     [2:0] holder_b;

//  AES signals
reg     [127:0] aes_input;
wire    [127:0] aes_output;

//  iteration counter
reg     [ADDR_WIDTH:0] iteration;
assign  pointer_b = iteration;

//  control signals
reg    running;
reg    finished;

function [127:0] byteswap;
input [127:0] indata;
reg [127:0] data;
begin
  byteswap = 0; // eliminate warnings
  data = indata;
  repeat (16) begin
    byteswap = {byteswap, data[7:0]};
    data = data >> 8;
  end
end
endfunction

// =======================================================================================
// On chip memories
// =======================================================================================

assign reg_rddata = reg_rddata_z;

// Algorithm Scratch RAM controls

reg Z_sram_we;
reg [127:0] Z_sram_din;

reg buffer_sram_we;
reg [7:0] setup_buffer_addr;

reg round_key_we;

reg setup_Z_sram_we;
reg [2:0] setup_Z_addr;

reg [5:0] setup_state;

always @(*) begin
  Z_sram_address = 0;
  buffer_sram_address = 0;
  Z_sram_we = 0;
  buffer_sram_we = 0;
  Z_sram_din = 0;
  case (ctrl_mode)
  0 : begin // FL
     buffer_sram_we = fl_ram_wr;
     buffer_sram_address = (fl_ram_wr ? holder_b : pointer_b) + Z_ADDR;
     end
  1 : begin // IL
     Z_sram_we = il_ram_wr;
     Z_sram_address = (il_ram_wr ? holder_b : pointer_b) + Z_ADDR;
     Z_sram_din = aes_output;
     end
  2 : begin // Setup
      buffer_sram_address = setup_buffer_addr; // Read from here
      Z_sram_address = setup_Z_addr; // Write to here
      Z_sram_we = setup_Z_sram_we;
      Z_sram_din = buffer_sram_dout; // for loading Z from buffer
    end
  endcase
end

   //  ----------------------------------------------------------------------------------------
   //  round keys memory
   //  ----------------------------------------------------------------------------------------

   wire [127:0] Roundkeys;

    key_ram #(.UNROLL(UNROLL)) round_key_sram_inst (
      .clk(clk),
      .we(round_key_we),
      .din(Roundkeys),
      .waddr({setup_state[3:0], setup_state[4]}),
      .raddr({pointer_k, ctrl_mode_fl}),
      .dout(round_key)
    );

   //  ----------------------------------------------------------------------------------------
   //  Z scratchpad (used by IL)
   //  ----------------------------------------------------------------------------------------

   spram #(.ADDR_WIDTH(3), .DATA_WIDTH(128)) Z_sram_inst (
     .clk(clk),
     .cs(1'b1),
     .we(Z_sram_we),
     .din(Z_sram_din),
     .addr(Z_sram_address),
     .dout(z_sram_dout)
     );

     //  ----------------------------------------------------------------------------------------
     //  Buffer RAM, (finalization Z written here)
     //  ----------------------------------------------------------------------------------------

     dpram #(.ADDR_WIDTH(7), .DATA_WIDTH(128)) buffer_sram_inst (
       .clk(clk),
       //  algorithm interface
       .we1(buffer_sram_we),
       .din1(aes_output),
       .addr1(buffer_sram_address[6:0]),
       .dout1(buffer_sram_dout),
       //  cpu interface
       .we2(reg_write),
       .din2(reg_wrdata),
       .addr2(reg_address[6:0]),
       .dout2(reg_rddata_z)
       );

    //  =======================================================================================
    //  CN memory interface
    //  =======================================================================================

    assign table_address = ctrl_mode_il ? iteration[ADDR_WIDTH-1:0]-1 : iteration[ADDR_WIDTH-1:0];
    assign table_write   = ctrl_mode_il ? phase_onehot[1] : 0; //  used during initialization
    assign table_read    = ctrl_mode_fl ? phase_onehot[0] : 0; //  used during finalization
    assign table_wrdata  = aes_output;

  //  ----------------------------------------------------------------------------------------
  //  AES datapath
  //  ----------------------------------------------------------------------------------------

  always @(posedge clk or negedge reset_n)
    if (!reset_n)
      aes_input <= 0;
    // IL case
    else if (ctrl_mode_il) begin
      if (real_k == 0)
        aes_input <= z_sram_dout;
      else
        aes_input <= aes_output;
    // FL case
    end else if (ctrl_mode_fl) begin
      if (real_k == 0 )
         aes_input <= buffer_sram_dout ^ table_rddata;
      else
         aes_input <= aes_output;
    end

  assign cipher_StateIn = aes_input;
  assign cipher_Roundkey = round_key;
  assign aes_output = cipher_StateOut;

  //  ----------------------------------------------------------------------------------------
  //  address and data holder for posponed write
  //  ----------------------------------------------------------------------------------------

  always @(negedge reset_n or posedge clk)
    if (!reset_n)
      holder_b <= 0;
    else if (phase_onehot[0])
      holder_b <= pointer_b - 1;

 //  =======================================================================================
 //  A and B computation
 //  =======================================================================================

  reg latch_A;
  reg latch_B;
  reg clear_AB;

  always @(posedge clk or negedge reset_n)
    if (!reset_n)
      {initial_a, initial_b} <= 0;
    else if (clear_AB)
      begin
      {initial_a, initial_b} <= 0;
      end
    else if (latch_A)
      begin
        initial_a <= initial_a ^ buffer_sram_dout;
        // $display("%0d  initial_A: %h, %h, %h", $stime, byteswap(initial_a ^ buffer_sram_dout), buffer_sram_address, reg_cs_buffer);
      end
    else if (latch_B)
      begin
        initial_b <= initial_b ^ buffer_sram_dout;
        // $display("%0d  initial_B: %h, %h, %h", $stime, byteswap(initial_b ^ buffer_sram_dout), buffer_sram_address, reg_cs_buffer);
      end

  //  =======================================================================================
  //  AES Key Expansion
  //  =======================================================================================

  reg [1:0] keyExpansion_run; // 1 == load 1st key, 2 = load 2nd key, 3 = iterate, 0 = don't change state
  wire [127:0] Cipherkey;

  keyExpansion ke(
    .clk(clk),
    .reset_l(reset_n),
    .run(keyExpansion_run),
    .Cipherkey(byteswap(buffer_sram_dout)),
    .Roundkeys(Roundkeys)
    );

  //  =======================================================================================
  //  State machine
  //  =======================================================================================

  // Setup state machine

  reg setup_write_keys;
  reg setup_write_key;
  reg [5:0] next_setup_state;
  reg setup_done;

  always @(negedge reset_n or posedge clk)
  if (!reset_n)
    setup_state <= 0;
  else if (running && ctrl_mode_setup) begin
    // $display("%0d  setup_state = %h", $stime, next_setup_state);
    setup_state <= next_setup_state;
    end
  else begin
    setup_state <= 0;
// synopsys translate_off
    if (setup_state)
      $display("%0d  setup_state being set to zero", $stime);
// synopsys translate_on
  end

  always @(*) begin
    setup_Z_sram_we = 0;
    setup_write_key = 0;
    setup_buffer_addr = 0;
    setup_Z_addr = 0;
    next_setup_state = setup_state + 1;
    latch_A = 0;
    latch_B = 0;
    clear_AB = 0;
    setup_done = 0;
    round_key_we = 0;
    keyExpansion_run = 0;
    casex (setup_state)
    'b0???, 'h8: begin // Copy Z words
      setup_buffer_addr = Z_ADDR + setup_state[2:0]; // Read from buffer
      setup_Z_addr = Z_ADDR + setup_state[2:0] - 1;  // Write to Z RAM
      setup_Z_sram_we = 1;
    end
    'ha: begin  // Read first 32 bytes
      setup_buffer_addr = 0;
      clear_AB = 1;
    end
    'hb: begin
      setup_buffer_addr = 1;
      latch_A = 1;
      keyExpansion_run = 1;
      // #1 $display("%0d  KeyExpansion input[0] <= %h", $stime, (buffer_sram_dout));
    end
    'hc: begin
      latch_B = 1;
      keyExpansion_run = 2;
      // #1 $display("%0d  KeyExpansion input[1] <= %h", $stime, byteswap(buffer_sram_dout));
      next_setup_state = 'h20;
    end
    'b10_0???, 'h28, 'h29 : begin  // Compute & write IL key expansion
      // #1 $display("%0d  KeyExpansion output[%0d] <= %h", $stime, setup_state[3:0], Roundkeys);
      keyExpansion_run = 3;
      round_key_we = 1;
      if (setup_state == 'h29)
        next_setup_state = 'h1a;
    end
    'h1a: begin  // Read second 32 bytes
      setup_buffer_addr = 2;
    end
    'h1b: begin
      setup_buffer_addr = 3;
      latch_A = 1;
      keyExpansion_run = 1;
      // #1 $display("%0d  KeyExpansion input[0] <= %h", $stime, (buffer_sram_dout));
    end
    'h1c: begin
      latch_B = 1;
      keyExpansion_run = 2;
      next_setup_state = 'h30;
      // #1 $display("%0d  KeyExpansion input[1] <= %h", $stime, byteswap(buffer_sram_dout));
    end
    'b11_0???, 'h38, 'h39: begin  // Compute & write FL key expansion
      // #1 $display("%0d  KeyExpansion output[%0d] <= %h", $stime, setup_state[3:0], Roundkeys);
      keyExpansion_run = 3;
      round_key_we = 1;
      if (setup_state == 'h39)
        next_setup_state = 'h3f;
    end
    'h3f: begin // Done
      setup_done = running; // Important to deassert upon not running
      next_setup_state = 'h3f; // Stay here until machine reset
    end
    endcase
  end

  // IL/FL state machine

  reg [1:0] running1;
  always @(posedge clk)
    if (!running) running1 <= 0;
    else running1 <= {running1, running};

  assign il_ram_wr = phase_onehot[1] & ctrl_mode_il && running1[1];
  assign fl_ram_wr = phase_onehot[1] & ctrl_mode_fl && running1[1];

  always @(pointer_k or running) begin
    phase_onehot[0] = running && pointer_k == 0;
    phase_onehot[1] = running && pointer_k == UNROLL;
  end

  assign last_cipher_iteration = pointer_k >= (10-UNROLL);

  always @(negedge reset_n or posedge clk)
  if (!reset_n) begin
     pointer_k <= 0;
     iteration <= 0;
  end else if (!running) begin
    pointer_k <= 0;
    iteration <= 0;
  end else begin
    if (pointer_k >= (10-UNROLL)) begin
      // $display("pointer_k 1: %h, last_cipher_iteration: %b", pointer_k, last_cipher_iteration);
      // $stop;
      pointer_k <= 0; // Modulo 10 counter for AES iteration
      iteration <=  iteration +1;
    end else begin
      pointer_k <= pointer_k + UNROLL;
      // $display("pointer_k 2: %h, last_cipher_iteration: %b", pointer_k, last_cipher_iteration);
    end
  end

  //  real 'b' pointer position
  //  real 'k' pointer position

  always @(negedge reset_n or posedge clk)
   if (!reset_n) begin
      real_k <= 0;
      real_b <= 0;
   end else if (!running) begin
       real_k <= 0;
       real_b <= 0;
   end else begin
       real_k <= pointer_k;
       real_b <= pointer_b;
   end

  //  =======================================================================================
  //  Start/finish
  //  =======================================================================================

  parameter N_iterations_full    = 1 << ADDR_WIDTH;
  parameter N_iterations_speedup = 1 << (ADDR_WIDTH - CFG_SPEEDUP_IL_LOG2);

  wire [ADDR_WIDTH:0] N_iterations = mode_speedup ? N_iterations_speedup : N_iterations_full;

  wire last_iteration_il_fl = phase_onehot[1] && iteration >= N_iterations;

  reg     [1:0]  START_DELAY;

  always @(negedge reset_n or posedge clk)
    if (!reset_n) begin
       running <= 0;
       finished <= 0;
       START_DELAY <= 0;
    end else begin
      START_DELAY <= {START_DELAY, ctrl_start};
       if (!START_DELAY[1] && START_DELAY[0]) begin
          running <= 1;
          finished <= 0;
       end else if (last_iteration_il_fl || setup_done) begin
          running <= 0;
          finished <= 1;
       end else
          finished <= 0;
    end

  assign sts_running = running;
  assign sts_finished = finished;

endmodule // module cn_il_fl

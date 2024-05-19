// This program was cloned from: https://github.com/altASIC/Open-CryptoNight-ASIC
// License: Apache License 2.0

`timescale 1 ns / 1 ns // timescale for following modules

module cn_ml (
   clk,
   reset_n,

   ctrl_start,
   sts_running,
   sts_finished,

   // Table RAM
   ram_rden,
   ram_wren,
   ram_wrdata,
   ram_addr,
   ram_rddata,

   // AES cipher round
   cipher_StateIn,
   cipher_Roundkey,
   cipher_StateOut,

   // Parameters
   in_a,
   in_b,

   // Test
   mode_speedup
   );

`include "cn.vh"

parameter ADDR_WIDTH = 17;

//  ctrl interface
input   clk;
input   reset_n;
input   ctrl_start;
//  sts interface
output   sts_running;
output   sts_finished;

// Table RAM
output  ram_rden;
output  ram_wren;
output  [127:0] ram_wrdata;
output  [ADDR_WIDTH-1:0] ram_addr;
input   [127:0] ram_rddata;

// AES cipher round
output [127:0] cipher_StateIn;
output [127:0] cipher_Roundkey;
input  [127:0] cipher_StateOut;

//  memory map interface
input   [127:0] in_a;
input   [127:0] in_b;

input mode_speedup;

//  specify the multiplier delay in clock cycles
localparam integer MULTIPLIER_DELAY = 1;     // 1 or 2
localparam integer ELIMINATE_WAIT_STATE = 1; // 0 or 1
initial $display("MULTIPLIER_DELAY = %0d", MULTIPLIER_DELAY);
initial $display("ELIMINATE_WAIT_STATE = %0d", ELIMINATE_WAIT_STATE);

//  RAM size definition
localparam integer BYTE_ADDRESS_BITS = ADDR_WIDTH + 4;

//  signals declaration
//  input signals
reg     [127:0] a;
reg     [127:0] b;
wire    [127:0] next_a;

//  internal signals
reg     phase_0_read;
reg     phase_1_aes;
reg     phase_2_read;
reg     phase_3_mult;
reg     phase_x_write;
reg     phase_4_read;
reg     phase_5_write;

wire    [127:0] aes_async_v;
reg     [127:0] aes;
wire    [127:0] product;
reg     [127:0] ram_2nd_wr_data;
reg     [127:0] ram_1st_wr_data;
reg     [ADDR_WIDTH - 1:0] ram_1st_wr_addr;
reg     [ADDR_WIDTH - 1:0] ram_2nd_wr_addr;

//  on chip RAM signals
reg     [ADDR_WIDTH - 1:0] ram_addr;
//  word addressing
wire     [127:0] ram_rddata;
wire     [127:0] ram_rddata_corr1;
wire     [127:0] ram_rddata_corr2;
reg      [127:0] ram_wrdata;
wire     ram_wren;
wire     [63:0] adder_low;
wire     [63:0] adder_high;

//  iteration counter
reg     [19:0] iteration;

//  control signals
reg    running;
reg    finished;
reg    start;

localparam  speedup_mask = (1 << (ADDR_WIDTH-CFG_SPEEDUP_IL_LOG2)) - 1;

function [ADDR_WIDTH-1:0] to_addr;
input   [127:0] data;
begin
  to_addr = data >> 4;
  if (mode_speedup)
    to_addr = to_addr & speedup_mask;
end
endfunction

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

  //  ========================================================================================
  //  Table RAM -- 128K words
  //  ========================================================================================

  assign ram_wren = phase_x_write | phase_5_write;
  assign ram_rden = phase_0_read | phase_2_read;

  always @(*)
    if (phase_x_write)
       ram_wrdata = ram_1st_wr_data;
    else
       ram_wrdata = ram_2nd_wr_data;

  //  RAM address generation

  always @(*)
      //  1st read
      if (phase_0_read)
        // ram_addr = to_addr(a);
        ram_addr = to_addr(ELIMINATE_WAIT_STATE ? next_a : a);
      //  1st write
      else if (phase_x_write)
        ram_addr = ram_1st_wr_addr;
      //  2nd read
      else if (phase_2_read)
        ram_addr = to_addr(aes);
      //  2nd write
      else if (phase_5_write)
        ram_addr = ram_2nd_wr_addr;
      else
        ram_addr = to_addr(aes);

  //  ========================================================================================
  //  1st - READ 1
  //  ========================================================================================
  //  address holder for first write

  always @(negedge reset_n or posedge clk)
     if (!reset_n)
        ram_1st_wr_addr <= 0;
     else if (phase_0_read)
        // ram_1st_wr_addr <= to_addr(a);
        ram_1st_wr_addr <= to_addr(ELIMINATE_WAIT_STATE ? next_a : a);

  //  =======================================================================================
  //  2nd - AES + WRITE 2
  //  =======================================================================================
  //  address comparator

  assign ram_rddata_corr1 = ram_2nd_wr_addr != ram_1st_wr_addr ? ram_rddata : ram_2nd_wr_data;

  always @(posedge clk)
    if (ram_2nd_wr_addr == ram_1st_wr_addr) begin
      if (phase_1_aes)
        $display("%0d  Phase 1 RAM write buffer resolved: %h", $stime, ram_1st_wr_addr);
      if (phase_x_write)
        $display("%0d  Phase x RAM write buffer resolved: %h", $stime, ram_1st_wr_addr);
    end

  reg [127:0] cipher_StateIn1;
  always @(posedge clk or negedge reset_n )
    if (!reset_n)
      cipher_StateIn1 <= 0;
    else if (phase_1_aes)
      cipher_StateIn1 <= ram_rddata_corr1;

  assign cipher_StateIn = cipher_StateIn1;
  assign cipher_Roundkey = byteswap(a);
  assign aes_async_v = cipher_StateOut;

  always @(aes_async_v)
    aes = aes_async_v;

  //  =======================================================================================
  //  3rd - READ 2
  //  1st XOR
  //  =======================================================================================

  always @(negedge reset_n or posedge clk)
     if (!reset_n)
        ram_1st_wr_data <= 0;
     else if (phase_2_read)
        ram_1st_wr_data <= b ^ aes;

  //  address holder for second write

  always @(negedge reset_n or posedge clk)
     if (!reset_n)
        ram_2nd_wr_addr <= 0;
     else if (phase_2_read)
        ram_2nd_wr_addr <= to_addr(aes);

  //  =======================================================================================
  //  4th - Multiply
  //  =======================================================================================

  // bypass in case data being written to same address as that being read
  assign ram_rddata_corr2 = ram_2nd_wr_addr != ram_1st_wr_addr ? ram_rddata : ram_1st_wr_data;

  //  Fully registered 64 x 64-bit multiplier
  //  product <= aes * ram_rddata_corr2;
  multiplier #(.MULTIPLIER_DELAY(MULTIPLIER_DELAY)) multiplier_inst(
    .clk(clk),
    .reset_n(reset_n),
    .in_A(aes),
    .in_B(ram_rddata_corr2),
    .in_valid(phase_3_mult),
    .product(product)
    );

  //  =======================================================================================
  //  Xth - adder
  //  =======================================================================================

  //  128-bit adder and 2nd XOR

  assign adder_low = a[63:0] + product[127:64];
  assign adder_high = a[127:64] + product[63:0];

  //  Table write data

  always @(negedge reset_n or posedge clk)
     if (!reset_n)
        ram_2nd_wr_data <= 0;
     // else if (phase_x_write)
     else if (ELIMINATE_WAIT_STATE ? phase_4_read : phase_x_write) // This is the right one
       ram_2nd_wr_data <= {adder_high, adder_low};

  // Update a and b registers

  reg [127:0] xor_ram_data;

  always @(negedge reset_n or posedge clk)
    if (!reset_n) begin
      xor_ram_data <= 0;
    end else if (phase_3_mult) // Capture RAM read data for XOR
      xor_ram_data <= ram_rddata_corr2;

  assign next_a = {adder_high, adder_low} ^ (MULTIPLIER_DELAY ? xor_ram_data : ram_rddata_corr2);

  always @(negedge reset_n or posedge clk)
    if (!reset_n) begin
      a <= 0;
      b <= 0;
    end else if (ELIMINATE_WAIT_STATE ? phase_4_read : phase_x_write) begin
      a <= next_a;
      b <= aes;
    end else if (start) begin
      a <= in_a;
      b <= in_b;
    end

  //  ----------------------------------------------------------------------------------------
  //  State machine
  //  ----------------------------------------------------------------------------------------

  // always @(posedge clk) if (phase_x_write) $display("%0d  a: %h, b: %h", $stime, a, b);
  // always @(posedge clk) if (phase_5_write) $stop;

  // Phases

  localparam integer LAST_PHASE = 4 + MULTIPLIER_DELAY - 1 - ELIMINATE_WAIT_STATE; // Complexity for multiplier delay

  reg     [LAST_PHASE:0]  PHASE;
  reg     [1:0]  WR_DELAY;

  always @(negedge reset_n or posedge clk)
    if (!reset_n)
        {WR_DELAY, PHASE} <= 0;
    else if (start)
        {WR_DELAY, PHASE} <= 1;
    else
        {WR_DELAY, PHASE} <= {WR_DELAY, PHASE, PHASE[LAST_PHASE] && running};

  always @(PHASE or WR_DELAY) begin
     phase_0_read  = PHASE[0]; // First read
     phase_1_aes   = PHASE[1]; // Second Write delayed from previous iteration
     phase_2_read  = PHASE[2]; // Second Read
     phase_3_mult  = PHASE[3];
     phase_x_write = PHASE[LAST_PHASE]; // PHASE[5] -- First write
     phase_4_read  = WR_DELAY[0];       // PHASE[6] -- Read preceding second write
     phase_5_write = WR_DELAY[1];       // PHASE[7] -- Second write delayed into next iteration
  end

  //  Iteration counter

  always @(negedge reset_n or posedge clk)
    if (!reset_n)
      iteration <= 0;
    else if (running) begin
      iteration <= iteration + PHASE[LAST_PHASE];
    end else
      iteration <= 0;

  // Run/finish

  reg     [1:0]  START_DEL;

  parameter last_iteration_full    = (20'b1 << 19) - 1;
  parameter last_iteration_speedup = (20'b1 << (19 - CFG_SPEEDUP_ML_LOG2)) - 1;

  wire [19:0] last_iteration = mode_speedup ? last_iteration_speedup : last_iteration_full;

  always @(posedge clk or negedge reset_n)
     if (!reset_n) begin
        running <= 0;
        finished <= 0;
        start <= 0;
        START_DEL <= 0;
     end else begin
        START_DEL <= {START_DEL, ctrl_start};
        if (!START_DEL[1] & START_DEL[0]) begin
           running <= 1;
           finished <= 0;
           start <= 1;
        end else if (iteration >= last_iteration) begin
           running <= 0;
           finished <= 1;
           start <= 0;
        end else
           start <= 1'b 0; // TODO: Should this also set finished to zero?
     end

  assign sts_running = running;
  assign sts_finished = finished & phase_5_write & ~phase_1_aes;

endmodule // module cn_ml

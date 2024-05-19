// This program was cloned from: https://github.com/altASIC/Open-CryptoNight-ASIC
// License: Apache License 2.0

`timescale 1 ns / 1 ps // timescale for following modules

module cn_core_tb ();

parameter integer ADDR_WIDTH = 17;

`include "cn.vh"
`include "io_link_symbols.vh"

//  clock generation

parameter tclk = 2.0;
reg clk;
initial forever begin
   #(tclk/2.0) clk <= 0;
   #(tclk/2.0) clk <= 1;
   end

integer clocks;
initial clocks = 0;
always @(posedge clk) begin
   clocks = clocks + 1;
   if (!(clocks%100000)) $display("clocks: %d", clocks);
   if (clocks > 7000000) $finish;
end

reg     reset_n;
initial reset_n = 0;
always @(posedge clk)
 if (clocks == 30)
   reset_n <= 1;

wire [8:0] s_in;
reg  [8:0] s_out;

// `define DUMP
`ifdef DUMP
initial begin
  $dumpfile("dumpfile.vcd");
  $dumpvars(0, cn_core_tb);
  $dumpoff;
  @(posedge clk);
  while (!reset_n) @(posedge clk);
  $display ("%0d  Turning dump on", $stime);
  $dumpon;
end
`endif

reg    [7:0] key_address;
reg    [7:0] Z_address;
// reg    [7:0] check_address;
integer check_address;
reg    error_detect;

// ---------------------------------------------------------------------------------------------
//  DUT
// ---------------------------------------------------------------------------------------------

reg [CFG_BITS-1:0] asic_cfg;
reg [CORE_ID_BITS-1:0] core_id;

cn_core #(.ADDR_WIDTH(ADDR_WIDTH)) DUT(
    .clk(clk),
    .reset_l(reset_n),
    .s_out(s_in),
    .s_in(s_out),
    .cfg(asic_cfg)
    );

// ---------------------------------------------------------------------------------------------
//  Functions for file I/O and reading vectors
// ---------------------------------------------------------------------------------------------

function integer open_file;
input [800-1:0] fname;
integer fileno;
begin
  fileno = $fopen(fname, "r");
  if (!fileno) begin
    $display("%0d  Cannot open file: %0s", $stime, fname);
    $finish;
  end
  open_file = fileno;
end
endfunction

function [1000*8-1:0] read_vector;
input [100*8-1:0] command;
input [100*8-1:0] fname;
integer fileno;
reg[1000*8-1:0] hexval;
reg found;
integer len;
integer char;
begin
fileno = open_file(fname);
found = 0;
while (!found && !$feof(fileno)) begin
  found = 0;
  while (!found) begin
    char = $fgetc(fileno);
    if (char == "#")
      len = $fgets(hexval, fileno);
    else if (char != "\n")
      found = 1;
  end
  len = $ungetc(char, fileno);
  // len = $fscanf(fileno, "%0s", hexval); // Use this one for VCS
  len = $fscanf(fileno, "%s", hexval); // Use this one for iVerilog
  if (hexval!= command) begin
    found = 0;
    len = $fgets(hexval, fileno);
  end else begin
    len = $fscanf(fileno, "%h\n", hexval);
    $display("%0d  read_vector: %0s %0s", $stime, fname, command);
  end
end
$fclose(fileno);
if (!found) begin
  $display("%0d  read_vector: vector line not found: '%0s'", $stime, command);
  $stop;
end

read_vector = hexval;
end
endfunction

function [127:0] byteswap;
input [127:0] indata;
begin
  byteswap = 0; // eliminate warnings
  repeat (16) begin
    byteswap = {byteswap, indata[7:0]};
    indata = indata >> 8;
  end
end
endfunction

// ---------------------------------------------------------------------------------------------
//  Test script
// ---------------------------------------------------------------------------------------------

reg [127:0] SR_in;
always @(posedge clk)
  if (!s_in[8])
    SR_in <= {s_in, SR_in} >> 8;

initial begin : test_script

  reg[127:0] hexval;
  reg [1:0] COUNTER;
  integer Npass;
  integer Nfail;

  reg[26*128-1:0] key_reader_hexval;
  reg[8*208-1:0] Z_hexval;
  reg[8*208-1:0] check_hexval;

  reg[8*100:0] fname;

  `ifdef SPEEDUP_MODE
  asic_cfg = CORE_CFG_SPEEDUP_MODE;
  `else
  asic_cfg = 0;
  `endif
  core_id = 0;

  check_address = -1;

  s_out = symbol_idle; // NOP

  @(posedge clk);
  while (!reset_n) @(posedge clk);
  @(posedge clk);

  if (asic_cfg & CORE_CFG_SPEEDUP_MODE)
    fname = "vectors_out.10.10.txt";
  else if (ADDR_WIDTH==17)
    fname = "vectors_out.txt";
  else
    fname = "vectors_out.small.txt";

  Z_hexval = read_vector("Initial_state:", fname) << 64;
  check_hexval = read_vector("Z_out:", fname) << 128;

  repeat (10) @(posedge clk);

  // send state

  Z_address = 0;
  repeat (13) begin
    hexval = Z_hexval >> 12*128;
    Z_hexval = Z_hexval << 128;
    $display("%0d  Z reader: [%h] <= %h", $stime, Z_address, hexval);
    Z_address = Z_address + 1;
    repeat (16) begin
      s_out[7:0] <= hexval >> 15*8;
      s_out[8] <= 0;
      hexval <= hexval << 8;
      @(posedge clk);
    end
  end

  s_out <= symbol_idle; // NOP
  @(posedge clk);

  s_out <= symbol_idle; // NOP
  @(posedge clk);

  // $display("%0d  starting...", $stime);
  s_out <= symbol_start; // Start
  @(posedge clk)
  s_out <= symbol_idle; // NOP
  $display("%0d  started...", $stime);
  while (s_in != symbol_finished) @(posedge clk);
  // repeat(5) @(posedge clk);
  $display("%0d  checking...", $stime);

  Z_hexval = read_vector("Initial_state:", fname) << 64;
  Z_hexval[9*128-1:128] = check_hexval[9*128-1:128];
  check_hexval = Z_hexval;

  // check_address <= Z_ADDR;
  check_address = 0;
  error_detect = 0;
  COUNTER = 0;
  Npass = 0;
  Nfail = 0;

  s_out <= symbol_init; // Initialize

  repeat (13*4) @(posedge clk) begin
    case (COUNTER)
    0: begin
      repeat (16) begin
        s_out <= 0; // exchange data
        @(posedge clk);
      end
      s_out <= symbol_idle; // NOP
      @(posedge clk);
      end
    2: begin
      repeat (5) @(posedge clk); // Need to wait until data is received -- should interlock with RX
      hexval = check_hexval >> 12*128;
      check_hexval = check_hexval << 128;
      $display(  "Checker:  %h", hexval);
      if (SR_in !== byteswap(hexval)) begin
        error_detect <= 1;
        $display("ERROR, detected in Z");
        $display("expected: %h", byteswap(hexval));
        $display("got:      %h", SR_in);
        $display;
        Nfail = Nfail + 1;
      end else
        Npass = Npass + 1;
      end
    3: begin
      check_address <= check_address + 1;
      end
    endcase
    COUNTER = COUNTER + 1;
  end

  if (Nfail == 0) begin
    $display("\n\nSuccess, all %0d tests passed!", Npass);
    $display;
    $display;
    $finish;
  end else begin
    $display("\n\n**** TEST FAILED ****");
    $display("Passed: %0d", Npass);
    $display("Failed: %0d", Nfail);
    $display;
    $display;
    $stop;
  end

end


// ---------------------------------------------------
// Monitor I/O links
// ---------------------------------------------------

// `include "io_link_symbols.vh"

// wire link_start = DUT.stx[8:0] == symbol_start;
// wire tx_op_start = DUT.mh.tx_op != 0;

reg finish_received;
localparam bytes_per_line = 16;

integer tx_count;
reg [8*bytes_per_line-1:0] tx_monitor_data;
initial begin
  tx_count = 0;
  forever @(posedge clk)
    casex (s_out[8:0])
    symbol_idle:;
    symbol_init:  $display("%0d  tx data: INIT", $stime);
    symbol_start: begin
      if (tx_count%bytes_per_line)
        $display("%0d  tx data > %h (%d bytes)", $stime, tx_monitor_data << 8*(bytes_per_line-(tx_count%bytes_per_line)), tx_count%bytes_per_line );
      tx_count = 0;
      $display("%0d  tx data > START", $stime);
    end
    9'b0_????_????: begin
      tx_monitor_data = {tx_monitor_data, s_out[7:0]};
      tx_count = tx_count + 1;
      if (!(tx_count%bytes_per_line))
        $display("%0d  tx data > %h", $stime, tx_monitor_data);
      end
    default: $display("%0d  tx data: Symbol error", $stime);
    endcase
end

integer rx_count;
reg [8*bytes_per_line-1:0] rx_monitor_data;
initial begin
  rx_count = 0;
  finish_received = 0;
  forever @(posedge clk) begin
    finish_received = 0;
    casex (s_in[8:0])
    symbol_idle:;
    // symbol_init:  $display("%0d  rx data: INIT", $stime);
    symbol_finished: begin
      $display("%0d  foo: rx_count = %d", $stime, rx_count);
      if (rx_count%bytes_per_line)
        $display("%0d  rx data < %h (%d bytes)", $stime, rx_monitor_data << 8*(bytes_per_line-(rx_count%bytes_per_line)), rx_count%bytes_per_line );
      rx_count = 0;
      $display("%0d  rx data < FINISHED", $stime);
      finish_received = 1;
    end
    9'b0_????_????: begin
      rx_monitor_data = {rx_monitor_data, s_in[7:0]};
      rx_count = rx_count + 1;
      if (!(rx_count%bytes_per_line) && check_address >= 0)
        $display("%0d  rx data < %h", $stime, rx_monitor_data);
      end
    default: $display("%0d  rx data: Symbol error", $stime);
    endcase
  end
end

endmodule // module cn_top_tb

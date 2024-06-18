// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Custom verilog based on the template automatically generated from
/* https://wokwi.com/projects/341164910646919762 */

`ifdef SIM
`define UNIT_DELAY #1
`define FUNCTIONAL
`define USE_POWER_PINS
`include "libs.ref/sky130_fd_sc_hd/verilog/primitives.v"
`include "libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"
`endif

`default_nettype none

module user_module_341164910646919762
  (
   input wire [7:0]  io_in,
   output wire [7:0] io_out
   );
   wire              clk = io_in[0];
   wire              output_select = io_in[1];
   wire              gold_out;

   gold_code_module_341164910646919762 gold_code_generator
     (.clk(clk), .loadn(io_in[3]), .b_load({io_in[7:4], io_in[2:1]}),
      .gold(gold_out));

   wire [7:0]        io_out_fibonacci;
   wire              fib_clk;
   wire              fib_rstn;

   // Buffers to fix slew failures
   sky130_fd_sc_hd__buf_2 fib_clk_buf
     (.A(clk), .X(fib_clk),
      .VPWR(1'b1), .VGND(1'b0));

   sky130_fd_sc_hd__buf_2 fib_rstn_buf
     (.A(io_in[2]), .X(fib_rstn),
      .VPWR(1'b1), .VGND(1'b0));

   fibonacci_module_341164910646919762 #(.DIGITS(7)) fibonacci_inst
     (.clk(fib_clk), .rstn(fib_rstn), .io_out(io_out_fibonacci));

   assign io_out[7] = output_select ? gold_out : io_out_fibonacci[7];
   assign io_out[6:0] = io_out_fibonacci[6:0];
endmodule // user_module_341164910646919762

module gold_code_module_341164910646919762
  (
   input wire clk,
   input wire loadn,
   input wire [5:0] b_load,
   output wire gold
   );

   reg [12:0]   a;
   reg [6:0]    b_async;
   reg [5:0]    b_sync;
   wire [12:0]  b = {b_async, b_sync};

   always @(posedge clk or negedge loadn) begin
      a <= {a[0] ^ a[1] ^ a[3] ^ a[4], a[12:1]};
      b_async <= {b[0] ^ b[4] ^ b[5] ^ b[7] ^ b[9] ^ b[10], b[12:7]};

      if (!loadn) begin
         a <= {1'b1, 12'b0};
         b_async <= {1'b0, 1'b1, 5'b0};
      end
   end

   always @(posedge clk) b_sync <= loadn ? b[6:1] : b_load;

   assign gold = a[0] ^ b[0];
endmodule // gold_code_module_341164910646919762

module fibonacci_module_341164910646919762
  #(
    parameter DIGITS = 7
    )
   (
    input wire        clk,
    input wire        rstn,
    output wire [7:0] io_out
    );

   wire [3:0]         digit;
   wire               lsb_marker;

   fibonacci_341164910646919762 #(.DIGITS(DIGITS)) fib
     (.clk(clk), .rstn(rstn), .digit(digit),
      .lsb_marker(lsb_marker));

   wire [7:0]         seven_segment_out;
   
   seven_segment_341164910646919762 seven_segment_encoder
     (.digit(digit), .dot(lsb_marker), .seven_segment(seven_segment_out));

   assign io_out = clk ? seven_segment_out : 8'b0;
endmodule // fibonacci_module_341164910646919762

module fibonacci_341164910646919762
  #(
    parameter DIGITS = 7
    )
   (
    input wire        clk,
    input wire        rstn,
    output wire [3:0] digit,
    output wire       lsb_marker
    );

   localparam         WIDTH = 4 * DIGITS;

   reg [WIDTH-1:0]    a;
   assign digit = a[3:0];
   reg [WIDTH-1:0]    b;
   reg                carry;

   wire [3:0]         digit_sum;
   wire               cout;

   reg [DIGITS-1:0]   lsb_control;
   wire               lsb_marker_prev;
   assign lsb_marker_prev = lsb_control[DIGITS-1];
   assign lsb_marker = lsb_control[0];

   adder4_341164910646919762 adder
     (.a(a[3:0]), .b(b[3:0]), .cin(carry),
      .sum(digit_sum), .cout(cout));

   always @(posedge clk or negedge rstn) begin
      a <= {b[3:0], a[WIDTH-1:4]};
      b <= {digit_sum, b[WIDTH-1:4]};
      carry <= lsb_marker_prev ? 1'b0 : cout;
      lsb_control <= {lsb_control[DIGITS-2:0], lsb_control[DIGITS-1]};

      if (!rstn) begin
         a <= 1'b0;
         b <= 1'b1;
         carry <= 1'b0;
         lsb_control <= 1'b1;
      end
   end
endmodule // fibonacci_341164910646919762

module adder4_341164910646919762
  (
   input wire [3:0]  a,
   input wire [3:0]  b,
   input wire        cin,
   output wire [3:0] sum,
   output wire       cout
   );

   wire [3:0]        adder_cin;
   wire [3:0]        adder_cout;
   assign cout = adder_cout[3];
   assign adder_cin = {adder_cout[2:0], cin};

   sky130_fd_sc_hd__fa_1 adder [3:0]
     (.A(a), .B(b), .CIN(adder_cin),
      .COUT(adder_cout), .SUM(sum),
      .VPWR(1'b1), .VGND(1'b0));
endmodule // adder4_341164910646919762

module seven_segment_341164910646919762
  (
   input wire [3:0]  digit,
   input wire        dot,
   output wire [7:0] seven_segment
   );

   reg               up, mid, down, left_up,
                     left_down, right_up, right_down;
   assign seven_segment = {dot, mid, left_up, left_down,
                           down, right_down, right_up, up};

   always @(*) begin
      up = 1'b0;
      mid = 1'b0;
      down = 1'b0;
      left_up = 1'b0;
      left_down = 1'b0;
      right_up = 1'b0;
      right_down = 1'b0;
      case (digit)
        4'h0: begin
           up = 1'b1;
           down = 1'b1;
           left_up = 1'b1;
           left_down = 1'b1;
           right_up = 1'b1;
           right_down = 1'b1;
        end
        4'h1: begin
           right_up = 1'b1;
           right_down = 1'b1;
        end
        4'h2: begin
           up = 1'b1;
           mid = 1'b1;
           down = 1'b1;
           right_up = 1'b1;
           left_down = 1'b1;
        end
        4'h3: begin
           up = 1'b1;
           mid = 1'b1;
           down = 1'b1;
           right_up = 1'b1;
           right_down = 1'b1;
        end
        4'h4: begin
           left_up = 1'b1;
           right_up = 1'b1;
           mid = 1'b1;
           right_down = 1'b1;
        end
        4'h5: begin
           up = 1'b1;
           mid = 1'b1;
           down = 1'b1;
           left_up = 1'b1;
           right_down = 1'b1;
        end
        4'h6: begin
           up = 1'b1;
           mid = 1'b1;
           down = 1'b1;
           left_up = 1'b1;
           left_down = 1'b1;
           right_down = 1'b1;
        end
        4'h7: begin
           up = 1'b1;
           right_up = 1'b1;
           right_down = 1'b1;
        end
        4'h8: begin
           up = 1'b1;
           mid = 1'b1;
           down = 1'b1;
           left_up = 1'b1;
           left_down = 1'b1;
           right_up = 1'b1;
           right_down = 1'b1;
        end
        4'h9: begin
           up = 1'b1;
           mid = 1'b1;
           left_up = 1'b1;
           right_up = 1'b1;
           right_down = 1'b1;
        end
        4'ha: begin
           up = 1'b1;
           mid = 1'b1;
           left_up = 1'b1;
           left_down = 1'b1;
           right_up = 1'b1;
           right_down = 1'b1;
        end
        4'hb: begin
           mid = 1'b1;
           down = 1'b1;
           left_up = 1'b1;
           left_down = 1'b1;
           right_down = 1'b1;
        end
        4'hc: begin
           up = 1'b1;
           down = 1'b1;
           left_up = 1'b1;
           left_down = 1'b1;
        end
        4'hd: begin
           mid = 1'b1;
           down = 1'b1;
           left_down = 1'b1;
           right_up = 1'b1;
           right_down = 1'b1;
        end
        4'he: begin
           up = 1'b1;
           mid = 1'b1;
           down = 1'b1;
           left_up = 1'b1;
           left_down = 1'b1;
        end
        4'hf: begin
           up = 1'b1;
           mid = 1'b1;
           left_up = 1'b1;
           left_down = 1'b1;
        end
      endcase // case (digit)
   end // always @ (*)
endmodule // seven_segment_341164910646919762

// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`timescale 1 ns / 10 ps
module carry_lookahead_adder_tb ();

 
  parameter WIDTH = 3;
 
  reg [WIDTH-1:0] r_ADD_1 = 0;
  reg [WIDTH-1:0] r_ADD_2 = 0;
  wire [WIDTH-1:0]  w_RESULT;
  wire carry_out;

  localparam DURATION = 100000;

  carry_lookahead_adder #(.WIDTH(WIDTH)) carry_lookahead_inst
    (
     .cin(1),
     .i_add1(r_ADD_1),
     .i_add2(r_ADD_2),
     .o_result(w_RESULT),
     .cout(carry_out)
     );
 
  initial
    begin
      #10;
      r_ADD_1 = 3'b000;
      r_ADD_2 = 3'b000;
      #10;
      r_ADD_1 = 3'b100;
      r_ADD_2 = 3'b100;
      #10;
      r_ADD_1 = 3'b101;
      r_ADD_2 = 3'b110;
      #10;
      r_ADD_1 = 3'b111;
      r_ADD_2 = 3'b111;
      #10;
      r_ADD_1 = 3'b001;
      r_ADD_2 = 3'b010;
      #10;
    end
  initial begin
  $dumpfile("carry_lookahead_adder_tb.vcd");
  $dumpvars(0, carry_lookahead_adder_tb);
  // Wait for given amount of time for simulation to complete
  #(DURATION)
  // Notify and end simulation
  $display("Finished!");
  $finish;
end
 
endmodule // carry_lookahead_adder_tb



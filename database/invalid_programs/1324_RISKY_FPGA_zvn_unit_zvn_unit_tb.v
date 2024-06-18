// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`include "../compare_unit/compare_unit.v"
`include "../cla_adder/carry_lookahead_adder.v"

module zvn_unit_tb ();

localparam WIDTH = 16;

reg [WIDTH - 1:0] reg1;
reg [WIDTH - 1:0] reg2;
reg [2:0] alu_fn;
wire [WIDTH-1:0] w_result;
wire w_cout;
wire z;
wire v;
wire n;
wire b_out;

localparam DURATION = 100000;

carry_lookahead_adder #(.WIDTH(WIDTH)) cla (
  .cin(alu_fn[0]),
  .i_add1(reg1),
  .i_add2(reg2^{WIDTH{alu_fn[0]}}), 
  .o_result(w_result), 
  .cout(w_cout)
);

zvn #(.WIDTH(WIDTH)) zvn_inst (
  .a(reg1),
  .b(reg2),
  .s(w_result),
  .alufn_sig(alu_fn[0]),
  .z(z),
  .v(v),
  .n(n)
);

compare_unit c_unit (
  .z(z),
  .v(v),
  .n(n),
  .alu_fn(alu_fn[2:1]),
  .b_o(b_out)
);

initial begin 
  reg1 = 'h0101;
  reg2 = 'h0011;
  alu_fn[0] = 1;
  alu_fn[2:1] = 'b10;
  #10;
  reg1 = 'hC0FF;
  reg2 = 'hEECC;
  #10;
  reg1 = 'hA234;
  reg2 = 'h8000;
  alu_fn[2:1] = 'b10;
  #10;
  reg1 = 'hFFFF;
  reg2 = 'h0001;
  #10;
  reg1 = 'hC0FF;
  reg2 = 'hEECC;

end
initial begin
  $dumpfile("zvn_unit_tb.vcd");
  $dumpvars(0, zvn_unit_tb);
  // Wait for given amount of time for simulation to complete
  #(DURATION)
  // Notify and end simulation
  $display("Finished!");
  $finish;
end

endmodule

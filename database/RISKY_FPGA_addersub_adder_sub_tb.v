// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module adder_sub_tb ();

localparam WIDTH = 16;

reg [WIDTH - 1:0] reg1;
reg [WIDTH - 1:0] reg2;
reg alu_fn;
wire [WIDTH-1:0] w_result;
wire w_cout;
wire z;
wire v;
wire n;

localparam DURATION = 100000;

adder_sub #(.WIDTH(WIDTH)) uut (
  .a(reg1),
  .b(reg2),
  .alufn(alu_fn),
  .z_out(z),
  .v_out(v),
  .n_out(n),
  .result(w_result),
  .w_cout(w_cout)
);

initial begin 
  reg1 = 'h0101;
  reg2 = 'h0011;
  alu_fn = 1'b1;
  #10;
  reg1 = 'hC0FF;
  reg2 = 'hEECC;
  #10;
  reg1 = 'hA234;
  reg2 = 'h8000;
  #10;
  reg1 = 'hFFFF;
  reg2 = 'h0001;
  alu_fn = 1'b0;
  #10;
  reg1 = 'hC0FF;
  reg2 = 'hEECC;

end
initial begin
  $dumpfile("adder_sub_tb.vcd");
  $dumpvars(0, adder_sub_tb);
  // Wait for given amount of time for simulation to complete
  #(DURATION)
  // Notify and end simulation
  $display("Finished!");
  $finish;
end


endmodule


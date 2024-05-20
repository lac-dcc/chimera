// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module boolean_unit_tb();

localparam WIDTH = 3;

reg [WIDTH-1:0] reg1;
reg [WIDTH-1:0] reg2;
reg [3:0] alufn_sig;
wire [WIDTH-1:0] result;

localparam DURATION = 10000;


boolean_unit #(.WIDTH(WIDTH)) uut (
  .a(reg1),
  .b(reg2),
  .alufn_sig(alufn_sig),
  .out(result)
);


initial begin
  reg1 = 'b111;
  reg2 = 'b010;
  alufn_sig = 'b1000; // and
  #10;
  alufn_sig = 'b0110; // xor
  #10;
  alufn_sig = 'b1110; // or
end


initial begin
  $dumpfile("boolean_unit_tb.vcd");
  $dumpvars(0, boolean_unit_tb);
  // Wait for given amount of time for simulation to complete
  #(DURATION)
  // Notify and end simulation
  $display("Finished!");
  $finish;
end


endmodule

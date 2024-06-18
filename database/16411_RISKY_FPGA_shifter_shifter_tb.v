// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module shifter_tb();

parameter BITS = 32;

reg [BITS-1:0] reg1;
reg [1:0] alufn;
reg [4:0] shift = 0;
wire [BITS-1:0] w_result;

parameter DURATION = 100000;

shifter #(.BITS(BITS)) shl0 (
  .alufn(alufn),
  .a(reg1),
  .b(shift),
  .out(w_result)
);

initial begin
  reg1 = 'h1AFFFFFF;
  shift = 'b0011;
  alufn = 'b01;
  #10;
  alufn = 'b11;
  #10;
  alufn = 'b00;
end

initial begin
  $dumpfile("shifter_tb.vcd");
  $dumpvars(0, shifter_tb);
  // Wait for given amount of time for simulation to complete
  #(DURATION)
  // Notify and end simulation
  $display("Finished!");
  $finish;
end

endmodule

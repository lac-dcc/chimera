// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module x_bit_shifter_tb();

parameter BITS = 8;

reg [BITS-1:0] reg1;
reg pad = 0;
reg shift = 0;
wire [BITS-1:0] w_result;

parameter DURATION = 100000;

x_bit_shifter #(.BITS(BITS), .SHIFT(4)) shl0 (
  .a(reg1),
  .shift(shift),
  .pad(pad),
  .out(w_result)
);

initial begin
  reg1 = 'b1111;
  shift = 1;
  #10;
  shift = 0;
  #10;

end

initial begin
  $dumpfile("x_bit_shifter_tb.vcd");
  $dumpvars(0, x_bit_shifter_tb);
  // Wait for given amount of time for simulation to complete
  #(DURATION)
  // Notify and end simulation
  $display("Finished!");
  $finish;
end

endmodule

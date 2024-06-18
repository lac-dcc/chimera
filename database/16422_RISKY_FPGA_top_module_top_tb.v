// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module top_tb();

localparam DURATION = 100000;

reg clk;
reg reset;
reg irq;
wire [7:0] rgb;

top_module top0 (
  .clk(clk),
  .reset(reset),
  .rgb_out(rgb)
);

initial begin
  clk = 0;
  reset = 1;
  forever begin
  #1 clk <= ~clk;
  reset <= 0;
end

end


initial begin
  $dumpfile("top_tb.vcd");
  $dumpvars(0, top_tb);
  #(DURATION)
  $display("Finished!");
  $finish;
end

endmodule

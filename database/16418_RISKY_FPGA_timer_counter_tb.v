// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module counter_tb();

localparam DURATION = 1000000;

wire ticker;

reg clk;
reg reset;
reg tick;

ms_counter ms0 (
  .clk(clk),
  .rst(rst),
  .tick_out(ticker)
);

initial begin
  clk <= 0;
  reset <= 1;
  forever begin
    #1 clk <= ~clk;
  end
end

always @* begin
  reset <= 0;
  tick <= ticker;
end
initial begin
  $dumpfile("counter_tb.vcd");
  $dumpvars(0, counter_tb);
  #(DURATION)
  $display("Finished!");
  $finish;
end



endmodule

// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module wt_s_tb();

reg [15:0] reg1;
reg [15:0] reg2;
reg alufn;
wire [31:0] w_out;

wt_s wtm0 (
  .A(reg1),
  .B(reg2),
  .C(w_out),
  .alufn(alufn)
);

localparam DURATION = 100000;

initial begin
  alufn = 0;
  reg1 = 36;
  reg2 = 36;
  #10;
  reg1 = -36;
  reg2 = 36;
  #10
  reg1 = 0;
  reg2 = 36;
  #10
  reg1 = -36;
  reg2 = -36;
  #10
  alufn = 1;
  reg1 = 36;
  reg2 = -36;
  #10
  reg1 = 0;
  reg2 = 0;
end


initial begin
  $dumpfile("wt_s_tb.vcd");
  $dumpvars(0, wt_s_tb);
  // Wait for given amount of time for simulation to complete
  #(DURATION)
  // Notify and end simulation
  $display("Finished!");
  $finish;
end

endmodule


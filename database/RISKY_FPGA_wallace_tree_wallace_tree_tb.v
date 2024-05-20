// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module WTM_tb();

reg [31:0] reg1;
reg [31:0] reg2;
wire [63:0] w_out;

WallaceTreeMul wtm0 (
  .A(reg1),
  .B(reg2),
  .C(w_out)
);

localparam DURATION = 100000;

initial begin
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
  reg1 = 36;
  reg2 = -36;
  #10
  reg1 = 0;
  reg2 = 0;
end


initial begin
  $dumpfile("wallace_tree_tb.vcd");
  $dumpvars(0, WTM_tb);
  // Wait for given amount of time for simulation to complete
  #(DURATION)
  // Notify and end simulation
  $display("Finished!");
  $finish;
end

endmodule


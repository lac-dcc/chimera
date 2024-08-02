// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module neg_tb;
  reg clk;
  reg [31:0] neg_a;
  wire [31:0] neg_z;
  integer neg_a_file;
  integer neg_z_file;
  integer neg_a_count;
  integer neg_z_count;

  neg neg1 (clk, neg_a, neg_z);
  initial
  begin
    neg_z_file = $fopen("stim/neg_z");
    neg_a_file = $fopen("stim/neg_a", "r");
  end

  initial
  begin
    #50010 $finish;
  end

  initial
  begin
    clk <= 1'b0;
    while (1) begin
      #5 clk <= ~clk;
    end
  end

  always @ (posedge clk)
  begin
    $fdisplay(neg_z_file, "%d", neg_z);
    #0 neg_a_count = $fscanf(neg_a_file, "%d\n", neg_a);
  end
endmodule

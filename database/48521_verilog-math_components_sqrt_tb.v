// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module sqrt_tb;
  reg clk;
  reg [31:0] sqrt_a;
  wire [31:0] sqrt_z;
  integer sqrt_a_file;
  integer sqrt_z_file;
  integer sqrt_a_count;
  integer sqrt_z_count;

  sqrt sqrt1 (clk, sqrt_a, sqrt_z);
  initial
  begin
    sqrt_z_file = $fopen("stim/sqrt_z");
    sqrt_a_file = $fopen("stim/sqrt_a", "r");
  end

  initial
  begin
    #50110 $finish;
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
    $fdisplay(sqrt_z_file, "%d", sqrt_z);
    #0 sqrt_a_count = $fscanf(sqrt_a_file, "%d\n", sqrt_a);
  end
endmodule

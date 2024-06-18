// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module double_sqrt_tb;
  reg clk;
  reg [63:0] double_sqrt_a;
  wire [63:0] double_sqrt_z;
  integer double_sqrt_a_file;
  integer double_sqrt_z_file;
  integer double_sqrt_a_count;
  integer double_sqrt_z_count;

  double_sqrt double_sqrt1 (clk, double_sqrt_a, double_sqrt_z);
  initial
  begin
    double_sqrt_z_file = $fopen("stim/double_sqrt_z");
    double_sqrt_a_file = $fopen("stim/double_sqrt_a", "r");
  end

  initial
  begin
    #10110 $finish;
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
    $fdisplay(double_sqrt_z_file, "%d", double_sqrt_z);
    #0 double_sqrt_a_count = $fscanf(double_sqrt_a_file, "%d\n", double_sqrt_a);
  end
endmodule

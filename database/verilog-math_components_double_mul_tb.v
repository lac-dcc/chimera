// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module double_mul_tb;
  reg clk;
  reg [63:0] double_mul_a;
  reg [63:0] double_mul_b;
  wire [63:0] double_mul_z;
  integer double_mul_a_file;
  integer double_mul_b_file;
  integer double_mul_z_file;
  integer double_mul_a_count;
  integer double_mul_b_count;
  integer double_mul_z_count;

  double_mul double_mul1 (clk, double_mul_a, double_mul_b, double_mul_z);
  initial
  begin
    double_mul_z_file = $fopen("stim/double_mul_z");
    double_mul_a_file = $fopen("stim/double_mul_a", "r");
    double_mul_b_file = $fopen("stim/double_mul_b", "r");
  end

  initial
  begin
    #10220 $finish;
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
    $fdisplay(double_mul_z_file, "%d", double_mul_z);
    #0 double_mul_a_count = $fscanf(double_mul_a_file, "%d\n", double_mul_a);
    #0 double_mul_b_count = $fscanf(double_mul_b_file, "%d\n", double_mul_b);
  end
endmodule

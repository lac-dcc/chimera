// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module double_max_tb;
  reg clk;
  reg [63:0] double_max_a;
  reg [63:0] double_max_b;
  wire [63:0] double_max_z;
  integer double_max_a_file;
  integer double_max_b_file;
  integer double_max_z_file;
  integer double_max_a_count;
  integer double_max_b_count;
  integer double_max_z_count;

  double_max double_max1 (clk, double_max_a, double_max_b, double_max_z);
  initial
  begin
    double_max_z_file = $fopen("stim/double_max_z");
    double_max_a_file = $fopen("stim/double_max_a", "r");
    double_max_b_file = $fopen("stim/double_max_b", "r");
  end

  initial
  begin
    #10080 $finish;
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
    $fdisplay(double_max_z_file, "%d", double_max_z);
    #0 double_max_a_count = $fscanf(double_max_a_file, "%d\n", double_max_a);
    #0 double_max_b_count = $fscanf(double_max_b_file, "%d\n", double_max_b);
  end
endmodule

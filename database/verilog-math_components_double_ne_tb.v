// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module double_ne_tb;
  reg clk;
  reg [63:0] double_ne_a;
  reg [63:0] double_ne_b;
  wire [0:0] double_ne_z;
  integer double_ne_a_file;
  integer double_ne_b_file;
  integer double_ne_z_file;
  integer double_ne_a_count;
  integer double_ne_b_count;
  integer double_ne_z_count;

  double_ne double_ne1 (clk, double_ne_a, double_ne_b, double_ne_z);
  initial
  begin
    double_ne_z_file = $fopen("stim/double_ne_z");
    double_ne_a_file = $fopen("stim/double_ne_a", "r");
    double_ne_b_file = $fopen("stim/double_ne_b", "r");
  end

  initial
  begin
    #10010 $finish;
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
    $fdisplay(double_ne_z_file, "%d", double_ne_z);
    #0 double_ne_a_count = $fscanf(double_ne_a_file, "%d\n", double_ne_a);
    #0 double_ne_b_count = $fscanf(double_ne_b_file, "%d\n", double_ne_b);
  end
endmodule

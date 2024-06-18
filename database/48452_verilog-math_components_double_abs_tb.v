// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module double_abs_tb;
  reg clk;
  reg [63:0] double_abs_a;
  wire [63:0] double_abs_z;
  integer double_abs_a_file;
  integer double_abs_z_file;
  integer double_abs_a_count;
  integer double_abs_z_count;

  double_abs double_abs1 (clk, double_abs_a, double_abs_z);
  initial
  begin
    double_abs_z_file = $fopen("stim/double_abs_z");
    double_abs_a_file = $fopen("stim/double_abs_a", "r");
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
    $fdisplay(double_abs_z_file, "%d", double_abs_z);
    #0 double_abs_a_count = $fscanf(double_abs_a_file, "%d\n", double_abs_a);
  end
endmodule

// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module double_lt_tb;
  reg clk;
  reg [63:0] double_lt_a;
  reg [63:0] double_lt_b;
  wire [0:0] double_lt_z;
  integer double_lt_a_file;
  integer double_lt_b_file;
  integer double_lt_z_file;
  integer double_lt_a_count;
  integer double_lt_b_count;
  integer double_lt_z_count;

  double_lt double_lt1 (clk, double_lt_a, double_lt_b, double_lt_z);
  initial
  begin
    double_lt_z_file = $fopen("stim/double_lt_z");
    double_lt_a_file = $fopen("stim/double_lt_a", "r");
    double_lt_b_file = $fopen("stim/double_lt_b", "r");
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
    $fdisplay(double_lt_z_file, "%d", double_lt_z);
    #0 double_lt_a_count = $fscanf(double_lt_a_file, "%d\n", double_lt_a);
    #0 double_lt_b_count = $fscanf(double_lt_b_file, "%d\n", double_lt_b);
  end
endmodule

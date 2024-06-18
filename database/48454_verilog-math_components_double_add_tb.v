// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module double_add_tb;
  reg clk;
  reg [63:0] double_add_a;
  reg [63:0] double_add_b;
  wire [63:0] double_add_z;
  integer double_add_a_file;
  integer double_add_b_file;
  integer double_add_z_file;
  integer double_add_a_count;
  integer double_add_b_count;
  integer double_add_z_count;

  double_add double_add1 (clk, double_add_a, double_add_b, double_add_z);
  initial
  begin
    double_add_z_file = $fopen("stim/double_add_z");
    double_add_a_file = $fopen("stim/double_add_a", "r");
    double_add_b_file = $fopen("stim/double_add_b", "r");
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
    $fdisplay(double_add_z_file, "%d", double_add_z);
    #0 double_add_a_count = $fscanf(double_add_a_file, "%d\n", double_add_a);
    #0 double_add_b_count = $fscanf(double_add_b_file, "%d\n", double_add_b);
  end
endmodule

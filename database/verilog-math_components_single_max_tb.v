// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module single_max_tb;
  reg clk;
  reg [31:0] single_max_a;
  reg [31:0] single_max_b;
  wire [31:0] single_max_z;
  integer single_max_a_file;
  integer single_max_b_file;
  integer single_max_z_file;
  integer single_max_a_count;
  integer single_max_b_count;
  integer single_max_z_count;

  single_max single_max1 (clk, single_max_a, single_max_b, single_max_z);
  initial
  begin
    single_max_z_file = $fopen("stim/single_max_z");
    single_max_a_file = $fopen("stim/single_max_a", "r");
    single_max_b_file = $fopen("stim/single_max_b", "r");
  end

  initial
  begin
    #50080 $finish;
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
    $fdisplay(single_max_z_file, "%d", single_max_z);
    #0 single_max_a_count = $fscanf(single_max_a_file, "%d\n", single_max_a);
    #0 single_max_b_count = $fscanf(single_max_b_file, "%d\n", single_max_b);
  end
endmodule

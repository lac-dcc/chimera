// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module single_to_int_tb;
  reg clk;
  reg [31:0] single_to_int_a;
  wire [31:0] single_to_int_z;
  integer single_to_int_a_file;
  integer single_to_int_z_file;
  integer single_to_int_a_count;
  integer single_to_int_z_count;

  single_to_int single_to_int1 (clk, single_to_int_a, single_to_int_z);
  initial
  begin
    single_to_int_z_file = $fopen("stim/single_to_int_z");
    single_to_int_a_file = $fopen("stim/single_to_int_a", "r");
  end

  initial
  begin
    #50030 $finish;
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
    $fdisplay(single_to_int_z_file, "%d", single_to_int_z);
    #0 single_to_int_a_count = $fscanf(single_to_int_a_file, "%d\n", single_to_int_a);
  end
endmodule

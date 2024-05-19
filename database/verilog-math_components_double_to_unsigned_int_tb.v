// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module double_to_unsigned_int_tb;
  reg clk;
  reg [63:0] double_to_unsigned_int_a;
  wire [63:0] double_to_unsigned_int_z;
  integer double_to_unsigned_int_a_file;
  integer double_to_unsigned_int_z_file;
  integer double_to_unsigned_int_a_count;
  integer double_to_unsigned_int_z_count;

  double_to_unsigned_int double_to_unsigned_int1 (clk, double_to_unsigned_int_a, double_to_unsigned_int_z);
  initial
  begin
    double_to_unsigned_int_z_file = $fopen("stim/double_to_unsigned_int_z");
    double_to_unsigned_int_a_file = $fopen("stim/double_to_unsigned_int_a", "r");
  end

  initial
  begin
    #10020 $finish;
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
    $fdisplay(double_to_unsigned_int_z_file, "%d", double_to_unsigned_int_z);
    #0 double_to_unsigned_int_a_count = $fscanf(double_to_unsigned_int_a_file, "%d\n", double_to_unsigned_int_a);
  end
endmodule

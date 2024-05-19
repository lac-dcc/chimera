// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module eq_tb;
  reg clk;
  reg [31:0] eq_a;
  reg [31:0] eq_b;
  wire [0:0] eq_z;
  integer eq_a_file;
  integer eq_b_file;
  integer eq_z_file;
  integer eq_a_count;
  integer eq_b_count;
  integer eq_z_count;

  eq eq1 (clk, eq_a, eq_b, eq_z);
  initial
  begin
    eq_z_file = $fopen("stim/eq_z");
    eq_a_file = $fopen("stim/eq_a", "r");
    eq_b_file = $fopen("stim/eq_b", "r");
  end

  initial
  begin
    #50010 $finish;
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
    $fdisplay(eq_z_file, "%d", eq_z);
    #0 eq_a_count = $fscanf(eq_a_file, "%d\n", eq_a);
    #0 eq_b_count = $fscanf(eq_b_file, "%d\n", eq_b);
  end
endmodule

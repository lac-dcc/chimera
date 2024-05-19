// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module lt_tb;
  reg clk;
  reg [31:0] lt_a;
  reg [31:0] lt_b;
  wire [0:0] lt_z;
  integer lt_a_file;
  integer lt_b_file;
  integer lt_z_file;
  integer lt_a_count;
  integer lt_b_count;
  integer lt_z_count;

  lt lt1 (clk, lt_a, lt_b, lt_z);
  initial
  begin
    lt_z_file = $fopen("stim/lt_z");
    lt_a_file = $fopen("stim/lt_a", "r");
    lt_b_file = $fopen("stim/lt_b", "r");
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
    $fdisplay(lt_z_file, "%d", lt_z);
    #0 lt_a_count = $fscanf(lt_a_file, "%d\n", lt_a);
    #0 lt_b_count = $fscanf(lt_b_file, "%d\n", lt_b);
  end
endmodule

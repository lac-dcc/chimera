// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module div_tb;
  reg clk;
  reg [31:0] div_a;
  reg [31:0] div_b;
  wire [31:0] div_z;
  integer div_a_file;
  integer div_b_file;
  integer div_z_file;
  integer div_a_count;
  integer div_b_count;
  integer div_z_count;

  div div1 (clk, div_a, div_b, div_z);
  initial
  begin
    div_z_file = $fopen("stim/div_z");
    div_a_file = $fopen("stim/div_a", "r");
    div_b_file = $fopen("stim/div_b", "r");
  end

  initial
  begin
    #50370 $finish;
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
    $fdisplay(div_z_file, "%d", div_z);
    #0 div_a_count = $fscanf(div_a_file, "%d\n", div_a);
    #0 div_b_count = $fscanf(div_b_file, "%d\n", div_b);
  end
endmodule

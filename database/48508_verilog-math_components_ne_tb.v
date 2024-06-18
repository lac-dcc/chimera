// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module ne_tb;
  reg clk;
  reg [31:0] ne_a;
  reg [31:0] ne_b;
  wire [0:0] ne_z;
  integer ne_a_file;
  integer ne_b_file;
  integer ne_z_file;
  integer ne_a_count;
  integer ne_b_count;
  integer ne_z_count;

  ne ne1 (clk, ne_a, ne_b, ne_z);
  initial
  begin
    ne_z_file = $fopen("stim/ne_z");
    ne_a_file = $fopen("stim/ne_a", "r");
    ne_b_file = $fopen("stim/ne_b", "r");
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
    $fdisplay(ne_z_file, "%d", ne_z);
    #0 ne_a_count = $fscanf(ne_a_file, "%d\n", ne_a);
    #0 ne_b_count = $fscanf(ne_b_file, "%d\n", ne_b);
  end
endmodule

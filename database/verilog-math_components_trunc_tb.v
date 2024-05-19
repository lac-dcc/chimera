// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module trunc_tb;
  reg clk;
  reg [31:0] trunc_a;
  wire [31:0] trunc_z;
  integer trunc_a_file;
  integer trunc_z_file;
  integer trunc_a_count;
  integer trunc_z_count;

  trunc trunc1 (clk, trunc_a, trunc_z);
  initial
  begin
    trunc_z_file = $fopen("stim/trunc_z");
    trunc_a_file = $fopen("stim/trunc_a", "r");
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
    $fdisplay(trunc_z_file, "%d", trunc_z);
    #0 trunc_a_count = $fscanf(trunc_a_file, "%d\n", trunc_a);
  end
endmodule

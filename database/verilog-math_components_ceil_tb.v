// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module ceil_tb;
  reg clk;
  reg [31:0] ceil_a;
  wire [31:0] ceil_z;
  integer ceil_a_file;
  integer ceil_z_file;
  integer ceil_a_count;
  integer ceil_z_count;

  ceil ceil1 (clk, ceil_a, ceil_z);
  initial
  begin
    ceil_z_file = $fopen("stim/ceil_z");
    ceil_a_file = $fopen("stim/ceil_a", "r");
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
    $fdisplay(ceil_z_file, "%d", ceil_z);
    #0 ceil_a_count = $fscanf(ceil_a_file, "%d\n", ceil_a);
  end
endmodule

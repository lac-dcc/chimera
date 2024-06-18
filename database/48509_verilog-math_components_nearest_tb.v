// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module nearest_tb;
  reg clk;
  reg [31:0] nearest_a;
  wire [31:0] nearest_z;
  integer nearest_a_file;
  integer nearest_z_file;
  integer nearest_a_count;
  integer nearest_z_count;

  nearest nearest1 (clk, nearest_a, nearest_z);
  initial
  begin
    nearest_z_file = $fopen("stim/nearest_z");
    nearest_a_file = $fopen("stim/nearest_a", "r");
  end

  initial
  begin
    #4480 $finish;
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
    $fdisplay(nearest_z_file, "%d", nearest_z);
    #0 nearest_a_count = $fscanf(nearest_a_file, "%d\n", nearest_a);
  end
endmodule

// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module ge_tb;
  reg clk;
  reg [31:0] ge_a;
  reg [31:0] ge_b;
  wire [0:0] ge_z;
  integer ge_a_file;
  integer ge_b_file;
  integer ge_z_file;
  integer ge_a_count;
  integer ge_b_count;
  integer ge_z_count;

  ge ge1 (clk, ge_a, ge_b, ge_z);
  initial
  begin
    ge_z_file = $fopen("stim/ge_z");
    ge_a_file = $fopen("stim/ge_a", "r");
    ge_b_file = $fopen("stim/ge_b", "r");
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
    $fdisplay(ge_z_file, "%d", ge_z);
    #0 ge_a_count = $fscanf(ge_a_file, "%d\n", ge_a);
    #0 ge_b_count = $fscanf(ge_b_file, "%d\n", ge_b);
  end
endmodule

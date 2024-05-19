// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module add_tb;
  reg clk;
  reg [31:0] add_a;
  reg [31:0] add_b;
  wire [31:0] add_z;
  integer add_a_file;
  integer add_b_file;
  integer add_z_file;
  integer add_a_count;
  integer add_b_count;
  integer add_z_count;

  add add1 (clk, add_a, add_b, add_z);
  initial
  begin
    add_z_file = $fopen("stim/add_z");
    add_a_file = $fopen("stim/add_a", "r");
    add_b_file = $fopen("stim/add_b", "r");
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
    $fdisplay(add_z_file, "%d", add_z);
    #0 add_a_count = $fscanf(add_a_file, "%d\n", add_a);
    #0 add_b_count = $fscanf(add_b_file, "%d\n", add_b);
  end
endmodule

// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module unsigned_int_to_double_tb;
  reg clk;
  reg [63:0] unsigned_int_to_double_a;
  wire [63:0] unsigned_int_to_double_z;
  integer unsigned_int_to_double_a_file;
  integer unsigned_int_to_double_z_file;
  integer unsigned_int_to_double_a_count;
  integer unsigned_int_to_double_z_count;

  unsigned_int_to_double unsigned_int_to_double1 (clk, unsigned_int_to_double_a, unsigned_int_to_double_z);
  initial
  begin
    unsigned_int_to_double_z_file = $fopen("stim/unsigned_int_to_double_z");
    unsigned_int_to_double_a_file = $fopen("stim/unsigned_int_to_double_a", "r");
  end

  initial
  begin
    #10060 $finish;
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
    $fdisplay(unsigned_int_to_double_z_file, "%d", unsigned_int_to_double_z);
    #0 unsigned_int_to_double_a_count = $fscanf(unsigned_int_to_double_a_file, "%d\n", unsigned_int_to_double_a);
  end
endmodule

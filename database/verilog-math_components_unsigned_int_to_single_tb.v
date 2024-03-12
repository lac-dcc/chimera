module unsigned_int_to_single_tb;
  reg clk;
  reg [31:0] unsigned_int_to_single_a;
  wire [31:0] unsigned_int_to_single_z;
  integer unsigned_int_to_single_a_file;
  integer unsigned_int_to_single_z_file;
  integer unsigned_int_to_single_a_count;
  integer unsigned_int_to_single_z_count;

  unsigned_int_to_single unsigned_int_to_single1 (clk, unsigned_int_to_single_a, unsigned_int_to_single_z);
  initial
  begin
    unsigned_int_to_single_z_file = $fopen("stim/unsigned_int_to_single_z");
    unsigned_int_to_single_a_file = $fopen("stim/unsigned_int_to_single_a", "r");
  end

  initial
  begin
    #50060 $finish;
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
    $fdisplay(unsigned_int_to_single_z_file, "%d", unsigned_int_to_single_z);
    #0 unsigned_int_to_single_a_count = $fscanf(unsigned_int_to_single_a_file, "%d\n", unsigned_int_to_single_a);
  end
endmodule

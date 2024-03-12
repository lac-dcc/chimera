module int_to_single_tb;
  reg clk;
  reg [31:0] int_to_single_a;
  wire [31:0] int_to_single_z;
  integer int_to_single_a_file;
  integer int_to_single_z_file;
  integer int_to_single_a_count;
  integer int_to_single_z_count;

  int_to_single int_to_single1 (clk, int_to_single_a, int_to_single_z);
  initial
  begin
    int_to_single_z_file = $fopen("stim/int_to_single_z");
    int_to_single_a_file = $fopen("stim/int_to_single_a", "r");
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
    $fdisplay(int_to_single_z_file, "%d", int_to_single_z);
    #0 int_to_single_a_count = $fscanf(int_to_single_a_file, "%d\n", int_to_single_a);
  end
endmodule

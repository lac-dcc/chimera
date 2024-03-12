module int_to_double_tb;
  reg clk;
  reg [63:0] int_to_double_a;
  wire [63:0] int_to_double_z;
  integer int_to_double_a_file;
  integer int_to_double_z_file;
  integer int_to_double_a_count;
  integer int_to_double_z_count;

  int_to_double int_to_double1 (clk, int_to_double_a, int_to_double_z);
  initial
  begin
    int_to_double_z_file = $fopen("stim/int_to_double_z");
    int_to_double_a_file = $fopen("stim/int_to_double_a", "r");
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
    $fdisplay(int_to_double_z_file, "%d", int_to_double_z);
    #0 int_to_double_a_count = $fscanf(int_to_double_a_file, "%d\n", int_to_double_a);
  end
endmodule

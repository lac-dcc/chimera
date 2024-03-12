module double_trunc_tb;
  reg clk;
  reg [63:0] double_trunc_a;
  wire [63:0] double_trunc_z;
  integer double_trunc_a_file;
  integer double_trunc_z_file;
  integer double_trunc_a_count;
  integer double_trunc_z_count;

  double_trunc double_trunc1 (clk, double_trunc_a, double_trunc_z);
  initial
  begin
    double_trunc_z_file = $fopen("stim/double_trunc_z");
    double_trunc_a_file = $fopen("stim/double_trunc_a", "r");
  end

  initial
  begin
    #10010 $finish;
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
    $fdisplay(double_trunc_z_file, "%d", double_trunc_z);
    #0 double_trunc_a_count = $fscanf(double_trunc_a_file, "%d\n", double_trunc_a);
  end
endmodule

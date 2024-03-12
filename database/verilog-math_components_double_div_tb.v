module double_div_tb;
  reg clk;
  reg [63:0] double_div_a;
  reg [63:0] double_div_b;
  wire [63:0] double_div_z;
  integer double_div_a_file;
  integer double_div_b_file;
  integer double_div_z_file;
  integer double_div_a_count;
  integer double_div_b_count;
  integer double_div_z_count;

  double_div double_div1 (clk, double_div_a, double_div_b, double_div_z);
  initial
  begin
    double_div_z_file = $fopen("stim/double_div_z");
    double_div_a_file = $fopen("stim/double_div_a", "r");
    double_div_b_file = $fopen("stim/double_div_b", "r");
  end

  initial
  begin
    #10660 $finish;
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
    $fdisplay(double_div_z_file, "%d", double_div_z);
    #0 double_div_a_count = $fscanf(double_div_a_file, "%d\n", double_div_a);
    #0 double_div_b_count = $fscanf(double_div_b_file, "%d\n", double_div_b);
  end
endmodule

module le_tb;
  reg clk;
  reg [31:0] le_a;
  reg [31:0] le_b;
  wire [0:0] le_z;
  integer le_a_file;
  integer le_b_file;
  integer le_z_file;
  integer le_a_count;
  integer le_b_count;
  integer le_z_count;

  le le1 (clk, le_a, le_b, le_z);
  initial
  begin
    le_z_file = $fopen("stim/le_z");
    le_a_file = $fopen("stim/le_a", "r");
    le_b_file = $fopen("stim/le_b", "r");
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
    $fdisplay(le_z_file, "%d", le_z);
    #0 le_a_count = $fscanf(le_a_file, "%d\n", le_a);
    #0 le_b_count = $fscanf(le_b_file, "%d\n", le_b);
  end
endmodule

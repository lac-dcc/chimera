module abs_tb;
  reg clk;
  reg [31:0] abs_a;
  wire [31:0] abs_z;
  integer abs_a_file;
  integer abs_z_file;
  integer abs_a_count;
  integer abs_z_count;

  abs abs1 (clk, abs_a, abs_z);
  initial
  begin
    abs_z_file = $fopen("stim/abs_z");
    abs_a_file = $fopen("stim/abs_a", "r");
  end

  initial
  begin
    #50010 $finish;
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
    $fdisplay(abs_z_file, "%d", abs_z);
    #0 abs_a_count = $fscanf(abs_a_file, "%d\n", abs_a);
  end
endmodule

// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module testbench_mux_16x1;

reg [15:0] data;
reg [3:0] sel;
wire out;

mux_16x1 uut (
  .data(data),
  .sel(sel),
  .out(out)
);

initial begin
  $dumpfile("16xu8x1.vcd");
  $dumpvars(0,testbench_mux_16x1);

  data = 16'b1111111111111110;
  sel = 4'b0000;
  #80 $display("Output: %b", out);

  data = 16'b1011111111111111;
  sel = 4'b0001;
  #40 $display("Output: %b", out); 
 

  end
endmodule
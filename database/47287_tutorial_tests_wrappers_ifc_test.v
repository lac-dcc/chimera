// This program was cloned from: https://github.com/learn-cocotb/tutorial
// License: BSD 2-Clause "Simplified" License

module ifc_test(CLK,
	   RST_N,

	   a_data,
	   a_en,
	   a_rdy,

	   b_data,
	   b_en,
	   b_rdy,

	   y_en,
	   y_data,
	   y_rdy);
  output reg  CLK;
  input  RST_N;

  // action method a
  input  a_data;
  input  a_en;
  output a_rdy;

  // action method b
  input  b_data;
  input  b_en;
  output b_rdy;

  // actionvalue method y
  input  y_en;
  output y_data;
  output y_rdy;
  ifc_or dut(
	  .CLK(CLK),
	  .RST_N(RST_N),
	  .a_data(a_data),
	  .a_en(a_en),
	  .a_rdy(a_rdy),
	  .b_data(b_data),
	  .b_en(b_en),
	  .b_rdy(b_rdy),
	  .y_en(y_en),
	  .y_data(y_data),
	  .y_rdy(y_rdy)
  );

  initial begin
	  $dumpfile("ifc.vcd");
	  $dumpvars;
	  CLK=0;
	  forever begin
		  #5 CLK=~CLK;
	  end
  end
  endmodule

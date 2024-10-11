// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_mux_16x1;

  reg [15:0] data_inputs;
  reg [3:0] select_lines;
  wire mux_output;

  mux_16x1 uut (
    .data_inputs(data_inputs),
    .select_lines(select_lines),
    .mux_output(mux_output)
  );

  initial begin
    $monitor("Time=%0t, Select=%b, Data=%b, Output=%b", $time, select_lines, data_inputs, mux_output);

    data_inputs = 16'b1010101010101010;
    select_lines = 4'b0000;
    #10;

    data_inputs = 16'b1100110011001100;
    select_lines = 4'b0001;
    #10;
    $dumpfile("mux.vcd");
  	$dumpvars(0);
	$finish;
  end

endmodule


// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

module pckthandler_fsm_tb;
	reg clk, reset;
	reg [15:0] data_stream;
	reg [23:0] ph_stream;
	reg ph_select, valid_stream, ecc_error;

	wire [15:0] out_stream;
	wire frame_active, frame_valid;

	integer fd, status;

	reg [15:0] out_exp;
	reg fr_active_exp, fr_valid_exp;

	pckthandler_fsm DUT(clk, reset, data_stream, ph_stream, ph_select, valid_stream,
		ecc_error, out_stream, frame_active, frame_valid);

	// clock & reset
	initial begin
		clk = 0; reset =1;
		repeat(4) #10 clk=~clk;
		reset = 0;
		forever #10 clk=~clk;
	end

	// test vector files
	initial begin
		fd = $fopen("pckthandler_fsm_testvec.txt", "r");
	end

	// data provider
	initial begin
		data_stream = 0; ph_stream= 0; ph_select = 0; valid_stream=0; ecc_error=0;
		@(negedge reset);
		while(!$feof(fd)) begin
			status = $fscanf(fd, "%h, %h, %h, %h, %h, %h, %h\n", data_stream, ph_stream, valid_stream, ph_select,
				out_exp, fr_active_exp, fr_valid_exp);
			@(posedge clk);
			#1 $display("out=%h, out_exp=%h, fr_active=%h, fr_active_exp=%h, fr_valid=%h, fr_valid_exp=%h",
				out_stream, out_exp, frame_active, fr_active_exp, frame_valid, fr_valid_exp);
		end
		repeat(20) @(posedge clk);
		$fclose(fd);
		$finish;
	end
endmodule
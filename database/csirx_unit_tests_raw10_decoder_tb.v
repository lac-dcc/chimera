// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

module raw10_decoder_tb;
	reg clk, reset, frame_active, frame_valid;
	reg [15:0] din;

	wire [63:0] dout;
	wire valid;

	reg [63:0] dout_exp;
	reg valid_exp;

	integer fd, status;	
	reg [128*8-1:0] vecstr; // Line of file for input vector

	raw10_decoder DUT(clk, reset, din, frame_active, frame_valid, dout, valid);

	// clock and reset
	initial begin
		clk = 0; reset = 1;
		repeat(4) #10 clk=~clk;
		reset = 0;
		forever #10 clk=~clk;
	end

	// files
	initial begin
		fd = $fopen("raw10_decoder_testvec.txt", "r");
	end


	// data provider
	initial begin
		din = 0; frame_valid = 0; frame_active = 0;
		@(negedge reset);
		while(!$feof(fd)) begin
			status = $fgets(vecstr, fd);
			if($sscanf(vecstr, "%h, %h, %h, %h, %h\n", din, frame_active, frame_valid, dout_exp, valid_exp) == 5) begin
				@(posedge clk);
				#1 $display("din=%h, fr_active=%b, fr_valid=%b, dout=%h, dout_exp=%h, valid=%b, valid_exp=%b",
					din, frame_active, frame_valid, dout, dout_exp, valid, valid_exp);
			end			
		end
		@(posedge clk);
		$fclose(fd);
		$finish;
	end
endmodule

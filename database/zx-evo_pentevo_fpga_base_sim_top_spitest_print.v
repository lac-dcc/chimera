// prints data output through SDcard spi iface
//

`ifdef SPITEST
module spitest_print(

	input  wire sdclk,
	input  wire sdcs_n,
	input  wire sddo,
	output wire sddi
);


	assign sddi = 1'b1;




	reg [7:0] txt_buffer [0:255];

	reg [7:0] shift_in;

	integer counter;
	integer pointer;
	integer i;


	initial
	begin
		counter = 0;
		pointer = 0;
	end



	always @(posedge sdclk)
	if( !sdcs_n )
	begin
		shift_in = { shift_in[6:0], sddo };
		
		counter = counter + 1;

		if( counter >= 8 )
		begin
			counter = 0;

			txt_buffer[pointer] = shift_in;
			pointer = pointer + 1;

			if( shift_in == 8'd10 )
			begin
				$write("received string: <");

				for(i=0;i<(pointer-1);i=i+1)
					$write("%s",txt_buffer[i]);

				$display(">");

				pointer = 0;
			end
		end

	end





endmodule
`endif


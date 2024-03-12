// spitest ROM loader
//

`ifdef SPITEST
module spitest_rom
(
	input  wire [18:0] in_addr,

	output reg  [ 7:0] out_word
);

	integer fd;


	reg [7:0] mem [0:524287];



	initial
	begin
		// init rom
		integer i;
		for(i=0;i<524288;i=i+1)
			mem[i] = 8'hFF;
		
		// load file
		fd = $fopen("spitest.bin","rb");

		if( 37!=$fread(mem,fd,524288-16384) )
		begin
			$display("Couldn't load spitest.bin!\n");
			$stop;
		end

		$fclose(fd);
	end



	always @*
		out_word = mem[in_addr];


endmodule
`endif


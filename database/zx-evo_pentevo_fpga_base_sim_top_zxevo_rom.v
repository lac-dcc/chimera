// ROM loader
//

module bin2v
(
	input  wire [18:0] in_addr,

	output reg  [ 7:0] out_word
);

	integer fd;


	reg [7:0] mem [0:524287];



	// load file
	initial
	begin
		fd = $fopen("zxevo.rom","rb");

		if( 524288!=$fread(mem,fd) )
		begin
			$display("Couldn't load zxevo ROM!\n");
			$stop;
		end

		$fclose(fd);
	end



	always @*
		out_word = mem[in_addr];


endmodule


// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

/* ECC check block (combinational block): validates the packet header info based on received ECC
 * Gedeon Nyengele <nyengele@stanford.edu>
 * 08 January 2018
 */

/*
 * @param PH_in input packet header (input)
 * @param PH_out possibly corrected PH without the ECC field (output)
 * @param no_error signals whether the PH has no errors (output)
 * @param corrected_error signals whether a single bit error was corrected (output)
 * @param error signals whether the PH has an error that cannot be corrected (output)
 */

module ecc_block(PH_in, PH_out, no_error, corrected_error, error);
	
	parameter PH_SIZE	= 32;
	parameter ECC_SIZE	= 8;

	input [(PH_SIZE-1):0] PH_in;
	output reg [(PH_SIZE-ECC_SIZE-1):0] PH_out;
	output reg no_error, corrected_error, error;

	wire [(PH_SIZE-ECC_SIZE-1):0] data = PH_in[(PH_SIZE-ECC_SIZE-1):0];
	reg [(ECC_SIZE-1):0] calc_ecc;	
	reg [(ECC_SIZE-1):0] syndrome;

	always @(*) begin
		// compute ECC
		calc_ecc = {2'b00,
		(^ {data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[21], data[22], data[23]}),
		(^ {data[4], data[5], data[6], data[7], data[8], data[9], data[16], data[17], data[18], data[19], data[20], data[22], data[23]}),
		(^ {data[1], data[2], data[3], data[7], data[8], data[9], data[13], data[14], data[15], data[19], data[20], data[21], data[23]}),
		(^ {data[0], data[2], data[3], data[5], data[6], data[9], data[11], data[12], data[15], data[18], data[20], data[21], data[22]}),
		(^ {data[0], data[1], data[3], data[4], data[6], data[8], data[10], data[12], data[14], data[17], data[20], data[21], data[22], data[23]}),
		(^ {data[0], data[1], data[2], data[4], data[5], data[7], data[10], data[11], data[13], data[16], data[20], data[21], data[22], data[23]})
		};

		// compute syndrome
		syndrome = PH_in[(PH_SIZE-1):(PH_SIZE-ECC_SIZE)] ^ calc_ecc;

		// correct data	
		case(syndrome)
			8'h07 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<0); end
			8'h0B : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<1); end
			8'h0D : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<2); end
			8'h0E : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<3); end
			8'h13 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<4); end
			8'h15 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<5); end
			8'h16 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<6); end
			8'h19 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<7); end
			8'h1A : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<8); end
			8'h1C : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<9); end
			8'h23 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<10); end
			8'h25 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<11); end
			8'h26 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<12); end
			8'h29 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<13); end
			8'h2A : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<14); end
			8'h2C : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<15); end
			8'h31 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<16); end
			8'h32 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<17); end
			8'h34 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<18); end
			8'h38 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<19); end
			8'h1F : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<20); end
			8'h2F : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<21); end
			8'h37 : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<22); end
			8'h3B : begin {no_error, corrected_error, error} = 3'b010; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0] ^ (1<<23); end
			8'h00 : begin {no_error, corrected_error, error} = 3'b100; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0]; end
			default: begin {no_error, corrected_error, error} = 3'b001; PH_out = PH_in[(PH_SIZE-ECC_SIZE-1):0]; end
		endcase
	end
endmodule
// PentEvo project (c) NedoPC 2008-2009
//
// state:          | RD1   | RD2   | RD3   | RD4   | WR1   | WR2   | WR3   | WR4   | RFSH1 | RFSH2 | RFSH3 | RFSH4 |
// clk: ___/```\___/```\___/```\___/```\___/```\___/```\___/```\___/```\___/```\___/```\___/```\___/```\___/```\___/```\__
//                 |      READ CYCLE               |      WRITE CYCLE              |      REFRESH CYCLE            |
// ras: ```````````````````\_______________/```````````````\_______________/```````````````````````\_______________/
// cas: ```````````````````````````\_______________/```````````````\_______________/```````\_______________/````````
// ra:                 |  row  | column|               |  row  | column|
// rd:     XXXXXXXXXXXXXXXXXXXXXXXXX<read data read|  write data write data write  |
// rwe:   `````````````````````````````````````````\_______________________________/````````````````````````````````
// req:  __/```````\_______________________/```````\________________________________________________________________
// rnw:  XX/```````\XXXXXXXXXXXXXXXXXXXXXXX\_______/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// cbeg: __________/```````\_______________________/```````\_______________________/```````\_______________________/
// rrdy: __________________________________/```````\________________________________________________________________
// addr: XX< addr  >XXXXXXXXXXXXXXXXXXXXXXX< addr  >XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//wrdata:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX< write >XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//rddata:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX< read  >XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//
// comments:
// rucas_n, rlcas_n, rras0_n, rras1_n, rwe_n could be made 'fast output register'
// ra[] couldn't be such in acex1k, because output registers could be all driven only by
//  single clock polarity (and here they are driven by negative edge, while CAS/RAS by positive)
//
// rst_n is resynced before use and acts as req inhibit. so while in reset, dram regenerates and isn't corrupted

module dram(

	input clk,
	input rst_n, // shut down accesses, remain refresh

	output reg [9:0] ra, // to the DRAM pins
	inout     [15:0] rd, // .              .
	                     // .              .
	output reg rwe_n,    // .              .
	output reg rucas_n,  // .              .
	output reg rlcas_n,  // .              .
	output reg rras0_n,  // .              .
	output reg rras1_n,  // to the DRAM pins

	input [20:0] addr, // access address of 16bit word: addr[0] selects between rras0_n and rras1_n,
	                   // addr[10:1] goes to row address, addr[20:11] goes to column address

	input req,         // request for read/write cycle
	input rnw,         // READ/nWRITE (=1: read, =0: write)

	output reg cbeg,       // cycle begin (any including refresh), can be used for synchronizing
	output reg rrdy,       // Read data ReaDY

	output reg [15:0] rddata, // data just read

	input  [15:0] wrdata, // data to be written
	input   [1:0] bsel    // positive byte select for write: bsel[0] is for wrdata[7:0], bsel[1] is for wrdata[15:8]


);

	reg [1:0] rst_sync;
	wire reset;
	wire int_req;

	reg [20:0] int_addr;
	reg [15:0] int_wrdata;
	reg  [1:0] int_bsel;



	reg [3:0] state;
	reg [3:0] next_state;

	localparam RD1   = 0;
	localparam RD2   = 1;
	localparam RD3   = 2;
	localparam RD4   = 3;
	localparam WR1   = 4;
	localparam WR2   = 5;
	localparam WR3   = 6;
	localparam WR4   = 7;
	localparam RFSH1 = 8;
	localparam RFSH2 = 9;
	localparam RFSH3 = 10;
	localparam RFSH4 = 11;


	always @(posedge clk)
	begin
		state <= next_state;
	end

	always @*
		case( state )

		RD1:
			next_state = RD2;
		RD2:
			next_state = RD3;
		RD3:
			next_state = RD4;
		RD4:
			if( !int_req )
				next_state = RFSH1;
			else
				next_state = rnw?RD1:WR1;

		WR1:
			next_state = WR2;
		WR2:
			next_state = WR3;
		WR3:
			next_state = WR4;
		WR4:
			if( !int_req )
				next_state = RFSH1;
			else
				next_state = rnw?RD1:WR1;


		RFSH1:
			next_state = RFSH2;
		RFSH2:
			next_state = RFSH3;
		RFSH3:
			next_state = RFSH4;
		RFSH4:
			if( !int_req )
				next_state = RFSH1;
			else
				next_state = rnw?RD1:WR1;

		endcase


	// incoming data latching
	always @(posedge clk)
	begin
		if( (state==RD4) || (state==WR4) || (state==RFSH4) )
		begin
			int_addr   <= addr;
			int_wrdata <= wrdata;
			int_bsel   <= bsel;
		end
	end

	// WE control
	always @(posedge clk)
	begin
		if( (next_state==WR1) || (next_state==WR2) || (next_state==WR3) || (next_state==WR4) )
			rwe_n <= 1'b0;
		else
			rwe_n <= 1'b1;
	end


	// RAS/CAS sequencing
	always @(posedge clk)
	begin
		case( state )
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		RD1:
		begin
			rras0_n <= int_addr[0];
			rras1_n <= ~int_addr[0];
		end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		RD2:
		begin
			rucas_n <= 1'b0;
			rlcas_n <= 1'b0;
		end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		RD3:
		begin
			rras0_n <= 1'b1;
			rras1_n <= 1'b1;
		end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		RD4:
		begin
			rras0_n <= 1'b1;
			rras1_n <= 1'b1;
			rucas_n <= 1'b1;
			rlcas_n <= 1'b1;
		end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		WR1:
		begin
			rras0_n <= int_addr[0];
			rras1_n <= ~int_addr[0];
		end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		WR2:
		begin
			rucas_n <= ~int_bsel[1];
			rlcas_n <= ~int_bsel[0];
		end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		WR3:
		begin
			rras0_n <= 1'b1;
			rras1_n <= 1'b1;
		end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		WR4:
		begin
			rras0_n <= 1'b1;
			rras1_n <= 1'b1;
			rucas_n <= 1'b1;
			rlcas_n <= 1'b1;
		end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		RFSH1:
		begin
			rucas_n <= 1'b0;
			rlcas_n <= 1'b0;
		end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		RFSH2:
		begin
			rras0_n <= 1'b0;
			rras1_n <= 1'b0;
		end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		RFSH3:
		begin
			rucas_n <= 1'b1;
			rlcas_n <= 1'b1;
		end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		RFSH4:
		begin
			rras0_n <= 1'b1;
			rras1_n <= 1'b1;
			rucas_n <= 1'b1;
			rlcas_n <= 1'b1;
		end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		endcase
	end


	// row/column address multiplexing
	always @(negedge clk)
	begin
		if( (state==RD1) || (state==WR1) )
			ra <= int_addr[10:1];
		else
			ra <= int_addr[20:11];
	end


	// DRAM data bus control
	assign rd = rwe_n ? 16'hZZZZ : int_wrdata;


	// read data from DRAM
	always @(posedge clk)
	begin
		if( state==RD3 )
			rddata <= rd;
	end


	// cbeg and rrdy control
	always @(posedge clk)
	begin
		if( (state==RD4) || (state==WR4) || (state==RFSH4) )
			cbeg <= 1'b1;
		else
			cbeg <= 1'b0;


            if( state==RD3 )
            	rrdy <= 1'b1;
            else
            	rrdy <= 1'b0;
	end


	// reset must be synchronous here in order to preserve
	// DRAM state while other modules reset, but we have only
	// asynchronous one globally. so we must re-synchronize it
	// and use it as 'DRAM operation enable'. when in reset,
	// controller ignores req signal and generates only refresh cycles
	always @(posedge clk)
		rst_sync[1:0] <= { rst_sync[0], ~rst_n };

	assign reset = rst_sync[1];

	assign int_req = req & (~reset);

endmodule

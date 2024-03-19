`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:  	   Chris Shucksmith
// Module Name:    serialMap
// Description:
//		Serially clocked, multi-byte key hash map, fixed length values.
//      Jenkins hasher used to drive a linear probe. Keys must be null
//      padded in store, eg. key-size of 6, a query of "VOD" would match
//      key "VOD___" (_ = \0)
// Usage:
//     Raise 'query' and present key serially on [key], byte at a time
//     lower 'query' after last byte of key.
//     Internal hash search is then performed, this takes at least:
//				2 cycles for hash computation
//				keylength reads from backing store
//				  (...repeated for each cache miss)
//     EITHER:
//        notfound is raised for 1 clock,   OR
//        found is raised and held high for the duration of clocking out the
//        data associated the with key
//
//    TableSize: [key + value] x 2^bitsFromHash
//		eg. 6 bytes keys, 2 bytes symbol index, 6-bit keys = 64 enties
//				RAM table = 64*8bytes = 512 bytes
//
//////////////////////////////////////////////////////////////////////////////////
module serialMap # (
	parameter pBytesKey = 8'd6,
	parameter pBytesValue = 8'd2,
	parameter pBitsFromHash = 6 )

	(	CLOCK, key, query, found, notfound, data );

	parameter  [3:0]  sIDLE    = 4'b000;
	parameter  [3:0]  sKEYRD   = 4'b001;
	parameter  [3:0]  sKHASH   = 4'b010;
	parameter  [3:0]  sTEST    = 4'b011;
	parameter  [3:0]  sCHKNEXT = 4'b100;
	parameter  [3:0]  sFOUND   = 4'b101;
	parameter  [3:0]  sMISSING = 4'b110;

	input CLOCK;
    input [7:0] key;
    input query;
    output found;
    output notfound;
    output [7:0] data;

	 reg [3:0] state = 0;

	 reg [7:0] mem [0:((pBytesKey+pBytesValue)*(1<<pBitsFromHash)) - 1];
	 reg [7:0] keycopy [0:pBytesKey];
	 reg [7:0] keycount;
	 wire hashcomplete;
	 reg [pBitsFromHash-1:0] pos = 0;
	 // abort probe conditions - null key or wrap around
	 reg posempty = 1;
	 reg [pBitsFromHash-1:0] base = 0;
	 wire [31:0] hash;

	 jenkins hasher (
		.CLOCK(CLOCK),
		.sample(query),
		.value(key),
		.hash(hash),
		.complete(hashcomplete)
	);


	// this could be bus conjunction if pBytesKey+pBytesValue is a power of two
	// 16 should be log2(pBytesKey+pBytesValue) to address within a table entry
	reg [7:0] chkchar = 0;
	// 32 should be log2(size(mem))
	wire [32:0] address = pos*(pBytesKey+pBytesValue) + chkchar;
	wire [7:0] memd = mem[address];
	wire keyCharNull = chkchar >= keycount;
	wire entryEnd = chkchar == pBytesKey+pBytesValue - 1;

	initial begin
		$readmemh("hash/symTable.list", mem);
	end

		always @(posedge CLOCK) begin
			case (state)
				sIDLE: begin	// waiting for first byte of query
						keycount <= query ? 1: 0;
						keycopy[keycount] <= key;
						state <= (query) ? sKEYRD : sIDLE;
					end
				sKEYRD: begin // reading bytes of key
						keycount <= (query) ? keycount+1: keycount;
						keycopy[keycount] <= key;
						state <= (query) ? sKEYRD : sKHASH;
					end
				sKHASH: begin // key loaded
						// wait for hasher to complete
						state <= (hashcomplete) ? sTEST: sKHASH;
						pos <= hash[pBitsFromHash-1:0];
						base <= hash[pBitsFromHash-1:0];
						chkchar <= 0;
						posempty <= 1;
					end
				sTEST: begin  // lookup
						// progressivly check characters against key
						chkchar <= chkchar + 1;
						posempty <= posempty && (mem[address] == 8'b0);
						if (keycopy[chkchar] == memd || (keyCharNull && memd == 8'b0)) begin
							state <= (chkchar == pBytesKey-1) ? sFOUND : sTEST;
						end else begin
							state <= sCHKNEXT;
						end
					end
				sCHKNEXT: begin
						chkchar <= 0;
						posempty <= 1;
						pos <= pos + 1;	// linear probe, overflow wrap around
						state <= (pos + 1 == base || posempty) ? sMISSING : sTEST;	// dont visit same node twice, fail
					end
				sMISSING: begin
						// sit here for 1 cycle to hold error line
						state <= sIDLE;
					end
				sFOUND: begin
						// progressivly output data values - mem latched out on data
						// TODO: null terminated data? no -- binary values permitted
						chkchar <= entryEnd ? 0 : chkchar + 1;
						state <= entryEnd ? sIDLE : sFOUND;
					end
			endcase
		end

		assign notfound = (state == sMISSING);
		assign found = (state == sFOUND);
		assign data = (state == sFOUND) ? memd : 8'bz;
endmodule
